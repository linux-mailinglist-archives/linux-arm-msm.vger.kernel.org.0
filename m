Return-Path: <linux-arm-msm+bounces-103863-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 63CMKZC75mkU0QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103863-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 01:49:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD36434F25
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 01:49:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 37BE8300CBD0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 23:49:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C18993314AE;
	Mon, 20 Apr 2026 23:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b+F4Qf9o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c0e+O+Fq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BC681BC08F
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 23:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776728973; cv=none; b=qeBVeBtTO9Q7LgTAKb1KHLW2iC6sgKfrhxzIYQULw/Z5fT0nl7DUI6hC/f7hxq7rMlMm6ICUc3uFAZR7YOaF2Rx56ZyZOm0ePx85pxZIozkc/K2e58nrGceHIQrue3Lz6COxZobA5xvlrBpdf7A9HFzG/CnT2qdSC6xxCLva480=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776728973; c=relaxed/simple;
	bh=NSnqmLF33lT6WGvkmpX+umUduSim541C4i10n5SbmDo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QWDrKfM0wy3SekXAoTvvyv51W11TwZZTyO8UFJxteGbucjt58yF/+7q13KXwWMK8S1HLcP/QvkbzhEgseExjV0AEry3WjpWBlUFP1pcVVfHCFKU+m1VP3EWIQlfRuNURwjjxfaJNc5lelvyniZBoD7juc1VqDh+MsxkHbCnYA4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b+F4Qf9o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c0e+O+Fq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63KK69k43456138
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 23:49:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zHnZexhHnQeNIKB6YK7141fC
	RTRiqEvP2iL5Zdf5row=; b=b+F4Qf9oFOFzD6Fp4mfwV07FxDKISP8xLeAmlVMY
	P5RS1qzqgd61/2CUnPPmB/q7MTKitaaUqg8441mGVHvSagDSxBQq3FrTBN4QMNvJ
	mjvK/FD2ywlfZwOIelJOhIvNFMJRJbCkRoSGAss9i/k0rsMAiuYxPVtNClbHqdsP
	+y4aHTaKAOVVIXeN9HjygCwZ1H/BwyTAkFSwkTHQjo3q7yAf+wz6eFibw3hFV5QD
	2aTr8Q/c7fjNHQqXJ/rPPe+AHRltcI7NIUEpaWG1CTzwMuMA4jNr2jw813vJSoNq
	6mJAkXNLVhO5FrkV2InVUFJUMg8mHuxGRp3FPAJ+64Cg+w==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnfvjugdj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 23:49:31 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8ae752c5273so67425306d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 16:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776728971; x=1777333771; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zHnZexhHnQeNIKB6YK7141fCRTRiqEvP2iL5Zdf5row=;
        b=c0e+O+FqxBfJsU4lqUoRlj0C/I+aUbTkm5llf8GB6H5OitmPGIZg8VinsJz5SHAXC0
         IThDZqSTvEkj0qQvFMLxwfF8DcLuNvS+Hp+DGENPQTG7SnS7RbIWC9YeVcLpqD6G5GOs
         KRPHXrITMmf0bh9EvL6lYjF4w3fvQY8ByRL4rQnl8rKus5SQuvp4cNdhQDC5nBjCB0ct
         yCqq+SrO+ARSq9IeLfQ0Mm18ciOCbFgYodhYYLlWudAO9zVO3I1HUI+2hWoFw9ET/0YS
         5EN6vuUuUZai5reUAMtuGhNBIrV31SwVQ8j/l7S9iAJZ+WIsMe3nmjUFogKWR9ay864m
         Ov5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776728971; x=1777333771;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zHnZexhHnQeNIKB6YK7141fCRTRiqEvP2iL5Zdf5row=;
        b=QeJTWSYgWP3eDbkn9KSd33UXjClW6QT5iWk/s1dxzvYZD9z8IeFq/x+UOfr9rlvD+t
         SON3M6oNyWnTeURuiS+SI8AQUZ0ymMQ34vEyC3Gynv8D5lISP4JniwrV3kB22JbG+BDm
         +RrMiM9kre+1x5OvKl6V65csLNphBtra16R94EEL2NDY9MkQuMxLvWesqPsJuGUbPhFc
         /5hzN92/xRJBYjjGOdAW4ImKbRZd+jEAe9nGW7mWGHCEKeC09P6f7SsImVXMyZlHa5tr
         lwBUQ3reFFiiBojCNUtp8tXt7wQmqFoZLowpuKPUslfGL0+Lwr5REIMx6Yt3tglOtBKV
         jFiQ==
X-Forwarded-Encrypted: i=1; AFNElJ+0jgOkjvQCwIBkkqxut/9AjzokyEvyvxq0N5Xe99PfnkCFGxVhWpQRmrVV5PcHpQMx9ZrPyNrkZl8sLDsZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzMX8eFJq6ODGIprpG4CAy7kq6oVzA33Pg8EydB+Y7eO6xgKMLa
	MNmnLT2f+okaAN3WFft9i48nP+MQYgnva+ST0R9qNuNVMb05ece23PNQgKSY+UcoTzCOUInIoqg
	sMIFx3OO03G7V2jQAjqPqBLxx7oRrv3kGMmTjIpmbE93BHRyRQ6EGeJ65n6FbtUKtKAjJ
X-Gm-Gg: AeBDiesgnNdmFHHJQkO2oRtgg/WM6Q15h5mFhQPtf5CClYDmCSKnniIQ8A+GWnyzIJQ
	AX35GliLmDFTHa65JSYQXQk5+8u5Vj3TP6sx+ZP3OTF61LIXGuX4iAy4ayYiA25KyEE85WQipA1
	FBwLKg0Bkj8xgYVUiP8qjYc4I8p+yrYnPvOKi3ihFDLtQYfuG8/8Nt+JkomLQNX8qyReZoY1Y4V
	AKjuL95KZnzBcCrqPgvvY5prARC9pc+sSfsFdPWoBizSs5meXH4EbHlVTtQrv1h9jTnsX75vFGd
	PnZfvygRhAJkOVFLiPq9ZGXEzR8mQwBvssGWJp1FJQZ1FYT8qvV0fLC6wbuDiyHRQKRPmtfnxLP
	uoFE8gs9z/0j552Z8EaQiQOKg4EwfmryPIxaheox9EF8k7uvrOe1VgSe9R+QfQbtEYZrjbeImqv
	72NUss/6bMX9L6CTRyX6GqlYLbXnV3aVpsxEq8GsstqKQHkA==
X-Received: by 2002:a05:6214:29e9:b0:8ac:a611:740e with SMTP id 6a1803df08f44-8b0280ee523mr251407886d6.28.1776728970771;
        Mon, 20 Apr 2026 16:49:30 -0700 (PDT)
X-Received: by 2002:a05:6214:29e9:b0:8ac:a611:740e with SMTP id 6a1803df08f44-8b0280ee523mr251407446d6.28.1776728970288;
        Mon, 20 Apr 2026 16:49:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185bc297sm3247435e87.18.2026.04.20.16.49.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 16:49:28 -0700 (PDT)
Date: Tue, 21 Apr 2026 02:49:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 01/13] drm/msm: Remove obsolete perf infrastructure
Message-ID: <sidcsgvqxddatwwflohsd6gjzm5ehbs4alwaejh3pnjnlhj7vm@nqxhdtxxxizs>
References: <20260420222621.417276-1-robin.clark@oss.qualcomm.com>
 <20260420222621.417276-2-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260420222621.417276-2-robin.clark@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: QSzY78EGKb02vZiNH0LsW3d6oEwVTtjL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDIzMyBTYWx0ZWRfX+RVolshkUBSz
 GhXPU2Z8eKAjmSkyadBGPy0OF0hQGPMmaSx3Xjf7yoywbI6HjzAnf0y6oiGITSDEM3rtCbW8db9
 yDLpmxqkoSVIVeLN4vMqlLsn29fUTKkLlBjp5jKeuOyI1lJulxYuD1zq9CdvReXYRmns16F++H2
 M5mYpRaFBifBX/OsgVlhSZO0XTcqMRs4hUPKBdTJC5QbKmV9mcfNApTgWS5z2yVo1qyrEev1+6O
 qj9ImX+uSCkbCGdZIAu8aCyNnc8lWSsVQE19QmwwfJE54I2p0NKrj3MXmO0hbOK7Jn/e5rdJAg8
 e65VqLltynC9THpwJct7KvBhX18s9fDVrP9HxpA1LwXc7BZRO8PGhZIepIxODYfSPrU3LmAFQiX
 Xxs4Lka9R+iW1AmCMgjbvZiMFqbF2/HtrvwvGcnLBg2FB6LkvFd9Qmq5LfSvo+59qCWwKXBaVDa
 TqhNyhiN3JgmPXx8BNg==
X-Authority-Analysis: v=2.4 cv=XNMAjwhE c=1 sm=1 tr=0 ts=69e6bb8b cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=Xavkbbgx95yDZ5mQW4sA:9 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: QSzY78EGKb02vZiNH0LsW3d6oEwVTtjL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_04,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 phishscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200233
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103863-lists,linux-arm-msm=lfdr.de];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: ECD36434F25
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 20, 2026 at 03:25:23PM -0700, Rob Clark wrote:
> Outside of a3xx, this was never really used.  And it low-key gets in the
> way of the new perfcntr support (or at least it is confusing to have two
> things called "perf").  So lets remove it.
> 
> This drops the "perf" debugfs file.  But these days, nvtop is a better
> option.  (Plus perfetto for newer gens.)

Would it be possible to resurrect "perf" later? It was really useful.

Other than that,

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/Makefile          |   1 -
>  drivers/gpu/drm/msm/adreno/a2xx_gpu.c |   7 -
>  drivers/gpu/drm/msm/adreno/a3xx_gpu.c |  16 --
>  drivers/gpu/drm/msm/adreno/a4xx_gpu.c |   3 -
>  drivers/gpu/drm/msm/msm_debugfs.c     |   6 -
>  drivers/gpu/drm/msm/msm_drv.c         |   1 -
>  drivers/gpu/drm/msm/msm_drv.h         |   5 -
>  drivers/gpu/drm/msm/msm_gpu.c         | 107 ------------
>  drivers/gpu/drm/msm/msm_gpu.h         |  31 ----
>  drivers/gpu/drm/msm/msm_perf.c        | 235 --------------------------
>  10 files changed, 412 deletions(-)
>  delete mode 100644 drivers/gpu/drm/msm/msm_perf.c
> 

-- 
With best wishes
Dmitry

