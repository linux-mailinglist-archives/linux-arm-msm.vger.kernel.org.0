Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4EB48673ADE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Jan 2023 14:58:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230073AbjASN6I (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Jan 2023 08:58:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230079AbjASN6F (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Jan 2023 08:58:05 -0500
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1957469B
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jan 2023 05:58:03 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id ss4so5804479ejb.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jan 2023 05:58:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2QEW8UYi3WuEt65f5kj7rHxbQxmbQ2xVrO+Zq9cJVdI=;
        b=Qywy9cQ+E9f7iAqs2S41DhYzxhQq4TumhHyiB+RpfIK2vN5C9YN72z9PO/CgxUKF6V
         ysNYvCBpm5xr5OGzbiR1VJw2fzLwSQzX9GF3sXAF2asXQem4miy4zggVT2TvlbelI+uq
         WWa8V010BDO/haECC5SNl+OcS8TlERjtOycCH5s0whffGyAzYIOVckRCVbjVueZ5tza9
         XNcHLpdMLE5O8xoDfMi+vESqqKPwxTRLXrAcqSORHx3HE8BmNNiRL24uVPrGD7gcSqaL
         BQMpKL6BLIzNn5khfJwipNLzNYJDlxUGxhkxTs38yH1vKt/B4CkrHdP3ITexmhh372sD
         B4oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2QEW8UYi3WuEt65f5kj7rHxbQxmbQ2xVrO+Zq9cJVdI=;
        b=k+iPoI+kOu4Pn9HlR2czfAj0kv2aQtmxMfRSWSyaTuQgJ1gMSaktPo8V/anz3PWO4A
         B7iSZEwXipIHvdpyZZxWD/MDwvRCv1gHh+sq+dHiYFf2u6DyJ69NZvITExg+gpb1SZKt
         dcaOhN+wPIZkNjTu/dZTnqzH6bqnZQmFXUM5d/nvOQiIOFxXFl2esHpUhOLLMbQLCSwj
         A4HamMWo+2V0zpP8GqJQHNg8eUbju2fJsKH6bUFnoqrKS5DO7z33WUJhcMreB4fBhcWB
         fog77tuinKHXO2l6Qq/SRZrpjtKzSR40fS7GsCMbWaq/3yAAj76qzo7HEfQ509zA67bB
         e4JQ==
X-Gm-Message-State: AFqh2koJACddwxzEpZ3d+5kWJ9VVgeytMu5jsbLOrPCvxGhRQ4V1XsGK
        cbvNEqXBVlE+5twc9S0yMyQe5g==
X-Google-Smtp-Source: AMrXdXsFQCqw9/u0E/GRG+ZjxQkIgHyMtIvtkGuI02PvSceo/xs+9P/gCzVV2tGB6u/cdaGQLv17GA==
X-Received: by 2002:a17:906:1c51:b0:864:8ffe:135b with SMTP id l17-20020a1709061c5100b008648ffe135bmr10576800ejg.22.1674136682478;
        Thu, 19 Jan 2023 05:58:02 -0800 (PST)
Received: from [192.168.1.101] (abyk37.neoplus.adsl.tpnet.pl. [83.9.30.37])
        by smtp.gmail.com with ESMTPSA id q1-20020a17090676c100b007c0d4d3a0c1sm16465461ejn.32.2023.01.19.05.58.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jan 2023 05:58:02 -0800 (PST)
Message-ID: <80d9b4a5-ba33-15b6-2527-2a1020593740@linaro.org>
Date:   Thu, 19 Jan 2023 14:58:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] ARM: dts: qcom: apq8064: add second DSI host and PHY
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20230119132249.2480022-1-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230119132249.2480022-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 19.01.2023 14:22, Dmitry Baryshkov wrote:
> Add second DSI host and PHY available on the APQ8064 platform.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  arch/arm/boot/dts/qcom-apq8064.dtsi | 69 ++++++++++++++++++++++++++++-
>  1 file changed, 67 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
> index b7e5b45e1c04..3ae6abd85f3d 100644
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
> @@ -1342,6 +1342,71 @@ dsi0_phy: phy@4700200 {
>  			status = "disabled";
>  		};
>  
> +		dsi1: dsi@5800000 {
> +			compatible = "qcom,mdss-dsi-ctrl";
> +			label = "MDSS DSI CTRL->0";
->1 if you really want to add it

but I don't see why it's useful..

> +			#address-cells = <1>;
> +			#size-cells = <0>;
These two don't belong here

> +			interrupts = <GIC_SPI 166 IRQ_TYPE_LEVEL_HIGH>;
> +			reg = <0x05800000 0x200>;
> +			reg-names = "dsi_ctrl";
> +
> +			clocks = <&mmcc DSI2_M_AHB_CLK>,
> +				<&mmcc DSI2_S_AHB_CLK>,
> +				<&mmcc AMP_AHB_CLK>,
> +				<&mmcc DSI2_CLK>,
> +				<&mmcc DSI2_BYTE_CLK>,
> +				<&mmcc DSI2_PIXEL_CLK>,
> +				<&mmcc DSI2_ESC_CLK>;
> +			clock-names = "iface", "bus", "core_mmss",
> +					"src", "byte", "pixel",
> +					"core";
This should be a vertical list

> +
> +			assigned-clocks = <&mmcc DSI2_BYTE_SRC>,
> +					<&mmcc DSI2_ESC_SRC>,
> +					<&mmcc DSI2_SRC>,
> +					<&mmcc DSI2_PIXEL_SRC>;
> +			assigned-clock-parents = <&dsi0_phy 0>,
> +						<&dsi0_phy 0>,
> +						<&dsi0_phy 1>,
> +						<&dsi0_phy 1>;
Bad indentation from clocks to assigned-clock-parents inclusive

> +			syscon-sfpb = <&mmss_sfpb>;
> +			phys = <&dsi1_phy>;
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
> +			#clock-cells = <1>;
> +			#phy-cells = <0>;
These two don't belong here

> +
> +			reg = <0x05800200 0x100>,
> +				<0x05800300 0x200>,
> +				<0x05800500 0x5c>;
Bad indentation


> +			reg-names = "dsi_pll", "dsi_phy", "dsi_phy_regulator";
This should be a vertical list

Konrad
> +			clock-names = "iface", "ref";
> +			clocks = <&mmcc DSI2_M_AHB_CLK>,
> +				 <&pxo_board>;
> +			status = "disabled";
> +		};
>  
>  		mdp_port0: iommu@7500000 {
>  			compatible = "qcom,apq8064-iommu";
