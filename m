Return-Path: <linux-arm-msm+bounces-78872-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E34F5C0D2A5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 12:36:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 773DC3BFAC8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 11:35:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 553E52F99BD;
	Mon, 27 Oct 2025 11:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZQyQc2T2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A47B72F747C
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 11:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761564951; cv=none; b=P07Y4lal6sHOkKS2/p+aI+7yH4cxiMKMvpKauIdsNstIYqIicHk/uUGyqeeJe2okXUqgDc2Od2kn3wyF+wPow9rSBFGb3oSxonHreUt0PLsA7VtsF8VCdyeNcjPbXnbolMCIaqzyPizKq/6xA2yAuHMQZcpQCd6L4v/ZTK2zCB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761564951; c=relaxed/simple;
	bh=z8JMmtO5pPNwnHupK7VV8WcW+3BYrdml7mecpOldSXc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FMU9iVim9Me/8t1KhTVs+Qoo8aRqcpAmFkjQUaHeybbwiskjOCCn7wc4k8lh0T9GI/x/P5SP4LzPIsKo7Lz5h0Hp/bUiS29uKght9uP/wMU8ljFReaeimKLXcUq7H4wPDtlk5HhJ0t+8aBLDoQKP78j28jhIALdL6BRB+uUMf6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZQyQc2T2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59R8xIEw1164950
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 11:35:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TU1kj7nq4ocDun8TqNLhxKbF9wpc+NkFZouW7rYkBz0=; b=ZQyQc2T2h+tLoAgm
	qVrNqEsapCOLmOefQnrDW29hYm4RtSy/thpCiCtKRfBzVHdXiaiEgvdutlY+Ejzu
	yaZB7NQ7BME+hmTKQeaf21gEqWRmDlvTyZCnCzjX02PIANnul5Q3X2qpFBXrgPxB
	/pwAyNibDmGh9lRQQMTVD1pVjAoea8QBRpz+uc4kKazHVfpZ9SnrYz3R2kF6XeWC
	CJc0nQ3JYmBYz1Kq4wdonvPzZF+9ERQUSQ/IS/C7BMytg6SaZ2LPN7i37MwWXOIJ
	E3Tze/89WmpLnx0jJ3/56yDIQ6fq3p2dRdq9m9FSr7YFab7rCLgWZwGt3rELKOOO
	ln8SyQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a0p4g4cfx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 11:35:48 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-87dfd456d01so13944396d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 04:35:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761564948; x=1762169748;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TU1kj7nq4ocDun8TqNLhxKbF9wpc+NkFZouW7rYkBz0=;
        b=mkf0N4wOUtXs1j3K8JLAblU2MZl8gcA+b0LG+C8TKtA0alCzrjbkJflgCfVi/7KOw2
         J7jeZwarmLVPhSpYfBB1K1SD/E4Lt4FW/Zx6uhkUkbSd+0E78fIevsN76BWvbXdb4f13
         6X9F/TSTRxKzFe7FjTRD6SOkHM7KCNFO/k66IZXU0NingHpKpyMxkZ4lTedAb5icfv/6
         sXx1YWZYSEFdEq1QhCLHhQpp9SXPcL/ocOxKY5LZCcU8KiKqQL8ilA9BvWF8YhK5xWMp
         qZZi5Kgc6ia9MQ8brSARqRTmCMWlVmqCmJdL/QKmssMwQzmYjdQNl/eaPk4t3BCeoAd+
         Y8tQ==
X-Forwarded-Encrypted: i=1; AJvYcCXvw554YjryQb64jGVb1GuDjn4R1E7JaxwQFF+5recx9+xH/pBmGN6MqvWHDCQaSvf7N4WKgruTJ8m9KKfI@vger.kernel.org
X-Gm-Message-State: AOJu0Yxc+sY9LuCvniM+7uEHYTr0m0R1N2og+EayeGCKM0sJjzfIFHvv
	nSoVjrEDlIlzyicz6Y49LXrtIIaQMnnT1EDJSPFF/Msx49FuiLOnXDML4ZsKUdzK7tNt+4eYZdE
	1BSr9I1iFVTCibKNb9wlkUYRrc2x7I/OWpeRO+UF2UF1jnV9t4tk3DYvjB7lmV/di/TJI
X-Gm-Gg: ASbGncuLJxUCz/c3udwmcJjvUAhBFlCdiTjuIgyfoj0bf1RD3KGWkR+G+ciBRd7Y4rv
	kc9EkLs2/WWbCCAcxmBOJUsHIegre25hplsimCOUxjiLU5JBVvLhIYgxHoCyR7JPYUOEUlSIBBr
	wpYEuXLytFG+yvV/qMVFWHFn/xlos/V/zMkVkmmPLEt7qW4d9JPz+/pz5nXo7KkaMbHmoX5SfzV
	aEkhdc89Jiej6l3f4Tq+MLSjnPirL2EtSxKH7mgz9RvWjEtfoqpsWyWA/v61VVAiVgdex30+//X
	PA95O2YFTqKrGcZTwgWJw4FEfVQDn4xICmy0rXUtYknkEMbUG9BEe5XDgF3qETE+njmYNx2pKnw
	RklA0WIo849XgMZKkOnzvrz05txmT9BGH0qzm1Kv7TGlHJkYhaB9woHJP
X-Received: by 2002:ad4:5de6:0:b0:87c:19b6:398e with SMTP id 6a1803df08f44-87de70b4724mr201372666d6.2.1761564947776;
        Mon, 27 Oct 2025 04:35:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG1KFM9AHLmnI7IFMN2DcxC11NSgWpPMDkmEheNEQeOvudyiBGTHMvMjndvOo4TT8fYmLKjJA==
X-Received: by 2002:ad4:5de6:0:b0:87c:19b6:398e with SMTP id 6a1803df08f44-87de70b4724mr201372356d6.2.1761564947284;
        Mon, 27 Oct 2025 04:35:47 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63e7ef6c0e9sm6005786a12.1.2025.10.27.04.35.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Oct 2025 04:35:46 -0700 (PDT)
Message-ID: <ccdd5d44-2382-44e9-a56d-cbc5da23b13f@oss.qualcomm.com>
Date: Mon, 27 Oct 2025 12:35:44 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm8150: Add support for Xiaomi
 Redmi K20 Pro
To: Piyush Raj Chouhan <pc1598@mainlining.org>, linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, tony.luck@intel.com, gpiccoli@igalia.com
References: <20251022054026.22816-1-pc1598@mainlining.org>
 <20251022054026.22816-2-pc1598@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251022054026.22816-2-pc1598@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 35S1hIipW2Kym5v2tIWfTsBEkzCH2DkJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDEwOCBTYWx0ZWRfX2n4HAYzUQdxL
 z6m/Co4h77mo4V/VIFkt7Ech2mX6pAf55aCbFj6uOseJ3eOV5xi2uvjpVuWo2R+IMT92H1SpVnx
 rksDG07UMXQIsw73vLiumoe6P4B+g9aXGGbfXcwD0KWWjD5aDdKIdDbbVBGreN0IxBCiSO8WtGo
 W/ozZvnP60rAUWucjezztTjvJsTxk9tujyG9eiG0Dc0QDzXkgJua/lrGYAdCKaVCA7FbpxFvxo+
 hYPN/S/Y4TXi+VwThFU2uHAsUE3LDcbU0Z5iN6tcdoHEB/uoWfYPWWlXaKENN1TB+bCus65RAgd
 1SvTx6P/g/XBze/3BC7hWZI9HrA6plJMrrZ2LF6MKNGs0crA6gc+Qy7PPdkaB0kLR6620WJ1BGN
 pvtMm+IOt3EuPC/ig1ZOOCf8GRBLPw==
X-Authority-Analysis: v=2.4 cv=L9YQguT8 c=1 sm=1 tr=0 ts=68ff5914 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=iRxBnbZjw3uyMlr8g3cA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: 35S1hIipW2Kym5v2tIWfTsBEkzCH2DkJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_05,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510270108

On 10/22/25 7:40 AM, Piyush Raj Chouhan wrote:
> Add initial device tree support for the Xiaomi Redmi K20 Pro/ Xiaomi Mi 9T Pro
> (codename raphael), based on the Qualcomm SM8150 (Snapdragon 855)
> platform.

[...]

> +		ramoops@a1600000 {
> +			compatible = "ramoops";
> +			reg = <0x0 0xa1600000 0x0 0x800000>;
> +			console-size = <0x400000>;
> +			pmsg-size = <0x200000>;
> +			record-size = <0>;
> +			ftrace-size = <0>;
> +			ecc-size = <0>;
> +			no-map;

You can probably remove the = 0 entries (although ECC is very useful
to set to e.g. 8)

[...]

> +	gpio-keys {
> +		compatible = "gpio-keys";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&vol_up_n>;

property-n
property-names

in this order, please, file-wide


> +		/*
> +		 * PM8150 LDO8 (L8A) — supplies vreg_l8a_0p75
> +		 * Device spec: nominal 0.752 V, active min 0.752 V, active max 0.904 V, IRATED = 300 mA

Hm?

[...]

> +&gpu {
> +	zap-shader {
> +		memory-region = <&gpu_mem>;
> +		firmware-name = "qcom/sm8150/xiaomi/raphael/a640_zap.mbn";
> +	};
> +
> +	status = "okay";

This shouldn't compile

[...]

> +};
> +
> +&i2c19 {
> +	/* goodix,gt9886 @5d  */

I see there's driver support for the GT98*97* - is there a chance you can
reuse some of it?

> +};
> +
> +&mdss {
> +	status = "okay";
> +};
> +
> +&mdss_dsi0 {
> +	vdda-supply = <&vdda_mipi_dsi0_1p2>;
> +
> +	status = "okay";

Please add a newline between this property an the following subnode

[...]

> +&pm8150b_typec {
> +	vdd-vbus-supply = <&pm8150b_vbus>;
> +	vdd-pdphy-supply = <&vdda_usb_hs_3p1>;
> +
> +	status = "okay";

ditto

> +	connector {
> +		compatible = "usb-c-connector";
> +		power-role = "source";
> +		data-role = "dual";
> +		self-powered;
> +
> +		source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_DUAL_ROLE |
> +					 PDO_FIXED_USB_COMM | PDO_FIXED_DATA_SWAP)>;

Have you verified this is in line with your specific device's
downstream kernel?

[...]

> +&pm8150l_flash {
> +
> +	status = "okay";

ditto

[...]

> +&pm8150l_lpg {
> +
> +	status = "okay";

ditto> +	led@1 {
> +		reg = <1>;
> +		color = <LED_COLOR_ID_WHITE>;
> +		function = LED_FUNCTION_STATUS;
> +
> +		status = "disabled";

?

> +	};
> +
> +	led@2 {
> +		reg = <2>;
> +		color = <LED_COLOR_ID_RED>;
> +		function = LED_FUNCTION_STATUS;
> +		function-enumerator = <0>;
> +	};
> +
> +	led@3 {
> +		reg = <3>;
> +		color = <LED_COLOR_ID_RED>;
> +		function = LED_FUNCTION_STATUS;
> +		function-enumerator = <1>;
> +	};

Are there really two separate red LEDs?

[...]

> +	/* GPIO 0..3 are NFC spi, gpios 126..129 are FP spi */
> +	gpio-reserved-ranges = <0 4>, <126 4>;
> +
> +	/* Display panel pins */
> +	panel_reset_pin: panel-reset-state {
> +		pins = "gpio6";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +		output-low;

Please drop output- properites from TLMM subnodes, these are controlled by
the kernel's GPIO framework instead

[...]

> +&usb_1_dwc3 {
> +	dr_mode = "otg";
> +	maximum-speed = "high-speed";
> +
> +	/* Remove USB3 phy */
> +	phys = <&usb_1_hsphy>;
> +	phy-names = "usb2-phy";

Is this a physical limitation, i.e. missing wires?

> +
> +	usb-role-switch;

This property should be moved to the SoC DTSI

Konrad

