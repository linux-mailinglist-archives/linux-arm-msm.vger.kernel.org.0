Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4265C39AA54
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jun 2021 20:43:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230063AbhFCSox (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Jun 2021 14:44:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:54282 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230062AbhFCSow (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Jun 2021 14:44:52 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id BDA4F6140A;
        Thu,  3 Jun 2021 18:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622745787;
        bh=USxB1GUo0FH2y+jIZNXtT5R5mYI6uflcFyqqOHML5LI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=cOUOi6kVZyTQziNZP4IOA20rGx+v2VMq0RxjXpPuazkQBCgQ63+LXcgP1SItpKEzH
         sIKQ2ZRjE6FkBhCIhxeC0Y8oWIodIwylK0bRtW+ncSd+PjwI7e/yGpmg2NwP2mRQ+G
         VQF9bJC12Z0T3Z/75N2RowBLZoJSOwzDjWVkFCKgsGr6YeufoLfbO64NdoeeimXliU
         XfYnz8jTtppv3qObkH3elzuoSf7/q6kFL58cZuJTVrTbGoIuj7vfl/tzTGBPPVjRzy
         7YWAB7tm2DIF7ofUjbFRAlOvCidc8o3ZrSjRI6DLtZdUXTSmBUnHtWWnve9tZaMvn/
         wn/86//qBivbQ==
Received: by mail-ed1-f42.google.com with SMTP id cb9so8317656edb.1;
        Thu, 03 Jun 2021 11:43:07 -0700 (PDT)
X-Gm-Message-State: AOAM531CRUZht7DUf+soS7Va7MxN/uuW/CZe5YO9iSroKg7+xqUFibpa
        PKKJFyUu/XOp8pNvl9HBinXdf+TDUmRUVZGNPQ==
X-Google-Smtp-Source: ABdhPJwi939S5IBhvU2azqo7VfjLNGUzwzJRRoDtktVigBtogK8CpoEwyyszR1U6mwciX2x8gNbXDoaVANKFA/s+SOo=
X-Received: by 2002:aa7:cd83:: with SMTP id x3mr791218edv.373.1622745786232;
 Thu, 03 Jun 2021 11:43:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210602215252.695994-1-keescook@chromium.org> <20210602215252.695994-4-keescook@chromium.org>
In-Reply-To: <20210602215252.695994-4-keescook@chromium.org>
From:   Rob Herring <robh@kernel.org>
Date:   Thu, 3 Jun 2021 13:42:54 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLO_YbT3VU0+uHH2t6ONs_dWfBhqds9okYD0254ZiBf=A@mail.gmail.com>
Message-ID: <CAL_JsqLO_YbT3VU0+uHH2t6ONs_dWfBhqds9okYD0254ZiBf=A@mail.gmail.com>
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
        Sharat Masetty <smasetty@codeaurora.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jun 2, 2021 at 4:53 PM Kees Cook <keescook@chromium.org> wrote:
>
> Avoid randconfig build failures by requiring VEXPRESS_CONFIG:
>
> aarch64-linux-gnu-ld: drivers/gpu/drm/pl111/pl111_versatile.o: in function `pl111_vexpress_clcd_init':
> pl111_versatile.c:(.text+0x220): undefined reference to `devm_regmap_init_vexpress_config'

pl111_vexpress_clcd_init() starts with:

if (!IS_ENABLED(CONFIG_VEXPRESS_CONFIG))
                return -ENODEV;

Isn't that supposed to be enough to avoid an undefined reference?

Making the whole file depend on VEXPRESS_CONFIG is not right either.
Not all platforms need it.

>
> Fixes: 826fc86b5903 ("drm: pl111: Move VExpress setup into versatile init")
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
>  drivers/gpu/drm/pl111/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/pl111/Kconfig b/drivers/gpu/drm/pl111/Kconfig
> index 80f6748055e3..c5210a5bef1b 100644
> --- a/drivers/gpu/drm/pl111/Kconfig
> +++ b/drivers/gpu/drm/pl111/Kconfig
> @@ -2,7 +2,7 @@
>  config DRM_PL111
>         tristate "DRM Support for PL111 CLCD Controller"
>         depends on DRM
> -       depends on ARM || ARM64 || COMPILE_TEST
> +       depends on VEXPRESS_CONFIG
>         depends on COMMON_CLK
>         select DRM_KMS_HELPER
>         select DRM_KMS_CMA_HELPER
> --
> 2.25.1
>
