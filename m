Return-Path: <linux-arm-msm+bounces-77089-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 53714BD775E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 07:39:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7CDEF18A1C6F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 05:39:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 918CD29ACD1;
	Tue, 14 Oct 2025 05:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TK3lcttp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0CAB265CB2
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 05:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760420362; cv=none; b=gZ0UZMXlfRNHK50bLsAblz70w3ItNQTJH9HXciV8w4BW2a5BpvwMljsOomJvVSORFscqx04/WoHn7KFptCYRrq+wskqQ6yHQO5IX1S0OTUIKbheMeBTN0R8n8+COi0PhEAPLaYCFZw/oVrPqyp5M2RViX7GidGplsivc1AlFARk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760420362; c=relaxed/simple;
	bh=7KgKJc1vvZ2vlF4uE4gLCM9HlQYZ30Nnc5tPPVSSt3w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Lexhb6ggWj0fp/9/KBnmx2E2togNkWSn/P7uFztEHfJo0BLtCwLttrUjr2eSFH4db5A6u6R7hquxD6I9BY7xUGY1hQhu9D8d8bEZd5qye1gAP6P48sCFD4ULTRPJHtPGvUrdhzN2xNge6xotVXuy1RId63cwN40bQ51Gxbs5f/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TK3lcttp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59DIMMLr024035
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 05:39:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1oMp6ReUGAkcuBWeYGGdepJL5VR/gD4ESMqxea/8SyE=; b=TK3lcttpFIRz3G+U
	v/MwFeIIk6gv4Ykggf78sHebrlnhp5UIjF9NTTQRQfdq5IvFE1DuAGhzB3rMMWRy
	bA9pgKfoB15sDv6UBsN0gVrZd2vFwlNVt1Basj8LD1ZVj9/WlytwEx3xtAk/Wa6D
	jDC+XClOjyXkK0GXgf9S2IcpGgjZaeo1mEEP9GjhCBvyiFDiztPma9lUy4KSdNaV
	DRv5ydspvetHfgMOdwmWTL+1yJJ61q1nDIe2468fbILr0DxTu2V/NDoWvYIn8axx
	Khz8hyYiXqghkYGhsBOzSwaiEdbjz6Wo1ycSa0nmukVHCM0qzviiqRt23Itcwsct
	IpGONg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49s6mwhjb9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 05:39:19 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-28bd8b3fa67so81214205ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 22:39:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760420358; x=1761025158;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1oMp6ReUGAkcuBWeYGGdepJL5VR/gD4ESMqxea/8SyE=;
        b=ZmVMBubylqJ92eMqFeOMw0AteD84uNf2rkmcaLB5Ov2F7a8BBvDGhroVfB8yu5VnmV
         oNqWRVIV26zHHxygn7ZeRfvXbZRQtX2A4Wdw1fGh1/6UaeNd4U77azWysHHjGbn85TVo
         C6VXOdWn+1wB813KDEWQbDPvlXHkW2cZNat6McAxfyabU07tXirRbFrHI9eBrQSmf73k
         9/LKYNM9vnfkm37QYwW5sibg5u2OZTxfNqHSxMTJl3LP90sO9IUxCeILX63OIzTZYuLx
         MqB+9j4PxU/L7jKJDltlM7iE8RGckVlm56/1BGdqBoROGh/AR2MiBshRp+lfYiVTbkHX
         ACDA==
X-Gm-Message-State: AOJu0YzX4QKCi0SjU0tOOpXIZgUNVRh0PDzPm80+zRjjZmTd4VUSdSsf
	j5PJo6eAvUmg9GihXHB/EAqrtGSKKqKEjO6WfJcO3mNESn900lR4Km9zVxbsmkEWysgbrXXWV4R
	aZMJi40OD9c2XeysnOvKpUy79aoH9G1/xUzOrRDMs8oJWiF7l7uEEFxJpYNCm5RgDVNbH
X-Gm-Gg: ASbGnctor21sfcFNinCDcGPIfjVXOq/Xi1cX0R5m4LcrTgeN2fyc7g/X4J3eZ6pKEhZ
	pi57UqOf6LVppbBWhcq9eEwQeLki3NpRIsRQ3ex7LJTyF2YLgUiJoy4NxXJlQwmM2Zo69sESXLF
	rFDXRswvsb5P/0B/GgVn4Aoo3jzhXhIfR8xDmrfGrRFzE7YRKuE+HW3HcToKDBHNtJ2E2R1paZF
	jQEosH9mPG4vKUY1SLUF4srTwmDws6q+q0kW0X/ojRnWphOltIffG01E5jmm99xvSnZ7JeYHz3h
	wDO2w5TMvznXIKm2Eb5LfcYSujaadMcN316WP/WmU/RGY2bYIKNXs+HKy1Ie5WDBWEgmrbeipQ=
	=
X-Received: by 2002:a17:902:ce88:b0:26a:8171:daf7 with SMTP id d9443c01a7336-2902723f086mr388952275ad.16.1760420358132;
        Mon, 13 Oct 2025 22:39:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGzNWsTvFSwkJcmErpReie+BnX+Tvcx5O8Z7ZWO1k+OYQIw6XA2734NpxW3Pui5uE9foskOWQ==
X-Received: by 2002:a17:902:ce88:b0:26a:8171:daf7 with SMTP id d9443c01a7336-2902723f086mr388951955ad.16.1760420357620;
        Mon, 13 Oct 2025 22:39:17 -0700 (PDT)
Received: from [10.218.42.132] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f4ae6csm151903735ad.108.2025.10.13.22.39.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 22:39:17 -0700 (PDT)
Message-ID: <e146e351-ec42-4980-b41e-56bfd7dcc0fd@oss.qualcomm.com>
Date: Tue, 14 Oct 2025 11:09:08 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/4] arm64: dts: qcom: Add PCIe 5 support for
 HAMOA-IOT-SOM platform
To: Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, jingoohan1@gmail.com, mani@kernel.org,
        lpieralisi@kernel.org, kwilczynski@kernel.org, bhelgaas@google.com,
        johan+linaro@kernel.org, vkoul@kernel.org, kishon@kernel.org,
        neil.armstrong@linaro.org, abel.vesa@linaro.org, kw@linux.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-phy@lists.infradead.org, qiang.yu@oss.qualcomm.com,
        quic_krichai@quicinc.com, quic_vbadigan@quicinc.com
References: <20250922075509.3288419-1-ziyue.zhang@oss.qualcomm.com>
 <20250922075509.3288419-2-ziyue.zhang@oss.qualcomm.com>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <20250922075509.3288419-2-ziyue.zhang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDA4MyBTYWx0ZWRfX9NhYD+Mzq5E9
 uxCkLAlD+ihgTygOrwsUlApwr71rsV36clkZv8CKYyMTYpu2DKv0d+mgAgwjnUNISIPy15HQlxD
 TIYVuYQ0KLYxdwJhY+DrlEW26+CbE0m/Z70JN0Jgh7J+hibZLmTHQawHEx7zfyvPy89OrxZwUqJ
 ovz0UbsSmpnRSMKBgyDzo86LMfNyZFRdxF8emndKnko8KpMVUqiWSXcXc2hGtsOsnxiuZSTNIIe
 CBhwyy6Xt71O8WHzMa9Z4hRXUaLj3ZTk3SnmfTWYz9AFeQZogsE5dO+WUxF6SX4Rzeq7KfX2EZ1
 AcxJD0t59VwJDBUXhn7C1z9fHErgtE+OxIJQyfoMR8x7AEr8UZSh6s7tTbfY9+d+j4TaQeXMTCu
 IDez8N5qQq9VgNjrXJK37QZAU8Q9tQ==
X-Authority-Analysis: v=2.4 cv=Fr4IPmrq c=1 sm=1 tr=0 ts=68ede207 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=zv_5qE797hUBxoToDSIA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: cg_-N8lrbGT1nnx7tSpVJhVSA36hXWXt
X-Proofpoint-ORIG-GUID: cg_-N8lrbGT1nnx7tSpVJhVSA36hXWXt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_09,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130083



On 9/22/2025 1:25 PM, Ziyue Zhang wrote:
> Update the HAMOA-IOT-SOM device tree to enable PCIe 5 support. Add perst
> wake and clkreq sideband signals and required regulators in  PCIe5
> controller and PHY device tree node.
> 
> Signed-off-by: Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>
Reviewed-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

- Krishna Chaitanya.
> ---
>   arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi | 40 +++++++++++++++++++++
>   1 file changed, 40 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi b/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
> index 1aead50b8920..0c8ae34c1f37 100644
> --- a/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
> +++ b/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
> @@ -407,6 +407,23 @@ &pcie4_phy {
>   	status = "okay";
>   };
>   
> +&pcie5 {
> +	perst-gpios = <&tlmm 149 GPIO_ACTIVE_LOW>;
> +	wake-gpios = <&tlmm 151 GPIO_ACTIVE_LOW>;
> +
> +	pinctrl-0 = <&pcie5_default>;
> +	pinctrl-names = "default";
> +
> +	status = "okay";
> +};
> +
> +&pcie5_phy {
> +	vdda-phy-supply = <&vreg_l3i_0p8>;
> +	vdda-pll-supply = <&vreg_l3e_1p2>;
> +
> +	status = "okay";
> +};
> +
>   &pcie6a {
>   	perst-gpios = <&tlmm 152 GPIO_ACTIVE_LOW>;
>   	wake-gpios = <&tlmm 154 GPIO_ACTIVE_LOW>;
> @@ -477,6 +494,29 @@ wake-n-pins {
>   		};
>   	};
>   
> +	pcie5_default: pcie5-default-state {
> +		clkreq-n-pins {
> +			pins = "gpio150";
> +			function = "pcie5_clk";
> +			drive-strength = <2>;
> +			bias-pull-up;
> +		};
> +
> +		perst-n-pins {
> +			pins = "gpio149";
> +			function = "gpio";
> +			drive-strength = <2>;
> +			bias-disable;
> +		};
> +
> +		wake-n-pins {
> +			pins = "gpio151";
> +			function = "gpio";
> +			drive-strength = <2>;
> +			bias-pull-up;
> +		};
> +	};
> +
>   	pcie6a_default: pcie6a-default-state {
>   		clkreq-n-pins {
>   			pins = "gpio153";

