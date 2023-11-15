Return-Path: <linux-arm-msm+bounces-711-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 295067EC6B9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Nov 2023 16:08:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D85A32814DA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Nov 2023 15:08:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B07C71EB45;
	Wed, 15 Nov 2023 15:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iD7dcYUa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 537AF2EAF3
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Nov 2023 15:07:55 +0000 (UTC)
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07A97A6
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Nov 2023 07:07:54 -0800 (PST)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-5afbdbf3a19so78598677b3.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Nov 2023 07:07:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700060873; x=1700665673; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dAkdFR38VbZr+retwYJvC4pXK2CLkuRAU6TUrfj2Y/Q=;
        b=iD7dcYUa4VoSX4q9U3C7wFBJ8aDP6XbFtaho/fSFilRoBmPmqMUv0xSD6ZZ2ALQwd1
         vsDu6RAX3/Y4x3rqrUVnkymENzRx9WW1tCjl6YoiC1gH/7yBpuJoPtrFy/hwto8WYBq+
         FymlqAg2ThYH+3bYP+WGHeOEXN4odM0QSNIUVBV95BQ7wIjbD84k8tlFdDpLq8R1xfFm
         VeEWsVaKqMKLYAmFmg4z9ACV4jQUgo5DwriJ16vXA09q+q2EZVrdzGCLdIFL+YmgyqvJ
         e9tZ/n35dPy0fnipGS4pQr2PuBRwugp4U+9T0zF4+pHyKJA0LyxgRqFTQzvrjnygKPiH
         5wEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700060873; x=1700665673;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dAkdFR38VbZr+retwYJvC4pXK2CLkuRAU6TUrfj2Y/Q=;
        b=KQNq5jZc7b6uB5vr9Q+ShUOzVFoUPDJzGHKVwuTd1XpJzBZ0tWVFqHIav9i+FiajdZ
         k4GHapm3y0yoKg0D9JuywFv9996NQSszxmyAMcf8+pKyGbl18WO1m76rXQ8bd7FOfH1+
         xQL5rshQbxWAAh1wcuQGWmbSWZSbbDS2jN5CvJkIY2utkFOiFmc28lD0z58PuTgAJ9KZ
         gcyeKj2nVBtPuUdDeMZ2+PA3GdgT1LBLxGEeMvSifoZAyDwHDr6wQMpAdmmyV1IS+eM1
         RK3KwWr24ghet8bmXW6o2gwDkDBnOpjUnTkunHtrUeQM5ShAxjMAzL4peyemFm2KM09D
         zFZQ==
X-Gm-Message-State: AOJu0YziSTQWLBsz5qeOOqexmQP6lLeR0HMQr9x3mINRDsC40wily7xH
	eb6ISc0NUh/1H5s/SqLOR1K4dbrD3TMpTPf17oSqKdstjXNHJ9JW
X-Google-Smtp-Source: AGHT+IFWMAAPr69IJZOrpc5SNuEM+oacpGbG5vuVdTWdzsr6zLBxZ1vBt7gGnTY8n6wgmwhM4whO4LzzuHfj/jYhdaU=
X-Received: by 2002:a0d:cb0f:0:b0:5a7:dbd1:4889 with SMTP id
 n15-20020a0dcb0f000000b005a7dbd14889mr15802748ywd.2.1700060873202; Wed, 15
 Nov 2023 07:07:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231115141928.429688-1-dipamt1729@gmail.com>
In-Reply-To: <20231115141928.429688-1-dipamt1729@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 15 Nov 2023 17:07:41 +0200
Message-ID: <CAA8EJprqnUGQxmj4Y=qttVuj0zJxdD9B6neHa6sPseLLETpk5A@mail.gmail.com>
Subject: Re: [PATCH v2] Remove custom dumb_map_offset implementation in msm driver
To: Dipam Turkar <dipamt1729@gmail.com>
Cc: robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run, 
	marijn.suijten@somainline.org, airlied@gmail.com, daniel@ffwll.ch, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 15 Nov 2023 at 16:30, Dipam Turkar <dipamt1729@gmail.com> wrote:
>
> Make msm use drm_gem_create_map_offset() instead of its custom
> implementation for associating GEM object with a fake offset. Since,
> we already have this generic implementation, we don't need the custom
> implementation and it is better to standardize the code for GEM based
> drivers. This also removes the outdated locking leftovers.

Why are they outdated?

>
> Signed-off-by: Dipam Turkar <dipamt1729@gmail.com>
> ---
>  drivers/gpu/drm/msm/msm_drv.c |  2 +-
>  drivers/gpu/drm/msm/msm_gem.c | 21 ---------------------
>  drivers/gpu/drm/msm/msm_gem.h |  2 --
>  3 files changed, 1 insertion(+), 24 deletions(-)
>
> Changes in v2:
> Modify commit message to include the absence of internal locking leftovers
> around allocating a fake offset in msm_gem_mmap_offset() in the generic
> implementation drm_gem_create_map_offset().
>
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index a428951ee539..86a15992c717 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -1085,7 +1085,7 @@ static const struct drm_driver msm_driver = {
>         .open               = msm_open,
>         .postclose          = msm_postclose,
>         .dumb_create        = msm_gem_dumb_create,
> -       .dumb_map_offset    = msm_gem_dumb_map_offset,
> +       .dumb_map_offset    = drm_gem_dumb_map_offset,
>         .gem_prime_import_sg_table = msm_gem_prime_import_sg_table,
>  #ifdef CONFIG_DEBUG_FS
>         .debugfs_init       = msm_debugfs_init,
> diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
> index db1e748daa75..489694ef79cb 100644
> --- a/drivers/gpu/drm/msm/msm_gem.c
> +++ b/drivers/gpu/drm/msm/msm_gem.c
> @@ -671,27 +671,6 @@ int msm_gem_dumb_create(struct drm_file *file, struct drm_device *dev,
>                         MSM_BO_SCANOUT | MSM_BO_WC, &args->handle, "dumb");
>  }
>
> -int msm_gem_dumb_map_offset(struct drm_file *file, struct drm_device *dev,
> -               uint32_t handle, uint64_t *offset)
> -{
> -       struct drm_gem_object *obj;
> -       int ret = 0;
> -
> -       /* GEM does all our handle to object mapping */
> -       obj = drm_gem_object_lookup(file, handle);
> -       if (obj == NULL) {
> -               ret = -ENOENT;
> -               goto fail;
> -       }
> -
> -       *offset = msm_gem_mmap_offset(obj);
> -
> -       drm_gem_object_put(obj);
> -
> -fail:
> -       return ret;
> -}
> -
>  static void *get_vaddr(struct drm_gem_object *obj, unsigned madv)
>  {
>         struct msm_gem_object *msm_obj = to_msm_bo(obj);
> diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
> index 8ddef5443140..dc74a0ef865d 100644
> --- a/drivers/gpu/drm/msm/msm_gem.h
> +++ b/drivers/gpu/drm/msm/msm_gem.h
> @@ -139,8 +139,6 @@ struct page **msm_gem_pin_pages(struct drm_gem_object *obj);
>  void msm_gem_unpin_pages(struct drm_gem_object *obj);
>  int msm_gem_dumb_create(struct drm_file *file, struct drm_device *dev,
>                 struct drm_mode_create_dumb *args);
> -int msm_gem_dumb_map_offset(struct drm_file *file, struct drm_device *dev,
> -               uint32_t handle, uint64_t *offset);
>  void *msm_gem_get_vaddr_locked(struct drm_gem_object *obj);
>  void *msm_gem_get_vaddr(struct drm_gem_object *obj);
>  void *msm_gem_get_vaddr_active(struct drm_gem_object *obj);
> --
> 2.34.1
>


-- 
With best wishes
Dmitry

