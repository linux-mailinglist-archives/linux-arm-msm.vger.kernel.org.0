Return-Path: <linux-arm-msm+bounces-922-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E4917EF06B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Nov 2023 11:30:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 94196B20BEC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Nov 2023 10:30:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D22ACCA57;
	Fri, 17 Nov 2023 10:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WcMGIUoN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7633D68
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Nov 2023 02:30:50 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-50949b7d7ffso2610174e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Nov 2023 02:30:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700217049; x=1700821849; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wc+G2BXYXEPt9fQTDN8l2bnR2Ld4/4FL6ZOxBvBX3jM=;
        b=WcMGIUoNBI418br/H9qyQN6W8kLCKXnqcIEDbMqNOezO6PgiBBuzZGZH2IlxFOe6+p
         twN03RLdrKQDfuPADl6hzcU1QbCv+ABdwsh00tX6VO2gCNVMHOTsvUV1gkchdi25k/Z9
         V/4fhel3uSsthujgIbe25WgBdCM8gXbETFHc1YjXFibT1vJuUH0zUfXyjqToX/7xY7el
         fJ32gUpWqXp2VT6DR9XBudh1edGNZaBkxxa02EQBwrw6mvekh9MIJbpWMTcoa5ORaWCE
         /B8g1f68juXoyZWs+SAahu2//BFBgyppZhMl6HP9+MepF7l+B22T4A8btw05lFeBva/O
         yfog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700217049; x=1700821849;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wc+G2BXYXEPt9fQTDN8l2bnR2Ld4/4FL6ZOxBvBX3jM=;
        b=l9R4N+bhiwIS8e5gOiXLeyDXNREuBlvqS0+RZb9Q9oDqKQFpfIAdnAP/p9BZNHl5Cm
         zE2naNtk+7pYp9YqFZDv/WeH5kNuyBM3UCYlHOXeQo+gvrih3aOYDzkjLI4Y2n2FJzrg
         SjE6UsmUF1um/dj+06oJIaStGMr0it/RfvPkQJbaQNSPMaAHX/QQVdFDdhoqWUi+ohvb
         xHWHSD4ABSl87HwsH7x9Uo4PFdh4FmcI/upWdorruVTL+SLzjvNlsvB5JCb73hy2QyrO
         gIvGV6d4eT+4ZRkz+LShHyTNrAfjlFRdi7o6bUYF//DRlippOpuyxAx3XaFyVvQGm8Oy
         yfrw==
X-Gm-Message-State: AOJu0YzakD61xXIqhBnDldW4wh1sN9OE4QRQIuiqzRrl+7u/0Vi9QleV
	K10udsVm9lA1a/F8pi+6OUs8yQ==
X-Google-Smtp-Source: AGHT+IF8EgoN+6Ul76S0+HqO+Ku3iKGOfRbkNAN8caHPSacEHxyf71UwWQIUrpjmlQJxFh4HabLQrg==
X-Received: by 2002:a05:6512:1381:b0:507:98d0:bec4 with SMTP id fc1-20020a056512138100b0050798d0bec4mr5062456lfb.54.1700217048809;
        Fri, 17 Nov 2023 02:30:48 -0800 (PST)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id f16-20020a19ae10000000b005041a71237asm182106lfc.111.2023.11.17.02.30.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Nov 2023 02:30:48 -0800 (PST)
Message-ID: <a1672479-ca5f-4d96-8583-014d3adfc37c@linaro.org>
Date: Fri, 17 Nov 2023 12:30:47 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/16] arm64: dts: qcom: sm8550-aim300: add display and
 panel
Content-Language: en-GB
To: Tengfei Fan <quic_tengfan@quicinc.com>, agross@kernel.org,
 andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, tglx@linutronix.de
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, -cc=kernel@quicinc.com
References: <20231117101817.4401-1-quic_tengfan@quicinc.com>
 <20231117101817.4401-11-quic_tengfan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20231117101817.4401-11-quic_tengfan@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/11/2023 12:18, Tengfei Fan wrote:
> Enable Display Subsystem with Visionox VTDR6130 Panel.
> 
> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
> ---
>   arch/arm64/boot/dts/qcom/sm8550-aim300.dts | 68 ++++++++++++++++++++++
>   1 file changed, 68 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8550-aim300.dts b/arch/arm64/boot/dts/qcom/sm8550-aim300.dts
> index cafddc02aef0..9b568ae9581e 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550-aim300.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8550-aim300.dts
> @@ -432,6 +432,46 @@
>   		 <&usb_dp_qmpphy QMP_USB43DP_USB3_PIPE_CLK>;
>   };
>   
> +&mdss {
> +	status = "okay";
> +};
> +
> +&mdss_dsi0 {
> +	vdda-supply = <&vreg_l3e_1p2>;
> +	status = "okay";
> +
> +	panel@0 {
> +		compatible = "visionox,vtdr6130";
> +		reg = <0>;
> +
> +		pinctrl-0 = <&sde_dsi_active>, <&sde_te_active>;
> +		pinctrl-1 = <&sde_dsi_suspend>, <&sde_te_suspend>;
> +		pinctrl-names = "default", "sleep";
> +
> +		reset-gpios = <&tlmm 133 GPIO_ACTIVE_LOW>;
> +
> +		vci-supply = <&vreg_l13b_3p0>;
> +		vdd-supply = <&vreg_l11b_1p2>;
> +		vddio-supply = <&vreg_l12b_1p8>;
> +
> +		port {
> +			panel0_in: endpoint {
> +				remote-endpoint = <&mdss_dsi0_out>;
> +			};
> +		};
> +	};
> +};
> +
> +&mdss_dsi0_out {
> +	remote-endpoint = <&panel0_in>;
> +	data-lanes = <0 1 2 3>;
> +};
> +
> +&mdss_dsi0_phy {
> +	vdds-supply = <&vreg_l1e_0p88>;
> +	status = "okay";
> +};
> +
>   &pcie_1_phy_aux_clk {
>   	status = "disabled";
>   };
> @@ -533,6 +573,34 @@
>   &tlmm {
>   	gpio-reserved-ranges = <32 8>;
>   
> +	sde_dsi_active: sde-dsi-active-state {

sde is the name from the other kernel branch. Drop it please. Just 'dsi' 
is enough.

> +		pins = "gpio133";
> +		function = "gpio";
> +		drive-strength = <8>;
> +		bias-disable;
> +	};
> +
> +	sde_dsi_suspend: sde-dsi-suspend-state {
> +		pins = "gpio133";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-pull-down;
> +	};
> +
> +	sde_te_active: sde-te-active-state {
> +		pins = "gpio86";
> +		function = "mdp_vsync";
> +		drive-strength = <2>;
> +		bias-pull-down;
> +	};
> +
> +	sde_te_suspend: sde-te-suspend-state {
> +		pins = "gpio86";
> +		function = "mdp_vsync";
> +		drive-strength = <2>;
> +		bias-pull-down;
> +	};
> +
>   	wcd_default: wcd-reset-n-active-state {
>   		pins = "gpio108";
>   		function = "gpio";

-- 
With best wishes
Dmitry


