Return-Path: <linux-arm-msm+bounces-103975-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0EItJJKo52lQ+wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103975-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 18:40:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F8A43D866
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 18:40:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B85AF30038C3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 16:34:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A46928980F;
	Tue, 21 Apr 2026 16:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pEJvqlW7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FHwTkIHU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA7AA3603C3
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 16:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776789268; cv=pass; b=baFKEsMDBJFKtxBpt/UeLQHGcSkbfFngi5/0NWCMqnSMuFqoYrJ4wl3IIGWudO1kbGtt846VmZGNUbW37qXhbhVleYoYUCqhqDvEeoVrMUVkhCsiFgC4HxOClCvG4fCgRUtT1fdN6fO+6IcJSzhgGr3Pb28OSK9HBaHp9iUcv/c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776789268; c=relaxed/simple;
	bh=pCK4sq3MTc8gjl/ISCDjvIOuO90yJ/lpEcsz9kD/+GM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s+ywz8uQ9fsbG6NQFDqU2EoRnDhUVm7NksdCVqGh4PvLteD9+uOTPvjlksFPTBX7g3jSgACxoyNp8TNv9me7TtneT3n69a4LOQN0obBfxdAXuP6hvrnCoi7C80yAV/s0kKoP8i+r6k/qWTJHN2a54kH3bLj99c8zcMopQwRcDS0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pEJvqlW7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FHwTkIHU; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63LCLEbE3257313
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 16:34:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=OG03RLbkVQGi1m7r2kUY2OMQR5crtiM3OubK9GwayjU=; b=pE
	JvqlW7R7Tmh6LF7j7YPy7aZuZtlgPRLI8/PUXp1dsthLWQt3shP3g2zxSSjmdBhW
	9q4knPSH4yjHuNI8AYqC/PAUexjXKhy9P5EfguG3yf1edcc1m1nUF+Vf85RhTuUK
	E6InWvod0PUyDNpXWdkPVWqbKdLUoXOPvxKmK4ZmbUxwFmAvBSqxXPzt7wrrqb4K
	H0FHFNhOEpret6YZ75DuhPJuEqa1WqfTbYeD/rN0pf/9P+ZlwVBeCS2nBlIQu7zW
	EZEaRxeJiFWvSKFRJxmrFO7xi2PgDC1xuMF2oviFcS/7gHCMufT3b+X0KP1A9r8Y
	ZJtGj8o543CnaGH7rpZw==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dp3naa7uw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 16:34:20 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-42306db7f0dso7402286fac.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 09:34:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776789260; cv=none;
        d=google.com; s=arc-20240605;
        b=i/VejHLiXk9sFOpyIeq7sBMNff/E194eHxn3tKDvOxvX+4ZJvKfEO972RgFREtdexR
         MM2EBC2u25P8+R9X1xVgCb1t0ceyPASaQiyxmNH62B4nIrA9A3HXRLM7OWAdJlyXmXLy
         9+gzy5KTPRVib0+rlZQMK0KxQUfRSMeE5ezjqzZoMQs/Mk88G16yiZ1sq0ShLMDzog16
         Yy9ziYH2SDDzINCfQ7p0Sqfm0Gvq2XTw37dVKQ/KbXlukutRirTgeiJLqHVS+t1K9UEE
         luoHvH7H8edIoeNyTzHscro+1sXeoOJtnKmfsQ09FyPCqQEBXp2VWjR71lDurCZt7CQv
         Er+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=OG03RLbkVQGi1m7r2kUY2OMQR5crtiM3OubK9GwayjU=;
        fh=sjRuT3k/p3tK/rqEMWJVqdIJREBRiEqhdNb13FN3Kqc=;
        b=O0maAgWJcTGzI/S14r2tAU7ZK+IAJaQBTf89s6ApBnEpMrDJA1cSR4mmS2wh5g/p9i
         BYSQgMIX70kMV9r2Btq3kpz9Mjm9xotceXAoPdduLabymZUcR8edBxscCWvI+No/PWru
         arxlnbqKXEYwy/REQkKuYoLyNn8xPvIf0oCWLiCcLrYBlrIefieWNHPOecrW7Rinsl56
         7RqS6bcNr+YSQGRLhuf0vnZEtENpt+fXPLs/uZ+bOBSKeqYZ7SWaXLUDJkraKtxJwFH0
         Ewjnq7j+FB3JvEz5LjYhRwQTyEFIdFkyRtEh3CNAS1XgfvbSxWUj7+9g0oQmSZ4PIjxy
         sofA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776789260; x=1777394060; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OG03RLbkVQGi1m7r2kUY2OMQR5crtiM3OubK9GwayjU=;
        b=FHwTkIHU4IVW6+vLDmW9YUYec6XerGbTsa+O/iA7Dttab0zLhLOP1bLrowItAS/3qj
         7ar1uDAsh+s/mbgcVDjgHXh5X5JuOC2J9RYqCV/Jvx46Dpjgdjnbvnu/v2Zxclfms4am
         PLf3UxBLeU5boBgEi2yGpXJ9ItMxPCQBJCLVXxYIC95It1fp0Wcn1NAtXuCn5s/398aw
         bddzj0QcDCCHxKRdIW+WvFZ4HI7aB1FSoTE85EX4Qej6i7Ua9NDaEEOpieNzdD7YhKc1
         U3IAL73UKAY+asTObioSc8/Z4GgDrwqWJxz5+zzh15wqTYGBV1QUZp3+qv6+iveOeNaw
         KpQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776789260; x=1777394060;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OG03RLbkVQGi1m7r2kUY2OMQR5crtiM3OubK9GwayjU=;
        b=fOnQDBeWsVYwhSVrQcSYCyyjtiYIbVZc9GWRdFz9bkCX8n0kOjdaVdKkvfqLL53KDf
         Q55lNteccQv5feacnFV9fl+z04d4y8nM9nn8Mw8tlpEGS4zpE/n3D2DE9tlwdZ3Q53R8
         dLcpsUiJqWnZ0Y4t9UYn2IYwpm0/u4AvvqV1OQ7zyyfyso9RA5JjBt1UuDq5x282WIq7
         9uFNH4f58P8Y0aLyzolKmmKq7/g7r+K6MsLp7h1y/Zsn5xy5JyUTfbeDHQ5HzE4fW6uE
         OqwhC85Sf0VldT7sQQx/I8NaX4w5l7G9bYsR5kAPAhhY63hMNlT3KJs1ew/mRiyF12Fl
         pUOQ==
X-Forwarded-Encrypted: i=1; AFNElJ8dBiQD6wV0VRDUUUMC+2lZO+1wWFS8NL6Z1qNDXxg/odcAcZSBcLMmFI+UMcw+D1ap3wzt3l5SyjvgDhmi@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4MtAtsR0p0HK86BlHyjbZtfkWkw9zXvO/P3l7z6vjoKTvgJrR
	bE9B0HN+djr4yQRcK+KmgMkneHrlM9TV2mhMr9CCBC559xOyghh6h08qFym3l/zdUSwNPJ6iUti
	4Va6If0xxdatTruW5UgzZbn50/a5/WCVhSC2ULk/7J1r8IBmD6j9zTtj0pQRQKNPlmB4rIhztjv
	3FyJROiDxbURJO4rwsmzPlGWev18Od02dgSundFFqWYfQ=
X-Gm-Gg: AeBDietKQlx5+2iTYh2VnpxI3ApSMg/4MLWLyroojkNeyQij3OPqDbZC6lWPIGIMHFC
	XhimPN9V+sOM2yDD8LtqhrlQ1dTT1rmDb/JCJ+Y1BjDokKA6DDs9ugiELPDColhx5pdCkFyr5F4
	pkoZ5QmHSTvwP90N/2jsYtz2l/ZB2HAy8oI3X0K9SI/2FQItX5xjeM78VB09vJOYF7SnxPjzQkb
	6aRk9RmSejDP4apZDA/9oeFLdBHra1Jl2S/3XvNC1jmxwuy
X-Received: by 2002:a05:6870:6390:b0:417:23f2:6d77 with SMTP id 586e51a60fabf-42abf2ecb41mr10830932fac.16.1776789259800;
        Tue, 21 Apr 2026 09:34:19 -0700 (PDT)
X-Received: by 2002:a05:6870:6390:b0:417:23f2:6d77 with SMTP id
 586e51a60fabf-42abf2ecb41mr10830914fac.16.1776789259378; Tue, 21 Apr 2026
 09:34:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260421084701.24227-1-laura.nao@collabora.com>
In-Reply-To: <20260421084701.24227-1-laura.nao@collabora.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Tue, 21 Apr 2026 09:34:08 -0700
X-Gm-Features: AQROBzArUGDXn57yy7hiM7ct4lrQxadoBQMLBR3Cb8jVRGpfyvO4Z6UZBx6yzNM
Message-ID: <CACSVV01Kh5w1t26FEzKAVRxnKz=GCKjRvXe4KOKSLs-FkwkuBg@mail.gmail.com>
Subject: Re: [PATCH] drm: Remove DRIVER_GEM_GPUVA feature flag
To: Laura Nao <laura.nao@collabora.com>
Cc: dakr@kernel.org, boris.brezillon@collabora.com, steven.price@arm.com,
        liviu.dudau@arm.com, matthew.brost@intel.com,
        thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        nouveau@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
        kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: xt5DwgV2Ow76CSc_OWxjAwcziRobpver
X-Proofpoint-ORIG-GUID: xt5DwgV2Ow76CSc_OWxjAwcziRobpver
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDE2NCBTYWx0ZWRfXzkwCgJ7xOqoR
 ANWNln6qTilKSjpnWwk0GT8cbA7xrisPkdHVIAqPljxS53p6/U/c0TLDnYNbjeZTZOJiMho/X7t
 f+njCdj4v8+9j1pttmMfviR7FIMxyTh4pNJ6ayUHgmbLU54ICVr0Q2kAs5v7wpl0/i2I3f9xaPS
 Xfvdjm9QCByMXrwuD4shIjgkoZ+yz+YOdXgxFKW3hc40ZTm4ub8DYeR4Sl6D/KB+kdBmWbdb55r
 rKmYNXNr+7e9dwYYZFmC3CYQlb7ynWDo222KqtiGsPXhSvayzhJAiXm4B8xPEMzqv/4vM1Bk5Do
 L4Y3Cpv8cTCxhmHHWQdzgVIfUBHFree7Z2pv6G6NdDf2BpTGis1FNX+KrzU/lP5BXlrLsC9tsDs
 7esCKGmQ/qUUM5qaQKXXc5llmbws2JL/iUxnuUW++D6oAE1z7IdRCa7EQ1TuyiZpB7FcVPIXYUv
 t0HUpicWp4uV3qL0IkA==
X-Authority-Analysis: v=2.4 cv=O9cJeh9W c=1 sm=1 tr=0 ts=69e7a70c cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8
 a=3M9eerblpL4TRhbo7qwA:9 a=QEXdDO2ut3YA:10 a=1zu1i0D7hVQfj8NKfPKu:22
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604210164
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103975-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MISSING_XM_UA(0.00)[];
	HAS_REPLYTO(0.00)[rob.clark@oss.qualcomm.com];
	RCVD_COUNT_FIVE(0.00)[6];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rob.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,collabora.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:replyto,mail.gmail.com:mid]
X-Rspamd-Queue-Id: E1F8A43D866
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 21, 2026 at 1:47=E2=80=AFAM Laura Nao <laura.nao@collabora.com>=
 wrote:
>
> The DRIVER_GEM_GPUVA feature flag is currently only used to control two
> behaviors within the DRM core:
> - calling  drm_gem_gpuva_init() during
>   GEM object initialization
> - creating the "gpuvas" debugfs entry
>
> drm_gem_gpuva_init() is a plain INIT_LIST_HEAD() and therefore is cheap
> to run for every GEM object. The DRM_DEBUGFS_GPUVA_INFO macro is only
> referenced by GPU-VA capable drivers, so clearing the feature bit does
> not cause any unrelated drivers to get the "gpuvas" debugfs node. The
> flag doesn't have any relevant purpose (e.g. gating ioctl handlers or MM
> logic) and doesn't provide any practical benefit.
>
> Remove the flag definition and drop it from all drivers that use it,
> call drm_gem_gpuva_init() unconditionally and clear the driver features
> bit in DRM_DEBUGFS_GPUVA_INFO.
>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>

Acked-by: Rob Clark <rob.clark@oss.qualcomm.com>

> ---
>  drivers/gpu/drm/drm_gem.c             | 3 +--
>  drivers/gpu/drm/imagination/pvr_drv.c | 2 +-
>  drivers/gpu/drm/msm/msm_drv.c         | 2 --
>  drivers/gpu/drm/nouveau/nouveau_drm.c | 1 -
>  drivers/gpu/drm/panthor/panthor_drv.c | 2 +-
>  drivers/gpu/drm/xe/xe_device.c        | 2 +-
>  include/drm/drm_debugfs.h             | 2 +-
>  include/drm/drm_drv.h                 | 6 ------
>  include/drm/drm_gem.h                 | 3 ---
>  9 files changed, 5 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index 0377a5fd402d..cb703d0072aa 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -232,8 +232,7 @@ void drm_gem_private_object_init(struct drm_device *d=
ev,
>         if (!obj->resv)
>                 obj->resv =3D &obj->_resv;
>
> -       if (drm_core_check_feature(dev, DRIVER_GEM_GPUVA))
> -               drm_gem_gpuva_init(obj);
> +       drm_gem_gpuva_init(obj);
>
>         drm_vma_node_reset(&obj->vma_node);
>         INIT_LIST_HEAD(&obj->lru_node);
> diff --git a/drivers/gpu/drm/imagination/pvr_drv.c b/drivers/gpu/drm/imag=
ination/pvr_drv.c
> index 268900464ab6..80033d4cb66a 100644
> --- a/drivers/gpu/drm/imagination/pvr_drv.c
> +++ b/drivers/gpu/drm/imagination/pvr_drv.c
> @@ -1375,7 +1375,7 @@ pvr_drm_driver_postclose(__always_unused struct drm=
_device *drm_dev,
>  DEFINE_DRM_GEM_FOPS(pvr_drm_driver_fops);
>
>  static struct drm_driver pvr_drm_driver =3D {
> -       .driver_features =3D DRIVER_GEM | DRIVER_GEM_GPUVA | DRIVER_RENDE=
R |
> +       .driver_features =3D DRIVER_GEM | DRIVER_RENDER |
>                            DRIVER_SYNCOBJ | DRIVER_SYNCOBJ_TIMELINE,
>         .open =3D pvr_drm_driver_open,
>         .postclose =3D pvr_drm_driver_postclose,
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.=
c
> index 195f40e331e5..ee38c18715f0 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -825,7 +825,6 @@ static const struct file_operations fops =3D {
>
>  #define DRIVER_FEATURES_GPU ( \
>                 DRIVER_GEM | \
> -               DRIVER_GEM_GPUVA | \
>                 DRIVER_RENDER | \
>                 DRIVER_SYNCOBJ | \
>                 DRIVER_SYNCOBJ_TIMELINE | \
> @@ -833,7 +832,6 @@ static const struct file_operations fops =3D {
>
>  #define DRIVER_FEATURES_KMS ( \
>                 DRIVER_GEM | \
> -               DRIVER_GEM_GPUVA | \
>                 DRIVER_ATOMIC | \
>                 DRIVER_MODESET | \
>                 0 )
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouv=
eau/nouveau_drm.c
> index 5d8475e4895e..0f5f662e5429 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
> @@ -1364,7 +1364,6 @@ static struct drm_driver
>  driver_stub =3D {
>         .driver_features =3D DRIVER_GEM |
>                            DRIVER_SYNCOBJ | DRIVER_SYNCOBJ_TIMELINE |
> -                          DRIVER_GEM_GPUVA |
>                            DRIVER_MODESET |
>                            DRIVER_RENDER,
>         .open =3D nouveau_drm_open,
> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/pant=
hor/panthor_drv.c
> index 87d27c3c1456..1a1d40a744db 100644
> --- a/drivers/gpu/drm/panthor/panthor_drv.c
> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> @@ -1805,7 +1805,7 @@ static void panthor_debugfs_init(struct drm_minor *=
minor)
>   */
>  static const struct drm_driver panthor_drm_driver =3D {
>         .driver_features =3D DRIVER_RENDER | DRIVER_GEM | DRIVER_SYNCOBJ =
|
> -                          DRIVER_SYNCOBJ_TIMELINE | DRIVER_GEM_GPUVA,
> +                          DRIVER_SYNCOBJ_TIMELINE,
>         .open =3D panthor_open,
>         .postclose =3D panthor_postclose,
>         .show_fdinfo =3D panthor_show_fdinfo,
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_devic=
e.c
> index ffea4a453c01..b3acc202df76 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -393,7 +393,7 @@ static struct drm_driver driver =3D {
>         .driver_features =3D
>             DRIVER_GEM |
>             DRIVER_RENDER | DRIVER_SYNCOBJ |
> -           DRIVER_SYNCOBJ_TIMELINE | DRIVER_GEM_GPUVA,
> +           DRIVER_SYNCOBJ_TIMELINE,
>         .open =3D xe_file_open,
>         .postclose =3D xe_file_close,
>
> diff --git a/include/drm/drm_debugfs.h b/include/drm/drm_debugfs.h
> index ea8cba94208a..eb93512b0f23 100644
> --- a/include/drm/drm_debugfs.h
> +++ b/include/drm/drm_debugfs.h
> @@ -48,7 +48,7 @@
>   * For each DRM GPU VA space drivers should call drm_debugfs_gpuva_info(=
) from
>   * their @show callback.
>   */
> -#define DRM_DEBUGFS_GPUVA_INFO(show, data) {"gpuvas", show, DRIVER_GEM_G=
PUVA, data}
> +#define DRM_DEBUGFS_GPUVA_INFO(show, data) {"gpuvas", show, 0, data}
>
>  /**
>   * struct drm_info_list - debugfs info list entry
> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
> index 42fc085f986d..e09559495c5b 100644
> --- a/include/drm/drm_drv.h
> +++ b/include/drm/drm_drv.h
> @@ -107,12 +107,6 @@ enum drm_driver_feature {
>          * acceleration should be handled by two drivers that are connect=
ed using auxiliary bus.
>          */
>         DRIVER_COMPUTE_ACCEL            =3D BIT(7),
> -       /**
> -        * @DRIVER_GEM_GPUVA:
> -        *
> -        * Driver supports user defined GPU VA bindings for GEM objects.
> -        */
> -       DRIVER_GEM_GPUVA                =3D BIT(8),
>         /**
>          * @DRIVER_CURSOR_HOTSPOT:
>          *
> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> index 86f5846154f7..996aa418dce9 100644
> --- a/include/drm/drm_gem.h
> +++ b/include/drm/drm_gem.h
> @@ -663,9 +663,6 @@ static inline bool drm_gem_is_imported(const struct d=
rm_gem_object *obj)
>   *
>   * This initializes the &drm_gem_object's &drm_gpuvm_bo list.
>   *
> - * Calling this function is only necessary for drivers intending to supp=
ort the
> - * &drm_driver_feature DRIVER_GEM_GPUVA.
> - *
>   * See also drm_gem_gpuva_set_lock().
>   */
>  static inline void drm_gem_gpuva_init(struct drm_gem_object *obj)
> --
> 2.39.5
>

