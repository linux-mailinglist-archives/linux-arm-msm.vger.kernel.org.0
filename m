Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6DD336C9D56
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Mar 2023 10:14:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232464AbjC0IOW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Mar 2023 04:14:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232906AbjC0IOL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Mar 2023 04:14:11 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC513524E
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Mar 2023 01:14:05 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id t17-20020a05600c451100b003edc906aeeaso4518085wmo.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Mar 2023 01:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679904844;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=w3xDgiQj65tQODsa0Qr/kRJotjgg38rVLNNMCJifFSY=;
        b=Ci+QWdtAXwcnAjI0he29/UEE3NX6ctnVXkdqW5ncwDd8dAArGAxP8f8haCBCFjZPbV
         1kAS5tnUApPP6tuKXM0sepV+dGBVlY3+460p3OBmsrY9ryGMS5MYpNxLMGSTvzl0hwKR
         9x6BIyeo6bOS3pf5j31VWgtkg79Zsk4OadVFHR47Jrvh0ERmvvQRduarXHZYqx2WfH1S
         bzCOSw/lNmV768cAjQIDDlV3ZTl48Ff+UO+TVHCbgGnSP6FY5mtuNOiUuBOMT7ghqTo0
         ZpjSMTXD4OtVohZTqgw4fV1C4M/lIvaC0WutBFfwLMh3XJaHJkPrteLaWBvFrnmy+xpM
         8YsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679904844;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w3xDgiQj65tQODsa0Qr/kRJotjgg38rVLNNMCJifFSY=;
        b=3sYlw1BV3Zn6bJiBaen1yCaeOmQjbOXOUv2wnJ5Wb88yq5rSZfwFfpCJiHdptV1TwE
         TkwgZSnAQTDuxel7PxG+Xux2jRSzF92XCUw7qFkDV6ihnMZeEwibiqaMaj8sif4jgisB
         OjaTWXchZz12PE6lnE/ovHuAd0/Pr7mV1d6fCARZAHR6pdmUf59/PTfZxYNQcROGTvKB
         g+vrssU8CEWVNJY5jD94F1fEp/AXsSPPqm2+SM1k0wUyQu4S+4C8/VGKrHXjRUI7wJBv
         9UY5ClIlTDFfQ2K+CAC8CIDg2y/qCDta6oJQGMvSXKe8pzWXxM7iWG5zMAv+gIaI/E8W
         bIeQ==
X-Gm-Message-State: AO0yUKXItK+/u/wjVAJKqM3IhDuEIMo4w8rroEwiagCoIIhYOU3zWvca
        e4kpgNhEiGiOYDmp1yyO/8B8Dg==
X-Google-Smtp-Source: AK7set8SzLz1C9BObn1xUDaaVBcPVAQrhD4E1movKquwUgFlXZL/ceNkdY73Z7M9MrGNNd7zaqTIog==
X-Received: by 2002:a7b:c419:0:b0:3ed:e447:1ed0 with SMTP id k25-20020a7bc419000000b003ede4471ed0mr8733488wmi.14.1679904844515;
        Mon, 27 Mar 2023 01:14:04 -0700 (PDT)
Received: from [192.168.7.111] (679773502.box.freepro.com. [212.114.21.58])
        by smtp.gmail.com with ESMTPSA id j36-20020a05600c1c2400b003ebf73acf9asm21392219wms.3.2023.03.27.01.14.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Mar 2023 01:14:04 -0700 (PDT)
Message-ID: <a45030f5-4553-2e72-1bc8-4317eeabc8e9@linaro.org>
Date:   Mon, 27 Mar 2023 10:14:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 8/9] arm64: dts: qcom: sm8150: switch USB+DP QMP PHY to
 new style of bindings
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Johan Hovold <johan+linaro@kernel.org>,
        devicetree@vger.kernel.org
References: <20230326005733.2166354-1-dmitry.baryshkov@linaro.org>
 <20230326005733.2166354-9-dmitry.baryshkov@linaro.org>
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230326005733.2166354-9-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 26/03/2023 01:57, Dmitry Baryshkov wrote:
> Change the USB QMP PHY to use newer style of QMP PHY bindings (single
> resource region, no per-PHY subnodes).
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sm8150.dtsi | 48 ++++++++--------------------
>   1 file changed, 14 insertions(+), 34 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> index a618218f7b68..4df9fef5c7b0 100644
> --- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> @@ -6,6 +6,7 @@
>   
>   #include <dt-bindings/dma/qcom-gpi.h>
>   #include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/phy/phy-qcom-qmp.h>
>   #include <dt-bindings/power/qcom-rpmpd.h>
>   #include <dt-bindings/soc/qcom,rpmh-rsc.h>
>   #include <dt-bindings/clock/qcom,rpmh.h>
> @@ -3391,47 +3392,26 @@ usb_2_hsphy: phy@88e3000 {
>   			resets = <&gcc GCC_QUSB2PHY_SEC_BCR>;
>   		};
>   
> -		usb_1_qmpphy: phy@88e9000 {
> +		usb_1_qmpphy: phy@88e8000 {
>   			compatible = "qcom,sm8150-qmp-usb3-dp-phy";
> -			reg = <0 0x088e9000 0 0x18c>,
> -			      <0 0x088e8000 0 0x38>,
> -			      <0 0x088ea000 0 0x40>;
> -			status = "disabled";
> -			#address-cells = <2>;
> -			#size-cells = <2>;
> -			ranges;
> +			reg = <0 0x088e8000 0 0x3000>;
> +
>   			clocks = <&gcc GCC_USB3_PRIM_PHY_AUX_CLK>,
> -				 <&rpmhcc RPMH_CXO_CLK>,
>   				 <&gcc GCC_USB3_PRIM_CLKREF_CLK>,
> -				 <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>;
> -			clock-names = "aux", "ref_clk_src", "ref", "com_aux";
> +				 <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>,
> +				 <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
> +			clock-names = "aux",
> +				      "ref",
> +				      "com_aux",
> +				      "usb3_pipe";
>   			resets = <&gcc GCC_USB3_DP_PHY_PRIM_BCR>,
>   				 <&gcc GCC_USB3_PHY_PRIM_BCR>;
>   			reset-names = "phy", "common";
>   
> -			usb_1_ssphy: phy@88e9200 {
> -				reg = <0 0x088e9200 0 0x200>,
> -				      <0 0x088e9400 0 0x200>,
> -				      <0 0x088e9c00 0 0x218>,
> -				      <0 0x088e9600 0 0x200>,
> -				      <0 0x088e9800 0 0x200>,
> -				      <0 0x088e9a00 0 0x100>;
> -				#clock-cells = <0>;
> -				#phy-cells = <0>;
> -				clocks = <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
> -				clock-names = "pipe0";
> -				clock-output-names = "usb3_phy_pipe_clk_src";
> -			};
> +			#clock-cells = <1>;
> +			#phy-cells = <1>;
>   
> -			usb_1_dpphy: phy@88ea200 {
> -				reg = <0 0x088ea200 0 0x200>,
> -				      <0 0x088ea400 0 0x200>,
> -				      <0 0x088eaa00 0 0x200>,
> -				      <0 0x088ea600 0 0x200>,
> -				      <0 0x088ea800 0 0x200>;
> -				#clock-cells = <1>;
> -				#phy-cells = <0>;
> -			};
> +			status = "disabled";
>   		};
>   
>   		usb_2_qmpphy: phy@88eb000 {
> @@ -3568,7 +3548,7 @@ usb_1_dwc3: usb@a600000 {
>   				iommus = <&apps_smmu 0x140 0>;
>   				snps,dis_u2_susphy_quirk;
>   				snps,dis_enblslpm_quirk;
> -				phys = <&usb_1_hsphy>, <&usb_1_ssphy>;
> +				phys = <&usb_1_hsphy>, <&usb_1_qmpphy QMP_USB43DP_USB3_PHY>;
>   				phy-names = "usb2-phy", "usb3-phy";
>   			};
>   		};

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
