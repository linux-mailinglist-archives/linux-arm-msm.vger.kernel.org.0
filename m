Return-Path: <linux-arm-msm+bounces-89902-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kESoGWcLcGlyUwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89902-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 00:10:31 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BBDE4D8B3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 00:10:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id ED9D6B0F231
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 22:17:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBA0D3DA7D2;
	Tue, 20 Jan 2026 22:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A6F7qVRk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="el+N5NvE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DCE7396B94
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 22:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768947441; cv=none; b=rkiLvUF+HLJ6muXMMijdJxY2S5XW7zYtWy7vbb9VHVv3dhB3Wmr0icSDuubMQr3Jbt3AC3oGAfC80hmg3Qh0mEXPLa+74SD/+eoPluGiZ23k5jDq3PS4IIJfQiFBqkEZ9k7jf5WeBw6ZWwhIYdORVLdml17gOKk2Mu9RjQsnLGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768947441; c=relaxed/simple;
	bh=sxHtcsVnIT9PlHf0fVj9dyTDKvpOYafwuz6Ym6yeKvo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tTxtiTp2h9LlaOQI2HWUXSq2m3PezX5QjYQjIK3SSgUuvrDxzHyS4uY+99leAL1acLtJIZ7h4hRO7fEd4KCc0EzzrQkjqIx7+7JBLrvp9/vqOXxM80gyTK+9fNTXXP1RRQr7CQcXAtslDQMjWqWozu7WiC9RWAQ+Tu8z1hmRdjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A6F7qVRk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=el+N5NvE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60KHBg1v314352
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 22:17:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LMgrBojsqlFJeJoL236KYZQ0
	LMM0OzaqMepEeLLT3fo=; b=A6F7qVRkl0XeGMV/Zqjwz60DPf0H0XOqWQOg6UkH
	aDJRGUFxBMlVWMR6ZpTOmF81s0btxOz1Q1fSgQxgD+i68tzFzwxMw1031qpBEQwa
	hNz1ijMOQnxtUu5++BSP8ixiLUCsnaMEJHNKfNIodBLMy5XMyW4dE0ymkjkigxlu
	zFxd+2d9NdOPVoek92pKf1ckVmO+5iHIIScyvZaIoTaIhfVqLKwWvWb8Z0StX2e3
	Iqy/ShyN9ODbVUBBY6rO1fnnnPjK6QOUMeFyEDZEabtuxFFf9GqkKO0yvaDzwSQb
	KJnQXV1miO3XolsZ5nEqa78jK5Qdm2wPFn5BEd3ErXb8dg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4btdw2910x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 22:17:14 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c6a289856eso139987485a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 14:17:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768947434; x=1769552234; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LMgrBojsqlFJeJoL236KYZQ0LMM0OzaqMepEeLLT3fo=;
        b=el+N5NvEoFWEsbu/VM+XuEwCb3FaMdI5UWI7kRxwXZM7k1T/DrgD2gDrmomYb2fK2c
         s+gjY0Fn779WZjvyRAs3oHiQ4E0NKlDyh1Ww1m72jjdEHrVWbD1HE7KRrMFwRszdKn4U
         cLpR5aAFTMDj//asd2J5YsFeypph617THQ4vMBGJSwlllclrA+i74SyFtTU4Tv96Esi2
         UojU5gg+LzEItXRXkcJxvlBymWBBda/smMXKN7UCSqbjB3IHbpb0s9dVR1QwnZMSiFNI
         Nrc2WbasM64LSYCnICd0gG/Q5QwWW8zxJ83Qc6KB16wZCwwn1394s8jmVqr5lBQrIKNz
         bq1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768947434; x=1769552234;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LMgrBojsqlFJeJoL236KYZQ0LMM0OzaqMepEeLLT3fo=;
        b=FHmWDJd+Q3LeU9MlJF1lDbHFrOgB5/EfKGP5qKRqx7rz4CdPysF7DF7/m+nv4RqozA
         MuZtdw2vZkq4XFUljampNejMShsWmtRhRWS8y2JuPJJtf9LL2uikZSLLh1dfcKEVqdZU
         8vhCk6RNqyGetnITsz4jxGZqDrjbydlRpqYrDsHEZdteN3bFPKGpWCb1xxZRIwQDSYVf
         4vnQQWgNz5m6ne2rzQxJ6Zw5g8rGfloksRQe4YMZ3lOKgZ4onoen0mtkK1hY9QnxvARn
         nyLeo/yVpTQjFU4XJBntTq4zD1toCb9ZPGo1g7noBWVyNxg3m+VIzQvXw4Xfv6zGGV5L
         zTiQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyep/eb8eWFvDxY8uAuilXbGRKfMHS7GEHUxsTtnw/YE/0VLREMpvo2zys2hgAqY5dlUNtZG+BlXBPsux2@vger.kernel.org
X-Gm-Message-State: AOJu0YxSB1+j1EB8dDuIbZrXIIqTUa+QFpcer/nFO7It/6W1f0F1ygcr
	qRObKuEsjkn0Bf7kSQVj3kQtke5p5LSgvEIaDFmm/mFwNZABTI0fhzyDfTq0bsKGyYSmbRXQSlj
	PBDMA3edeE1/N5H1267Ni9xpMHsYJ67CvUOEt67Pf/ToQWaQJasIvm8j1sDuuNDXfA5qo
X-Gm-Gg: AY/fxX7RUFlOhACrCLfMlJhk+b9pO7UGNYpuC7HfkA1Z5Y4SLAWhL6kMoo3sya7YW9y
	cA/9DgVFjX8K7EI37Wh54xl6AXCREm3wVi025V97WLPxSY1I7vBq4b2FKhGAkKj/jr5ObA+ouWb
	cH8p4i5k/XY/KYzVL6Ax7jVVG8IeUh5V/V4qp2bUbiy9XcExYl7qWVtjmpk5piWwpud+YsLqK93
	sbdOYQugJfYoc6jAwc8nT2vqL1EU5hpzMYUuY83ZI2ox9G5I/UX2ZKFC3Cq2l4GUeKS+N3LDGfJ
	D5LtqOE9H/mEKF1PkeM13jsFZpZ+9DYbEgvBvvgvO3W2+c5DG2uycsK6g+7zM6NBoQGc4P01B1e
	ksnOschwG0rN3V9B+3FwuBveOy3piuL81T8MlyqARmbipbHxo6vGyKzHAOt3dnnzd9Z3lGVy+x2
	DssXnQ7fqVi1aRwgt3g2q+67Y=
X-Received: by 2002:a05:620a:7008:b0:8b2:e9e1:4023 with SMTP id af79cd13be357-8c5919e1b04mr2642872385a.27.1768947433876;
        Tue, 20 Jan 2026 14:17:13 -0800 (PST)
X-Received: by 2002:a05:620a:7008:b0:8b2:e9e1:4023 with SMTP id af79cd13be357-8c5919e1b04mr2642865585a.27.1768947433220;
        Tue, 20 Jan 2026 14:17:13 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38384d8d94fsm41687101fa.13.2026.01.20.14.17.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 14:17:11 -0800 (PST)
Date: Wed, 21 Jan 2026 00:17:08 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Icenowy Zheng <uwu@icenowy.me>,
        Matthias Kaehlcke <mka@chromium.org>,
        Mike Looijmans <mike.looijmans@topic.nl>,
        Stephen Boyd <swboyd@chromium.org>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Chaoyi Chen <chaoyi.chen@rock-chips.com>,
        J =?utf-8?Q?=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>,
        Pin-yen Lin <treapking@chromium.org>,
        Catalin Popescu <catalin.popescu@leica-geosystems.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v4 4/4] arm64: dts: qcom: lemans-evk: Enable secondary
 USB controller in host mode
Message-ID: <abjl52dpzm7hwzu5ccifdcjzesocngpaxlefgtuwuvlebgvz2v@eovoklufhfni>
References: <20260120103312.2174727-1-swati.agarwal@oss.qualcomm.com>
 <20260120103312.2174727-5-swati.agarwal@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120103312.2174727-5-swati.agarwal@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: fJB4vhT1E5HN5AG4do9b8Ef8BTC-dbLb
X-Proofpoint-GUID: fJB4vhT1E5HN5AG4do9b8Ef8BTC-dbLb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDE4NSBTYWx0ZWRfXxwOzfZaddSmy
 BLFQCOyIFQTC2DGz5ATbVdqz6DEj/kxf2xNEhchV4WqfLJPJCgSHv1sYe/CcU/RkDAl8iJQO8PS
 GUTUkQCRe5KMUuhE1voTSsH1FLLNFaHV7qPGGyRxUhhFubWYkE3Mmpyxg9zLwBbPxartz2xdWb8
 fKRZReWxFQTFxiaCe0ukCxI3K6LhfZQ7h6Oh4rBxtqSRmN/+n4p/1LY/51B+f+3L8+ted1O2jyS
 kCQLbRO5fdWB+tpH/It48/lG8m1Z91IY8qZ2vePa9lIc/jwwlZzkzWb37NMvPH3I7KgO616j/Gn
 nCGlNou9khw+p/iY0Ius9uA7acM6w7pREccewhplNhUoomYPwMBHaCpf9KbUa80cwv5sxDE/OJw
 pBnk5cfD82k1MWdsUEuScjIGUEhW+C7C/cS+C/qQJmzyKBzxsBwTSNI//To8PcR3LthPd1bNaj2
 AZi0vXbRLjmQZ9SFBcQ==
X-Authority-Analysis: v=2.4 cv=RqzI7SmK c=1 sm=1 tr=0 ts=696ffeea cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=57BrPIaqvqL-b6ncg-wA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_06,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 bulkscore=0 suspectscore=0 spamscore=0
 clxscore=1015 impostorscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601200185
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	TAGGED_FROM(0.00)[bounces-89902-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,0.0.0.1:email,0.0.0.47:email,0.0.0.4:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_PROHIBIT(0.00)[0.0.0.2:email];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9BBDE4D8B3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Jan 20, 2026 at 04:03:12PM +0530, Swati Agarwal wrote:
> Enable secondary USB controller in host mode on lemans EVK Platform.
> 
> Secondary USB controller is connected to a Genesys Logic USB HUB GL3590
> having 4 ports The ports of hub that are present on lemans EVK standalone
> board are used as follows:-
> 1) port-1 is connected to HD3SS3220 Type-C port controller.
> 2) port-4 is used for the M.2 E key on corekit. Standard core kit uses UART
> for Bluetooth. This port is to be used only if user optionally replaces the
> WiFi card with the NFA765 chip which uses USB for Bluetooth.
> 
> Remaining 2 ports will become functional when the interface plus mezzanine
> board is stacked on top of corekit:
> 
> 3) port-2 is connected to another hub which is present on the mezz through
> which 4 type-A ports are connected.
> 4) port-3 is used for the M.2 B key for a 5G card when the mezz is
> connected.
> 
> Mark the second USB controller as host only capable and add the HD3SS3220
> Type-C port controller along with Type-c connector for controlling vbus
> supply.
> 
> Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/lemans-evk.dts | 209 ++++++++++++++++++++++++
>  1 file changed, 209 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
> index 074a1edd0334..328b30576a0b 100644
> --- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
> @@ -68,6 +68,45 @@ usb0_con_ss_ep: endpoint {
>  		};
>  	};
>  
> +	connector-1 {
> +		compatible = "usb-c-connector";
> +		label = "USB1-Type-C";
> +		data-role = "host";
> +		power-role = "source";
> +
> +		vbus-supply = <&vbus_supply_regulator_1>;
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +
> +				usb1_con_ss_ep: endpoint {
> +					remote-endpoint = <&hd3ss3220_1_in_ep>;
> +				};
> +			};
> +
> +			port@1 {
> +				reg = <1>;
> +
> +				usb1_hs_in: endpoint {
> +					remote-endpoint = <&usb_hub_2_1>;
> +				};
> +
> +			};
> +
> +			port@2 {
> +				reg = <2>;
> +
> +				usb1_ss_in: endpoint {
> +					remote-endpoint = <&usb_hub_3_1>;
> +				};
> +			};
> +		};
> +	};
> +
>  	edp0-connector {
>  		compatible = "dp-connector";
>  		label = "EDP0";
> @@ -141,6 +180,16 @@ vbus_supply_regulator_0: regulator-vbus-supply-0 {
>  		enable-active-high;
>  	};
>  
> +	vbus_supply_regulator_1: regulator-vbus-supply-1 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vbus_supply_1";
> +		gpio = <&expander1 3 GPIO_ACTIVE_HIGH>;
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		regulator-boot-on;
> +		enable-active-high;
> +	};
> +
>  	vmmc_sdc: regulator-vmmc-sdc {
>  		compatible = "regulator-fixed";
>  
> @@ -536,6 +585,32 @@ hd3ss3220_0_out_ep: endpoint {
>  			};
>  		};
>  	};
> +
> +	usb-typec@47 {
> +		compatible = "ti,hd3ss3220";
> +		reg = <0x47>;
> +
> +		interrupts-extended = <&pmm8654au_2_gpios 6 IRQ_TYPE_EDGE_FALLING>;
> +
> +		id-gpios = <&tlmm 51 GPIO_ACTIVE_HIGH>;
> +
> +		pinctrl-0 = <&usb1_id>, <&usb1_intr>;
> +		pinctrl-names = "default";
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +
> +				hd3ss3220_1_in_ep: endpoint {
> +					remote-endpoint = <&usb1_con_ss_ep>;
> +				};
> +			};
> +		};
> +	};
> +
>  };
>  
>  &i2c18 {
> @@ -699,6 +774,14 @@ usb0_intr_state: usb0-intr-state {
>  		bias-pull-up;
>  		power-source = <0>;
>  	};
> +
> +	usb1_intr: usb1-intr-state {
> +		pins = "gpio6";
> +		function = "normal";
> +		input-enable;
> +		bias-pull-up;
> +		power-source = <0>;
> +	};
>  };
>  
>  &qup_i2c19_default {
> @@ -868,6 +951,12 @@ usb_id: usb-id-state {
>  		function = "gpio";
>  		bias-pull-up;
>  	};
> +
> +	usb1_id: usb1-id-state {
> +		pins = "gpio51";
> +		function = "gpio";
> +		bias-pull-up;
> +	};
>  };
>  
>  &uart10 {
> @@ -922,6 +1011,126 @@ &usb_0_qmpphy {
>  	status = "okay";
>  };
>  
> +&usb_1 {
> +	dr_mode = "host";
> +
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	status = "okay";
> +
> +	usb_hub_2_x: hub@1 {
> +		compatible = "usb5e3,610";
> +		reg = <1>;
> +
> +		peer-hub = <&usb_hub_3_x>;
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@1 {
> +				reg = <1>;
> +
> +				usb_hub_2_1: endpoint {
> +					remote-endpoint = <&usb1_hs_in>;
> +				};
> +			};
> +
> +			/*
> +			 * Port2 is connected to another hub which is present on the interface
> +			 * plus mezz through which 4 type-A ports are connected.
> +			 */

You are describing external mezzanines, are you not? Please tell, what
is presend on the board: e.g. signals routed to the connectors.

> +			port@2 {
> +				reg = <2>;
> +
> +				usb_hub_2_2: endpoint {
> +				};
> +			};
> +
> +			/*
> +			 * Port3 is used for the M.2 B key for a 5G card when the interface
> +			 * plus mezz is connected.
> +			 */
> +			port@3 {
> +				reg = <3>;
> +
> +				usb_hub_2_3: endpoint {
> +				};
> +			};
> +
> +			/*
> +			 * Port-4 is used for the M.2 E key on corekit. Standard core kit uses
> +			 * UART for Bluetooth. This port is to be used only if user optionally
> +			 * replaces the WiFi card with the NFA765 chip which uses USB for
> +			 * Bluetooth.

This is the corekit. Only. So, it's just "routed to M.2 E key connector"

> +			 */
> +			port@4 {
> +				reg = <4>;
> +
> +				usb_hub_2_4: endpoint {
> +				};
> +			};
> +		};
> +	};
> +

-- 
With best wishes
Dmitry

