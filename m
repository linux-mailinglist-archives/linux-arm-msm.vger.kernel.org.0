Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 637FABBB3A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Sep 2019 20:23:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440181AbfIWSXu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Sep 2019 14:23:50 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:35089 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2438123AbfIWSXu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Sep 2019 14:23:50 -0400
Received: by mail-ed1-f65.google.com with SMTP id v8so13873000eds.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Sep 2019 11:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3xcfsEgRrEbJyl/8rY90WK/st4+6aUCMiCigcJxvmoU=;
        b=NIQiIpMhxjglBAt49K8JN6VdJ2tJOQE7AfkpYKzggFWiNTdbYCLCXtUmdA3DgjVXKn
         EhWvona4E9SvUc5qCUMIEP976sLgqifLnwXnjJv9zJ6EuynGJhEd3IbYWL2M53sM03eO
         i9coYeCrfICrHq/fcCcRQurOGMzTFeCSqEiaOfpBFn/VERVRyI1j7yquZHSdpXEjaCix
         hiNtMYkaGMeXpYai5qVrR8NyzTDKv5F9dS/mBd0uAczq7bcdt9Kl8Sbf8LcM9+u/Au+9
         31yQ0RX4brcBY37UcH4P/njJxb71KFpbr4Q1IIykvVrmX5cXNKXqq0Jt+BlOSLz4bmxv
         yRIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3xcfsEgRrEbJyl/8rY90WK/st4+6aUCMiCigcJxvmoU=;
        b=SafsPIAsG26iTXmMIYtGAgG85vgXIYvbv88dy4dWr9o0mAAqyrMu+iRE3c/H63O9hu
         pdZz7UGy6ZAVLcQariOjSQiHVYU3KWiFC+ckjmF4gc0goY+de18GmHPYNPy5lWJNAcBt
         /CPCauHuYssnFc7Mq8LOWvfDPX8VE7auv2HsdAwZb4YeD0eHnC9pJn51Ne5j0tDmgRRU
         gn/qNPykhO6QMaYDwjSPfb2d8EUTmJTojjfo+uEiOM9npXollBw5+dwtE1ppcSncmPxL
         zu9EOtbwuEwigV+HoR/DbcdPBwInDfhaDuhP2qalzu1GAMjpEOxH8v4fplxvmDLcAy9o
         f8nQ==
X-Gm-Message-State: APjAAAV5hV4u6gMoG3NP+8I6at1K1Pn0XPOMTHA+Hb8UZf7jeptdz/fy
        5nt2oy6aoybp4CiCByhukkCPlh75w0Xrd2Z1DcY=
X-Google-Smtp-Source: APXvYqxLqVRUOY5y5KZoAkOCBIZMudRu991gx5Gm+0zlcR/qBUEapUScCGc8t1hGaMG77Hp5NnKpbFZqyzAytd76La0=
X-Received: by 2002:a05:6402:120e:: with SMTP id c14mr1531255edw.272.1569263028159;
 Mon, 23 Sep 2019 11:23:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190921100439.64402-1-kholk11@gmail.com> <20190921100439.64402-6-kholk11@gmail.com>
 <CAF6AEGubLrqmc5s3hYrYyygx0z2hDYrAfsqTSetmtUJy6rq-kQ@mail.gmail.com> <CAK7fi1ZKXz59yQgB0BxrZXhwXSsBmABWzWmi-CHvKo4B9bpS3g@mail.gmail.com>
In-Reply-To: <CAK7fi1ZKXz59yQgB0BxrZXhwXSsBmABWzWmi-CHvKo4B9bpS3g@mail.gmail.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Mon, 23 Sep 2019 11:23:36 -0700
Message-ID: <CAF6AEGuC_YEBhUafJJ_qqm9bLd8z2BAAku5H-K2dQ90Yk_O3Sw@mail.gmail.com>
Subject: Re: [PATCH 5/5] drm/msm/adreno: Add support for Adreno 510 GPU
To:     AngeloGioacchino Del Regno <kholk11@gmail.com>
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

On Mon, Sep 23, 2019 at 10:27 AM AngeloGioacchino Del Regno
<kholk11@gmail.com> wrote:
>
> Il giorno lun 23 set 2019 alle ore 18:37 Rob Clark
> <robdclark@gmail.com> ha scritto:
> >
> > On Sat, Sep 21, 2019 at 3:04 AM <kholk11@gmail.com> wrote:
> > >
> > > From: "Angelo G. Del Regno" <kholk11@gmail.com>
> > >
> > > The Adreno 510 GPU is a stripped version of the Adreno 5xx,
> > > found in low-end SoCs like 8x56 and 8x76, which has 256K of
> > > GMEM, with no GPMU nor ZAP.
> > > Also, since the Adreno 5xx part of this driver seems to be
> > > developed with high-end Adreno GPUs in mind, and since this
> > > is a lower end one, add a comment making clear which GPUs
> > > which support is not implemented yet is not using the GPMU
> > > related hw init code, so that future developers will not go
> > > crazy with that.
> > >
> > > By the way, the lower end Adreno GPUs with no GPMU are:
> > > A505/A506/A510 (no ZAP firmware)
> > > A508/A509/A512 (with ZAP firmware)
> > >
> >
> > Hi, thanks for the patch.. one comment below about zap firmware...
> > which is not completely to do with this patch, but is my thoughts on
> > how we should clean up zap handling
> >
> > > Signed-off-by: Angelo G. Del Regno <kholk11@gmail.com>
> >
> > [snip]
> >
> > > @@ -679,7 +716,8 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
> > >
> > >         a5xx_preempt_hw_init(gpu);
> > >
> > > -       a5xx_gpmu_ucode_init(gpu);
> > > +       if (!adreno_is_a510(adreno_gpu))
> > > +               a5xx_gpmu_ucode_init(gpu);
> > >
> > >         ret = a5xx_ucode_init(gpu);
> > >         if (ret)
> > > @@ -712,12 +750,18 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
> > >         }
> > >
> > >         /*
> > > -        * Try to load a zap shader into the secure world. If successful
> > > +        * If the chip that we are using does support loading one, then
> > > +        * try to load a zap shader into the secure world. If successful
> > >          * we can use the CP to switch out of secure mode. If not then we
> > >          * have no resource but to try to switch ourselves out manually. If we
> > >          * guessed wrong then access to the RBBM_SECVID_TRUST_CNTL register will
> > >          * be blocked and a permissions violation will soon follow.
> > >          */
> > > +       if (adreno_is_a510(adreno_gpu)) {
> > > +               gpu_write(gpu, REG_A5XX_RBBM_SECVID_TRUST_CNTL, 0x0);
> > > +               goto skip_zap;
> > > +       }
> >
> > This is something we need to cleanup on a6xx as well.  But it is
> > actually possible to have the same GPU with and without zap.  We have
> > this situation today with sdm845, for example.
> >
> > What I'd like to do is rather than guess whether we can write
> > RBBM_SECVID_TRUST_CNTL or not (since that goes spectacularly wrong
> > when we guess incorrectly), is choose based on the presence of the
> > zap-shader child node in dtb.  (Currently a6xx tries to choose based
> > on whether zap firmware is present.. which we need to fix.)
> >
> > Originally I was thinking we could keep the zap-shader node in the
> > SoC's "core" dtsi (ie. msm8996.dtsi, sdm845.dtsi, etc) and using
> > /delete-node/ in per-device dts files for devices without zap.. but
> > (AFAIU) the zap shader ends up being signed with a vendor key in most
> > cases, meaning that to have a "generic" (not device-specific) distro
> > image need to have different zap file names/paths for devices from
> > different vendors.  Given this, I think it makes more sense to move
> > the zap-shader node into a per-device (or at least, per-vendor) dts
> > file, ie. something like:
> >
> >    /* sdm850-lenovo-yoga-c630.dts: */
> >   gpu {
> >      zap-shader {
> >         memory-region = <&gpu_mem>;
> >         zap-prefix = "LENOVO";
> >     };
> >   };
> >
> > which would trigger the driver to try to load
> > /lib/firmware/qcom/LENOVO/a630_zap.mbn
> >
> > (I'd like to, at least for devices that have ACPI/SMBIOS tables,
> > standardize on using the vendor name from SMBIOS tables as this
> > prefix.. so we have a way to construct the firmware path if we
> > eventually have ACPI boot support on the aarch64 laptops.)
> >
> > BR,
> > -R
> >
> > > +
> > >         ret = a5xx_zap_shader_init(gpu);
> > >         if (!ret) {
> > >                 OUT_PKT7(gpu->rb[0], CP_SET_SECURE_MODE, 1);
> > > @@ -733,6 +777,7 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
> > >                 gpu_write(gpu, REG_A5XX_RBBM_SECVID_TRUST_CNTL, 0x0);
> > >         }
> > >
> > > +skip_zap:
> > >         /* Last step - yield the ringbuffer */
> > >         a5xx_preempt_start(gpu);
> > >
> > > @@ -1066,6 +1111,7 @@ static void a5xx_dump(struct msm_gpu *gpu)
>
> Thanks to you for the review.
> What I've documented there about the A5xx chips having ZAP and the ones not
> having it, came out after a research in the downstream KGSL driver, where qcom
> does this distinction based on just the Adreno model, which is the main reason
> why I did it like that :)))
>
> I am personally not aware of any A5xx chip having this behavior, so that's why I
> didn't even try to think different about this patch. It just seemed to
> be the right
> thing to do...

I'm not aware of the case where a fw (hyp/tz) difference means you
don't have zap shader on any a5xx device.  But seeing it on a6xx made
me realize that this is really more about the fw than the hw.  Which
is something that I didn't realize when the a5xx zap support initially
landed.

I think what I'd do for now is, instead of if (adreno_is_XYZ() ||
adreno_is_ABC() || ...) { skip_zap }, I'd change that to if
(!has_zap_node)..  and for the dts files we should start adding the
zap node in device specific .dts files.

Also I suppose we might need to slightly change where we load the zap
fw, ie. we can skip trying to load zap fw in the !has_zap_node case.

BR,
-R
