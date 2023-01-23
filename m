Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1EB46678274
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jan 2023 18:02:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232290AbjAWRCm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Jan 2023 12:02:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231515AbjAWRCl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Jan 2023 12:02:41 -0500
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F576C0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jan 2023 09:02:40 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id y11so15281392edd.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jan 2023 09:02:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MJFLomacRBVqFg3uCWRpdgGcx7VRRrWPGPG3+QqMRx8=;
        b=SDvVIXhKgTW6owee3sBXfsmhMmHFyVJWqwc6iXUWIcKejcFOekWGoE3Xhmqm6HRwZv
         YO3Y5n0Qdo47rdnzlPSiO+i8YdjSsIH6UnqJSKRLrbwuqMfS4NBkTtx4EBfj8DmMeAfQ
         1hXSmliAyv5j+zh6Ho1hjpR3lW6a1vg1f43KmrDhyCu7HLVjcFKjR5u6lJEHQXOG3XXT
         n+jVmgSdpmxQB/Vm2wu2DoADrF287PY1/xbdNe/+z5Iyi8Hi+wqbEh/Nsyjef8dRpdJ/
         H4mtr60L/yPHkUDYBTpXYdt7leBKBB43sbD3YYeyCW29+gtuLx/kuGX60cqTx9m3roMF
         I/Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MJFLomacRBVqFg3uCWRpdgGcx7VRRrWPGPG3+QqMRx8=;
        b=3H0aHTd99sUq3N2r96JWqeDm/hB5e7H4LLwghkN9CnDgF4LKCkfNqXz2Tpgk0tDQBG
         yuw1bNezbaqzhiScXVwtellCl1lbmlMebpgpWhJG2EgNT4tAzOKxbkzDE7wyZWwgEjjA
         jSNcgB73IP099Tgl/hPu8NPwexuqtNOf2fZKFgpyDdVG3LCGdHfObqE0sZxQOR1rTKML
         Lr+tnbefHPhCuq4HciE90fQGpyWXCmcEakKxrLk/G2PYdhVzJF8gVak/2rNrq+An71CZ
         CxiAL6Aq2EKVRtDt3TFdurXthy52EBPtDmCVfRJq/VwB0xXii4VSdCALtyBEHiZZDIob
         ZqKg==
X-Gm-Message-State: AFqh2krgsPXchHTdxeZ2wA7w3woJOMbpXjrpzJD/bXkGlip3iWmWSv0m
        1vjCVAOnDgVih39cEor0ATVobg==
X-Google-Smtp-Source: AMrXdXtRCcegXdMed6gVE4B7GTzMMb2aSBMz3o4c3PFhCgOn28IEkUjIr0eHtbLYnSOlaznt7LmDkw==
X-Received: by 2002:a05:6402:524f:b0:491:3a5c:6e5 with SMTP id t15-20020a056402524f00b004913a5c06e5mr36302393edd.1.1674493359062;
        Mon, 23 Jan 2023 09:02:39 -0800 (PST)
Received: from [192.168.1.101] (abxi24.neoplus.adsl.tpnet.pl. [83.9.2.24])
        by smtp.gmail.com with ESMTPSA id i12-20020aa7dd0c000000b0047021294426sm21609323edv.90.2023.01.23.09.02.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 09:02:38 -0800 (PST)
Message-ID: <b4b6ea2d-00ea-613a-4088-2bee7a81f431@linaro.org>
Date:   Mon, 23 Jan 2023 18:02:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v2] ARM: dts: qcom: apq8064: add second DSI host and PHY
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20230121091237.2734272-1-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230121091237.2734272-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 21.01.2023 10:12, Dmitry Baryshkov wrote:
> Add second DSI host and PHY available on the APQ8064 platform.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

P.S. looking into RPM XO on this platform seems like a good
idea too, though I am not sure how it works on pre-SMD SoCs..

> 
> Changes since v1:
> - Switched dsi1 to dsi1 clocks by default
> - Indentation and ordering fixes (noted by Konrad)
> 
> ---
>  arch/arm/boot/dts/qcom-apq8064.dtsi | 78 ++++++++++++++++++++++++++++-
>  1 file changed, 76 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
> index b7e5b45e1c04..92aa2b081901 100644
> --- a/arch/arm/boot/dts/qcom-apq8064.dtsi
> +++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
> @@ -865,8 +865,8 @@ mmcc: clock-controller@4000000 {
>  				 <&gcc PLL8_VOTE>,
>  				 <&dsi0_phy 1>,
>  				 <&dsi0_phy 0>,
> -				 <0>,
> -				 <0>,
> +				 <&dsi1_phy 1>,
> +				 <&dsi1_phy 0>,
>  				 <&hdmi_phy>;
>  			clock-names = "pxo",
>  				      "pll3",
> @@ -1342,6 +1342,80 @@ dsi0_phy: phy@4700200 {
>  			status = "disabled";
>  		};
>  
> +		dsi1: dsi@5800000 {
> +			compatible = "qcom,mdss-dsi-ctrl";
> +			interrupts = <GIC_SPI 166 IRQ_TYPE_LEVEL_HIGH>;
> +			reg = <0x05800000 0x200>;
> +			reg-names = "dsi_ctrl";
> +
> +			clocks = <&mmcc DSI2_M_AHB_CLK>,
> +				 <&mmcc DSI2_S_AHB_CLK>,
> +				 <&mmcc AMP_AHB_CLK>,
> +				 <&mmcc DSI2_CLK>,
> +				 <&mmcc DSI2_BYTE_CLK>,
> +				 <&mmcc DSI2_PIXEL_CLK>,
> +				 <&mmcc DSI2_ESC_CLK>;
> +			clock-names = "iface",
> +				      "bus",
> +				      "core_mmss",
> +				      "src",
> +				      "byte",
> +				      "pixel",
> +				      "core";
> +
> +			assigned-clocks = <&mmcc DSI2_BYTE_SRC>,
> +					  <&mmcc DSI2_ESC_SRC>,
> +					  <&mmcc DSI2_SRC>,
> +					  <&mmcc DSI2_PIXEL_SRC>;
> +			assigned-clock-parents = <&dsi1_phy 0>,
> +						 <&dsi1_phy 0>,
> +						 <&dsi1_phy 1>,
> +						 <&dsi1_phy 1>;
> +
> +			syscon-sfpb = <&mmss_sfpb>;
> +			phys = <&dsi1_phy>;
> +
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			status = "disabled";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +					dsi1_in: endpoint {
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +					dsi1_out: endpoint {
> +					};
> +				};
> +			};
> +		};
> +
> +
> +		dsi1_phy: dsi-phy@5800200 {
> +			compatible = "qcom,dsi-phy-28nm-8960";
> +			reg = <0x05800200 0x100>,
> +			      <0x05800300 0x200>,
> +			      <0x05800500 0x5c>;
> +			reg-names = "dsi_pll",
> +				    "dsi_phy",
> +				    "dsi_phy_regulator";
> +			clock-names = "iface",
> +				      "ref";
> +			clocks = <&mmcc DSI2_M_AHB_CLK>,
> +				 <&pxo_board>;
> +			#clock-cells = <1>;
> +			#phy-cells = <0>;
> +
> +			status = "disabled";
> +		};
>  
>  		mdp_port0: iommu@7500000 {
>  			compatible = "qcom,apq8064-iommu";
