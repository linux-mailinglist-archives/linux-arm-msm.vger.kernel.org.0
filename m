Return-Path: <linux-arm-msm+bounces-106946-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0pK0Ad/XAWpMlQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106946-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 15:21:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 77DAE50EC7B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 15:21:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2F790304F020
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 13:19:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 368BE3E63B8;
	Mon, 11 May 2026 13:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O2SxUIsD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fV5PxWTw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38A53D9028
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 13:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778505540; cv=pass; b=ZPCuzZadslGplLolxcDbzLb94pFEz845K5eQ44xlZ6lfxq3jVFjPHmpAV+jVnLSzAB9m7bu4+CmhIfXmF6GuZs5g9+RbhQHVwBwPrxSBxjLpKXqYbSeKRTHDP38h90LPKSUUpwMckgBkPbTxD3eO/6kkYsgul6xt9eUXlPKNqhQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778505540; c=relaxed/simple;
	bh=kf5u1j2uaYG4Tdhs6B+i2bOKj1FnY/RUrQIqcWvnvPQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mjqyTwpTCOsgTYUf5Q/DFnAaTi55MoVbG+VbfHbdYQMOL3CE3QZTPdGivbsdhaZjo+y0Cf5wJsVr9p5hATm7NkGh2gBbDasVuy0aD+y4JN0hrC9EB/6iQ/fO3El9IgNRDo0gW0sLUQpjFjodYMHyRQX0kRlz+sbbr17xdP8UW5k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O2SxUIsD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fV5PxWTw; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64BA5BR22039691
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 13:18:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=XGR00eUHw3iiiZo0kkmFBPSZRRSazE8m98na+gRcGkQ=; b=O2
	SxUIsD3yeLYZCtuPjaR0udkFFYZPuw33Uvgfdhk7ux5UeDWajH6b8rqHHthSPRrB
	2rqWAF4DI0+qDzySC66MydSOi79qkwbl8QSMhcLTxX69Mg4JHJY2lJGzkGjbM6zz
	0a4dG4Zg4qsi6Btgip2ZxEtbTKe9eAMUFHzRLSgwM6WxpXw2+YWlnnRhcGarATlp
	oR1a773XnIOlOB80pLKBVaIxUXqKhhYuqqxGRg6siVaRObJ4CV1fQNTGb619DYC+
	iQO0G8CusG55vY630SVIn97YlFLY1ZYEYAYUpU7PtHJKdWCiu/xYVVPXPRCwDAR6
	prCTenIwAIZKqLzINF7Q==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3d22rnen-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 13:18:56 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-479d900d222so6593880b6e.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 06:18:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778505536; cv=none;
        d=google.com; s=arc-20240605;
        b=XSWed8083Ciwz29txBdqSIY0qIriI2Vak7Kz0mA8PWeXcBeNDBp1R6He0/R2hX+P9R
         m4OLosc4eZon9i8ACcbXrnsKM6LRRLl0DNghJLGexWzidTM1bLBT+ykLzpPLmtM78eEN
         2qoYi/TQNmw1xOVkw7DJDcnsLWHcqkHKeJcNgtN79aWj00ByM34uCA1GW/0IzGMTR1L/
         rdRzzYUxp/DZj8zftFqx50bvAbxgdsngdssTauHc0TGOPwh8eGA5hd0y4v2/jQzYZnqP
         5lWIA7HEFxHpbvGRiD/xbLnIv6Vav+jL8GROAm1EUYGgQ7+s130Z49ibRFkBgIUPgilN
         g/gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=XGR00eUHw3iiiZo0kkmFBPSZRRSazE8m98na+gRcGkQ=;
        fh=E/IewzsCuVI3BEyXLodvTwouW42BiPnomj8RtvYj+J4=;
        b=DTiD55C0bZtDnG20CQTBLnn8GL/YB6F/rngI3uS3nbcgUFl1m9VzakIyLkyEO+hTvj
         AKnU6vAnKxfi/nLM0Am/5UOHzt6bqUikXyx5wh7ANONWglPR2AG1fThPGJhw+vtyPNlP
         OSTx9DamuZmkqFZ2G9Ftaz4errXTQzq3PvXAOR4w9bnylb4k1jHGuppmm5t5J3rUTzXP
         ELS2+sRzFuKG61zT5Vl/ULY8iSOea7E0luoC9tCTddbjAm0JpZoVZT2jxiHuQ7uqRghg
         KAq9yJ/CCnqU4hk4iK5uxZqxyMQJspj8bxprp53X7p5kseJu/DHWrZ+l3rtt41dfq+Nu
         XVLg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778505536; x=1779110336; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XGR00eUHw3iiiZo0kkmFBPSZRRSazE8m98na+gRcGkQ=;
        b=fV5PxWTweWqMHX3brQk7huvtdOLT6XJZJ24PkQaMR7lmWelccvomGiarENKO3EXbrB
         ugMBjjjYIPyIloyQZ6RxzEqvMFWqrRUtQ/YqEgOAucQoB9+ubgHPOGsy66UpJg28grXa
         QCtsD3BQGSdYtJVhZuNBKlSjULbgLiBzcCtok7MEhE+x1mLwmfHNoWN0vFDNPNci8NJ4
         OBAenATziwukhr9bjuj56fAHvaAdJ8FHHPkn80AtCAsC/AIXje2OIUcv6YRbv0j+0Tr2
         yy2eJNd/SrCI0JT0cPf41Gt9VLnGDNbiGIRzUpnjJXcpuJWrCmWly2OUSwPX0So6r8r2
         dZ+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778505536; x=1779110336;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XGR00eUHw3iiiZo0kkmFBPSZRRSazE8m98na+gRcGkQ=;
        b=S7DiLidTQb1uDpPp9R2c+ihy/zxItFtJ01hbFAJJWvnfht0wk9/i70+wsaV6IUtXqa
         tXhmcRHnkYnJJx9E8/lp5n7sc6H3HkRwcoPwVswA6IL8E1vp9hQJQ2g4zIP9pQCGwaX3
         rDu5TYv2LnkBU6V5Iptc3raCFH2yaFRTJzk/LnJ/xBTY1fJ3At7Z5NSWk8Bn6HsjJH4F
         HcWJB4d2QYr7PmfPEMZ0DLaLWQa6dFnJ+c1yzYQYYNROI3A1TytFs53ofrG2qA5a/nHM
         VZBmf0PifooNjKLpkcDkAqSYeuwhKtF29XjiPbSG571Yf9YRFg1RVFFrL8+shI+Iyfuh
         Ka2w==
X-Forwarded-Encrypted: i=1; AFNElJ/u32AiE7OSAkwiNP5mGn/S54ygyekpxTCorrA5wA+Rahk7pmiO374Rr5pDCRqTuagW3zleVdCjs+/uqJB/@vger.kernel.org
X-Gm-Message-State: AOJu0YyVDFb26oI0F8C1JmRFOcsvXxHG+VzpIhWxyqvRt15dMyz0gKAj
	c0TAikUBvHCRl0UYwFZMzeyoCuoZqfYYQFTsaZUEFFr9+7/R6eR0bGRR55RW0nfr6iAnQZk8iMF
	YaVwm1bE1N8+foG7ygqhIyKsjkMOR7SDcgZYxc9R0vGjvelXSynNJiiGpRJpSMbmPwyJsVbS60+
	t1GdcS6LBckOl8tFLfhzQwC60/nNyDQ2QYc97tfjSepL8=
X-Gm-Gg: Acq92OGEeEa8pYUcJapGCsiUe4r5skvn4y1cAgcHPo0EntvZwL66AtJcj3xdu3L4OR3
	qv/WXxrkbmwfpl3GCAhVI/4XQ4I1vlAY/1SMMYFrBs7q37u8CPcMcYTD3BVAkEi157UZaLqVB38
	CThTccQPIc3oVp3GfFuZPC8viok6kePiu9uDf7M8X0TM8eW51SPXSomw62GvMgqtsoi/lMmMrG2
	n81np1ALDH1V0rA4URTn/HLXpbcqtseh7NTHw==
X-Received: by 2002:a4a:ec45:0:b0:696:282e:69b5 with SMTP id 006d021491bc7-69998d4e557mr12635658eaf.43.1778505535737;
        Mon, 11 May 2026 06:18:55 -0700 (PDT)
X-Received: by 2002:a4a:ec45:0:b0:696:282e:69b5 with SMTP id
 006d021491bc7-69998d4e557mr12635616eaf.43.1778505535080; Mon, 11 May 2026
 06:18:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260508-panthor-shrinker-fixes-v2-0-39cdb7d577c9@collabora.com> <20260508-panthor-shrinker-fixes-v2-4-39cdb7d577c9@collabora.com>
In-Reply-To: <20260508-panthor-shrinker-fixes-v2-4-39cdb7d577c9@collabora.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Mon, 11 May 2026 06:18:44 -0700
X-Gm-Features: AVHnY4K0prdKPGftchkkqRIB5rspBpP8Hqh1OIZN435xOxgl6be3r1w5HTJQjGw
Message-ID: <CACSVV00NdUKe6-05U3g0q5X3tw4zmqO_s2gk-KZxQVykpydvAA@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] drm/gem: Make the GEM LRU lock part of drm_device
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
        Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Akash Goel <akash.goel@arm.com>, Chia-I Wu <olvaffe@gmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=EaT4hvmC c=1 sm=1 tr=0 ts=6a01d740 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8
 a=bgK60gcJP7TMu5QwpHMA:9 a=QEXdDO2ut3YA:10 a=_Y9Zt4tPzoBS9L09Snn2:22
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: rCmJe8LhMVPyYClUv-U1aMvKpYPXekZA
X-Proofpoint-ORIG-GUID: rCmJe8LhMVPyYClUv-U1aMvKpYPXekZA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDE0NiBTYWx0ZWRfX2HQ/HvnG+OlJ
 5i8TbOVwo1IK8TL/DM+z5PqocJOvAxgWsAPnoOqPB++OYHjI7b3nvcOjxuOhamwUO237BP5K3Db
 C951E5rEIsvyocspGvvT7xpBz8aqETEWVHeJVx6vW+6okRNe3jrueSUTnrnM0HdhmWNaXGlwWxV
 M1jv0TxJ2nptK9l+dskb9xhc+Vhtc3Ex1BEWOpcBUSRR4tdigAv1sT+hKtAb/sEH/0haFU1T2de
 kU0oB3nEiQ6hTEoPSR5n75Crw10kgLYVs51OGmqCh47HeJql9ut217FyW5wqKzA7snD992A7cmb
 1Dw4dngzQvsqCtRkqP2qOXj9xrkv4NUUI1moou3TYIUEZ4liKCFVu1xjEQmj5cKJbokDV4ji4sT
 dZyZDzqmGldJpgdpQftiVYNpFt0oppcr2/uUa6VvuDO9v4zkJe3fqUoN1zVWbhxeRva8c2iZiA+
 cEYOHyPIp1DVgY/rKjg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_04,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 clxscore=1015 bulkscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605110146
X-Rspamd-Queue-Id: 77DAE50EC7B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106946-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[arm.com,collabora.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,linux.dev,poorly.run,somainline.org,vger.kernel.org,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[20];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,oss.qualcomm.com:replyto,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Action: no action

On Fri, May 8, 2026 at 3:41=E2=80=AFAM Boris Brezillon
<boris.brezillon@collabora.com> wrote:
>
> Recently, a few races have been discovered in the GEM LRU logic, all
> of them caused by the fact the LRU lock is accessed through
> gem->lru->lock, and that lock itself also protects changes to
> gem->lru, leading to situations where gem->lru needs to first be
> accessed without the lock held, to then get the lru to access the lock
> through and finally take the lock and do the expected operation.
>
> Currently, the two drivers making use of this API declare device-wide
> locks, and there's no clue that we will ever have a driver that wants
> different pools of LRUs protected by different locks under the same
> drm_device. So we're better off moving this lock to drm_device and
> always locking it through obj->dev->gem_lru_mutex, or directly through
> dev->gem_lru_mutex.
>
> If anyone ever needs more fine-grained locking, this can be revisited
> to pass some drm_gem_lru_pool object represent the pool of LRUs under
> a specific lock, but for now, the per-device lock seems to be enough.
>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Reviewed-by: Rob Clark <rob.clark@oss.qualcomm.com>

> ---
>  drivers/gpu/drm/drm_drv.c                |  2 ++
>  drivers/gpu/drm/drm_gem.c                | 49 ++++++++------------------=
------
>  drivers/gpu/drm/msm/msm_drv.c            | 11 ++++---
>  drivers/gpu/drm/msm/msm_drv.h            |  7 -----
>  drivers/gpu/drm/msm/msm_gem.c            | 32 ++++++++++-----------
>  drivers/gpu/drm/msm/msm_gem_shrinker.c   |  4 +--
>  drivers/gpu/drm/msm/msm_gem_submit.c     |  6 ++--
>  drivers/gpu/drm/msm/msm_gem_vma.c        | 12 ++++----
>  drivers/gpu/drm/msm/msm_ringbuffer.c     |  6 ++--
>  drivers/gpu/drm/panthor/panthor_device.h |  3 --
>  drivers/gpu/drm/panthor/panthor_gem.c    | 21 ++++++--------
>  drivers/gpu/drm/panthor/panthor_mmu.c    | 29 ++++++++++---------
>  include/drm/drm_device.h                 |  7 +++++
>  include/drm/drm_gem.h                    | 20 ++++++-------
>  14 files changed, 88 insertions(+), 121 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index 985c283cf59f..675675480da4 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -697,6 +697,7 @@ static void drm_dev_init_release(struct drm_device *d=
ev, void *res)
>         mutex_destroy(&dev->master_mutex);
>         mutex_destroy(&dev->clientlist_mutex);
>         mutex_destroy(&dev->filelist_mutex);
> +       mutex_destroy(&dev->gem_lru_mutex);
>  }
>
>  static int drm_dev_init(struct drm_device *dev,
> @@ -738,6 +739,7 @@ static int drm_dev_init(struct drm_device *dev,
>         INIT_LIST_HEAD(&dev->vblank_event_list);
>
>         spin_lock_init(&dev->event_lock);
> +       mutex_init(&dev->gem_lru_mutex);
>         mutex_init(&dev->filelist_mutex);
>         mutex_init(&dev->clientlist_mutex);
>         mutex_init(&dev->master_mutex);
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index c85a39b8b163..a0e6668e93f2 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -1127,8 +1127,6 @@ drm_gem_lru_remove_locked(struct drm_gem_object *ob=
j)
>  void
>  drm_gem_object_release(struct drm_gem_object *obj)
>  {
> -       struct drm_gem_lru *lru;
> -
>         if (obj->filp)
>                 fput(obj->filp);
>
> @@ -1136,30 +1134,7 @@ drm_gem_object_release(struct drm_gem_object *obj)
>
>         drm_gem_free_mmap_offset(obj);
>
> -       /*
> -        * We do the lru !=3D NULL check without the lru->lock held, whic=
h
> -        * means we might end up with a stale lru value by the time the
> -        * lock is acquired.
> -        *
> -        * This is deemed safe because:
> -        * 1. the LRU is assumed to outlive any GEM object it was attache=
d
> -        *    (LRUs are usually bound to a drm_device). So even if obj->l=
ru
> -        *    has become NULL, it still point to a valid object that can
> -        *    safely be dereferenced to get the lock.
> -        *
> -        * 2. all LRUs a GEM object might be attached to must share the s=
ame
> -        *    lock (lock that's usually part of the driver-specific devic=
e
> -        *    object), so taking the lock on the 'old' LRU is equivalent
> -        *    to taking it on the new one (if any)
> -        */
> -       lru =3D obj->lru;
> -       if (lru) {
> -               guard(mutex)(lru->lock);
> -
> -               /* Check a second time with the lock held to make sure we=
're
> -                * not racing with the drm_gem_lru_remove_locked() call i=
n
> -                * drm_gem_lru_scan().
> -                */
> +       scoped_guard(mutex, &obj->dev->gem_lru_mutex) {
>                 if (obj->lru)
>                         drm_gem_lru_remove_locked(obj);
>         }
> @@ -1582,9 +1557,8 @@ EXPORT_SYMBOL(drm_gem_unlock_reservations);
>   * @lock: The lock protecting the LRU
>   */
>  void
> -drm_gem_lru_init(struct drm_gem_lru *lru, struct mutex *lock)
> +drm_gem_lru_init(struct drm_gem_lru *lru)
>  {
> -       lru->lock =3D lock;
>         lru->count =3D 0;
>         INIT_LIST_HEAD(&lru->list);
>  }
> @@ -1601,7 +1575,7 @@ EXPORT_SYMBOL(drm_gem_lru_init);
>  void
>  drm_gem_lru_move_tail_locked(struct drm_gem_lru *lru, struct drm_gem_obj=
ect *obj)
>  {
> -       lockdep_assert_held_once(lru->lock);
> +       lockdep_assert_held_once(&obj->dev->gem_lru_mutex);
>
>         if (obj->lru)
>                 drm_gem_lru_remove_locked(obj);
> @@ -1625,9 +1599,9 @@ EXPORT_SYMBOL(drm_gem_lru_move_tail_locked);
>  void
>  drm_gem_lru_move_tail(struct drm_gem_lru *lru, struct drm_gem_object *ob=
j)
>  {
> -       mutex_lock(lru->lock);
> +       mutex_lock(&obj->dev->gem_lru_mutex);
>         drm_gem_lru_move_tail_locked(lru, obj);
> -       mutex_unlock(lru->lock);
> +       mutex_unlock(&obj->dev->gem_lru_mutex);
>  }
>  EXPORT_SYMBOL(drm_gem_lru_move_tail);
>
> @@ -1648,7 +1622,8 @@ EXPORT_SYMBOL(drm_gem_lru_move_tail);
>   * @ticket: Optional ww_acquire_ctx context to use for locking
>   */
>  unsigned long
> -drm_gem_lru_scan(struct drm_gem_lru *lru,
> +drm_gem_lru_scan(struct drm_device *dev,
> +                struct drm_gem_lru *lru,
>                  unsigned int nr_to_scan,
>                  unsigned long *remaining,
>                  bool (*shrink)(struct drm_gem_object *obj, struct ww_acq=
uire_ctx *ticket),
> @@ -1658,9 +1633,9 @@ drm_gem_lru_scan(struct drm_gem_lru *lru,
>         struct drm_gem_object *obj;
>         unsigned freed =3D 0;
>
> -       drm_gem_lru_init(&still_in_lru, lru->lock);
> +       drm_gem_lru_init(&still_in_lru);
>
> -       mutex_lock(lru->lock);
> +       mutex_lock(&dev->gem_lru_mutex);
>
>         while (freed < nr_to_scan) {
>                 obj =3D list_first_entry_or_null(&lru->list, typeof(*obj)=
, lru_node);
> @@ -1685,7 +1660,7 @@ drm_gem_lru_scan(struct drm_gem_lru *lru,
>                  * rest of the loop body, to reduce contention with other
>                  * code paths that need the LRU lock
>                  */
> -               mutex_unlock(lru->lock);
> +               mutex_unlock(&dev->gem_lru_mutex);
>
>                 if (ticket)
>                         ww_acquire_init(ticket, &reservation_ww_class);
> @@ -1729,7 +1704,7 @@ drm_gem_lru_scan(struct drm_gem_lru *lru,
>
>  tail:
>                 drm_gem_object_put(obj);
> -               mutex_lock(lru->lock);
> +               mutex_lock(&dev->gem_lru_mutex);
>         }
>
>         /*
> @@ -1741,7 +1716,7 @@ drm_gem_lru_scan(struct drm_gem_lru *lru,
>         list_splice_tail(&still_in_lru.list, &lru->list);
>         lru->count +=3D still_in_lru.count;
>
> -       mutex_unlock(lru->lock);
> +       mutex_unlock(&dev->gem_lru_mutex);
>
>         return freed;
>  }
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.=
c
> index 195f40e331e5..cc2bcd14b1c2 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -128,11 +128,10 @@ static int msm_drm_init(struct device *dev, const s=
truct drm_driver *drv,
>         /*
>          * Initialize the LRUs:
>          */
> -       mutex_init(&priv->lru.lock);
> -       drm_gem_lru_init(&priv->lru.unbacked, &priv->lru.lock);
> -       drm_gem_lru_init(&priv->lru.pinned,   &priv->lru.lock);
> -       drm_gem_lru_init(&priv->lru.willneed, &priv->lru.lock);
> -       drm_gem_lru_init(&priv->lru.dontneed, &priv->lru.lock);
> +       drm_gem_lru_init(&priv->lru.unbacked);
> +       drm_gem_lru_init(&priv->lru.pinned);
> +       drm_gem_lru_init(&priv->lru.willneed);
> +       drm_gem_lru_init(&priv->lru.dontneed);
>
>         /* Initialize stall-on-fault */
>         spin_lock_init(&priv->fault_stall_lock);
> @@ -140,7 +139,7 @@ static int msm_drm_init(struct device *dev, const str=
uct drm_driver *drv,
>
>         /* Teach lockdep about lock ordering wrt. shrinker: */
>         fs_reclaim_acquire(GFP_KERNEL);
> -       might_lock(&priv->lru.lock);
> +       might_lock(&ddev->gem_lru_mutex);
>         fs_reclaim_release(GFP_KERNEL);
>
>         if (priv->kms_init) {
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.=
h
> index 76ac61df0b35..c3fb3205f683 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -150,13 +150,6 @@ struct msm_drm_private {
>                  * DONTNEED state (ie. can be purged)
>                  */
>                 struct drm_gem_lru dontneed;
> -
> -               /**
> -                * lock:
> -                *
> -                * Protects manipulation of all of the LRUs.
> -                */
> -               struct mutex lock;
>         } lru;
>
>         struct notifier_block vmap_notifier;
> diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.=
c
> index 2cb3ab04f125..070f5fc4bc17 100644
> --- a/drivers/gpu/drm/msm/msm_gem.c
> +++ b/drivers/gpu/drm/msm/msm_gem.c
> @@ -177,11 +177,11 @@ static void update_lru_locked(struct drm_gem_object=
 *obj)
>
>  static void update_lru(struct drm_gem_object *obj)
>  {
> -       struct msm_drm_private *priv =3D obj->dev->dev_private;
> +       struct drm_device *dev =3D obj->dev;
>
> -       mutex_lock(&priv->lru.lock);
> +       mutex_lock(&dev->gem_lru_mutex);
>         update_lru_locked(obj);
> -       mutex_unlock(&priv->lru.lock);
> +       mutex_unlock(&dev->gem_lru_mutex);
>  }
>
>  static struct page **get_pages(struct drm_gem_object *obj)
> @@ -292,11 +292,11 @@ void msm_gem_pin_obj_locked(struct drm_gem_object *=
obj)
>
>  static void pin_obj_locked(struct drm_gem_object *obj)
>  {
> -       struct msm_drm_private *priv =3D obj->dev->dev_private;
> +       struct drm_device *dev =3D obj->dev;
>
> -       mutex_lock(&priv->lru.lock);
> +       mutex_lock(&dev->gem_lru_mutex);
>         msm_gem_pin_obj_locked(obj);
> -       mutex_unlock(&priv->lru.lock);
> +       mutex_unlock(&dev->gem_lru_mutex);
>  }
>
>  struct page **msm_gem_pin_pages_locked(struct drm_gem_object *obj)
> @@ -487,16 +487,16 @@ int msm_gem_pin_vma_locked(struct drm_gem_object *o=
bj, struct drm_gpuva *vma)
>
>  void msm_gem_unpin_locked(struct drm_gem_object *obj)
>  {
> -       struct msm_drm_private *priv =3D obj->dev->dev_private;
> +       struct drm_device *dev =3D obj->dev;
>         struct msm_gem_object *msm_obj =3D to_msm_bo(obj);
>
>         msm_gem_assert_locked(obj);
>
> -       mutex_lock(&priv->lru.lock);
> +       mutex_lock(&dev->gem_lru_mutex);
>         msm_obj->pin_count--;
>         GEM_WARN_ON(msm_obj->pin_count < 0);
>         update_lru_locked(obj);
> -       mutex_unlock(&priv->lru.lock);
> +       mutex_unlock(&dev->gem_lru_mutex);
>  }
>
>  /* Special unpin path for use in fence-signaling path, avoiding the need
> @@ -507,10 +507,10 @@ void msm_gem_unpin_locked(struct drm_gem_object *ob=
j)
>   */
>  void msm_gem_unpin_active(struct drm_gem_object *obj)
>  {
> -       struct msm_drm_private *priv =3D obj->dev->dev_private;
> +       struct drm_device *dev =3D obj->dev;
>         struct msm_gem_object *msm_obj =3D to_msm_bo(obj);
>
> -       GEM_WARN_ON(!mutex_is_locked(&priv->lru.lock));
> +       GEM_WARN_ON(!mutex_is_locked(&dev->gem_lru_mutex));
>
>         msm_obj->pin_count--;
>         GEM_WARN_ON(msm_obj->pin_count < 0);
> @@ -797,12 +797,12 @@ void msm_gem_put_vaddr(struct drm_gem_object *obj)
>   */
>  int msm_gem_madvise(struct drm_gem_object *obj, unsigned madv)
>  {
> -       struct msm_drm_private *priv =3D obj->dev->dev_private;
> +       struct drm_device *dev =3D obj->dev;
>         struct msm_gem_object *msm_obj =3D to_msm_bo(obj);
>
>         msm_gem_lock(obj);
>
> -       mutex_lock(&priv->lru.lock);
> +       mutex_lock(&dev->gem_lru_mutex);
>
>         if (msm_obj->madv !=3D __MSM_MADV_PURGED)
>                 msm_obj->madv =3D madv;
> @@ -814,7 +814,7 @@ int msm_gem_madvise(struct drm_gem_object *obj, unsig=
ned madv)
>          */
>         update_lru_locked(obj);
>
> -       mutex_unlock(&priv->lru.lock);
> +       mutex_unlock(&dev->gem_lru_mutex);
>
>         msm_gem_unlock(obj);
>
> @@ -839,10 +839,10 @@ void msm_gem_purge(struct drm_gem_object *obj)
>
>         put_pages(obj);
>
> -       mutex_lock(&priv->lru.lock);
> +       mutex_lock(&dev->gem_lru_mutex);
>         /* A one-way transition: */
>         msm_obj->madv =3D __MSM_MADV_PURGED;
> -       mutex_unlock(&priv->lru.lock);
> +       mutex_unlock(&dev->gem_lru_mutex);
>
>         drm_gem_free_mmap_offset(obj);
>
> diff --git a/drivers/gpu/drm/msm/msm_gem_shrinker.c b/drivers/gpu/drm/msm=
/msm_gem_shrinker.c
> index 31fa51a44f86..c07af9602fee 100644
> --- a/drivers/gpu/drm/msm/msm_gem_shrinker.c
> +++ b/drivers/gpu/drm/msm/msm_gem_shrinker.c
> @@ -186,7 +186,7 @@ msm_gem_shrinker_scan(struct shrinker *shrinker, stru=
ct shrink_control *sc)
>                 if (!stages[i].cond)
>                         continue;
>                 stages[i].freed =3D
> -                       drm_gem_lru_scan(stages[i].lru, nr,
> +                       drm_gem_lru_scan(priv->dev, stages[i].lru, nr,
>                                          &stages[i].remaining,
>                                          stages[i].shrink,
>                                          &ticket);
> @@ -255,7 +255,7 @@ msm_gem_shrinker_vmap(struct notifier_block *nb, unsi=
gned long event, void *ptr)
>         unsigned long remaining =3D 0;
>
>         for (idx =3D 0; lrus[idx] && unmapped < vmap_shrink_limit; idx++)=
 {
> -               unmapped +=3D drm_gem_lru_scan(lrus[idx],
> +               unmapped +=3D drm_gem_lru_scan(priv->dev, lrus[idx],
>                                              vmap_shrink_limit - unmapped=
,
>                                              &remaining,
>                                              vmap_shrink,
> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/m=
sm_gem_submit.c
> index 26ea8a28be47..3c6bc90c3d48 100644
> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> @@ -352,7 +352,7 @@ static int submit_fence_sync(struct msm_gem_submit *s=
ubmit)
>
>  static int submit_pin_objects(struct msm_gem_submit *submit)
>  {
> -       struct msm_drm_private *priv =3D submit->dev->dev_private;
> +       struct drm_device *dev =3D submit->dev;
>         int i, ret =3D 0;
>
>         for (i =3D 0; i < submit->nr_bos; i++) {
> @@ -381,11 +381,11 @@ static int submit_pin_objects(struct msm_gem_submit=
 *submit)
>          * get_pages() which could trigger reclaim.. and if we held the L=
RU lock
>          * could trigger deadlock with the shrinker).
>          */
> -       mutex_lock(&priv->lru.lock);
> +       mutex_lock(&dev->gem_lru_mutex);
>         for (i =3D 0; i < submit->nr_bos; i++) {
>                 msm_gem_pin_obj_locked(submit->bos[i].obj);
>         }
> -       mutex_unlock(&priv->lru.lock);
> +       mutex_unlock(&dev->gem_lru_mutex);
>
>         submit->bos_pinned =3D true;
>
> diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_=
gem_vma.c
> index 271691ae32c3..3ed05ab0eeef 100644
> --- a/drivers/gpu/drm/msm/msm_gem_vma.c
> +++ b/drivers/gpu/drm/msm/msm_gem_vma.c
> @@ -702,7 +702,7 @@ static struct dma_fence *
>  msm_vma_job_run(struct drm_sched_job *_job)
>  {
>         struct msm_vm_bind_job *job =3D to_msm_vm_bind_job(_job);
> -       struct msm_drm_private *priv =3D job->vm->drm->dev_private;
> +       struct drm_device *dev =3D job->vm->drm;
>         struct msm_gem_vm *vm =3D to_msm_vm(job->vm);
>         struct drm_gem_object *obj;
>         int ret =3D vm->unusable ? -EINVAL : 0;
> @@ -745,13 +745,13 @@ msm_vma_job_run(struct drm_sched_job *_job)
>         if (ret)
>                 msm_gem_vm_unusable(job->vm);
>
> -       mutex_lock(&priv->lru.lock);
> +       mutex_lock(&dev->gem_lru_mutex);
>
>         job_foreach_bo (obj, job) {
>                 msm_gem_unpin_active(obj);
>         }
>
> -       mutex_unlock(&priv->lru.lock);
> +       mutex_unlock(&dev->gem_lru_mutex);
>
>         /* VM_BIND ops are synchronous, so no fence to wait on: */
>         return NULL;
> @@ -1304,7 +1304,7 @@ vm_bind_job_pin_objects(struct msm_vm_bind_job *job=
)
>                         return PTR_ERR(pages);
>         }
>
> -       struct msm_drm_private *priv =3D job->vm->drm->dev_private;
> +       struct drm_device *dev =3D job->vm->drm;
>
>         /*
>          * A second loop while holding the LRU lock (a) avoids acquiring/=
dropping
> @@ -1313,10 +1313,10 @@ vm_bind_job_pin_objects(struct msm_vm_bind_job *j=
ob)
>          * get_pages() which could trigger reclaim.. and if we held the L=
RU lock
>          * could trigger deadlock with the shrinker).
>          */
> -       mutex_lock(&priv->lru.lock);
> +       mutex_lock(&dev->gem_lru_mutex);
>         job_foreach_bo (obj, job)
>                 msm_gem_pin_obj_locked(obj);
> -       mutex_unlock(&priv->lru.lock);
> +       mutex_unlock(&dev->gem_lru_mutex);
>
>         job->bos_pinned =3D true;
>
> diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c b/drivers/gpu/drm/msm/m=
sm_ringbuffer.c
> index a7dafa7ab4b1..0d14c31bd4e4 100644
> --- a/drivers/gpu/drm/msm/msm_ringbuffer.c
> +++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
> @@ -16,13 +16,13 @@ static struct dma_fence *msm_job_run(struct drm_sched=
_job *job)
>         struct msm_gem_submit *submit =3D to_msm_submit(job);
>         struct msm_fence_context *fctx =3D submit->ring->fctx;
>         struct msm_gpu *gpu =3D submit->gpu;
> -       struct msm_drm_private *priv =3D gpu->dev->dev_private;
> +       struct drm_device *dev =3D gpu->dev;
>         unsigned nr_cmds =3D submit->nr_cmds;
>         int i;
>
>         msm_fence_init(submit->hw_fence, fctx);
>
> -       mutex_lock(&priv->lru.lock);
> +       mutex_lock(&dev->gem_lru_mutex);
>
>         for (i =3D 0; i < submit->nr_bos; i++) {
>                 struct drm_gem_object *obj =3D submit->bos[i].obj;
> @@ -32,7 +32,7 @@ static struct dma_fence *msm_job_run(struct drm_sched_j=
ob *job)
>
>         submit->bos_pinned =3D false;
>
> -       mutex_unlock(&priv->lru.lock);
> +       mutex_unlock(&dev->gem_lru_mutex);
>
>         /* TODO move submit path over to using a per-ring lock.. */
>         mutex_lock(&gpu->lock);
> diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/p=
anthor/panthor_device.h
> index dcdce75b683b..cc5720312fa9 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.h
> +++ b/drivers/gpu/drm/panthor/panthor_device.h
> @@ -187,9 +187,6 @@ struct panthor_device {
>                 /** @reclaim.shrinker: Shrinker instance */
>                 struct shrinker *shrinker;
>
> -               /** @reclaim.lock: Lock protecting all LRUs */
> -               struct mutex lock;
> -
>                 /**
>                  * @reclaim.unreclaimable: unreclaimable BOs
>                  *
> diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/pant=
hor/panthor_gem.c
> index 8e31740126e7..450516d55faa 100644
> --- a/drivers/gpu/drm/panthor/panthor_gem.c
> +++ b/drivers/gpu/drm/panthor/panthor_gem.c
> @@ -1497,13 +1497,13 @@ panthor_gem_shrinker_scan(struct shrinker *shrink=
er, struct shrink_control *sc)
>         if (!can_swap())
>                 goto out;
>
> -       freed +=3D drm_gem_lru_scan(&ptdev->reclaim.unused,
> +       freed +=3D drm_gem_lru_scan(&ptdev->base, &ptdev->reclaim.unused,
>                                   sc->nr_to_scan - freed, &remaining,
>                                   panthor_gem_try_evict_no_resv_wait, NUL=
L);
>         if (freed >=3D sc->nr_to_scan)
>                 goto out;
>
> -       freed +=3D drm_gem_lru_scan(&ptdev->reclaim.mmapped,
> +       freed +=3D drm_gem_lru_scan(&ptdev->base, &ptdev->reclaim.mmapped=
,
>                                   sc->nr_to_scan - freed, &remaining,
>                                   panthor_gem_try_evict_no_resv_wait, NUL=
L);
>         if (freed >=3D sc->nr_to_scan)
> @@ -1517,7 +1517,7 @@ panthor_gem_shrinker_scan(struct shrinker *shrinker=
, struct shrink_control *sc)
>         if (freed >=3D sc->nr_to_scan)
>                 goto out;
>
> -       freed +=3D drm_gem_lru_scan(&ptdev->reclaim.gpu_mapped_shared,
> +       freed +=3D drm_gem_lru_scan(&ptdev->base, &ptdev->reclaim.gpu_map=
ped_shared,
>                                   sc->nr_to_scan - freed, &remaining,
>                                   panthor_gem_try_evict, NULL);
>
> @@ -1546,22 +1546,17 @@ panthor_gem_shrinker_scan(struct shrinker *shrink=
er, struct shrink_control *sc)
>  int panthor_gem_shrinker_init(struct panthor_device *ptdev)
>  {
>         struct shrinker *shrinker;
> -       int ret;
> -
> -       ret =3D drmm_mutex_init(&ptdev->base, &ptdev->reclaim.lock);
> -       if (ret)
> -               return ret;
>
>         INIT_LIST_HEAD(&ptdev->reclaim.vms);
> -       drm_gem_lru_init(&ptdev->reclaim.unreclaimable, &ptdev->reclaim.l=
ock);
> -       drm_gem_lru_init(&ptdev->reclaim.unused, &ptdev->reclaim.lock);
> -       drm_gem_lru_init(&ptdev->reclaim.mmapped, &ptdev->reclaim.lock);
> -       drm_gem_lru_init(&ptdev->reclaim.gpu_mapped_shared, &ptdev->recla=
im.lock);
> +       drm_gem_lru_init(&ptdev->reclaim.unreclaimable);
> +       drm_gem_lru_init(&ptdev->reclaim.unused);
> +       drm_gem_lru_init(&ptdev->reclaim.mmapped);
> +       drm_gem_lru_init(&ptdev->reclaim.gpu_mapped_shared);
>         ptdev->reclaim.gpu_mapped_count =3D 0;
>
>         /* Teach lockdep about lock ordering wrt. shrinker: */
>         fs_reclaim_acquire(GFP_KERNEL);
> -       might_lock(&ptdev->reclaim.lock);
> +       might_lock(&ptdev->base.gem_lru_mutex);
>         fs_reclaim_release(GFP_KERNEL);
>
>         shrinker =3D shrinker_alloc(0, "drm-panthor-gem");
> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/pant=
hor/panthor_mmu.c
> index 452d0b6d4668..9d4500850561 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> @@ -715,10 +715,10 @@ int panthor_vm_active(struct panthor_vm *vm)
>          * never became active in the first place will be reclaimed last,=
 but
>          * that's an acceptable trade-off.
>          */
> -       mutex_lock(&ptdev->reclaim.lock);
> +       mutex_lock(&ptdev->base.gem_lru_mutex);
>         if (vm->reclaim.lru.count)
>                 list_move_tail(&vm->reclaim.lru_node, &ptdev->reclaim.vms=
);
> -       mutex_unlock(&ptdev->reclaim.lock);
> +       mutex_unlock(&ptdev->base.gem_lru_mutex);
>
>         /* Make sure we don't race with lock/unlock_region() calls
>          * happening around VM bind operations.
> @@ -1962,9 +1962,9 @@ static void panthor_vm_free(struct drm_gpuvm *gpuvm=
)
>         struct panthor_vm *vm =3D container_of(gpuvm, struct panthor_vm, =
base);
>         struct panthor_device *ptdev =3D vm->ptdev;
>
> -       mutex_lock(&ptdev->reclaim.lock);
> +       mutex_lock(&ptdev->base.gem_lru_mutex);
>         list_del_init(&vm->reclaim.lru_node);
> -       mutex_unlock(&ptdev->reclaim.lock);
> +       mutex_unlock(&ptdev->base.gem_lru_mutex);
>
>         mutex_lock(&vm->heaps.lock);
>         if (drm_WARN_ON(&ptdev->base, vm->heaps.pool))
> @@ -2360,11 +2360,11 @@ void panthor_vm_update_bo_reclaim_lru_locked(stru=
ct panthor_gem_object *bo)
>                 drm_WARN_ON(&ptdev->base, vm);
>                 vm =3D container_of(vm_bo->vm, struct panthor_vm, base);
>
> -               mutex_lock(&ptdev->reclaim.lock);
> +               mutex_lock(&ptdev->base.gem_lru_mutex);
>                 drm_gem_lru_move_tail_locked(&vm->reclaim.lru, &bo->base)=
;
>                 if (list_empty(&vm->reclaim.lru_node))
>                         list_move(&vm->reclaim.lru_node, &ptdev->reclaim.=
vms);
> -               mutex_unlock(&ptdev->reclaim.lock);
> +               mutex_unlock(&ptdev->base.gem_lru_mutex);
>         }
>  }
>
> @@ -2774,7 +2774,7 @@ panthor_vm_create(struct panthor_device *ptdev, boo=
l for_mcu,
>         vm->kernel_auto_va.start =3D auto_kernel_va_start;
>         vm->kernel_auto_va.end =3D vm->kernel_auto_va.start + auto_kernel=
_va_size - 1;
>
> -       drm_gem_lru_init(&vm->reclaim.lru, &ptdev->reclaim.lock);
> +       drm_gem_lru_init(&vm->reclaim.lru);
>         INIT_LIST_HEAD(&vm->reclaim.lru_node);
>         INIT_LIST_HEAD(&vm->node);
>         INIT_LIST_HEAD(&vm->as.lru_node);
> @@ -3140,7 +3140,7 @@ panthor_mmu_reclaim_priv_bos(struct panthor_device =
*ptdev,
>         LIST_HEAD(remaining_vms);
>         LIST_HEAD(vms);
>
> -       mutex_lock(&ptdev->reclaim.lock);
> +       mutex_lock(&ptdev->base.gem_lru_mutex);
>         list_splice_init(&ptdev->reclaim.vms, &vms);
>
>         while (freed < nr_to_scan) {
> @@ -3156,12 +3156,13 @@ panthor_mmu_reclaim_priv_bos(struct panthor_devic=
e *ptdev,
>                         continue;
>                 }
>
> -               mutex_unlock(&ptdev->reclaim.lock);
> +               mutex_unlock(&ptdev->base.gem_lru_mutex);
>
> -               freed +=3D drm_gem_lru_scan(&vm->reclaim.lru, nr_to_scan =
- freed,
> +               freed +=3D drm_gem_lru_scan(&ptdev->base, &vm->reclaim.lr=
u,
> +                                         nr_to_scan - freed,
>                                           remaining, shrink, NULL);
>
> -               mutex_lock(&ptdev->reclaim.lock);
> +               mutex_lock(&ptdev->base.gem_lru_mutex);
>
>                 /* If the VM is still in the temporary list, remove it so=
 we
>                  * can proceed with the next VM.
> @@ -3177,11 +3178,11 @@ panthor_mmu_reclaim_priv_bos(struct panthor_devic=
e *ptdev,
>                                 list_add_tail(&vm->reclaim.lru_node, &rem=
aining_vms);
>                 }
>
> -               mutex_unlock(&ptdev->reclaim.lock);
> +               mutex_unlock(&ptdev->base.gem_lru_mutex);
>
>                 panthor_vm_put(vm);
>
> -               mutex_lock(&ptdev->reclaim.lock);
> +               mutex_lock(&ptdev->base.gem_lru_mutex);
>         }
>
>         /* Re-insert VMs with remaining data to reclaim at the beginning =
of
> @@ -3192,7 +3193,7 @@ panthor_mmu_reclaim_priv_bos(struct panthor_device =
*ptdev,
>          */
>         list_splice_tail(&vms, &remaining_vms);
>         list_splice(&remaining_vms, &ptdev->reclaim.vms);
> -       mutex_unlock(&ptdev->reclaim.lock);
> +       mutex_unlock(&ptdev->base.gem_lru_mutex);
>
>         return freed;
>  }
> diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
> index bc78fb77cc27..768a8dae83c5 100644
> --- a/include/drm/drm_device.h
> +++ b/include/drm/drm_device.h
> @@ -375,6 +375,13 @@ struct drm_device {
>          * Root directory for debugfs files.
>          */
>         struct dentry *debugfs_root;
> +
> +       /**
> +        * @gem_lru_mutex:
> +        *
> +        * Lock protecting movement of GEM objects between LRUs.
> +        */
> +       struct mutex gem_lru_mutex;
>  };
>
>  void drm_dev_set_dma_dev(struct drm_device *dev, struct device *dma_dev)=
;
> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> index d527df98d142..dd1a9cd559be 100644
> --- a/include/drm/drm_gem.h
> +++ b/include/drm/drm_gem.h
> @@ -245,17 +245,11 @@ struct drm_gem_object_funcs {
>   * for lockless &shrinker.count_objects, and provides
>   * &drm_gem_lru_scan for driver's &shrinker.scan_objects
>   * implementation.
> + *
> + * Any access to this kind of object must be done with
> + * drm_device::gem_lru_mutex held.
>   */
>  struct drm_gem_lru {
> -       /**
> -        * @lock:
> -        *
> -        * Lock protecting movement of GEM objects between LRUs.  All
> -        * LRUs that the object can move between should be protected
> -        * by the same lock.
> -        */
> -       struct mutex *lock;
> -
>         /**
>          * @count:
>          *
> @@ -453,6 +447,9 @@ struct drm_gem_object {
>          * @lru:
>          *
>          * The current LRU list that the GEM object is on.
> +        *
> +        * Access to this field must be done with drm_device::gem_lru_mut=
ex
> +        * held.
>          */
>         struct drm_gem_lru *lru;
>  };
> @@ -610,11 +607,12 @@ void drm_gem_unlock_reservations(struct drm_gem_obj=
ect **objs, int count,
>  int drm_gem_dumb_map_offset(struct drm_file *file, struct drm_device *de=
v,
>                             u32 handle, u64 *offset);
>
> -void drm_gem_lru_init(struct drm_gem_lru *lru, struct mutex *lock);
> +void drm_gem_lru_init(struct drm_gem_lru *lru);
>  void drm_gem_lru_move_tail_locked(struct drm_gem_lru *lru, struct drm_ge=
m_object *obj);
>  void drm_gem_lru_move_tail(struct drm_gem_lru *lru, struct drm_gem_objec=
t *obj);
>  unsigned long
> -drm_gem_lru_scan(struct drm_gem_lru *lru,
> +drm_gem_lru_scan(struct drm_device *dev,
> +                struct drm_gem_lru *lru,
>                  unsigned int nr_to_scan,
>                  unsigned long *remaining,
>                  bool (*shrink)(struct drm_gem_object *obj, struct ww_acq=
uire_ctx *ticket),
>
> --
> 2.54.0
>

