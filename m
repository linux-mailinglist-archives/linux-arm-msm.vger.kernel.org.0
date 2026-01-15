Return-Path: <linux-arm-msm+bounces-89213-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B7DE9D24B7A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 14:22:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DCA0F304F667
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 13:17:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D00EA399A5B;
	Thu, 15 Jan 2026 13:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oQ5Og9zg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OZUx3C4f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2EA3394485
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 13:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768483070; cv=none; b=drLDVme4pRyrFeqNDJ+0N3mIqAzzBPghtXVcAuyJHZGwj3CleM16pRaOq+eK/sDcMvZjd33dVAENSxKwmG9lrGbQwN34tN8yO4ODLZ0iPPXyUBqkKsG7jhYOLaEh3iJZ1VzyKdkyeawOIafXZ0ov+RT6HpnH3KflJJfbmt8/w0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768483070; c=relaxed/simple;
	bh=oWQqUcMXuqked1nVObAk0MfzSKHrhY1HEtZymltHkTs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rYl2a1Fy+WUQGPkUPTTG4l1jiQeBeAbJLjNFSIreLQGLjXweeTGFYCfNzzDc1+9BCXPozxg4ZcyqqOMbf4wj1fqL+Xo3Gd+V6Zb5tjEfEWXBEMOmJDuRJjKEiV1vsvpAakPt5M9v9IwhPLd2wku+cMH+FBk697uhWfKUi+absKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oQ5Og9zg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OZUx3C4f; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FAUMQ42564724
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 13:17:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kDqf1Vbj6UEPUSwvcsg/B7BmE99gUVSCIZ0XEcMeJoQ=; b=oQ5Og9zgW4SARD75
	MKkEs62N5a4mICtvQ9NoKcJ1aJP6FH8Oqj6WM78oHnCTl30R2dVv2ItYG+Km3HQ+
	4LLE/LYI5hEcNZLWF2f+TDnT5E4KLMSs1PN82H2cUCQECaIh5o5bSL9WaQsJtxHf
	nJlSgcswBBLymz8YS6hJt1UL3N/Q5Cc7nza6nGX/KjJzurCX/SE7Xr5ArblFIbOH
	0G4yIpCmBJJOhQ0SSA4SHlzPchBbwR1kdiQlgWchDlyRt/+1joDsVQEF58R0KNaI
	qsZ/qB/+CFPmYLAKo7+DO7iYcMFm2LBtfi6qzeCFU8YUFposjDXl+wVSSE9QPxHP
	hgwCDA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpxhs8cjp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 13:17:47 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-29f2b45ecffso14012815ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 05:17:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768483067; x=1769087867; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kDqf1Vbj6UEPUSwvcsg/B7BmE99gUVSCIZ0XEcMeJoQ=;
        b=OZUx3C4fJ3E+GSMQSHP2BYB+cDOQQf4fFUqy66je3QOtnebCQhIBOri8wiX7XFytr9
         cylm5BwBI1gzBNupcgXURNvUnKNeikw7SFm1Onjbri8J0rmZz9UtAVIkq1liXPsouvQK
         BBLzV3kUDg95juUUF9c5GPVIgJqzCQ1V7XcT2rYyPZRz4sbC9tVUcn1xIOGYHvV9mKzB
         agpgpg3+z4Pe0d7WYoP145NBPbUKby6W0TXbApqPbjhRchD1b0gdGnb4ttMdgozgvK4i
         +hJyh1EYP7ZbWS62jBCYaCbjB7n1lh0dRP+8AmYRE8tVywDqe0oGS4JoJhT+jhLWDQgW
         sSwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768483067; x=1769087867;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kDqf1Vbj6UEPUSwvcsg/B7BmE99gUVSCIZ0XEcMeJoQ=;
        b=vRbDwnR5uSBxhuUeX0vM5CGTsyk0l5YKBQdry1Jxkl64qCNp7EotVBcDjych6cKmhd
         gSqzuBi25ydLqYDFH5Fvu425C+FT0TyeJO1kFpsBKomLXrSGfV3ogv34KRKR20NZ+eJr
         nz4/SHOKfKHfEQCCAzocVf5kz6FBhdpad9TI/oLEZTUD35paqzuy+gPjnmxDq/Nvwvc5
         YmrXFxYAAcjU7K+YHA974S2zmuNfRHSib8L9yRF20EZgtvYWJh1E624GdRpBBM20zJOr
         qD1Vgbvhl/4c9cSyp4Kx6qO0sPUjzc34QL2hEJhKSwX0uR28wKddg8M4l8kVDVDiZJeJ
         FsWg==
X-Forwarded-Encrypted: i=1; AJvYcCXBVQaFKLX5yj6+LtkxlkhPyE8hVmSXMd3xOXDATa7EUeyUoJMJk7iE+P/kAxebyp0hYbpEbmPJP0s47U84@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0MbaJYOD7SCqpklJtne4/heRHcBoOs57YH1PDZ8rjuZ/wFtGu
	u5rk4Nwux8NOGbvRXHk91hiWV8Wx3neQuMF28XMyZO9lwfT8DP2U3DDCdUzBCNjt/hRwz0ldUIe
	99LDiJoGilpGtILmxf1Nn40TnVk4dhfTJjNsauXSIqbB14RDCxTSy6tXL5ZR7vvom7lZb
X-Gm-Gg: AY/fxX7fXc/pXyJ/QHO3XI0woEtzGGXh/vWkc4ZAR4E2Yg8w14FBeoLfkZWbiUnfd1Q
	WPn7ybNZVqbmo8qH7/O4/5KAiIiODOUOjILtWyAc8yyGslyk+o4KWadUycc18WWWAFBllncikqW
	WArE523utaPM0wF2iuOppwNqEZDid1YhV+fST5ACTBglhNu5NaZCEIlXFbPHFrl+BOwZb+4NPGn
	U7FD5C+9BOcY5mR6F+WhDEWxOVsdCkU9MCn+zy/0LtNvMdJoXNzwkkCLG6TpbcwiHrgzlcmLDXc
	q1MrUEnYyDqV3x747Mw5oSUG1DuFPg7TefCCt9ED8bLirE7dIjDYrTyES3jhmp6SaQ274MS7WHC
	EZRWVIaoCjQr5VDIXocyFx42JF1LVOdXuiX5jfbzV5w3E4vFzP3tqIsCztP9Jtkr3wMn2LXcT/A
	==
X-Received: by 2002:a17:902:ea0e:b0:2a1:388c:ca63 with SMTP id d9443c01a7336-2a59bc0c216mr57858095ad.31.1768483066544;
        Thu, 15 Jan 2026 05:17:46 -0800 (PST)
X-Received: by 2002:a17:902:ea0e:b0:2a1:388c:ca63 with SMTP id d9443c01a7336-2a59bc0c216mr57857665ad.31.1768483065904;
        Thu, 15 Jan 2026 05:17:45 -0800 (PST)
Received: from ?IPV6:240e:b8f:9159:1300:eda1:90aa:1bab:b3bb? ([240e:b8f:9159:1300:eda1:90aa:1bab:b3bb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81f8e6b5901sm2514506b3a.68.2026.01.15.05.17.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jan 2026 05:17:45 -0800 (PST)
Message-ID: <3a4e0513-5b2d-4890-a4df-5306a694cf50@oss.qualcomm.com>
Date: Thu, 15 Jan 2026 21:17:40 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 4/4] arm64: dts: qcom: talos-evk: Add support for
 QCS615 talos evk board
To: Sudarshan Shetty <tessolveupstream@gmail.com>, andersson@kernel.org,
        konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260109095221.2847067-1-tessolveupstream@gmail.com>
 <20260109095221.2847067-5-tessolveupstream@gmail.com>
Content-Language: en-US
From: Qian Zhang <qian.zhang@oss.qualcomm.com>
In-Reply-To: <20260109095221.2847067-5-tessolveupstream@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=FI4WBuos c=1 sm=1 tr=0 ts=6968e8fc cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=g-GZLR5nYdqfn9ww3LcA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: 7MXM-C5ZO0ffUPt4kqT_NeX9DfI-037p
X-Proofpoint-ORIG-GUID: 7MXM-C5ZO0ffUPt4kqT_NeX9DfI-037p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA5OSBTYWx0ZWRfXy+Legk/8gIrQ
 9e4YXOdLag9yWJlqWcX0phG1Qk9xjt5hRgahVQG0a5Kwltznji6rsqRymgB2FqGUk2Wn9NUdB+q
 QIt6fdP+z5CQnmXaIWOmS9RcMyAmUBX+DBpg95gSBZ3dbFq+Jie+Ngz54drPmWJJjAUshbKx0CU
 wWerBwk7KPiUTJNewfuYX42Xn01FuVJc+lstOz0qncCPW3Gpl6N3ZV+fwiMInrC82sk1XWKe3cJ
 M8UdJO+QH4dc2lWW7WDdBtmH9HH0S3ne41w0E9Zl7vamEgAkxQN6DzkCluKRTPK8P5me7GPkjhl
 gjfYbMArQnBX0pBKdfdNRjZt6/35fbY9D0VLF6NyhLLMEPOO169ywcgvaMDbNzojkLVLBdoyrgx
 aJW0xYBq+SYY3M0SbGpVt+WWgkdtrRwYdv+WHV0X9vGvRgPBycfQ9RRhA0LgD96frzk5rzt6Ydt
 YlcPKwefz1sRiGWIdmg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_04,2026-01-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1011 phishscore=0 spamscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150099



On 1/9/2026 5:52 PM, Sudarshan Shetty wrote:
> Add the device tree for the QCS615-based Talos EVK platform. The
> platform is composed of a System-on-Module following the SMARC
> standard, and a Carrier Board.
> 
> The Carrier Board supports several display configurations, HDMI and
> LVDS. Both configurations use the same base hardware, with the display
> selection controlled by a DIP switch.
> 
> Use a DTBO file, talos-evk-lvds-auo,g133han01.dtso, which defines an
> overlay that disables HDMI and adds LVDS. The DTs file talos-evk
> can describe the HDMI display configurations.
> 
> The initial device tree includes support for:
> - CPU and memory
> - UART
> - GPIOs
> - Regulators
> - PMIC
> - Early console
> - AT24MAC602 EEPROM
> - MCP2515 SPI to CAN
> - ADV7535 DSI-to-HDMI bridge
> - DisplayPort interface
> - SN65DSI84ZXHR DSI-to-LVDS bridge
> - Wi-Fi/BT
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
> ---
>   arch/arm64/boot/dts/qcom/Makefile             |   4 +
>   .../qcom/talos-evk-lvds-auo,g133han01.dtso    | 126 ++++
>   arch/arm64/boot/dts/qcom/talos-evk-som.dtsi   | 616 ++++++++++++++++++
>   arch/arm64/boot/dts/qcom/talos-evk.dts        | 139 ++++
>   4 files changed, 885 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/qcom/talos-evk-lvds-auo,g133han01.dtso
>   create mode 100644 arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
>   create mode 100644 arch/arm64/boot/dts/qcom/talos-evk.dts
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 76cf0115a00a..289b651ef0c5 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -324,6 +324,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-mtp.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-qrd.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-mtp.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-qrd.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk.dtb
> +talos-evk-lvds-auo,g133han01-dtbs	:= \
> +	talos-evk.dtb talos-evk-lvds-auo,g133han01.dtbo
> +dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-lvds-auo,g133han01.dtb
>   x1e001de-devkit-el2-dtbs	:= x1e001de-devkit.dtb x1-el2.dtbo
>   dtb-$(CONFIG_ARCH_QCOM)	+= x1e001de-devkit.dtb x1e001de-devkit-el2.dtb
>   x1e78100-lenovo-thinkpad-t14s-el2-dtbs	:= x1e78100-lenovo-thinkpad-t14s.dtb x1-el2.dtbo
> diff --git a/arch/arm64/boot/dts/qcom/talos-evk-lvds-auo,g133han01.dtso b/arch/arm64/boot/dts/qcom/talos-evk-lvds-auo,g133han01.dtso
> new file mode 100644
> index 000000000000..ad058cf4cd93
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/talos-evk-lvds-auo,g133han01.dtso
> @@ -0,0 +1,126 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +
> +&{/} {
> +	backlight: backlight {
> +		compatible = "gpio-backlight";
> +		gpios = <&tlmm 59 GPIO_ACTIVE_HIGH>,
> +			<&tlmm 115 GPIO_ACTIVE_HIGH>;
> +		default-on;
> +	};
> +
> +	panel-lvds {
> +		compatible = "auo,g133han01";
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			/* LVDS A (Odd pixels) */
> +			port@0 {
> +				reg = <0>;
> +				dual-lvds-odd-pixels;
> +
> +				lvds_panel_out_a: endpoint {
> +					remote-endpoint = <&sn65dsi84_out_a>;
> +				};
> +			};
> +
> +			/* LVDS B (Even pixels) */
> +			port@1 {
> +				reg = <1>;
> +				dual-lvds-even-pixels;
> +
> +				lvds_panel_out_b: endpoint {
> +					remote-endpoint = <&sn65dsi84_out_b>;
> +				};
> +			};
> +		};
> +	};
> +};
> +
> +&hdmi_connector {
> +	status = "disabled";
> +};
> +
> +&i2c1 {
> +	clock-frequency = <400000>;
> +
> +	status = "okay";
> +
> +	hdmi_bridge: bridge@3d {
> +		status = "disabled";
> +	};
> +
> +	lvds_bridge: bridge@2c {
> +		compatible = "ti,sn65dsi84";
> +		reg = <0x2c>;
> +		enable-gpios = <&tlmm 42 GPIO_ACTIVE_HIGH>;
> +		ti,dsi-lanes = <4>;
> +		ti,lvds-format = "jeida-24";
> +		ti,lvds-bpp = <24>;
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +
> +				sn65dsi84_in: endpoint {
> +					data-lanes = <1 2 3 4>;
> +					remote-endpoint = <&mdss_dsi0_out>;
> +				};
> +			};
> +
> +			port@2 {
> +				reg = <2>;
> +
> +				sn65dsi84_out_a: endpoint {
> +					data-lanes = <1 2 3 4>;
> +					remote-endpoint = <&lvds_panel_out_a>;
> +				};
> +			};
> +
> +			port@3 {
> +				reg = <3>;
> +
> +				sn65dsi84_out_b: endpoint {
> +					data-lanes = <1 2 3 4>;
> +					remote-endpoint = <&lvds_panel_out_b>;
> +				};
> +			};
> +		};
> +	};
> +};
> +
> +&mdss_dsi0 {
> +	vdda-supply = <&vreg_l11a>;
> +
> +	status = "okay";
> +};
> +
> +&mdss_dsi0_out {
> +	remote-endpoint = <&sn65dsi84_in>;
> +	data-lanes = <0 1 2 3>;
> +};
> +
> +&tlmm {
> +	lcd_bklt_en: lcd-bklt-en-state {
> +		pins = "gpio115";
> +		function = "gpio";
> +		bias-disable;
> +	};
> +
> +	lcd_bklt_pwm: lcd-bklt-pwm-state {
> +		pins = "gpio59";
> +		function = "gpio";
> +		bias-disable;
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi b/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
> new file mode 100644
> index 000000000000..95ed335bcb08
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
> @@ -0,0 +1,616 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +/dts-v1/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> +#include "talos.dtsi"
> +#include "pm8150.dtsi"
> +/ {
> +	aliases {
> +		mmc0 = &sdhc_1;
> +		serial0 = &uart0;
> +		serial1 = &uart7;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	clocks {
> +		can_osc: can-oscillator {
> +			compatible = "fixed-clock";
> +			clock-frequency = <20000000>;
> +			#clock-cells = <0>;
> +		};
> +
> +		sleep_clk: sleep-clk {
> +			compatible = "fixed-clock";
> +			clock-frequency = <32764>;
> +			#clock-cells = <0>;
> +		};
> +
> +		xo_board_clk: xo-board-clk {
> +			compatible = "fixed-clock";
> +			clock-frequency = <38400000>;
> +			#clock-cells = <0>;
> +		};
> +	};
> +
> +	regulator-usb2-vbus {
> +		compatible = "regulator-fixed";
> +		regulator-name = "USB2_VBUS";
> +		gpio = <&pm8150_gpios 10 GPIO_ACTIVE_HIGH>;
> +		pinctrl-0 = <&usb2_en>;
> +		pinctrl-names = "default";
> +		enable-active-high;
> +		regulator-always-on;
> +	};
> +
> +	vreg_conn_1p8: regulator-conn-1p8 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vreg_conn_1p8";
> +		startup-delay-us = <4000>;
> +		enable-active-high;
> +		gpio = <&pm8150_gpios 1 GPIO_ACTIVE_HIGH>;
> +	};
> +
> +	vreg_conn_pa: regulator-conn-pa {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vreg_conn_pa";
> +		startup-delay-us = <4000>;
> +		enable-active-high;
> +		gpio = <&pm8150_gpios 6 GPIO_ACTIVE_HIGH>;
> +	};
> +
> +	vreg_v3p3_can: regulator-v3p3-can {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vreg-v3p3-can";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +	};
> +
> +	vreg_v5p0_can: regulator-v5p0-can {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vreg-v5p0-can";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +	};
> +
> +	wcn6855-pmu {
> +		compatible = "qcom,wcn6855-pmu";
> +
> +		pinctrl-0 = <&bt_en_state>, <&wlan_en_state>;
> +		pinctrl-names = "default";
> +
> +		bt-enable-gpios = <&tlmm 85 GPIO_ACTIVE_HIGH>;
> +		wlan-enable-gpios = <&tlmm 84 GPIO_ACTIVE_HIGH>;
> +
> +		vddio-supply = <&vreg_conn_pa>;
> +		vddaon-supply = <&vreg_s5a>;
> +		vddpmu-supply = <&vreg_conn_1p8>;
> +		vddpmumx-supply = <&vreg_conn_1p8>;
> +		vddpmucx-supply = <&vreg_conn_pa>;
> +		vddrfa0p95-supply = <&vreg_s5a>;
> +		vddrfa1p3-supply = <&vreg_s6a>;
> +		vddrfa1p9-supply = <&vreg_l15a>;
> +		vddpcie1p3-supply = <&vreg_s6a>;
> +		vddpcie1p9-supply = <&vreg_l15a>;
> +
> +		regulators {
> +			vreg_pmu_rfa_cmn: ldo0 {
> +				regulator-name = "vreg_pmu_rfa_cmn";
> +			};
> +
> +			vreg_pmu_aon_0p59: ldo1 {
> +				regulator-name = "vreg_pmu_aon_0p59";
> +			};
> +
> +			vreg_pmu_wlcx_0p8: ldo2 {
> +				regulator-name = "vreg_pmu_wlcx_0p8";
> +			};
> +
> +			vreg_pmu_wlmx_0p85: ldo3 {
> +				regulator-name = "vreg_pmu_wlmx_0p85";
> +			};
> +
> +			vreg_pmu_btcmx_0p85: ldo4 {
> +				regulator-name = "vreg_pmu_btcmx_0p85";
> +			};
> +
> +			vreg_pmu_rfa_0p8: ldo5 {
> +				regulator-name = "vreg_pmu_rfa_0p8";
> +			};
> +
> +			vreg_pmu_rfa_1p2: ldo6 {
> +				regulator-name = "vreg_pmu_rfa_1p2";
> +			};
> +
> +			vreg_pmu_rfa_1p7: ldo7 {
> +				regulator-name = "vreg_pmu_rfa_1p7";
> +			};
> +
> +			vreg_pmu_pcie_0p9: ldo8 {
> +				regulator-name = "vreg_pmu_pcie_0p9";
> +			};
> +
> +			vreg_pmu_pcie_1p8: ldo9 {
> +				regulator-name = "vreg_pmu_pcie_1p8";
> +			};
> +		};
> +	};
> +
> +	wifi_1p8v: regulator-wifi-1p8v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "wifi_1p8v";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		gpio = <&tlmm 91 GPIO_ACTIVE_HIGH>;
Please check this pin number
> +		enable-active-high;
> +		pinctrl-0 = <&wifi_reg_en_pins_state>;
> +		pinctrl-names = "default";
> +		regulator-boot-on;
> +		regulator-always-on;
> +	};
> +
> +	wifi_3p85v: regulator-wifi-3p85v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "wifi_3p85v";
> +		regulator-min-microvolt = <3850000>;
> +		regulator-max-microvolt = <3850000>;
> +		gpio = <&tlmm 91 GPIO_ACTIVE_HIGH>;
Please check this pin number
> +		enable-active-high;
> +		pinctrl-0 = <&wifi_reg_en_pins_state>;
> +		pinctrl-names = "default";
> +		regulator-boot-on;
> +		regulator-always-on;
> +	};
> +};

Are these two node necessary?

> +
> +&apps_rsc {
> +	regulators-0 {
> +		compatible = "qcom,pm8150-rpmh-regulators";
> +		qcom,pmic-id = "a";
> +
> +		vreg_s3a: smps3 {
> +			regulator-name = "vreg_s3a";
> +			regulator-min-microvolt = <600000>;
> +			regulator-max-microvolt = <650000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_s4a: smps4 {
> +			regulator-name = "vreg_s4a";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1829000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_s5a: smps5 {
> +			regulator-name = "vreg_s5a";
> +			regulator-min-microvolt = <1896000>;
> +			regulator-max-microvolt = <2040000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_s6a: smps6 {
> +			regulator-name = "vreg_s6a";
> +			regulator-min-microvolt = <1304000>;
> +			regulator-max-microvolt = <1404000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l1a: ldo1 {
> +			regulator-name = "vreg_l1a";
> +			regulator-min-microvolt = <488000>;
> +			regulator-max-microvolt = <852000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l2a: ldo2 {
> +			regulator-name = "vreg_l2a";
> +			regulator-min-microvolt = <1650000>;
> +			regulator-max-microvolt = <3100000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l3a: ldo3 {
> +			regulator-name = "vreg_l3a";
> +			regulator-min-microvolt = <1000000>;
> +			regulator-max-microvolt = <1248000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l5a: ldo5 {
> +			regulator-name = "vreg_l5a";
> +			regulator-min-microvolt = <875000>;
> +			regulator-max-microvolt = <975000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l7a: ldo7 {
> +			regulator-name = "vreg_l7a";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1900000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l8a: ldo8 {
> +			regulator-name = "vreg_l8a";
> +			regulator-min-microvolt = <1150000>;
> +			regulator-max-microvolt = <1350000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l10a: ldo10 {
> +			regulator-name = "vreg_l10a";
> +			regulator-min-microvolt = <2950000>;
> +			regulator-max-microvolt = <3312000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l11a: ldo11 {
> +			regulator-name = "vreg_l11a";
> +			regulator-min-microvolt = <1232000>;
> +			regulator-max-microvolt = <1260000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l12a: ldo12 {
> +			regulator-name = "vreg_l12a";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1890000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l13a: ldo13 {
> +			regulator-name = "vreg_l13a";
> +			regulator-min-microvolt = <3000000>;
> +			regulator-max-microvolt = <3230000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l15a: ldo15 {
> +			regulator-name = "vreg_l15a";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1904000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l16a: ldo16 {
> +			regulator-name = "vreg_l16a";
> +			regulator-min-microvolt = <3000000>;
> +			regulator-max-microvolt = <3312000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l17a: ldo17 {
> +			regulator-name = "vreg_l17a";
> +			regulator-min-microvolt = <2950000>;
> +			regulator-max-microvolt = <3312000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +	};
> +};
> +
> +&gpi_dma0 {
> +	status = "okay";
> +};
> +
> +&gpi_dma1 {
> +	status = "okay";
> +};
> +
> +&i2c5 {
> +	clock-frequency = <400000>;
> +	status = "okay";
> +
> +	eeprom@57 {
> +		compatible = "atmel,24c02";
> +		reg = <0x57>;
> +		pagesize = <16>;
> +	};
> +
> +	eeprom@5f {
> +		compatible = "atmel,24mac602";
> +		reg = <0x5f>;
> +		pagesize = <16>;
> +	};
> +};
> +
> +&mdss {
> +	status = "okay";
> +};
> +
> +&mdss_dp0 {
> +	status = "okay";
> +};
> +
> +&mdss_dp0_out {
> +	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000>;
> +	remote-endpoint = <&dp0_connector_in>;
> +};
> +
> +&mdss_dsi0 {
> +	vdda-supply = <&vreg_l11a>;
> +	status = "okay";
> +};
> +
> +&mdss_dsi0_phy {
> +	vcca-supply = <&vreg_l5a>;
> +	status = "okay";
> +};
> +
> +&pcie {
> +	perst-gpios = <&tlmm 89 GPIO_ACTIVE_LOW>;
> +	wake-gpios = <&tlmm 100 GPIO_ACTIVE_HIGH>;
> +
> +	pinctrl-0 = <&pcie_default_state>;
> +	pinctrl-names = "default";
> +
> +	status = "okay";
> +};
> +
> +&pcie_phy {
> +	vdda-phy-supply = <&vreg_l5a>;
> +	vdda-pll-supply = <&vreg_l12a>;
> +
> +	status = "okay";
> +};
> +
> +&pcie_port0 {
> +	wifi@0 {
> +		compatible = "pci17cb,1103";

This style of writing is not very readable.

> +		reg = <0x10000 0x0 0x0 0x0 0x0>;
> +
> +		qcom,calibration-variant = "QC_QCS615_Ride";
> +
> +		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
> +		vddaon-supply = <&vreg_pmu_aon_0p59>;
> +		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
> +		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
> +		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
> +		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
> +		vddrfa1p8-supply = <&vreg_pmu_rfa_1p7>;
> +		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
> +		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
> +	};
> +};
> +
> +&pm8150_gpios {
> +	usb2_en: usb2-en-state {
> +		pins = "gpio10";
> +		function = "normal";
> +		output-enable;
> +		power-source = <0>;
> +	};
> +};
> +
> +&qupv3_id_0 {
> +	status = "okay";
> +};
> +
> +&qupv3_id_1 {
> +	status = "okay";
> +};
> +
> +&remoteproc_adsp {
> +	firmware-name = "qcom/qcs615/adsp.mbn";
> +
> +	status = "okay";
> +};
> +
> +&remoteproc_cdsp {
> +	firmware-name = "qcom/qcs615/cdsp.mbn";
> +
> +	status = "okay";
> +};
> +
> +&sdhc_1 {
> +	pinctrl-0 = <&sdc1_state_on>;
> +	pinctrl-1 = <&sdc1_state_off>;
> +	pinctrl-names = "default", "sleep";
> +
> +	bus-width = <8>;
> +	mmc-ddr-1_8v;
> +	mmc-hs200-1_8v;
> +	mmc-hs400-1_8v;
> +	mmc-hs400-enhanced-strobe;
> +	vmmc-supply = <&vreg_l17a>;
> +	vqmmc-supply = <&vreg_s4a>;
> +
> +	non-removable;
> +	no-sd;
> +	no-sdio;
> +
> +	status = "okay";
> +};
> +
> +&spi6 {
> +	status = "okay";
> +
> +	can@0 {
> +		compatible = "microchip,mcp2515";
> +		reg = <0>;
> +		clocks = <&can_osc>;
> +		interrupts-extended = <&tlmm 87 IRQ_TYPE_LEVEL_LOW>;
> +		spi-max-frequency = <10000000>;
> +		vdd-supply = <&vreg_v3p3_can>;
> +		xceiver-supply = <&vreg_v5p0_can>;
> +	};
> +};
> +
> +&tlmm {
> +	bt_en_state: bt-en-state {
> +		pins = "gpio85";
> +		function = "gpio";
> +		bias-pull-down;
> +	};
> +
> +	pcie_default_state: pcie-default-state {
> +		clkreq-pins {
> +			pins = "gpio90";
> +			function = "pcie_clk_req";
> +			drive-strength = <2>;
> +			bias-pull-up;
> +		};
> +
> +		perst-pins {
> +			pins = "gpio89";
> +			function = "gpio";
> +			drive-strength = <2>;
> +			bias-disable;
> +		};
> +
> +		wake-pins {
> +			pins = "gpio100";
> +			function = "gpio";
> +			drive-strength = <2>;
> +			bias-pull-up;
> +		};
> +	};
> +
> +	wifi_reg_en_pins_state: wifi-reg-en-pins-state {
> +		pins = "gpio91";
> +		function = "gpio";
> +		drive-strength = <8>;
> +		output-high;
> +		bias-pull-up;
> +	};
> +
> +	wlan_en_state: wlan-en-state {
> +		pins = "gpio84";
> +		function = "gpio";
> +		drive-strength = <16>;
> +		bias-pull-down;
> +		output-low;
> +	};
> +};
> +
> +&uart0 {
> +	status = "okay";
> +};
> +
> +&uart7 {
> +	status = "okay";
> +
> +	bluetooth {
> +		compatible = "qcom,wcn6855-bt";
> +		firmware-name = "QCA6698/hpnv21", "QCA6698/hpbtfw21.tlv";
> +
> +		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
> +		vddaon-supply = <&vreg_pmu_aon_0p59>;
> +		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
> +		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
> +		vddbtcmx-supply = <&vreg_pmu_btcmx_0p85>;
> +		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
> +		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
> +		vddrfa1p8-supply = <&vreg_pmu_rfa_1p7>;
> +	};
> +};
> +
> +&usb_1 {
> +	status = "okay";
> +};
> +
> +&usb_1_dwc3 {
> +	dr_mode = "host";
> +};
> +
> +&usb_hsphy_1 {
> +	vdd-supply = <&vreg_l5a>;
> +	vdda-pll-supply = <&vreg_l12a>;
> +	vdda-phy-dpdm-supply = <&vreg_l13a>;
> +
> +	status = "okay";
> +};
> +
> +&usb_2 {
> +	status = "okay";
> +};
> +
> +&usb_2_dwc3 {
> +	dr_mode = "host";
> +};
> +
> +&usb_hsphy_2 {
> +	vdd-supply = <&vreg_l5a>;
> +	vdda-pll-supply = <&vreg_l12a>;
> +	vdda-phy-dpdm-supply = <&vreg_l13a>;
> +
> +	status = "okay";
> +};
> +
> +&usb_qmpphy {
> +	vdda-phy-supply = <&vreg_l5a>;
> +	vdda-pll-supply = <&vreg_l12a>;
> +
> +	status = "okay";
> +};
> +
> +&usb_qmpphy_2 {
> +	vdda-phy-supply = <&vreg_l11a>;
> +	vdda-pll-supply = <&vreg_l5a>;
> +
> +	status = "okay";
> +};
> +
> +&ufs_mem_hc {
> +	reset-gpios = <&tlmm 123 GPIO_ACTIVE_LOW>;
> +	vcc-supply = <&vreg_l17a>;
> +	vcc-max-microamp = <600000>;
> +	vccq2-supply = <&vreg_s4a>;
> +	vccq2-max-microamp = <600000>;
> +
> +	status = "okay";
> +};
> +
> +&ufs_mem_phy {
> +	vdda-phy-supply = <&vreg_l5a>;
> +	vdda-pll-supply = <&vreg_l12a>;
> +
> +	status = "okay";
> +};
> +
> +&venus {
> +	status = "okay";
> +};
> diff --git a/arch/arm64/boot/dts/qcom/talos-evk.dts b/arch/arm64/boot/dts/qcom/talos-evk.dts
> new file mode 100644
> index 000000000000..af100e22beee
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/talos-evk.dts
> @@ -0,0 +1,139 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +/dts-v1/;
> +
> +#include "talos-evk-som.dtsi"
> +
> +/ {
> +	model = "Qualcomm QCS615 IQ 615 EVK";
> +	compatible = "qcom,talos-evk", "qcom,qcs615", "qcom,sm6150";
> +	chassis-type = "embedded";
> +
> +	aliases {
> +		mmc1 = &sdhc_2;
> +	};
> +
> +	dp0-connector {
> +		compatible = "dp-connector";
> +		label = "DP0";
> +		type = "full-size";
> +
> +		hpd-gpios = <&tlmm 104 GPIO_ACTIVE_HIGH>;
> +
> +		port {
> +			dp0_connector_in: endpoint {
> +				remote-endpoint = <&mdss_dp0_out>;
> +			};
> +		};
> +	};
> +
> +	hdmi_connector: hdmi-out {
> +		compatible = "hdmi-connector";
> +		type = "d";
> +
> +		port {
> +			hdmi_con_out: endpoint {
> +			remote-endpoint = <&adv7535_out>;
> +			};
> +		};
> +	};
> +
> +	vreg_v1p8_out: regulator-v1p8-out {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vreg-v1p8-out";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		vin-supply = <&vreg_v5p0_out>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +	};
> +
> +	vreg_v3p3_out: regulator-v3p3-out {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vreg-v3p3-out";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		vin-supply = <&vreg_v5p0_out>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +	};
> +
> +	vreg_v5p0_out: regulator-v5p0-out {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vreg-v5p0-out";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +		/* Powered by system 20V rail (USBC_VBUS_IN) */
> +	};
> +};
> +
> +&i2c1 {
> +	clock-frequency = <400000>;
> +	status = "okay";
> +
> +	hdmi_bridge: bridge@3d {
> +		compatible = "adi,adv7535";
> +		reg = <0x3d>;
> +		avdd-supply = <&vreg_v1p8_out>;
> +		dvdd-supply = <&vreg_v1p8_out>;
> +		pvdd-supply = <&vreg_v1p8_out>;
> +		a2vdd-supply = <&vreg_v1p8_out>;
> +		v3p3-supply = <&vreg_v3p3_out>;
> +		interrupts-extended = <&tlmm 26 IRQ_TYPE_LEVEL_LOW>;
> +		adi,dsi-lanes = <4>;
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +
> +				adv7535_in: endpoint {
> +					remote-endpoint = <&mdss_dsi0_out>;
> +				};
> +			};
> +
> +			port@1 {
> +				reg = <1>;
> +
> +				adv7535_out: endpoint {
> +					remote-endpoint = <&hdmi_con_out>;
> +				};
> +			};
> +		};
> +	};
> +};
> +
> +&mdss_dsi0_out {
> +	remote-endpoint = <&adv7535_in>;
> +	data-lanes = <0 1 2 3>;
> +};
> +
> +&pon_pwrkey {
> +	status = "okay";
> +};
> +
> +&pon_resin {
> +	linux,code = <KEY_VOLUMEDOWN>;
> +
> +	status = "okay";
> +};
> +
> +&sdhc_2 {
> +	pinctrl-0 = <&sdc2_state_on>;
> +	pinctrl-1 = <&sdc2_state_off>;
> +	pinctrl-names = "default", "sleep";
> +
> +	bus-width = <4>;
> +	cd-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
> +
> +	vmmc-supply = <&vreg_l10a>;
> +	vqmmc-supply = <&vreg_s4a>;
> +
> +	status = "okay";
> +};


