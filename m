Return-Path: <linux-arm-msm+bounces-102792-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WNg6OgNf2mlQ0wgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102792-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 16:47:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 41BC73E067D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 16:47:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C83613010147
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 14:45:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E5A1386C3D;
	Sat, 11 Apr 2026 14:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FTiw9C+Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED8C3386C13
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 14:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775918746; cv=none; b=nwbnSZtijsaLMuVxOA9zTDK+y7xWd1rwzhe4VcEdbZlch7S9EK/UQ/S/xs/rCRubYPT7ge1B8EOmDE0njiP2ceCFDFPPxplUrO6J75lPVhQkQQQJlstwPKlBIcLRqi/XqtOPhI5UcIYl9ttE/R+68Rh5aFfihv6GGf/Hc0joh5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775918746; c=relaxed/simple;
	bh=6ee/ePMYsnFD5IvFeoBvxzjVKQanY6GW2oFLeAJGuDU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qM1YPFVPt2xf0UseGlgtBNH5Y6OulmZI2R7GtQRFRx1REVIBheIkrRcVUTMzWMyLBDhGBc3jgSn0uQLCsZYAyc+WNGEnMTxLfXNklyOC9eGGzDt93spR0xi/mrBObF9etpv/f1RyrSCI3bf4JzZPyPd5t8QfPAk9HHAEwM8nA5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FTiw9C+Y; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-488a9033b2cso35502205e9.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 07:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775918743; x=1776523543; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6AZfIjpy54chd/oLiMe2eh5RXXChJ594JYVimVPk7UU=;
        b=FTiw9C+YFYOcYJJnYrl6P5sMNtYnvaxeY2loX/cvEQsTW1OoFT7WUVJjiwoZSim4nG
         NxW4BIkPKt1vstubD4tpRB20IIfhWaRlvIYYSS/vQZUZmLFIgMMBhja0CWIENnQQGkSc
         /SI1vrKedEygJ857O9Ssf1Sijhm79TMv0qlC2gZ73vbGw56M5DiSY4GZfxkrXMM80fso
         qwXcXRYvQrwWdLwkEj3dmrBkwe7Coqq7rs9ETBpDyQzxKHudTX5AMzGhcCBJMRdVfjC8
         89MmymAA3Ww3+utwYhuPA5XlOEDA8vRlJZbjUAeA4ruKYxVShGv1q6LoliqJ/9Db4Dqe
         yYWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775918743; x=1776523543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6AZfIjpy54chd/oLiMe2eh5RXXChJ594JYVimVPk7UU=;
        b=diGT0uq+wH450RleJlDk4Ptvp9UjLTtGH0qs8rLLuX4n03tPsRFIRI9m+oXhHrf4FD
         7nrB7CWAln2Ki4VvOSVRtMx22+uJfVHclKz0PpDDhZFbo68P0M5Ko1m9Q9fCVF5ek/w9
         yyTQTQicINfKs3i1p9gyYRSY5O9M9V2hBS7dxIlwi+hMNjx/L1EzFKAjEjue5mJ0sGkh
         sPakhanGR03FLYi+uLk7mpyHXYOKIoFTZ6MorUHB1U1UdwUEk9a35wlvr2SvFKdKty5E
         ktAOiDuaE9+gmfuQQh89u4enAcY67dkoVH4vt/ZREVSmlv4hYn6DyLPduD3VI36zKnbc
         QxMg==
X-Forwarded-Encrypted: i=1; AJvYcCUJKcNLWAYNImpyW6LJX2mpFV2UntP/jA5U1FEc2ys5YIOLupsktPbNCuxIw1i9gxlLTymw/FOp9eg06s/k@vger.kernel.org
X-Gm-Message-State: AOJu0YyyQcd1M4+190wWXLnrEi9GNR4JCQbsv3vvAor1SCYaaoe+O5Zz
	4RpLkxziX/mXJ5IbwsJF46vaObWX5qR8RamGUcMS4Oe3bYiCl7Fqa9Ys
X-Gm-Gg: AeBDievoTJNSZi5UI4ZZMxJEFRwq0YmAuVQJfiYzkFJrEAGyf3P/P+TAB0CN19wj7HN
	EJmW5b75jSoiHuO/vKfU0uRKDHEM1DHEUPjzgCNq8drToHVA6vcpeYcP4EAzsGEwfwYUZTGAAcp
	gzyI0f0WKArWdokJb7d7zWpcjqdz/B/yEXizJJEThKaXS5k/oXnfGt6mGNMDtcyxcx6npXeI5SM
	risJIomSJ5obdqF7+I7vVk9oxHozqQYPDBiAAfpRmzWP2cNbCShmFraY0iaK9uS3Q2CiLQd9Twk
	TRbWkq/ugJktbf/7LicQX5XpEuq6Vf1EXePQZXUYLBa7hZPiPcdG9mkoLnrvyYsR9snj9s1Xw9M
	vbYkIOpsBC3sdo5CznL6qGvvIacOLlLyVcH/xxDaHuDFwHIaqdy+qsrnHJISJphVjGz/24Ld8Fq
	TQSP1i9fybTCTRTAKnRqVbeJfENo2Adh77Cs3YH769g7HmMEKayHoWbWXI51PtXFtZ
X-Received: by 2002:a05:600c:460a:b0:488:a824:fdff with SMTP id 5b1f17b1804b1-488e00fdbc3mr13943905e9.22.1775918743193;
        Sat, 11 Apr 2026 07:45:43 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d5b3c597sm151294875e9.12.2026.04.11.07.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 07:45:42 -0700 (PDT)
Date: Sat, 11 Apr 2026 15:45:41 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Rob Clark <rob.clark@oss.qualcomm.com>
Cc: Jie Gan <jie.gan@oss.qualcomm.com>, Akhil P Oommen
 <akhilpo@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, Konrad Dybcio
 <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, Abhinav
 Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Antonino Maniscalco
 <antomani103@gmail.com>, Connor Abbott <cwabbott0@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 15/17] drm/msm/a8xx: Preemption support for A840
Message-ID: <20260411154541.3d5d637a@pumpkin>
In-Reply-To: <CACSVV03gr87bJcywyt1wHoaLRaaUJEmKAz3jTmipUt9NGSqbtQ@mail.gmail.com>
References: <20260327-a8xx-gpu-batch2-v2-0-2b53c38d2101@oss.qualcomm.com>
	<20260327-a8xx-gpu-batch2-v2-15-2b53c38d2101@oss.qualcomm.com>
	<07fcf759-b53c-4bc8-8e88-48b82713fecb@oss.qualcomm.com>
	<CACSVV03gr87bJcywyt1wHoaLRaaUJEmKAz3jTmipUt9NGSqbtQ@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102792-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de,vger.kernel.org,lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[davidlaightlinux@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 41BC73E067D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, 11 Apr 2026 06:56:15 -0700
Rob Clark <rob.clark@oss.qualcomm.com> wrote:

> On Fri, Apr 10, 2026 at 7:22=E2=80=AFPM Jie Gan <jie.gan@oss.qualcomm.com=
> wrote:
> >
> >
> >
> > On 3/27/2026 8:14 AM, Akhil P Oommen wrote: =20
...
> > > +     struct a7xx_cp_smmu_info *smmu_info_ptr =3D
> > > +             a6xx_gpu->preempt_smmu[ring->id];
> > > +     struct a6xx_preempt_record *record_ptr =3D a6xx_gpu->preempt[ri=
ng->id];
> > > +     u64 ttbr0 =3D ring->memptrs->ttbr0;
> > > +     u32 context_idr =3D ring->memptrs->context_idr; =20
> >
> > Shall we declare these variables at the top of the function body?
> > =20
>=20
> We can use c11 / mixed code/declarations now.  It's actually kinda
> required for cleanup.h stuff (which I recommend for new code, where
> possible.. I've been using it for PERFCNTR_CONFIG ioctl that I'm
> working on, and it makes error path cleanup much more straightforward)

It is also still frowned upon for normal variables.
It does make reading code - especially large functions harder.

	David


>=20
> BR,
> -R
>=20


