Return-Path: <linux-arm-msm+bounces-58116-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F81AB8DE3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 19:35:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CBB3BA02A53
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 17:35:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A23A218858;
	Thu, 15 May 2025 17:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V/pqI42t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A350255E44;
	Thu, 15 May 2025 17:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747330538; cv=none; b=Sx84ReoQjWKzB9jvKvE9CT4GJDV3R7r4O6Ua8WoXsGQ2/FVcGIrkD8E26ANIXgikvZnO2hW55412QsHhBdyiSV5a7AE0zlaX9vN5nVXMOMPFt5zTeUhLLykKDy5DsoLqWRcvz6nT7BE5QCw/KRV4X/i99N/+fztlvGamZ05MWyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747330538; c=relaxed/simple;
	bh=w+8DL1mZ2762UMq0hV9+yje9CXp/AFfbMUG8nALwbqo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p5DPexBLWHJCdBvlLFCuIwQD5WEOx9jau9dB+xtVD5zU6qutqCGstiE+H3SwdFeE8ojIzGIFMou2V8L1DJQirDrFkoUOZSK4zKMJrXM8kEyHzioPp3HQ7hENFuF3ZELS4FpmB5rniBFMwXXdgpZuo0bbNRQqBavLOE/v+KMy3bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V/pqI42t; arc=none smtp.client-ip=209.85.166.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-3da7642b5deso6978285ab.2;
        Thu, 15 May 2025 10:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747330535; x=1747935335; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6PSWCzGj/sFmI0Io82xchkWTY2rx5nyZZObNQUeNmKM=;
        b=V/pqI42t5AOdZ8v8goQccGjhB3pI9VoMc78gD7rbtIVqGjNlyQ5GLrkvmMHHs0lZmY
         JFjPQIyV+LGfYF68oTsfxEwOH9gybWuDYos73qtO2JFRXjj+71PMdQNm90BFAVAn1VDb
         OmmBgb8uHR2yaPFrudmYV0ys/8mn2S3iRS9JRh9A7oSh7Zyj0f6uOD3lld8cDb4NiHd4
         VGHA0ynvPiAVMcaIJA9MoIRVVfqlbrqFYRf49JNDJRpI38kz1uQ4enO5qMbBlYKggQVC
         eHuiBvhRTGMYDwnkH+MHOpSpj37m29Th3Vdj2FXrRaN9F7nfDakCdrEsRP6PROTQ2lOt
         3jtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747330535; x=1747935335;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6PSWCzGj/sFmI0Io82xchkWTY2rx5nyZZObNQUeNmKM=;
        b=aBW/1vHwWenF4XQ93rkNLAuWQ9LGq+Yf7WqtjUiDwshpkPIj6URuWTN4Cbj3ct3mye
         nA2At7DGfkxWtxjpbxNkwCzihbyzYnr2a5AzoVXIWMoIf8wyffwoZ3kiOUCNgH80awXu
         1cOdlEU1IPbKEBWk14acHmtbHZ3hWpLuBo/13AUhrGtKsPo85W/jZyIPxCOExqPWb4gX
         QE1aV8Avzl0yl6kBOsN628ZPc3dXjDAIFWHdljKc+WxyTsFoGeivWiYuuFqHZ4SpUd6W
         Ps2ZlDYPSXbGV7e+/aQxkEfUG9isfsABPJGFaJ+2/TOCHEa5YzLEwOtv0lsCrOumiFmE
         kyeA==
X-Forwarded-Encrypted: i=1; AJvYcCVnRrOQpz++SceTIISGCz/8vtN9TlRRA0iSEus3LMM/bNYeg+p1TPQGwjlI6H8pM0H5NRgKto5cDwJCipsY@vger.kernel.org, AJvYcCWQRGdwvd0K1Dfr6ONnnXYY0C2bZf6lnJHF4T/F4TCuj9b398plv1FZP2pHcTdLe0RkKePxMXNKba66iwtL@vger.kernel.org
X-Gm-Message-State: AOJu0YwF7T/6gBGgSv22M4ytYxOx2XqHEgGz+MYopvXYsxwHoreDMsxd
	EDo5dDU0Aq5jy65Fsx0W22rk6oWFXX9StaolF1Fwk/0ny4CdEtdfWOiAEl4t0HDYCl5m9dj4iTD
	WJPEwlwW6Pf8JbEErQkJs3qJwS7N09nqiaQ==
X-Gm-Gg: ASbGncuemZjWZoW9Txyh3WtWrY6Co+Ld5sRqYKOQ6Xlrv+bH7boBUFcQrMGweH/PmKY
	mwOdfK5OR1saf8su+I/lBLY4u5QoG3ivg025XeGGHziHlpmqICfbhJsquu/GTHjRLLg2mV0BaF0
	/EzYqtskDuug7QQhblmTXWUyjUYn+AdM6XTQjsz5lyhCdWjimo1I1QlJBWXviPQZM=
X-Google-Smtp-Source: AGHT+IFnaHJhSF+qXjOEZChRhVJP0IqHwViZVyYjv9k8vn50TZKP4xP35nskjmikmzxxjX7AMj6ULqg71EZXsTUnIzQ=
X-Received: by 2002:a05:6e02:1745:b0:3db:6c09:a60d with SMTP id
 e9e14a558f8ab-3db84334772mr8200605ab.19.1747330534821; Thu, 15 May 2025
 10:35:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250514175527.42488-1-robdclark@gmail.com> <20250514175527.42488-2-robdclark@gmail.com>
 <aCWrwz2IF6VBUi4e@pollux> <aCWueFzx2QzF7LVg@pollux>
In-Reply-To: <aCWueFzx2QzF7LVg@pollux>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 15 May 2025 10:35:21 -0700
X-Gm-Features: AX0GCFumvveyUAOWs_iSbi5WGXb00N8fVXFXgYWhep6HNXGCfYgtjmCwkBKdiEY
Message-ID: <CAF6AEGu9MPxKnkHo45gSRxaCP+CTzqsKZjiLuy4Ne4GbrsStGA@mail.gmail.com>
Subject: Re: [PATCH v4 01/40] drm/gpuvm: Don't require obj lock in destructor path
To: Danilo Krummrich <dakr@kernel.org>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, Connor Abbott <cwabbott0@gmail.com>, 
	Rob Clark <robdclark@chromium.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 15, 2025 at 2:06=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On Thu, May 15, 2025 at 10:54:27AM +0200, Danilo Krummrich wrote:
> > Hi Rob,
> >
> > Can you please CC me on patches for GPUVM?
> >
> > On Wed, May 14, 2025 at 10:53:15AM -0700, Rob Clark wrote:
> > > From: Rob Clark <robdclark@chromium.org>
> > >
> > > See commit a414fe3a2129 ("drm/msm/gem: Drop obj lock in
> > > msm_gem_free_object()") for justification.
> >
> > Please write a proper commit message that explains the problem and the =
solution.
> > Please don't just refer to another commit and leave it to the reviewer =
of the
> > patch to figure this out.
> >
> > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > ---
> > >  drivers/gpu/drm/drm_gpuvm.c | 7 +++++--
> > >  1 file changed, 5 insertions(+), 2 deletions(-)
> >
> >
> > > diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.=
c
> > > index f9eb56f24bef..1e89a98caad4 100644
> > > --- a/drivers/gpu/drm/drm_gpuvm.c
> > > +++ b/drivers/gpu/drm/drm_gpuvm.c
> > > @@ -1511,7 +1511,9 @@ drm_gpuvm_bo_destroy(struct kref *kref)
> > >     drm_gpuvm_bo_list_del(vm_bo, extobj, lock);
> > >     drm_gpuvm_bo_list_del(vm_bo, evict, lock);
> > >
> > > -   drm_gem_gpuva_assert_lock_held(obj);
> > > +   if (kref_read(&obj->refcount) > 0)
> > > +           drm_gem_gpuva_assert_lock_held(obj);
> > > +
> > >     list_del(&vm_bo->list.entry.gem);
> >
> > This seems wrong.
> >
> > A VM_BO object keeps a reference of the underlying GEM object, so this =
should
> > never happen.
> >
> > This function calls drm_gem_object_put() before it returns.
>
> I noticed your subsequent patch that allows VM_BO structures to have weak
> references to GEM objects.
>
> However, even with that this seems wrong. If the reference count of the G=
EM
> object is zero when drm_gpuvm_bo_destroy() is called it means that the GE=
M
> object is dead. However, until drm_gpuvm_bo_destroy() is called the GEM o=
bject
> potentially remains to be on the extobj and eviced list, which means that=
 other
> code paths might fetch it from those lists and consider it to be a valid =
GEM
> object.

We only iterate extobj or evicted in VM_BIND mode, where we aren't
using WEAK_REF.  I suppose some WARN_ON()s or BUG_ON()s could make
this more clear.

BR,
-R

