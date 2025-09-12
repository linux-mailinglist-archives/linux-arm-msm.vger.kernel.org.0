Return-Path: <linux-arm-msm+bounces-73273-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 36671B5473C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 11:26:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ED516586E9D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 09:26:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 923A12DA759;
	Fri, 12 Sep 2025 09:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BcgOVszr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A079296BDF
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 09:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757668833; cv=none; b=JEKcZW7OVYTjdPMWQ6VXsw0gqx+8FiIz4oGEakVnt0Yf4Pg5ErreKAIHQCZuT0y5hz5VUvr0qOohfubOwWkBZqalBfE2poyZIoBBcCBPH6mikNaIxrYTVcxuajKAjRolHu835Iko4+7WmcCDqxtFvOeXgjLc0oL/AzYhSIj1LAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757668833; c=relaxed/simple;
	bh=+RRd2aFZlOFS202VSsfrM6yuRZpDO2Yo4ZM6NC7Wlgg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SlkHUcfCYv6RxrUIb76yRWRjqsz0+VtSDcOpNVi8tHHV5RsXMLP29EUTLJAbd2Eeuo5GEUrz5RRnrna9EQIehKCigC5IMiK2em997dJGE/B5/Y+TxOlJn25ef6mR7iIuYI6r8ElnEwA1I6te5jhIUYvk/boUfIDwTNadaotba0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BcgOVszr; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-45df7cb7f6bso8606195e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 02:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757668828; x=1758273628; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Sll6VwA9LDG08bOVdGE11RpaEnaBI9suo9qZQEXHEnQ=;
        b=BcgOVszr4cX2s56S2yuUKpnaTQ4BCKXplvwaxBUTy8w4/VgN97RKSSqE8BJZQkwGLM
         1+y9kuS8Hczbl+6SaXfECwkH7jioB2is+yruJCAfY1wkI2jJguX84aPzkKYIeoAlZ703
         ua6R2zf37gIB5mamkFqJAJKXUOQSk4qnGv4Aae7WcHya1h1AiYs5KwwBfHlxNH1XBMpV
         HA28Kra2Sw1i8QIgLcu6wCCXVggWU3U9dXXBRK5M3Hd5ffdH1jRuF8M7lJmHuVI9zaEq
         eOBfP9a5UJuhQPiG5oKCJFHwZo9ioBGfS/WhaSVkThl/pNJ1/TBao4pmFOsMDH/Xsc7e
         me5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757668829; x=1758273629;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Sll6VwA9LDG08bOVdGE11RpaEnaBI9suo9qZQEXHEnQ=;
        b=hIzmYFEgJbO3npYLaEXcv+fv5z5yPuWb7fY24qrNx5L2DwAvibcj9e/3XFnzo0mpJb
         0Hd8j3FYFPaG6tV+gVxBAGGPnvtFuZHhqOR/i0MRsBpmFSHv71luBqc5+u1TEQJqraSd
         /n3g0cI58JeevVZP3bMz0bwGmHoPkwlOqOt2CpYA7HMEg75gobuma7QchBNhJ4wDyLqm
         3zWj+7ln9AeQXLuQCtmT4Bb+Ek2LSd69nV3nwKzFzBfJeJwTbEdP6/CyN1/r3XJ+QkLK
         XLBYYLffXrViWEDeU9+OyQmGk6mxa3UcyZHWifdryEeQHMkkE427qAJYzn9ivQ2/Vw6v
         EyRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnmZwJOavp51Y8+87jCvu6jB+HPslBeuhP+VghYNOCySRBGytJYjCPPu5dc+iCL59EvTgRbVKLhMZlG7om@vger.kernel.org
X-Gm-Message-State: AOJu0YzWgyB7YFcwJwTvFu81yIWPsP3OYrt5TwNQL3UKfsOuu4+1CpyJ
	oWFiKw7MRvgGnmGL9/I08FKhVD1sOgzyZM/3TsMqnrfz9azwFz6pucHt2ycOTbpRblU=
X-Gm-Gg: ASbGncuxaB0t4PafXoFV2SpRFoRZmumU8oS6+ADneti6B8dLwclzqUW5M7c+I8W89cW
	EbyhwUf6sCXO5jx42rUnhGzSgfWWFqPNAXDaCN42IAwhFL2W/4A956Om0eTWVM+ztk42QxtP1dk
	K+UfRYtrrG/mp2j3M/XTDPXyQt4+A720c/KSVGzsAy5zrr1bNtCGdUsq/3cclgaW2qHNJqghsc/
	Krj+vDuGmZMZcFEEjNRqYTfETzoUo0IQqUEojXMMgGDwpzkBOosFDC5/QkByJQMBlpjXAiZ5KZG
	m9+glJIk1io8SV7isiurEowuW19l8aPa548qAp78xwKk4bAQxURQQMlgwRM0Ob98BZEcLR3620F
	830v8RiMctE64G37GA5IGoIK8Zb8CtZkMlcGAMD/J+sigNpzKEkgLNhP+QGNk576T3Fv9MfrYvp
	SqJg246ZY3V98BYJdb/+KDozc5ea7GwxyD4oae4LLp
X-Google-Smtp-Source: AGHT+IHE+7a3XtW7lEpnoN4PlI4mZCODSy7H+REIbJkPSXZOCUeVGfF9aCWXChHH6hwhx3/N8lVZNw==
X-Received: by 2002:a7b:ca4b:0:b0:45e:395:a3e4 with SMTP id 5b1f17b1804b1-45f211fe9bamr17155685e9.26.1757668828532;
        Fri, 12 Sep 2025 02:20:28 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e037b9215sm55951445e9.12.2025.09.12.02.20.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 02:20:27 -0700 (PDT)
Message-ID: <e7a39867-334b-4e17-a76e-1ee036a80daf@linaro.org>
Date: Fri, 12 Sep 2025 10:20:24 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] arm64: dts: qcom: x1e80100: Add IRIS video codec
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
References: <20250911-x1e-iris-dt-v1-0-63caf0fd202c@linaro.org>
 <20250911-x1e-iris-dt-v1-1-63caf0fd202c@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250911-x1e-iris-dt-v1-1-63caf0fd202c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/09/2025 19:38, Stephan Gerhold wrote:
> Add the IRIS video codec to accelerate video decoding/encoding. Copied
> mostly from sm8550.dtsi, only the opp-table is slightly different for X1E.
> For opp-240000000, we need to vote for a higher OPP on one of the power
> domains, because the voltage requirements for the PLL and the derived
> clocks differ (sm8550.dtsi has the same).
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/x1e80100.dtsi | 87 ++++++++++++++++++++++++++++++++++
>   1 file changed, 87 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> index ba602eddfb54616ad38205570bc56a1f0e62c023..d6914165d055cd0c0e80541267e2671c7432799e 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> @@ -5234,6 +5234,93 @@ usb_1_ss1_dwc3_ss: endpoint {
>   			};
>   		};
>   
> +		iris: video-codec@aa00000 {
> +			compatible = "qcom,x1e80100-iris", "qcom,sm8550-iris";
> +
> +			reg = <0 0x0aa00000 0 0xf0000>;
> +			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
> +					<&videocc VIDEO_CC_MVS0_GDSC>,
> +					<&rpmhpd RPMHPD_MXC>,
> +					<&rpmhpd RPMHPD_MMCX>;
> +			power-domain-names = "venus",
> +					     "vcodec0",
> +					     "mxc",
> +					     "mmcx";
> +			operating-points-v2 = <&iris_opp_table>;
> +
> +			clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
> +				 <&videocc VIDEO_CC_MVS0C_CLK>,
> +				 <&videocc VIDEO_CC_MVS0_CLK>;
> +			clock-names = "iface",
> +				      "core",
> +				      "vcodec0_core";
> +
> +			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> +					 &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
> +					<&mmss_noc MASTER_VIDEO QCOM_ICC_TAG_ALWAYS
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +			interconnect-names = "cpu-cfg",
> +					     "video-mem";
> +
> +			memory-region = <&video_mem>;
> +
> +			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
> +			reset-names = "bus";
> +
> +			iommus = <&apps_smmu 0x1940 0>,
> +				 <&apps_smmu 0x1947 0>;
> +			dma-coherent;
> +
> +			/*
> +			 * IRIS firmware is signed by vendors, only
> +			 * enable in boards where the proper signed firmware
> +			 * is available.
> +			 */
> +			status = "disabled";
> +
> +			iris_opp_table: opp-table {
> +				compatible = "operating-points-v2";
> +
> +				opp-192000000 {
> +					opp-hz = /bits/ 64 <192000000>;
> +					required-opps = <&rpmhpd_opp_low_svs_d1>,
> +							<&rpmhpd_opp_low_svs_d1>;
> +				};
> +
> +				opp-240000000 {
> +					opp-hz = /bits/ 64 <240000000>;
> +					required-opps = <&rpmhpd_opp_svs>,
> +							<&rpmhpd_opp_low_svs>;
> +				};
> +
> +				opp-338000000 {
> +					opp-hz = /bits/ 64 <338000000>;
> +					required-opps = <&rpmhpd_opp_svs>,
> +							<&rpmhpd_opp_svs>;
> +				};
> +
> +				opp-366000000 {
> +					opp-hz = /bits/ 64 <366000000>;
> +					required-opps = <&rpmhpd_opp_svs_l1>,
> +							<&rpmhpd_opp_svs_l1>;
> +				};
> +
> +				opp-444000000 {
> +					opp-hz = /bits/ 64 <444000000>;
> +					required-opps = <&rpmhpd_opp_nom>,
> +							<&rpmhpd_opp_nom>;
> +				};
> +
> +				opp-481000000 {
> +					opp-hz = /bits/ 64 <481000000>;
> +					required-opps = <&rpmhpd_opp_turbo>,
> +							<&rpmhpd_opp_turbo>;
> +				};
> +			};
> +		};
> +
>   		videocc: clock-controller@aaf0000 {
>   			compatible = "qcom,x1e80100-videocc";
>   			reg = <0 0x0aaf0000 0 0x10000>;
> 

Assuming /in/s//on/

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # x1e Inspiron 14p

