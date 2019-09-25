Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C931BD9E6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2019 10:30:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2634133AbfIYIal (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Sep 2019 04:30:41 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:38128 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2634101AbfIYIak (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Sep 2019 04:30:40 -0400
Received: by mail-wr1-f68.google.com with SMTP id l11so5523765wrx.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Sep 2019 01:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=twZS0noCXJU/jtGG8OwVfWmzfGZopM1ReTDLpx2DYdM=;
        b=YHaPTd9+9jTGnbdAsEP1NzGBEJPCUmS4TBPqldlTDAQBhXWLw3emkWmToKz/qokV7r
         F8FZqTY6oId3am7iZmuS2tcPY+jJQc2im1DE4C7FRY2noKG1vQhElJ98BEoXHC4IE266
         chALASsz4xOWXSpCuzVxEixGRzwmQBlEWuI/jkYZQj1X8WWBx1Gencs1u4y0dpaaOPC4
         yRZwbrEWdjtQqmPtx540SRWBj73IP2mUdgi5K6XnAntKe+oi1f7aX51D6LTbfrF7p+LO
         bGnRmnckWc/EannEzfwZLjUcsruAeHdHlmmF3NSBtm7Tnr1V32qEwWle9t9ArTxbTAjT
         42xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=twZS0noCXJU/jtGG8OwVfWmzfGZopM1ReTDLpx2DYdM=;
        b=fdCZj8wL7YY3HljNZj0TmKetBT0vQtUyzIKD+X1+hoH1LknUwv+9OktqfIdk2jincM
         1OkOx1fbwJm2yWHnUvR6w5LS48MwzH4csJG0SKdpgOvpuqPqOtQTP9a6LV6nPYVrfvNc
         zjHb+bhB5xm6ciyRu1k4JfYxSJA/9NUO0TvLi4VxkCXEfs1sDit6NDa3rxm1NX5qOGZh
         cyhpW+sKqaORx86gPBhG3OsItxpqKFHufC/rdbcJef2qbSAUHc9rCtLVtTInkBQH4ajU
         Shxk8b40D14wuf585f9waeGJUDZhi8v1zhVHES2rvDOMZOg6Kcu6ZpbzNxYiQFb6gH+v
         DLrQ==
X-Gm-Message-State: APjAAAWq5lrAkXQKkAOSISSSA3psl1eD+IBiihHaEwyoMc/Gvd+giblD
        B9/sXrlnGEAMFRUStvUeJdQWbNTpK+wpknfoX5E=
X-Google-Smtp-Source: APXvYqzLnrjLgUwao02ggausP7Tf0Q6SqdguLU2j+D6dSoyMYSajy5G7Os7zOHzDXBA5oMT6U1XIshqZ+tIrXKrRsAA=
X-Received: by 2002:adf:f406:: with SMTP id g6mr7525024wro.325.1569400238565;
 Wed, 25 Sep 2019 01:30:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190921100439.64402-1-kholk11@gmail.com> <20190921100439.64402-6-kholk11@gmail.com>
 <CAF6AEGubLrqmc5s3hYrYyygx0z2hDYrAfsqTSetmtUJy6rq-kQ@mail.gmail.com>
 <CAK7fi1ZKXz59yQgB0BxrZXhwXSsBmABWzWmi-CHvKo4B9bpS3g@mail.gmail.com> <CAF6AEGuC_YEBhUafJJ_qqm9bLd8z2BAAku5H-K2dQ90Yk_O3Sw@mail.gmail.com>
In-Reply-To: <CAF6AEGuC_YEBhUafJJ_qqm9bLd8z2BAAku5H-K2dQ90Yk_O3Sw@mail.gmail.com>
From:   AngeloGioacchino Del Regno <kholk11@gmail.com>
Date:   Wed, 25 Sep 2019 10:30:27 +0200
Message-ID: <CAK7fi1aKLo3fujY35E7bN-H_d-xyoOUXga_aifevFDA2tc34iQ@mail.gmail.com>
Subject: Re: [PATCH 5/5] drm/msm/adreno: Add support for Adreno 510 GPU
To:     Rob Clark <robdclark@gmail.com>
Cc:     linux-arm-msm <linux-arm-msm@vger.kernel.org>, marijns95@gmail.com,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jonathan <jonathan@marek.ca>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Il giorno lun 23 set 2019 alle ore 20:23 Rob Clark
<robdclark@gmail.com> ha scritto:
>
> On Mon, Sep 23, 2019 at 10:27 AM AngeloGioacchino Del Regno
> <kholk11@gmail.com> wrote:
> >
> > Il giorno lun 23 set 2019 alle ore 18:37 Rob Clark
> > <robdclark@gmail.com> ha scritto:
> > >
> > > On Sat, Sep 21, 2019 at 3:04 AM <kholk11@gmail.com> wrote:
> > > >
> > > > From: "Angelo G. Del Regno" <kholk11@gmail.com>
> > > >
> > > > The Adreno 510 GPU is a stripped version of the Adreno 5xx,
> > > > found in low-end SoCs like 8x56 and 8x76, which has 256K of
> > > > GMEM, with no GPMU nor ZAP.
> > > > Also, since the Adreno 5xx part of this driver seems to be
> > > > developed with high-end Adreno GPUs in mind, and since this
> > > > is a lower end one, add a comment making clear which GPUs
> > > > which support is not implemented yet is not using the GPMU
> > > > related hw init code, so that future developers will not go
> > > > crazy with that.
> > > >
> > > > By the way, the lower end Adreno GPUs with no GPMU are:
> > > > A505/A506/A510 (no ZAP firmware)
> > > > A508/A509/A512 (with ZAP firmware)
> > > >
> > >
> > > Hi, thanks for the patch.. one comment below about zap firmware...
> > > which is not completely to do with this patch, but is my thoughts on
> > > how we should clean up zap handling
> > >
> > > > Signed-off-by: Angelo G. Del Regno <kholk11@gmail.com>
> > >
> > > [snip]
> > >
> > > > @@ -679,7 +716,8 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
> > > >
> > > >         a5xx_preempt_hw_init(gpu);
> > > >
> > > > -       a5xx_gpmu_ucode_init(gpu);
> > > > +       if (!adreno_is_a510(adreno_gpu))
> > > > +               a5xx_gpmu_ucode_init(gpu);
> > > >
> > > >         ret = a5xx_ucode_init(gpu);
> > > >         if (ret)
> > > > @@ -712,12 +750,18 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
> > > >         }
> > > >
> > > >         /*
> > > > -        * Try to load a zap shader into the secure world. If successful
> > > > +        * If the chip that we are using does support loading one, then
> > > > +        * try to load a zap shader into the secure world. If successful
> > > >          * we can use the CP to switch out of secure mode. If not then we
> > > >          * have no resource but to try to switch ourselves out manually. If we
> > > >          * guessed wrong then access to the RBBM_SECVID_TRUST_CNTL register will
> > > >          * be blocked and a permissions violation will soon follow.
> > > >          */
> > > > +       if (adreno_is_a510(adreno_gpu)) {
> > > > +               gpu_write(gpu, REG_A5XX_RBBM_SECVID_TRUST_CNTL, 0x0);
> > > > +               goto skip_zap;
> > > > +       }
> > >
> > > This is something we need to cleanup on a6xx as well.  But it is
> > > actually possible to have the same GPU with and without zap.  We have
> > > this situation today with sdm845, for example.
> > >
> > > What I'd like to do is rather than guess whether we can write
> > > RBBM_SECVID_TRUST_CNTL or not (since that goes spectacularly wrong
> > > when we guess incorrectly), is choose based on the presence of the
> > > zap-shader child node in dtb.  (Currently a6xx tries to choose based
> > > on whether zap firmware is present.. which we need to fix.)
> > >
> > > Originally I was thinking we could keep the zap-shader node in the
> > > SoC's "core" dtsi (ie. msm8996.dtsi, sdm845.dtsi, etc) and using
> > > /delete-node/ in per-device dts files for devices without zap.. but
> > > (AFAIU) the zap shader ends up being signed with a vendor key in most
> > > cases, meaning that to have a "generic" (not device-specific) distro
> > > image need to have different zap file names/paths for devices from
> > > different vendors.  Given this, I think it makes more sense to move
> > > the zap-shader node into a per-device (or at least, per-vendor) dts
> > > file, ie. something like:
> > >
> > >    /* sdm850-lenovo-yoga-c630.dts: */
> > >   gpu {
> > >      zap-shader {
> > >         memory-region = <&gpu_mem>;
> > >         zap-prefix = "LENOVO";
> > >     };
> > >   };
> > >
> > > which would trigger the driver to try to load
> > > /lib/firmware/qcom/LENOVO/a630_zap.mbn
> > >
> > > (I'd like to, at least for devices that have ACPI/SMBIOS tables,
> > > standardize on using the vendor name from SMBIOS tables as this
> > > prefix.. so we have a way to construct the firmware path if we
> > > eventually have ACPI boot support on the aarch64 laptops.)
> > >
> > > BR,
> > > -R
> > >
> > > > +
> > > >         ret = a5xx_zap_shader_init(gpu);
> > > >         if (!ret) {
> > > >                 OUT_PKT7(gpu->rb[0], CP_SET_SECURE_MODE, 1);
> > > > @@ -733,6 +777,7 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
> > > >                 gpu_write(gpu, REG_A5XX_RBBM_SECVID_TRUST_CNTL, 0x0);
> > > >         }
> > > >
> > > > +skip_zap:
> > > >         /* Last step - yield the ringbuffer */
> > > >         a5xx_preempt_start(gpu);
> > > >
> > > > @@ -1066,6 +1111,7 @@ static void a5xx_dump(struct msm_gpu *gpu)
> >
> > Thanks to you for the review.
> > What I've documented there about the A5xx chips having ZAP and the ones not
> > having it, came out after a research in the downstream KGSL driver, where qcom
> > does this distinction based on just the Adreno model, which is the main reason
> > why I did it like that :)))
> >
> > I am personally not aware of any A5xx chip having this behavior, so that's why I
> > didn't even try to think different about this patch. It just seemed to
> > be the right
> > thing to do...
>
> I'm not aware of the case where a fw (hyp/tz) difference means you
> don't have zap shader on any a5xx device.  But seeing it on a6xx made
> me realize that this is really more about the fw than the hw.  Which
> is something that I didn't realize when the a5xx zap support initially
> landed.
>
> I think what I'd do for now is, instead of if (adreno_is_XYZ() ||
> adreno_is_ABC() || ...) { skip_zap }, I'd change that to if
> (!has_zap_node)..  and for the dts files we should start adding the
> zap node in device specific .dts files.
>
> Also I suppose we might need to slightly change where we load the zap
> fw, ie. we can skip trying to load zap fw in the !has_zap_node case.
>
> BR,
> -R

Okay, there's no problem and yeah, I agree with you, better be safe than sorry
and better keep it clean from the very beginning.
I'll send a v2 with all the proposed changes to this patch from you
and Jordan ASAP.
