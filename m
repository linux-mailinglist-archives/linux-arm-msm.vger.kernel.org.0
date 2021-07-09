Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90C0C3C214E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jul 2021 11:15:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231494AbhGIJSg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Jul 2021 05:18:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229559AbhGIJSg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Jul 2021 05:18:36 -0400
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57B10C0613DD
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jul 2021 02:15:52 -0700 (PDT)
Received: by mail-oi1-x236.google.com with SMTP id w74so11444905oiw.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jul 2021 02:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=jaix3U7G/PB87Ay07enXH/OSVYtCPLdi40u5BPIOv1s=;
        b=TwhB3mut8U7oIcVxsmZ6E535sHZwGLthPxsFmOOVY+1LchLYvrr58HnWTpEwBqLMZu
         zcADVGUGUSehj1h9D6GEHNW6QzTlHjuAQc5K2jQ8zGImBrn1Y3qZD5irpgvPo9f9ZD9F
         9yoeEfsfKgt0ewtqZ1Nndga3l/2KHdcTQRf1E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=jaix3U7G/PB87Ay07enXH/OSVYtCPLdi40u5BPIOv1s=;
        b=pNd6fmEoodAuBl4wZRAEuLshzz0JNI0NNDNpT3NXA9nvVA9Sem8WkH5yXMIxNLxUAl
         5n10sSEwF06IPRHfR8sCcsePrp48LXjHdCSQVkL7QC92HANj4dx26v2BbR4tUVDKRLSo
         0pgd6a9aYye8+XP8jfs/3GCRqWqYbxy6W4KJqvSWl9OveTEUbOQPjPVOVuw3EvD4PBb0
         0aZnbAidBS1lPBx39N3gurcnZP+gpaSSVi/iiJ8mvPWGvPAw7d02nUEBnkwzeRSIwFA3
         6lv2S9QQNPv7xVXgkKzg5lo33y3I4WVA+a0hkPzuOi1XWaGLSOYUFUB8wu+DuQxGeZPi
         67DQ==
X-Gm-Message-State: AOAM530G8JdcYHPbYLUCmcwrEgr9jJ1G8fTOZflREnOR6dOlltkOMcl+
        CE4oxxEYXUKGdyYNrpd2M4JV1T85oy45dk0TX/nRMw==
X-Google-Smtp-Source: ABdhPJzdY5JqorO3ZHqZxNzPMPfbxu3TUa15r/b5G4RPJXaiHeVYNoRHYk7zvU/nMnz2sOTggwkJa6qMTzOHwoVFhfY=
X-Received: by 2002:aca:eb43:: with SMTP id j64mr7192215oih.101.1625822151219;
 Fri, 09 Jul 2021 02:15:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210708173754.3877540-1-daniel.vetter@ffwll.ch>
 <20210708173754.3877540-17-daniel.vetter@ffwll.ch> <2582129c-b0c3-831c-a3b4-caa51be95095@gmail.com>
In-Reply-To: <2582129c-b0c3-831c-a3b4-caa51be95095@gmail.com>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Fri, 9 Jul 2021 11:15:40 +0200
Message-ID: <CAKMK7uGGv+6B9642XX1WordAkan7XbMyGCumaJGsQYxb+qQWfQ@mail.gmail.com>
Subject: Re: [PATCH v3 16/20] drm/msm: always wait for the exclusive fence
To:     =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jul 9, 2021 at 10:48 AM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
> Am 08.07.21 um 19:37 schrieb Daniel Vetter:
> > From: Christian K=C3=B6nig <ckoenig.leichtzumerken@gmail.com>
> >
> > Drivers also need to to sync to the exclusive fence when
> > a shared one is present.
> >
> > Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> > [danvet: Not that hard to compile-test on arm ...]
> > Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Cc: Rob Clark <robdclark@gmail.com>
> > Cc: Sean Paul <sean@poorly.run>
> > Cc: linux-arm-msm@vger.kernel.org
> > Cc: freedreno@lists.freedesktop.org
>
> Wondering a bit why you have that in this patch set now.
>
> But any objections that we push this now?

Cover letter of the first one version explained that I just wanted to
have all the msm fixes in this series, for completeness. But yeah I
thought I put an r-b on your series for this? There was one patch
where I was unhappy with the docs, but there's a new patch for that
now here.
-Daniel

> Thanks,
> Christian.
>
> > ---
> >   drivers/gpu/drm/msm/msm_gem.c | 16 +++++++---------
> >   1 file changed, 7 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_ge=
m.c
> > index 141178754231..d9c4f1deeafb 100644
> > --- a/drivers/gpu/drm/msm/msm_gem.c
> > +++ b/drivers/gpu/drm/msm/msm_gem.c
> > @@ -812,17 +812,15 @@ int msm_gem_sync_object(struct drm_gem_object *ob=
j,
> >       struct dma_fence *fence;
> >       int i, ret;
> >
> > -     fobj =3D dma_resv_shared_list(obj->resv);
> > -     if (!fobj || (fobj->shared_count =3D=3D 0)) {
> > -             fence =3D dma_resv_excl_fence(obj->resv);
> > -             /* don't need to wait on our own fences, since ring is fi=
fo */
> > -             if (fence && (fence->context !=3D fctx->context)) {
> > -                     ret =3D dma_fence_wait(fence, true);
> > -                     if (ret)
> > -                             return ret;
> > -             }
> > +     fence =3D dma_resv_excl_fence(obj->resv);
> > +     /* don't need to wait on our own fences, since ring is fifo */
> > +     if (fence && (fence->context !=3D fctx->context)) {
> > +             ret =3D dma_fence_wait(fence, true);
> > +             if (ret)
> > +                     return ret;
> >       }
> >
> > +     fobj =3D dma_resv_shared_list(obj->resv);
> >       if (!exclusive || !fobj)
> >               return 0;
> >
>


--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
