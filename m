Return-Path: <linux-arm-msm+bounces-75957-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 7226ABB8545
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Oct 2025 00:33:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id F3577348F38
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Oct 2025 22:33:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B9D0274FD0;
	Fri,  3 Oct 2025 22:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k3ToQn1M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0782475D0
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Oct 2025 22:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759530816; cv=none; b=Gqx7we9vTEb5XazsOUpZkh6LLenQGmsLELOglCAeclh8IuKCyyYzuF8snu35hgj+Om3+zcdMEv/sq2/ZQfbSxBci+3X46hDk4RUeSg4oQ3AD6u1oJTjoW8dsZh+O8sgYJpRXpMvPm0Sjd8pCwj/hAei2GBCqIfp1jxqPEdEspoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759530816; c=relaxed/simple;
	bh=c8xSrLBPEZsi8mOVMz2L4a3EPWsxkSplh2VLhh7RLdM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ruQW/wj2RMX5a5VDmKmbSBxcnn7rA+qsKMwz584VuVl0YuugbffLmSLcUBzNUEutE4OCDpbn2Hgs9SkVwlOEksakRIge6DrdASd/rE+pDcTW744PdzLSBQiTN+6+W2eUd8VCzFI2pzeJgGHrFU+bzSPYzXsorprS1CVWVJBEkYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k3ToQn1M; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 593BSwWK022897
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Oct 2025 22:33:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6Y4F//iHLAsR+G0IMOGy3VBF
	/GLgqOiAMCaLQ7uIbkI=; b=k3ToQn1MiZjSrRTp/1woXmPM6h+Er19dDOfpnOdU
	lSpdJUfoivmcHCzA77Pr4TpHLFTfvA3Rpezic4HMMalQ+cvbclZRyKtMO10eaZTM
	XKyh5JBpLYn9ceaHbrTQRydLbK68vr5bfFJjwGXYwYPIynrAbauRpE7Gpww0p0sV
	CRDvFBlllasMHedVwTGjchjr+UZTuL+Yp6K4miK7ile2VqSruAfr3L9LWhrE5ZzV
	FkQRZz8OskPV9UiDKSo46xiBnSTc4lR2ySX3kNn1dCj5Uu9e6gI8gnaa3IvqtgfX
	KZ5u6nIOs4/MuqQoAcl7gbiq50WVcduBx3z3jYfa2qXCfg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e59ncfh9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Oct 2025 22:33:32 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4e0e7caf22eso75454741cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Oct 2025 15:33:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759530812; x=1760135612;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Y4F//iHLAsR+G0IMOGy3VBF/GLgqOiAMCaLQ7uIbkI=;
        b=cUOGB6TEfthLmHzA+1alYxXzsTbJrAT6nycLJ/enATzAVVJ4JkLObaQwtvKLb70sda
         9YklSePrP7RsbXss5MqQU9W/ycC0p1kFnKA6Z7rbEq9d4jYU55al5+GGZcQ7uEAsFhj+
         zQYnB0jILlJYZkTrZ5fPrYig4HyqY0rx/54fjsWMxavJd+/1I0WEhCO61uPaNzrqGfQ+
         FNriulaa8UfQbKwDtBszoqSco94xcvZFffz++7E/bAuVC5U4BKYK47PpGnt3kMGC8/J0
         bzwjSIg1C7betvCuppKzhCTRCxASUhGMuYX3z1d70HGSfNU0Ns4ubIO7WVcDaf2EB1uw
         Wi3Q==
X-Forwarded-Encrypted: i=1; AJvYcCU3dpGNFNSDnBBo7VB3zoll4RpeKEALVOdDoRjmQo31jnEKcj+kz/hwxRA2WlNb3f0AFdrAfjedq0aOceot@vger.kernel.org
X-Gm-Message-State: AOJu0YxsNDS9O35Q0OYb4HiqKL4k1ZpMw21AGfEore90ZNjDKsav0pgb
	imjnV9PCJpeafR8wqpXqzKNyqtKw9Qk7FXr6YmLLE9JpnV6oZgyPDBjGz3CVo7c7FVlk/+D18PR
	GAgrA5GZEh8GbzUGfWLzojHI7PKVqo/Ph/Mrsde/zbctlt9VdnHXX3xNeB/6ju3cl8YSN
X-Gm-Gg: ASbGncsxdn86Xs6Wng768jk+DTqgUUCmTJGNQA+ONGJWv7ahelTA0x5qRbvlR/BlaBM
	HBvs8K9nYXqCUZ3V/MiqIgpSmXjaPVVuNr10vDOUyQfxQj5iYf3Rtfol0hpKFihXlrpQAx8aW/q
	afyDcS1kemkK2mZjEFchHhVqwvCQr7gzXqG9zYiDltrJIY7wGfdzb7QfA2KeFKQGKQTWayZ/R5g
	XpgcGExT4RBliMJEK+jU+N0+enFEPpz5+eWYFHjjLDrFZWwNxjk6UH6TClzTn+1aCciYHGaHvKv
	oYseKTVBJv9jCsVl3upuizOTu25BHmsJdJEMfcNuUbojhAUWOKDiqe0NeK56iV9TGgrPosKNkRZ
	XCEZLEC3s+YPSgb/kEk4X3OrTgNtNHd10e0ITBqP8uDstcczhXrWVkMN6PA==
X-Received: by 2002:a05:622a:1344:b0:4b7:a8ce:a416 with SMTP id d75a77b69052e-4e576a7b744mr64829941cf.24.1759530811666;
        Fri, 03 Oct 2025 15:33:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGn2bJnyKOInrEHOD8MFIsLq9WFcFcabDqb5urdGikf2oY/QBMkqU4XgOty/PdlV8LNbvKdVQ==
X-Received: by 2002:a05:622a:1344:b0:4b7:a8ce:a416 with SMTP id d75a77b69052e-4e576a7b744mr64829521cf.24.1759530810890;
        Fri, 03 Oct 2025 15:33:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b01141f09sm2207021e87.62.2025.10.03.15.33.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 15:33:29 -0700 (PDT)
Date: Sat, 4 Oct 2025 01:33:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jingzhou Zhu <newwheatzjz@zohomail.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: Add support for Huawei MateBook
 E 2019
Message-ID: <pbrrkfjrqoyj4qspdrordksfueyqejxcsz2oxqctczeoll6ywn@ixpaa6v4mwlv>
References: <20251001142107.21860-1-newwheatzjz@zohomail.com>
 <20251003131925.15933-1-newwheatzjz@zohomail.com>
 <20251003131925.15933-3-newwheatzjz@zohomail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251003131925.15933-3-newwheatzjz@zohomail.com>
X-Proofpoint-GUID: QwAU0M8i9L2WjpkHMYeBSi7sDp0vnTYM
X-Authority-Analysis: v=2.4 cv=O4g0fR9W c=1 sm=1 tr=0 ts=68e04f3c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=WV1l7McVAAAA:8 a=90yxgAhdmVl2AmlIJZIA:9
 a=CjuIK1q_8ugA:10 a=dK5gKXOJidcA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=ly-PvpxawfTmY1UqWLBn:22
X-Proofpoint-ORIG-GUID: QwAU0M8i9L2WjpkHMYeBSi7sDp0vnTYM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAwMSBTYWx0ZWRfX4W88NSbexZ6w
 qfD4Ww+7lX2bdwFLdhfqh6Vxymu/zR3e7UE0FUBd2Okzq9ePK3ojBA6wQLihsu80d7Rz+S7u5BU
 JYCgcKlesUWM83czl0uZhiO98gipvHomTglwaOxEGGiqY4XL70NEdQ8N4bR6E3naqJl8NiyvpgN
 rg5oT3bSTlCz7/59G6i5PQl7FdlwM3VdXNB68fvxnPAt+KnUvkCKpXunQjX3czknRmILZABAY5q
 PczhFAT04TsYwfie7fb7oUE6EFFmrt/46fvDXpuCZ92sewjQTAOeb09nRfw0u7O6AFk3QKrCaWn
 ZfVgJttBnnvSwh8WrKRSU8k9+qYXFikFIAAglKzdONCfrh2xle9cc61FOIywneDrGXO1zOVkPXw
 PR9pKbhQgZ1vnGZOwKEuFzMmzeojkA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-03_07,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270001

On Fri, Oct 03, 2025 at 09:19:25PM +0800, Jingzhou Zhu wrote:
> Add device tree for Huawei MateBook E 2019, which is a 2-in-1 tablet based
> on Qualcomm's sdm850 platform.
> 
> Supported features:
>  - ACSP, CDSP and SLPI
>  - Volume Key
>  - Power Key
>  - Tablet Mode Switching
>  - Display
>  - Touchscreen
>  - Stylus
>  - WiFi
>  - Bluetooth
>  - GPU
>  - USB
>  - Keyboard
>  - Touchpad
>  - UFS
>  - SD Card
>  - Audio (right internal mic and headphone mic not working)
>  - Mobile Network
> 
> Features not supported yet:
>  - Panel Backlight
>  - Lid Detection
>  - Battery
>  - EFI Variable Access
>  - Cameras
> 
> 1. Panel backlight, lid detection and battery will be supported with the
>    EC driver upstreamed.
> 2. EFI variables can only be read with the QSEECOM driver, and will be
>    enabled when the driver is fixed.
> 3. Cameras are tested to work with modified downstream driver, and once
>    drivers for these camera modules are included in the tree, cameras can
>    be enabled.
> 
> Features won't be supported:
>  - External Display
>  - Fingerprint
> 
> 1. To make external display work, more reverse engineering may be required,
>    but it's beyond my ability.
> 2. Fingerprint is controlled by TrustZone, meaning direct access to it
>    isn't possible.
> 
> Signed-off-by: Jingzhou Zhu <newwheatzjz@zohomail.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |   1 +
>  .../qcom/sdm850-huawei-matebook-e-2019.dts    | 962 ++++++++++++++++++
>  2 files changed, 963 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/sdm850-huawei-matebook-e-2019.dts
> 
> +
> +	vph_pwr: regulator-vph-pwr {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vph_pwr";
> +
> +		regulator-min-microvolt = <3700000>;
> +		regulator-max-microvolt = <3700000>;
> +
> +		regulator-always-on;
> +	};
> +
> +	vlcm_3v3: regulator-vlcm-3v3 {

vlcm < vph

> +		compatible = "regulator-fixed";
> +		regulator-name = "vlcm_3v3";
> +
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +
> +		gpio = <&tlmm 88 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		vin-supply = <&vph_pwr>;
> +	};
> +


> +
> +&gpu {
> +	status = "okay";
> +	zap-shader {

empty line between properties and subnodes

> +		memory-region = <&gpu_mem>;
> +		firmware-name = "qcom/sdm850/HUAWEI/AL09/qcdxkmsuc850.mbn";
> +	};
> +};
> +
> +&i2c5 {
> +	clock-frequency = <400000>;
> +	status = "okay";

Nit: please add empty line before status property (here and further)

> +
> +
> +&pm8998_gpios {
> +	sw_edp_1p2_en: pm8998-gpio9-state {

Up to you, but there is no need to prefix them with the pmm8998-.

> +		pins = "gpio9";
> +		function = "normal";
> +
> +		bias-disable;
> +		qcom,drive-strength = <PMIC_GPIO_STRENGTH_NO>;
> +	};
> +
> +	volume_up_gpio: pm8998-gpio6-state {
> +		pins = "gpio6";
> +		function = "normal";
> +
> +		input-enable;
> +		bias-pull-up;
> +		qcom,drive-strength = <PMIC_GPIO_STRENGTH_NO>;
> +	};
> +};
> +
> +
> +&tlmm {
> +	gpio-reserved-ranges = <0 4>, <81 4>;
> +
> +	cam_indicator_en: cam-indicator-en-state {
> +		pins = "gpio12";
> +		function = "gpio";
> +
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
> +	mode_pin_active: mode-pin-state {
> +		pins = "gpio79";
> +		function = "gpio";
> +
> +		bias-disable;
> +	};
> +
> +	sn65dsi86_pin_active: sn65dsi86-enable-state {

Please sort these too (by the name, not by the label.

> +		pins = "gpio96";
> +		function = "gpio";
> +
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
> +	i2c5_hid_active: i2c5-hid-active-state {
> +		pins = "gpio125";
> +		function = "gpio";
> +
> +		drive-strength = <2>;
> +		bias-pull-up;
> +	};
> +
> +&wifi {
> +	vdd-0.8-cx-mx-supply = <&vreg_l5a_0p8>;
> +	vdd-1.8-xo-supply = <&vreg_l7a_1p8>;
> +	vdd-1.3-rfa-supply = <&vreg_l17a_1p3>;
> +	vdd-3.3-ch0-supply = <&vreg_l25a_3p3>;
> +	vdd-3.3-ch1-supply = <&vreg_l23a_3p3>;
> +
> +	qcom,snoc-host-cap-8bit-quirk;
> +	qcom,calibration-variant = "Huawei_Planck";

Did you post the board data to the ath10k@ mailing list?

See https://wireless.docs.kernel.org/en/latest/en/users/drivers/ath10k/boardfiles.html


Also if possible, please include output from BT and WiFi probing to the
commit message.

> +
> +	status = "okay";
> +};
> -- 
> 2.47.3
> 

-- 
With best wishes
Dmitry

