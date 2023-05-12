Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0FDD1700436
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 May 2023 11:46:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239781AbjELJqH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 May 2023 05:46:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240618AbjELJpx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 May 2023 05:45:53 -0400
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51D8511D8A
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 May 2023 02:45:45 -0700 (PDT)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-55a20a56a01so171934777b3.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 May 2023 02:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683884744; x=1686476744;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SeNDNqSbKtT4juprQIPOMJ5pas9h2iCUoYs/y7tb/+s=;
        b=GtZrqROkH4ZfxGqVx3hrHf4l23PetZ6CMy4woniilPGVWRB8G4rBVVXin8SU4uHEVE
         wtZY3W1oMghoYi0guVodFnlz+uaCahv0XpFAQuvWhtuOwpHYzDzLdczdRUBnyFe0UMnY
         ztzXOPBi7FwwlScghGzKcZOUHy28qYMiHNbWYDdhvyVDU1bi+zqLAaW30ayjTfc5VAix
         MdfGcZ9GWL8VrtC6wj/+gnSAsIGxP/u4QEo67j1tEoedMw500PsRi70JcBCPSeS4tVaz
         wItCQ8APNkxcAOsobVaDsVv67krITCKIYm9EhKTCjpaneEn6E6xTcNKaC8nPgAFpqcIo
         aE5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683884744; x=1686476744;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SeNDNqSbKtT4juprQIPOMJ5pas9h2iCUoYs/y7tb/+s=;
        b=LnQ3wpoivpIG7QiO377NiOHiyxg7pLAgJ1C+DnFMGRKh3kFh+agHgx3FQhtX6HIBVn
         Jz53Lp24PI5q5cG7Vzjr12hZDQIXbRsCQuCzPQdH8IvAjUnGRNNX8kagH/U/AK1tgf2R
         Yj4Uwv6qW/KcGLp2cJUHezhR6A+uX95atqlLcmVuZg6FEKLuyabcZnKTPcS0f9HMFLPt
         VQW8WEcJ/Yh5B6z2A1iMCFlazN8qRCxeiWuQRilPl0RemjpkxxCBifouc/NSzdLr4Bsn
         S7P9vpEG5ITMi10oyjYW7dehI8RWVSmLyMN8KbawiFU2l/OkLC5UYBa8Owq54X1ymy5f
         7yyg==
X-Gm-Message-State: AC+VfDwQXYzsUp7RK/MO/+ND1MJuFYA/M90/pP9Evzcx2qqCPTIz0jjg
        Y96xoF/vNtDVLD+7cPwe0dyG33yUUa3tfJqBvbFW0xki1puuERG+2nA=
X-Google-Smtp-Source: ACHHUZ6lutSExTqyZsU/hQjFKIAv55bPUWGU0TtTWdM/WQJARaWIZ1aV+bmHH/6SrdqtE4Nhmy+pjSm4iiG39PZWMJU=
X-Received: by 2002:a0d:d691:0:b0:539:1b13:3d64 with SMTP id
 y139-20020a0dd691000000b005391b133d64mr23654781ywd.48.1683884744449; Fri, 12
 May 2023 02:45:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230512084152.31233-1-tzimmermann@suse.de> <20230512084152.31233-7-tzimmermann@suse.de>
In-Reply-To: <20230512084152.31233-7-tzimmermann@suse.de>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 12 May 2023 12:45:33 +0300
Message-ID: <CAA8EJpr8oGfmZ0f49W6C23K=EOWW0a-E4tzyn+U23sYkPeaArQ@mail.gmail.com>
Subject: Re: [PATCH 06/11] drm/msm: Use regular fbdev I/O helpers
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     daniel@ffwll.ch, airlied@gmail.com,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        javierm@redhat.com, dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        amd-gfx@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 12 May 2023 at 11:41, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Use the regular fbdev helpers for framebuffer I/O instead of DRM's
> helpers. Msm does not use damage handling, so DRM's fbdev helpers
> are mere wrappers around the fbdev code.
>
> Add CONFIG_DRM_MSM_FBDEV_EMULATION to select the necessary
> Kconfig options automatically. Make fbdev emulation depend on
> the new config option.
>
> By using fbdev helpers directly within each DRM fbdev emulation,
> we can eventually remove DRM's wrapper functions entirely.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Sean Paul <sean@poorly.run>
> ---
>  drivers/gpu/drm/msm/Kconfig     |  9 +++++++++
>  drivers/gpu/drm/msm/Makefile    |  2 +-
>  drivers/gpu/drm/msm/msm_drv.h   |  2 +-
>  drivers/gpu/drm/msm/msm_fbdev.c | 12 +++++++-----
>  4 files changed, 18 insertions(+), 7 deletions(-)


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
