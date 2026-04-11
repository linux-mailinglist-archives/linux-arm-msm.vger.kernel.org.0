Return-Path: <linux-arm-msm+bounces-102789-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YKNhGMNb2mnb0ggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102789-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 16:33:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D5D3E05AC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 16:33:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EFD0C305A40F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 14:29:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4175B2DA749;
	Sat, 11 Apr 2026 14:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KoJcnSy5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d1IpVrcb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96B4C3859F3
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 14:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775917783; cv=none; b=WiJ2uOJ6LEk2EhBD0pzuKZfz/+A5+jSpjOJJg1SkRFfkRWHSJPdYGphfCuuVvpweeaHSotXTRuGfKrLVUuVzYmgUSN4pQTxt3ZUqzqY5ZSBp0nGuzScSNzkMQ1VXUTLUv8TEaY/aDobNykA/3CA1KTOv7uEKlmnFYJ7zrLTKR/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775917783; c=relaxed/simple;
	bh=Jp0swHFgx2dDuKj5uQCkFn0HPhUYSE6en+odL3eBmsg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cTKOUi/D9mNKXCV2O+oVdQrwonMLehCQX+gty99dj1z/AUA7NYb3nTJMQFtmNdxtbpCQCMlSE51covnoGoKWkdzTsPcsAYWOutM2ChbGqVDmdzHTRTHPaj8Wb6+bkQfmxycK5253whQPvC5xzReW5UNkIKmRNXFkyqN270+TArY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KoJcnSy5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d1IpVrcb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63B48Opp1201977
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 14:29:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WMMUcaWnBIsA9vjwklqQ+6RW
	X/KVqflcSXLhj8DIcSQ=; b=KoJcnSy5gvMQ74GHToqcUdYzDzrcE8UV2q1/iyfr
	Jerk7NlANQUqwhT8weRlbS/Fi7qXhCDifueNrA4QlOM+d7tOZfA5c75CthFQFXHR
	qHvz89ayrPIEJk/00g7eIJAu2ND2cSFEvfDJ8u0BfxDKDJFdiyamo1o8dcfaOQib
	8Vv06kwlID3wXUbN3x8x3jUepI3kGRpQtk66mvzbCH5cqIEscGMV0iW1/9bemNC2
	2Ct4a1jr8H0r0UbaiZ0vl7b9LtTINqwhaMJ4dau3w1rqAdmNLbNn+IuO6YasQyPR
	V2CV90VaQPkKIg1ihQp6YYHrPQ2JRlwStCdjkIenKXWgCQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dff0jrv0e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 14:29:39 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50da529ff48so76819491cf.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 07:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775917778; x=1776522578; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WMMUcaWnBIsA9vjwklqQ+6RWX/KVqflcSXLhj8DIcSQ=;
        b=d1IpVrcbWJ6Htft7sNvuna9jotzzQYMgB1iw5HHE8WN9mDCzyXE6TrQow3TTOGHHA9
         p2h+Fvh0eSEuNJKVQhIHHbTM2i/6nE+QFrUL8N0L4iWq+PNHVLNeg9KfF6VWkP0Rubfy
         d/4xs/iXCGwy5jIMNLVUY6Bpl3sal50UxiH6AvS+fjVqZSLLHU7HPyvgPeTkOmdzBRkM
         FkuqCZTbzECxbwpqLPmpsk62ZCoh0wwyOjCXIj03HwLTBRiteMgB53Fz/tKbj4F2Xv0H
         gShepL7tgHe13xx4uFvvnKFVPcjZpHBSojDYsHUmPOSgzBRnoSf5o/WyPsbycse9HVQF
         ROXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775917778; x=1776522578;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WMMUcaWnBIsA9vjwklqQ+6RWX/KVqflcSXLhj8DIcSQ=;
        b=dOOsgp1PveOSgFaY6zFxfB47urE1ol2octTQTPX/NhplZS82s9FY2pWAN5v0CARN66
         UDjc1PIROVQueov9eo9Jz/IJ6+5nzAtphsLxBtjdbKdqAngLAZfY3FfCOlwRpyL9sejL
         9pt7+L7xPCUWsROcL8+r5TBRwCDRI1tvDXdQOVYYmKqp+oEEGDDUMtdkknTVCjW7nMvr
         siG7vWm7eUnTJiwWM7pg1BqypjeyaUzLs1JLZnacgG6ODO9Pk8v8xCg9Uecu7wkXYZ/R
         jT9+y5tl1T++C0xPdKlew1VsL3Um39cFLGmtzG8fauwvOaowK8WvLDEc4zNCF18Dawbo
         Bqug==
X-Forwarded-Encrypted: i=1; AJvYcCV9ZpfIuzNp1E5x8Y4DW3TFjAYaUReeobROEJ9VjrINX8gBWqtFXJ72yZfjIewGenj36iZAeysPc5CR1EGy@vger.kernel.org
X-Gm-Message-State: AOJu0YzCI1codBwfluvSQRzGJPrrZtR1/79rqDnJSV61bgK4ZqWsoqVe
	ifjxidJy+7hpH+b0acds0a3iVTmJE0ZY+pBPkS6Lx5Q2wgcqO273SAEHCmNe5KuSu9jiYBJKTy/
	3spscjyV9JHeT5necvz44kM/4gc5tPDf7refqO91dANQkhk/9MjAVog8D/R4D25z4aTPE
X-Gm-Gg: AeBDieucMBTQXrhZRD3vT2U3d6IrwOmNrIxtDTT5u+SbfGvi1O7PqjohUJdvfSF2tpP
	OIJNlzBE/BLb0BABMh5S32q+Jum8IKYdF/1ypSAfL1Uay9ZPm2VbVx/GSUup3jtLoXNnomCkOqj
	aAGXq8gELDoSrXQclTtrzlWp/sPiT16ombyziPh03Ghk/esBU4JYgS8KO9FWyqjbSt/RJ9l01XW
	a+JJgDWlmSgmlDDFXuN8Ez86oM/vF3OI5x46hC/BbHfl6GHKBbMZG9XeJOuos/DlvUZDR0tNugl
	jBlFZQ64AQNtn8faxRfKyd05CeRUu39hCQDTi7wRZvs2NpZLNW0L75HY+IGl5ug/KloR8v7dqSw
	dFVY6QZwaGcVZOSGF1FoqGWgXH7WT2emnsEB6a/kd8PY5aQguLXPOm7KhXadP938jHV++bJb/T3
	hmd5YdBult6WkS1tKvgiZHdKTG19B+uPOJJRM=
X-Received: by 2002:a05:622a:1c1a:b0:509:23ee:b9a5 with SMTP id d75a77b69052e-50dd5a80217mr111475881cf.5.1775917778318;
        Sat, 11 Apr 2026 07:29:38 -0700 (PDT)
X-Received: by 2002:a05:622a:1c1a:b0:509:23ee:b9a5 with SMTP id d75a77b69052e-50dd5a80217mr111475481cf.5.1775917777868;
        Sat, 11 Apr 2026 07:29:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eeee1242sm1427404e87.38.2026.04.11.07.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 07:29:36 -0700 (PDT)
Date: Sat, 11 Apr 2026 17:29:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Petr Hodina <petr.hodina@protonmail.com>,
        Richard Acayan <mailingradian@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: sdm845-google: Add dual front
 IMX355 cameras
Message-ID: <iehnmrqwnfm2n2isx6txi7yczvtedjbyfnfrxsppp5644zkuxa@5al75ezk7ds2>
References: <20260411-pixel3-camera-v2-0-41b889abb14c@ixit.cz>
 <20260411-pixel3-camera-v2-1-41b889abb14c@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260411-pixel3-camera-v2-1-41b889abb14c@ixit.cz>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDExMDEyMyBTYWx0ZWRfX/J2OnjLthJik
 /PVsUPfP3zftkPPOqA1owyYPIHAYSh1D56yG127BWYot4lQUdUHXFp/7ErKz/fLTl7wRXoHRO1u
 tS33+crZj9capFxEF95d8n+PwlEpMgvhZGWxkSQG+LX+i2bKt0VgEgtJPZDolwbldEEHwHtOOrK
 agkwVaUmhh1Er1Qq5duuqbSCySWs8og0FTisIZxhNq6Lj4mRRzbCWGoF5bBzTWckdqdtm3zh3yj
 m6dqONOzafiIyz8BlxhyZpbPcfdtdZ1nCSQsxWNBRn6cDmAMrF8Wg0SdKIr0zgqk4AfOpRNt+vm
 oPV/RWrc2e9/cJ0bkN8fNaetj6I88KwhuSf1Syys/7eosou0mD+klb3RD6gUflvRyqaLG9vHSYx
 qxVg/RkOQdGXwyWYPmaL4cTXkS1ghZDPLLO3UTRl9jBxDoz+IXYXnjVZ2EaEw9Jva1rxNmgmNDp
 hdgOAfA0izp68Hfftfw==
X-Proofpoint-ORIG-GUID: _SoJWpS550PnuosUJ911HxKCr20mlLdm
X-Proofpoint-GUID: _SoJWpS550PnuosUJ911HxKCr20mlLdm
X-Authority-Analysis: v=2.4 cv=d/LFDxjE c=1 sm=1 tr=0 ts=69da5ad3 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=9tYL9O_8TpaW5Exp2vwA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-11_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604110123
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102789-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,protonmail.com,gmail.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,1a:email,ixit.cz:email,0.0.0.2:email,0.0.0.10:email,0.0.0.1:email];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A2D5D3E05AC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Apr 11, 2026 at 12:12:02PM +0200, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> The Pixel 3 features two front-facing Sony IMX355 sensors with
> different focal lengths (standard and wide-angle).
> 
> Both sensors are connected via CSIPHY1 and controlled over CCI I2C1,
> using MCLK2 as the clock source. Describe the camera nodes and
> associated resources in the device tree.
> 
> This enables support for the dual front camera configuration.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi | 187 ++++++++++++++++++++-
>  1 file changed, 186 insertions(+), 1 deletion(-)
> 
> @@ -319,6 +362,12 @@ vreg_l28a_3p0: ldo28 {
>  			 */
>  			regulator-always-on;
>  		};
> +
> +		cam_vio_1p8:

No need for extra labels.

> +		vreg_lvs1_1p8: lvs1 {
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +		};
>  	};
>  
>  	regulators-1 {
> @@ -351,6 +400,45 @@ vreg_s3c_0p6: smps3 {
>  	};
>  };
>  
> +&camss {
> +	vdda-phy-supply = <&vreg_l1a_0p875>;
> +	vdda-pll-supply = <&vreg_l26a_1p2>;
> +
> +	vdda-csi0-supply = <&vdda_mipi_csi0_0p9>;
> +	vdda-csi1-supply = <&vdda_mipi_csi1_0p9>;
> +	vdda-csi2-supply = <&vdda_mipi_csi2_0p9>;
> +
> +	status = "okay";
> +
> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		port@1 {
> +			reg = <1>;
> +			camss_endpoint1: endpoint {
> +				bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
> +				data-lanes = <0 1 2 3>;
> +				remote-endpoint = <&cam_aux_front_endpoint>;
> +			};
> +		};
> +
> +		port@2 {
> +			reg = <2>;
> +			camss_endpoint2: endpoint {
> +				bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
> +				data-lanes = <0 1 2 3>;
> +				remote-endpoint = <&cam_front_endpoint>;
> +			};
> +		};
> +	};
> +};
> +
> +&cci0_sleep {
> +	/* bus has external pull-up, don't pull down */
> +	bias-disable;
> +};
> +
>  &cci {
>  	status = "okay";
>  };
> @@ -358,7 +446,72 @@ &cci {
>  &cci_i2c1 {
>  	/* actuator @0c */
>  
> -	/* front camera, imx355 @1a */
> +	front_cam: camera@10 {
> +		compatible = "sony,imx355";
> +		reg = <0x10>;
> +
> +		clocks = <&clock_camcc CAM_CC_MCLK2_CLK>;
> +		assigned-clocks = <&clock_camcc CAM_CC_MCLK2_CLK>;
> +		/*
> +		 * The sensor can accept a 24 MHz clock, but 19.2 MHz has
> +		 * better driver compatibility.
> +		 */
> +		assigned-clock-rates = <19200000>;
> +
> +		reset-gpios = <&tlmm 21 GPIO_ACTIVE_LOW>;
> +
> +		avdd-supply = <&camera_front_avdd>;
> +		dvdd-supply = <&vreg_s3a_1p35>;
> +		dovdd-supply = <&cam_vio_1p8>;
> +
> +		/* MCLK2 pin (gpio15) is claimed by the aux sensor */

Can we require it from the camss node then?

> +		pinctrl-0 = <&cam_front_reset_default_pin>;
> +		pinctrl-names = "default";
> +
> +		rotation = <270>;
> +		orientation = <0>;
> +
> +		port {
> +			cam_front_endpoint: endpoint {
> +				data-lanes = <1 2 3 4>;
> +				link-frequencies = /bits/ 64 <360000000>;
> +				remote-endpoint = <&camss_endpoint2>;
> +			};
> +		};
> +	};
> +
> +	front_aux_cam: camera@1a {
> +		compatible = "sony,imx355";
> +		reg = <0x1a>;
> +
> +		clocks = <&clock_camcc CAM_CC_MCLK2_CLK>;
> +		assigned-clocks = <&clock_camcc CAM_CC_MCLK2_CLK>;
> +		/*
> +		 * The sensor can accept a 24 MHz clock, but 19.2 MHz has
> +		 * better driver compatibility.
> +		 */
> +		assigned-clock-rates = <19200000>;
> +
> +		reset-gpios = <&tlmm 9 GPIO_ACTIVE_LOW>;
> +
> +		avdd-supply = <&camera_front_aux_avdd>;
> +		dvdd-supply = <&vreg_s3a_1p35>;
> +		dovdd-supply = <&cam_vio_1p8>;
> +
> +		pinctrl-0 = <&cam_mclk2_default &cam_front_aux_reset_default_pin>;
> +		pinctrl-names = "default";
> +
> +		rotation = <270>;
> +		orientation = <0>;
> +
> +		port {
> +			cam_aux_front_endpoint: endpoint {
> +				data-lanes = <1 2 3 4>;
> +				link-frequencies = /bits/ 64 <360000000>;
> +				remote-endpoint = <&camss_endpoint1>;
> +			};
> +		};
> +	};
>  
>  	/* eeprom @50, at24 driver says 8K */
>  };
-- 
With best wishes
Dmitry

