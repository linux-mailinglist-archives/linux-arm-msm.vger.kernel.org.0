Return-Path: <linux-arm-msm+bounces-106539-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EKqBFHQG/WkvWwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106539-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 23:39:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE774EF6A3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 23:38:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 757493043FB5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 21:38:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33078348883;
	Thu,  7 May 2026 21:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kA853WPi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ODryl+cW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1EC3346784
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 21:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778189918; cv=pass; b=jFuc1bf/2Ckeuf1ESgoCZ0HgcugOymImnUGjNhbarbU1J2Q2gKHRRuPL80HrL4uoMfWoVhxmzZyiOiRlsiyFvLkDx0g7Bnv8mhamN7AB4EG+t/G66HoipUzEu2CxSm8LhPVlzRKxA9gCIQx7IEZhyNuvw2RI9MAwUX9JNLFnt20=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778189918; c=relaxed/simple;
	bh=S2g2V7wx3eLQ5o7o9qfglNlVk7FH7ScGfevUtLMjvZ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sUc/0V9dxj+s+oLvYykpe9Vzy4zqBors/NYwzWu6fIDmyV72sVUqL9qALDVcbsSMhCYaVYgPb/az/mFr/Bl3BJFjqeaX7TnrNNZ3wCFoCNa2asVtFmT6NfZ9H93ET7SKlYGeRuoWaJwEqqfzTuwhIGMCt0HappZ63emRMEtSHAY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kA853WPi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ODryl+cW; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647IBdiG2770996
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 21:38:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=3YwU5KFss6owZTextGQfE/Tb475sC/CVvKPS35tpqLA=; b=kA
	853WPiT8RHBmH++QTnSBXrYih+OPboZGDdGFicOe+aDQxojVslgqvOIu0XhUFpMT
	rAwdWLZHGG4Bq9f96WZrBTigfuOacXTgBlNNYRgBWcMgrnEmCFcRrEClA5H2WViV
	y2Y98sWE8G5JRwmqZlGBL9b+pap1zHlwYxVcbBcsZD9vmXmUZh7KhbCnQ4byk0EU
	Jhy0ucVLVTiCHPM1YG0T+02DrJprlIGW3tbSlIB9J+1d4tq8haxQL8mds46GMCFz
	/tgTAcnAzOOdFqZIEp6ORTSzKig3IrxQknNMKaX9lB/N3b/LNwtAciF9YEJWtxa1
	V2vkZxkEhEFKCBVBhTbQ==
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0yt5gnhm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 21:38:35 +0000 (GMT)
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-4344aa5652fso2237113fac.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 14:38:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778189915; cv=none;
        d=google.com; s=arc-20240605;
        b=MNvvkf0UITTEE1f7/nZj3V0xVRJFk5EeYd8JQCm/9yyXQasNfTi+Aq56pvStwanKdf
         /Ifpp7RKGs07/d5+tfw996Kw4wBxCPgoEsMdHGlNM9iws7HG2d6cZnhju9c62G5+8OdC
         VgC/JhBcsFrYmS903WVL4yYbdSbk7eMyHWeho/gx9Bw0zet53WGnzAugJRWwCu8F3Pkh
         r0SraX0PvqZneW8PDTqkMqEKeXA62GbACdddCEMUstjsxIOfoEiCcXcbnMI9FL3Qrnkh
         6zEGGRh3uLptV7fNpmBhdOvtuOL0cfFFU84H7cMDe8FJc9ukS/mA8y8pb1bwVQZUEfiz
         kdqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=3YwU5KFss6owZTextGQfE/Tb475sC/CVvKPS35tpqLA=;
        fh=I9Sf95qMyC1kMtwe5jBr8bhdHHiJ9ZRoRlMLtA4PrIU=;
        b=UmdWyNKgUAJ8Df1Qowgm3PftAMFA7/MS5gOhlM+KgCnzSHTXVZ5QGZjfcfGIo88/zS
         AoFjVHsE5wxZ7U8wkxzqXWJsh3oJox2moRwpGFtpZvjQVEIJozwTr+A8fF2Rxvbj683a
         x5SJ4FX9AKH0fxBr3gnTNZEs8XyL6HKHZNFWbQ3IZ7+4J4hytg2NdOTee4bxA0l6JXdp
         OPSIQN7ymXXQj9O9Qscfx9HMpx3BVdpx5l7JgnHRr1m+RCgdaaT7AFtDsF3vLxnZwYxl
         U4l+RMODcRlXAcsvJ4d6hJONvJHnZCjVoGMr66NxoWGVZAsSCr/SeAtf4xpx3M4IM/A4
         pgHA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778189915; x=1778794715; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3YwU5KFss6owZTextGQfE/Tb475sC/CVvKPS35tpqLA=;
        b=ODryl+cWU31FdjeO+GMlk9OLn6BuZzu0nJgFCCQXn3ZXF1lZ38G0o7MR9CQqkaVCDZ
         AGy2puumJV9AHRsid0ja6711VNrza4D8L29j/sIaFBf1WgOK2Toi+5mW7ZRnwbjCJQaJ
         qS8qmiPYl/eY0QPFYrK3I4g4wri2VIK5VN1sv1nIMgXLQsDjFoB8YafIur8v0HBl2iwZ
         ZvgY5PsMhSAStxbDolamS211URxxAHHr/Fe1bUWHsyxHk58jZRYgS05iQ4OxC/7IdHqI
         vAigAT10znJKaUrjiagN6eXViEJunjHFm4Xmm4GvrFIJ0CvXqmnI93MTlpNHHBb9FfUs
         AK/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778189915; x=1778794715;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3YwU5KFss6owZTextGQfE/Tb475sC/CVvKPS35tpqLA=;
        b=E8xKqnoiN70fAel5yhnSIwfa4SQLKA67ulcrpOttKpdJYp3eR3+FgwEtFog8nMTnUv
         0WKLZp62xDc2Vxu7b21maTiFpJQgUA7eyET12hqDiUxebaFzXeDPqxnFSi0z4/vQuXEx
         yWZJZwCnIABfXJxvbDDxNrkLZ6fADcZsz3q0amoBU5HDGc9re+LVdsLuCHbEJpLtW4il
         R6+sTsCGe0wFQkdIQNvCG8jRb/NUycuyk6wu1hBirIfhr6WYn2P9C7qFIdBDm7UycFrO
         gSAycIIsShPYaZiLBVDxjqZivfC+dC5iZ+zemxAbzQdJI4D20poGFwP2XHcE1VBH4xsj
         WpiA==
X-Forwarded-Encrypted: i=1; AFNElJ86DJwyy4WU3YNfr0i9hafp9X8ZiqobACd3npq0mSWExEtV23DHSU9DO+Rp3S3RWtiy3BqeeEdhrcUNq5ih@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6enEqVaXaZPqQyp8GpQuDnmG76mwVRI3aO9BGLoCNPXwEBH93
	Ur4qsj8c2v6uuxcyj/Qsm0VAf4S0UR4i/aBy/DI/mHvAnBkDQ0ip8+yUEcX1f+GqjDEpeWLPzCW
	tIn4CgOUeEARHkOAxDwJNQIDbsZOepTJ4KK/hIcedhgd3i2t5jsFi8rINh3DYHKjDBF3T5wTJmJ
	y5z2NL/48CmHpB+xZNc6iljvUs0tvo8HnTegCBgRTpgYU=
X-Gm-Gg: AeBDietJ67Pinz90HgCCrwFaXUTn2qtfVwXFmD81oBEk27ssW+L5gibqAilLNBXBDPs
	2pdY8Zi7DiSNitvD3AM+czZoqsv2Pq/VAkgXWa7XB9dIJcG4YOWzWi1I0NoNZiHrHAkoVnqEPP6
	X/zqxAYt7bki8raBIM5dlWoNqSc+zWUfDo+z20Q/TlwMdBVeTCh6La74REQLDCkOZrUiHFxWpzJ
	ptIcxljo58ibtuC5IfchJFLD9tPJWDA1bgtI5Ov+KeuyBMQ
X-Received: by 2002:a4a:e918:0:b0:67e:3f0d:4235 with SMTP id 006d021491bc7-69998c9f74emr5764592eaf.11.1778189914661;
        Thu, 07 May 2026 14:38:34 -0700 (PDT)
X-Received: by 2002:a4a:e918:0:b0:67e:3f0d:4235 with SMTP id
 006d021491bc7-69998c9f74emr5764575eaf.11.1778189914197; Thu, 07 May 2026
 14:38:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260506-panthor-shrinker-fixes-v1-0-e7721526de96@collabora.com>
 <20260506-panthor-shrinker-fixes-v1-2-e7721526de96@collabora.com> <20260507144639.68bd699f@fedora>
In-Reply-To: <20260507144639.68bd699f@fedora>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Thu, 7 May 2026 14:38:23 -0700
X-Gm-Features: AVHnY4LVtQidNe4HWkr8vd5IMleFeEOibs3s_XykwrIcXt17q4yGV3Ac0kURMcQ
Message-ID: <CACSVV01zGLN8FV3Fpw1BnW+zSokE7n2XJ2dBmDw8-n=MXBmDnw@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/gem: Fix a race between drm_gem_lru_scan() and drm_gem_object_release()
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
X-Authority-Analysis: v=2.4 cv=Dc0nbPtW c=1 sm=1 tr=0 ts=69fd065b cx=c_pps
 a=Z3eh007fzM5o9awBa1HkYQ==:117 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=e5mUnYsNAAAA:8 a=QX4gbG5DAAAA:8 a=pGLkceISAAAA:8
 a=czZHwOyEVCbUn-AFlY8A:9 a=QEXdDO2ut3YA:10 a=eBU8X_Hb5SQ8N-bgNfv4:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: YzWsoV0uNEZZODG_lb2X7PBtnKUdflm_
X-Proofpoint-ORIG-GUID: YzWsoV0uNEZZODG_lb2X7PBtnKUdflm_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDIxOSBTYWx0ZWRfXxLh+/KhPirV0
 HYpX8shn9eLRGD02VDiNn3sV66kWLzs8MoK7myfk1KYVb6C2zZGGQ4NjKEppObGdJZxCoXawsdp
 ziMpfU0qGk8D/UrieYnNzQLXtu3qsLBol6eLIYv+G927vDRJTRhPT+FxYelpwtBsCARZcMMsPlh
 YQa24heITinjH6/kfXuHIaEa88+DR8h/1JfIMU7u7wFfdA2wLLPjrwTbY908nKfvOdVEftZKCT8
 nigFxzbHM23IjyOSF/d6jHIjDRRtczlo/6EuFduXSJAaFcOPgbzOwG+HvQi2Ou8zPKEUymsyUAo
 qJoMCwzMIjndd3O9NB8PObu/vR4bLTZa/pb+D7GT7kXAyfOj4wQ/8pGMxoHfkw7hlpD0ZibkskQ
 AG7VSFFKJlhmD6HSM2ufwId6dlIUscNOx48ai+frZVq3eUr5SDR0Z27oMMDDSGtTJPaeZACZBYB
 xS6SEOhff1BwOmih0oQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070219
X-Rspamd-Queue-Id: AFE774EF6A3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106539-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[arm.com,collabora.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,linux.dev,poorly.run,somainline.org,vger.kernel.org,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[rob.clark@oss.qualcomm.com];
	RCVD_COUNT_FIVE(0.00)[6];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rob.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,oss.qualcomm.com:replyto,oss.qualcomm.com:dkim,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Thu, May 7, 2026 at 5:46=E2=80=AFAM Boris Brezillon
<boris.brezillon@collabora.com> wrote:
>
> On Wed, 06 May 2026 14:16:27 +0200
> Boris Brezillon <boris.brezillon@collabora.com> wrote:
>
> > The following race can currently happen:
> >
> > | Thread 0 in `drm_gem_lru_scan`               | Thread 1 in `drm_gem_o=
bject_release` |
> > | -                                            | -                     =
               |
> > | move obj1 with refcount=3D=3D0 to `still_in_lru` |                   =
                   |
> > | move obj2 with refcount!=3D0 to `still_in_lru` |                     =
                 |
> > | mutex_unlock                                 |                       =
               |
> > | shrink obj2                                  |                       =
               |
> > |                                              | lru =3D obj1->lru; // =
`still_in_lru`   |
> > | mutex_lock                                   |                       =
               |
> > | move obj1 back to the original lru           |                       =
               |
> > | mutex_unlock                                 |                       =
               |
> > | return                                       |                       =
               |
> > |                                              | dereference `still_in_=
lru`           |
> >
> > Move the drm_gem_lru_move_tail_locked() after the
> > kref_get_unless_zero() check so that we don't end up with a
> > vanishing LRU when we hit drm_gem_object_release(). We also need to
> > remove the skipped object from its LRU, otherwise we'll keep hitting
> > it on subsequent loop iterations until it's actually removed from the
> > list in the drm_gem_release().
> >
> > Fixes: e7c2af13f811 ("drm/gem: Add LRU/shrinker helper")
> > Reported-by: Chia-I Wu <olvaffe@gmail.com>
> > Closes: https://gitlab.freedesktop.org/panfrost/linux/-/work_items/86
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > Reviewed-by: Chia-I Wu <olvaffe@gmail.com>
> > ---
> >  drivers/gpu/drm/drm_gem.c | 14 +++++++++-----
> >  1 file changed, 9 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> > index fca42949eb2b..97cf63de0112 100644
> > --- a/drivers/gpu/drm/drm_gem.c
> > +++ b/drivers/gpu/drm/drm_gem.c
> > @@ -1660,15 +1660,19 @@ drm_gem_lru_scan(struct drm_gem_lru *lru,
> >               if (!obj)
> >                       break;
> >
> > -             drm_gem_lru_move_tail_locked(&still_in_lru, obj);
> > -
> >               /*
> >                * If it's in the process of being freed, gem_object->fre=
e()
> > -              * may be blocked on lock waiting to remove it.  So just
> > -              * skip it.
> > +              * may be blocked on lock waiting to remove it.  So just =
remove
> > +              * it from its current LRU and skip it.
> >                */
> > -             if (!kref_get_unless_zero(&obj->refcount))
> > +             if (!kref_get_unless_zero(&obj->refcount)) {
> > +                     if (obj->lru)
> > +                             drm_gem_lru_remove_locked(obj);
> > +
>
> Actually, this thing is still racy, because obj->lru is dereferenced
> without the lru->lock held in drm_gem_object_release(). At this point
> I'm wondering if we should expose a drm_gem_lru_remove() taking the LRU
> lock as an argument as suggested by Steve, and delegate the
> responsibility to call drm_gem_lru_remove() to the driver. Either that,
> or we make it so the LRU lock is attached to the drm_device instead of
> the GEM (both MSM and panthor assume a device-wide lock for LRU
> manipulation).
>
> Rob, what's your take on this matter?

I don't think there is a race, because of the kref_get_unless_zero().
Other than lru_scan, there shouldn't be cases where someone is moving
an obj between LRUs racing with drm_gem_object_release(), because that
means they don't own a reference on the obj they are manipulating.

That said, I can't really think of a sensible thing to do with more
than a single LRU lock per device.  And it does make things easier to
reason about.

BR,
-R

