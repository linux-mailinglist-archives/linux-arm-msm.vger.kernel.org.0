Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B058B6C9D35
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Mar 2023 10:10:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232672AbjC0IKE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Mar 2023 04:10:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233006AbjC0IJz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Mar 2023 04:09:55 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D0174C1F
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Mar 2023 01:09:53 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id l15-20020a05600c4f0f00b003ef6d684102so1392415wmq.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Mar 2023 01:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679904591;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ESC+h5a5L+0QAStOf0nm0G7C56coJgIIvWvF2IVlW7A=;
        b=RJCp8u0D7Y+BJT4d9sHYZqHYdgS6/bS9cqSDE1yqhvqXQBBfwcx+3a6mU6GEmWF2EK
         wYLsvirQfCWw/ufuni09wqNubJ0Bn+MVAJoxP+v3SWwTPG9J5/Pbg2kB9ts4dqmEJC7L
         YktG2HGf5I878ceRj5KES0oeuvO2WV4WVDrB9yg26oLAUMO1Ok80sQ+J+aMHVHnMAWgy
         zw7v8K3/TkLONwqaNxqgEQOlQc32F6Nres7WTXtfLo9J2vvw59YGUGxg1EjWrDLwFd/k
         Hmx2nzXEz30BI7E2DtZwqNtkK2J5jCRMrwq6oYu4lRLI8wMCpbrRHZCfoEY9gq8QBXDk
         gFfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679904591;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ESC+h5a5L+0QAStOf0nm0G7C56coJgIIvWvF2IVlW7A=;
        b=1yqEQoCTRmKtXMIjg8BckWSGDpX1yPSLL1pejUaedUD9ZsreWx4NRXLhjCbsJh9fSm
         aTt+ikS+14V4SGCAcHuoH7222Z2rTEr5lNj0jTVxzFnBAuwE9NnkB9pBLVA2mJ2NXlU8
         hkkEhWLsPnWrBxuH/31vJSzR9C81PXxAdKXuKemim/BWD5+V7cL9PrQkg5ruMpxSZ3m6
         SnlYvR2FNgmrpAMe6LSfsMrkKQeZAKCeEGbv6gosw+g1stcpN496b2eMJG2J2dI5imlt
         DS/jjTsyaw0+l4O3Rth3ys3ufMMOrYa26eReACAGnW/C7NoWRdg8gdOpmDlas0Ra5sbU
         cPhA==
X-Gm-Message-State: AO0yUKXHEV5KqFxnlEvQYdv9o6M+2URpP5YG3s/ZJZjruZGRmDqufn1X
        mBnP+ANHlbW39BwbSFSMRNS17Q==
X-Google-Smtp-Source: AK7set+7SXVjbBDjDfD+QIY9ofKP1turU4YPCc57g+4P6wMTaOxGHtdXngsVkcq1nK2Jsr16WIHZyQ==
X-Received: by 2002:a7b:c8d9:0:b0:3ed:245f:97a with SMTP id f25-20020a7bc8d9000000b003ed245f097amr8879158wml.19.1679904591668;
        Mon, 27 Mar 2023 01:09:51 -0700 (PDT)
Received: from [192.168.7.111] (679773502.box.freepro.com. [212.114.21.58])
        by smtp.gmail.com with ESMTPSA id l10-20020a7bc44a000000b003ed246c1d28sm12593795wmi.44.2023.03.27.01.09.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Mar 2023 01:09:51 -0700 (PDT)
Message-ID: <ab495295-fc33-a195-e39c-4de4a2685cef@linaro.org>
Date:   Mon, 27 Mar 2023 10:09:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 5/9] arm64: dts: qcom: sc7180: switch USB+DP QMP PHY to
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
 <20230326005733.2166354-6-dmitry.baryshkov@linaro.org>
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230326005733.2166354-6-dmitry.baryshkov@linaro.org>
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
>   arch/arm64/boot/dts/qcom/sc7180.dtsi | 57 ++++++++++------------------
>   1 file changed, 19 insertions(+), 38 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index 3c799b564b64..98004b02b762 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -14,6 +14,7 @@
>   #include <dt-bindings/interconnect/qcom,osm-l3.h>
>   #include <dt-bindings/interconnect/qcom,sc7180.h>
>   #include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/phy/phy-qcom-qmp.h>
>   #include <dt-bindings/phy/phy-qcom-qusb2.h>
>   #include <dt-bindings/power/qcom-rpmpd.h>
>   #include <dt-bindings/reset/qcom,sdm845-aoss.h>
> @@ -2713,49 +2714,28 @@ usb_1_hsphy: phy@88e3000 {
>   			nvmem-cells = <&qusb2p_hstx_trim>;
>   		};
>   
> -		usb_1_qmpphy: phy-wrapper@88e9000 {
> +		usb_1_qmpphy: phy@88e8000 {
>   			compatible = "qcom,sc7180-qmp-usb3-dp-phy";
> -			reg = <0 0x088e9000 0 0x18c>,
> -			      <0 0x088e8000 0 0x3c>,
> -			      <0 0x088ea000 0 0x18c>;
> +			reg = <0 0x088e8000 0 0x3000>;
>   			status = "disabled";
> -			#address-cells = <2>;
> -			#size-cells = <2>;
> -			ranges;
>   
>   			clocks = <&gcc GCC_USB3_PRIM_PHY_AUX_CLK>,
> -				 <&gcc GCC_USB_PHY_CFG_AHB2PHY_CLK>,
>   				 <&gcc GCC_USB3_PRIM_CLKREF_CLK>,
> -				 <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>;
> -			clock-names = "aux", "cfg_ahb", "ref", "com_aux";
> +				 <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>,
> +				 <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>,
> +				 <&gcc GCC_USB_PHY_CFG_AHB2PHY_CLK>;
> +			clock-names = "aux",
> +				      "ref",
> +				      "com_aux",
> +				      "usb3_pipe",
> +				      "cfg_ahb";
>   
>   			resets = <&gcc GCC_USB3_PHY_PRIM_BCR>,
>   				 <&gcc GCC_USB3_DP_PHY_PRIM_BCR>;
>   			reset-names = "phy", "common";
>   
> -			usb_1_ssphy: usb3-phy@88e9200 {
> -				reg = <0 0x088e9200 0 0x128>,
> -				      <0 0x088e9400 0 0x200>,
> -				      <0 0x088e9c00 0 0x218>,
> -				      <0 0x088e9600 0 0x128>,
> -				      <0 0x088e9800 0 0x200>,
> -				      <0 0x088e9a00 0 0x18>;
> -				#clock-cells = <0>;
> -				#phy-cells = <0>;
> -				clocks = <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
> -				clock-names = "pipe0";
> -				clock-output-names = "usb3_phy_pipe_clk_src";
> -			};
> -
> -			dp_phy: dp-phy@88ea200 {
> -				reg = <0 0x088ea200 0 0x200>,
> -				      <0 0x088ea400 0 0x200>,
> -				      <0 0x088eaa00 0 0x200>,
> -				      <0 0x088ea600 0 0x200>,
> -				      <0 0x088ea800 0 0x200>;
> -				#clock-cells = <1>;
> -				#phy-cells = <0>;
> -			};
> +			#clock-cells = <1>;
> +			#phy-cells = <1>;
>   		};
>   
>   		dc_noc: interconnect@9160000 {
> @@ -2835,7 +2815,7 @@ usb_1_dwc3: usb@a600000 {
>   				iommus = <&apps_smmu 0x540 0>;
>   				snps,dis_u2_susphy_quirk;
>   				snps,dis_enblslpm_quirk;
> -				phys = <&usb_1_hsphy>, <&usb_1_ssphy>;
> +				phys = <&usb_1_hsphy>, <&usb_1_qmpphy QMP_USB43DP_USB3_PHY>;
>   				phy-names = "usb2-phy", "usb3-phy";
>   				maximum-speed = "super-speed";
>   			};
> @@ -3143,8 +3123,9 @@ mdss_dp: displayport-controller@ae90000 {
>   					      "ctrl_link_iface", "stream_pixel";
>   				assigned-clocks = <&dispcc DISP_CC_MDSS_DP_LINK_CLK_SRC>,
>   						  <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
> -				assigned-clock-parents = <&dp_phy 0>, <&dp_phy 1>;
> -				phys = <&dp_phy>;
> +				assigned-clock-parents = <&usb_1_qmpphy QMP_USB43DP_DP_LINK_CLK>,
> +							 <&usb_1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
> +				phys = <&usb_1_qmpphy QMP_USB43DP_DP_PHY>;
>   				phy-names = "dp";
>   
>   				operating-points-v2 = <&dp_opp_table>;
> @@ -3201,8 +3182,8 @@ dispcc: clock-controller@af00000 {
>   				 <&gcc GCC_DISP_GPLL0_CLK_SRC>,
>   				 <&dsi_phy 0>,
>   				 <&dsi_phy 1>,
> -				 <&dp_phy 0>,
> -				 <&dp_phy 1>;
> +				 <&usb_1_qmpphy QMP_USB43DP_DP_LINK_CLK>,
> +				 <&usb_1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
>   			clock-names = "bi_tcxo",
>   				      "gcc_disp_gpll0_clk_src",
>   				      "dsi0_phy_pll_out_byteclk",

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
