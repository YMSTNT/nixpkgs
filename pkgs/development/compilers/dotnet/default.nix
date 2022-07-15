/*
How to combine packages for use in development:
dotnetCombined = with dotnetCorePackages; combinePackages [ sdk_3_1 sdk_5_0 aspnetcore_5_0 ];

Hashes and urls below are retrieved from:
https://dotnet.microsoft.com/download/dotnet
*/
{ callPackage, icu70, icu }:
let
  buildDotnet = attrs: callPackage (import ./build-dotnet.nix attrs) {};
  buildAspNetCore = attrs: buildDotnet (attrs // { type = "aspnetcore"; });
  buildNetRuntime = attrs: buildDotnet (attrs // { type = "runtime"; });
  buildNetSdk = attrs: buildDotnet (attrs // { type = "sdk"; });
in
rec {
  combinePackages = attrs: callPackage (import ./combine-packages.nix attrs) {};

  # EOL
  sdk_2_1 = throw "Dotnet SDK 2.1 is EOL, please use 3.1 (LTS), 5.0 (Current) or 6.0 (LTS)";
  sdk_2_2 = throw "Dotnet SDK 2.2 is EOL, please use 3.1 (LTS), 5.0 (Current) or 6.0 (LTS)";
  sdk_3_0 = throw "Dotnet SDK 3.0 is EOL, please use 3.1 (LTS), 5.0 (Current) or 6.0 (LTS)";

  ##### Following attributes with urls and hashes should be auto-generated by print-hashes.sh #####

  # v3.1 (maintenance)
  aspnetcore_3_1 = buildAspNetCore {
    icu = icu70;
    version = "3.1.26";
    srcs = {
      x86_64-linux = {
        url     = "https://download.visualstudio.microsoft.com/download/pr/6f72adf7-0e78-48ea-85ef-e72a39a1f8a1/1ec0238c236c3757e5628563a329fdc4/aspnetcore-runtime-3.1.26-linux-x64.tar.gz";
        sha512  = "8bbf06012cdd2cff23c592e0d3c49d032d77add4dda8fba1d7ba73e6cc4ae97b1676908b14cdc7fc2fe723302e1efd27a44b48190a91d69c0e41bb5edb47501f";
      };
      aarch64-linux = {
        url     = "https://download.visualstudio.microsoft.com/download/pr/6b68a14a-b4dd-4a75-bb32-26c08d19190f/1d6b637e290775f668701f8f6092ab35/aspnetcore-runtime-3.1.26-linux-arm64.tar.gz";
        sha512  = "757ff6cbc31b1c8743077288d7fa621c73fa7f4d155d636ad100cda6e1f601e31d2f842d5cfef3dec5daa4c8c3efbcf76f02afd1c518cae7b67b2a46a9faab08";
      };
      x86_64-darwin = {
        url     = "https://download.visualstudio.microsoft.com/download/pr/33e8be5c-5e6a-4dc2-9aa8-846aaffa6897/fe9d96af1d75f8d5f4cba4bff95f2fae/aspnetcore-runtime-3.1.26-osx-x64.tar.gz";
        sha512  = "0657d8b11a58357f5374e5d8201b401e55f9f4710794be565f7b9022d10639c2e72aebc6b7433b34fd24a03e8e12541c998fad28b5263de4439b3d31a8252c4c";
      };
    };
  };

  runtime_3_1 = buildNetRuntime {
    icu = icu70;
    version = "3.1.26";
    srcs = {
      x86_64-linux = {
        url     = "https://download.visualstudio.microsoft.com/download/pr/a14c8e4d-a22b-47f8-953c-bb4337634513/58017d103d432f7106c44b0891936aba/dotnet-runtime-3.1.26-linux-x64.tar.gz";
        sha512  = "03676885ec4d1f5ba184678a6b774f8e385abfff800a6bcee6f85557b39e9cdde500be49b5d6c956fc95cdfb9f33d31e467548bb498a52bc4fd639b3cb87c8d0";
      };
      aarch64-linux = {
        url     = "https://download.visualstudio.microsoft.com/download/pr/cb0e8b4b-7b2b-40cc-b7a6-30f0d4fabe6c/f5cb06cbb1b1b5d198792333b3db235a/dotnet-runtime-3.1.26-linux-arm64.tar.gz";
        sha512  = "574409616f5cbef35a2bd6fd1a2f0bcb3bdaa81457aea3af5e0e237ba768ced5214c51a3045697fe7478e8211e2045fc2072e382d6f456509a8f2923e9b1fc26";
      };
      x86_64-darwin = {
        url     = "https://download.visualstudio.microsoft.com/download/pr/6bedea65-b104-45b8-abe9-36cefbeedadf/05f4e472ec2395dad7103fda9ed278b2/dotnet-runtime-3.1.26-osx-x64.tar.gz";
        sha512  = "7957b5e697db7548964c399197ae8e61cc31f15374df384b6db9b47472a7d6f1b5b3e256c191e203c4d18c18cc8bdb6c4a331c5875bd37bd6415f3c83b8062da";
      };
    };
  };

  sdk_3_1 = buildNetSdk {
    icu = icu70;
    version = "3.1.420";
    srcs = {
      x86_64-linux = {
        url     = "https://download.visualstudio.microsoft.com/download/pr/5424da8c-ce12-46de-a51a-8fa61aefdde6/52a9d6b5718ea40863db96901c780d4b/dotnet-sdk-3.1.420-linux-x64.tar.gz";
        sha512  = "b3bdd964182f9edc3c2976541e657fcc43b0eaf9bc97197597c7ecb8b784d79e3efb9e0405c84e1dcb434cf4cd38ddc4af628c5df486c3d7ae8a23e5254796e3";
      };
      aarch64-linux = {
        url     = "https://download.visualstudio.microsoft.com/download/pr/a84bf296-ee6e-4e66-9694-90d3da7af2b4/b00b2efe2432938e5a19c45d3759d80f/dotnet-sdk-3.1.420-linux-arm64.tar.gz";
        sha512  = "ac66b1544fe178153bb85c2e5be584464374ce4c036fc95720547c231c2730312018fbdfc735f9071579749415bc54e1f6b8f080cc2b08d5799a0da941e8a5f5";
      };
      x86_64-darwin = {
        url     = "https://download.visualstudio.microsoft.com/download/pr/bb0efe58-450c-4e28-81c1-4081acd6ffa4/1d0eaf8b624dff000c8b10ea0497e731/dotnet-sdk-3.1.420-osx-x64.tar.gz";
        sha512  = "370cba4685e07d1cdb5d7f9b754812b237802ace679c9b9985c6e5c4dc09f500580f1413679a288615079bd155b68b362adb00151b2b8f5ca7c3718ab9e16194";
      };
    };
  };

  # v5.0 (current)
  aspnetcore_5_0 = buildAspNetCore {
    inherit icu;
    version = "5.0.12";
    srcs = {
      x86_64-linux = {
        url     = "https://download.visualstudio.microsoft.com/download/pr/ad0a54ca-4b88-4762-a790-aebeaba6b9e7/0f796fb90696d078046d90d8a05c027e/aspnetcore-runtime-5.0.12-linux-x64.tar.gz";
        sha512  = "0529f23ffa651ac2c2807b70d6e5034f6ae4c88204afdaaa76965ef604d6533f9440d68d9f2cdd3a9f2ca37e9140e6c61a9f9207d430c71140094c7d5c33bf79";
      };
      aarch64-linux = {
        url     = "https://download.visualstudio.microsoft.com/download/pr/bfc8ae06-2830-4082-a09e-63b3c7134096/880a4712d4ba3491c88aa566553c4e8a/aspnetcore-runtime-5.0.12-linux-arm64.tar.gz";
        sha512  = "70570177896943613f0cddeb046ffccaafb1c8245c146383e45fbcfb27779c70dff1ab22c2b13a14bf096173c9279e0a386f61665106a3abb5f623b50281a652";
      };
      x86_64-darwin = {
        url     = "https://download.visualstudio.microsoft.com/download/pr/06d71ed5-0755-40d6-8b8e-14a24b8a9cb7/47a8b4deda0deecf3658716b642c69bf/aspnetcore-runtime-5.0.12-osx-x64.tar.gz";
        sha512  = "bd9e7dd7f48c220121dde85b3acc4ce7eb2a1944d472f9340276718ef72d033f05fd9a62ffb9de93b8e7633843e731ff1cb5e8c836315f7571f519fdb0a119e1";
      };
    };
  };

  runtime_5_0 = buildNetRuntime {
    inherit icu;
    version = "5.0.12";
    srcs = {
      x86_64-linux = {
        url     = "https://download.visualstudio.microsoft.com/download/pr/781b7ae6-166c-4114-97f8-926d2bf74d34/fe51479e3138d672c512ef0322be23d3/dotnet-runtime-5.0.12-linux-x64.tar.gz";
        sha512  = "32b5f86db3b1d4c21e3cf616d22f0e4a7374385dac0cf03cdebf3520dcf846460d9677ec1829a180920740a0237d64f6eaa2421d036a67f4fe9fb15d4f6b1db9";
      };
      aarch64-linux = {
        url     = "https://download.visualstudio.microsoft.com/download/pr/7c342ad2-2dae-471b-ae46-c0c820321c1f/a480ad8ca0bc826a48c9b1e56efd972b/dotnet-runtime-5.0.12-linux-arm64.tar.gz";
        sha512  = "a8089fad8d21a4b582aa6c3d7162d56a21fee697fd400f050a772f67c2ace5e4196d1c4261d3e861d6dc2e5439666f112c406104d6271e5ab60cda80ef2ffc64";
      };
      x86_64-darwin = {
        url     = "https://download.visualstudio.microsoft.com/download/pr/8f990fa6-6b13-40ad-95f6-383391ff3d91/7531048d16c01efdf3885da367aa8b89/dotnet-runtime-5.0.12-osx-x64.tar.gz";
        sha512  = "a3160eaec15d0e2b62a4a2cdbb6663ef2e817fd26a3a3b8b3d75c5e3538b2947ff66eaddafb39cc297b9f087794d5fbd5a0e097ec8522ab6fea562f230055264";
      };
    };
  };

  sdk_5_0 = buildNetSdk {
    inherit icu;
    version = "5.0.403";
    srcs = {
      x86_64-linux = {
        url     = "https://download.visualstudio.microsoft.com/download/pr/b77183fa-c045-4058-82c5-d37742ed5f2d/ddaccef3e448a6df348cae4d1d271339/dotnet-sdk-5.0.403-linux-x64.tar.gz";
        sha512  = "7ba5f7f898dba64ea7027dc66184d60ac5ac35fabe750bd509711628442e098413878789fad5766be163fd2867cf22ef482a951e187cf629bbc6f54dd9293a4a";
      };
      aarch64-linux = {
        url     = "https://download.visualstudio.microsoft.com/download/pr/91015c72-ce5a-4840-9e87-5bfa4bb80224/b39692ac418d790ff7a2e092eb07de98/dotnet-sdk-5.0.403-linux-arm64.tar.gz";
        sha512  = "6cc705fe45c0d8df6a493eb2923539ef5b62d048d5218859bf3af06fb3934c9c716c16f98ee1a28c818d77adff8430bf39a2ae54a59a1468b704b4ba192234ac";
      };
      x86_64-darwin = {
        url     = "https://download.visualstudio.microsoft.com/download/pr/5ccdb916-531f-4064-84e8-5475b273a4de/80dcfa0c2eb528f8b0e7c313ed36f4f1/dotnet-sdk-5.0.403-osx-x64.tar.gz";
        sha512  = "70beea069db182cca211cf04d7a80f3d6a3987d76cbd2bb60590ee76b93a4041b1b86ad91057cddbbaddd501c72327c1bc0a5fec630f38063f84bd60ba2b4792";
      };
    };
  };

  # v6.0 (lts)
  aspnetcore_6_0 = buildAspNetCore {
    inherit icu;
    version = "6.0.7";
    srcs = {
      x86_64-linux = {
        url     = "https://download.visualstudio.microsoft.com/download/pr/98271725-1784-407c-841a-64d87c674512/b433af33506c816e3b5838f5c65d990a/aspnetcore-runtime-6.0.7-linux-x64.tar.gz";
        sha512  = "d210e2afd009746d2c4d98c07077b89ce174f462c2bdaae9afea107a5b1c9c4ab63460ae3d9ae38c5388f591c0a95d8712359326013b23325b7be19b51835455";
      };
      aarch64-linux = {
        url     = "https://download.visualstudio.microsoft.com/download/pr/b79c5fa9-a08d-4534-9424-4bacfc3cdc3d/449179d6fe8cda05f52b7be0f6828eb0/aspnetcore-runtime-6.0.7-linux-arm64.tar.gz";
        sha512  = "0c7317d2170f2632afd7c7c3e5bd84075071802e901de1ed5e54178f8a56266fe0770ebd84502aff9384b06908d4d5bee9d464d215fb20d841de177174f55f93";
      };
      x86_64-darwin = {
        url     = "https://download.visualstudio.microsoft.com/download/pr/5b4d2b0e-607e-4f9a-944f-0acdefd828d9/79a0271038df505617ef800587a92858/aspnetcore-runtime-6.0.7-osx-x64.tar.gz";
        sha512  = "6c05250d2affb61a1f34ba297e3c9bd0ddc42d64b1580f5e8cfa218a079cc455aa183f683869ba52e7b9ce58fb223dff8ef9776d4b2e2421ed7e2058d4af0750";
      };
      aarch64-darwin = {
        url     = "https://download.visualstudio.microsoft.com/download/pr/3d952783-f61f-4399-841a-fa5b5aeffded/15580a465dec6a7c67107e3f96d6da13/aspnetcore-runtime-6.0.7-osx-arm64.tar.gz";
        sha512  = "4d9dccaeabc1490fb9261f0be0702c2f5b4e96b840edee94d50f9a4655aa4d85bcf5a16d21d43b0a543e5a90cc631510aba35000df465a4ffc6cca7de37907fc";
      };
    };
  };

  runtime_6_0 = buildNetRuntime {
    inherit icu;
    version = "6.0.7";
    srcs = {
      x86_64-linux = {
        url     = "https://download.visualstudio.microsoft.com/download/pr/bd828687-1706-4041-a804-5e93631fe256/d4ec75936459a7e8c772c929edcbfeda/dotnet-runtime-6.0.7-linux-x64.tar.gz";
        sha512  = "996bdaf33be0a9c0f1e2d309b997e3a84a31e28d2424853d7fb1600212f4ce600ebe1b9615de5e46c17652f08ad0d7ecd4b3619217c9624b875a26a553f370d8";
      };
      aarch64-linux = {
        url     = "https://download.visualstudio.microsoft.com/download/pr/f9706e92-c7a1-4dc8-806a-0e95827c5b02/23be52946e4e2425c798208c5f16bb64/dotnet-runtime-6.0.7-linux-arm64.tar.gz";
        sha512  = "a63e100fe80cb64febfd2920e4065b3cc99f759c3de0897928a42cf14fdc963df324bef1354a7734420078d16e52fd8257dd480da465d865c4349c29cab1ef91";
      };
      x86_64-darwin = {
        url     = "https://download.visualstudio.microsoft.com/download/pr/97def016-12c7-4e24-b924-772485a41faa/e96d9a0502492efa7de3897467f5972c/dotnet-runtime-6.0.7-osx-x64.tar.gz";
        sha512  = "9c53d16971f0366d6d69fbfe37e92eea806faa1c3502cc1050c0e6d2cf394cf886761146e344862a30d0cb131105f387c05d8ea207be8aa87c81cd4c8f962110";
      };
      aarch64-darwin = {
        url     = "https://download.visualstudio.microsoft.com/download/pr/044c6d0f-0ac2-450f-b621-637ca24ab2fb/5cd0c43804f3fde6d09cacbfd8525868/dotnet-runtime-6.0.7-osx-arm64.tar.gz";
        sha512  = "9f08a535921df7c1ce837ef27478f2381e8132a9ebfec7630465fb3243ef2ec9e982d008faec69e0899675dc3a50b379a96967d1eed3c04dada40cb211489127";
      };
    };
  };

  sdk_6_0 = buildNetSdk {
    inherit icu;
    version = "6.0.302";
    srcs = {
      x86_64-linux = {
        url     = "https://download.visualstudio.microsoft.com/download/pr/0e83f50a-0619-45e6-8f16-dc4f41d1bb16/e0de908b2f070ef9e7e3b6ddea9d268c/dotnet-sdk-6.0.302-linux-x64.tar.gz";
        sha512  = "ac1d124802ca035aa00806312460b371af8e3a55d85383ddd8bb66f427c4fabae75b8be23c45888344e13b283a4f9c7df228447c06d796a57ffa5bb21992e6a4";
      };
      aarch64-linux = {
        url     = "https://download.visualstudio.microsoft.com/download/pr/33389348-a7d7-41ae-850f-ec46d3ca9612/36bad11f948b05a4fa9faac93c35e574/dotnet-sdk-6.0.302-linux-arm64.tar.gz";
        sha512  = "26e98a63665d707b1a7729f1794077316f9927edd88d12d82d0357fe597096b0d89b64a085fcdf0cf49807a443bbfebb48e10ea91cea890846cf4308e67c4ea5";
      };
      x86_64-darwin = {
        url     = "https://download.visualstudio.microsoft.com/download/pr/60719796-b5c5-46dc-a26a-7e8126a292c8/a7b871d6c46136b61c30403d085ef97c/dotnet-sdk-6.0.302-osx-x64.tar.gz";
        sha512  = "003a06be76bf6228b4c033f34773039d57ebd485cf471a8117f5516f243a47a24d1b485ab9307becc1973107bb1d5b6c3028bbcbb217cbb42f5bee4c6c01c458";
      };
      aarch64-darwin = {
        url     = "https://download.visualstudio.microsoft.com/download/pr/01a17a2d-6b92-4521-97a2-ad7d845a8064/44aa4e10f71e70a38b5f6f59d211cbab/dotnet-sdk-6.0.302-osx-arm64.tar.gz";
        sha512  = "59caea897a56b785245dcd3a6082247aeb879c39ecfab16db60e9dc3db447ca4e3ebe68e992c0551af886cd81f6f0088cb1433f1be6df865afa357f90f37ccf6";
      };
    };
  };
}
