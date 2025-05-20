Return-Path: <linux-arm-msm+bounces-58731-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 78BCBABDE00
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 16:58:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C2FCB7A9AFB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 14:56:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 518B124C09E;
	Tue, 20 May 2025 14:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T6JF4n9v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A49E424DFF1;
	Tue, 20 May 2025 14:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747753071; cv=none; b=jhlcfoxzw932Mjr56pfIx4VyZfZFbHbgsVM37Sc/cFmtwAhk81fpEO0d76lBJQ9ltUJeEB0CMjb7eeP9RD5ZUbHiJcl17vgfPiaNJO7rQPfxm6mGEUwOeEQPUQTl/oVo5zQKaGzN+QMZCaQ5hclRQhF/MmxlJ5hJctDcjwpfRcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747753071; c=relaxed/simple;
	bh=rEZf8Nyd4ngC4sCa5nmlwoR8C0UTTwyqDk7zGKxO6AA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hmiF7C+HFBfUARrvO3dT+KggZff+qm33Zj5haGU3Y7y1FtqG/PkGvKzngdBMuecjTu3pV+ldYBW46VagAzgCwNC3KEfGVA8C5BbvVP+64xtt3i/xXMsByjuVG18XvhpVydQpFN0U+eO7iCBzu+gBKpioAXW8BCRjnO6oEh8Z3L8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T6JF4n9v; arc=none smtp.client-ip=209.85.166.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-85dac9729c3so611543639f.2;
        Tue, 20 May 2025 07:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747753068; x=1748357868; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ei0ZtzeEerH4n95EU2nYvZiHQHmnnzxXV15jRRTIMlc=;
        b=T6JF4n9v7KcRt2W1GHG2v7a2iPwZ/2Q8SvWAAIQu+tQsfeP55WYOpUm6HVFYN071+o
         U1herQDaUwMjx9WXAHk/yZmrkTRjHH8M1KO4XB0MNnjY8leq1TOuRGhaTN/EQE0aeAQ8
         YJ1fMiqOTb8nPF0yw+QM8QU8/1UjGNfIkw8tLTUB3uowUZ3w74x/U5ilX1zErkReOnUB
         ACRtqS05hgnYZebTI8bp3ZsHk454vmFjhwyC2aT66porxCjhagpXMDww53m6Sy2Xzjwq
         xcADOT1W7NfdAK8Tgj4mfF2ezYpt1CeORgt84GIaNnZm48Sg6jFvSTOJ0KBAxhYn0viA
         TjuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747753068; x=1748357868;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ei0ZtzeEerH4n95EU2nYvZiHQHmnnzxXV15jRRTIMlc=;
        b=KaiDcwqTSRsNzv/7Fw//ppplxh/n9iuISz42eoTymsF0svWnK3Y0442k8MJNd7KIru
         yL3CrMQisKDLND1JNRnjI1a2kqfxIth2n8L5R1NCxlPN6rDsmZD19UgYQL10yp3rWOMa
         ykMU1QmdUyQ3TESMcZwXsCw6XcMqA01bbcOr9vSEO0foSPpftr3MnwgtmE81bxdxJtWb
         UdrR812zZClv3Fbnp1J1fZSfaO13PL1JNZ0xlOkEwabQhx0Tqwi1Y36eo5u8ta+7bvYv
         HCD1cXv/xgfFwlktiW3rcX4YHwWyneEMRzPUsLEsVqosFhkr3yLHx0vi3O+30iMNTGfS
         PoAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUB37cIRt//3utm9p1aZQpio4zjSc8puh3FBXafreFi3EMpevnWJHMENEfv7F8/i/FKIvVX2q5N6yM7lx3A@vger.kernel.org, AJvYcCURX/tFq4Pz2jwLI2+aSkECPMLG3Tto6luT6hiHDkc04De8Ue25rUkPBEICbwZHyxI5eVOiYjUODhF9kK6d@vger.kernel.org
X-Gm-Message-State: AOJu0YzUKZsj313U+W1Jy/S6Rq3d8dNde3qZP6YaK+cmzmGImtcU1F46
	XJA51Ray1/+HgH0sonsUj2hxUGrtBB1/ez+Mcx03VBNuXBv0l8TKBaSFP3Nuu/DFzDdensaQj/I
	sNlnS7Sg3/0jYCQA2BApK89zCVQlz8YwpIOWK
X-Gm-Gg: ASbGncuR6EuTHSSdzlOzWX3OQITgYUekekGuLcy+aQHD7uy5LZziID8VEKyUqFWkojl
	mo5gEZYHcB3IrAFA400a47fOg2ca1DRxE6qRmekABIjhaPf5x4rULW1+MwZxGHWHqXlVdgcWTbN
	EgGOXK7woor4ip+qQQYbs5SNLneVFBkyczRdMIkpk7ba0T/I4K0FxVEI9+u50FPiE638I=
X-Google-Smtp-Source: AGHT+IGo54Ph3lgCr2HThw2nynX0CfUtauGHA+UWZQjPIR4SenpHhKIQf4v2aZNtBDgA8aoC9oBCpwohCLzgA971GNc=
X-Received: by 2002:a05:6602:7284:b0:86a:26c8:4ba0 with SMTP id
 ca18e2360f4ac-86a26c84ca2mr1970379239f.8.1747753068536; Tue, 20 May 2025
 07:57:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250519175348.11924-1-robdclark@gmail.com> <20250519175348.11924-2-robdclark@gmail.com>
 <aCwt20O7SH1zQLlV@pollux>
In-Reply-To: <aCwt20O7SH1zQLlV@pollux>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 20 May 2025 07:57:36 -0700
X-Gm-Features: AX0GCFv7Ss4yKUe43JHrMItzf4ycbR76G6yDyHTTaHf43qdoHHxEMm7hFngKuk8
Message-ID: <CAF6AEGvhxeCAz41F72hq=V3aD38jm+aUQqX3GwaOR4uzZGn6hg@mail.gmail.com>
Subject: Re: [PATCH v5 01/40] drm/gpuvm: Don't require obj lock in destructor path
To: Danilo Krummrich <dakr@kernel.org>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, Connor Abbott <cwabbott0@gmail.com>, 
	Rob Clark <robdclark@chromium.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 20, 2025 at 12:23=E2=80=AFAM Danilo Krummrich <dakr@kernel.org>=
 wrote:
>
> On Mon, May 19, 2025 at 10:51:24AM -0700, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > See commit a414fe3a2129 ("drm/msm/gem: Drop obj lock in
> > msm_gem_free_object()") for justification.
>
> I asked for a proper commit message in v4.

Sorry, I forgot that, here is what I am adding:

Destroying a GEM object is a special case.  Acquiring the resv lock
when the object is being freed can cause a locking order inversion
between reservation_ww_class_mutex and fs_reclaim.

This deadlock is not actually possible, because no one should be
already holding the lock when free_object() is called.
Unfortunately lockdep is not aware of this detail.  So when the
refcount drops to zero, we pretend it is already locked.

> Only referring to a driver commit and let the people figure out how the d=
river
> works and what it does in order to motivate a change in the generic
> infrastructure is simply unreasonable.
>
> > Cc: Danilo Krummrich <dakr@kernel.org>
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >  drivers/gpu/drm/drm_gpuvm.c | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
> > index f9eb56f24bef..1e89a98caad4 100644
> > --- a/drivers/gpu/drm/drm_gpuvm.c
> > +++ b/drivers/gpu/drm/drm_gpuvm.c
> > @@ -1511,7 +1511,9 @@ drm_gpuvm_bo_destroy(struct kref *kref)
> >       drm_gpuvm_bo_list_del(vm_bo, extobj, lock);
> >       drm_gpuvm_bo_list_del(vm_bo, evict, lock);
> >
> > -     drm_gem_gpuva_assert_lock_held(obj);
> > +     if (kref_read(&obj->refcount) > 0)
> > +             drm_gem_gpuva_assert_lock_held(obj);
>
> Again, this is broken. What if the reference count drops to zero right af=
ter
> the kref_read() check, but before drm_gem_gpuva_assert_lock_held() is cal=
led?

No, it is not.  If you find yourself having this race condition, then
you already have bigger problems.  There are only two valid cases when
drm_gpuvm_bo_destroy() is called.  Either:

1) You somehow hold a reference to the GEM object, in which case the
refcount will be a positive integer.  Maybe you race but on either
side of the race you have a value that is greater than zero.
2) Or, you are calling this in the GEM object destructor path, in
which case no one else should have a reference to the object, so it
isn't possible to race

If the refcount drops to zero after the check, you are about to blow
up regardless.

BR,
-R

> Putting conditionals on a refcount is always suspicious.
>
> If you still really want this, please guard it with
>
>         if (unlikely(gpuvm->flags & DRM_GPUVM_MSM_LEGACY_QUIRK))
>
> and get an explicit waiver from Dave / Sima.
>

