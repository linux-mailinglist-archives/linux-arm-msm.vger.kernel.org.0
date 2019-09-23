Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F2A3BBA66
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Sep 2019 19:27:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407488AbfIWR1D (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Sep 2019 13:27:03 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:40193 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407415AbfIWR1D (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Sep 2019 13:27:03 -0400
Received: by mail-wm1-f68.google.com with SMTP id b24so10167278wmj.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Sep 2019 10:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XYuQXLtf6Sc43uMhoHtDaYDFeS6Nvox7tkHBZyNWkf0=;
        b=ami+AynxA4OVskGE8vT/LLKjpxJzBTLwGhDqwV6NT1sLc7BS/NkZBSCHdQO+WhW7AA
         fxI5DaBaqG29UPKIg1OyPwhNLp626NOMyXWzWu+7aGTerjcg05HH48mJq1I6gLQAf+Cy
         pmy7+7YFnJQJULyRBs4dGvDdU5YXFkE7ovfDDUBTRL61stGgpNYJINzbRQ/XIXm+Lb4E
         NOub6oWQ36HTzMQMguMva+itB/F2qbnbJIW7ch1DCWMjs1pQxA0diiMmPxOjfN6T1W96
         o/GWuCzSMtjuOewVT35MHgfCUd8OTfLrT2OIPd4/oStFTCKKrlKuRxAZG4VDWV78HziC
         6zxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XYuQXLtf6Sc43uMhoHtDaYDFeS6Nvox7tkHBZyNWkf0=;
        b=OH1lpInq9wdovyliMvJe5IsPEEOH4jRTPH0Fa7NY2rJpTWV5zMaJjDI2c6IbGRfjz8
         hMl7W0puVpjGWt2Y4MzuNn4glx7t6Q73x4p9WSKiNZpAMJlSAmVxsmJ46RN4Ptctx6Fq
         g88xQSv4vjInqNst/tOvG1q/yVx1Iwe2VLvvngXNR7AtI3zwVLshqkqG1MuvUniMsqsW
         yGnj/tlpeX11iWT6E7gbm5w4EKK6Uws6Q/la1Tn6ZyL7kKBLR46zsaiIdIM6S6OOdliD
         CV/Gi0V9YGEGm+o0DTDnLxnyzl3/6Yb/LHGuf5FO9QGx/kHeoDTdF+uSggEDx1y1hMOV
         +Vvg==
X-Gm-Message-State: APjAAAXHWqOWcS+ZBE1EypjEM7wfTdQgGoeNfZ3h7y9XNQO3SCwtDAuk
        utvGKaxxHn1505SoFLPK9uL3kOLN88J7dD56cWA=
X-Google-Smtp-Source: APXvYqwinjiHKEo5W4KoxGRhU/e+xlnz1lqzdV1QyrtKoKwHO+JliARRAgqFojEEUq/XApV0fHlt8jItMVYbJHIZCOA=
X-Received: by 2002:a7b:c776:: with SMTP id x22mr485576wmk.123.1569259620249;
 Mon, 23 Sep 2019 10:27:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190921100439.64402-1-kholk11@gmail.com> <20190921100439.64402-6-kholk11@gmail.com>
 <CAF6AEGubLrqmc5s3hYrYyygx0z2hDYrAfsqTSetmtUJy6rq-kQ@mail.gmail.com>
In-Reply-To: <CAF6AEGubLrqmc5s3hYrYyygx0z2hDYrAfsqTSetmtUJy6rq-kQ@mail.gmail.com>
From:   AngeloGioacchino Del Regno <kholk11@gmail.com>
Date:   Mon, 23 Sep 2019 19:26:49 +0200
Message-ID: <CAK7fi1ZKXz59yQgB0BxrZXhwXSsBmABWzWmi-CHvKo4B9bpS3g@mail.gmail.com>
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

Il giorno lun 23 set 2019 alle ore 18:37 Rob Clark
<robdclark@gmail.com> ha scritto:
>
> On Sat, Sep 21, 2019 at 3:04 AM <kholk11@gmail.com> wrote:
> >
> > From: "Angelo G. Del Regno" <kholk11@gmail.com>
> >
> > The Adreno 510 GPU is a stripped version of the Adreno 5xx,
> > found in low-end SoCs like 8x56 and 8x76, which has 256K of
> > GMEM, with no GPMU nor ZAP.
> > Also, since the Adreno 5xx part of this driver seems to be
> > developed with high-end Adreno GPUs in mind, and since this
> > is a lower end one, add a comment making clear which GPUs
> > which support is not implemented yet is not using the GPMU
> > related hw init code, so that future developers will not go
> > crazy with that.
> >
> > By the way, the lower end Adreno GPUs with no GPMU are:
> > A505/A506/A510 (no ZAP firmware)
> > A508/A509/A512 (with ZAP firmware)
> >
>
> Hi, thanks for the patch.. one comment below about zap firmware...
> which is not completely to do with this patch, but is my thoughts on
> how we should clean up zap handling
>
> > Signed-off-by: Angelo G. Del Regno <kholk11@gmail.com>
>
> [snip]
>
> > @@ -679,7 +716,8 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
> >
> >         a5xx_preempt_hw_init(gpu);
> >
> > -       a5xx_gpmu_ucode_init(gpu);
> > +       if (!adreno_is_a510(adreno_gpu))
> > +               a5xx_gpmu_ucode_init(gpu);
> >
> >         ret = a5xx_ucode_init(gpu);
> >         if (ret)
> > @@ -712,12 +750,18 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
> >         }
> >
> >         /*
> > -        * Try to load a zap shader into the secure world. If successful
> > +        * If the chip that we are using does support loading one, then
> > +        * try to load a zap shader into the secure world. If successful
> >          * we can use the CP to switch out of secure mode. If not then we
> >          * have no resource but to try to switch ourselves out manually. If we
> >          * guessed wrong then access to the RBBM_SECVID_TRUST_CNTL register will
> >          * be blocked and a permissions violation will soon follow.
> >          */
> > +       if (adreno_is_a510(adreno_gpu)) {
> > +               gpu_write(gpu, REG_A5XX_RBBM_SECVID_TRUST_CNTL, 0x0);
> > +               goto skip_zap;
> > +       }
>
> This is something we need to cleanup on a6xx as well.  But it is
> actually possible to have the same GPU with and without zap.  We have
> this situation today with sdm845, for example.
>
> What I'd like to do is rather than guess whether we can write
> RBBM_SECVID_TRUST_CNTL or not (since that goes spectacularly wrong
> when we guess incorrectly), is choose based on the presence of the
> zap-shader child node in dtb.  (Currently a6xx tries to choose based
> on whether zap firmware is present.. which we need to fix.)
>
> Originally I was thinking we could keep the zap-shader node in the
> SoC's "core" dtsi (ie. msm8996.dtsi, sdm845.dtsi, etc) and using
> /delete-node/ in per-device dts files for devices without zap.. but
> (AFAIU) the zap shader ends up being signed with a vendor key in most
> cases, meaning that to have a "generic" (not device-specific) distro
> image need to have different zap file names/paths for devices from
> different vendors.  Given this, I think it makes more sense to move
> the zap-shader node into a per-device (or at least, per-vendor) dts
> file, ie. something like:
>
>    /* sdm850-lenovo-yoga-c630.dts: */
>   gpu {
>      zap-shader {
>         memory-region = <&gpu_mem>;
>         zap-prefix = "LENOVO";
>     };
>   };
>
> which would trigger the driver to try to load
> /lib/firmware/qcom/LENOVO/a630_zap.mbn
>
> (I'd like to, at least for devices that have ACPI/SMBIOS tables,
> standardize on using the vendor name from SMBIOS tables as this
> prefix.. so we have a way to construct the firmware path if we
> eventually have ACPI boot support on the aarch64 laptops.)
>
> BR,
> -R
>
> > +
> >         ret = a5xx_zap_shader_init(gpu);
> >         if (!ret) {
> >                 OUT_PKT7(gpu->rb[0], CP_SET_SECURE_MODE, 1);
> > @@ -733,6 +777,7 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
> >                 gpu_write(gpu, REG_A5XX_RBBM_SECVID_TRUST_CNTL, 0x0);
> >         }
> >
> > +skip_zap:
> >         /* Last step - yield the ringbuffer */
> >         a5xx_preempt_start(gpu);
> >
> > @@ -1066,6 +1111,7 @@ static void a5xx_dump(struct msm_gpu *gpu)

Thanks to you for the review.
What I've documented there about the A5xx chips having ZAP and the ones not
having it, came out after a research in the downstream KGSL driver, where qcom
does this distinction based on just the Adreno model, which is the main reason
why I did it like that :)))

I am personally not aware of any A5xx chip having this behavior, so that's why I
didn't even try to think different about this patch. It just seemed to
be the right
thing to do...
