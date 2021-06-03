Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25B8439AB1A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jun 2021 21:54:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229702AbhFCT4C (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Jun 2021 15:56:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:36044 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229576AbhFCT4B (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Jun 2021 15:56:01 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E280F6140B;
        Thu,  3 Jun 2021 19:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622750056;
        bh=A8bTRZWGyUBja/MSUQ29VA/mAZj6QtYjbvJCbANIqsE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=lfvGW1xaIASaWdfnsj8Xa660kIIT0mmbK6felqgEx4EDG7tPnuUtWGLq9bZeqboYv
         jFvKEAaYpYW6PQOCOemYaLD6rVqaUJmOPXUycexgYypJfAlqP1xhsXpPhj2AD6fGgE
         iOAZbfFS2LGvC0fw2keWywTtHxmEkVsSa5/RR0djNImU9X2aZtCSVY5pViIUIC+7MU
         AYBLRvSSIkgyKad41421ycs7ejiZ1pdWOJMQJYtt6D8qItdbbJI89CpbkYfsaKPBLb
         mGpj8e8CkhwtWk0dhrRb/AiSG6CcvKzb6zYq4JfvZ2Zvbzw+RRp0UHjrjQ6u3Mkr6i
         XrlU86O1/zRgg==
Received: by mail-ej1-f51.google.com with SMTP id ho18so31006ejc.8;
        Thu, 03 Jun 2021 12:54:16 -0700 (PDT)
X-Gm-Message-State: AOAM530rYgqkTinWhdF8evwklIuiAH8n/hHsIFY8sI/8En2vNX1hh5vf
        +Jf4QmA1EAHrvK6STo0IO6AR143rEtEmJ1V3fQ==
X-Google-Smtp-Source: ABdhPJwDQD3xcAB0EXKWI0UDWW+ahHSVny9rQ0wOAWpa2cEgFyxpNPLRRrZrFwuDL+b/HEK8on4d0VTBOUxATJD7qJU=
X-Received: by 2002:a17:906:fa13:: with SMTP id lo19mr895806ejb.468.1622750055293;
 Thu, 03 Jun 2021 12:54:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210602215252.695994-1-keescook@chromium.org>
 <20210602215252.695994-4-keescook@chromium.org> <CAL_JsqLO_YbT3VU0+uHH2t6ONs_dWfBhqds9okYD0254ZiBf=A@mail.gmail.com>
In-Reply-To: <CAL_JsqLO_YbT3VU0+uHH2t6ONs_dWfBhqds9okYD0254ZiBf=A@mail.gmail.com>
From:   Rob Herring <robh@kernel.org>
Date:   Thu, 3 Jun 2021 14:54:03 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLF6WhsoSWtxVUqUPDRMM8qwGwZqWa_xtNqsVyq8OCz6w@mail.gmail.com>
Message-ID: <CAL_JsqLF6WhsoSWtxVUqUPDRMM8qwGwZqWa_xtNqsVyq8OCz6w@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/pl111: depend on CONFIG_VEXPRESS_CONFIG
To:     Kees Cook <keescook@chromium.org>
Cc:     Dave Airlie <airlied@redhat.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Arnd Bergmann <arnd@kernel.org>,
        kernel test robot <lkp@intel.com>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Emma Anholt <emma@anholt.net>, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>,
        Linus Walleij <linus.walleij@linaro.org>,
        Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jun 3, 2021 at 1:42 PM Rob Herring <robh@kernel.org> wrote:
>
> On Wed, Jun 2, 2021 at 4:53 PM Kees Cook <keescook@chromium.org> wrote:
> >
> > Avoid randconfig build failures by requiring VEXPRESS_CONFIG:
> >
> > aarch64-linux-gnu-ld: drivers/gpu/drm/pl111/pl111_versatile.o: in function `pl111_vexpress_clcd_init':
> > pl111_versatile.c:(.text+0x220): undefined reference to `devm_regmap_init_vexpress_config'
>
> pl111_vexpress_clcd_init() starts with:
>
> if (!IS_ENABLED(CONFIG_VEXPRESS_CONFIG))
>                 return -ENODEV;
>
> Isn't that supposed to be enough to avoid an undefined reference?
>
> Making the whole file depend on VEXPRESS_CONFIG is not right either.
> Not all platforms need it.

Specifically, these defconfigs will break as they all use PL111 but
don't need nor enable VEXPRESS_CONFIG:

arch/arm/configs/integrator_defconfig:CONFIG_DRM_PL111=y
arch/arm/configs/lpc18xx_defconfig:CONFIG_DRM_PL111=y
arch/arm/configs/lpc32xx_defconfig:CONFIG_DRM_PL111=y
arch/arm/configs/nhk8815_defconfig:CONFIG_DRM_PL111=y
arch/arm/configs/realview_defconfig:CONFIG_DRM_PL111=y
arch/arm/configs/spear3xx_defconfig:CONFIG_DRM_PL111=y
arch/arm/configs/versatile_defconfig:CONFIG_DRM_PL111=y

These defconfigs should all be failing with the same error, but don't
from what I've tried nor have I seen any kernelci failures.

Rob
