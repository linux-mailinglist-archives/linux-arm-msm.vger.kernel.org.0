Return-Path: <linux-arm-msm+bounces-103152-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6MXYI75V3mmsqgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103152-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 16:57:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8613FB872
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 16:57:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 77A3A3013D52
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 14:56:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A897023B612;
	Tue, 14 Apr 2026 14:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JWNMBsZ0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V1aVQxpV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D8B1339A4
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 14:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776178617; cv=none; b=VSfslcRqi2zd/ULPSCkbyg+xYtJQUQWy5MDFz/MUoEUtB0zR16mqxAcTc0szxKaUBLqSFex5WJT+bzCAU1ms1FN53qYfZzmdY/nSrdghrBzijvuzqrlOZq/7PrM0/DYl+iMFcM1ZmAc+opAnwMBen++XanUxe1pUwz5wmtOoTxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776178617; c=relaxed/simple;
	bh=Dc/dH87FaaKFZbkFPX2Jhws2CfMpwxHvksPrUUTw0Yo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DnfIhpiwRNEdibMs3xMhA8X1WrVtUBk1eRwXqyoG5qwrG3U2kSey8S8K9uHvv2T6qeWTIZFmXy/9SkR4k3hr5/Rogsg3uW55KDQb6WevSWWw4au49BKz7/fSPBblynTLMTWfOaE+UoqjJB1uTDD04IM+vgVlCf3l4BMWOfFkIm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JWNMBsZ0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V1aVQxpV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EA4Ak4030085
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 14:56:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EV4OhUsmq2J/1la/uJRmT9Yg
	y7Ki///dw82PupHbJiA=; b=JWNMBsZ0hdSbRCMnxXpwW9rKKfnSwtiZUAxkBMpy
	cmn312SrjxEXmGi4TM3RbW5EwviW53N3Ey1JDo/0VpTxwqz6qnuVuvih9p45oBMI
	Y0KGO8sgsrAH1TmtmrBgGA6eJxCencJ2nXZyd0/1Ojugngsyt4biSfgpjCJXgupM
	3uo8cli2bkLg3N68M9cAfbtGTk5g4GRVDXIUNoNunSrEDIr6Ge6pwW5Z6cdgFsvK
	2CXsxb5fkHOohzsjUSfk01DtpfiqNMoKDnKTK1CpCRWLok9TlZKAzSqK5oZ8CDFZ
	6VLL8v3vli8efGEbVjB7r5helUleeNcqn1TbK6IWkupREQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dhkgmh02v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 14:56:55 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b4661881eso7003351cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 07:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776178613; x=1776783413; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EV4OhUsmq2J/1la/uJRmT9Ygy7Ki///dw82PupHbJiA=;
        b=V1aVQxpVbonNiz5CRgkc0Hz8jke0p/hRMf0xrUIekJglsw3uazW892VcsoMh5aO9wT
         CAEBpTerKw6OrhzQzFWTklUCUTRFd9LyXgy4MOCeQ+VAlMCTMmLK2LV3P9b04XG2q4Y+
         Y3dcHGa/8M+g8mtaBLH1epOqKaeKc8z20IQ8oJYpztzEWJBp6hmGqBuaJzSXfKow0p0o
         rGKxtXohuaFEp8vK4XmpYz3RYyrTMT5nmwpxUZ/Ziv2veQAp5js/5Ko3vtINMzYUfX0Y
         YfVor3uFODqITCcPojbisFDQL9dVCtpkCR767NUJfPtgOypliRhBSM6aC4wOz+3atP2q
         gY6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776178613; x=1776783413;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EV4OhUsmq2J/1la/uJRmT9Ygy7Ki///dw82PupHbJiA=;
        b=mlGzwxDXHe6rIOUIgRDkWoYZ51mb+wRJMdj7D5D2FZVCS2oXHJeeBt0Qz2KkDsmmdq
         cb5qFRgwGGgqNA03l1NbY7KbPjBy2LEAkGVBd/rw+i09Qth9y/D8Mvr8KzqfMGHc30sK
         wyFSYz40X0/LIbVqTlM06JN+7p9Du95p6fGHcLg2nRN8F3W3LMr48Kmxd9WqNMQIjOMh
         4dykS9ck0lsJsUWLhSg7cmGphR66hwWMshOVOAIOzXoYS37EKqclxr5w07J4G9/NP6fE
         fUsaqxNuwTR5ujEFFdyak8huwy4O7iwLOGML2uAysTl0lt1kG8CAc57n1umLEfn2IGKn
         AdUw==
X-Forwarded-Encrypted: i=1; AFNElJ/W3nnGAUchtNuw0Xu+d6nr+rV7ywCMSmXgH5TbFFF5aInf2ZpxZE505cv/Zb1B6IEJD0Q8bSzxpL2qbnkH@vger.kernel.org
X-Gm-Message-State: AOJu0YzCXoefVHBiImWpsYGFqVpjCWuB2blwKCGPRxRKtSWw6FKcTq7Z
	0X7MWJmk+OvKHeA2Jd+FBH1hSXTON+owehLnbM5y7qWbJ8B4TA5DlHCfx7Zoh9ARYtSZewirTA0
	ss49fDzaPVC5Yuz5saNBZDlFrR/P6ByB+db92WPjydCwx/vKGFFMgr8deYYhMrzQx8TMw
X-Gm-Gg: AeBDiev+tzSKx3ad3LH0kvZHRtTVOkMfeYX2hpDWkjfj3uX5RhOiiQI9ypFwRRx2Vkg
	lnxJPrKgvTA/9wOsMT+CTtvbJZORPVI0/WRD0DWW7VsbBosALJvExSfU2Q9wsZpm3V9PPpAeEfp
	Eiu1Ae/UMDJtSKTim0rxRBME5k0lbwAFYjxwOJtZoNeTTK6lfn0joShfo9L5AyKLwZDbZwsOGz0
	tkpcvtrYM1i/Pj9z85EW5W00iRqWBo75oRmEDRZ5nr84V98XZ90Yxy0t5N0/A0Dj31FMvCYLWeV
	dtLXO7FEAE/mco1gkBtfJ75KZlbkq7whTxB4FnuECLOitWYe5TMOUIkP1RLe9Z0Y8coeTYgdNBR
	/qZk80eERVN9dmTVFEMa7qefrVvkfCQHR7EzjMIcMtWyKRBVwi3ea10Olt8e0WpWkTC/E664hnx
	woL2U4UVmUcOaIxuR+VDnvFiJcNYdq9YIr49uD1YHV7UcuTQ==
X-Received: by 2002:ac8:5d89:0:b0:50d:a8f5:1bf8 with SMTP id d75a77b69052e-50dd5b98c01mr271723181cf.37.1776178613073;
        Tue, 14 Apr 2026 07:56:53 -0700 (PDT)
X-Received: by 2002:ac8:5d89:0:b0:50d:a8f5:1bf8 with SMTP id d75a77b69052e-50dd5b98c01mr271722541cf.37.1776178612497;
        Tue, 14 Apr 2026 07:56:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eeee120csm3285702e87.48.2026.04.14.07.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 07:56:51 -0700 (PDT)
Date: Tue, 14 Apr 2026 17:56:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kumar Anurag <kumar.singh@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH v1 1/4] arm64: dts: qcom: Enable secondary mi2s
Message-ID: <whwq3rkttoot4phwbmeixhbtd7nxqoy5lsu2vjwj53mribwllx@umagtwlwnbef>
References: <20260413091937.134469-1-kumar.singh@oss.qualcomm.com>
 <20260413091937.134469-2-kumar.singh@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260413091937.134469-2-kumar.singh@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDE0MCBTYWx0ZWRfX/pG5SlTu/PDi
 y9qEVUMCGZUuOhJWh+afjl7vqT7ohwbqvoqbA11Tm2Vsvztq2F14bKveBPhc4POBz7TrV8RHKUE
 gGpSiyI/2Qcdl/k574we7uk+N8nVZnvjTR9+1430qzySRPAIFgJSJafa+4gJSqqKbUFgvMOcPmr
 dERVhzoCa5P5cnII4gMdteSUiL1ioTq6JT47n+79LOV31Wz2ehK3HGEA5rhBH11z5u7CF+OLE26
 Io5wHiNDy9Z5GgDpakqxM8sMwGNVqpudBTY7ton15ArL1oiMITpwFxzu0EnejVZ4jV3G/9QQUxE
 EEz5TPrtdXLFnRWPr8RuvL3S8kkCbEBLH2hvC7DK6hMr2GcKbj5Z5IupsAg6WB62MiHLAM/svnY
 vODaEqtUsV6ghtnFrfZ0WcMs3frr6m0BGK5jiRrHIAju2qPmzplONpZ6nbeiVoLBR+2Jk63lZoE
 bBUu4xeeaOaJLazfeRA==
X-Proofpoint-ORIG-GUID: 1kxovZUzPeye7aXKsw5j5FdT0PuY2qgo
X-Proofpoint-GUID: 1kxovZUzPeye7aXKsw5j5FdT0PuY2qgo
X-Authority-Analysis: v=2.4 cv=HJLz0Itv c=1 sm=1 tr=0 ts=69de55b7 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=mRBC4_JaD_57cIq7-mMA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140140
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103152-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DF8613FB872
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 13, 2026 at 02:19:34AM -0700, Kumar Anurag wrote:
> Enable secondary mi2s to support HDMI audio.

Please also correct subject line to mention kodiak.

> 
> Signed-off-by: Kumar Anurag <kumar.singh@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kodiak.dtsi         |  5 +++
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 43 ++++++++++++++++++++
>  2 files changed, 48 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> index 6079e67ea829..d1009debc12b 100644
> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> @@ -5827,6 +5827,11 @@ mi2s1_ws: mi2s1-ws-state {
>  				function = "mi2s1_ws";
>  			};
>  
> +			mi2s1_mclk: mi2s1-mclk-state {
> +				pins = "gpio105";
> +				function = "sec_mi2s";
> +			};
> +
>  			pcie0_clkreq_n: pcie0-clkreq-n-state {
>  				pins = "gpio88";
>  				function = "pcie0_clkreqn";
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> index e3d2f01881ae..2e4062052828 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> @@ -672,6 +672,7 @@ &i2c0 {
>  	lt9611_codec: hdmi-bridge@2b {
>  		compatible = "lontium,lt9611uxc";
>  		reg = <0x2b>;
> +		#sound-dai-cells = <1>;

Separate patch.

>  
>  		interrupts-extended = <&tlmm 24 IRQ_TYPE_EDGE_FALLING>;
>  		reset-gpios = <&pm7250b_gpios 2 GPIO_ACTIVE_HIGH>;
> @@ -1110,6 +1111,9 @@ &sound {
>  	compatible = "qcom,qcs6490-rb3gen2-sndcard";
>  	model = "QCS6490-RB3Gen2";
>  
> +	pinctrl-0 = <&mi2s1_data0>, <&mi2s1_mclk>, <&mi2s1_sclk>, <&mi2s1_ws>;
> +	pinctrl-names = "default";
> +
>  	audio-routing = "SpkrLeft IN", "WSA_SPK1 OUT",
>  			"SpkrRight IN", "WSA_SPK2 OUT",
>  			"VA DMIC0", "vdd-micb",
> @@ -1149,6 +1153,22 @@ platform {
>  			sound-dai = <&q6apm>;
>  		};
>  	};
> +
> +	mi2s1-playback-dai-link {

Keep the entries sorted. mi2s1 < va

> +		link-name = "Secondary MI2S Playback";
> +
> +		codec {
> +			sound-dai = <&lt9611_codec 0>;
> +		};
> +
> +		cpu {
> +			sound-dai = <&q6apmbedai SECONDARY_MI2S_RX>;
> +		};
> +
> +		platform {
> +			sound-dai = <&q6apm>;
> +		};
> +	};
>  };
>  
>  &swr2 {
> @@ -1437,3 +1457,26 @@ &lpass_audiocc {
>  	compatible = "qcom,qcm6490-lpassaudiocc";
>  	/delete-property/ power-domains;
>  };
> +
> +&mi2s1_data0 {
> +	drive-strength = <8>;
> +	bias-disable;
> +};
> +
> +&mi2s1_mclk {
> +	drive-strength = <8>;
> +	bias-disable;
> +	output-high;
> +};
> +
> +&mi2s1_sclk {
> +	drive-strength = <8>;
> +	bias-disable;
> +	output-high;
> +};
> +
> +&mi2s1_ws {
> +	drive-strength = <8>;
> +	bias-disable;
> +	output-high;
> +};
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

