Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F35B74DF1E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Jul 2023 22:21:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229627AbjGJUVN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 Jul 2023 16:21:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229505AbjGJUVN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 Jul 2023 16:21:13 -0400
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com [IPv6:2607:f8b0:4864:20::c34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F765BB
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Jul 2023 13:21:12 -0700 (PDT)
Received: by mail-oo1-xc34.google.com with SMTP id 006d021491bc7-55b85b94bb0so2635575eaf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Jul 2023 13:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689020471; x=1691612471;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zQI7m/PWW5lx/D1YlUvsvyQDeza06QWfMVyhiJmEv7Y=;
        b=RnAddbMZgLA1Og/B+xpbcbXdBD0VrjWG1NaGXJ07JDYcAd7mttQcInm7ak3KUcgvgs
         VS/Oe21tZHO5LUJob8/k9ycA1yIIonZKDl9Tsngj9Y9j9dmgyGPmNz0T/kdFyrD/sxpu
         oa8nxCKP/L9NkWSJY76ShahPBYulQi1uuR9tUl/FqW7e7i3Z/93fPceRg8+H/CVD3Nwv
         EngiLnl6gHr2OGQKcwmma/JwnOR5EkHKRGE0Hp6iSQiuiB8uoXP7m5/bzTzCJzzSFAks
         HUlsePXzctmi0WIBbohNSjrp+UNMVnGJhKYcZYRcMGNSK8Jj3UrTV5rAp38VjhXNkDYb
         ayug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689020471; x=1691612471;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zQI7m/PWW5lx/D1YlUvsvyQDeza06QWfMVyhiJmEv7Y=;
        b=Yo40x3031FD8uOhrN8z37KcN8maYtfRqH6EYNqzFBuS/aUrW2wIG4dVO10ZY7glMlB
         xbjaBiRSEV5IQn+uvum1DkA6ruhHNnW7kKMvxAx2yjB/3iNgdHUZbwOy4b+ziST3WSw6
         /uF9ERQMgCvbwRutkCCVQsZsByMrf7hcu8Zj+OygRKsgYM0BLz+ndYFTAPlODYYOKE8D
         kEpxM21igf4hT9DQqQ8AW8CX6zGhZ+jPfT7f+CaZNhPUJH1jYtq3uK9var9A0pGZSFkd
         SV252M0C0Y+LrDSRGcsq6JByTqPTii7iY75Itjq0LAWNh/xfzDO8nz8Z3rPqhYkkMr/r
         msPA==
X-Gm-Message-State: ABy/qLaZgRnLVr7QbNQg0L2cUkCTXCyzs8E/RDug0nQAIwXlvfOd9RQ/
        K13qyZaUfYMQflBMnpTylj7zrg4ffmFl4gzxUWU=
X-Google-Smtp-Source: APBJJlFMuBmCDJiTe5d+q61B/wbJExJt0gPJw1oc4QmfseKkn8o+8hegLmwGvAiXF6SS3Y9BxgIni1lufhYJje9rRSo=
X-Received: by 2002:a05:6870:e2c9:b0:1b7:3065:abe with SMTP id
 w9-20020a056870e2c900b001b730650abemr3891540oad.26.1689020471456; Mon, 10 Jul
 2023 13:21:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230706211045.204925-1-robdclark@gmail.com> <20230706211045.204925-11-robdclark@gmail.com>
 <1ecc63d0-db62-c8aa-74b7-36ad2eff89a1@linaro.org>
In-Reply-To: <1ecc63d0-db62-c8aa-74b7-36ad2eff89a1@linaro.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Mon, 10 Jul 2023 13:21:00 -0700
Message-ID: <CAF6AEGtJifJZd94iP4n65mrcOda9L367NJGNpR8R2x1kjVZGmQ@mail.gmail.com>
Subject: Re: [PATCH 10/12] drm/msm/adreno: Add helper for formating chip-id
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jul 6, 2023 at 4:36=E2=80=AFPM Konrad Dybcio <konrad.dybcio@linaro.=
org> wrote:
>
> On 6.07.2023 23:10, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > This is used in a few places, including one that is parsed by userspace
> > tools.  So let's standardize it a bit better.
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> Userspace parsed this weird string instead of the hex-based chipid?
>
> weird^2

AFAICT it is just crashdec (the creatively named tool for parsing gpu
devcore dumps) which parses using "%u.%u.%u.%u"..  I suppose one
_could_ make the argument that, since userspace doesn't yet support
any device where "%x.%x.%x.%x" parsing would be different, we could
get away with switching to hex without it being an ABI break..

BR,
-R

> Konrad
> >  drivers/gpu/drm/msm/adreno/adreno_device.c |  8 +++-----
> >  drivers/gpu/drm/msm/adreno/adreno_gpu.c    | 19 ++++++++-----------
> >  drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  6 ++++++
> >  3 files changed, 17 insertions(+), 16 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/d=
rm/msm/adreno/adreno_device.c
> > index dcd6363ac7b0..fd2e183bce60 100644
> > --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> > +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> > @@ -661,14 +661,12 @@ static int adreno_bind(struct device *dev, struct=
 device *master, void *data)
> >       info =3D adreno_info(config.rev);
> >
> >       if (!info) {
> > -             dev_warn(drm->dev, "Unknown GPU revision: %u.%u.%u.%u\n",
> > -                     config.rev.core, config.rev.major,
> > -                     config.rev.minor, config.rev.patchid);
> > +             dev_warn(drm->dev, "Unknown GPU revision: %"ADRENO_CHIPID=
_FMT"\n",
> > +                     ADRENO_CHIPID_ARGS(config.rev));
> >               return -ENXIO;
> >       }
> >
> > -     DBG("Found GPU: %u.%u.%u.%u", config.rev.core, config.rev.major,
> > -             config.rev.minor, config.rev.patchid);
> > +     DBG("Found GPU: %"ADRENO_CHIPID_FMT, ADRENO_CHIPID_ARGS(config.re=
v));
> >
> >       priv->is_a2xx =3D info->family < ADRENO_3XX;
> >       priv->has_cached_coherent =3D
> > diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/=
msm/adreno/adreno_gpu.c
> > index 75ff7fb46099..1a982a926f21 100644
> > --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > @@ -847,10 +847,9 @@ void adreno_show(struct msm_gpu *gpu, struct msm_g=
pu_state *state,
> >       if (IS_ERR_OR_NULL(state))
> >               return;
> >
> > -     drm_printf(p, "revision: %d (%d.%d.%d.%d)\n",
> > -                     adreno_gpu->info->revn, adreno_gpu->rev.core,
> > -                     adreno_gpu->rev.major, adreno_gpu->rev.minor,
> > -                     adreno_gpu->rev.patchid);
> > +     drm_printf(p, "revision: %u (%"ADRENO_CHIPID_FMT")\n",
> > +                     adreno_gpu->info->revn,
> > +                     ADRENO_CHIPID_ARGS(adreno_gpu->rev));
> >       /*
> >        * If this is state collected due to iova fault, so fault related=
 info
> >        *
> > @@ -921,10 +920,9 @@ void adreno_dump_info(struct msm_gpu *gpu)
> >       struct adreno_gpu *adreno_gpu =3D to_adreno_gpu(gpu);
> >       int i;
> >
> > -     printk("revision: %d (%d.%d.%d.%d)\n",
> > -                     adreno_gpu->info->revn, adreno_gpu->rev.core,
> > -                     adreno_gpu->rev.major, adreno_gpu->rev.minor,
> > -                     adreno_gpu->rev.patchid);
> > +     printk("revision: %u (%"ADRENO_CHIPID_FMT")\n",
> > +                     adreno_gpu->info->revn,
> > +                     ADRENO_CHIPID_ARGS(adreno_gpu->rev));
> >
> >       for (i =3D 0; i < gpu->nr_rings; i++) {
> >               struct msm_ringbuffer *ring =3D gpu->rb[i];
> > @@ -1105,9 +1103,8 @@ int adreno_gpu_init(struct drm_device *drm, struc=
t platform_device *pdev,
> >               speedbin =3D 0xffff;
> >       adreno_gpu->speedbin =3D (uint16_t) (0xffff & speedbin);
> >
> > -     gpu_name =3D devm_kasprintf(dev, GFP_KERNEL, "%d.%d.%d.%d",
> > -                     rev->core, rev->major, rev->minor,
> > -                     rev->patchid);
> > +     gpu_name =3D devm_kasprintf(dev, GFP_KERNEL, "%"ADRENO_CHIPID_FMT=
,
> > +                     ADRENO_CHIPID_ARGS(config->rev));
> >       if (!gpu_name)
> >               return -ENOMEM;
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/=
msm/adreno/adreno_gpu.h
> > index 2fa14dcd4e40..73e7155f164c 100644
> > --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > @@ -66,6 +66,12 @@ struct adreno_rev {
> >  #define ADRENO_REV(core, major, minor, patchid) \
> >       ((struct adreno_rev){ core, major, minor, patchid })
> >
> > +/* Helper for formating the chip_id in the way that userspace tools li=
ke
> > + * crashdec expect.
> > + */
> > +#define ADRENO_CHIPID_FMT "u.%u.%u.%u"
> > +#define ADRENO_CHIPID_ARGS(_r) (_r).core, (_r).major, (_r).minor, (_r)=
.patchid
> > +
> >  struct adreno_gpu_funcs {
> >       struct msm_gpu_funcs base;
> >       int (*get_timestamp)(struct msm_gpu *gpu, uint64_t *value);
