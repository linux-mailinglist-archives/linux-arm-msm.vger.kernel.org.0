Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C13E7B4244
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Sep 2023 18:42:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234559AbjI3QmE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 30 Sep 2023 12:42:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234558AbjI3QmE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 30 Sep 2023 12:42:04 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAC49DD
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 Sep 2023 09:41:58 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-5041bb9ce51so23419520e87.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 Sep 2023 09:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696092116; x=1696696916; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W7EPZlBOMsbq4YGcfpwHvS9ByO6rM41xNn9KYXEs2Ow=;
        b=NQWMwq2K8Bz3WiFaDgj85slAn9oI9odD7qXHzitUD07s2/zVZg511cyk7gNlPz6zgG
         lDSiKCOTi1/wfKmOym3u3OMzHN72awxdZi1R1DJuUogJ4aGmFKyhxoGpmmJz2zvw12SE
         6bFCLt2FSNNgVPAs6faURsQHUd0nGaS7R+/OAlyAjVAnGb0pI1n70uTD0uRhDXYBQUiI
         j2iUnhSYOqyarcQHE3uyE/YN0fwcGOm84s5xTa50hAO1rC+Dk0CILRuim9haZx4Mkw0A
         +MonYCfepN0PXHKlG8xExxotSQozDSl5oq1amMGfIvIo0ozYqvlzyBXF+gRJNyGYfeQV
         z8fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696092116; x=1696696916;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W7EPZlBOMsbq4YGcfpwHvS9ByO6rM41xNn9KYXEs2Ow=;
        b=RMoIzyaiNud5kpnjKZs2ADljTkEWSpOI7jv7regDRs3dzlp2tAcpVM6rjlUoI7ymEw
         C4T7Gndd98aV387Ja080gX0i2rmfhg8DdouxkihHuyTx5D1uFzibA5UWJXBLyjY5Iq0K
         odbhfHh0gxCbwRYDwJd9ZPqgoCuhTH++X5UEDAahrtp9v9KT/S4cw8qhD6+5AOWFnQIV
         FO+PHQtULWpq9NOnQFQn/VVTeQEz79yiPgASdXsds7fkGCOfCE0MAt+VvWdIYAYNnJtH
         0qHREE4zULPHGWTKPnFuC0VHV7FxWvAEEzZnL56YV7chO6Pk1TzZZOmam5g5X3V3SmSf
         AgIA==
X-Gm-Message-State: AOJu0YwZns7ikgQY5bDBH48575Oex2+Zy3KTtDOQ3eTuhjArWP/Xiixq
        34W2Kxsxh7ev//2h6gfWA8icaQ==
X-Google-Smtp-Source: AGHT+IFEC/nuQZ+D2t5J6Eo0CbVoFjxOP2ow+vS9DRkGbLdd7mRsSomgxpA1utXgV9UToqsKaHUdXA==
X-Received: by 2002:a05:6512:2389:b0:503:38fe:4590 with SMTP id c9-20020a056512238900b0050338fe4590mr7696587lfv.60.1696092116610;
        Sat, 30 Sep 2023 09:41:56 -0700 (PDT)
Received: from ?IPV6:2a00:f41:906b:9c4e:a878:12c9:4d61:a6f2? ([2a00:f41:906b:9c4e:a878:12c9:4d61:a6f2])
        by smtp.gmail.com with ESMTPSA id d16-20020ac25450000000b004fe5608e412sm3988898lfn.170.2023.09.30.09.41.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 Sep 2023 09:41:56 -0700 (PDT)
Message-ID: <449cd202-a7d8-4d20-3a41-17a3ba1355cb@linaro.org>
Date:   Sat, 30 Sep 2023 18:41:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 5/5] arm64: boot: dts: qcom: sc8280xp: Add in CAMCC for
 sc8280xp
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        andersson@kernel.org, agross@kernel.org, mturquette@baylibre.com,
        sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        jonathan@marek.ca, quic_tdas@quicinc.com,
        vladimir.zapolskiy@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230930134114.1816590-1-bryan.odonoghue@linaro.org>
 <20230930134114.1816590-6-bryan.odonoghue@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230930134114.1816590-6-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 9/30/23 15:41, Bryan O'Donoghue wrote:
> Add in CAMCC for sc8280xp. The sc8280xp Camera Clock Controller looks
> similar to most of the sdmX, smX and now scX controllers.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> index cad59af7ccef..ca43d038578b 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> @@ -8,6 +8,7 @@
>   #include <dt-bindings/clock/qcom,gcc-sc8280xp.h>
>   #include <dt-bindings/clock/qcom,gpucc-sc8280xp.h>
>   #include <dt-bindings/clock/qcom,rpmh.h>
> +#include <dt-bindings/clock/qcom,sc8280xp-camcc.h>
>   #include <dt-bindings/clock/qcom,sc8280xp-lpasscc.h>
>   #include <dt-bindings/interconnect/qcom,osm-l3.h>
>   #include <dt-bindings/interconnect/qcom,sc8280xp.h>
> @@ -3450,6 +3451,21 @@ usb_1_role_switch: endpoint {
>   			};
>   		};
>   
> +		camcc: clock-controller@ad00000 {
> +			compatible = "qcom,sc8280xp-camcc";
> +			reg = <0 0x0ad00000 0 0x20000>;
> +			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
> +				 <&rpmhcc RPMH_CXO_CLK>,
> +				 <&rpmhcc RPMH_CXO_CLK_A>,
> +				 <&sleep_clk>;
> +			clock-names = "iface", "bi_tcxo", "bi_tcxo_ao", "sleep_clk";
clock-names is now redundant :)

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
