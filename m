Return-Path: <linux-arm-msm+bounces-107148-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mD27ACFhA2oq5gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107148-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 19:19:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 517F0525AE5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 19:19:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 429BB302FB79
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 17:14:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 863F2385D81;
	Tue, 12 May 2026 17:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BLI5qKm7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A6D1385D83
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 17:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778606045; cv=pass; b=BesMro3+UJtF60iMPPjoURuxtPQiVISq68SOr4t3jUptcAuBEse4PVSTUCcbFOz3aGNF4k9vVF9l6G+XlXqvpJTvYdcF+Bt5JBtG/EsCi6WKSRvLxvgOcOq+L9JN+o9P+s4XZPrgZ4bI7Hb9kiBTK4EBZGzJpjBVK4hwG024kKs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778606045; c=relaxed/simple;
	bh=ObcSW+DEohtR7FnFaoSwfEeN+Ki8/aSc4oR0VyiCXwM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VVJXBYx9h1rqpUBLUT6E6G6Uugknpi3UMm7xnUxOELDtCVakFtMDs9rQKAiJnk4aD7QWSWQ/b0HjQ3p/3nBMN9wi8NwawBp1MiMY/louDjf60S4rmwUC3iDzd9K8Sz9ge+nIMDR65PVbJxDaV7CgZ5zStjCkYrXoILvzpQIwm8M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BLI5qKm7; arc=pass smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-7bf0b1a47b1so58527897b3.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 10:14:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778606042; cv=none;
        d=google.com; s=arc-20240605;
        b=HkjUsHKMMiOnI6CWdxDPupgTIrb94fZCiY8n8UDy4QUwWAYao11hyvJdJ6R5FAqhnE
         85wk71LG2u7TcxrEB5M8XtqlTX/3II6X5Yso2EAVjov9pN9zJP+qm5+FP0DYsdTuD47h
         tTcFLS/xaFazRcz8w6SFHyVsSK2O2SActQr5caVEErV1V+6o/EsbBJ6l3kZINwzwofUu
         lmKSUSwSGTUctrdbxwcESc6m3bim4wvUjOksCIEfsdCbCBYxbmjmJCz/+/itgcgYIDaP
         jVimkFHD4uy2PLPlpPiSvZXiSN5whm32tcZeXNA2Jjf91FhyOLtefD1DDNRLAYf/zNXT
         rD7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=28UW7f0GMLLqTkPxuZZAUCWH5yTWokTtTfctb6VdQiY=;
        fh=TLivKQVJgrKftEn1vDsG9WM6CZ6ZGG8AqxWj20pNvoQ=;
        b=PdxJGIKqYW3UmnfX7I9CV1VW10Gx071rR9TywkDnnVsrclgmGoiKh+lpq++XNKGZBr
         WefGcZdlL33LabhWHY+W3W/atJdR1wdQQkcd/5Gams3H5FaPs4rqeVHg4nGGLHKz1wRN
         R0+2kXyIzFnsBCd0fbl1rEC/HWg6Qq5L9PSnt5h3J0duFEPT9hz66QeYrp8QBwyLq9uF
         5f2TTFia3Fhh6/i0jq5jR0cX/OuYKM5aU3PGva8AyBy4PHh/x71in0G4SBSmbv7jLXHt
         tL9c/Z2TKvTpEdlSw1Z8OjL3gEQbs3Y55ywiLzhZZeEYfPDFjkPIAJBnnysdshgm063o
         W+DQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778606042; x=1779210842; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=28UW7f0GMLLqTkPxuZZAUCWH5yTWokTtTfctb6VdQiY=;
        b=BLI5qKm7NRjs25l/KqvKgKKrp5k7KdyLb8SrSbQfFEsVPKPz7mVf/MMzOuZsyaS4XI
         6U5q7DatoEMBv5issxOkPfKKqOA829MIqgLSt1KxzBLdTrPhm2hJe8bTL9z4ZQkWvTxH
         gG9ps+ZgiVWkuzrg1D4fxdCTQqh7+mDokHs6duXzlSmaE4C8UU26+81kqnj6v4+rTXPW
         gVK2BmAAG8cax4/4H0fYKpdUtk5G6v+UWnhEUhJYlQIdDmhL+D5n9PvdA+ctQ7Ltouz6
         4Xcmb9PnGQDuprPGSg30Lonj9Uq5G3rR4u8MME4fIjEwDiu8UacgkMkyP5mlV1dAToI5
         qInw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778606042; x=1779210842;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=28UW7f0GMLLqTkPxuZZAUCWH5yTWokTtTfctb6VdQiY=;
        b=G1Dqv1EZu3WOv9ymNjAtVTMMo3iWmm7fJPNnftbswRMZwmjx9nk/K+do5xvO2kkmHh
         Btg3FzrJ9jm3aSgvDtQzOzPM1fqP/b8HreHsylLDY1ubKshH20h1ztOCArI/+FnE414q
         r/mAahN1lAefb1TQg22NJd+89cYtwvjguWi9b7O2oE8o8MYPNo62cQYDw6h8W8YiI2uG
         Ke1MDIVYipijqfJklycYHaqkrOgJFUGgUMPMXzc516s0roJf2SqNC391O1EV8Sa0PWgy
         /e5t752dXgKr0VeFoBHwTbf1MVSxTa40AtMuL51bjCM75CfGjOiDtpry0QlLU5EgA+TZ
         JFHA==
X-Forwarded-Encrypted: i=1; AFNElJ/TQKyb2RSY7IT99JUTu5pZ1ifYyLDD6JwhqIjCJhdfWutHmmZXEUueFLOBFpusKELZlLzTDZrpJyQ9JNUB@vger.kernel.org
X-Gm-Message-State: AOJu0Yxmx8s+O4QcgxhH6xKjjjCZ+rAjVaG4dd7+YJ+9TfbSvJG+7KAy
	8GU/CAiC+YtS6Io2Wolm06blnk3QDvlLstPdR0QGymbvGZgQV6PPw+/52h5UuEg+xrNCvrqV9IL
	6RrbbuFfZFZrIppb8xh8Uldpo6D0dww0=
X-Gm-Gg: Acq92OEEaBcxYLeUnJSH4KdIrH/QdlNOsshnleTTaMtIgF/VCr4FweTn5FL4Jn5W8hq
	yk1/Gi7gjZjyITFxwgef9vi7f6dc6y9IV0a/u9Yfr29t0G7yN3Df5wlhy5mmalmXP0keGrrQcEA
	gioGCxcOf4PCIC3xhAaZt61NsiU3Ul/HA8WEH0R96rbsqg9S6lO0WGzGhiCWNp5Lv/lpwjJGWKI
	YOfUJB7eVQhJxefgf1pOPvs1fNxoMaAsPuAUBrhPLEIAmsKVZT61dBX5OKws4QycNDdrFqAfOIm
	jsBeXCjffflU1AR9LeYk5f1M515+5v+9o3TFUi8TJNw6g7SJy7trUq7iyWB/ThmR8MSfsDcWDPY
	FneMl8UlD
X-Received: by 2002:a05:690c:660f:b0:7b4:dc3a:79c5 with SMTP id
 00721157ae682-7bdf5dfc0a3mr324827037b3.12.1778606042355; Tue, 12 May 2026
 10:14:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260512-panthor-shrinker-fixes-v3-1-3bf066259471@collabora.com>
In-Reply-To: <20260512-panthor-shrinker-fixes-v3-1-3bf066259471@collabora.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Tue, 12 May 2026 10:13:50 -0700
X-Gm-Features: AVHnY4LxXib3-E5o-ncoC-Ve5BSVtKohuRDWBqpVUAwhcwEEkz6QV630vr-0Dm4
Message-ID: <CAPaKu7Q7RuwgGg3EvO3SLKr8__VmmKrhhUMTV=WBKjSB8c_qTA@mail.gmail.com>
Subject: Re: [PATCH v3] drm/gem: Make the GEM LRU lock part of drm_device
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Akash Goel <akash.goel@arm.com>, Rob Clark <robin.clark@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Rob Clark <rob.clark@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 517F0525AE5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107148-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[arm.com,collabora.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,vger.kernel.org,lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[olvaffe@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,gitlab.freedesktop.org:url,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,arm.com:email]
X-Rspamd-Action: no action

On Mon, May 11, 2026 at 11:59=E2=80=AFPM Boris Brezillon
<boris.brezillon@collabora.com> wrote:
>
> Recently, a few races have been discovered in the GEM LRU logic, all
> of them caused by the fact the LRU lock is accessed through
> gem->lru->lock, and that very same lock also protects changes to
> gem->lru, leading to situations where gem->lru needs to first be
> accessed without the lock held, to then get the lru to access the lock
> through and finally take the lock and do the expected operation.
>
> Currently, the only driver making use of this API (MSM) declares a
> device-wide lock, and the user we're about to add (panthor) will
> do the same. There's no evidence that we will ever have a driver
> that wants different pools of LRUs protected by different locks under
> the same drm_device. So we're better off moving this lock to drm_device
> and always locking it through obj->dev->gem_lru_mutex, or directly
> through dev->gem_lru_mutex.
>
> If anyone ever needs more fine-grained locking, this can be revisited
> to pass some drm_gem_lru_pool object representing the pool of LRUs
> under a specific lock, but for now, the per-device lock seems to be
> enough.
>
> Fixes: e7c2af13f811 ("drm/gem: Add LRU/shrinker helper")
> Reported-by: Chia-I Wu <olvaffe@gmail.com>
> Closes: https://gitlab.freedesktop.org/panfrost/linux/-/work_items/86
> Reviewed-by: Rob Clark <rob.clark@oss.qualcomm.com>
> Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
I cannot quite reproduce with or without the fix, but this is

Reviewed-by: Chia-I Wu <olvaffe@gmail.com>

> ---
> As reported by Chia-I [1], a race exists between drm_gem_lru_remove()
> and drm_gem_lru_scan(), causing a UAF on a stack-allocated object.
>
> This new version only keeps the last patch of the series that
> addresses the problem more generically by moving the LRU lock to the
> drm_device object.
>
> [1]https://gitlab.freedesktop.org/panfrost/linux/-/work_items/86
> ---
> Changes in v3:
> - Only keep patch 4 and flag it for backport
> - Rebase on drm-misc-fixes
> - Link to v2: https://lore.kernel.org/r/20260508-panthor-shrinker-fixes-v=
2-0-39cdb7d577c9@collabora.com
>
> Changes in v2:
> - Collect R-b
> - Drop a useless obj->lru !=3D NULL check in drm_gem_lru_scan()
> - Fix another race introduced in patch 2
> - Document why the lru !=3D NULL check done without the lru lock held
>   in drm_gem_lru_remove() is safe
> - Add a patch to sanitize the GEM LRU locking: lock is now part of
>   drm_device, meaning we don't have this chicken/egg problem where
>   the lock that needs to acquired is under gem->lru->lock, and
>   gem->lru is also supposed to be accessed with the lru->lock held
> - Fix typos in commit messages and comments
> - Link to v1: https://lore.kernel.org/r/20260506-panthor-shrinker-fixes-v=
1-0-e7721526de96@collabora.com
> ---
>  drivers/gpu/drm/drm_drv.c              |  2 ++
>  drivers/gpu/drm/drm_gem.c              | 34 +++++++++++++++-------------=
------
>  drivers/gpu/drm/msm/msm_drv.c          | 11 +++++------
>  drivers/gpu/drm/msm/msm_drv.h          |  7 -------
>  drivers/gpu/drm/msm/msm_gem.c          | 32 ++++++++++++++++------------=
----
>  drivers/gpu/drm/msm/msm_gem_shrinker.c |  4 ++--
>  drivers/gpu/drm/msm/msm_gem_submit.c   |  6 +++---
>  drivers/gpu/drm/msm/msm_gem_vma.c      | 12 ++++++------
>  drivers/gpu/drm/msm/msm_ringbuffer.c   |  6 +++---
>  include/drm/drm_device.h               |  7 +++++++
>  include/drm/drm_gem.h                  | 20 +++++++++-----------
>  11 files changed, 68 insertions(+), 73 deletions(-)
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
> index d6424267260b..2b1ac2b02b14 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -1544,9 +1544,8 @@ EXPORT_SYMBOL(drm_gem_unlock_reservations);
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
> @@ -1571,14 +1570,10 @@ drm_gem_lru_remove_locked(struct drm_gem_object *=
obj)
>  void
>  drm_gem_lru_remove(struct drm_gem_object *obj)
>  {
> -       struct drm_gem_lru *lru =3D obj->lru;
> -
> -       if (!lru)
> -               return;
> -
> -       mutex_lock(lru->lock);
> -       drm_gem_lru_remove_locked(obj);
> -       mutex_unlock(lru->lock);
> +       mutex_lock(&obj->dev->gem_lru_mutex);
This becomes a cost that all drivers pay. I guess it is not too big an issu=
e.

> +       if (obj->lru)
> +               drm_gem_lru_remove_locked(obj);
> +       mutex_unlock(&obj->dev->gem_lru_mutex);
>  }
>  EXPORT_SYMBOL(drm_gem_lru_remove);
>
> @@ -1593,7 +1588,7 @@ EXPORT_SYMBOL(drm_gem_lru_remove);
>  void
>  drm_gem_lru_move_tail_locked(struct drm_gem_lru *lru, struct drm_gem_obj=
ect *obj)
>  {
> -       lockdep_assert_held_once(lru->lock);
> +       lockdep_assert_held_once(&obj->dev->gem_lru_mutex);
>
>         if (obj->lru)
>                 drm_gem_lru_remove_locked(obj);
> @@ -1617,9 +1612,9 @@ EXPORT_SYMBOL(drm_gem_lru_move_tail_locked);
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
> @@ -1640,7 +1635,8 @@ EXPORT_SYMBOL(drm_gem_lru_move_tail);
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
> @@ -1650,9 +1646,9 @@ drm_gem_lru_scan(struct drm_gem_lru *lru,
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
> @@ -1675,7 +1671,7 @@ drm_gem_lru_scan(struct drm_gem_lru *lru,
>                  * rest of the loop body, to reduce contention with other
>                  * code paths that need the LRU lock
>                  */
> -               mutex_unlock(lru->lock);
> +               mutex_unlock(&dev->gem_lru_mutex);
>
>                 if (ticket)
>                         ww_acquire_init(ticket, &reservation_ww_class);
> @@ -1709,7 +1705,7 @@ drm_gem_lru_scan(struct drm_gem_lru *lru,
>
>  tail:
>                 drm_gem_object_put(obj);
> -               mutex_lock(lru->lock);
> +               mutex_lock(&dev->gem_lru_mutex);
>         }
>
>         /*
> @@ -1721,7 +1717,7 @@ drm_gem_lru_scan(struct drm_gem_lru *lru,
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
> index 6d847d593f1a..617b3c4b42c0 100644
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
> index 1a952b171ed7..c4cfe036066b 100644
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
> @@ -1305,7 +1305,7 @@ vm_bind_job_pin_objects(struct msm_vm_bind_job *job=
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
> @@ -1314,10 +1314,10 @@ vm_bind_job_pin_objects(struct msm_vm_bind_job *j=
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
> index 30ddb5351e98..2d6b930b766e 100644
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
> index 86f5846154f7..8a704f6a65c1 100644
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
> @@ -610,12 +607,13 @@ void drm_gem_unlock_reservations(struct drm_gem_obj=
ect **objs, int count,
>  int drm_gem_dumb_map_offset(struct drm_file *file, struct drm_device *de=
v,
>                             u32 handle, u64 *offset);
>
> -void drm_gem_lru_init(struct drm_gem_lru *lru, struct mutex *lock);
> +void drm_gem_lru_init(struct drm_gem_lru *lru);
>  void drm_gem_lru_remove(struct drm_gem_object *obj);
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
> ---
> base-commit: b2ed01e7ad3de80333e9b962a44024b094bc0b2b
> change-id: 20260506-panthor-shrinker-fixes-58c1f45cfc41
>
> Best regards,
> --
> Boris Brezillon <boris.brezillon@collabora.com>
>

