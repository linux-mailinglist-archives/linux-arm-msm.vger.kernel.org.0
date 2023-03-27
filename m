Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E50AE6C9D4D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Mar 2023 10:13:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232936AbjC0INZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Mar 2023 04:13:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232512AbjC0INY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Mar 2023 04:13:24 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5566F1FE4
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Mar 2023 01:13:23 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id r29so7681918wra.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Mar 2023 01:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679904802;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HPoK9rzdnsMJkfHLl9TYJjlPiSjh4bu8x7Ea1/hutjM=;
        b=FScLNr8irLBxk+8gdxXBExiz+sbJm9GuV4TyToLfC4GX1ObC8W2nDRK2Us0MHGJT99
         m3J3M+Rj0qCiJh1Iq0AJ/Sc1ETnJlXdMdWvlQWyAu+aQqcIXTgUhbSd10s6pV+HVM9OR
         YVgiKuB2kEZpAy/OHAgsI64FVCt1T8cQ9emy0I42PRyVMpe/iN6gHE6S5VLt1DU/ZSfG
         s+WCiQ4ELfylnwvSiX3c0UlJpW9pY2KUVdVx16kPbhYbvCw6UalAYXvHRHhogNAdMDB3
         XqpoT+0S0kK+Jm/BZOpG29Kye6zyUYSSQQX3mDXbWHPxFaXku5/HeBXbuwJdvHxZP8e0
         riww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679904802;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HPoK9rzdnsMJkfHLl9TYJjlPiSjh4bu8x7Ea1/hutjM=;
        b=5+GsnvSF3R1OWQaEDaYZK6SfoHPHHkVleVzTPVe/I6iYk26+OB41nooEZoOGO/eetM
         lxdEhAGW177Ieel2PhGjxP3A+1xDplMMwd7OxmnVlzMWEolYdSrzUdCvXemseF3+/Obi
         Xa3B8HC3+uwCChy79goM2YDBNcG7TVu2j4q/WwiNWy/X2facD3RmJXpAdWqH6EbX/yGf
         jz4hG+7JiLJ8aSTFZ6FKKr0ATpFkVf0s/kV9h6w7AWQ5R/0DQcJe5kCGftyEVSX4O2VD
         1Nas+mP6V8kPEwfi3aCIabkSmWoZ6d14pPgCHA6rYemW0ShaQnDC/z2jhkTyNSmJBu9p
         LGVQ==
X-Gm-Message-State: AAQBX9dNuMFxFGDJ+LXp5pyKUebCqtwT4sBEct8OPy3/jc09iBmmOf2u
        wX/ahx2XTvbdF7HVK1FWzK6Ydg==
X-Google-Smtp-Source: AKy350ZPboEvskTQ94Fye172/HB5JXnEshyRZeXS7QR1T4u4vdC4qh7T+ueGn5eUoqmyri48/P1FSg==
X-Received: by 2002:adf:e4c9:0:b0:2dd:af9:e1d2 with SMTP id v9-20020adfe4c9000000b002dd0af9e1d2mr8074396wrm.5.1679904801833;
        Mon, 27 Mar 2023 01:13:21 -0700 (PDT)
Received: from [192.168.7.111] (679773502.box.freepro.com. [212.114.21.58])
        by smtp.gmail.com with ESMTPSA id q10-20020adff94a000000b002ca864b807csm24558430wrr.0.2023.03.27.01.13.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Mar 2023 01:13:21 -0700 (PDT)
Message-ID: <fe277e43-2086-74d4-d9b6-04c3205c1b71@linaro.org>
Date:   Mon, 27 Mar 2023 10:13:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 7/9] arm64: dts: qcom: sdm845: switch USB+DP QMP PHY to
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
 <20230326005733.2166354-8-dmitry.baryshkov@linaro.org>
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230326005733.2166354-8-dmitry.baryshkov@linaro.org>
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
>   arch/arm64/boot/dts/qcom/sdm845.dtsi | 57 ++++++++++------------------
>   1 file changed, 19 insertions(+), 38 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index 2f32179c7d1b..aff8b9278914 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -17,6 +17,7 @@
>   #include <dt-bindings/interconnect/qcom,osm-l3.h>
>   #include <dt-bindings/interconnect/qcom,sdm845.h>
>   #include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/phy/phy-qcom-qmp.h>
>   #include <dt-bindings/phy/phy-qcom-qusb2.h>
>   #include <dt-bindings/power/qcom-rpmpd.h>
>   #include <dt-bindings/reset/qcom,sdm845-aoss.h>
> @@ -3909,49 +3910,28 @@ usb_2_hsphy: phy@88e3000 {
>   			nvmem-cells = <&qusb2s_hstx_trim>;
>   		};
>   
> -		usb_1_qmpphy: phy@88e9000 {
> +		usb_1_qmpphy: phy@88e8000 {
>   			compatible = "qcom,sdm845-qmp-usb3-dp-phy";
> -			reg = <0 0x088e9000 0 0x18c>,
> -			      <0 0x088e8000 0 0x38>,
> -			      <0 0x088ea000 0 0x40>;
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
> -				      <0 0x088e9a00 0 0x100>;
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
>   		usb_2_qmpphy: phy@88eb000 {
> @@ -4031,7 +4011,7 @@ usb_1_dwc3: usb@a600000 {
>   				iommus = <&apps_smmu 0x740 0>;
>   				snps,dis_u2_susphy_quirk;
>   				snps,dis_enblslpm_quirk;
> -				phys = <&usb_1_hsphy>, <&usb_1_ssphy>;
> +				phys = <&usb_1_hsphy>, <&usb_1_qmpphy QMP_USB43DP_USB3_PHY>;
>   				phy-names = "usb2-phy", "usb3-phy";
>   			};
>   		};
> @@ -4499,8 +4479,9 @@ mdss_dp: displayport-controller@ae90000 {
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
> @@ -4838,8 +4819,8 @@ dispcc: clock-controller@af00000 {
>   				 <&dsi0_phy 1>,
>   				 <&dsi1_phy 0>,
>   				 <&dsi1_phy 1>,
> -				 <&dp_phy 0>,
> -				 <&dp_phy 1>;
> +				 <&usb_1_qmpphy QMP_USB43DP_DP_LINK_CLK>,
> +				 <&usb_1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
>   			clock-names = "bi_tcxo",
>   				      "gcc_disp_gpll0_clk_src",
>   				      "gcc_disp_gpll0_div_clk_src",

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
