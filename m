Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 58282538522
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 May 2022 17:42:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238486AbiE3PmH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 May 2022 11:42:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238075AbiE3Pl6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 May 2022 11:41:58 -0400
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4620420E51A
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 May 2022 07:49:09 -0700 (PDT)
Received: by mail-ot1-x334.google.com with SMTP id w19-20020a9d6393000000b0060aeb359ca8so7806588otk.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 May 2022 07:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=iv6q3LidYytSwCN/ALHOtkUt2FKmJyYR93IrSjotVpM=;
        b=dCZPGrN3RWg/tJ6hicikuXELwaN5c205mDvYffKYrM6W55QJA7U1Y68tsL/sNKjSTy
         73WwWmwAuAPW1KXjRW96BKWFW6lQr65A01WLJAAnH5ISRWiIvvcD2oVLsKS584UxrH10
         wkqaXYdsRWvrLVtkDlJLw5tVi1Uzwn9oK3fX8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=iv6q3LidYytSwCN/ALHOtkUt2FKmJyYR93IrSjotVpM=;
        b=j8FlwHQOpUNl+2twNRJC6m6IWraoMq6J50YQKamYTMPtkz370z7iZByng3ANzfQtgk
         ulXrwyWbwDJEsDo0RxDMK596BQVommnscaUqXxFTry+9N+tJTefeK/k3ImsA3m7/SdrO
         3Uv4EkO2i7irAP4o3OS/ppx9bEBp5i6r45zv5D9VIRZr7TzgPvJ0DXgtnp3499sB79fK
         KVIPEIQadRFrb1OTl4/Q9B81UL+ZCLOy+k+zaefLT9SoHEhjKwjIzgZRhxcSlWVx2M12
         c5LsTIp1rF6Vq9bk7Fpe+7RZZrdvUsrRAJ7QmCYGoG3NBhg+ga6QNXBGKyDjkm1pLKfK
         0uTg==
X-Gm-Message-State: AOAM532MqKBCipaB98S286WLj/4T89q8ubneafC3/HDcsBc7+wKkDQBf
        37E/dAq0khfnVbgKUExEqwHv+Nhz+I4rHpF/wfav+Q==
X-Google-Smtp-Source: ABdhPJxH/w0/fEIyo4iSAvCJP5G9SzBVn29Gs7W4gFY9Llz4Puz+PT0eo0OTLjxlDZJKSTiFvE6j1Qjj7oKIkoxTRaU=
X-Received: by 2002:a05:6830:1e72:b0:60b:3707:c374 with SMTP id
 m18-20020a0568301e7200b0060b3707c374mr9307405otr.321.1653922147338; Mon, 30
 May 2022 07:49:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220529162936.2539901-1-robdclark@gmail.com> <0bf230f4-c888-b9c9-f061-7450406baa4a@suse.de>
 <CAF6AEGthAfWyAvbuE4EP+u52LEKS2Fs6X=gG8qUjc7gci6oh-A@mail.gmail.com>
In-Reply-To: <CAF6AEGthAfWyAvbuE4EP+u52LEKS2Fs6X=gG8qUjc7gci6oh-A@mail.gmail.com>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Mon, 30 May 2022 16:48:56 +0200
Message-ID: <CAKMK7uG9=EcmD4hPqm4zYsDHiS9Mr=y_5tUa_R1veDxSSK-P-Q@mail.gmail.com>
Subject: Re: [PATCH] drm/prime: Ensure mmap offset is initialized
To:     Rob Clark <robdclark@gmail.com>
Cc:     Thomas Zimmermann <tzimmermann@suse.de>,
        Rob Clark <robdclark@chromium.org>,
        David Airlie <airlied@linux.ie>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Gerd Hoffmann <kraxel@redhat.com>,
        freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 30 May 2022 at 15:54, Rob Clark <robdclark@gmail.com> wrote:
>
> On Mon, May 30, 2022 at 12:26 AM Thomas Zimmermann <tzimmermann@suse.de> =
wrote:
> >
> > Hi
> >
> > Am 29.05.22 um 18:29 schrieb Rob Clark:
> > > From: Rob Clark <robdclark@chromium.org>
> > >
> > > If a GEM object is allocated, and then exported as a dma-buf fd which=
 is
> > > mmap'd before or without the GEM buffer being directly mmap'd, the
> > > vma_node could be unitialized.  This leads to a situation where the C=
PU
> > > mapping is not correctly torn down in drm_vma_node_unmap().
> >
> > Which drivers are affected by this problem?
> >
> > I checked several drivers and most appear to be initializing the offset
> > during object construction, such as GEM SHMEM. [1] TTM-based drivers
> > also seem unaffected. [2]
> >
> >  From a quick grep, only etnaviv, msm and omapdrm appear to be affected=
?
> > They only seem to run drm_gem_create_mmap_offset() from their
> > ioctl-handling code.
> >
> > If so, I'd say it's preferable to fix these drivers and put a
> > drm_WARN_ONCE() into drm_gem_prime_mmap().
>
> That is good if fewer drivers are affected, however I disagree with
> your proposal.  At least for freedreno userspace, a lot of bo's never
> get mmap'd (either directly of via dmabuf), so we should not be
> allocating a mmap offset unnecessarily.

Does this actually matter in the grand scheme of things? We originally
allocated mmap offset only on demand because userspace only had 32bit
loff_t support and so simply couldn't mmap anything if the offset
ended up above 32bit (even if there was still va space available).

But those days are long gone (about 10 years or so) and the allocation
overhead for an mmap offset is tiny. So I think unless you can
benchmark an impact allocating it at bo alloc seems like the simplest
design overall, and hence what we should be doing. And if the vma
offset allocation every gets too slow due to fragmentation we can lift
the hole tree from i915 into drm_mm and the job should be done. At
that point we could also allocate the offset unconditionally in the
gem_init function and be done with it.

Iow I concur with Thomas here, unless there's hard data contrary
simplicity imo trumps here.
-Daniel

>
> BR,
> -R
>
> > Best regards
> > Thomas
> >
> > [1]
> > https://elixir.bootlin.com/linux/v5.18/source/drivers/gpu/drm/drm_gem_s=
hmem_helper.c#L85
> > [2]
> > https://elixir.bootlin.com/linux/v5.18/source/drivers/gpu/drm/ttm/ttm_b=
o.c#L1002
> >
> > >
> > > Fixes: e5516553999f ("drm: call drm_gem_object_funcs.mmap with fake o=
ffset")
> > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > ---
> > > Note, it's possible the issue existed in some related form prior to t=
he
> > > commit tagged with Fixes.
> > >
> > >   drivers/gpu/drm/drm_prime.c | 5 +++++
> > >   1 file changed, 5 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.=
c
> > > index e3f09f18110c..849eea154dfc 100644
> > > --- a/drivers/gpu/drm/drm_prime.c
> > > +++ b/drivers/gpu/drm/drm_prime.c
> > > @@ -716,6 +716,11 @@ int drm_gem_prime_mmap(struct drm_gem_object *ob=
j, struct vm_area_struct *vma)
> > >       struct file *fil;
> > >       int ret;
> > >
> > > +     /* Ensure that the vma_node is initialized: */
> > > +     ret =3D drm_gem_create_mmap_offset(obj);
> > > +     if (ret)
> > > +             return ret;
> > > +
> > >       /* Add the fake offset */
> > >       vma->vm_pgoff +=3D drm_vma_node_start(&obj->vma_node);
> > >
> >
> > --
> > Thomas Zimmermann
> > Graphics Driver Developer
> > SUSE Software Solutions Germany GmbH
> > Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> > (HRB 36809, AG N=C3=BCrnberg)
> > Gesch=C3=A4ftsf=C3=BChrer: Ivo Totev



--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
