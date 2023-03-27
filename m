Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB7906C9D4C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Mar 2023 10:12:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233017AbjC0IMc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Mar 2023 04:12:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232982AbjC0IMW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Mar 2023 04:12:22 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AB0149DD
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Mar 2023 01:12:20 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id l27so7720013wrb.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Mar 2023 01:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679904739;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KBfO/oFMbTKt7WQEfeOuO2ERZ7+hWklfjpQd73i51jE=;
        b=xInh/mRq9zL3iWJW/LVrlrdt7sKz1u9ejAVy3pSlpHX1W/4/2fFJUfZXF0sFyr9pDU
         mV7sJXGXx5LeMvo1J4T42eweggdNm83y0iyOae/8nU5NSYeA27/AM8VlFfUzGqFEFnZL
         xe4MpU6nSyogwVFnObfKVk9IceTa3guueWNNdZ6MBmencI9lONOw05rjW/lYKX9HO2YP
         PQ5iGHqZMYDZHxCmNFqA5oASrRwlQDCXA/r9ntU3R72uBh35cOI6L7i6mYDI+tnIJT3l
         dRNGeNGr6Qgp6i9ZtE0MyTufX8+ZnH7LwRJXRBCvRa8KvWvln+VOkqJed09gXd+aH4T5
         3hXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679904739;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KBfO/oFMbTKt7WQEfeOuO2ERZ7+hWklfjpQd73i51jE=;
        b=qVI1NQTQMz+jOnW1kO5s6sjJqJ0g9LGslcZ+PdGq4lptJI85Vc0gfxg3sBmhhaCf50
         EZTXC0t5J9C2Pj4c4bV1YEhJmRsD9CXQBGumjrR6Us5KJXUafFCgqDtXVYV9hB/Jhk0N
         Wk0BPgZ55eG97EbNc49lZYi7kwQKRaVsIF0ZnB1m7cv8cx9pNXiyukBlD6Ym9aw/oTVp
         VCB10WQ97iQfPdkamyJU+JHUl6qvu10PjuH3T5E2jYjsNM/CPC3NersMUcN9LqrnHCnP
         YRo6oftbnRHU+WdV29nqrcC+7XEqG8Nk6Cs+5cC7EBgP1nssQTMsZs/SxGeasLcKjjBk
         8mFg==
X-Gm-Message-State: AAQBX9eTixXabU0SCwDYijytQgLvaRCd1VBv7p7cQM0xZmbH4kTegTd7
        fNggjhG8ng4uMZ0xb74ZlzYDgw==
X-Google-Smtp-Source: AKy350auFzMlC4w9kxnIeWd9u8zmLg6N8VYeAGBRNLrH6OS+QBEgMkTj/PNX2qyN7EUxaSyT9O8rpw==
X-Received: by 2002:a5d:66ca:0:b0:2d3:bde8:9ff with SMTP id k10-20020a5d66ca000000b002d3bde809ffmr9388618wrw.34.1679904739019;
        Mon, 27 Mar 2023 01:12:19 -0700 (PDT)
Received: from [192.168.7.111] (679773502.box.freepro.com. [212.114.21.58])
        by smtp.gmail.com with ESMTPSA id a8-20020a056000100800b002d8566128e5sm15971130wrx.25.2023.03.27.01.12.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Mar 2023 01:12:18 -0700 (PDT)
Message-ID: <be4af5a9-6c82-138d-28dc-73b485fa1a00@linaro.org>
Date:   Mon, 27 Mar 2023 10:12:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 6/9] arm64: dts: qcom: sc7280: switch USB+DP QMP PHY to
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
 <20230326005733.2166354-7-dmitry.baryshkov@linaro.org>
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230326005733.2166354-7-dmitry.baryshkov@linaro.org>
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
>   arch/arm64/boot/dts/qcom/sc7280.dtsi | 57 +++++++++-------------------
>   1 file changed, 18 insertions(+), 39 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index 5e6f9f441f1a..887c490bdd14 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -18,6 +18,7 @@
>   #include <dt-bindings/interconnect/qcom,sc7280.h>
>   #include <dt-bindings/interrupt-controller/arm-gic.h>
>   #include <dt-bindings/mailbox/qcom-ipcc.h>
> +#include <dt-bindings/phy/phy-qcom-qmp.h>
>   #include <dt-bindings/power/qcom-rpmpd.h>
>   #include <dt-bindings/reset/qcom,sdm845-aoss.h>
>   #include <dt-bindings/reset/qcom,sdm845-pdc.h>
> @@ -3327,49 +3328,26 @@ usb_2_hsphy: phy@88e4000 {
>   			resets = <&gcc GCC_QUSB2PHY_SEC_BCR>;
>   		};
>   
> -		usb_1_qmpphy: phy-wrapper@88e9000 {
> -			compatible = "qcom,sc7280-qmp-usb3-dp-phy",
> -				     "qcom,sm8250-qmp-usb3-dp-phy";
> -			reg = <0 0x088e9000 0 0x200>,
> -			      <0 0x088e8000 0 0x40>,
> -			      <0 0x088ea000 0 0x200>;
> +		usb_1_qmpphy: phy@88e8000 {
> +			compatible = "qcom,sc7280-qmp-usb3-dp-phy";
> +			reg = <0 0x088e8000 0 0x3000>;
>   			status = "disabled";
> -			#address-cells = <2>;
> -			#size-cells = <2>;
> -			ranges;
>   
>   			clocks = <&gcc GCC_USB3_PRIM_PHY_AUX_CLK>,
>   				 <&rpmhcc RPMH_CXO_CLK>,
> -				 <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>;
> -			clock-names = "aux", "ref_clk_src", "com_aux";
> +				 <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>,
> +				 <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
> +			clock-names = "aux",
> +				      "ref",
> +				      "com_aux",
> +				      "usb3_pipe";
>   
>   			resets = <&gcc GCC_USB3_DP_PHY_PRIM_BCR>,
>   				 <&gcc GCC_USB3_PHY_PRIM_BCR>;
>   			reset-names = "phy", "common";
>   
> -			usb_1_ssphy: usb3-phy@88e9200 {
> -				reg = <0 0x088e9200 0 0x200>,
> -				      <0 0x088e9400 0 0x200>,
> -				      <0 0x088e9c00 0 0x400>,
> -				      <0 0x088e9600 0 0x200>,
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
> -				#phy-cells = <0>;
> -				#clock-cells = <1>;
> -			};
> +			#clock-cells = <1>;
> +			#phy-cells = <1>;
>   		};
>   
>   		usb_2: usb@8cf8800 {
> @@ -3694,7 +3672,7 @@ usb_1_dwc3: usb@a600000 {
>   				iommus = <&apps_smmu 0xe0 0x0>;
>   				snps,dis_u2_susphy_quirk;
>   				snps,dis_enblslpm_quirk;
> -				phys = <&usb_1_hsphy>, <&usb_1_ssphy>;
> +				phys = <&usb_1_hsphy>, <&usb_1_qmpphy QMP_USB43DP_USB3_PHY>;
>   				phy-names = "usb2-phy", "usb3-phy";
>   				maximum-speed = "super-speed";
>   			};
> @@ -3799,8 +3777,8 @@ dispcc: clock-controller@af00000 {
>   				 <&gcc GCC_DISP_GPLL0_CLK_SRC>,
>   				 <&mdss_dsi_phy 0>,
>   				 <&mdss_dsi_phy 1>,
> -				 <&dp_phy 0>,
> -				 <&dp_phy 1>,
> +				 <&usb_1_qmpphy QMP_USB43DP_DP_LINK_CLK>,
> +				 <&usb_1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
>   				 <&mdss_edp_phy 0>,
>   				 <&mdss_edp_phy 1>;

The gcc usb3_phy_wrapper_gcc_usb30_pipe_clk entry is missing, it was already missing with legacy bindings.

Neil

>   			clock-names = "bi_tcxo",
> @@ -4138,8 +4116,9 @@ mdss_dp: displayport-controller@ae90000 {
>   						"stream_pixel";
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

