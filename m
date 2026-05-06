Return-Path: <linux-arm-msm+bounces-106117-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WDgzD2VB+2lPYgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106117-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 15:25:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 952C64DAEF6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 15:25:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1D19B305C620
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 May 2026 13:21:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D75634779A1;
	Wed,  6 May 2026 13:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pX5hEFks";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="deJVbeH2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB6013EFD1C
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 May 2026 13:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778073718; cv=pass; b=UfamQo5tbm6ER/mZn/HUHinvj/wgki+HsN1L+dH6wHNlLfxZn7jTvN+bqkViXC7pDyRmdOSDFHhj8lWiro1ck6JVK5YMTJtxNbp+DQGpXsiirDOge5YC++OhqEv3HLorqIt5J4mW3b69RZek8Tg7q6Z7A0ueYcznM2WNRu/8y/g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778073718; c=relaxed/simple;
	bh=CIQbUOKhEnuGeaRFBGV0aAPZo0c9h6rXwO8dLNkJSKs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AwgJaXcwAELl1NY4ZV8Ua12C9mUIlP70f/Bj5xZGD8qqcCE1TJHok5FrdA0GImORb4DD5RDs/LvqpN1Au7Rybify+5CdVA5MbneQQ/ngqCzXrHBA37bC6E5zs2YdGvmvwETTT2So/RCtgoGywtscteODeq4NAi0sxOJWmStHP04=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pX5hEFks; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=deJVbeH2; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 646A3YXU1953179
	for <linux-arm-msm@vger.kernel.org>; Wed, 6 May 2026 13:21:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=Vqd/BKSaw8MiEHlZMSqKjEqhHIpkwgJT4q9tI6/8NPk=; b=pX
	5hEFksQefNbV3ibdPFGwC7dq4oNlfdUjEsLggusBYU8JZZfFR47FKfVXUlqDNdwc
	1MLFLkIdXriAPxEzHktv3LSkOSRXg6oGds5U7uBMgbJ5ybBWmT9Z3vZ41Ca2FXpE
	x6TMkA47KoWDf8Jv8xmfrHNOtr8gk+DRLtdRCLBarmeNSsI0pFyfVOXx1YeOguC4
	oIrO7LSk7JWzYqtnsgFXFCaCDP8VAEOEkngI05UY0TPHV/6yUBelJskCfawlXb7v
	G5WcgpnH6yX5ZsgjucqJGJa72qcFpbmmbzUyQjYkEXK2CXdJyRjeQzHHMnZKii+D
	RCu5f2LJZba1Yj0Ob2XQ==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e03jc0kwh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 13:21:55 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-68cfc614246so8409974eaf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 06:21:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778073714; cv=none;
        d=google.com; s=arc-20240605;
        b=BXKL4OsFNjBvdBcaoYVW3KKUaP4f2l19grgHPVKL5/w6AEbwFJ+3XDRgr4hiwdLdn0
         ycZ8lN+9ryucRMStRm5Y2F8bU62nF64DVNrmJY+jmdmVXGn/BQrc7n2dnM75EIxcwvex
         svupnBr8UQbN0CLzRyhBCpR9rhkZ2iQ7Fga9wvMwfc+57OwJAEOEjHxP8nmXj8CciE09
         XQg/snCffVHNYF5FRk7BQmuaXSzKvh5m8Q9lOt/Ewa78f03g/rTWn4ss2QwE9rqd8jg7
         Bq47nYxbLGPprL8p4TteJeh+MwaetZiRcu30F0+1+kklqxZg+eFco39UVXEmhOmuzhH2
         hAEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=Vqd/BKSaw8MiEHlZMSqKjEqhHIpkwgJT4q9tI6/8NPk=;
        fh=KbwKjFRR7v5TsvacCG9ufZOAecxKgLXOlBKNNrHFX8M=;
        b=YakkGsRpc6npihDEaIH9+q4dcCisy8IWUusR7Kgr8nYqSMfmDR56n0nAJwnxsCuEr5
         Y8Xp4zh+rdwYbYNkCuZuIx3Pr+ipU1YRPELr3J5Gu/X/TwZapJMtprcrVk+zKjNmM1Tv
         cDpNyZcqPS5dXDip16qGEgX7r2xpKk7InqvbT8iUV8I3GE1GoJ+jCQfNh5Tlf329pwMH
         oM8neWSF5vtNW3g7rOc0bTsJaMjhC+a92+yXEqq3ohZAhT2hbPXfnIHSNf+qSTLT9aag
         pfAEHNXeb8j9BzFTDVMWPxsGg1fvdwehnEcF850PhUL1WRSVaUCXyqN1+i3e9dtSg6FG
         xfqw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778073714; x=1778678514; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Vqd/BKSaw8MiEHlZMSqKjEqhHIpkwgJT4q9tI6/8NPk=;
        b=deJVbeH2i8vVOB930obfOvmqLLGAHGZonYFC3vKF/54N6IF41Omvia8qFe0X97PFxj
         ohfOKmr0AlhDMZhl7rHL8l3kYm1+x+jlOwUl35QnCv47bNm8rNxoClS3qxCgg9lAsqDP
         ccBSs25TyeHFUfJX04kpqI9pt/XGqlq93V0446yMOchdNWosN96N8zp0OsJjM3G1g7cA
         O5xua3yobGxVPiEUpcbSms/Btwq/t+5SyuuYvrLyYtyzoxFWrdiqgh72MMNpPTGN9D3S
         T/i4FEI+qJipD2XImab/iUZwHP32fBACdztXjqb/ePPUgtHHmTqUdIesbAdnSSVLhx9u
         FsXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778073714; x=1778678514;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vqd/BKSaw8MiEHlZMSqKjEqhHIpkwgJT4q9tI6/8NPk=;
        b=kR/2jOVOAIZEK5wnzmovGrgfJHtxNoSEbUv6lqlwjXFAlXEcr7oxamflUtpWy0UUdB
         4mSxqHSgRUGrG7kblUeIek7RG2dCsOU4wzJLn7FlrP02N2FtiSSxEIwUi1oCP/HQ+E4Q
         Ue2OqKT2OmT6D7heW4n5gpC6UDuh2g1SspOyqGOZBVAOF2yNdPNk+tv8rKlO0gnEJKp+
         bhJHeTxteH7AJsE6uVwMU5zPs4YTA18hHhxZAK0PSK5JVrMhzgDiImM868IukOCguy0O
         +ceECUVoxGkgfVQvgQHt2bx+RV1+YFHNG63Xa60MXz3gwrHLJpMRWHvmkOVFcouUI/Nu
         Fyew==
X-Forwarded-Encrypted: i=1; AFNElJ/hfbYXHucwGCl6rCWPqI8Di74j+muv0QPi9kChbQvF3rBzxaLdk8ZGh0wX7jATbQ3+mdzWc1ufG+1XS3dJ@vger.kernel.org
X-Gm-Message-State: AOJu0YybnX6sByG3exG1c+G4B3mkLCLamoQ6Ab9w5GjLfsoJMmii85QY
	nKMLzL9tBfoXsjnc4OEizirWE1291X9lGzqqgYuev7XkSAeuK3pc/DTGnByxF5JiG5VPSXrNUsF
	OnGNEIdFyXtLclk+7yRpY7ieVG9ebfPcgbe6+14D+iH5Jc0wBu4DKjP+LCH/1AkZGIOnV6w3t0U
	/+t2TK8eH/jcEggIeCmbi7IvILR/p+F0YGDylLjrpF/4c=
X-Gm-Gg: AeBDievgpftUqX3SYc0KQH/Z0mHMflzDwaI/2geXj6FgbQs20xB+m3OKHyBlVtc1BWH
	3wkFyW1DMhZ5KyM7cPup9wH/+vgGhClWL2PgINMA/JMzqa9UmyLY2XIJku5Z6AjXdi2XbovE9eJ
	74yjGOuSGvlgFy8Y/Lu48HqB9AkM26SfSBoysmktusZlJoQtMPOIF92TiKRRmdGzYsQMYhxewpX
	M7w5Ic0bkMBvLCfvryW4upFc58SysO2X2dqEFIyCB1ixnDJ
X-Received: by 2002:a05:6820:160c:b0:694:9764:a6b3 with SMTP id 006d021491bc7-69998cbb277mr1578169eaf.10.1778073714385;
        Wed, 06 May 2026 06:21:54 -0700 (PDT)
X-Received: by 2002:a05:6820:160c:b0:694:9764:a6b3 with SMTP id
 006d021491bc7-69998cbb277mr1578144eaf.10.1778073713972; Wed, 06 May 2026
 06:21:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260506-panthor-shrinker-fixes-v1-0-e7721526de96@collabora.com> <20260506-panthor-shrinker-fixes-v1-2-e7721526de96@collabora.com>
In-Reply-To: <20260506-panthor-shrinker-fixes-v1-2-e7721526de96@collabora.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Wed, 6 May 2026 06:21:42 -0700
X-Gm-Features: AVHnY4JUvyhzpBHu1ej8gCozNDNlYSWGiMVcqIl7s5jMhHt25V2Q_ufOWv6QTJM
Message-ID: <CACSVV01sJqXCK8Lx5+bSPqzbNv7ALAbcA3P2RiJEOPOX_4Jmxw@mail.gmail.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDEzMSBTYWx0ZWRfX5TkOL1LbKcxP
 Z9W1Rpf5Ns3afpIPB3DnfUwzrWM9Sqj4G1ppO2s/CIWGKvjmBqhwChKacSwsfCrlAFh39VFhYha
 +tkUw6Bn6eWYjTRbEgeodQ+Wl8kMBfusq8XRQAGfJotRef0qBfqEn7xQI/XwgAGkzMURkQwtWWn
 ezjP0yVgFU51EgB1pwOR3Qb4aXsT7rm0IQlgCimTJBh06WdTk8V4ObDHG0AkBbXdrzHJtp3MOiR
 9SUW9CwuefejbVpJsWdNx4aq66aTH4RURK7sl509c+BJbgU0zrJMMA898OlMgrZUTgrnZWIcC+Z
 xOYuXzsJEnEkBk4sNuU9f/9Thdrxl2EDrSYEMtyb5Buy2EXzDxV+bSK5DzKvhCW1/YgYpSBhVlg
 QoZTvAk4EA/VDMu86eleZAY19vIrOA/CtR9TQxboVwASuNsLL4SWA8UwNCyrPfj4n/AMyfsbFgV
 uqBBl4ZIwuMn+RNGAhA==
X-Proofpoint-ORIG-GUID: _DRxZFaf3l_kOdyt3Ldcc4YwIj1_KwU_
X-Proofpoint-GUID: _DRxZFaf3l_kOdyt3Ldcc4YwIj1_KwU_
X-Authority-Analysis: v=2.4 cv=EpHiaycA c=1 sm=1 tr=0 ts=69fb4073 cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=e5mUnYsNAAAA:8 a=QX4gbG5DAAAA:8 a=pGLkceISAAAA:8
 a=MjbirWAG49z9sCQywfsA:9 a=QEXdDO2ut3YA:10 a=WZGXeFmKUf7gPmL3hEjn:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_03,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605060131
X-Rspamd-Queue-Id: 952C64DAEF6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106117-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:replyto,mail.gmail.com:mid]

On Wed, May 6, 2026 at 5:16=E2=80=AFAM Boris Brezillon
<boris.brezillon@collabora.com> wrote:
>
> The following race can currently happen:
>
> | Thread 0 in `drm_gem_lru_scan`               | Thread 1 in `drm_gem_obj=
ect_release` |
> | -                                            | -                       =
             |
> | move obj1 with refcount=3D=3D0 to `still_in_lru` |                     =
                 |
> | move obj2 with refcount!=3D0 to `still_in_lru` |                       =
               |
> | mutex_unlock                                 |                         =
             |
> | shrink obj2                                  |                         =
             |
> |                                              | lru =3D obj1->lru; // `s=
till_in_lru`   |
> | mutex_lock                                   |                         =
             |
> | move obj1 back to the original lru           |                         =
             |
> | mutex_unlock                                 |                         =
             |
> | return                                       |                         =
             |
> |                                              | dereference `still_in_lr=
u`           |
>
> Move the drm_gem_lru_move_tail_locked() after the
> kref_get_unless_zero() check so that we don't end up with a
> vanishing LRU when we hit drm_gem_object_release(). We also need to
> remove the skipped object from its LRU, otherwise we'll keep hitting
> it on subsequent loop iterations until it's actually removed from the
> list in the drm_gem_release().
>
> Fixes: e7c2af13f811 ("drm/gem: Add LRU/shrinker helper")
> Reported-by: Chia-I Wu <olvaffe@gmail.com>
> Closes: https://gitlab.freedesktop.org/panfrost/linux/-/work_items/86
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Reviewed-by: Chia-I Wu <olvaffe@gmail.com>
> ---
>  drivers/gpu/drm/drm_gem.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index fca42949eb2b..97cf63de0112 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -1660,15 +1660,19 @@ drm_gem_lru_scan(struct drm_gem_lru *lru,
>                 if (!obj)
>                         break;
>
> -               drm_gem_lru_move_tail_locked(&still_in_lru, obj);
> -
>                 /*
>                  * If it's in the process of being freed, gem_object->fre=
e()
> -                * may be blocked on lock waiting to remove it.  So just
> -                * skip it.
> +                * may be blocked on lock waiting to remove it.  So just =
remove
> +                * it from its current LRU and skip it.
>                  */
> -               if (!kref_get_unless_zero(&obj->refcount))
> +               if (!kref_get_unless_zero(&obj->refcount)) {
> +                       if (obj->lru)
> +                               drm_gem_lru_remove_locked(obj);

if we are iterating a LRU.. and lru->lock is held, shouldn't obj->lru
always be non-null?

BR,
-R

> +
>                         continue;
> +               }
> +
> +               drm_gem_lru_move_tail_locked(&still_in_lru, obj);
>
>                 /*
>                  * Now that we own a reference, we can drop the lock for =
the
>
> --
> 2.54.0
>

