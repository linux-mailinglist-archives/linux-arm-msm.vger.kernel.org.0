Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E78E9BB9B6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Sep 2019 18:37:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732803AbfIWQhI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Sep 2019 12:37:08 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:44436 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732791AbfIWQhI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Sep 2019 12:37:08 -0400
Received: by mail-ed1-f65.google.com with SMTP id r16so13461595edq.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Sep 2019 09:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AzOvb+CR6n9M7ydQuBNn3e5hknn5JrutCbIdi70g14w=;
        b=arTAXO72zQWqNoIewCdlFShr3hdePLAZT0OxiH3NTJ+VMPpfr/8ShkCndcnND7nJne
         4iPtD34AR5LV4F+6yR/Et262opJFmBpWWtZwcRM68G3jHewuy8K/AWCWTvsjbFk1JFO8
         ruz2ti6hY8yU6f34lOAd9PsIlD6pb8uLUDqkETjCnprQPU5XgWBb4Y1MacCgKtdLSdrE
         VNTVzXLoQAeGcXn9zEQCBA0pTY54oH/D5GCKHjEkoiqYRr7CEl0Er56I6h1mu1b0afaY
         RGKNz4Dc/9KjtF5pGu5E+UNa7uB3yN35LAhqYG+9S9hlYlhmvQYYrlgfTFYoQ5OMluAE
         I+Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AzOvb+CR6n9M7ydQuBNn3e5hknn5JrutCbIdi70g14w=;
        b=WVIO9AxUOE+ezV7BQ/WQedOqX0bNRhg22Nb/i2VEbgleTRpANgpqDl+MMj6vZti2KD
         W8IcWRiTdaCpPiVekGwm6aXfRSO5cNdyI+DuaHGw5+9snoZVqVfGUIGXrd+mbaq8l/Jw
         M80ixfgs1Xw+2qzJgEP1IUzUck3DlUVwrhmM7qqhwogBIIFOaRJ6qpPppVeoH8IkqpO4
         q6r7CLeSauvSAURXeTKfH5qXFmSz5uVBGN3VQtnyKv05Gjw8aOgp03AqcsSKabwgUReP
         WB8i5Ybgv/Q7MVfRC6ZyGyYBE+iZUvRZHxLVq/Ng2P9KfRxBXplBXaJPeHRz1pIsMQwO
         cdrg==
X-Gm-Message-State: APjAAAX7Kx18NuhXddwv2SI8qgZeNyFrV+ErLuQCoZHgM6pN0IuR0JXA
        fmEWOkXJiq1MAIjFOfcmFI42oAZGZPz00rJvChg=
X-Google-Smtp-Source: APXvYqxWfrz0qRsnrNH3/0kbg+vYVEbd8HAudj2GMAjEnMAlXwETqV0X/IUNs82ZpkmKwWDl8Qm0m415a24M/qFaQqo=
X-Received: by 2002:a50:935d:: with SMTP id n29mr1041431eda.294.1569256625735;
 Mon, 23 Sep 2019 09:37:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190921100439.64402-1-kholk11@gmail.com> <20190921100439.64402-6-kholk11@gmail.com>
In-Reply-To: <20190921100439.64402-6-kholk11@gmail.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Mon, 23 Sep 2019 09:36:54 -0700
Message-ID: <CAF6AEGubLrqmc5s3hYrYyygx0z2hDYrAfsqTSetmtUJy6rq-kQ@mail.gmail.com>
Subject: Re: [PATCH 5/5] drm/msm/adreno: Add support for Adreno 510 GPU
To:     kholk11@gmail.com
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

On Sat, Sep 21, 2019 at 3:04 AM <kholk11@gmail.com> wrote:
>
> From: "Angelo G. Del Regno" <kholk11@gmail.com>
>
> The Adreno 510 GPU is a stripped version of the Adreno 5xx,
> found in low-end SoCs like 8x56 and 8x76, which has 256K of
> GMEM, with no GPMU nor ZAP.
> Also, since the Adreno 5xx part of this driver seems to be
> developed with high-end Adreno GPUs in mind, and since this
> is a lower end one, add a comment making clear which GPUs
> which support is not implemented yet is not using the GPMU
> related hw init code, so that future developers will not go
> crazy with that.
>
> By the way, the lower end Adreno GPUs with no GPMU are:
> A505/A506/A510 (no ZAP firmware)
> A508/A509/A512 (with ZAP firmware)
>

Hi, thanks for the patch.. one comment below about zap firmware...
which is not completely to do with this patch, but is my thoughts on
how we should clean up zap handling

> Signed-off-by: Angelo G. Del Regno <kholk11@gmail.com>

[snip]

> @@ -679,7 +716,8 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
>
>         a5xx_preempt_hw_init(gpu);
>
> -       a5xx_gpmu_ucode_init(gpu);
> +       if (!adreno_is_a510(adreno_gpu))
> +               a5xx_gpmu_ucode_init(gpu);
>
>         ret = a5xx_ucode_init(gpu);
>         if (ret)
> @@ -712,12 +750,18 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
>         }
>
>         /*
> -        * Try to load a zap shader into the secure world. If successful
> +        * If the chip that we are using does support loading one, then
> +        * try to load a zap shader into the secure world. If successful
>          * we can use the CP to switch out of secure mode. If not then we
>          * have no resource but to try to switch ourselves out manually. If we
>          * guessed wrong then access to the RBBM_SECVID_TRUST_CNTL register will
>          * be blocked and a permissions violation will soon follow.
>          */
> +       if (adreno_is_a510(adreno_gpu)) {
> +               gpu_write(gpu, REG_A5XX_RBBM_SECVID_TRUST_CNTL, 0x0);
> +               goto skip_zap;
> +       }

This is something we need to cleanup on a6xx as well.  But it is
actually possible to have the same GPU with and without zap.  We have
this situation today with sdm845, for example.

What I'd like to do is rather than guess whether we can write
RBBM_SECVID_TRUST_CNTL or not (since that goes spectacularly wrong
when we guess incorrectly), is choose based on the presence of the
zap-shader child node in dtb.  (Currently a6xx tries to choose based
on whether zap firmware is present.. which we need to fix.)

Originally I was thinking we could keep the zap-shader node in the
SoC's "core" dtsi (ie. msm8996.dtsi, sdm845.dtsi, etc) and using
/delete-node/ in per-device dts files for devices without zap.. but
(AFAIU) the zap shader ends up being signed with a vendor key in most
cases, meaning that to have a "generic" (not device-specific) distro
image need to have different zap file names/paths for devices from
different vendors.  Given this, I think it makes more sense to move
the zap-shader node into a per-device (or at least, per-vendor) dts
file, ie. something like:

   /* sdm850-lenovo-yoga-c630.dts: */
  gpu {
     zap-shader {
        memory-region = <&gpu_mem>;
        zap-prefix = "LENOVO";
    };
  };

which would trigger the driver to try to load
/lib/firmware/qcom/LENOVO/a630_zap.mbn

(I'd like to, at least for devices that have ACPI/SMBIOS tables,
standardize on using the vendor name from SMBIOS tables as this
prefix.. so we have a way to construct the firmware path if we
eventually have ACPI boot support on the aarch64 laptops.)

BR,
-R

> +
>         ret = a5xx_zap_shader_init(gpu);
>         if (!ret) {
>                 OUT_PKT7(gpu->rb[0], CP_SET_SECURE_MODE, 1);
> @@ -733,6 +777,7 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
>                 gpu_write(gpu, REG_A5XX_RBBM_SECVID_TRUST_CNTL, 0x0);
>         }
>
> +skip_zap:
>         /* Last step - yield the ringbuffer */
>         a5xx_preempt_start(gpu);
>
> @@ -1066,6 +1111,7 @@ static void a5xx_dump(struct msm_gpu *gpu)
