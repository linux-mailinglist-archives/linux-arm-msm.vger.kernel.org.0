Return-Path: <linux-arm-msm+bounces-101129-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eAO7N+QczGnHPgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101129-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 21:13:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A9FD3706BF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 21:13:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5A8F1306C528
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 19:08:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3C273A2553;
	Tue, 31 Mar 2026 19:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aT60FZUu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dZ9ZEwMC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98EF038F63E
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 19:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774984123; cv=pass; b=Df8tSuHhi8pVUhOqGUdaydKo5bUMG2xFzeiOWPxMbrmlS8eEyjDjjwWL06ktPsZLNfmUkv7dRLLc+T8BWOUUoMp28LGgdhNSss0KFo6JcQAdIGP4vhcG5lzGf2NMrDASA1iP1smEFig90/qqdk6sLd8A+9C0pcYTu18bJLu2zQ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774984123; c=relaxed/simple;
	bh=Cnc3L16dx8RqrchxX+1+7wae45S8Oj+d2SYrA3aBHOI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f0WCctrUi1hSKATJI3MHMiBz4ApP4SSZkSfMzl5HxPSQmHF91OXIisNE+Zvm//03yNs18ka7MwQAh8++lw4V0NAnAfIytgHRw73Qn08ML/cBynfQ4PCzkZiLjgLeLdBJs4j7y0qtBy/pEt3MFTJxsLNMQeI6NFt8qLXuw1w/p8Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aT60FZUu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dZ9ZEwMC; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62VGdHLd1831876
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 19:08:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=RfD33WDA9eBXROKOLNv2BDIrHUF56VsZFatII1K9/FE=; b=aT
	60FZUuy8A4IbOSs+BO2hguvHvzM+G61XTY1pG1b5tA7MA24iNTc3H7zYCbMUNdVS
	EVJ26EBsOcKMriR+B8bkdOg2al7gdXuao0Z96Kh7FVHzpaTh1Q4KPUwFdPbnpm8K
	IMkbjmbwXsPlc3ZJ9QZuHgB/cYUkPq3acGF6L+Eso1urVJrmJTP4rNMnj/nv5AG1
	f1BDw8NsdIqMgeffyZdMX7AN/LdhbSpdHl47EiTnNDhArK8C1gzg/aByaG4GigZO
	L9p/RnyWEaT5rkWx/p8eYhjKOeE2hZYYKR0CVtsW5/PxovOEvCD5RWYg+U5wXKrX
	CAljSIRuTLtwhLqkXGRg==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8equ9wjq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 19:08:41 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-679c5ed0942so15698866eaf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 12:08:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774984121; cv=none;
        d=google.com; s=arc-20240605;
        b=IxXQhQZWTQDm5XbCGa8uspGSpuNlMsZdiXgKtkxTRJmtHIIu1dAkm5UP0CG/i5IE6H
         d08W+7UhSeAJ4eruJzbGwY095Q9jwt1D78EwFvShY0a0c7XImNiAPHk3grYjedsITFJZ
         BUqdDwh48wlFGG9Hxbm11gdrc5pRxmKJK36uGaR7nW5R4owIk/unkAyNu7wFhCjoD5Rm
         KD5k8YyOZSZ5y87Lgpw4ZJ15jVZKLPutUxpG5vZx2r38UIuCrgWufrbuQ4xGn/JjLKPb
         VeI3KaI3QwWxNHAE1Z8N/j3zGP64EihyUoqc4fiJ8LNfpcY4f6G+nM8VWQFhAbjQlelg
         GEcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=RfD33WDA9eBXROKOLNv2BDIrHUF56VsZFatII1K9/FE=;
        fh=QYtnPXPPw1ZxeZtNj39/AS7MrnRgWS0DR62s4mz+4pU=;
        b=clgYFj/60G+f3p4+7xsPz1SbxXWLaZDbiFvxuRdwfs5Wgcw90Lvqp339LEieb3viZ0
         7JA+YQGxCvuTdl/y0ZBao3wd75DEYBTlQdPIXv2zzsZUvry9eO/g49OY6ffsbnUg9CbU
         Ae1q40KVnNrgsyTRGugEdhucNuZ9bz1XHHtHm6NrYPr2e1HJUzUDRxEsoRHo7WTOXAOZ
         9aqprvWK2pnz8zQ0TNjbFIdf9oTPikMOfhJvXF9oMWWvGhfbSlvhiaxLUdSdaGWsnzPT
         EbQnBRZOpqkcoxXSwMfOswdHBew63LxtRK9YnKt/FtO6aEKfiJsBt2rcRkzFFLFbVp3F
         Sgqg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774984121; x=1775588921; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RfD33WDA9eBXROKOLNv2BDIrHUF56VsZFatII1K9/FE=;
        b=dZ9ZEwMCmqyFcrjIdxTnaU90rqvH9YWiqpGpMuPBDNl6h/JMjh1YnoCsoCOwqkhEb/
         Wzp5DT0CLYCyGARpvUonabqR+LWjhuXuQT+CM255lVZ5Xh6KreU6gW5jZnNDOt688BmV
         Z+OFFYRax1la1oCI2t9QG1iZnaHcNKeH4ZL7TRH4QfBGHB/W3YGZcxdEQCuXGvvDN9cb
         b2PGNUSlhpF27peFgldDl+zSq88+PoqVFjDy/F5EjWhToUB+DAfCd37iQCUBUQv9FR/9
         6FibxQbyOhrIAoMBnQNG4ZjeohsNYUed124yuJfYv++uwfvT9eM3TbwKl4cA+cRNGZxp
         MsMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774984121; x=1775588921;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RfD33WDA9eBXROKOLNv2BDIrHUF56VsZFatII1K9/FE=;
        b=eNGfgF3JtzKtMtRIKBvMYplbgs4bxYnk4WriP53o/rbFNhgvinRyDaYAKyRgVBk/E5
         ewfN2ys+LyROE5R4UTtgI3Xh76H+lWFiiXwwV74EGZ0d1VlCh9iJqvN3w6uWRvHr71AC
         N+GxPTkzg0v8uRXt/A2G9zSXqfwYR9Qyawt3FZo6XvRe6cwTSKS0489+qB/NHZxZlNV1
         O1Xd8PGXVTSwDW2UqcUN1fxlrjBBsn2wDNGbXhAuvA9Z0aNH0fec0HUC8SKkzEYSelsg
         aLBdmPJSO7HQRAEZN4yEZZ/JlMsGm6jRliR/KeCbuoP3cd6rhiQtnA7OfCxsTibdpG6Q
         8g2Q==
X-Forwarded-Encrypted: i=1; AJvYcCW3SUb3YJC3PpVl93J9fvnU5q2fkrSCo3sdFvrBGxFQaf3Q5hDQf/GeHUd41EIM0XaqS6R0eycv3vsiyD0u@vger.kernel.org
X-Gm-Message-State: AOJu0YwpC6EfpEUO9n43s6OV/6+ZezKeirxO7TcdDfdDH5VORjzbgKh4
	gn4pe6g4by/haVoqS8+7vyG2nMqZhT2H23eiwl53gjTrFvUW73Y26OqEm9tnY17wMR2PvP9KGwf
	BPqc4rzjLhIMHbALxM8Xw1KYE2MhBvgF7FATBqrqIwnTXDJ2Gj1+5BpmwEgpL1gfAQZOJ8o5C27
	au0DyRgLhlQSLN7ZkKIGjpUJKygCmNK++gbR6V0KdzAj0=
X-Gm-Gg: ATEYQzwsNdCat3vdUUn3hDaKF1ZwxtNXT5IUroDGGxFtf9RyVp/HKuPWC02Ca1wXYhc
	TaJF61oFDTCXTe6rNdPFbI/fuwdoePH163m6n1I6db17SxyRcXkA7l0e07FWPrReLqSAI/hg+OP
	EzNZNuEG3foXAb4wl9C4hoBKxl/9OBxM+btwBVIbUXqkZ5lbL+kyaVuDBAe3RbwlLxQUt9RpZ96
	pQoybv7K3RbnT57+6FmZruMzSj26V/o5BLH8g==
X-Received: by 2002:a05:6820:1390:b0:67b:c5ef:abcb with SMTP id 006d021491bc7-67fabc3ccb1mr275713eaf.23.1774984121000;
        Tue, 31 Mar 2026 12:08:41 -0700 (PDT)
X-Received: by 2002:a05:6820:1390:b0:67b:c5ef:abcb with SMTP id
 006d021491bc7-67fabc3ccb1mr275686eaf.23.1774984120592; Tue, 31 Mar 2026
 12:08:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331092023.81616-1-thomas.hellstrom@linux.intel.com> <20260331092023.81616-3-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20260331092023.81616-3-thomas.hellstrom@linux.intel.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 12:08:26 -0700
X-Gm-Features: AQROBzBvAateYSIgol1xE404p0QVo18CvuQ9I4yG1ka6RfVGOoveibudl0Ox9Yw
Message-ID: <CACSVV03FFvi0c4XMEShmH5ou4OKKZcvvni2j=0DBoYnuT55ecQ@mail.gmail.com>
Subject: Re: [PATCH 2/5] drm/msm: Remove abuse of drm_exec internals
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org, Felix Kuehling <Felix.Kuehling@amd.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Danilo Krummrich <dakr@kernel.org>,
        Matthew Brost <matthew.brost@intel.com>,
        Alice Ryhl <aliceryhl@google.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDE4NCBTYWx0ZWRfX4Cbgrp12N9uW
 GTq+H1/nzNHFx80GX+DGMjNpMEqTRhqAbtDedW5oHjgYzdCWTTofDEc26K+PSXSj2gc/j97HtAX
 PdhDf0kgRPBGPeU0f1BJ/Zn2rTzt0me70NeheZhOmCFoOJRKQvfxIR1Didk+gdtcgH+6GTcmYBl
 F8fJGV5kp/5DYJ5wGyL/tWdsum0yCw6N9W9r0oijY5GsYdsMACONcXU/fixionG98X2puzuH3QP
 p/lZcvkXwmbmJXdzMni9mFwlr52sA1tKUHKEizs4zjTwML2L5Tw5n2IpvY+Kk7kw5VUxt1LLPnK
 /z16MqDWQAZU1kgZOctZDisqO7/jyNNf9fNIzCGYGpnPvwmvdFRt4II2tgFiH+j1SI73tH33JEu
 JHBYYYS9QYGjQ3t+wikvw4hdTuBYKa6GgkYFn6RU5bl44WhJqAfop4MakefmjDJrZehVWucmDj0
 1kPMfL+tOAYjmijV8EQ==
X-Proofpoint-GUID: 0fIN3t0WptcjRoP70KLL19xCbWH97BBf
X-Proofpoint-ORIG-GUID: 0fIN3t0WptcjRoP70KLL19xCbWH97BBf
X-Authority-Analysis: v=2.4 cv=YMOSCBGx c=1 sm=1 tr=0 ts=69cc1bb9 cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8
 a=uC2hiXKo-rcvbCjx3PIA:9 a=QEXdDO2ut3YA:10 a=rBiNkAWo9uy_4UTK5NWh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_04,2026-03-31_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310184
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101129-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,amd.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,intel.com,google.com,linux.dev,poorly.run,somainline.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rob.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	HAS_REPLYTO(0.00)[rob.clark@oss.qualcomm.com];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,intel.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:replyto,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 4A9FD3706BF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 31, 2026 at 2:21=E2=80=AFAM Thomas Hellstr=C3=B6m
<thomas.hellstrom@linux.intel.com> wrote:
>
> The code was reading drm_exec internal state to determine whether
> the drm_exec structure had been initialized or not, and therefore
> needed cleaning up, relying on undocumented behaviour.
>
> Instead add a bool to struct msm_gem_submit to indicate whether
> drm_exec cleaning up is needed.
>
> Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

Reviewed-by: Rob Clark <rob.clark@oss.qualcomm.com>

This is pretty stand-alone, so I can pick it up for v7.1.  Or ack for
landing it via drm-misc with the rest of the series if that is easier
for you.  It shouldn't conflict with anything in flight.

BR,
-R

> ---
>  drivers/gpu/drm/msm/msm_gem.h        | 1 +
>  drivers/gpu/drm/msm/msm_gem_submit.c | 4 +++-
>  2 files changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.=
h
> index cb32093fda47..762e546d25ef 100644
> --- a/drivers/gpu/drm/msm/msm_gem.h
> +++ b/drivers/gpu/drm/msm/msm_gem.h
> @@ -452,6 +452,7 @@ struct msm_gem_submit {
>         bool bos_pinned : 1;
>         bool fault_dumped:1;/* Limit devcoredump dumping to one per submi=
t */
>         bool in_rb : 1;     /* "sudo" mode, copy cmds into RB */
> +       bool has_exec : 1;  /* @exec is initialized. */
>         struct msm_ringbuffer *ring;
>         unsigned int nr_cmds;
>         unsigned int nr_bos;
> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/m=
sm_gem_submit.c
> index 75d9f3574370..26ea8a28be47 100644
> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> @@ -278,6 +278,7 @@ static int submit_lock_objects_vmbind(struct msm_gem_=
submit *submit)
>         int ret =3D 0;
>
>         drm_exec_init(&submit->exec, flags, submit->nr_bos);
> +       submit->has_exec =3D true;
>
>         drm_exec_until_all_locked (&submit->exec) {
>                 ret =3D drm_gpuvm_prepare_vm(submit->vm, exec, 1);
> @@ -304,6 +305,7 @@ static int submit_lock_objects(struct msm_gem_submit =
*submit)
>                 return submit_lock_objects_vmbind(submit);
>
>         drm_exec_init(&submit->exec, flags, submit->nr_bos);
> +       submit->has_exec =3D true;
>
>         drm_exec_until_all_locked (&submit->exec) {
>                 ret =3D drm_exec_lock_obj(&submit->exec,
> @@ -523,7 +525,7 @@ static void submit_cleanup(struct msm_gem_submit *sub=
mit, bool error)
>         if (error)
>                 submit_unpin_objects(submit);
>
> -       if (submit->exec.objects)
> +       if (submit->has_exec)
>                 drm_exec_fini(&submit->exec);
>
>         /* if job wasn't enqueued to scheduler, early retirement: */
> --
> 2.53.0
>

