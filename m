Return-Path: <linux-arm-msm+bounces-74015-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E998B82B72
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 05:13:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 361817203DF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 03:13:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95A8C225A3D;
	Thu, 18 Sep 2025 03:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b6xQEeZF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C285823BD05
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 03:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758165225; cv=none; b=j1AIY18xGbHU52mv6ijFCXq1GIT8EQr5sEn/lZIYUb2/tdT+iFs9DXbG/MIaI/4QgLDKvtc2zimUczsdEInAkDDWwUOmZf8r7rNVrcg1fFf+vukHaF3W1s06N5bBSlo2XiSAgFwXViKaOG+ybv1pPvsNO8gW5InxNSU4GMOFduQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758165225; c=relaxed/simple;
	bh=YLB9N6gmZttqN3dj9DYbtbL07ZYsi0AMIlIAGL/E+k4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o/kfotw3ndXQMal+qoQ0YO+HqicMELxHm67tpr9bdenFYaHFt5DMMJUYsV4RyulMmGmd2pBFo533CjxZNftK6PsNl2ZDTaVH4x+YJkltxlOaRO2B+6Los0xW/dzSObL9iITjDDmNiBFeB3BW0MUcO5DAVrR8mbk+n9pauK3aIT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b6xQEeZF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58HKoxpV027403
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 03:13:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JgXnef439whcjQWQt/wpg0NP
	2fjWk4IePfL9cL2LWx8=; b=b6xQEeZFPRUsItf8+BB/QukLtZThsC2RiRFyFPXl
	a+vSTRR+0c7SFQkjdnJVClPjdZjxqLcLSQ8ZyGwNFsWwQmWpkBnqKJaUpUTkkKsM
	DOpAa+KMNjm6ca7L/G3sPKmuwCywajEd6SWvTITUFtOZC3AmoCtvwuwGnYpNc/58
	E5whdDcvHay8+x6hZ/Fu5jCtZeASn+8nLb7K1mcsn07M0WFUcRWuyP39IWi9f60c
	3HEuIBYiXE2iU4OJHcEt0rHUdyFfQJACoInixMa0C2lHSZdtI8Z/ErYLMVzLkioO
	MrTYiiylQefq74fve1M2NXxzegczRB02qvhEXlgZeosMog==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497v1janct-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 03:13:42 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b5eb7b2c05so8223711cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 20:13:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758165221; x=1758770021;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JgXnef439whcjQWQt/wpg0NP2fjWk4IePfL9cL2LWx8=;
        b=AXK2uuGlfEDvHHtKLRo3f/0G3MZavESUZI05mkVE6gDmltwqU73eFNw6sSWjkYyZ1q
         mGC4/NWiOZ5KScrgJUuG3Uo4jSw6XwQK1XZZMYkikAWQkF843ls0TfHJmvGkBe/1Ek5L
         pWQM+AomPHSUuE8tzcWfFIJcc69/m5bX+MPX0cKsEoz2CA6lW90jbRrTyhKwAbWQ4tta
         MIhOtN2t/gbRHnOBFr+lUPW5wOu9qXVW0BYnvhsum0cgJYbzVyMBKEnfr6iqXoU7+jIH
         XpTlsC6iVzFIM09ak3hnH3oa97NV/1dU76QpMMiBOcrgpIUa41ruBmIyXHDwmWJFKkro
         ubFw==
X-Forwarded-Encrypted: i=1; AJvYcCW5z+cFnONEahHIt/6/BAVQ7Ajqi2Li5jlfCB18vMI6Wb1k6QXApIDiHy64g1Mchque3/NCl8PvQHxJ8sn+@vger.kernel.org
X-Gm-Message-State: AOJu0YythORJlwCQvAoKMx3w51rTMM8cYML+RaZbh3AXaGGVCRCSfnY3
	IGp2Zq+v4wrdj/0QG2+gqREWkYK7mSo6cw9UNwS7Mt6zbZcY3t2YfNmWwCQGEDbaJlapkKsU+dn
	VI9w9gk9cwn2+WNMyIRS7qWeq2RKrNSueM/HSJwv4bIVzBZdoAA2u9REsbudIFLerJVHb2VIDXL
	cq
X-Gm-Gg: ASbGncuwW4HgwyISbQ4PB4PYSBPyA1W2l6Ba43YLRdSQ4LcbXXMyNTzO65Oh8WA/MAM
	jEbPdjtwzRpm+JBCNhCRjFj/QybN3iVDCwaV3w0vX4bpXyg9DiTsU9ilbzDHJDgvTEUHwjLuNci
	lfIyDJQyjeb6TCru0oyUSpdiiWiPB51z7uMnCp9K68UQjAPo7JkVeRxLOlB1K/OV3LfbrWbD23K
	mUKXvzKDt+lM2PPN7X9isTi6E4RF4MI1Bwy2PB0flQXYg6m/ebu3FXbzuXScbief7baQHwSgPT1
	4ffmgGrMsCdRFN8BRooSJZk6k2NdaerDu4whCIeoP6LLpGELxk1up0iMgIKIxO2UkM1t3xldHlx
	/tN0wIbHSqqvs3kPcTwRKku4VaJneY1suKIAsOEGrjc4S2BgxXiPH
X-Received: by 2002:a05:622a:2309:b0:4b7:a901:19bc with SMTP id d75a77b69052e-4ba6a5db7b0mr59701741cf.41.1758165221272;
        Wed, 17 Sep 2025 20:13:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHnefb5Hxfw/Z0HHsqSJG0jMtUgeRbad0eX9dMseGcUg0UdFsWs5oM9xS/vJyeGJd9w0effRw==
X-Received: by 2002:a05:622a:2309:b0:4b7:a901:19bc with SMTP id d75a77b69052e-4ba6a5db7b0mr59701451cf.41.1758165220724;
        Wed, 17 Sep 2025 20:13:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-578a5f44a6asm322233e87.30.2025.09.17.20.13.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 20:13:40 -0700 (PDT)
Date: Thu, 18 Sep 2025 06:13:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Paul Sajna <sajattack@postmarketos.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Amir Dahan <system64fumo@protonmail.com>,
        Christopher Brown <crispybrown@gmail.com>
Subject: Re: [PATCH v2 01/13] arm64: dts: qcom: sdm845-lg-common: Sort nodes
 and properties
Message-ID: <jpk3nsf3ol2s7vtn3qtrd7tqvk6n26pqjwuxngrut42tdhupp5@2a67whu3bkyg>
References: <20250916-judyln-dts-v2-0-5e16e60263af@postmarketos.org>
 <20250916-judyln-dts-v2-1-5e16e60263af@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250916-judyln-dts-v2-1-5e16e60263af@postmarketos.org>
X-Proofpoint-ORIG-GUID: m-fjWmih-q_pfzbshri9hQZVaYDcRqCD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE3MDExMCBTYWx0ZWRfX3HQsgdiAuGLG
 A4GH2SiSgz1dZB7j6cvycwoWd7IoCJ1Q+eOem0mg0z79OD0eSikfvkh9kHFTkPEl9GBlNp1UUuz
 Jc7It+oM7HyCszqh3GBpSIaHSQfWRbYcLJ4Qv+kFj/DxrFxCGNiE8h0pOFix22DGR4FfUkSYq5j
 HQcugb4We+kF5AB2EZVSRDtb+TvT1gNgoRsV+CHqf8/m/EVcwlbCOEHprl+UEapXqe+pS1GHgUZ
 F85ysDTkxqLt5uEKpPc2tEKy2BpYdl8hs/qtFt7MRgVcPXcjhEYNvxQ5UgdL0aIkdr3Q2lP/qBt
 k6Gnf92tWPuj7zIWcDonDhzl7r0DIDKVmAQB2zFIlue65XWlrTiEeX7FCOP7yKuuuHkiNCJ7XUE
 siMCK47e
X-Authority-Analysis: v=2.4 cv=AeqxH2XG c=1 sm=1 tr=0 ts=68cb78e6 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=Gbw9aFdXAAAA:8 a=irCUxjHa2X11G76fGokA:9
 a=CjuIK1q_8ugA:10 a=5XHQ0vS7sDUA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-GUID: m-fjWmih-q_pfzbshri9hQZVaYDcRqCD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509170110

On Tue, Sep 16, 2025 at 06:09:47PM -0700, Paul Sajna wrote:
> in accordance with:
> https://docs.kernel.org/devicetree/bindings/dts-coding-style.html

Please don't continue commit subject into commit message. It should be a
separate complete text.

> 
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 124 ++++++++++++-------------
>  1 file changed, 62 insertions(+), 62 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> index 99dafc6716e76e25aad0755e6004dc952779689f..82d6543835324ed92300c4ed24c51f4b79321f99 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> @@ -38,11 +38,6 @@ reserved-memory {
>  		#size-cells = <2>;
>  		ranges;
>  
> -		qseecom_mem: memory@b2000000 {
> -			reg = <0 0xb2000000 0 0x1800000>;
> -			no-map;
> -		};
> -
>  		gpu_mem: memory@8c415000 {
>  			reg = <0 0x8c415000 0 0x2000>;
>  			no-map;
> @@ -99,6 +94,11 @@ memory@9d400000 {
>  			no-map;
>  		};
>  
> +		qseecom_mem: memory@b2000000 {
> +			reg = <0 0xb2000000 0 0x1800000>;
> +			no-map;
> +		};
> +
>  		/* rmtfs lower guard */
>  		memory@f0800000 {
>  			reg = <0 0xf0800000 0 0x1000>;
> @@ -482,14 +482,22 @@ &mss_pil {
>  	status = "okay";
>  };
>  
> +&pm8998_gpios {
> +	vol_up_pin_a: vol-up-active-state {
> +		pins = "gpio6";
> +		function = "normal";
> +		input-enable;
> +		bias-pull-up;
> +		qcom,drive-strength = <PMIC_GPIO_STRENGTH_NO>;
> +	};
> +};
> +
>  &pm8998_resin {
>  	linux,code = <KEY_VOLUMEDOWN>;
>  	status = "okay";
>  };
>  
>  &sdhc_2 {
> -	status = "okay";
> -
>  	cd-gpios = <&tlmm 126 GPIO_ACTIVE_LOW>;
>  
>  	pinctrl-names = "default";
> @@ -497,55 +505,8 @@ &sdhc_2 {
>  
>  	vmmc-supply = <&vreg_l21a_2p95>;
>  	vqmmc-supply = <&vddpx_2>;
> -};
> -
> -/*
> - * UFS works partially and only with clk_ignore_unused.
> - * Sometimes it crashes with I/O errors.
> - */
> -&ufs_mem_hc {
> -	status = "okay";
> -
> -	reset-gpios = <&tlmm 150 GPIO_ACTIVE_LOW>;
> -
> -	vcc-supply = <&vreg_l20a_2p95>;
> -	vcc-max-microamp = <600000>;
> -};
> -
> -&ufs_mem_phy {
> -	status = "okay";
> -
> -	vdda-phy-supply = <&vdda_ufs1_core>;
> -	vdda-pll-supply = <&vdda_ufs1_1p2>;
> -};
> -
> -&usb_1 {
> -	status = "okay";
> -};
> -
> -&usb_1_dwc3 {
> -	/* TODO: these devices have usb id pin */
> -	dr_mode = "peripheral";
> -};
> -
> -&usb_1_hsphy {
> -	status = "okay";
> -
> -	vdd-supply = <&vdda_usb1_ss_core>;
> -	vdda-pll-supply = <&vdda_qusb_hs0_1p8>;
> -	vdda-phy-dpdm-supply = <&vdda_qusb_hs0_3p1>;
> -
> -	qcom,imp-res-offset-value = <8>;
> -	qcom,hstx-trim-value = <QUSB2_V2_HSTX_TRIM_21_6_MA>;
> -	qcom,preemphasis-level = <QUSB2_V2_PREEMPHASIS_5_PERCENT>;
> -	qcom,preemphasis-width = <QUSB2_V2_PREEMPHASIS_WIDTH_HALF_BIT>;
> -};
>  
> -&usb_1_qmpphy {
>  	status = "okay";
> -
> -	vdda-phy-supply = <&vdda_usb1_ss_1p2>;
> -	vdda-pll-supply = <&vdda_usb1_ss_core>;
>  };
>  
>  /* PINCTRL - additions to nodes defined in sdm845.dtsi */
> @@ -586,12 +547,51 @@ sd_card_det_n: sd-card-det-n-state {
>  	};
>  };
>  
> -&pm8998_gpios {
> -	vol_up_pin_a: vol-up-active-state {
> -		pins = "gpio6";
> -		function = "normal";
> -		input-enable;
> -		bias-pull-up;
> -		qcom,drive-strength = <PMIC_GPIO_STRENGTH_NO>;
> -	};
> +/*
> + * UFS works partially and only with clk_ignore_unused.
> + * Sometimes it crashes with I/O errors.
> + */
> +&ufs_mem_hc {
> +	reset-gpios = <&tlmm 150 GPIO_ACTIVE_LOW>;
> +
> +	vcc-supply = <&vreg_l20a_2p95>;
> +	vcc-max-microamp = <600000>;
> +
> +	status = "okay";
> +};
> +
> +&ufs_mem_phy {
> +	vdda-phy-supply = <&vdda_ufs1_core>;
> +	vdda-pll-supply = <&vdda_ufs1_1p2>;
> +
> +	status = "okay";
> +};
> +
> +&usb_1 {
> +	status = "okay";
> +};
> +
> +&usb_1_dwc3 {
> +	/* TODO: these devices have usb id pin */
> +	dr_mode = "peripheral";
> +};
> +
> +&usb_1_hsphy {
> +	vdd-supply = <&vdda_usb1_ss_core>;
> +	vdda-pll-supply = <&vdda_qusb_hs0_1p8>;
> +	vdda-phy-dpdm-supply = <&vdda_qusb_hs0_3p1>;
> +
> +	qcom,imp-res-offset-value = <8>;
> +	qcom,hstx-trim-value = <QUSB2_V2_HSTX_TRIM_21_6_MA>;
> +	qcom,preemphasis-level = <QUSB2_V2_PREEMPHASIS_5_PERCENT>;
> +	qcom,preemphasis-width = <QUSB2_V2_PREEMPHASIS_WIDTH_HALF_BIT>;
> +
> +	status = "okay";
> +};
> +
> +&usb_1_qmpphy {
> +	vdda-phy-supply = <&vdda_usb1_ss_1p2>;
> +	vdda-pll-supply = <&vdda_usb1_ss_core>;
> +
> +	status = "okay";
>  };
> 
> -- 
> 2.51.0
> 

-- 
With best wishes
Dmitry

