Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4CE2466F51
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Dec 2021 02:51:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245390AbhLCBzO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Dec 2021 20:55:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236943AbhLCBzN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Dec 2021 20:55:13 -0500
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com [IPv6:2607:f8b0:4864:20::c2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 945D3C061759
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Dec 2021 17:51:50 -0800 (PST)
Received: by mail-oo1-xc2e.google.com with SMTP id v19-20020a4a2453000000b002bb88bfb594so530398oov.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Dec 2021 17:51:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+aU1FZVep5hNwcFj6bmAba50FjRI/ltWIZ16DYNnIGA=;
        b=N7OF2583fEDmizbOmvRYnkpfZT93YEBncq9hnq85jlidjhoMePMAp06+j5M69LuaPh
         qsId6+csYsMtmOeURg6xkLIAjj5OBVfhBZu7FArYKUzlsBWl1xx+GkYLXIQcD07l3yNI
         gz4oeJfAAB/rn6T3EuqRD8KkfgLb9n9d+uw80SM5mg3iGlJdouJpirSJ3r74iti2rkSJ
         Q/TOfHzhFo2SAEjlDox/So7yxUh8use4aDmV4kGPgMha3TvLysEWDHRNxIWnyKUZS/hl
         YKnlXCJQj28b9plcwHfb0UkriKD+Qdvi1/2ALKZSAiEnMkQNUiSuFxIZi6tso2o5ezPm
         hCBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+aU1FZVep5hNwcFj6bmAba50FjRI/ltWIZ16DYNnIGA=;
        b=RNlt6ZT+F7vuMaxgJtlSlnz8Ul82PbWw8Wct3xLScnR7dXTcpB4YNJuizMbLwFI3qc
         tr7Ge6JTnsLug2LCx9455Ob944TgdredYN2i8YgXxzGvUoNNLVF82jybeDcWMkTDUr2Y
         0/mn+aaqrf0TWCD3Z1fQVJ8DsG6p8ZjRgGtW9QCmCFdc4+if9HLSjT5Gjo9SaGyrKA4C
         Salnq02PAXW8dQChqT43t9qmMONz+JSInEguVsBbjtznl6P9UVq++amioUL42DLicGcW
         mirGdyZTPoqgGFfWcQ673VGdFvMGsIP6HM5s5HNtFLBSwqaoPLhF3Xtf+px4F3ZfajcU
         M8TA==
X-Gm-Message-State: AOAM530Xl/Cl6bErxbzHYKHHJ3sdx8/Qj/c5/fKSDzcPWxCHALc2X/VS
        VgV4CugKZq0iibQv4p4aKHbye5OOvmadVSWDyHVuyA==
X-Google-Smtp-Source: ABdhPJy+E2enGXW2BZTWyy52ObOiGXworrn7TaAu700osVmrszldA1sRllG22o2QwrneHsnoXpIe0ViKVme+U9Asy2A=
X-Received: by 2002:a4a:e155:: with SMTP id p21mr10809521oot.84.1638496309854;
 Thu, 02 Dec 2021 17:51:49 -0800 (PST)
MIME-Version: 1.0
References: <20211202222732.2453851-1-swboyd@chromium.org>
In-Reply-To: <20211202222732.2453851-1-swboyd@chromium.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 3 Dec 2021 02:51:38 +0100
Message-ID: <CACRpkdbDNYroj=RvxRhffiGLKSHD=1+LNUGpxf7bxt2rzXrMkw@mail.gmail.com>
Subject: Re: [PATCH v4 00/34] component: Make into an aggregate bus
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Arnd Bergmann <arnd@arndb.de>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Chen Feng <puck.chen@hisilicon.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Christian Gmeiner <christian.gmeiner@gmail.com>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Emma Anholt <emma@anholt.net>,
        =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        Inki Dae <inki.dae@samsung.com>,
        James Qian Wang <james.qian.wang@arm.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Joerg Roedel <joro@8bytes.org>,
        John Stultz <john.stultz@linaro.org>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Jyri Sarha <jyri.sarha@iki.fi>,
        Kai Vehmanen <kai.vehmanen@linux.intel.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-fbdev@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-pm@vger.kernel.org, Liviu Dudau <Liviu.Dudau@arm.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Mark Brown <broonie@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Russell King <linux+etnaviv@armlinux.org.uk>,
        Russell King <rmk+kernel@arm.linux.org.uk>,
        Sandy Huang <hjc@rock-chips.com>,
        Saravana Kannan <saravanak@google.com>,
        Sebastian Reichel <sre@kernel.org>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Takashi Iwai <tiwai@suse.com>,
        Tian Tao <tiantao6@hisilicon.com>,
        Tomas Winkler <tomas.winkler@intel.com>,
        Tomi Valkeinen <tomba@kernel.org>,
        Will Deacon <will@kernel.org>,
        Xinliang Liu <xinliang.liu@linaro.org>,
        Xinwei Kong <kong.kongxinwei@hisilicon.com>,
        Yong Wu <yong.wu@mediatek.com>,
        Vitaly Lubart <vitaly.lubart@intel.com>,
        Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Dec 2, 2021 at 11:27 PM Stephen Boyd <swboyd@chromium.org> wrote:

>   drm/mcde: Migrate to aggregate driver

This also works fine after the patch series.
Tested-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
