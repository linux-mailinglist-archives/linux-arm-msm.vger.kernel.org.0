Return-Path: <linux-arm-msm+bounces-104005-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +LsmB4kq6Gm3GAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104005-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 03:55:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F8244132B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 03:55:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CD8863019510
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 01:54:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB8202E8B8A;
	Wed, 22 Apr 2026 01:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OtdRSAQS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SgY6ixgz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64D6E2D2483
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 01:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776822859; cv=none; b=QumSM6ieZkLGrorJAorJY4JiZyfhRTmEoVA1AZvAXVx9jvDOhqOvvsHyF2ryUyRwjIvcDyXoCrl0vLqnvZeqLkztTamd+TOKLVQvJxEdjOw11pa7oMVIYFcQ/ou2iU6dTGq7RKc8zSyMlh8tpSSoD2LBRuOyqlHjNwpJyGLVMnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776822859; c=relaxed/simple;
	bh=pga0nwIInIYHT6h/lC6AisEpyFhl2DTt5O8CoOvgQD0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Oj9dpR/vRPgvAr6WVJvpbJobKggKv4uH/jOopn6+JFLiWTliLi9VIvgeOT1d6alOQPG1g5rAZamgx8EJkU8r2W+Jhyqifm08UbvvRrzIV+DofcZe4Q4iwitwDdie5fXgxMbzvqOJa0kfjidGCDLZJgFGX25P42tWx2MUelQjazI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OtdRSAQS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SgY6ixgz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63LIa2sV728179
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 01:54:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1EVhPscDl7ppUgS3ObH0c8/S
	ANPa07oJZissK0SnRo4=; b=OtdRSAQSnn5ks9g5mzd+1LRTi0D/e7c7gHpNFos6
	iHiydNQJC1IdzI1DWb3ceT2D88FsjGX8R8QRumthXqsCQIWW+QorpL410rNzgYVn
	wSKFqkS1h/gL+SiDF2Fj0ml1GGqpemyUdhjpqACuIvTk6+cfHbv+yj7L5lk24bHa
	lqS0N27YWy366V4seWteWZmH8vknJsUjX8tDq+3kAm9WztPkl9RVNf2H47+7zSCO
	uNce92GGsq+WwyqTqRbCgg6Qb/V3s7uNdXHvzgHYvUbCF1LN3Buo2vsmIQJNVdaM
	3EndaELKYRfpJ0PuCmR8YKJI3pzYsRsyHscFux0UdgMaGQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenh95mw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 01:54:17 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8b1f39c5827so20083806d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 18:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776822856; x=1777427656; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1EVhPscDl7ppUgS3ObH0c8/SANPa07oJZissK0SnRo4=;
        b=SgY6ixgzcuUFsqT0NCruRn3fawAWIyhr7bPIdKVQPXUDRD3wdP9nCyCTJ+BMznFFLS
         tT5T7mQs9In0T+wP5t+q9hzVO+QIuEkkYSxURjhlSV9jFAJD8O39/10fm2HU0XqjSjsY
         O//Ghvon5IPapFYVItgyNHSTRaqtwD9Oy0vmBjR2RDuxB6FumT1RtKsFvZjS4BPTj2vf
         8bq0Bec91HBW38GCEkqiNoBQUjDaGAaxGPW6UlwYynhrNcvT/FW3hV8NgBg/vjuhYswK
         xtahSJ/gEEp6gzV7yfcZIsBGOckRFQHYMEJnINOvDIhbx2vs8cjB8yU7cWhp968hDuqZ
         IF7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776822856; x=1777427656;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1EVhPscDl7ppUgS3ObH0c8/SANPa07oJZissK0SnRo4=;
        b=TYIVdZREUI6uhz+KVMRrlllXxwtxq9MF0Pwx1srbqsK7BSmbnYjzPHijF8tw3RqO8N
         BCNaZG33+cQO9M16eSeFgGlf1Ljq3e43Fz5Ac1AZjOI+Pe/z8csJuEJnc7l0Ju/O9um+
         Tmz0BVcybXu+VuajVP21ENRTLbgyN1D8CnViD6v/Vyx4V1aG9egq1hJaSeX2zsrLc2Lm
         s3v8iTEhQyNNAf611vi6IDyDS0jtE48VQ6xXSrz4PCzcRpfBI+2aBtv/Jcqj4/LPZ2cJ
         Qd9+nzTONmx57T+CMNVBqNN6W571I8PqOtKmGBcc47FD9jPdSJjEdj2ojxYevBjU+szQ
         UD+Q==
X-Forwarded-Encrypted: i=1; AFNElJ9snl84C+ZkS5DUPPEnTbYkCAJon5eqm8pLw1w2n68EkB6r9FGKAW5XBK3+cFz/fAhfJD6ZEWnhe21N6m7W@vger.kernel.org
X-Gm-Message-State: AOJu0Yzz/0S96kBxaOya3LFXi6XLuZEvIhYavGQqONaCdAjjdMCWTwuR
	HEV/XjQCBsYi/VD7WS8G/3fZJKC0UKD2AYXVPkMR+i98nYwbwxZvbRHC1dXiDVfobZtCwHQzuQj
	TKpJl/+de425s7LXGy14+/WyGYD9sClRq5wQGEgLON8IWN699wmWFIeiLVkE5BrdKHMb7
X-Gm-Gg: AeBDietkVDkK+oHMp+6dCqUh3byOQmVuA1HcEZSAlJYDHWNK70xKUO5fIQ5CO0CPfeM
	K+b2uoFK85yfKV/8TsnxRP865bZNQKb5INevQTrTnWIgDjHHi+ABbI60S4eQtgGtli8f6B47qsv
	gSocwWpt8B86ooK7rQbez+U1h2r6BOwp1uujpnK+ZcduQ/DP0zxl+gtfhPjhcKK6F5z/ao4kgMk
	EsvPuFusmFxY2+Ldryqxvmjzo+3bubCm1rYFu+aiyk8qDff3fznH/D86cVBjrzG7G89ctS9pn9X
	BF0DkpNlgkKSL8BJqGXuTAM7Oj1NESyrFxXkSESgZDBpGBTCE+pLorjcKdX/BWpIK9LqfAO1juM
	q/671qCeM6OW6HVH1fqR2+XGH1iV9AW2z7MA8lmweDooFuQdfTlXsokpdYSRDWxATCQLM4R9I1s
	CnfoEiwLya1LkBh2ED1gBDr8yn9YVNaBXxhg5KL6iD3eAAug==
X-Received: by 2002:a05:6214:5691:b0:89c:a2b2:8d3a with SMTP id 6a1803df08f44-8b027fd9b67mr378068736d6.4.1776822856534;
        Tue, 21 Apr 2026 18:54:16 -0700 (PDT)
X-Received: by 2002:a05:6214:5691:b0:89c:a2b2:8d3a with SMTP id 6a1803df08f44-8b027fd9b67mr378068396d6.4.1776822856107;
        Tue, 21 Apr 2026 18:54:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187e12c8sm4049951e87.49.2026.04.21.18.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 18:54:13 -0700 (PDT)
Date: Wed, 22 Apr 2026 04:54:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bill Wendling <morbo@google.com>, David Airlie <airlied@gmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Justin Stitt <justinstitt@google.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maxime Ripard <mripard@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 00/13] drm/msm: Add PERFCNTR_CONFIG ioctl
Message-ID: <b4hkax45ohmz3dk4b2wgfmq73px7er66wqxixquxhwd64ngboa@zu4frfofekef>
References: <20260420222621.417276-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260420222621.417276-1-robin.clark@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=HdUkiCE8 c=1 sm=1 tr=0 ts=69e82a49 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=e5mUnYsNAAAA:8
 a=vNHeVWmE5UuQZPkiQX4A:9 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDAxNiBTYWx0ZWRfX+/+y1Kku0uQt
 CHIjx84sFfEWxpqTd5cAhs2YPVAsYCPZmSTXMATl04pku/2NhZPJ69lDMiWlYg1pNIeAC5c/NfU
 4RGOy89H7hdx47oaj7Lihn5TdgkYuSSrLp2zxk9x4eU8e8JkxjKO9T7rIdc4HUgJ3rRIvk4es4c
 xc8wDf86orMmZJanl6wYq3jpL5qFFmTMfaKffrXM6F9WIkRCjMGCaEOga3GFlevKrep6lrtbqQE
 0UviX2KUdypW/oTRuFgEy+sMMk7/SPEm+GSKr/qVBfv2DiO7Hbqxp7/Iu9vN5BMOuwT4kjb7cQh
 Nn2mTP4xHYMK8VFRxXedQEGA93TM1CjVCPwAtJ3F8LUl/TzQgz2Q5+livMWGRwjWKcQjzC15rdf
 V9sFuMQ1AweWS4CciXUO0xbtjfzS6sI1BU+7AKkPaVaCNlPyjV3UKJH1AYeg9wwZK/BPVOH7HRG
 +tqMremLkVZ8LhpkYrQ==
X-Proofpoint-ORIG-GUID: xv4-9jQZBRvOKUnX2IOzldd9cRzkhjMc
X-Proofpoint-GUID: xv4-9jQZBRvOKUnX2IOzldd9cRzkhjMc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220016
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	TAGGED_FROM(0.00)[bounces-104005-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,oss.qualcomm.com,linux.dev,google.com,gmail.com,kernel.org,lists.linux.dev,linux.intel.com,somainline.org,poorly.run,ffwll.ch,suse.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,lkml];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 78F8244132B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 20, 2026 at 03:25:22PM -0700, Rob Clark wrote:
> Add a new PERFCNTR_CONFIG ioctl, serving two functions:
> 
> 1. Global counter collection (restricted to perfmon_capable()) using the
>    MSM_PERFCNTR_STREAM flag.  Global counter sampling is, global, across
>    contexts.  Only a single global counter stream is allowed at a time.
> 2. Reserve counters for local counter collection.  Local counter
>    collection is local to a cmdstream (GEM_SUBMIT), and as such is
>    allowed in all processes without additional privileges.
> 
> The kernel enforces that counters assigned for global counter collection
> do not conflict with counters reserved for local counter collection, and
> visa versa.  Since local counter collection is scoped to a single cmd-
> stream, multiple UMD processes can overlap in their reserved counters.
> But cannot conflict with global counter usage.
> 
> In the case of local counter collection, the UMD is still responsible
> for programming the corresponding SELect registers, and sampling the
> counter values, from it's cmdstream.  But by performing the reservation
> step, the UMD protects itself from the kernel trying to use the same
> SEL/counter regs for global counter collection.
> 
> For global counter collection, the kernel programs SEL regs, and sets up
> a timer for counter sampling.  Userspace reads out the sampled values
> from the returned perfcntr stream fd.  Releasing the global perfcntr
> stream is simply a matter of close()ing the fd.
> 
> Since the counter sampling is done in the kernel, this prepares us for
> not having to disable IFPC while global counter sampling is active.  But
> wiring this up will come in a later patch.
> 
> The mesa side of this is at:
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/40522
> 
> Rob Clark (13):
>   drm/msm: Remove obsolete perf infrastructure
>   drm/msm/adreno: Sync registers from mesa
>   drm/msm/registers: Sync gen_header.py from mesa
>   drm/msm/registers: Add perfcntr json
>   drm/msm: Allow CAP_PERFMON for setting SYSPROF
>   drm/msm: Add a6xx+ perfcntr tables
>   drm/msm: Add sysprof accessors
>   drm/msm/a6xx: Add yield & flush helper
>   drm/msm: Add per-context perfcntr state
>   drm/msm: Add basic perfcntr infrastructure
>   drm/msm/a6xx+: Add support to configure perfcntrs
>   drm/msm/a8xx: Add perfcntr flush sequence
>   drm/msm: Add PERFCNTR_CONFIG ioctl
> 
The series doesn't apply to linux-next. Please switch to b4 and use b4
--edit-deps to specify dependencies.

-- 
With best wishes
Dmitry

