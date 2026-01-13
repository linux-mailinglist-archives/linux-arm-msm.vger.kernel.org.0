Return-Path: <linux-arm-msm+bounces-88758-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B46C6D1840F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 11:58:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D2A73301C375
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 10:53:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BE3438A9C2;
	Tue, 13 Jan 2026 10:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eCBqg9kC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hW2bOFkQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D30538A729
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 10:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768301542; cv=none; b=dVVZTDIociO7ejO7vcHBE7Tf8WxrOuaR31v/JJpsDKUNNTDzpyqfYr7EcSfeamdKa8QX83UmpdDRT3AqICdXse8FoT0aK4Lrn63NcOrSxIHJ3lz6YsGiQ1hGpyMSHqdt3rMn8NnZ7yNZdUcWKeeilL3vI2RzUcu7ese4EY7GcNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768301542; c=relaxed/simple;
	bh=ZrIW+AmS/RhW38jCuB4j1VFU2MBy9yfW1yeUV0fRa5I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m9ap14HvqEXgMr8SUQlHuFsIHO6f/DNdXJ5si01nK5xfZ6SLhiWl3yR0VAHFwJjkRtZQO4RAuv1tfZdrQap0BTy6Xih5M9rt7SUwNl0uuUjtn43xpxHe2DN9ysdqW2uqXankk/HkYWFYkqRfK4T0P86OicsmIqvzokdwlLTWvZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eCBqg9kC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hW2bOFkQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D7DwFC1937911
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 10:52:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=u1lmTEvB8oQ3jgCLKOdlKf+E
	9e4jgDJPhGlUMR5/CRE=; b=eCBqg9kC4FFnOpNwGM7363bUeiN7OTX10KJ2fiod
	uGWxrOHBlLX88i70Vy2HkUzLQ/QGGtphcYSLL0QiNQkVrJDYzUh5B/FAHiHLMVbk
	wGRU42DY+tUZcu/yYGOedzVclCil2GNBH2VBY1HKZbKCQTtRHQutUuEsdHAH2Pu3
	9GhQa7Ryu9pFp2ILTudQ6DEHXpk0oKYLfKRqGejTU/QfdY6QwJHspCU91GkDlrES
	ZI/9xOET/P8xaAZinMBmCUdIwTncvbLqcpCMWmohjGv29P51O9wFYDCb22wK8dwQ
	t4Bs7q7CZKZVqqgjl1ersuV9VhxXXUyjBs1s9dSKTgqB5Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bn6cnjkm8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 10:52:18 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c1cffa1f2dso1724366485a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 02:52:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768301538; x=1768906338; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=u1lmTEvB8oQ3jgCLKOdlKf+E9e4jgDJPhGlUMR5/CRE=;
        b=hW2bOFkQQJEH4FfqzYYouW3gyA1z9LvtvYwRLoa2EfIWs22IeUMBhztijOBtuJpxGf
         j/yeV2MgAo+6WWrXBeJPrdmQysbLSmC3BJcGiiTjmwGsILd3jTuphdlAAOfHadsNlF/Z
         elNM56oguetF6KxDtNt7t4ztV5Pa0JoeJ29iP1ona1HYdnyPtqPvPrrpJkuLDN9Ru0qn
         w193FJtJFvvlZixZbzfSDCLMc++f7H66cSBHSNel2LwyLF9jbqvyhiilXoq5gru5rPyV
         dxNeAmzxdGhYMrWxiSb0GBpj44b82J69M0hpU5iP9Nu+E8EOy+b65NNAIGW/zzMlT7e6
         A1gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768301538; x=1768906338;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u1lmTEvB8oQ3jgCLKOdlKf+E9e4jgDJPhGlUMR5/CRE=;
        b=MOiTMItyEvyznnA4/5iF3PLKn2xHAcTDZkW0Ku5SjyG4bkJVJgkxgo494REYx2q5sF
         Li2qoipGl4aAbJ527bKH6XyhrD2u8cefPchPpzHFN05dVPtQoj3gRW5A/0zoOFEqLwPm
         2pS8sbwvWg56bKQWVC66PeiUJDzpWx2Ai2s8QkLgKg/wkWK/Q+YXswqtypP2onZ36rr0
         Impz6bqMjxfQP45/288hyqF6SrixoEfim4m/zs8a9muOqlRMP0FajGfmXvmMLO+RCja3
         mVtQwJemO7/YdA0dMAB6tGhjR3tGUHJbUcgSCGiI7M4sN2W+RbNG9nMKTSQtx/f9SbHG
         7gXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUm/AhWOjroDgk1RLtjyPbrsm/Vk3fD3ejM6q+3y2DFw5xfbcI4vzte68c9+KHGYJhvm860MqeyjrMMClf@vger.kernel.org
X-Gm-Message-State: AOJu0YyQCgy+cpyIgxEfduxMDd2LHyQVnoKD61VLgKL7qP0gKNwLt02Q
	A/TQTNhA4+xlGPhaifqYPHzR1eqsYHd8ikLUKgE44zYtKDaahAOG2HfBG0PHuseskyIjfjIOQJT
	PFyk1vpyaFxNRpC/Q8WdSaygNhtjO2PNpxZMGgTM+SG1nNlK3/5ntK0CfSBmJqZEpsHe0
X-Gm-Gg: AY/fxX7dkIdVW/mqDXyG3I76QZ0wmEo0Rl9L8rKIIY6npU14B5yPKOX3Rs40Xyp/lx2
	IIJt704v3Vp9WxX5ObxTybC6DD/ljXuhLO2KpNdwAK0RnelP6vlS5m4YCQggZ7M+j7EVkJb8/qA
	Sob+pwtIWDrZmlbX52fc0EZ19kq1AnsxVpCTfdS8S0QTYGk7ZvIWZwEIoOuHCJeZCNrXSbefjRT
	GnKugz/vEuSK6TTqkXT4mENZ51nUcDkhI2kD/kRT4KHmIhWAyqntDoS/MjqXkM8O7gBCzRLcow/
	RYMoCdUNN28llzkFKHrclPtuFT6iCihdtiacgcGK/MIuJYIBo5yNZRBdtwpE/gQujDAtfuWrdvL
	VZ6FSf99iLlaCtPzNhJPWEu7jBdBDMSA7HnMhsF7RfzHaWJQszuzjKxfB34+EZoFDPtbiETqpdP
	Bg7WceUfdl3NoyOkRL+2qLDYw=
X-Received: by 2002:a05:620a:3901:b0:8b9:f737:2006 with SMTP id af79cd13be357-8c5208c1ea3mr291908185a.37.1768301538201;
        Tue, 13 Jan 2026 02:52:18 -0800 (PST)
X-Received: by 2002:a05:620a:3901:b0:8b9:f737:2006 with SMTP id af79cd13be357-8c5208c1ea3mr291906485a.37.1768301537759;
        Tue, 13 Jan 2026 02:52:17 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b7c2dd9e2sm3393247e87.5.2026.01.13.02.52.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 02:52:16 -0800 (PST)
Date: Tue, 13 Jan 2026 12:52:15 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: YijieYang <yijie.yang@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: Add base PURWA-IOT-EVK board
Message-ID: <2qa3kn6gw4f5qlncq6iwgxattfbbztu42gpcbekqfghcrdg3l5@z7zsx44xch7a>
References: <20260113-purwa-v3-0-16eefacbdce9@oss.qualcomm.com>
 <20260113102822.590677-4-yijie.yang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113102822.590677-4-yijie.yang@oss.qualcomm.com>
X-Proofpoint-GUID: OpFP3WsKtWzYzRdEeCD_RfPJ9GR2SASa
X-Authority-Analysis: v=2.4 cv=KK5XzVFo c=1 sm=1 tr=0 ts=696623e2 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=CCOFXxt_BiQ80FFdstEA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: OpFP3WsKtWzYzRdEeCD_RfPJ9GR2SASa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDA5MiBTYWx0ZWRfXy7gStNso7ZPu
 b9GBOEMeOl2ZbRC3OqZwCFZ1O4eEdMBwLus8vbZ+PsOzSUj+iUb+02iJ/p4R0iIWYPXHfyykQOG
 Sqc7w3IT6BCl9JyXPs0HLAE96+5ff2U0PHnp7TrjBDcPW6IUfwvIeXIk+t0NQh29oVt37pSStDr
 Q/8U435KSD2rBYoZCwHiC/hJcaeoJVET5/Bq4KURn5H1UDPk0mAUuQ6s8DjcE8FJz41squsQRut
 qfzAYXke71pI8AanCzmTcxGodwlo4U7Bd5DdVrds4JWn6OwS6HeSeE0atuR/iU0Zs4gE6cmIg/K
 0VwUn+K3md1uRKJSboJ3FBqXcyfvosPfVdLZmy5TxAs9mYhQh9yzdW36zSZFwQAJ39p2JHpciwS
 25/DnDXqKXBsguTzQWAs3vbMMLx9Rc7189c4rAwAyg1v+Jpv5BMruspOLcUJXxeNaZzm30ZS2lR
 g8DNnVYlkxrvcUYwbow==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 phishscore=0 clxscore=1015 impostorscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130092

On Tue, Jan 13, 2026 at 06:28:16PM +0800, YijieYang wrote:
> From: Yijie Yang <yijie.yang@oss.qualcomm.com>
> 
> The PURWA-IOT-EVK is an evaluation platform for IoT products, composed of
> the Purwa IoT SoM and a carrier board. Together, they form a complete
> embedded system capable of booting to UART.
> 
> PURWA-IOT-EVK uses the PS8833 as a retimer for USB0, unlike HAMOA-IOT-EVK.
> Meanwhile, USB0 bypasses the SBU selector FSUSB42. As a result, the glink
> topology differs from that of HAMOA-IOT-EVK.

What is "glink topology"?

> 
> Make the following peripherals on the carrier board enabled:
> - UART
> - On-board regulators
> - USB Type-C mux
> - Pinctrl
> - Embedded USB (EUSB) repeaters
> - NVMe
> - pmic-glink
> - USB DisplayPorts
> - Bluetooth
> - WLAN
> - Audio
> - PCIe ports for PCIe3 through PCIe6a
> 
> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |   1 +
>  .../{hamoa-iot-evk.dts => purwa-iot-evk.dts}  | 102 +++++++++++-------
>  2 files changed, 65 insertions(+), 38 deletions(-)
>  copy arch/arm64/boot/dts/qcom/{hamoa-iot-evk.dts => purwa-iot-evk.dts} (95%)
> 
> @@ -1102,9 +1140,7 @@ edp_bl_reg_en: edp-bl-reg-en-state {
>  		pins = "gpio10";
>  		function = "normal";
>  	};
> -};
>  
> -&pmc8380_3_gpios {

This needs to be fixed in hamoa-iot-evk.dtsi.

>  	pm_sde7_aux_3p3_en: pcie-aux-3p3-default-state {
>  		pins = "gpio8";
>  		function = "normal";
> @@ -1171,16 +1207,6 @@ &smb2360_2_eusb2_repeater {
>  	vdd3-supply = <&vreg_l8b_3p0>;
>  };
>  
> -&spi11 {
> -	status = "okay";
> -
> -	tpm@0 {
> -		compatible = "st,st33htpm-spi", "tcg,tpm_tis-spi";

No TPM on the board?

> -		reg = <0>;
> -		spi-max-frequency = <20000000>;
> -	};
> -};
> -
>  &swr0 {
>  	status = "okay";
>  
> @@ -1470,7 +1496,7 @@ &usb_1_ss0_hsphy {
>  };
>  
>  &usb_1_ss0_qmpphy_out {
> -	remote-endpoint = <&pmic_glink_ss0_ss_in>;
> +	remote-endpoint = <&retimer_ss0_ss_in>;
>  };
>  
>  &usb_1_ss1_dwc3_hs {
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

