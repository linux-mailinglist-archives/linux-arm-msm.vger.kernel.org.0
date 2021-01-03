Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 685232E8CCC
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Jan 2021 16:25:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726166AbhACPZN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 3 Jan 2021 10:25:13 -0500
Received: from mail.kernel.org ([198.145.29.99]:51054 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725819AbhACPZM (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 3 Jan 2021 10:25:12 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2991820DD4;
        Sun,  3 Jan 2021 15:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609687472;
        bh=PkxCfVAK1mU9lAnzMRgUnNY+tZkM5cdrGKVYeYeZQfs=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=nM14NocJIXjCDAv/WeYZnCRvMV4nYFr2+7NmbfdggtjczPtgf2Ayq6IZyepf6Pzgi
         PWlrLWgKb3QG0A7UItK7dGRcWVEBTgsepnQDJBBSzBPXIJhMdJ5qD0skAvbK0TbxNl
         j6jYtvxyL5tzCCdH46oOK66vN5ckBb6uYlybOOkQ8DBBixPffdOdFK70zA+yMDylDA
         RtUIZ5IrBBW2Us3oirA6FU1Ls7yS7YJepZdpebRuVFR5ovC56ElMdrzhozwpbrJFKx
         Z552BFUfof2noaGECiCIXOb48sfPdn5TT/nSWOET6AKyRBKWe+SI6ioHmQy99/0Wo4
         PrWVEdihyhP7A==
Received: by mail-ot1-f46.google.com with SMTP id x13so23778267oto.8;
        Sun, 03 Jan 2021 07:24:32 -0800 (PST)
X-Gm-Message-State: AOAM531MkSJCSjAE8ZdhKp6uQUuOC14aO7txaivsFZr7N8PTbzqFOVyo
        gWi56QIneE5sKtvyXo3h+OGDpVpFnNSbzEpKucI=
X-Google-Smtp-Source: ABdhPJz95Zoo7hs0fgWSGuBSw4TFIHrMmsws3bDhs/4QvBOJqa2tGLYNJbcBF3Y/CRnqXiQFFzx7ry43uZ8TpAz/2vI=
X-Received: by 2002:a05:6830:1e14:: with SMTP id s20mr50123366otr.210.1609687471466;
 Sun, 03 Jan 2021 07:24:31 -0800 (PST)
MIME-Version: 1.0
References: <20210103140407.3917405-1-arnd@kernel.org> <202101032327.9BXJpAn8-lkp@intel.com>
In-Reply-To: <202101032327.9BXJpAn8-lkp@intel.com>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Sun, 3 Jan 2021 16:24:15 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3jUQs6c5tESSNMbqfuymewj9FhqRizyHcfOXf8Rgy-nA@mail.gmail.com>
Message-ID: <CAK8P3a3jUQs6c5tESSNMbqfuymewj9FhqRizyHcfOXf8Rgy-nA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/a6xx: add CONFIG_QCOM_LLCC dependency
To:     kernel test robot <lkp@intel.com>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        kbuild-all@lists.01.org, Arnd Bergmann <arnd@arndb.de>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Tanmay Shah <tanmay@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Jan 3, 2021 at 4:09 PM kernel test robot <lkp@intel.com> wrote:
>
> Hi Arnd,
>
> I love your patch! Yet something to improve:
>
> [auto build test ERROR on linus/master]
> [also build test ERROR on v5.11-rc1 next-20201223]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
>
> url:    https://github.com/0day-ci/linux/commits/Arnd-Bergmann/drm-msm-a6xx-add-CONFIG_QCOM_LLCC-dependency/20210103-220704
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 3516bd729358a2a9b090c1905bd2a3fa926e24c6
> config: i386-randconfig-m021-20210103 (attached as .config)
> compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
> reproduce (this is a W=1 build):
>         # https://github.com/0day-ci/linux/commit/7d8b8d7954012e210a5e6c77103e52382c6b5503
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Arnd-Bergmann/drm-msm-a6xx-add-CONFIG_QCOM_LLCC-dependency/20210103-220704
>         git checkout 7d8b8d7954012e210a5e6c77103e52382c6b5503
>         # save the attached .config to linux build tree
>         make W=1 ARCH=i386
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
> >> drivers/gpu/drm/Kconfig:74:error: recursive dependency detected!
>    drivers/gpu/drm/Kconfig:74: symbol DRM_KMS_HELPER is selected by DRM_MSM
>    drivers/gpu/drm/msm/Kconfig:3: symbol DRM_MSM depends on QCOM_COMMAND_DB
>    drivers/soc/qcom/Kconfig:19: symbol QCOM_COMMAND_DB depends on OF_RESERVED_MEM
>    drivers/of/Kconfig:80: symbol OF_RESERVED_MEM default is visible depending on DMA_CMA
>    kernel/dma/Kconfig:109: symbol DMA_CMA is selected by FB_HYPERV
>    drivers/video/fbdev/Kconfig:2182: symbol FB_HYPERV depends on FB
>    drivers/video/fbdev/Kconfig:12: symbol FB is selected by DRM_KMS_FB_HELPER
>    drivers/gpu/drm/Kconfig:80: symbol DRM_KMS_FB_HELPER depends on DRM_KMS_HELPER
>    For a resolution refer to Documentation/kbuild/kconfig-language.rst
>    subsection "Kconfig recursive dependency limitations"

Ah, this depends on another patch of mine that I have in my randconfig tree, to
replace the 'select FB' in DRM_KMS_FB_HELPER with 'depends on FB'.

Should I resend that patch, or would someone suggest a different fix for
the CONFIG_QCOM_LLCC dependency issue?

       Arnd
