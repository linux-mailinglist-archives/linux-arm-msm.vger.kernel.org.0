Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF7D0431792
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Oct 2021 13:38:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229519AbhJRLkg convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Oct 2021 07:40:36 -0400
Received: from mail-vk1-f174.google.com ([209.85.221.174]:42898 "EHLO
        mail-vk1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229491AbhJRLkf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Oct 2021 07:40:35 -0400
Received: by mail-vk1-f174.google.com with SMTP id o42so8390342vkf.9;
        Mon, 18 Oct 2021 04:38:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=MmeKk08TSs7bRjJ5MxCz8dFyhSFfnwP05dCVlXuAOs4=;
        b=rGJ19l4ep+FCrF2i6ZFriMYoWZUTxFLwCdpyZetabcNvtIt7x8ieOi4KCBmtMN344/
         //a3/ViUAoesZhOAJ4qH1RkkjNg8Mn1ZczWNQXUJoefM9e1DbZmZ5CYmeE17sCuFwaO5
         i8bcjYtAlW3NV/NaREoKXRGqDpCwK9gTLjD3dt5ZIRkLK2PnB0wOfUpJNRnx95h8Z/Ca
         Pcxyyv4nT48CHVCA0frisNQvXJCHRkxm+cGJ1UlFJRTnNxC2mW1EdY4kBBzeBfAQtgcZ
         G5cPgwI49PaXOPaky0yZxK6jSDJed2pFP5xTItjW4X3MuKW4pyooORFvKds5/zv9s5pg
         DEKw==
X-Gm-Message-State: AOAM532FEIz7Hr1qlf05V9VlB6bpbLV5tno7SsFX6wbevdXp0FiYBg9o
        9U8rCZSAVTqpyN00sLvvqke4FP29dTJk1A==
X-Google-Smtp-Source: ABdhPJwAQE2i81QclXtGa9rFQpHYXaAm4dJIUzoQW46+F+SGZm0PSWq5hwrp2KwDcv+KVLyHJwz+ug==
X-Received: by 2002:a1f:bf86:: with SMTP id p128mr23532712vkf.23.1634557104233;
        Mon, 18 Oct 2021 04:38:24 -0700 (PDT)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id k1sm8483749uaq.0.2021.10.18.04.38.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Oct 2021 04:38:23 -0700 (PDT)
Received: by mail-ua1-f54.google.com with SMTP id e10so5137111uab.3;
        Mon, 18 Oct 2021 04:38:23 -0700 (PDT)
X-Received: by 2002:a9f:29a5:: with SMTP id s34mr19126482uas.122.1634557103412;
 Mon, 18 Oct 2021 04:38:23 -0700 (PDT)
MIME-Version: 1.0
References: <20211013144308.2248978-1-arnd@kernel.org> <25ccdc75-67da-a955-b8ef-641a2f007d13@amd.com>
In-Reply-To: <25ccdc75-67da-a955-b8ef-641a2f007d13@amd.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 18 Oct 2021 13:38:12 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWKp-v=df0JA_tr-YgNnyfu7NS9dA3Zr+bqwZX9JuBAGQ@mail.gmail.com>
Message-ID: <CAMuHMdWKp-v=df0JA_tr-YgNnyfu7NS9dA3Zr+bqwZX9JuBAGQ@mail.gmail.com>
Subject: Re: [PATCH] drm: msm: fix building without CONFIG_COMMON_CLK
To:     =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc:     Arnd Bergmann <arnd@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, Arnd Bergmann <arnd@arndb.de>,
        Randy Dunlap <rdunlap@infradead.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Alex Elder <elder@linaro.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Rajeev Nandan <rajeevny@codeaurora.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        freedreno@lists.freedesktop.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Christian,

On Mon, Oct 18, 2021 at 1:37 PM Christian König
<christian.koenig@amd.com> wrote:
> Am 13.10.21 um 16:42 schrieb Arnd Bergmann:
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > When CONFIG_COMMON_CLOCK is disabled, the 8996 specific
> > phy code is left out, which results in a link failure:
> >
> > ld: drivers/gpu/drm/msm/hdmi/hdmi_phy.o:(.rodata+0x3f0): undefined reference to `msm_hdmi_phy_8996_cfg'
> >
> > This was only exposed after it became possible to build
> > test the driver without the clock interfaces.
> >
> > Make COMMON_CLK a hard dependency for compile testing,
> > and simplify it a little based on that.
> >
> > Fixes: b3ed524f84f5 ("drm/msm: allow compile_test on !ARM")
> > Reported-by: Randy Dunlap <rdunlap@infradead.org>
> > Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > ---
> >   drivers/gpu/drm/msm/Kconfig  | 2 +-
> >   drivers/gpu/drm/msm/Makefile | 6 +++---
> >   2 files changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
> > index f5107b6ded7b..cb204912e0f4 100644
> > --- a/drivers/gpu/drm/msm/Kconfig
> > +++ b/drivers/gpu/drm/msm/Kconfig
> > @@ -4,8 +4,8 @@ config DRM_MSM
> >       tristate "MSM DRM"
> >       depends on DRM
> >       depends on ARCH_QCOM || SOC_IMX5 || COMPILE_TEST
> > +     depends on COMMON_CLK
> >       depends on IOMMU_SUPPORT
>
> We also need a "depends on MMU" here because some automated test is now
> trying to compile the driver on parisc as well.
>
> I have absolutely no idea how a platform can have IOMMU but no MMU
> support but it indeed seems to be the case here.

Huh?

Parisc has config MMU def_bool y?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
