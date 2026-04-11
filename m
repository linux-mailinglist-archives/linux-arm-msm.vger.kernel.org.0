Return-Path: <linux-arm-msm+bounces-102828-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4GSnNpPf2mmt6wgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102828-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Apr 2026 01:56:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E4D3E1FC4
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Apr 2026 01:56:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C826D301FC97
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 23:55:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E0323932DC;
	Sat, 11 Apr 2026 23:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dAWx97eW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jsynvhh+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D992E06EF
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 23:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775951744; cv=none; b=TE2o/0P0ONDyKF5bwWTBBYthbfEu/nbEUaqijOe0KQ5jDKjgVrBjYBWs4FMl1qUCHFtZnf42A+JjV3vmLZ3XUaGZPF7Q41uXrS5QcHGcNLKDxP50J8qgSq/awbjXTeFTU73jorFI4N/2icw7hXxkZF8+SokPiSWKMJiFRdJMj9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775951744; c=relaxed/simple;
	bh=B5FEbz/XMwj+ZzsmPK2bHJzaep/lfDP52Z0nhjpHmqw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cES+dAidTrQ8GkQlY1PN25/a7bHD9Py1gQV2Olq03WDnoJYjM3JVxJO6zILVdLt1IoP8MICsjl/kEmZ9TOqg6LSUEUDIjATHtgl5c1EwdEIdxxC21nBj4kicvc4Us9oRQzD2VSZ7ornT7X0bCsd3qzyLMhdeVzU4E8WLOJmwS6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dAWx97eW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jsynvhh+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63BNr9p02920655
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 23:55:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PBIRXWBFZirk+GRPYoxB9vII
	nfAQGm8M6f8aHtowUWY=; b=dAWx97eWMFMUR/XYHs0+Gz7/6SfB89MUsn/4iogc
	eMFsh0IKQek1KRjUzrYsblj8pweiFomStvuNx4kYZv2RVY1oISD/F+ww9i+KEY4t
	S5JssVz+B4HzdMsSGdMR0oT1kLe3MdQdpqO30Ky2ZcVhSEruTWfe2UQFH7dx1RJB
	ySGYwFibUT8bOBa+B+BmDyAF47JoGHfLzMIwecbR5+qiQtt+ErRDBPrSePQ0lv/7
	bQ4HSOMoemNycmr5iro5Ev3AkbVz765bN22uzHMzSkDOrd2x8FEc1em3F3gFmArN
	oSBJZ7UHJZ/F7QzsISwH7jB8Dde8bpQKxsnmulZVxJ47cg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfevthhrm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 23:55:40 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b3544bc7bso39910151cf.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 16:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775951740; x=1776556540; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PBIRXWBFZirk+GRPYoxB9vIInfAQGm8M6f8aHtowUWY=;
        b=jsynvhh+dKmHN4y9jkt4hSAxAOdf3G1UNN1XUt8daDIg865AA+Yqr7CewGL4mCisEY
         NsyQiZm05nzNKEetbapMBu+V2QJEAePnZx8tTJaej2a/6WWDn7frwGR4FGT2ay8xpSAI
         sVxPE3VJzbafGY15UFUlmLh0/PBBYa9k6Xw8do+Z/Bv0j0DezNsy+JVwKQZviVuxdknY
         sqjgoq8JhJndQDVbWSW9LAN5HbA5tfOheupCmu1U+8KmTtPx6qrmK9OVqx4bqOJAg+nl
         B+lFxR52QJBrnX8k++4C0g7RPsVoprm5fl01cBd4vzMK+2ZFdXZP41HrpFQQpyTW2vFx
         IsZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775951740; x=1776556540;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PBIRXWBFZirk+GRPYoxB9vIInfAQGm8M6f8aHtowUWY=;
        b=QWakRVwpPlZ9RC+ezKiEcjiM9eMe0++xvvdTZJyC4phADLMmdbyrFWkLKUlCIlM7ix
         gAYg9Dx/u+N3uV7NQ6cXZxBhuyLWmN/V6ATIZaVIpRDDgj8qK+j1CILhB+8u/fq0SMuF
         d68TgbA+dENW/WwfTM4pzIyEXr8PDKLVvcbaNnqsAX9dRrCGAi9kxrorR4GkLGU66H6E
         SwgZotDReWduLQmg01En7CxEUq3ADCv94EEUQMOTys8dufhivNxqXRnysTcR7efd9zUb
         Pm3GbE12hcPbhbBpDu9dMsjL8mMu6gYexJ+eYg9ispv+J8n59/wBc5Yqb+fNMHLKs72K
         D67w==
X-Forwarded-Encrypted: i=1; AJvYcCUblAUePM37uwqL8xWndu1yVkPuvzDuQGZcNcAldrLKxiGxy9VSJ8E2m+EcWlh45hJm+wvCl+UZ7JiEQGZA@vger.kernel.org
X-Gm-Message-State: AOJu0YwxH63DVeOwvhaOyBVefikV8zL7bLGeyScLvo8vfNEjWzC+RXqd
	Oc15FbdzF68y2cwgBYFWVvnu1q9uKRSOJ4n/pYh8DFaawJV3Bq37knvb82+w96NWDsQxS4asPMO
	ELi3SoKMTj8Eh+tHyXW8wI/IyyaXAM1UpiTh9YbXFU50m4uNcaOp/bst2Fx/dlZXhihY8
X-Gm-Gg: AeBDieui5Kb8UnmOrtBqa2rperFvC5QuiiKUAA2a4TjyYKdCK2LwF72jJVywvWAU0wM
	jZ2xmVf3GywC2cXpiKo16ZFzuJvIoBovsVGs+DKuMOZSWmGvhnbXz4rjpkR8aEj/z9Ei/jiJ3uC
	M0YTaZva2vdRBvHDLZd1H5TAiR9kN2OZHWiPwN/YMjidCpTpxZ/OdjycRJuihqmEvllaKo5ZGPX
	VrfpMvy1n3G5QKxwxRr9KKgQXRBakOvstyfnixiykHiJ+0HnIdIN61/6x/Wuk9pIfbBugCBZris
	DM6yqcf3esRMAXTzJpsohfLw2WUKJUE5xp4UlD3XDxdkILmKHUGn19tFvarWJKsSM0szyzjlclI
	JKL+BXOParHZ/BAaWuq18KzPIxdv++lawTp4FlpORb3YgPfVACCKFH/MAo55ZsVH7HNJ6Muc9Jm
	1KFnY17U0/fbdy01V7vu8SU6pk5aV93MrKb5U=
X-Received: by 2002:a05:622a:7287:b0:50d:69cb:d603 with SMTP id d75a77b69052e-50dd5bdb482mr87108141cf.47.1775951739594;
        Sat, 11 Apr 2026 16:55:39 -0700 (PDT)
X-Received: by 2002:a05:622a:7287:b0:50d:69cb:d603 with SMTP id d75a77b69052e-50dd5bdb482mr87107861cf.47.1775951739109;
        Sat, 11 Apr 2026 16:55:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eee8676csm1669389e87.17.2026.04.11.16.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 16:55:36 -0700 (PDT)
Date: Sun, 12 Apr 2026 02:55:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v4 35/39] drm/msm/dp: wire MST helpers into atomic check
 and commit paths
Message-ID: <lypjrzd3unyfqioiq6hk3cnk22ozmdn7agqrkmgwopejqmxwza@mbhyf5qlrhnh>
References: <20260410-msm-dp-mst-v4-0-b20518dea8de@oss.qualcomm.com>
 <20260410-msm-dp-mst-v4-35-b20518dea8de@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260410-msm-dp-mst-v4-35-b20518dea8de@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=RYWgzVtv c=1 sm=1 tr=0 ts=69dadf7c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=mARqR03tnvVyoThnhWQA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: qqedSiN2BCFP7xTdvxJ1gI8qHK0qFZvU
X-Proofpoint-ORIG-GUID: qqedSiN2BCFP7xTdvxJ1gI8qHK0qFZvU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDExMDIxOSBTYWx0ZWRfX3bbEXU1vpjYQ
 pcE8ySj+bfJaKS9d+lIwHpTT0nvCW+Al/++qhs7mkqvfTJ1hgVkt12I15p9WBSChCRSGzPo9SO4
 BNcBLI2AFT7joR+RGr5GRAj15y7Y1eFmqCKeSNuLdCN65VyAm9evN+ZhvIrbORQXyMBAtTXOkDi
 roQK39hBbHJgFLQ+dXel1I+mSMDdwPEY31ePIPEIZuj7cx/SHfikCxDtRllPiI8XFxnYPuaDEfP
 ONbs1rYa6pOMrZseC5MXiPFFB/eklIQMHZ4WeP6U6ekaH3PuxLyNRaLRC24PDnSK8BTvnQGD9DL
 g1WBGti7w6m6bnyiPsLoKgPZMqrlvvRnIpqMneOTN3jpM1osKimqx6eUUVCVBcB2ZQzVx1iD6wr
 BUe13jtLWg7LM432/iQe4JRAwC9nF4bNOOV/W62AHodLh5Q75GPFjdpj0N+1JOaJ2Q+K9jpaEhX
 1JW7rmQLiCTwZop7rrA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-11_07,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604110219
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102828-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:email,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 70E4D3E1FC4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 10, 2026 at 05:34:10PM +0800, Yongxing Mou wrote:
> Call drm_dp_mst_atomic_check() from msm_atomic_check() so MST-specific
> state, such as connector and topology changes, is validated as part of
> the atomic check.
> 
> Hook the MST helpers into atomic_commit_setup() and
> atomic_commit_tail() to support non-blocking atomic commits for
> DisplayPort MST, and ensure MST commits properly wait for dependencies.
> 
> For SST, non-blocking commits are already handled via commit_tail(),
> which waits for dependencies in the DRM core.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/msm_atomic.c | 9 ++++++++-
>  drivers/gpu/drm/msm/msm_kms.c    | 2 ++
>  2 files changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_atomic.c
> index 87a91148a731..ea064aa6d8fc 100644
> --- a/drivers/gpu/drm/msm/msm_atomic.c
> +++ b/drivers/gpu/drm/msm/msm_atomic.c
> @@ -4,6 +4,7 @@
>   * Author: Rob Clark <robdclark@gmail.com>
>   */
>  
> +#include <drm/display/drm_dp_mst_helper.h>
>  #include <drm/drm_atomic_uapi.h>
>  #include <drm/drm_vblank.h>
>  
> @@ -207,7 +208,11 @@ int msm_atomic_check(struct drm_device *dev, struct drm_atomic_state *state)
>  	if (ret)
>  		return ret;
>  
> -	return drm_atomic_helper_check(dev, state);
> +	ret = drm_atomic_helper_check(dev, state);
> +	if (ret)
> +		return ret;
> +
> +	return drm_dp_mst_atomic_check(state);
>  }
>  
>  void msm_atomic_commit_tail(struct drm_atomic_state *state)
> @@ -221,6 +226,8 @@ void msm_atomic_commit_tail(struct drm_atomic_state *state)
>  
>  	trace_msm_atomic_commit_tail_start(async, crtc_mask);
>  
> +	drm_dp_mst_atomic_wait_for_dependencies(state);
> +
>  	kms->funcs->enable_commit(kms);
>  
>  	/*
> diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
> index e5d0ea629448..a8f5fbb3239d 100644
> --- a/drivers/gpu/drm/msm/msm_kms.c
> +++ b/drivers/gpu/drm/msm/msm_kms.c
> @@ -10,6 +10,7 @@
>  #include <linux/sched/mm.h>
>  #include <uapi/linux/sched/types.h>
>  
> +#include <drm/display/drm_dp_mst_helper.h>
>  #include <drm/drm_drv.h>
>  #include <drm/drm_mode_config.h>
>  #include <drm/drm_vblank.h>
> @@ -29,6 +30,7 @@ static const struct drm_mode_config_funcs mode_config_funcs = {
>  
>  static const struct drm_mode_config_helper_funcs mode_config_helper_funcs = {
>  	.atomic_commit_tail = msm_atomic_commit_tail,
> +	.atomic_commit_setup = drm_dp_mst_atomic_setup_commit,

I usually hate one-liners, but here I'd prefer to see this call as a
part of the msm_atomic.c

>  };
>  
>  static irqreturn_t msm_irq(int irq, void *arg)
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

