Return-Path: <linux-arm-msm+bounces-62718-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C590CAEAC80
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 04:03:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 77ACB5610FC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 02:03:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 684AB1547D2;
	Fri, 27 Jun 2025 02:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uo20jgFK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 290502F1FC4;
	Fri, 27 Jun 2025 02:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750989820; cv=none; b=I3/VZ53R44pTJbhunn/11EYMIoG9XxNrcz+jW7Qsl3NyNIg9hDjbCabmx/Vf0h8UP+/LkNIVlyO3o78/1co43Ulvx555PGUhCY4VUwKPXABbEjFZgdBzn27AvRQhUXgRxZcebSkBAz0mMhQHtY7LGu68Uc5SySVA0lPNxJX0YqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750989820; c=relaxed/simple;
	bh=Q3lLYWFRvkpLOgxfv0OXL3FmSu2du7UZLl8y9bHHdiw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AOXdA8zL2obQLyuXC6R59OMDV64zie6OOdUqqmXWAR0NSkATo4wygYzM3rLSjaT93nxO2iYx14Zm6EcI26fOtl/NebpUW8avmbjrIZEQe7meZBTBj9H9AIZL7WBq6FRcMYGeUMbnWnAAplRhwsXDejYCY5BdwgHBa3ZRirp2jkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uo20jgFK; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-532dbe71e4eso1048466e0c.2;
        Thu, 26 Jun 2025 19:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750989816; x=1751594616; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i/f/+hiyDwdHx+cA843RdLoAxbDE7w4hdsMpE4lkbXo=;
        b=Uo20jgFKFm7qnxLptVEwTRr9Kqf42RJ2uL9WzInxSpQdc1NOjQeM95ix/TkQOrZ/0U
         d437g6suyCtAP1z9iKZpsVL7RDfkiEQv5fnyf/IAolK0T8wI/+rXvELGuZjvLzH6sQc9
         EVX+E4vJCistZ7/9zinRV0aS8qJTtvndH30r9i38KhXE4bT1nHR77UwFFNcAXX3s5dtV
         ki1M7IPRhYsWPCXDUW9zprwIcTI5Njcjhe/S1EPSj6/0j//xnnrx9aw9OFGeFbp6asLD
         dF/W6PKW7wVk3vdIjzhRYwqnBAC5lfM3rZ+nY7Y9Rqtr3ONsB4sW4pFkMPNURY4yN/dP
         Ulzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750989816; x=1751594616;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i/f/+hiyDwdHx+cA843RdLoAxbDE7w4hdsMpE4lkbXo=;
        b=tKbkCf7PY/jbOhuM6+lDVg/dFAxUp8cjHDHe4gzZkftPUs6SBT+lTf5x5pZEXBbUyr
         2+4bGJwJq17M6D2FtgzZ4pzgBGAEHw4k1yiv3Huw7W+z4q10sSr2OEz8jsyk5E4ju+ko
         CD7BXk6dxLXEwJKGY4GIRc/XZnowvP6gmzuRn5x+ieD7wVtCT9BOJrz/S/BW/tX5Py4A
         aGEjzuiXHGr+aFGGBb1mnOS4euO4Q7rqy+dObmR3+GCbgFLSh/Q4csbh3UJSn8HIJ+e/
         tUMHWJHDEB/ot6tMY6R5VCMAH7eMismmxPeu8+0Q1XyVIRC9EFIpfhU2SCGqeid8ZJ4j
         rA0Q==
X-Forwarded-Encrypted: i=1; AJvYcCU5euJzbAHeRztceJAA27BPDQq3jILSTzZDVSNywN8hEgGx2cpQVDiZOR9RRV2/kVfI1U4rJka+s2NAztoFqfSfjdE=@vger.kernel.org, AJvYcCX8ADQrjuH3NvV0Hd3k6VngU+njltUX2Xxd7SkaccMLZD3E4kQOvH4JfoMkn41uwsxYkohqe5xKsjd1DA+c@vger.kernel.org, AJvYcCXNf0kI3RuIBLfQSdPmSXkpGEeTm5TGqhHmOZ3/GsPBZNAHuNMeABfDcJY6a5ShXalE1E/sihN9CYGsLfgd@vger.kernel.org
X-Gm-Message-State: AOJu0YzflOVpTJEpVdD8g1n1SmeNJ1YsXQYTZjqb8HCc0uQE1e/RIrtM
	xJywDxqspe59YFslld3LdCn+deKoVLtW3+0v4AP0hOwPCik7uq4AbhKeaOl8TVmXlexAg7T9lWF
	C5IHOUW2/gofa0OecJ2DqnfiX9Ndmp2k=
X-Gm-Gg: ASbGncsKjspA0L2/PLU+t6E/dTh9DIeUPGXbuf32r0SVM+b+H48awgYJg++9Oahzlqc
	R7YBGl9xvvsCi9mP0m40c1bGgP7LXzvCDK74kJAklWhzKuh2ObQdB7KlGNTKntquJR0K05noxyO
	DOvvtHDUSevfnnY1EfmZvUCMMOhUzkFuAHrbHfe5o6uA==
X-Google-Smtp-Source: AGHT+IHhVsq5/VI1dr0dwY9jUchBPbEamRa2csC8XrsamXPtwwwYjcpSjiIYO02pEuPWifIo5HwkuElrIvaVqdLt0x0=
X-Received: by 2002:a05:6122:8c1a:b0:531:2906:752e with SMTP id
 71dfb90a1353d-5330beda07fmr1498050e0c.5.1750989815830; Thu, 26 Jun 2025
 19:03:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250618-restricted-pointers-drm-v1-0-781e0d88cd92@linutronix.de> <20250618-restricted-pointers-drm-v1-2-781e0d88cd92@linutronix.de>
In-Reply-To: <20250618-restricted-pointers-drm-v1-2-781e0d88cd92@linutronix.de>
From: Inki Dae <daeinki@gmail.com>
Date: Fri, 27 Jun 2025 11:02:59 +0900
X-Gm-Features: Ac12FXx_H-k6IjgjBdIwZwvFGVMe7aOTzmfWa57DZUuTaImbO0rimzs6HuQBV-w
Message-ID: <CAAQKjZMBfU5pSsY9sHE3DBB1AZ1sBDp6hXiV9iXVo6acEZezWg@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/exynos: Don't use %pK through printk
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Jagan Teki <jagan@amarulasolutions.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

2025=EB=85=84 6=EC=9B=94 18=EC=9D=BC (=EC=88=98) =EC=98=A4=ED=9B=84 4:56, T=
homas Wei=C3=9Fschuh
<thomas.weissschuh@linutronix.de>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> In the past %pK was preferable to %p as it would not leak raw pointer
> values into the kernel log.
> Since commit ad67b74d2469 ("printk: hash addresses printed with %p")
> the regular %p has been improved to avoid this issue.
> Furthermore, restricted pointers ("%pK") were never meant to be used
> through printk(). They can still unintentionally leak raw pointers or
> acquire sleeping locks in atomic contexts.
>
> Switch to the regular pointer formatting which is safer and
> easier to reason about.

Applied.

Thanks,
Inki Dae

>
> Signed-off-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_gem.c |  2 +-
>  drivers/gpu/drm/exynos/exynos_drm_ipp.c | 32 ++++++++++++++++-----------=
-----
>  2 files changed, 17 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.c b/drivers/gpu/drm/ex=
ynos/exynos_drm_gem.c
> index 4787fee4696f8e6f9eecaacb1535765c246688c8..d44401a695e203bd36b3b6678=
fdeb3572a91bfda 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_gem.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_gem.c
> @@ -174,7 +174,7 @@ static struct exynos_drm_gem *exynos_drm_gem_init(str=
uct drm_device *dev,
>                 return ERR_PTR(ret);
>         }
>
> -       DRM_DEV_DEBUG_KMS(dev->dev, "created file object =3D %pK\n", obj-=
>filp);
> +       DRM_DEV_DEBUG_KMS(dev->dev, "created file object =3D %p\n", obj->=
filp);
>
>         return exynos_gem;
>  }
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_ipp.c b/drivers/gpu/drm/ex=
ynos/exynos_drm_ipp.c
> index ea9f66037600e1020da4b0a9c318ca2f2266a871..03c8490af4f45447d123a2077=
7e5362ebd933b46 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_ipp.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_ipp.c
> @@ -271,7 +271,7 @@ static inline struct exynos_drm_ipp_task *
>         task->src.rect.h =3D task->dst.rect.h =3D UINT_MAX;
>         task->transform.rotation =3D DRM_MODE_ROTATE_0;
>
> -       DRM_DEV_DEBUG_DRIVER(task->dev, "Allocated task %pK\n", task);
> +       DRM_DEV_DEBUG_DRIVER(task->dev, "Allocated task %p\n", task);
>
>         return task;
>  }
> @@ -339,7 +339,7 @@ static int exynos_drm_ipp_task_set(struct exynos_drm_=
ipp_task *task,
>         }
>
>         DRM_DEV_DEBUG_DRIVER(task->dev,
> -                            "Got task %pK configuration from userspace\n=
",
> +                            "Got task %p configuration from userspace\n"=
,
>                              task);
>         return 0;
>  }
> @@ -394,7 +394,7 @@ static void exynos_drm_ipp_task_release_buf(struct ex=
ynos_drm_ipp_buffer *buf)
>  static void exynos_drm_ipp_task_free(struct exynos_drm_ipp *ipp,
>                                  struct exynos_drm_ipp_task *task)
>  {
> -       DRM_DEV_DEBUG_DRIVER(task->dev, "Freeing task %pK\n", task);
> +       DRM_DEV_DEBUG_DRIVER(task->dev, "Freeing task %p\n", task);
>
>         exynos_drm_ipp_task_release_buf(&task->src);
>         exynos_drm_ipp_task_release_buf(&task->dst);
> @@ -559,7 +559,7 @@ static int exynos_drm_ipp_check_format(struct exynos_=
drm_ipp_task *task,
>                                             DRM_EXYNOS_IPP_FORMAT_DESTINA=
TION);
>         if (!fmt) {
>                 DRM_DEV_DEBUG_DRIVER(task->dev,
> -                                    "Task %pK: %s format not supported\n=
",
> +                                    "Task %p: %s format not supported\n"=
,
>                                      task, buf =3D=3D src ? "src" : "dst"=
);
>                 return -EINVAL;
>         }
> @@ -609,7 +609,7 @@ static int exynos_drm_ipp_task_check(struct exynos_dr=
m_ipp_task *task)
>         bool rotate =3D (rotation !=3D DRM_MODE_ROTATE_0);
>         bool scale =3D false;
>
> -       DRM_DEV_DEBUG_DRIVER(task->dev, "Checking task %pK\n", task);
> +       DRM_DEV_DEBUG_DRIVER(task->dev, "Checking task %p\n", task);
>
>         if (src->rect.w =3D=3D UINT_MAX)
>                 src->rect.w =3D src->buf.width;
> @@ -625,7 +625,7 @@ static int exynos_drm_ipp_task_check(struct exynos_dr=
m_ipp_task *task)
>             dst->rect.x + dst->rect.w > (dst->buf.width) ||
>             dst->rect.y + dst->rect.h > (dst->buf.height)) {
>                 DRM_DEV_DEBUG_DRIVER(task->dev,
> -                                    "Task %pK: defined area is outside p=
rovided buffers\n",
> +                                    "Task %p: defined area is outside pr=
ovided buffers\n",
>                                      task);
>                 return -EINVAL;
>         }
> @@ -642,7 +642,7 @@ static int exynos_drm_ipp_task_check(struct exynos_dr=
m_ipp_task *task)
>             (!(ipp->capabilities & DRM_EXYNOS_IPP_CAP_SCALE) && scale) ||
>             (!(ipp->capabilities & DRM_EXYNOS_IPP_CAP_CONVERT) &&
>              src->buf.fourcc !=3D dst->buf.fourcc)) {
> -               DRM_DEV_DEBUG_DRIVER(task->dev, "Task %pK: hw capabilitie=
s exceeded\n",
> +               DRM_DEV_DEBUG_DRIVER(task->dev, "Task %p: hw capabilities=
 exceeded\n",
>                                      task);
>                 return -EINVAL;
>         }
> @@ -655,7 +655,7 @@ static int exynos_drm_ipp_task_check(struct exynos_dr=
m_ipp_task *task)
>         if (ret)
>                 return ret;
>
> -       DRM_DEV_DEBUG_DRIVER(ipp->dev, "Task %pK: all checks done.\n",
> +       DRM_DEV_DEBUG_DRIVER(ipp->dev, "Task %p: all checks done.\n",
>                              task);
>
>         return ret;
> @@ -667,25 +667,25 @@ static int exynos_drm_ipp_task_setup_buffers(struct=
 exynos_drm_ipp_task *task,
>         struct exynos_drm_ipp_buffer *src =3D &task->src, *dst =3D &task-=
>dst;
>         int ret =3D 0;
>
> -       DRM_DEV_DEBUG_DRIVER(task->dev, "Setting buffer for task %pK\n",
> +       DRM_DEV_DEBUG_DRIVER(task->dev, "Setting buffer for task %p\n",
>                              task);
>
>         ret =3D exynos_drm_ipp_task_setup_buffer(src, filp);
>         if (ret) {
>                 DRM_DEV_DEBUG_DRIVER(task->dev,
> -                                    "Task %pK: src buffer setup failed\n=
",
> +                                    "Task %p: src buffer setup failed\n"=
,
>                                      task);
>                 return ret;
>         }
>         ret =3D exynos_drm_ipp_task_setup_buffer(dst, filp);
>         if (ret) {
>                 DRM_DEV_DEBUG_DRIVER(task->dev,
> -                                    "Task %pK: dst buffer setup failed\n=
",
> +                                    "Task %p: dst buffer setup failed\n"=
,
>                                      task);
>                 return ret;
>         }
>
> -       DRM_DEV_DEBUG_DRIVER(task->dev, "Task %pK: buffers prepared.\n",
> +       DRM_DEV_DEBUG_DRIVER(task->dev, "Task %p: buffers prepared.\n",
>                              task);
>
>         return ret;
> @@ -764,7 +764,7 @@ void exynos_drm_ipp_task_done(struct exynos_drm_ipp_t=
ask *task, int ret)
>         struct exynos_drm_ipp *ipp =3D task->ipp;
>         unsigned long flags;
>
> -       DRM_DEV_DEBUG_DRIVER(task->dev, "ipp: %d, task %pK done: %d\n",
> +       DRM_DEV_DEBUG_DRIVER(task->dev, "ipp: %d, task %p done: %d\n",
>                              ipp->id, task, ret);
>
>         spin_lock_irqsave(&ipp->lock, flags);
> @@ -807,7 +807,7 @@ static void exynos_drm_ipp_next_task(struct exynos_dr=
m_ipp *ipp)
>         spin_unlock_irqrestore(&ipp->lock, flags);
>
>         DRM_DEV_DEBUG_DRIVER(ipp->dev,
> -                            "ipp: %d, selected task %pK to run\n", ipp->=
id,
> +                            "ipp: %d, selected task %p to run\n", ipp->i=
d,
>                              task);
>
>         ret =3D ipp->funcs->commit(ipp, task);
> @@ -917,14 +917,14 @@ int exynos_drm_ipp_commit_ioctl(struct drm_device *=
dev, void *data,
>          */
>         if (arg->flags & DRM_EXYNOS_IPP_FLAG_NONBLOCK) {
>                 DRM_DEV_DEBUG_DRIVER(ipp->dev,
> -                                    "ipp: %d, nonblocking processing tas=
k %pK\n",
> +                                    "ipp: %d, nonblocking processing tas=
k %p\n",
>                                      ipp->id, task);
>
>                 task->flags |=3D DRM_EXYNOS_IPP_TASK_ASYNC;
>                 exynos_drm_ipp_schedule_task(task->ipp, task);
>                 ret =3D 0;
>         } else {
> -               DRM_DEV_DEBUG_DRIVER(ipp->dev, "ipp: %d, processing task =
%pK\n",
> +               DRM_DEV_DEBUG_DRIVER(ipp->dev, "ipp: %d, processing task =
%p\n",
>                                      ipp->id, task);
>                 exynos_drm_ipp_schedule_task(ipp, task);
>                 ret =3D wait_event_interruptible(ipp->done_wq,
>
> --
> 2.49.0
>
>

