Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED43E43180C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Oct 2021 13:50:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230350AbhJRLwP convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Oct 2021 07:52:15 -0400
Received: from mail-ua1-f45.google.com ([209.85.222.45]:34588 "EHLO
        mail-ua1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229491AbhJRLwP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Oct 2021 07:52:15 -0400
Received: by mail-ua1-f45.google.com with SMTP id h4so3784127uaw.1;
        Mon, 18 Oct 2021 04:50:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=5k/lpb+l8LiCQGm9WxrBH5sQpLcaEAbjVKVFfUJrgn0=;
        b=cXd7+xHv4/YI8q2NCKEGi4EJtQDbeaf6n9wYyhxqn2VCF/q9u9jsyygdnN69nJK3CI
         iOHljqGOxuBXg5biDHRgaYPBnCdhDK547d9NTl5hqsp/wVhWdNzSOOIiEx7JNDsvkKHg
         RZ8E9Gv80Na1lB3hKSGUowT5Q4l1xGDLaeVnOvAoOZ+7lbNp2jNVLa8oSikDIDQZq0aO
         Zaw/ShX01UKDdgd391+mOcUCYOUpF2nlFcgFsuyCW4QJykmsq8hoXfxPYmdmCSBcNLcw
         Y+fREK29+bkXH8DrzRu+ub2Np1jcuhAAKuYNeRlx4n1xjNRAw1JHcvy1rnsRmUj7/Mlr
         rQrA==
X-Gm-Message-State: AOAM532ZdJXkHxMOlyzEMKkzigTetqe9qvITRrpCGvccoyGHg8rFaAHV
        OdlfCUsYhElGplz40YCzJrovF4+FQayK8g==
X-Google-Smtp-Source: ABdhPJy5xtX5yPiIpEdlxivyFzQnKS/we2003kVbgLIZyrjhBgWU1Qeru3vVbOtTGMFSPs5WI+NB4Q==
X-Received: by 2002:a9f:23e2:: with SMTP id 89mr24638342uao.44.1634557803403;
        Mon, 18 Oct 2021 04:50:03 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id 37sm8579119uac.20.2021.10.18.04.50.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Oct 2021 04:50:02 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id f4so5191835uad.4;
        Mon, 18 Oct 2021 04:50:01 -0700 (PDT)
X-Received: by 2002:ab0:538a:: with SMTP id k10mr25439724uaa.14.1634557801457;
 Mon, 18 Oct 2021 04:50:01 -0700 (PDT)
MIME-Version: 1.0
References: <20211013144308.2248978-1-arnd@kernel.org> <25ccdc75-67da-a955-b8ef-641a2f007d13@amd.com>
 <CAMuHMdWKp-v=df0JA_tr-YgNnyfu7NS9dA3Zr+bqwZX9JuBAGQ@mail.gmail.com> <ad5d95ab-7cb5-aef7-9904-eda0befe8519@amd.com>
In-Reply-To: <ad5d95ab-7cb5-aef7-9904-eda0befe8519@amd.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 18 Oct 2021 13:49:50 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVW3eBAozRLcWXfeh20ycC4sjfrjPv+yrf89xLSM0VMpQ@mail.gmail.com>
Message-ID: <CAMuHMdVW3eBAozRLcWXfeh20ycC4sjfrjPv+yrf89xLSM0VMpQ@mail.gmail.com>
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

On Mon, Oct 18, 2021 at 1:41 PM Christian König
<christian.koenig@amd.com> wrote:
> Am 18.10.21 um 13:38 schrieb Geert Uytterhoeven:
> > On Mon, Oct 18, 2021 at 1:37 PM Christian König
> > <christian.koenig@amd.com> wrote:
> >> Am 13.10.21 um 16:42 schrieb Arnd Bergmann:
> >>> From: Arnd Bergmann <arnd@arndb.de>
> >>>
> >>> When CONFIG_COMMON_CLOCK is disabled, the 8996 specific
> >>> phy code is left out, which results in a link failure:
> >>>
> >>> ld: drivers/gpu/drm/msm/hdmi/hdmi_phy.o:(.rodata+0x3f0): undefined reference to `msm_hdmi_phy_8996_cfg'
> >>>
> >>> This was only exposed after it became possible to build
> >>> test the driver without the clock interfaces.
> >>>
> >>> Make COMMON_CLK a hard dependency for compile testing,
> >>> and simplify it a little based on that.
> >>>
> >>> Fixes: b3ed524f84f5 ("drm/msm: allow compile_test on !ARM")
> >>> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> >>> Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
> >>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> >>> ---
> >>>    drivers/gpu/drm/msm/Kconfig  | 2 +-
> >>>    drivers/gpu/drm/msm/Makefile | 6 +++---
> >>>    2 files changed, 4 insertions(+), 4 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
> >>> index f5107b6ded7b..cb204912e0f4 100644
> >>> --- a/drivers/gpu/drm/msm/Kconfig
> >>> +++ b/drivers/gpu/drm/msm/Kconfig
> >>> @@ -4,8 +4,8 @@ config DRM_MSM
> >>>        tristate "MSM DRM"
> >>>        depends on DRM
> >>>        depends on ARCH_QCOM || SOC_IMX5 || COMPILE_TEST
> >>> +     depends on COMMON_CLK
> >>>        depends on IOMMU_SUPPORT
> >> We also need a "depends on MMU" here because some automated test is now
> >> trying to compile the driver on parisc as well.
> >>
> >> I have absolutely no idea how a platform can have IOMMU but no MMU
> >> support but it indeed seems to be the case here.
> > Huh?
> >
> > Parisc has config MMU def_bool y?
>
> Then why vmap isn't available?
>
> See the mail thread: [linux-next:master 3576/7806]
> drivers/gpu/drm/msm/msm_gem.c:624:20: error: implicit declaration of
> function 'vmap'

You mean https://lore.kernel.org/all/202110141259.i36iJnsA-lkp@intel.com/?

Hexagon != parisc.
.
And Hexagon also has config MMU def_bool y

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
