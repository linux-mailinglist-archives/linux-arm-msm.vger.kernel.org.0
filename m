Return-Path: <linux-arm-msm+bounces-633-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EBED07EB173
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Nov 2023 15:04:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 28F361C209A3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Nov 2023 14:04:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AC6B405DA;
	Tue, 14 Nov 2023 14:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gzd18ipl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC48405C2
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Nov 2023 14:04:36 +0000 (UTC)
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A745010D
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Nov 2023 06:04:34 -0800 (PST)
Received: by mail-oi1-x230.google.com with SMTP id 5614622812f47-3b56b618217so3313497b6e.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Nov 2023 06:04:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699970674; x=1700575474; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1qlOleY1sx1uSAUuif2xWluY3/a1BG3eRXZXp2fHeOw=;
        b=gzd18iplZHOjFkQftALid287EoKpfasga65qReV8V01JhMJ+ucrwgeSP9TJhOnlJg5
         FLw6XhO1oj8CKwWX8vX5n79A329xOwCv5I9XcEOOEyXvqMOR8gm8LGsjAXRgptERokUj
         QDfjYnLi/4OgWlVuRJ++p+ZkuadD+zD50cCTPPjL5V0kfmxNhvdt5AEk1QHAfbDvv11A
         OZ64N5xmiAUVtkL3HWnaokkvdqKuyIyX5zBpvtqDz8KbZwFo98DZSyXbMJWlx+Hf1oZi
         HPQkr3aoA6z45h1bmtgTgtf07t3Y+jtW+fjqur+K7tG1vMxJg8lP9RGN4LmnUZZkgtgg
         707Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699970674; x=1700575474;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1qlOleY1sx1uSAUuif2xWluY3/a1BG3eRXZXp2fHeOw=;
        b=qMwRY/7bjViY3orjvBq9X1joPDY6QNITUl8A2Z/WaXPBs1iGMqtZft85+n06L2fLkb
         r99NM6P349dejIWCg3tpyZfQh634l8TQRrFYVOHu8MtFyxbYkQH6TiqrI32arWQW64bN
         QM6kRASQ7AXDUtooS9oFRLkk4ra26A6yceluwtpVFPHOWmUSekZ0X7g6tx2sXdnCCleA
         u+frrGUDBltCODTX2W8xTw9ZVzrgh7+h1waZwV4LN9ABSclHEObIev38bvodRmJQV0Fx
         kSPwabhApS5l/LiIMCJWXaZdkK7QxcVZgcdgs4wruEcxzfIuuO9+zdi2sSLynlbyLVnL
         zitg==
X-Gm-Message-State: AOJu0Yx6wApyUVGYEmLSEMz4RfD5Ja/0m52qB74JKqY8Gbrmfc4MhmU3
	yWjG1Ysc0qls4EEmeqhC3lQ7kSrKTwvD9HG9yC4hlQ==
X-Google-Smtp-Source: AGHT+IEqrRkM174mwSoofUNLHBqExjN+6X2fwSMYZl0oH5qHedom76o2Xwq0biyqfX70tQoLsWSZbg0vBTSDPJqoYek=
X-Received: by 2002:a05:6808:320b:b0:3b5:9965:2bc2 with SMTP id
 cb11-20020a056808320b00b003b599652bc2mr13206804oib.23.1699970673856; Tue, 14
 Nov 2023 06:04:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231114132713.403443-1-dipamt1729@gmail.com>
In-Reply-To: <20231114132713.403443-1-dipamt1729@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 14 Nov 2023 16:04:22 +0200
Message-ID: <CAA8EJpo+38OVfnmyE0zqDkVOss5GfPbR52FuObTxswCbtYtkig@mail.gmail.com>
Subject: Re: [PATCH] Remove custom dumb_map_offset implementation in msm driver
To: Dipam Turkar <dipamt1729@gmail.com>
Cc: robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run, 
	marijn.suijten@somainline.org, airlied@gmail.com, daniel@ffwll.ch, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 14 Nov 2023 at 15:28, Dipam Turkar <dipamt1729@gmail.com> wrote:
>
> Make msm use drm_gem_create_map_offset() instead of its custom
> implementation for associating GEM object with a fake offset. Since,
> we already have this generic implementation, we don't need the custom
> implementation and it is better to standardize the code for GEM based drivers.
>
> Signed-off-by: Dipam Turkar <dipamt1729@gmail.com>
> ---
>  drivers/gpu/drm/msm/msm_drv.c |  2 +-
>  drivers/gpu/drm/msm/msm_gem.c | 21 ---------------------
>  drivers/gpu/drm/msm/msm_gem.h |  2 --
>  3 files changed, 1 insertion(+), 24 deletions(-)
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

msm_gem_mmap_offset internally has locking around
drm_gem_create_mmap_offset() / drm_vma_node_offset_addr() calls, while
 drm_gem_dumb_map_offset() does not. Thus this patch does more than is
stated in the commit message.

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

