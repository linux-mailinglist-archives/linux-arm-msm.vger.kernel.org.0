Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 24ADE1513C3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Feb 2020 01:41:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726834AbgBDAkz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Feb 2020 19:40:55 -0500
Received: from mail-ed1-f65.google.com ([209.85.208.65]:37023 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726872AbgBDAky (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Feb 2020 19:40:54 -0500
Received: by mail-ed1-f65.google.com with SMTP id cy15so18078361edb.4;
        Mon, 03 Feb 2020 16:40:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Dj1hr3nC99JuvkU09XV7ayB0+YSPBYgoXgElkOJgmzg=;
        b=OMhFkOfWAK0jlVydiXMohJVXTPAHEPDPkHJ1c6tFod2BMXKyBEkqSsiZmNK7hdp2ji
         hjvvzsv+zfuvHAvV1IGMHpcWwzdQllCn5Q56ibwE1N4L7kkL6c+3Q/y5p+WE5FFcSQNY
         aw1xsgtt7Dysn69u9irzrCJcxh31dOeUWw5vj6raP8DsnnqT3fjhYYOYO45wlmnsVfsK
         4wl3SJV5LAfPBX6E1HhLC5vn8q8tiGC6QSoyEgieQh1bnnJFTc5FNYsxdLsenT6W7vXu
         SfT2R2XmOAhLg/RSVkWJhKGpez+yifBE0Rf79xuBE6Pp8fx5kEFFSfXeVdyKpEqzLA1i
         VU1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Dj1hr3nC99JuvkU09XV7ayB0+YSPBYgoXgElkOJgmzg=;
        b=hm69oxuM97wrkcZ1vfrbZJIlh8Aiu143O5HlPNxVZpHZwdOmKs5hb8fj+dYbGTpF5y
         2DINgy+j4P9C9EELBa6x0P0ZnlKkYk8kSEZrzIW3vVYSTZzJWqU+A4iHqsAFN7FLx7QS
         GBgTPJ2U2XImnhPD6MmyuEBITIxXsJzvN3rmyw3tMc0isqB0TGk7rQAsBA9QO2IXHiYc
         xoLmYI/Gs6GCguXsrQJjByylhz64D+54zTunwKCti0udqyjAYMuDZWRy8WBrZsnUn//V
         NeWoicdSp1xijSdUoGl95dWjZ/nRB8LrFfvHgj/KKgJGfrY9HVWsgipJ2kXRvOdemIOy
         fE6w==
X-Gm-Message-State: APjAAAWnH7tYCZW7I8boGjwxxF+ocwJRfXUPAULbbAAc1nHAksSzXbVY
        TlgOJf3oTS+XXZL30GNkRx1yb8ZIJ8OOUGK9Ek4=
X-Google-Smtp-Source: APXvYqyFsuijb4pxN+FCPFBZGR03YAhbbzg8McEI+im+HEHIvWPDusNo46gAIuLArQP5FgrOxgPNDog46maRiViYDNY=
X-Received: by 2002:a17:906:19d8:: with SMTP id h24mr22838316ejd.166.1580776851956;
 Mon, 03 Feb 2020 16:40:51 -0800 (PST)
MIME-Version: 1.0
References: <1579763945-10478-1-git-send-email-smasetty@codeaurora.org>
 <1579763945-10478-2-git-send-email-smasetty@codeaurora.org> <CALAqxLU9-4YEF8mTjuPF+LBJH8fFw_OfrdT7JtTqib127RRaEA@mail.gmail.com>
In-Reply-To: <CALAqxLU9-4YEF8mTjuPF+LBJH8fFw_OfrdT7JtTqib127RRaEA@mail.gmail.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Mon, 3 Feb 2020 16:40:40 -0800
Message-ID: <CAF6AEGtxtJU5dJxd4idQgPL2HYgiLm2vJejjK-gzDXqtoaTr9w@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH v2 2/3] drm: msm: a6xx: Add support for A618
To:     John Stultz <john.stultz@linaro.org>
Cc:     Sharat Masetty <smasetty@codeaurora.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        dri-devel@freedesktop.org,
        freedreno <freedreno@lists.freedesktop.org>,
        Sumit Semwal <sumit.semwal@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Feb 3, 2020 at 4:21 PM John Stultz <john.stultz@linaro.org> wrote:
>
> On Wed, Jan 22, 2020 at 11:19 PM Sharat Masetty <smasetty@codeaurora.org> wrote:
> >
> > This patch adds support for enabling Graphics Bus Interface(GBIF)
> > used in multiple A6xx series chipets. Also makes changes to the
> > PDC/RSC sequencing specifically required for A618. This is needed
> > for proper interfacing with RPMH.
> >
> > Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
> > ---
> > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > index dc8ec2c..2ac9a51 100644
> > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > @@ -378,6 +378,18 @@ static int a6xx_hw_init(struct msm_gpu *gpu)
> >         struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
> >         int ret;
> >
> > +       /*
> > +        * During a previous slumber, GBIF halt is asserted to ensure
> > +        * no further transaction can go through GPU before GPU
> > +        * headswitch is turned off.
> > +        *
> > +        * This halt is deasserted once headswitch goes off but
> > +        * incase headswitch doesn't goes off clear GBIF halt
> > +        * here to ensure GPU wake-up doesn't fail because of
> > +        * halted GPU transactions.
> > +        */
> > +       gpu_write(gpu, REG_A6XX_GBIF_HALT, 0x0);
> > +
> >         /* Make sure the GMU keeps the GPU on while we set it up */
> >         a6xx_gmu_set_oob(&a6xx_gpu->gmu, GMU_OOB_GPU_SET);
> >
>
> So I already brought this up on #freedreno but figured I'd follow up
> on the list.
>
> With linus/master, I'm seeing hard crashes (into usb crash mode) with
> the db845c, which I isolated down to this patch, and then to the chunk
> above.

(repeating my speculation from #freedreno for benefit of those not on IRC)

I'm suspecting, that like the registers to take the GPU out of secure
mode, this register is being blocked on LA devices (like db845c),
which is why we didn't see this on cheza.

Maybe we can make this write conditional on whether we have a zap shader?

BR,
-R

> Dropping the gpu_write line above gets things booting again for me.
>
> Let me know if there are any follow on patches I can help validate.
>
> thanks
> -john
> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno
