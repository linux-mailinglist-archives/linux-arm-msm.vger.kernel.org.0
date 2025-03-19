Return-Path: <linux-arm-msm+bounces-52016-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B9FA69491
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 17:16:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9D7C2463CFD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 16:15:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60ABD1DF974;
	Wed, 19 Mar 2025 16:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j5yrUegv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB818C0B;
	Wed, 19 Mar 2025 16:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742400950; cv=none; b=cZDWtcMbCABYnR/AsjPFSrlzGklyNpjebRM5AKEEBAhG1fXyIPna5Guilqd5Bz7FABdimzxT7OvqCkG3/yBEYBayqsccQw/XYhNvMxlE4l+IVJUk1zKSL0YxyUh9y7xM3tJjcQ1h8bh4UjzbElzt5/bvtLKYhu/zt2qGGAuArEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742400950; c=relaxed/simple;
	bh=Skxqsk56F5o1PDAiJhFpiaS0w8B+mdRUdg/XdOxyT18=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b9M9J1Ee6yk+sJCCb7gcdNl0O0qVuHhjfgMwnTYkdDASeLioZ4OuRM6nlnQhPKjWrbMpzKcVN8r6oVBZM9VdZsOuYiT8TzOsVpqsHnKZujp9ZOCh6Qjdc6eNrUXP11RJZWAO8qVgqFR9xtG9R6UxQ4BPFCjGqkfy5tXCMy9ZCpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j5yrUegv; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-223fd44daf8so18680925ad.2;
        Wed, 19 Mar 2025 09:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742400948; x=1743005748; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tpcB9t6A6KxaND4R+weRblu7REH8HLN/jg/pD41KDJ0=;
        b=j5yrUegvyedYhJ42KXWUksdRHELvXLoHrSw3OD0sSbQz1BAP4HTlQT4/941QdZiO8M
         bRKLoNqzeFcUkXFHacKlSQGimR4PJ9e+Gp7JpaBy3Cg1du7BFBS6A++tgBVVQ6JKmWgq
         fGt9hxd/K7oAOInBdeQiVhctt9BU/yt79KSQNRwFCiYUmNS8yNBv8DjcOre2dSCGTfKd
         RZi1qE9zeOmYoDGfEY4kqXQfvNLX0k9SHd5Y0eU7KwkfxeQxLSnkQIFTROd2pNcpjoBA
         I/W1fFKaVq9gHQNH9T48XbOjC8GicBEh2t5JPzzUYir8joQEMn5takzdnFurVTEAF7JU
         TJMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742400948; x=1743005748;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tpcB9t6A6KxaND4R+weRblu7REH8HLN/jg/pD41KDJ0=;
        b=pVBJW7BWr9mZWioK9fQdro4FHeYYxfdvWpbLbLdc/+Z4wj1SbDJyuVupatLdof3fA9
         cZ38DQBsxLT5hnzk2CnWMNkgs0jINbp7OUE3KS1c3pNP5JD8Dkp/8tlqiDSjds1h5XRR
         GNyudD4qhgMIjeRGb8nqsSAryQxpKbe/cQU8QC8T+PL8OHZtYZtt8Rd4Z66dR/PYqnk9
         Lx8Xjg5k3XbSBlhkzLLQyk7bssunSSOQ6MggwwSkYIbkPC74oQzW2wqc1l2b7qhO2rim
         OM6QbaXnYeWq/fY254Y6S/8EbQbUa2HEgxjVEHT8uEraOKkU7r4Jdz3aaOcsR0UuDX8l
         gNgQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrOAUbdE4Ce/shMyb+OD212usrcmhnmpthqkU958D7U5PR08MHUzid8lJki0rR1DdLY01S4UMn5NX2/gXo@vger.kernel.org, AJvYcCWFCPU3Mct7K/clm4xhOOxpVZcVtcATW1mH8S0TWEMt15GmLBiN9KdItciQSXVw4WoTYorrBSZ7W3Gs2rO4@vger.kernel.org
X-Gm-Message-State: AOJu0YwleZo4632QEGByWGav7sAwpHOL/icIqvzjF4Va5xwTcmBzGHSW
	N0uWAbfwB+iYrNGHzgEWUm9uZkGVgE1ubiTntImpOd/SF5KH1EWgAQW4QVU9MqqPAO99OTyX2fY
	gH6CLHRBZ2/samgdmqKAUtreMDkg=
X-Gm-Gg: ASbGnctdQ8tgFMSh3cZLSsbUaimRfiC988RInCz3nxJhagdSAjyXD0nDMaN+P33FKoR
	a1jKEzHmTFFWz9j32WqPMKYK0ZZIfxB9Il8q5QtlPof3jJHm7pbQ7xvgqNEqAvKhyTFa6BI1MVy
	3E6wBvi0nOKlFP9M9Z3/Zh7/ZULg==
X-Google-Smtp-Source: AGHT+IHWf/Je75FDADPOS0gdYyM/GsQweQ6GrhMRjO/NYZMBlz6LRlFzJmEWomdQ90VHrVYogY6aTxo+mtD5MpEKp0A=
X-Received: by 2002:a17:902:f686:b0:215:a96d:ec36 with SMTP id
 d9443c01a7336-2264c5e1a84mr15053705ad.5.1742400947817; Wed, 19 Mar 2025
 09:15:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250319145425.51935-1-robdclark@gmail.com> <20250319145425.51935-17-robdclark@gmail.com>
In-Reply-To: <20250319145425.51935-17-robdclark@gmail.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Wed, 19 Mar 2025 12:15:36 -0400
X-Gm-Features: AQ5f1JrFZ7qplWix08QqXWgrDRrXseMvNo6DIRzsT4jHmQ6Da3MfyWiADCs7_mc
Message-ID: <CACu1E7FduhsXY22BKpjt5WcnAcVtGu01eUiLc9T47OUR+yp_0Q@mail.gmail.com>
Subject: Re: [PATCH v2 16/34] drm/msm: Mark VM as unusable on faults
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@chromium.org>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Konrad Dybcio <konradybcio@kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 19, 2025 at 10:55=E2=80=AFAM Rob Clark <robdclark@gmail.com> wr=
ote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> If userspace has opted-in to VM_BIND, then GPU faults and VM_BIND errors
> will mark the VM as unusable.
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/msm_gem.h        | 17 +++++++++++++++++
>  drivers/gpu/drm/msm/msm_gem_submit.c |  3 +++
>  drivers/gpu/drm/msm/msm_gpu.c        | 16 ++++++++++++++--
>  3 files changed, 34 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.=
h
> index acb976722580..7cb720137548 100644
> --- a/drivers/gpu/drm/msm/msm_gem.h
> +++ b/drivers/gpu/drm/msm/msm_gem.h
> @@ -82,6 +82,23 @@ struct msm_gem_vm {
>
>         /** @managed: is this a kernel managed VM? */
>         bool managed;
> +
> +       /**
> +        * @unusable: True if the VM has turned unusable because somethin=
g
> +        * bad happened during an asynchronous request.
> +        *
> +        * We don't try to recover from such failures, because this impli=
es
> +        * informing userspace about the specific operation that failed, =
and
> +        * hoping the userspace driver can replay things from there. This=
 all
> +        * sounds very complicated for little gain.
> +        *
> +        * Instead, we should just flag the VM as unusable, and fail any
> +        * further request targeting this VM.
> +        *
> +        * As an analogy, this would be mapped to a VK_ERROR_DEVICE_LOST
> +        * situation, where the logical device needs to be re-created.
> +        */
> +       bool unusable;
>  };
>  #define to_msm_vm(x) container_of(x, struct msm_gem_vm, base)
>
> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/m=
sm_gem_submit.c
> index 9731ad7993cf..9cef308a0ad1 100644
> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> @@ -668,6 +668,9 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void=
 *data,
>         if (args->pad)
>                 return -EINVAL;
>
> +       if (to_msm_vm(ctx->vm)->unusable)
> +               return UERR(EPIPE, dev, "context is unusable");
> +
>         /* for now, we just have 3d pipe.. eventually this would need to
>          * be more clever to dispatch to appropriate gpu module:
>          */
> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.=
c
> index 503e4dcc5a6f..4831f4e42fd9 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.c
> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> @@ -386,8 +386,20 @@ static void recover_worker(struct kthread_work *work=
)
>
>         /* Increment the fault counts */
>         submit->queue->faults++;
> -       if (submit->vm)
> -               to_msm_vm(submit->vm)->faults++;
> +       if (submit->vm) {
> +               struct msm_gem_vm *vm =3D to_msm_vm(submit->vm);
> +
> +               vm->faults++;
> +
> +               /*
> +                * If userspace has opted-in to VM_BIND (and therefore us=
erspace
> +                * management of the VM), faults mark the VM as unusuable=
.  This
> +                * matches vulkan expectations (vulkan is the main target=
 for
> +                * VM_BIND)

The bit about this matching Vulkan expectations isn't exactly true.
Some Vulkan implementations do do this, but many will also just ignore
the fault and try to continue going, and the spec allows either. It's
a choice that we're making.

Connor

> +                */
> +               if (!vm->managed)
> +                       vm->unusable =3D true;
> +       }
>
>         get_comm_cmdline(submit, &comm, &cmd);
>
> --
> 2.48.1
>

