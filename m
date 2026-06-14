Return-Path: <linux-arm-msm+bounces-113059-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fj0dDCwgL2pB8AQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113059-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Jun 2026 23:42:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C43CA68255B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Jun 2026 23:42:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=YxpYxzQg;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=EiFXu5Zb;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113059-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113059-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 283963001FF1
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Jun 2026 21:42:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FEBB330647;
	Sun, 14 Jun 2026 21:42:00 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE3B5179A3
	for <linux-arm-msm@vger.kernel.org>; Sun, 14 Jun 2026 21:41:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781473320; cv=none; b=ogggCkcTPZBXEJ5BYYHttvFTheLUK8eEkprlaBNxTIxwaWwjrAM8hYqxEsGl43jl0+O04jLJf3zq2W9VjVE5Mzc9iijMsG0Uy8FOtcYnD2/4Gx/h1GoBIVNdQZ7AdALADerIkD5Ccq7EANxV53UbWFBGDjJnhwJELHXbln6r0gA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781473320; c=relaxed/simple;
	bh=3MM/QC1d7DMFjj96U0zHm7se3t1/cUKIqod6IxmDgoY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BSbfKp5dLl3S08R3cxgVQdOlonfRowbQWvE+L0VwRbEaUPVGf9NUeeK03DYH6C569gmg4c7RrdOxz4D5/hxYoHLAv3dUQoaFmhQGhryFfqlLs+8q4vUPaw9Ksp5AarUmb9U7po5AYGcg1sjN6F64vX1GcCBHmQcUXGJtqBja8Bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YxpYxzQg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EiFXu5Zb; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ELGNoM2757473
	for <linux-arm-msm@vger.kernel.org>; Sun, 14 Jun 2026 21:41:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Grwn3YVn93/D705PG92kjjTD
	C1rDMtxnuDTNRZh1TIA=; b=YxpYxzQgwBA0oiMJX6/P00kfy7/xef2KhwBkE+4r
	8uvek6cXVni97nw10d7hS2oFb69v6KPpqAkjoLu6/jo2oGv71BOXuYcwBP3hgmAG
	3V2pTd0y0GFdMQlNb4cXfbWwTnnQGkgOBUjvVTTtUUMIhMt1qdORqhhyWqwxHRtO
	DO3rRnrYqR9KytwxpObCqmE0Esp+SI3PTs0HXH2TEMAYBrNSwrNI/7t+8fRXb+NE
	GLjpOjnvHJVTv9OKRrttKhi5i15RvpDYSGMlynYdjiC+42E8FUFqCf4pJtFqLFTv
	k90swdQ7DYXEbFl24BvmxdLoJ/7HPZYbQBLIr6UteGWNkA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eryc6vmfq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 14 Jun 2026 21:41:57 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-91931144870so199376385a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 14 Jun 2026 14:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781473317; x=1782078117; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Grwn3YVn93/D705PG92kjjTDC1rDMtxnuDTNRZh1TIA=;
        b=EiFXu5ZbgUke5MXGtR84L01dm3AzsE/SKwqY4Fnvxo2sWMB/bV2d3tlpyCYbMOL1YZ
         GelGVhfhfSNY7iUgwLyosnn0nbKZec4YTQfI9j7q2iNxX35XBY//88UUpsjnS8kdeqQr
         2j9YkGfKpn5oriDgolnWcHDWDomc3Op1OJsXM8wbwgoZy3JUq9LjJjsassnC8gyWMd5C
         Z7RR7pxsNunE5JRjVFmgdP23s/2XNX/mr8LRiSI8n/RGtMTpN78mTDv1tSvg9Kb38jOt
         /Qf6vosOyhhTlq7jqyg0JiL3nPaJ+iwpRVDmhdy/164YRN27C/FHmhj9NJDWnLBT5TCx
         BhyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781473317; x=1782078117;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Grwn3YVn93/D705PG92kjjTDC1rDMtxnuDTNRZh1TIA=;
        b=LEo48ycEe6XQoKQtBH2VbpFwg5u5FvtP99VGIuWASUjMT8o+BtN4Gnoc4Zbl/jcBRJ
         pBtk/673+6apyKNEbgRN+SKtPm8BkyaoHyyk2k2yCA2fbvZflGP2N8qpMlEc3UsTjwVa
         /iyn/Ry3OYCDA6tBD4zXfnOs40bEZD024q3ns26u2mQfFWjsXn4hBZ/dIePQ3ZPnOQfq
         Y4vmy7Hd9y43Hp6MPErMhy/18MM8cMgb4sFSxK3rYXWilHKcBG6QJMyIiJlu1WCi06LM
         mdohyoE6MnDr7SDLL8Htduy/kgen6z6G3RpTdI84C3huy7MeWpNxF+4N8RmqhljkQoEJ
         pRcg==
X-Forwarded-Encrypted: i=1; AFNElJ/CzcvYSATaLMSkZZDmGnXKJi9hhCFZ//vbJN4EJ2ch+gvxV0gKNXjj3fqIb3TLfIHuOf65wmZiSPrZ8e33@vger.kernel.org
X-Gm-Message-State: AOJu0YzLt3h0jdSe7FMPqRnuJESxKTEKs0db6aswGd+rBe6Ydcxc3DUd
	+riZuqKLGO+y1E9/aqnhfJaDZrMuDrYH5mTUnZK43DaN9q4CTCojVWGqnbmvsDZe+IqQ8CJhWHp
	giHT2ObQhmuB3Qx0A43Z5btzxHTFRvYA4iTN3YdDQ3QnkUUQv689ZlQWNmPUvA+NOsVIy
X-Gm-Gg: Acq92OFRKNuKP3bVXq376J4n0G43j7pEtabTAFCtfDfPd2ffKAxS4tVHUosEK7HKtef
	tH4nf46ncSXYT6Dcy/wpyCzqvYjlYVzrBzX198UA+dokt62lvWEJKGh6rtaPPzMxXxDkNHSQeD7
	H0hVcqNXCOLpcEUUc90nUY7ECYWimqllTVgw4vHoMQ8M+C4wOb4G6WN8EAY2guss8kRo/y6Bgz8
	6WuHwLaatNScAJHDraV5NJ1WargG7emWkBbrsLClEl8Y8cPpXraZ0OVT7LWl/slqcT8JxSzkDRh
	rFQ2iSAke2iQAEFt65rut9FnvjB16j5NT9RkxvJiegBRdh3CU6MhJH43E1MbAnOFFfHl/1QbE7x
	sqmwJYlfOtKaeHNFsQKm8coVAQN0e/sXGtH0yUg75q6x/rUeRKIWn1kuEZVmU1B3izi7zTqRO/a
	zfJsBiXvzgXUuCB/pHB7+96IqVOfm78v5r2u4=
X-Received: by 2002:a05:620a:319f:b0:915:b9f6:71a2 with SMTP id af79cd13be357-9161bd41fcfmr1782516785a.48.1781473317018;
        Sun, 14 Jun 2026 14:41:57 -0700 (PDT)
X-Received: by 2002:a05:620a:319f:b0:915:b9f6:71a2 with SMTP id af79cd13be357-9161bd41fcfmr1782514385a.48.1781473316559;
        Sun, 14 Jun 2026 14:41:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1bb12csm2211403e87.84.2026.06.14.14.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 14:41:55 -0700 (PDT)
Date: Mon, 15 Jun 2026 00:41:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Subject: Re: [PATCH 1/4] arm64: dts: qcom: pm4125: Add VADC and temp alarm
 nodes
Message-ID: <y3b3i4p6nr3tj5ds3a5zispbrxt7pzucoswh5grtthmj2m5en2@ucniw6w45572>
References: <20260613-shikra_adc_support-v1-0-57d5e6c7f47d@oss.qualcomm.com>
 <20260613-shikra_adc_support-v1-1-57d5e6c7f47d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260613-shikra_adc_support-v1-1-57d5e6c7f47d@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE0MDIzMCBTYWx0ZWRfXweanrqJeoJaT
 xi7Srn2zza8/G3xySTr7Mv+8+T+wYAJ1azn8XjkldJCmbgrCWBMKEqaT7H0/Q/r2Sb8wcvIcSJq
 QIvW1UGPQu+NP0DowmN1eIX5QG499VI=
X-Authority-Analysis: v=2.4 cv=Oop/DS/t c=1 sm=1 tr=0 ts=6a2f2025 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=sKpPAbJoxR1_uPe38MUA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: l7p2SQwdlHytlIkcmrv_lmHyalnHBbI2
X-Proofpoint-ORIG-GUID: l7p2SQwdlHytlIkcmrv_lmHyalnHBbI2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE0MDIzMCBTYWx0ZWRfXyElOn4yqaIkg
 jzuVLleIPgYMKBdivUZltO2WHDTfbjPwkF1dEyzoYpl4X27QpRBtwzNkNI6Mb3Me+HHU18favmv
 hVZ1JQAAD77ZHhHbbVFbubR/BABG0LJ5q+Sf3uCedMH4bcMrDZXmfy8FwUEgVd2r9wl8O0sDBvL
 sjU/ZUZSXR7mItOCRkL3QzJXagB/ZKqe7LgVJyvi+NMnWe48Q/pP0Ngr17VZ9ITxyBiGG5hFY5G
 6UhO2tCbue2krkaLT8ACO/rhYXAKrUtxb6lBz1rzKujtk2NpJe79vy7c+3GUDIEYCIG2zlytRRw
 ZNTFzLgkqexX+ELYQ2vlcJBoM6frDY2El6P9zp6uloGNM+9TibBk6KD2Tf/SZ3pshJ4RS6iSgJ0
 CRT+C05nxP2TAXnv/Nm+ze3JwsMrIu/tZXjn3kkESvYV57gXgw+gqVaK4v6ldb24RAIP5fdvYRc
 rVHB9QKclzWrbQVxqnw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-14_05,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606140230
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-113059-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jishnu.prakash@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kamal.wadhwa@oss.qualcomm.com,m:rakesh.kota@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C43CA68255B

On Sat, Jun 13, 2026 at 01:39:21PM +0530, Jishnu Prakash wrote:
> Add VADC node with some channels under it, for voltage and
> temperature readings. Add temperature alarm node, used for
> PMIC thermal mitigation.
> 
> Co-developed-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/pm4125.dtsi | 77 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 77 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pm4125.dtsi b/arch/arm64/boot/dts/qcom/pm4125.dtsi
> index 542e8fe030da..7113504d5941 100644
> --- a/arch/arm64/boot/dts/qcom/pm4125.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pm4125.dtsi
> @@ -65,6 +65,83 @@ pm4125_typec: typec@1500 {
>  			status = "disabled";
>  		};
>  
> +		pm4125_tz: temp-alarm@2400 {
> +			compatible = "qcom,spmi-temp-alarm";
> +			reg = <0x2400>;
> +			interrupts = <0x0 0x24 0x0 IRQ_TYPE_EDGE_BOTH>;
> +			io-channels = <&pm4125_adc ADC5_DIE_TEMP>;
> +			io-channel-names = "thermal";
> +			#thermal-sensor-cells = <0>;
> +			status = "disabled";

Why would it be disabled by default?

> +		};
> +
> +		pm4125_adc: adc@3100 {
> +			compatible = "qcom,spmi-adc5";
> +			reg = <0x3100>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			#io-channel-cells = <1>;
> +			interrupts = <0x0 0x31 0x0 IRQ_TYPE_EDGE_RISING>;
> +			status = "disabled";

Again, why?

> +
> +			/* Channel nodes */
> +			channel@0 {
> +				reg = <ADC5_REF_GND>;
> +				label = "ref_gnd";
> +				qcom,pre-scaling = <1 1>;
> +			};
> +
> +			channel@1 {
> +				reg = <ADC5_1P25VREF>;
> +				label = "vref_1p25";
> +				qcom,pre-scaling = <1 1>;
> +			};
> +
> +			channel@6 {
> +				reg = <ADC5_DIE_TEMP>;
> +				label = "die_temp";
> +				qcom,pre-scaling = <1 1>;
> +			};
> +
> +			channel@7 {
> +				reg = <ADC5_USB_IN_I>;
> +				label = "usb_in_i_uv";
> +				qcom,pre-scaling = <1 1>;
> +			};
> +
> +			channel@8 {
> +				reg = <ADC5_USB_IN_V_16>;
> +				label = "usb_in_v_div_16";
> +				qcom,pre-scaling = <1 16>;
> +			};
> +
> +			channel@9 {
> +				reg = <ADC5_CHG_TEMP>;
> +				label = "chg_temp";
> +				qcom,pre-scaling = <1 1>;
> +			};
> +
> +			channel@4b {
> +				reg = <ADC5_BAT_ID_100K_PU>;
> +				label = "bat_id";
> +				qcom,ratiometric;
> +				qcom,hw-settle-time = <200>;
> +				qcom,pre-scaling = <1 1>;
> +			};
> +
> +			channel@83 {
> +				reg = <ADC5_VPH_PWR>;
> +				label = "vph_pwr";
> +				qcom,pre-scaling = <1 3>;
> +			};
> +
> +			channel@84 {
> +				reg = <ADC5_VBAT_SNS>;
> +				label = "vbat_sns";
> +				qcom,pre-scaling = <1 3>;
> +			};
> +		};
> +
>  		rtc@6000 {
>  			compatible = "qcom,pm8941-rtc";
>  			reg = <0x6000>, <0x6100>;
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

