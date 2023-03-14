Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC5A46BA1D1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Mar 2023 23:08:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230343AbjCNWI2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Mar 2023 18:08:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229473AbjCNWI1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Mar 2023 18:08:27 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 451F21F48A
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 15:08:22 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id m4so8915827lfj.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 15:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678831701;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fpQg81yl9mySeLnnw04fGp4olFldyfTH5VBKKs6Zih4=;
        b=Dy4ETYlRyvi3QRl3pV1d9C02qf8vHUJD1dT8tIrbC0WzeGy93RyBLGCr8Avx5Mhifn
         U+DgoTN9lP/8h2uH+LhlL20xkkESGeO6K4er3tNlbTH86L02R5ZW0OmhxLicsArk/rzB
         g/ZMQjlC+4QpwwJ5lbSsOxI0AJt/dDKlvSOfKTb6YtcmM6SnGchJiYQw3kTtd//y0mdw
         U1pQphrAPHTogtlUTXOvtojsRHbLi2SG0ayykxSTo7IHFt283run08UYwasl47bRJ7B1
         8M23H+eBcIbNkdZTNQyfJDoaZU3C0Ocd7GCWPkxfZ+uN/TD9APxjfyi/zuwHlEKOwZ0b
         Nd+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678831701;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fpQg81yl9mySeLnnw04fGp4olFldyfTH5VBKKs6Zih4=;
        b=nNXmVlA6WN4QNGs9ckptO5IUOeWcTaNJssJZELnCJ/bbGXIyhlbYk+37ujKPQi8/0E
         u7tf9I5yyqx159lcYnHx9PjbSGCF9SmQwcDTo3/Ef3A8YRRN5ZB2ofpGjMHPJkgwfiWX
         k+kWtUMyNV2bmW78evDasYjK95jSH2eDhM0/bWtUMW7lgaVzYm8V4PPZvxP/yGfzS9ow
         8Yw2MnZarzVHZMfZGlJqXYzvRvZ1gq/8zBSyqKno2ONfmgU03gWY9NcSDn08zXQpf06o
         wGtwKGMdePvTwARqVmMXd+jafS2DYoNaNUNFp1uKrb0wzmz7MfQI3GV6Aq/Ow5XpLp88
         EYWQ==
X-Gm-Message-State: AO0yUKUt99iJO5fvydQXf7yfYEgL0xHFqXdYGqvbCeEuwcd6LOnAmwEa
        YIBylbMLqZDr9i+sO0/hQDTaCg==
X-Google-Smtp-Source: AK7set8vWGX8EOeviKXO4a7BWI18uh6P2CeHD7ulV2zPVJ3wdp+z35onfAxJ36mJ0Oq+S136kCLsJA==
X-Received: by 2002:ac2:4a91:0:b0:4e8:3f36:414a with SMTP id l17-20020ac24a91000000b004e83f36414amr1335781lfp.55.1678831700894;
        Tue, 14 Mar 2023 15:08:20 -0700 (PDT)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
        by smtp.gmail.com with ESMTPSA id m4-20020a056512014400b004dc6070e121sm555029lfo.83.2023.03.14.15.08.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Mar 2023 15:08:20 -0700 (PDT)
Message-ID: <c8c586f5-ac65-5164-eea6-8a0a53e62e08@linaro.org>
Date:   Tue, 14 Mar 2023 23:08:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 2/5] arm64: dts: qcom: sm8350: switch to combo usb3/dp
 phy
Content-Language: en-US
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230206-topic-sm8450-upstream-dp-controller-v4-0-dca33f531e0d@linaro.org>
 <20230206-topic-sm8450-upstream-dp-controller-v4-2-dca33f531e0d@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230206-topic-sm8450-upstream-dp-controller-v4-2-dca33f531e0d@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_HTTP,RCVD_IN_SORBS_SOCKS,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 9.03.2023 10:19, Neil Armstrong wrote:
> The first QMP PHY is an USB3/DP combo phy, switch to the newly
> documented bindings and register the clocks to the GCC
> and DISPCC controllers.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> #SM8350-HDK
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sm8350.dtsi | 42 +++++++++++++-----------------------
>  1 file changed, 15 insertions(+), 27 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
> index 1c97e28da6ad..94e85313f15d 100644
> --- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
> @@ -13,6 +13,7 @@
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/interconnect/qcom,sm8350.h>
>  #include <dt-bindings/mailbox/qcom-ipcc.h>
> +#include <dt-bindings/phy/phy-qcom-qmp.h>
>  #include <dt-bindings/power/qcom-rpmpd.h>
>  #include <dt-bindings/soc/qcom,rpmh-rsc.h>
>  #include <dt-bindings/thermal/thermal.h>
> @@ -653,7 +654,7 @@ gcc: clock-controller@100000 {
>  				 <&ufs_mem_phy_lanes 0>,
>  				 <&ufs_mem_phy_lanes 1>,
>  				 <&ufs_mem_phy_lanes 2>,
> -				 <0>,
> +				 <&usb_1_qmpphy QMP_USB43DP_USB3_PIPE_CLK>,
>  				 <0>;
>  		};
>  
> @@ -2125,37 +2126,24 @@ usb_2_hsphy: phy@88e4000 {
>  			resets = <&gcc GCC_QUSB2PHY_SEC_BCR>;
>  		};
>  
> -		usb_1_qmpphy: phy-wrapper@88e9000 {
> -			compatible = "qcom,sm8350-qmp-usb3-phy";
> -			reg = <0 0x088e9000 0 0x200>,
> -			      <0 0x088e8000 0 0x20>;
> -			status = "disabled";
> -			#address-cells = <2>;
> -			#size-cells = <2>;
> -			ranges;
> +		usb_1_qmpphy: phy@88e9000 {
> +			compatible = "qcom,sm8350-qmp-usb3-dp-phy";
> +			reg = <0 0x088e8000 0 0x3000>;
>  
>  			clocks = <&gcc GCC_USB3_PRIM_PHY_AUX_CLK>,
>  				 <&rpmhcc RPMH_CXO_CLK>,
> -				 <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>;
> -			clock-names = "aux", "ref_clk_src", "com_aux";
> +				 <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>,
> +				 <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
> +			clock-names = "aux", "ref", "com_aux", "usb3_pipe";
>  
>  			resets = <&gcc GCC_USB3_DP_PHY_PRIM_BCR>,
>  				 <&gcc GCC_USB3_PHY_PRIM_BCR>;
>  			reset-names = "phy", "common";
>  
> -			usb_1_ssphy: phy@88e9200 {
> -				reg = <0 0x088e9200 0 0x200>,
> -				      <0 0x088e9400 0 0x200>,
> -				      <0 0x088e9c00 0 0x400>,
> -				      <0 0x088e9600 0 0x200>,
> -				      <0 0x088e9800 0 0x200>,
> -				      <0 0x088e9a00 0 0x100>;
> -				#phy-cells = <0>;
> -				#clock-cells = <0>;
> -				clocks = <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
> -				clock-names = "pipe0";
> -				clock-output-names = "usb3_phy_pipe_clk_src";
> -			};
> +			#clock-cells = <1>;
> +			#phy-cells = <1>;
> +
> +			status = "disabled";
>  		};
>  
>  		usb_2_qmpphy: phy-wrapper@88eb000 {
> @@ -2258,7 +2246,7 @@ usb_1_dwc3: usb@a600000 {
>  				iommus = <&apps_smmu 0x0 0x0>;
>  				snps,dis_u2_susphy_quirk;
>  				snps,dis_enblslpm_quirk;
> -				phys = <&usb_1_hsphy>, <&usb_1_ssphy>;
> +				phys = <&usb_1_hsphy>, <&usb_1_qmpphy QMP_USB43DP_USB3_PHY>;
>  				phy-names = "usb2-phy", "usb3-phy";
>  			};
>  		};
> @@ -2623,8 +2611,8 @@ dispcc: clock-controller@af00000 {
>  			clocks = <&rpmhcc RPMH_CXO_CLK>,
>  				 <&mdss_dsi0_phy 0>, <&mdss_dsi0_phy 1>,
>  				 <&mdss_dsi1_phy 0>, <&mdss_dsi1_phy 1>,
> -				 <0>,
> -				 <0>;
> +				 <&usb_1_qmpphy QMP_USB43DP_DP_LINK_CLK>,
> +				 <&usb_1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
>  			clock-names = "bi_tcxo",
>  				      "dsi0_phy_pll_out_byteclk",
>  				      "dsi0_phy_pll_out_dsiclk",
> 
