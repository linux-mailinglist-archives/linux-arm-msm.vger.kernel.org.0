Return-Path: <linux-arm-msm+bounces-108076-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id E3DQMu8lCmq6xAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108076-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 22:32:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 62376563C6B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 22:32:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8679C30022D1
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 20:32:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38B9D2F3C0E;
	Sun, 17 May 2026 20:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BxpCjP+f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ar1PP2KU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1C8D2DEA8C
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 20:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779049965; cv=none; b=MPhi96i8XuMh+m3XbCfDubUhAiutgUxBDE+pIfo0lsnkjhmSvXzqh1gnbLgwtJvmo1u/VyJSYWITi1dLhDoffmxDltYXwYCBoXv0Q60XARLiu2/2VMe6tTP4d3mk0CJ7650ZHTVyicbyTKTnZO9+oBGwwoQIduiH37Ssma/ag10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779049965; c=relaxed/simple;
	bh=I7Xbk2u//y8qiLOQJdId8sf1Rjd+sF7Yw0nApvja6JU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S+oPFBs29fvWRhLRFTEdpliRSEwWXdMfLtZeuAcsHy+dIu7WoHIM/Fe4BPVdtwBVRHPcDy3wZ+JK/Gdaz9H368JpsF1E1uzGOMAXQZ13OnBAdqg8b2noVOwd12f616+yg/Ll1cuvEh5b9A+osOqptvsTysPBsF4/8cbPDmH5W2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BxpCjP+f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ar1PP2KU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64HAOnWG3595488
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 20:32:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eD0sQbMrv/ZTrUTgp6JK3oLD
	dN9ZckIvFx8HzP3EIGI=; b=BxpCjP+fZnB2uFVZGqOkDNen4Vhc0fErG2r79tDu
	V9cxZ0GXb3+RR5HH1HvyXEeXU9DgRvyZGbsByPL2EVGdr0n2o82iIDVy3HOwROAV
	YydqOJFXwmcBPkmswr2Sx95iWBKNzMpsv/N4aKzoCwupBNuNm4okXsA/9TePv3Nj
	CO74V9utOhQehhq15yEwrnxAbCk8JG4VejNpDs+PMm6QCYBAMb0wWvErvxY5vcgj
	kW2FcXaEOlLRfOVI1X1gkZq8IFLWVe2SClVZrBFWAlEg5tORATMy7JYNgtTdA/B+
	ezDMbp0KZKKhqbPRd4lSMAV7VsPQUb0RdB2ySYlbWMxxow==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6h0qbhtu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 20:32:36 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50e2592ea3bso14242661cf.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 13:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779049956; x=1779654756; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eD0sQbMrv/ZTrUTgp6JK3oLDdN9ZckIvFx8HzP3EIGI=;
        b=ar1PP2KU8VQITcuVmThC3njhLCWqHB+M9PIAv6zxArGSRyo36uZHS08BU1DPskmS/X
         q7ErrYGmRiW58DekZvyEQl9Ur4lL+eAe1O6dAUh5VUQmHPESr2Pcl0/ahsLOBFuVl9bD
         NleaJwt3xcYetWoZsRWd+IVzt7E520rO0R4hGCN0T5SPmBJrOLsDDJeOcKoi9Xnl+kcy
         Naxme/BUAsc+X0Fk93qCBWDHF7y6xWs6OzHycytZMkhAKwG87q5YRQo3R38r/MtBZ367
         8Ac8r0KQt3Beh+GZVbhJivlJ+uzPrssGk/YjdZxyLVkz/dbh3p2tDA4SfaWceXy7BdP3
         vOmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779049956; x=1779654756;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eD0sQbMrv/ZTrUTgp6JK3oLDdN9ZckIvFx8HzP3EIGI=;
        b=f3Mxi1GwWSO3OzdAGW0zMR2m4ZItsyWIw5/FquIkBfc7Tkfqz6HJVkvDHEJmfm67Zt
         vYglZPAuPo34C6cfzsbVX+xpmr106WLGNYVIMLabJ4sGaJt05os+U1UJ4cnpum+YzUlY
         xpG9fR5Yh1I0bpuHKN4z49eO50MVxzTswyfahwA7CKWdxAM4N3cD6vAqyd066UqmoCku
         wn+zlSN9Fs9aQK+Cig7IWJ3rQ1dAdD3NuXDMWUJgL1UuXPGRNIH2pQQPZ6LJ6r32PlhA
         ld6xHRl5rTqJKwnnl7+Le0WnL+i/6PYkZbHFpsFEfj6obxOjonqNTclW/cUGCQGQ1Had
         UDTw==
X-Forwarded-Encrypted: i=1; AFNElJ9v0NWrbO6IxUa3FivPBHYvfOEfnowy73w9JbuDVJvgnvQxpXvMI+kdeU9gVre7IlMbCz0eecbp3my1IFTg@vger.kernel.org
X-Gm-Message-State: AOJu0YxtZp9CyqA6IJ8r5miF3RIv2a49fNUcKesIwn1v+CUZdA617UKj
	rDax/sbftryWYvKSw20eshNCgNGLlZDM57FWdsWjPx0EHhRhj4g1SWXxwCqMs1c18DKOFrJWHyA
	lNuhGcYN3eJ1lCYb9Tm+ouM6AQgrkBy4fvbRzhypB1dpRHlzfq2HlD2LnDO9hemqG/hfx
X-Gm-Gg: Acq92OHHLDQaES81vGYQFuXczQcjp5Io4KE5pg6tVq6/ap8DZDzS1XFGNLnH1vU6RGw
	rXc8gFbhUsz1u/i4tBgfY5CCcU4TGhhbJkQwp4Xkl/xZugGEmFvA/vF4EZKGZ2zukIc6Nbv8AAG
	aeOcH7xtAHNtL9dIVxiE3soccvPIYmnHwVTJcUKaLYqbQ3f2nMsbZxR4nYtmRWai3zOtGbwl+lE
	YCTZiyh7ycYa4KtlotbvyRFOXLo1L/JqekxterGu5lvdQUxz6oG2+18t8BrF6XLxfG+U+6tboYC
	tTgM0R3zCGOiAScFwyUOeG1ovOTfsm4We2b8BZqvtbAjmggBHrq0pBwW1UY0xlWybUGKXzH+BZx
	KXuvUUCZ7nzLczwp8vaL8Sv0gBMVqF0Qn96DPwr6EpKPgHmvSDbh+hWumPxmNF7CvTqwzVX8HBF
	KfGOY+nIwC6BtXcRkrceH4KluO6mu/WvnuUG4=
X-Received: by 2002:a05:622a:9003:b0:50e:423e:2870 with SMTP id d75a77b69052e-5165a27a429mr161637341cf.52.1779049955749;
        Sun, 17 May 2026 13:32:35 -0700 (PDT)
X-Received: by 2002:a05:622a:9003:b0:50e:423e:2870 with SMTP id d75a77b69052e-5165a27a429mr161637151cf.52.1779049955264;
        Sun, 17 May 2026 13:32:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a9164bc3fcsm2891592e87.48.2026.05.17.13.32.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 13:32:33 -0700 (PDT)
Date: Sun, 17 May 2026 23:32:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: azkali.limited@gmail.com
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Teguh Sobirin <teguh@sobir.in>
Subject: Re: [PATCH v3 3/4] arm64: dts: qcom: add basic devicetree for Ayaneo
 Pocket DS gaming console
Message-ID: <y5jliz2avr24ww4eq44uqi7ddcsbxr2irwfe265ain4sv3fone@dmcjelmnan65>
References: <20260517-pocketds-v3-0-d5910c801756@gmail.com>
 <20260517-pocketds-v3-3-d5910c801756@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260517-pocketds-v3-3-d5910c801756@gmail.com>
X-Proofpoint-ORIG-GUID: P734OhBzprqLpbZKueinRYaK-KxNx_CT
X-Proofpoint-GUID: P734OhBzprqLpbZKueinRYaK-KxNx_CT
X-Authority-Analysis: v=2.4 cv=fIMJG5ae c=1 sm=1 tr=0 ts=6a0a25e4 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=NEAV23lmAAAA:8
 a=pGLkceISAAAA:8 a=EZ_7xAdKxuRBWxfvwsoA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDIyMiBTYWx0ZWRfX1Ba/eevU5zei
 jzYjAsWaO9JBzs3Y4YvXu/+5OTW0baof7iPVZo6/iqlj0N57AjO7OAL1AgOqxYNumzR3Lzm2TsZ
 3FladYbQjBNWUZ44GmBoy/i3Uhw2X7lXMmytPBJPAm25xrBzS4uEnsaGtKII58ha2h0nD/dfR/R
 J2sB7xOwDfolUMLs6KrO64PFZq+IfpFaYPAbeFZcWm2DcirFL8a5PH9p+430+hFvh8ZyPZXZSUI
 ztnVP4C0UbR+OvHh9ymvta0tbh0/KAgVWr8xMcNDitKxlJRf+lc6hhP5I1jJrWiYgCsUY067q5G
 i4Qkx+j+SdQveCa/3naZDRk4QoVWMTFjXZ2qP6JENA3NM7f+sj2uk5+n0ZYr9GyrFEkR2btQkND
 E0bPuCV6IOdDtJlm+Jzy4DveQ7ks8g+/ycT6OVA4yHboUqtWjQ0qfTl7oUAKGUo5d2HFp0gBQrN
 KFJP7XM28gr6I6Uo8iA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_05,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605170222
X-Rspamd-Queue-Id: 62376563C6B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108076-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,sobir.in:email];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Sun, May 17, 2026 at 08:14:22PM +0700, Alexandre Hamamdjian via B4 Relay wrote:
> From: Teguh Sobirin <teguh@sobir.in>
> 
> Add initial Device Tree for the Ayaneo Pocket DS gaming console based
> on the Qualcomm QCS8550 platform.
> 
> The design is similar to a phone without the modem, the game control
> is handled via a standalone controller connected to a Renesas uPD720201
> PCIe USB 3.0 host controller. DisplayPort is muxed over the USB-C
> connector with all four lanes wired.
> 
> Display panel support will be added in a second time.
> 
> Co-developed-by: Alexandre Hamamdjian <azkali.limited@gmail.com>
> Signed-off-by: Alexandre Hamamdjian <azkali.limited@gmail.com>
> Signed-off-by: Teguh Sobirin <teguh@sobir.in>
> ---
>  arch/arm64/boot/dts/qcom/Makefile                  |    1 +
>  .../boot/dts/qcom/qcs8550-ayaneo-pocketds.dts      | 1883 ++++++++++++++++++++
>  2 files changed, 1884 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index cc42829f92eb..45859e977bc9 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -185,6 +185,7 @@ qcs8300-ride-el2-dtbs := qcs8300-ride.dtb monaco-el2.dtbo
>  
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs8300-ride-el2.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-aim300-aiot.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-ayaneo-pocketds.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride-r3.dtb
>  
> diff --git a/arch/arm64/boot/dts/qcom/qcs8550-ayaneo-pocketds.dts b/arch/arm64/boot/dts/qcom/qcs8550-ayaneo-pocketds.dts
> new file mode 100644
> index 000000000000..416399a4179b
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/qcs8550-ayaneo-pocketds.dts
> @@ -0,0 +1,1883 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2025, Teguh Sobirin.
> + * Copyright (c) 2025, ROCKNIX (https://github.com/ROCKNIX)
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/leds/common.h>
> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> +#include "qcs8550.dtsi"
> +#include "pm8550.dtsi"
> +#include "pm8550b.dtsi"
> +#define PMK8550VE_SID 5
> +#include "pm8550ve.dtsi"
> +#include "pm8550vs.dtsi"
> +#include "pmk8550.dtsi"
> +
> +/delete-node/ &aop_image_mem;
> +/delete-node/ &aop_config_mem;
> +/delete-node/ &camera_mem;
> +/delete-node/ &ipa_fw_mem;
> +/delete-node/ &ipa_gsi_mem;
> +/delete-node/ &mpss_dsm_mem;
> +/delete-node/ &mpss_mem;
> +/delete-node/ &q6_mpss_dtb_mem;
> +/delete-node/ &cdsp_mem;
> +/delete-node/ &q6_cdsp_dtb_mem;
> +
> +/delete-node/ &remoteproc_mpss;
> +/delete-node/ &remoteproc_cdsp;

Why are you deleting them? Isn't status="disabled" enough? If it's about
the memory-region properties, it might be better to delete the
properties instead of deleting the nodes.

> +
> +&cpu7_top_thermal {
> +	polling-delay = <200>;
> +
> +	trips {
> +		cpu7_top_fan0: trip-point2 {
> +			temperature = <70000>;
> +			hysteresis = <3000>;
> +			type = "passive";
> +		};

How are these trip-points being used? If you want to control the fan, is
there a cooling device for them?

> +
> +		cpu7_top_fan1: trip-point3 {
> +			temperature = <75000>;
> +			hysteresis = <3000>;
> +			type = "passive";
> +		};
> +
> +		cpu7_top_fan2: trip-point4 {
> +			temperature = <80000>;
> +			hysteresis = <3000>;
> +			type = "passive";
> +		};
> +	};
> +};
> +
> +&cpuss0_thermal {
> +	polling-delay = <200>;
> +
> +	trips {
> +		cpuss0_fan0: trip-point2 {
> +			temperature = <40000>;
> +			hysteresis = <3000>;
> +			type = "passive";
> +		};
> +
> +		cpuss0_fan1: trip-point3 {
> +			temperature = <50000>;
> +			hysteresis = <3000>;
> +			type = "passive";
> +		};
> +
> +		cpuss0_fan2: trip-point4 {
> +			temperature = <60000>;
> +			hysteresis = <3000>;
> +			type = "passive";
> +		};
> +
> +		cpuss0_fan3: trip-point5 {
> +			temperature = <65000>;
> +			hysteresis = <3000>;
> +			type = "passive";
> +		};
> +
> +		cpuss0_fan4: trip-point6 {
> +			temperature = <70000>;
> +			hysteresis = <3000>;
> +			type = "passive";
> +		};
> +
> +		cpuss0_fan5: trip-point7 {
> +			temperature = <75000>;
> +			hysteresis = <3000>;
> +			type = "passive";
> +		};
> +
> +		cpuss0_fan6: trip-point8 {
> +			temperature = <80000>;
> +			hysteresis = <3000>;
> +			type = "passive";
> +		};
> +	};
> +};
> +
> +&cpuss1_thermal {
> +	polling-delay = <200>;
> +
> +	trips {
> +		cpuss1_fan0: trip-point2 {
> +			temperature = <40000>;
> +			hysteresis = <3000>;
> +			type = "passive";
> +		};
> +
> +		cpuss1_fan1: trip-point3 {
> +			temperature = <50000>;
> +			hysteresis = <3000>;
> +			type = "passive";
> +		};
> +
> +		cpuss1_fan2: trip-point4 {
> +			temperature = <60000>;
> +			hysteresis = <3000>;
> +			type = "passive";
> +		};
> +
> +		cpuss1_fan3: trip-point5 {
> +			temperature = <65000>;
> +			hysteresis = <3000>;
> +			type = "passive";
> +		};
> +
> +		cpuss1_fan4: trip-point6 {
> +			temperature = <70000>;
> +			hysteresis = <3000>;
> +			type = "passive";
> +		};
> +
> +		cpuss1_fan5: trip-point7 {
> +			temperature = <75000>;
> +			hysteresis = <3000>;
> +			type = "passive";
> +		};
> +
> +		cpuss1_fan6: trip-point8 {
> +			temperature = <80000>;
> +			hysteresis = <3000>;
> +			type = "passive";
> +		};
> +	};
> +};
> +
> +&cpuss2_thermal {
> +	polling-delay = <200>;
> +
> +	trips {
> +		cpuss2_fan0: trip-point2 {
> +			temperature = <40000>;
> +			hysteresis = <3000>;
> +			type = "passive";
> +		};
> +
> +		cpuss2_fan1: trip-point3 {
> +			temperature = <50000>;
> +			hysteresis = <3000>;
> +			type = "passive";
> +		};
> +
> +		cpuss2_fan2: trip-point4 {
> +			temperature = <60000>;
> +			hysteresis = <3000>;
> +			type = "passive";
> +		};
> +
> +		cpuss2_fan3: trip-point5 {
> +			temperature = <65000>;
> +			hysteresis = <3000>;
> +			type = "passive";
> +		};
> +
> +		cpuss2_fan4: trip-point6 {
> +			temperature = <70000>;
> +			hysteresis = <3000>;
> +			type = "passive";
> +		};
> +
> +		cpuss2_fan5: trip-point7 {
> +			temperature = <75000>;
> +			hysteresis = <3000>;
> +			type = "passive";
> +		};
> +
> +		cpuss2_fan6: trip-point8 {
> +			temperature = <80000>;
> +			hysteresis = <3000>;
> +			type = "passive";
> +		};
> +	};
> +};
> +
> +&cpuss3_thermal {
> +	polling-delay = <200>;
> +
> +	trips {
> +		cpuss3_fan0: trip-point2 {
> +			temperature = <40000>;
> +			hysteresis = <3000>;
> +			type = "passive";
> +		};
> +
> +		cpuss3_fan1: trip-point3 {
> +			temperature = <50000>;
> +			hysteresis = <3000>;
> +			type = "passive";
> +		};
> +
> +		cpuss3_fan2: trip-point4 {
> +			temperature = <60000>;
> +			hysteresis = <3000>;
> +			type = "passive";
> +		};
> +
> +		cpuss3_fan3: trip-point5 {
> +			temperature = <65000>;
> +			hysteresis = <3000>;
> +			type = "passive";
> +		};
> +
> +		cpuss3_fan4: trip-point6 {
> +			temperature = <70000>;
> +			hysteresis = <3000>;
> +			type = "passive";
> +		};
> +
> +		cpuss3_fan5: trip-point7 {
> +			temperature = <75000>;
> +			hysteresis = <3000>;
> +			type = "passive";
> +		};
> +
> +		cpuss3_fan6: trip-point8 {
> +			temperature = <80000>;
> +			hysteresis = <3000>;
> +			type = "passive";
> +		};
> +	};
> +};
> +
> +&gpi_dma1 {
> +	status = "okay";
> +};
> +
> +&gpi_dma2 {
> +	status = "okay";
> +};
> +
> +&gpu {
> +	status = "okay";
> +};
> +
> +&gpu_opp_table {
> +	opp-719000000 {
> +		opp-hz = /bits/ 64 <719000000>;
> +		opp-level = <RPMH_REGULATOR_LEVEL_SVS_L2>;
> +		opp-peak-kBps = <10687500>;
> +		qcom,opp-acd-level = <0x882e5ffd>;
> +	};

We probably need to get speed bins done...

> +
> +	opp-746000000 {
> +		opp-hz = /bits/ 64 <746000000>;
> +		opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
> +		opp-peak-kBps = <10687500>;
> +		qcom,opp-acd-level = <0x882e5ffd>;
> +	};
> +
> +	opp-794000000 {
> +		opp-hz = /bits/ 64 <794000000>;
> +		opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
> +		opp-peak-kBps = <14398438>;
> +		qcom,opp-acd-level = <0xa82d5ffd>;
> +	};
> +
> +	opp-827000000 {
> +		opp-hz = /bits/ 64 <827000000>;
> +		opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
> +		opp-peak-kBps = <16500000>;
> +		qcom,opp-acd-level = <0xa82d5ffd>;
> +	};
> +
> +	opp-860000000 {
> +		opp-hz = /bits/ 64 <860000000>;
> +		opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
> +		opp-peak-kBps = <16500000>;
> +		qcom,opp-acd-level = <0x882d5ffd>;
> +	};
> +
> +	opp-1000000000 {
> +		opp-hz = /bits/ 64 <1000000000>;
> +		opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L2>;
> +		opp-peak-kBps = <16500000>;
> +		qcom,opp-acd-level = <0x882d5ffd>;
> +	};
> +};
> +

[...]

> +
> +&remoteproc_adsp {
> +	firmware-name = "qcom/sm8550/ayaneo/adsp.mdt",
> +			"qcom/sm8550/ayaneo/adsp_dtb.mdt";

.mbn, please. Even if the downstream uses .mdt. Either pil-squash them
or just symlink, the code will handle it anyway.


> +
> +	status = "okay";
> +};
> +

-- 
With best wishes
Dmitry

