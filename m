Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 303473F78A2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Aug 2021 17:33:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241180AbhHYPeH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Aug 2021 11:34:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241567AbhHYPeG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Aug 2021 11:34:06 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A17BCC061757
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Aug 2021 08:33:20 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id u9so2156061wrg.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Aug 2021 08:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=P8P1YSzuu5vQY8TAxZQvRED9ADCllOt0xeyKWK3K/2c=;
        b=pVy1BCgxxbH8KXZ+5MHAgbXy4BjxMsuRH/fRr6GpbNQsPwJFxCGFYlRkgrzdmNvSOL
         QUC11n8EanrHJ2S2vjWKyJORViXeXJcbD4voXKCja3dcktV9jvl+4mJcOyMsb5oC9xpX
         IW02GRodGpgkmn05ulGJvkGLQNU/joJrzDvgElIXIHT4f4ILTnaT1sJ98tFV0rrPsBYU
         aNfCLHHdmptoV1pqAC8jrZAD3MZvxwxWD+8ww2qciJQAChv7In288Z9zKaHYqKB9yQTz
         uNqKNs2R/fgREiEQdEXnmULyP0stHlQFVAIoxWtT64hmMRmXRO+Ws1XJwy+Yj+cVZYCz
         BEQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=P8P1YSzuu5vQY8TAxZQvRED9ADCllOt0xeyKWK3K/2c=;
        b=Q0j0DPk+aWPaIFer1HW9TQbfcz9rdAyKmL16OHBzn+cj6Zqf6m6gDeiPp21WzgG8eH
         eQwpNtaf4kGRQ3x88uaBsrIMxwKQivJh7+2AlO3+BUbR/kpmFnUlca5Po+7BjNq+8I+n
         pNUlbi1KJxT96rpLUSlaQtOihl0K0b2/Y4i1IdGo16X2kE1sTxSMmo1sb8FAz+yETZk2
         orWgGLzQ3eHSaUMe2yDHqUERhLBddUQX3QekBL8Kx01EH+BkSExMypRO9kvu1sPeKTZc
         TGLX6D2S/MfM6gDCZqMOA9KMZqQBqHXSPKnz8ABETs0QrN6J6q481+QQ9MrdPAlsiBE+
         gVWw==
X-Gm-Message-State: AOAM531v8pToVCq2HCmczCq6xJR4MNsH+mful2XOLbOVnrWtPFse2IQU
        jJ59hF9j8c6xSkA1Y7HSdJnyzfRfE8aoP79nf3E=
X-Google-Smtp-Source: ABdhPJx70/62TVjHqPs+jMq+vcvgW+aWjb78G+uZ58A4D2TFdiQdjPWBkJajaHTqmjnWdEkO2zLOTuupjW7u+YDOEiI=
X-Received: by 2002:a5d:460a:: with SMTP id t10mr21167746wrq.147.1629905599169;
 Wed, 25 Aug 2021 08:33:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210824224932.564352-1-robdclark@gmail.com> <20210824224932.564352-3-robdclark@gmail.com>
 <YSYDsJXPPZgTMYzR@platvala-desk.ger.corp.intel.com>
In-Reply-To: <YSYDsJXPPZgTMYzR@platvala-desk.ger.corp.intel.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Wed, 25 Aug 2021 08:37:39 -0700
Message-ID: <CAF6AEGtMwFOoTJW_zadN0d9v8+KCaS4PxKyEt485SXV7xU6uhA@mail.gmail.com>
Subject: Re: [igt-dev] [PATCH igt 2/3] msm: Add helper library
To:     Petri Latvala <petri.latvala@intel.com>
Cc:     igt-dev@lists.freedesktop.org,
        freedreno <freedreno@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Aug 25, 2021 at 1:44 AM Petri Latvala <petri.latvala@intel.com> wro=
te:
>
> On Tue, Aug 24, 2021 at 03:49:31PM -0700, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Handle some of the boilerplate for tests.
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >  lib/igt_msm.c   | 163 ++++++++++++++++++++++++++++++++++++++++++++++++
> >  lib/igt_msm.h   | 128 +++++++++++++++++++++++++++++++++++++
> >  lib/meson.build |   1 +
> >  3 files changed, 292 insertions(+)
> >  create mode 100644 lib/igt_msm.c
> >  create mode 100644 lib/igt_msm.h
> >
> > diff --git a/lib/igt_msm.c b/lib/igt_msm.c
> > new file mode 100644
> > index 00000000..1bcb08d9
> > --- /dev/null
> > +++ b/lib/igt_msm.c
> > @@ -0,0 +1,163 @@
> > +/*
> > + * Copyright =C2=A9 2021 Google, Inc.
> > + *
> > + * Permission is hereby granted, free of charge, to any person obtaini=
ng a
> > + * copy of this software and associated documentation files (the "Soft=
ware"),
> > + * to deal in the Software without restriction, including without limi=
tation
> > + * the rights to use, copy, modify, merge, publish, distribute, sublic=
ense,
> > + * and/or sell copies of the Software, and to permit persons to whom t=
he
> > + * Software is furnished to do so, subject to the following conditions=
:
> > + *
> > + * The above copyright notice and this permission notice (including th=
e next
> > + * paragraph) shall be included in all copies or substantial portions =
of the
> > + * Software.
> > + *
> > + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXP=
RESS OR
> > + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABI=
LITY,
> > + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT =
SHALL
> > + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES O=
R OTHER
> > + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARI=
SING
> > + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER=
 DEALINGS
> > + * IN THE SOFTWARE.
> > + */
> > +
> > +#include <assert.h>
> > +#include <string.h>
> > +#include <signal.h>
> > +#include <errno.h>
> > +#include <sys/mman.h>
> > +#include <sys/types.h>
> > +#include <sys/stat.h>
> > +#include <sys/ioctl.h>
> > +#include <fcntl.h>
> > +
> > +#include "drmtest.h"
> > +#include "igt_aux.h"
> > +#include "igt_core.h"
> > +#include "igt_msm.h"
> > +#include "ioctl_wrappers.h"
> > +
> > +/**
> > + * SECTION:igt_msm
> > + * @short_description: msm support library
> > + * @title: msm
> > + * @include: igt_msm.h
> > + *
> > + * This library provides various auxiliary helper functions for writin=
g msm
> > + * tests.
> > + */
> > +
> > +struct msm_device *
> > +igt_msm_dev_open(void)
> > +{
> > +     struct msm_device *dev =3D calloc(1, sizeof(*dev));
> > +
> > +     dev->fd =3D drm_open_driver_render(DRIVER_MSM);
> > +     if (dev->fd < 0) {
> > +             free(dev);
> > +             return NULL;
> > +     }
> > +
> > +     return dev;
> > +}
> > +
> > +void
> > +igt_msm_dev_close(struct msm_device *dev)
> > +{
> > +     close(dev->fd);
> > +     free(dev);
> > +}
> > +
> > +struct msm_bo *
> > +igt_msm_bo_new(struct msm_device *dev, size_t size, uint32_t flags)
> > +{
> > +     struct msm_bo *bo =3D calloc(1, sizeof(*bo));
> > +
> > +     struct drm_msm_gem_new req =3D {
> > +                     .size =3D size,
> > +                     .flags =3D flags,
> > +     };
> > +
> > +     bo->dev =3D dev;
> > +     bo->size =3D size;
> > +
> > +     do_ioctl(dev->fd, DRM_IOCTL_MSM_GEM_NEW, &req);
> > +
> > +     bo->handle =3D req.handle;
> > +
> > +     return bo;
> > +}
> > +
> > +void
> > +igt_msm_bo_free(struct msm_bo *bo)
> > +{
> > +     if (bo->map)
> > +             munmap(bo->map, bo->size);
> > +     gem_close(bo->dev->fd, bo->handle);
> > +     free(bo);
> > +}
> > +
> > +void *
> > +igt_msm_bo_map(struct msm_bo *bo)
> > +{
> > +     if (!bo->map) {
> > +             struct drm_msm_gem_info req =3D {
> > +                             .handle =3D bo->handle,
> > +                             .info =3D MSM_INFO_GET_OFFSET,
> > +             };
> > +             void *ptr;
> > +
> > +             do_ioctl(bo->dev->fd, DRM_IOCTL_MSM_GEM_INFO, &req);
> > +
> > +             ptr =3D mmap(0, bo->size, PROT_READ | PROT_WRITE, MAP_SHA=
RED,
> > +                             bo->dev->fd, req.value);
> > +             if (ptr =3D=3D MAP_FAILED)
> > +                     return NULL;
> > +
> > +             bo->map =3D ptr;
> > +     }
> > +     return bo->map;
> > +}
> > +
> > +struct msm_pipe *
> > +igt_msm_pipe_open(struct msm_device *dev, uint32_t prio)
> > +{
> > +     struct msm_pipe *pipe =3D calloc(1, sizeof(*pipe));
> > +     struct drm_msm_submitqueue req =3D {
> > +                     .flags =3D 0,
> > +                     .prio =3D prio,
> > +     };
> > +
> > +     pipe->dev =3D dev;
> > +     pipe->pipe =3D MSM_PIPE_3D0;
> > +
> > +     /* Note that kerenels prior to v4.15 did not support submitqueues=
.
> > +      * Mesa maintains support for older kernels, but I do not think
> > +      * that IGT needs to.
> > +      */
> > +     do_ioctl(dev->fd, DRM_IOCTL_MSM_SUBMITQUEUE_NEW, &req);
> > +
> > +     pipe->submitqueue_id =3D req.id;
> > +
> > +     return pipe;
> > +}
> > +
> > +void
> > +igt_msm_pipe_close(struct msm_pipe *pipe)
> > +{
> > +     do_ioctl(pipe->dev->fd, DRM_IOCTL_MSM_SUBMITQUEUE_CLOSE, &pipe->s=
ubmitqueue_id);
> > +     free(pipe);
> > +}
> > +
> > +uint64_t
> > +igt_msm_pipe_get_param(struct msm_pipe *pipe, uint32_t param)
> > +{
> > +     struct drm_msm_param req =3D {
> > +                     .pipe =3D pipe->pipe,
> > +                     .param =3D param,
> > +     };
> > +
> > +     do_ioctl(pipe->dev->fd, DRM_IOCTL_MSM_GET_PARAM, &req);
> > +
> > +     return req.value;
> > +}
> > diff --git a/lib/igt_msm.h b/lib/igt_msm.h
> > new file mode 100644
> > index 00000000..0d302e18
> > --- /dev/null
> > +++ b/lib/igt_msm.h
> > @@ -0,0 +1,128 @@
> > +/*
> > + * Copyright =C2=A9 2021 Google, Inc.
> > + *
> > + * Permission is hereby granted, free of charge, to any person obtaini=
ng a
> > + * copy of this software and associated documentation files (the "Soft=
ware"),
> > + * to deal in the Software without restriction, including without limi=
tation
> > + * the rights to use, copy, modify, merge, publish, distribute, sublic=
ense,
> > + * and/or sell copies of the Software, and to permit persons to whom t=
he
> > + * Software is furnished to do so, subject to the following conditions=
:
> > + *
> > + * The above copyright notice and this permission notice (including th=
e next
> > + * paragraph) shall be included in all copies or substantial portions =
of the
> > + * Software.
> > + *
> > + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXP=
RESS OR
> > + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABI=
LITY,
> > + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT =
SHALL
> > + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES O=
R OTHER
> > + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARI=
SING
> > + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER=
 DEALINGS
> > + * IN THE SOFTWARE.
> > + */
> > +
> > +#ifndef IGT_MSM_H
> > +#define IGT_MSM_H
> > +
> > +#include "msm_drm.h"
> > +
> > +struct msm_device {
> > +     int fd;
> > +};
>
> Why do you need this wrapper struct?

It isn't adding a lot of value yet, and I was a bit on the fence about
whether to include it.. but based on my experience on the mesa side of
things, I could see ways that it becomes useful.  For example if we
needed to add refcnt'ing so the drm fd is closed when the last user is
done (multi-threaded tests?).  Or if we want to centralize collection
of GPU info/configuration, rather than duplicating in individual
tests.

In the end, it doesn't add/remove any lines of code from the tests,
but it would be churn to retrofit it later.  So I kept it.

BR,
-R
