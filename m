Return-Path: <linux-arm-msm+bounces-111495-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nOgRBRsNJGpi2QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111495-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Jun 2026 14:05:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 609A564D508
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Jun 2026 14:05:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ltTRNdpT;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=jSk8hKOr;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111495-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111495-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 43343300F12D
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Jun 2026 12:05:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66E2E3A05E5;
	Sat,  6 Jun 2026 12:05:42 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBB253A1695
	for <linux-arm-msm@vger.kernel.org>; Sat,  6 Jun 2026 12:05:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780747542; cv=none; b=IttDeL+i19RBFoF9hmln6YoTey4+lH/8Y/2IeR9IplJ1CtEa/L9WS1hR+j/uGxTHBLKYOmFZ7dXn7ulAOqmUXfGDuysCoPu3Oh22UMdbbl9YGxhzodW+9JoTqi15IfFi12wH9sJwvsX5TdMdVavRhmQ/Xe55Mn9Tdlhi3orBxIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780747542; c=relaxed/simple;
	bh=WvH26gCrKiSaAe4hh34zApxA0muO7cVzvmTt0XytKbg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MqtY3GaeimvutqI7yjLE8EFHPoGGI84G6nyjCrg1m4UeZLpso6TOOLdty/ixCngrzCHS/7Xxh3jVjbbuiltOWU2ieGUlxyMzGSI153wFMLSZvfyk8Jky76FxEndJpXAXZkuXhG+IqDfmY6iItAs6/+H9gs+redQaFZgVJLUvCLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ltTRNdpT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jSk8hKOr; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 656BGtZ21311236
	for <linux-arm-msm@vger.kernel.org>; Sat, 6 Jun 2026 12:05:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Tmm2Ib328Lw866l3mCyo24He
	LhB15UJSVOLP+VxiaI8=; b=ltTRNdpT4H5vFoQlpGbxx3tFrPcRX1KiDpm+72ie
	W+XCaR/uxH6FlpwayUAl0/WdR+U8GcW6al1govbweOSp5Cm1/U6LKa09q2Rp+k47
	4GxpsjBVk8Z3yc3xpJLV070id37IK5yZStO7fYH7SZgqCGhCviI+klD6L8vhdcdN
	ETjfojqjPwMlzJ8vF9EZH94eM6n2oFKF3cQEcZsZ2KB9miyuS0BpBtvk/Blq6zUE
	WQ3RsEeO1guf6UdZibEUo58RWVmk62RNWsB7EwzjRenLI8NlsXnighVhP55aw1Lk
	Noe26GDRbL2v0GE0kY9jeAd3FRHiDA9gWJ4ueYfYLeSUdw==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emb4w15as-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 06 Jun 2026 12:05:39 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5a1912d5c85so4461355e0c.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 06 Jun 2026 05:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780747539; x=1781352339; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Tmm2Ib328Lw866l3mCyo24HeLhB15UJSVOLP+VxiaI8=;
        b=jSk8hKOrYfIKq1y7X0b0/3ZfZifkoSap8Eyl7MRd5d6JWsjKAB8f7Kii3gRgTXsdqK
         bWVHrljhx9UKpyZUvD6N7QQKqKE3xDXnpf0H7X5A7qGUw9onbyvI54EEucB9toQFywni
         OmLCMfQnC+nIq2Je4RA82np3VCD1irz86OxvViDhm2p+N3qjY+MmCtYX5irjGBUhDoPx
         FpTdGgVRTkpQbbUvNdb/2bfwol2QLzCcamtOCs6HV3f0zRA5UtLxlESjG7Vp4ZLpsAML
         hYzeJwF6B2GDiiU0TR0k5Ki7agGyO/yGuiUMevFjMNZcepQYWGQvTR+3ioKkq9z+zfDF
         7OlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780747539; x=1781352339;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tmm2Ib328Lw866l3mCyo24HeLhB15UJSVOLP+VxiaI8=;
        b=fBLkYnZU3/az6dW/cCc769nM173B5NGEzXvUEEIOBXiExttCoLKuCLsuUiDN7ay5DV
         dchhGea7pamjHPzpen45vvebx2lmOHOpQu3MKXZX23U7yRxAPfgBwJbdD/lqBFfVXzAe
         sRXm3gdhkSJUq3PkFSP/Wg+pdIc7kCH7kBd++9Mlvxyu/4d2+lQb3rv1NqE+4IwAIIld
         uIUjEKgj0qc198nU9fIDqRyKQL4+cBUlNjc/sq2NHsKB8xq0CguB57eZYdRCoC+9aK0+
         jHOK5YSBwqFP5gtbL4TG+yFwTyxaFEcUWnw+R/Lcq/31+/huhuT7VmgJPTgocRjWRUjr
         XulQ==
X-Forwarded-Encrypted: i=1; AFNElJ8T1t++GRdKxT/MfP7coWE+dVkcKDu3y8mKf3EvLqi7SGass/EJQI36AtA+n10wi4+nJCsGuLp5wK/xppEO@vger.kernel.org
X-Gm-Message-State: AOJu0Ywn9hpBD0bT+0SnDYNtrsKgNxsSGnHS37hCObjkTpmSVUcjqAPE
	p79PcEDph+Y6StydHH9+IUM8syOpcRhnlCGaHoD1uFY152FQqplH+1oLoAMW3sNYDfGdv378Myk
	GU3HgNa8mHLwzhqXfeEf8WzaF1Irt+BX2LXC+3rqmCva7YMnCYQyZD2d+Jg3tmWTBJNG7
X-Gm-Gg: Acq92OFEMbzWfbgNYirnWOyzXm72jTSoLfa31qXSJ5LLqFFjhYUVFwifJn8Y8IR35uR
	1qcfLOVQ5iWVnmS5Wwk8yMlVjheVHp8xoDzIULJ697a79YC8w7ttPDkN/9NAiVQ/t++F1HU/QDb
	zYyUjFW5JApmAKQKXRSSSGmekDthcMhtQ8s7vhX0cxpo4XqpE5uNiYVlbWKLlsZINUU9ScctzKA
	7y20eR6pUZdfth9oBLOtHr/cYI0Zn1LOBgyRWVBCHyJv4+QrB7LRMs9wb1YFzfwm1twTrfTj6pb
	vV0pijczZpAohlJnJRXK4Hx92hMXFn4RbDai0si+4rKsBaHr9Sxwfpw9G1tYgOzwhsz34XiiKjw
	2DrPZLhHqFzSlnuC0FGBuCP56eO58kh7MSUfHvFW8LlB28mfZhmh7Eu96FwZtybgfr0pnhhpumy
	+FjfLZnQr2lDeY+g3VGYPck9mWzq08Txhn9BiiH3CnlKITtg==
X-Received: by 2002:a67:e704:0:b0:631:487a:239c with SMTP id ada2fe7eead31-6fefc010475mr4141716137.6.1780747539008;
        Sat, 06 Jun 2026 05:05:39 -0700 (PDT)
X-Received: by 2002:a67:e704:0:b0:631:487a:239c with SMTP id ada2fe7eead31-6fefc010475mr4141689137.6.1780747538686;
        Sat, 06 Jun 2026 05:05:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8ee219sm2445325e87.15.2026.06.06.05.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 05:05:37 -0700 (PDT)
Date: Sat, 6 Jun 2026 15:05:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>,
        Jie Zhang <quic_jiezh@quicinc.com>,
        =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jie Zhang <jie.zhang@oss.qualcomm.com>
Subject: Re: [PATCH 4/6] drm/msm/a6xx: Fix A621 GPUCC register list for state
 capture
Message-ID: <tpjwkemfdjl5645dt2mmqkx3yiddptpajrhj7shiuxrwa44ort@q5ldxy6n2afb>
References: <20260605-assorted-fixes-june-v1-0-2caa04f7287c@oss.qualcomm.com>
 <20260605-assorted-fixes-june-v1-4-2caa04f7287c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260605-assorted-fixes-june-v1-4-2caa04f7287c@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: y0jPIIHCsSs4dJe5TVPxsoKjW6wsBCHS
X-Proofpoint-GUID: y0jPIIHCsSs4dJe5TVPxsoKjW6wsBCHS
X-Authority-Analysis: v=2.4 cv=YIWvDxGx c=1 sm=1 tr=0 ts=6a240d13 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=A5b4bb4LRbl1AOZDjEoA:9 a=CjuIK1q_8ugA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA2MDExOSBTYWx0ZWRfX9KVr3ovwSsQo
 qbQbLWsJUaTwOarRjw//KvoOSz7b0XXzEs9r6Qn8lYQocih+zK3v87BG8BaSyxJ9Gsakiku9wUL
 RGjIlexjMeM8R/5FonzhwnOnLrs/f0jzAwzVsFN7Gqr6q1/BkLvF+9oyxv9GFEI8twJJrfqhnj/
 2SXcEqymwGDwhtlZpogdqwQ51wU2WEvyr3J+xBu1pKrCWhZVzonQdz+jADULUwL1j4UJtTf7tSz
 CFEB4UP0vaqml69m3xC3xlic1z4sbLXj3DSl36PQ56BuAL9OXED3FSqaqC0qvc4KiHclFc+i3I3
 ZJN0kokPpOGxttCGWedAurAgsoMxyGXwfYXm6XhQQcrsBu6Pnnk9WW621xT2L6B8mTwu5i/AkO/
 LTc0H/xEiYX/HHL6Q/ISDDhI25jmItmY46S+zcl6sBJVh/eakyCjQ/AoMvnI2gli8Zmn3kF1EpT
 9fsyQLqHHKv4+2cUJjg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-06_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606060119
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-111495-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:akhilpo@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:quic_pvgtejas@quicinc.com,m:quic_jiezh@quicinc.com,m:mcanal@igalia.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:jie.zhang@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,quicinc.com,igalia.com,vger.kernel.org,lists.freedesktop.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 609A564D508

On Fri, Jun 05, 2026 at 01:38:20AM +0530, Akhil P Oommen wrote:
> From: Jie Zhang <jie.zhang@oss.qualcomm.com>
> 
> A621 uses an incorrect GPUCC register list during state capture.
> 
> The existing list matches A623/A663. Rename it accordingly and add a
> dedicated A621 GPUCC register list.
> 
> Fixes: 11cdb81b3c1b ("drm/msm/a6xx: Fix gpucc register block for A621")
> Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c |  7 ++++---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h | 12 ++++++++++++
>  2 files changed, 16 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

