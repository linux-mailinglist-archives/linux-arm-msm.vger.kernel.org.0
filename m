Return-Path: <linux-arm-msm+bounces-58150-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F82AAB91F6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 23:58:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 41EAF4A694C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 21:58:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3C3E288C87;
	Thu, 15 May 2025 21:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ev9ltSrX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 387C419CCEA;
	Thu, 15 May 2025 21:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747346281; cv=none; b=kXON6gZeTB3tQsokto+Y/bHwEx/VnqBAskk3PlYLj3h2wMqYRHJnZOqAqOjPIHsNHMlFPq+XnDmz4FADVjMdUjTUVS6KgGYun/efDwld/Keb/JRffBN8jwQNbVI80NDKryfMCCDwSNk85UG4FzuayHnbrQBtKynDdELYsr3fn6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747346281; c=relaxed/simple;
	bh=51+I3ne6qhWVkEbmeXWBV5Ymb9zgRr3MD2wvqeP+id0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RXpOb7R3BmuXveHE8kjOvaf4r68GXv46EtBZWMrk0t3AhVh8W/mL5MwYo70Ddk7wQeYVZXlqxePQy2k+FW1pWTIKlv4YgydhYP4YYAAjGsp60qP6UCTQagret+OxgxxALdVXQxjZx6emQ/n4FJo8lKxUcWCY8SIswf3JZXhYpJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ev9ltSrX; arc=none smtp.client-ip=209.85.166.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-864a071b44bso39389539f.3;
        Thu, 15 May 2025 14:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747346279; x=1747951079; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZWPIGi65hQLBAgzuyd+N24zLjShm5Vi7JZs1Wtdqzgg=;
        b=ev9ltSrXWpsZtoEQJSUCYj+hXxFNb7a637HFTMG9emsESCva0YxKmE2om6kcFREJXL
         L6UXDqienCLbxD2GxJQB+vb3APRst3DKWXABCh2ZJjApRX6RgNBtSo7Zfi2wqP5b4A0X
         VdZlW8aGQfexE0UMtA3S4G8tM6ruUvN7APPhRrCWmFcXsilLr/e4NmKGwoEEYEWdqO5V
         IOD2jT5ySRgJhx2oZ4Sw1M+YrPPZq4YrCuDPixKDz/mCW7G3Ijq9H7k2jk6d5OL3Tb5R
         JI8jYQXLZ4mOeC1zaRzbMNvk2xyCSc63gIL/R6+U2WOUK/2nNfgh8k6l9LB4YbKbvvTm
         pDnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747346279; x=1747951079;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZWPIGi65hQLBAgzuyd+N24zLjShm5Vi7JZs1Wtdqzgg=;
        b=oimqQffC3oJ3tvxgBblatLQsa7kf8w3gkQPgP2Rn6Fbxp/R5QuwKpGAuGunVZMOEXo
         5GzKAuqjSoSX3ZICF3I1LWVwsBVggs5SO7SSix3Hwz85lgEc7iqfkQFp4K/pnrtBRbaK
         qKtQB1OrWywIdYpP3m11DdGM2NOMjLopFeENYuS3/9U5ECNNOr02hsbwMQYMkUiNAY5f
         xBIkF+IGisPW4pqsJWWmuTxXpzQZ+YzrMWE+CZH3nveviS7doqMb00sUl81znBl+GzvF
         /2W5fyoN2ls9bHZbMj/I3ozMK1gBFF7ffZc8iVo72kC2qrR7bNec+57AgMXWpv0RfLJp
         QBEg==
X-Forwarded-Encrypted: i=1; AJvYcCWcKKVhg09/Gtbovz6PDKyLbj3YOsbgpwNnCM91GwRxoPNx8nNzkSfCO3YND45PY7xQsNpqhttmSo6YftZn@vger.kernel.org, AJvYcCXzg8pnzRzeigQWaK/tJCWtjx1FYbshX+EQysWNFrWhfV8JzfGnhbqkqChNYB7WUUXn9sH8/cjq065malX8@vger.kernel.org
X-Gm-Message-State: AOJu0YxhyqskdKYFHhquFBTVcFado06ci2cdD/dFDv4RCvNcGU/cwgSp
	qojEVtDu6shAhMCL6Re+hJ4Xkr5lGpznHmWlC5LHig54eTB09NXQ1P+jYjmFRSfbtD4Ij8GPeKW
	ht425BeDAEP4CElcY9CqP9MAtsS7JAb95Ww==
X-Gm-Gg: ASbGncuz4itbb7k4FgjZgjE4KTIzTCBakJByBmR5WXf6Sj9BHeqkmXuI7OXAC7PBYpR
	Uc0YMqN/hJNFMXL6typwBRJE8fkClwrWuby7aN2D7sx+MPaI6cFPaQQOh47yO8n7d/fvdzA4cr1
	LdUPbnj9/iDiTiGL+OF1YNiphhUOymdJNY5s451jDb9kceGbzqmKrEzm2KUrFqFgE=
X-Google-Smtp-Source: AGHT+IGZP3ADNraxTdjsvTc5WLL4t8pJQzUr1tqWOb0/phnP0YQRlQC1v5nNou1wGhWO4usCosXrLStB1fTg71/ymrw=
X-Received: by 2002:a05:6602:4c0e:b0:864:9cc7:b847 with SMTP id
 ca18e2360f4ac-86a24df598emr71745639f.14.1747346279173; Thu, 15 May 2025
 14:57:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250514175527.42488-1-robdclark@gmail.com> <20250514175527.42488-2-robdclark@gmail.com>
 <aCWrwz2IF6VBUi4e@pollux> <aCWueFzx2QzF7LVg@pollux> <CAF6AEGu9MPxKnkHo45gSRxaCP+CTzqsKZjiLuy4Ne4GbrsStGA@mail.gmail.com>
 <aCYqlvp_T77LyuMa@pollux>
In-Reply-To: <aCYqlvp_T77LyuMa@pollux>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 15 May 2025 14:57:46 -0700
X-Gm-Features: AX0GCFs6YgaO4c1gJb_pjyiu_k16Ux8vtO0EyxRMsKZHeJCwowWkm7UmCmbyt6U
Message-ID: <CAF6AEGsOTNedZhuBzipSQgNpG0SyVObaeq+g5U1hGUFfRYjw8w@mail.gmail.com>
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

On Thu, May 15, 2025 at 10:55=E2=80=AFAM Danilo Krummrich <dakr@kernel.org>=
 wrote:
>
> On Thu, May 15, 2025 at 10:35:21AM -0700, Rob Clark wrote:
> > On Thu, May 15, 2025 at 2:06=E2=80=AFAM Danilo Krummrich <dakr@kernel.o=
rg> wrote:
> > >
> > > On Thu, May 15, 2025 at 10:54:27AM +0200, Danilo Krummrich wrote:
> > > > Hi Rob,
> > > >
> > > > Can you please CC me on patches for GPUVM?
> > > >
> > > > On Wed, May 14, 2025 at 10:53:15AM -0700, Rob Clark wrote:
> > > > > From: Rob Clark <robdclark@chromium.org>
> > > > >
> > > > > See commit a414fe3a2129 ("drm/msm/gem: Drop obj lock in
> > > > > msm_gem_free_object()") for justification.
> > > >
> > > > Please write a proper commit message that explains the problem and =
the solution.
> > > > Please don't just refer to another commit and leave it to the revie=
wer of the
> > > > patch to figure this out.
> > > >
> > > > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > > > ---
> > > > >  drivers/gpu/drm/drm_gpuvm.c | 7 +++++--
> > > > >  1 file changed, 5 insertions(+), 2 deletions(-)
> > > >
> > > >
> > > > > diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gp=
uvm.c
> > > > > index f9eb56f24bef..1e89a98caad4 100644
> > > > > --- a/drivers/gpu/drm/drm_gpuvm.c
> > > > > +++ b/drivers/gpu/drm/drm_gpuvm.c
> > > > > @@ -1511,7 +1511,9 @@ drm_gpuvm_bo_destroy(struct kref *kref)
> > > > >     drm_gpuvm_bo_list_del(vm_bo, extobj, lock);
> > > > >     drm_gpuvm_bo_list_del(vm_bo, evict, lock);
> > > > >
> > > > > -   drm_gem_gpuva_assert_lock_held(obj);
> > > > > +   if (kref_read(&obj->refcount) > 0)
> > > > > +           drm_gem_gpuva_assert_lock_held(obj);
> > > > > +
> > > > >     list_del(&vm_bo->list.entry.gem);
> > > >
> > > > This seems wrong.
> > > >
> > > > A VM_BO object keeps a reference of the underlying GEM object, so t=
his should
> > > > never happen.
> > > >
> > > > This function calls drm_gem_object_put() before it returns.
> > >
> > > I noticed your subsequent patch that allows VM_BO structures to have =
weak
> > > references to GEM objects.
> > >
> > > However, even with that this seems wrong. If the reference count of t=
he GEM
> > > object is zero when drm_gpuvm_bo_destroy() is called it means that th=
e GEM
> > > object is dead. However, until drm_gpuvm_bo_destroy() is called the G=
EM object
> > > potentially remains to be on the extobj and eviced list, which means =
that other
> > > code paths might fetch it from those lists and consider it to be a va=
lid GEM
> > > object.
> >
> > We only iterate extobj or evicted in VM_BIND mode, where we aren't
> > using WEAK_REF.  I suppose some WARN_ON()s or BUG_ON()s could make
> > this more clear.
>
> There is also the GEM object's list of VM_BOs, are you using that?

yes, but at this point there are no more ref's to the obj, and that
list is obj specific

> Anyways, I don't agree with that. Even if you can tweak your driver to no=
t run
> into trouble with this, we can't introduce a mode that violates GOUVM's i=
nternal
> lifetimes and subsequently fix it up with WARN_ON() or BUG_ON().
>
> I still don't see a real technical reason why msm can't be reworked to fo=
llow
> those lifetime rules.

The basic issue is that (a) it would be really awkward to have two
side-by-side VM/VMA management/tracking systems.  But in legacy mode,
we have the opposite direction of reference holding.  (But at the same
time, don't need/use most of the features of gpuvm.)

BR,
-R

