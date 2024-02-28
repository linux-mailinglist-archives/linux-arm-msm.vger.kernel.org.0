Return-Path: <linux-arm-msm+bounces-12840-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 248BE86A753
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Feb 2024 04:47:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C2BF61F2CA8E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Feb 2024 03:47:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24DCB208A9;
	Wed, 28 Feb 2024 03:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="exYmKWOP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63EE7208C6
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Feb 2024 03:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709092071; cv=none; b=SrpILdwGtXGCfer+L/cZG7Db3OR6nH6ndcYDEyL7OylPYksYn7Bht+9ae/OP6DJcytKI48KXEIHzaSx3ZwxVOFhOPuxMfS708Xo7iW2/DFGcgCLMx+/CEAPQSUTZ5+pOWHym4eUykceADv5KTtae3ZDUpIbUdUZzrpGpe/cpN70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709092071; c=relaxed/simple;
	bh=877chHYX5RTm5JyotlsmbVFl7mbnFWQp4f4lHZ0QFtQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mDIZ3ZOtH5GXOX8NHKyVxLca9J2VoreeacnJPlJEgbCynqGlqoKjvXhKEj50W20gtnUl53HnMR7mtWY4Sx6wbDB2BRsCkWar38YBSKCk0iAY8141AtMC8lWFqBtL+bj+0nTBOcn61+VM3SZ85D54A4X7nfAH2XBjcZDFPaozqVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=exYmKWOP; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-608ed07bdc5so31756687b3.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Feb 2024 19:47:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1709092068; x=1709696868; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g/DHH/2GuNtK9+6RCOfdjmOHhlQolPWcSEw0qt7/GJo=;
        b=exYmKWOP2GlJFQgERNn7zn8Tow1fbb0ZJPBC/wYHp4/tc9EP5wggZim7Lz2bTZDWWa
         FP5SggonGHrX8HXwCn63TXifUhKMXMEXQsOvyFr7kYnMOIl8k+1iRn0n80QaGjPeZSSc
         AbW9CjMA5tSr1tL1hXfbneQqiP0cbc+orLRkU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709092068; x=1709696868;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g/DHH/2GuNtK9+6RCOfdjmOHhlQolPWcSEw0qt7/GJo=;
        b=VtOHJ7VtI58HAWBjLypNDfyIRSuW/ycfT85Pm8C4RkCq812pq5j2ZLfc6lZINPGuvS
         Kxqo9qkg0PFRkkWwVMOVVCt205JvhsJ+nD/+MroaFE2E8k0CSE7s3SXnWR3Zu6zimMOy
         Lu/4G2iKW7cBNKL44HrSpnsVTGt9ZHpxeFXjM71BvgO7Ya5NraknWifXc9Nmi5Kht5Vd
         keTBwmhAL2q2iAOGxK0MimSuQTHpCUUZ0Y0DqnaP3Y4ahAaMpS4iqqUlLnMPmBGDhM1C
         pQE6J0jz6nwpjXE3FLZ8yUfrjeBvkDEwzOi40xb8SHNnoasHduDT10K2gbeC2KzzvYjf
         hTgQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7l5Ohq/cFnmDO0ckjyFocBrq5ONmGNvDAgr6Nh/LmtXSiS2w33SzYsxjuDEXY/950Z9en/52GUxbnz/KupPc76lGTOvQpZRgfrDESaQ==
X-Gm-Message-State: AOJu0YzIMoVsMemfjT0c/qcGZB7SEs14tWKf3xlRmYjXmGjY76HPWKXj
	NK0kEgJQmPgCOBTWRlRwOPZVqiw+E6DYt9yZB6zaGvy4TdIGueX/+O5JwYwakDnZdnjoshoygyl
	v5treM/B9QnUClYvddcUAS5ZKZHjCoMBXedp4
X-Google-Smtp-Source: AGHT+IEuu5G9/EtkiJuIqK5DEsLbHEiSicOLnCwW2E1hTZ+I5ANhBoRZTZztYsh0saLiizBliAy4AujGNkSwBQUlm8o=
X-Received: by 2002:a05:690c:f8f:b0:5ff:7cca:a434 with SMTP id
 df15-20020a05690c0f8f00b005ff7ccaa434mr4528537ywb.51.1709092068238; Tue, 27
 Feb 2024 19:47:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240227113853.8464-1-tzimmermann@suse.de> <20240227113853.8464-9-tzimmermann@suse.de>
In-Reply-To: <20240227113853.8464-9-tzimmermann@suse.de>
From: Zack Rusin <zack.rusin@broadcom.com>
Date: Tue, 27 Feb 2024 22:47:37 -0500
Message-ID: <CABQX2QP4dCy2nfxXp3tEybtRF1UW_wMAKp1+m=2VA7Lt=C+Vvg@mail.gmail.com>
Subject: Re: [PATCH 08/13] drm/qxl: Acquire reservation lock in GEM pin/unpin callbacks
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: daniel@ffwll.ch, airlied@gmail.com, mripard@kernel.org, 
	maarten.lankhorst@linux.intel.com, christian.koenig@amd.com, 
	sumit.semwal@linaro.org, dmitry.osipenko@collabora.com, robdclark@gmail.com, 
	quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org, sean@poorly.run, 
	marijn.suijten@somainline.org, suijingfeng@loongson.cn, kherbst@redhat.com, 
	lyude@redhat.com, dakr@redhat.com, airlied@redhat.com, kraxel@redhat.com, 
	alexander.deucher@amd.com, Xinhui.Pan@amd.com, 
	bcm-kernel-feedback-list@broadcom.com, dri-devel@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
	nouveau@lists.freedesktop.org, virtualization@lists.linux.dev, 
	spice-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 27, 2024 at 6:39=E2=80=AFAM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> Acquire the reservation lock directly in GEM pin callback. Same for
> unpin. Prepares for further changes.
>
> Dma-buf locking semantics require callers to hold the buffer's
> reservation lock when invoking the pin and unpin callbacks. Prepare
> qxl accordingly by pushing locking out of the implementation. A
> follow-up patch will fix locking for all GEM code at once.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/qxl/qxl_prime.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/qxl/qxl_prime.c b/drivers/gpu/drm/qxl/qxl_pr=
ime.c
> index 9169c26357d36..f2646603e12eb 100644
> --- a/drivers/gpu/drm/qxl/qxl_prime.c
> +++ b/drivers/gpu/drm/qxl/qxl_prime.c
> @@ -31,15 +31,27 @@
>  int qxl_gem_prime_pin(struct drm_gem_object *obj)
>  {
>         struct qxl_bo *bo =3D gem_to_qxl_bo(obj);
> +       int r;
>
> -       return qxl_bo_pin(bo);
> +       r =3D qxl_bo_reserve(bo);
> +       if (r)
> +               return r;
> +       r =3D qxl_bo_pin_locked(bo);
> +       qxl_bo_unreserve(bo);
> +
> +       return r;
>  }
>
>  void qxl_gem_prime_unpin(struct drm_gem_object *obj)
>  {
>         struct qxl_bo *bo =3D gem_to_qxl_bo(obj);
> +       int r;
>
> -       qxl_bo_unpin(bo);
> +       r =3D qxl_bo_reserve(bo);
> +       if (r)
> +               return;
> +       qxl_bo_unpin_locked(bo);
> +       qxl_bo_unreserve(bo);
>  }

It looks like gem_prime_pin/unpin is largely the same between a lot of
drivers now. That might be a nice cleanup in the future.

z

