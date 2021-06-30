Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBF1C3B7B0D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jun 2021 02:36:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235695AbhF3AjK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Jun 2021 20:39:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235637AbhF3AjK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Jun 2021 20:39:10 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B65DCC061767
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jun 2021 17:36:41 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id a18so1653626lfs.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jun 2021 17:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jtVW5NMocB6oVI0WMovmBROwRBfdKl6IUOMqibW9evQ=;
        b=PfDwdfd658Y+9K8gvsYqLkb06cvO9vPX5vmZFKpgJfEU1JV8IJOHOPB/fT9gQgKia4
         CkwaR7y+3Y3sRHa1Ei3aG16+gGPQ8ellOWAofRnxXTxEphjDYqv1CvVWGiY1H2QyxJlO
         LNN65ZIV4H4+qPr/vzxELakfbfrYCNxdUuw8FlW01wdyTO9QgR55wE2WFhtmfVqmraX1
         6dsMXQqqoSbmasHFViuFkp9x9AiAQBLFBuy8aCFxO5dfncSXXyX55TVezt+pCUhXsQ8J
         9lI0d6qy92Ma9mvUYjuBxQjQw4ace0MWZURMPTZr0T5fK/9N6n3m5y70GsyXUxOFlmCr
         SukQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jtVW5NMocB6oVI0WMovmBROwRBfdKl6IUOMqibW9evQ=;
        b=NFo6xOD5WFywTWcT538A3/UBstAIOQcqI6aVZWwGKMeCdf2UxpMQwkmPfhtUpkDdOU
         RAo81ulK9mFCp9I0aSDNQ4/OMpoD8S28eqPBnQM1mO5J2DlBJmNKFKIcpUJ9tzvZVIRb
         9Zb7+aAAYgzxGKdsZTrVnR744gXvkV0RGQcvuqE7u8Ryu8/iP00v6lcpvNUR88/5SY2u
         eeg/k8TI3zPG5HYtD9N7l8Pg/SVaY4bk9X63jtYpIiN/fQjvBPUWBjdPzUTcjDFOiUSw
         Z90ndP6l2vKVUqyVAwRdc0wYy82WYlzlff6NQ26Q31MO6vOfNDavnrP9m1tDOJSfiUWM
         mYnw==
X-Gm-Message-State: AOAM5315qHTTPpVGs1KR5f3cIMT34mHaci/iEglRxGtmjIrU7I6jjVAa
        2c4s82SvhmFuUzdeICBgeDyR0dH8vDPfkW5Z8p7OMQ==
X-Google-Smtp-Source: ABdhPJz8oylr1QBk4wbq+S09hbJVugu5jPx8c6IPCGHmiauvztZvUu2BOO8drcRIghnbm2IY/6t/MC8MygbdQHfkED4=
X-Received: by 2002:a05:6512:3c9f:: with SMTP id h31mr15414133lfv.465.1625013399992;
 Tue, 29 Jun 2021 17:36:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210629074703.v2.1.I629b2366a6591410359c7fcf6d385b474b705ca2@changeid>
In-Reply-To: <20210629074703.v2.1.I629b2366a6591410359c7fcf6d385b474b705ca2@changeid>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 30 Jun 2021 02:36:28 +0200
Message-ID: <CACRpkdbRjg1PMMWPc_5fW+PKG4SQGkaesK4++MHUWTw0MdMkxg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/dsi: Add _NO_ to MIPI_DSI_* flags disabling features
To:     Nicolas Boichat <drinkcat@chromium.org>
Cc:     Andrzej Hajda <a.hajda@samsung.com>,
        Robert Foss <robert.foss@linaro.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Adrien Grassein <adrien.grassein@gmail.com>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Inki Dae <inki.dae@samsung.com>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Pi-Hsun Shih <pihsun@chromium.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>, Sean Paul <sean@poorly.run>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Tzung-Bi Shih <tzungbi@google.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Xin Ji <xji@analogixsemi.com>,
        Yangtao Li <tiny.windzz@gmail.com>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jun 29, 2021 at 1:47 AM Nicolas Boichat <drinkcat@chromium.org> wrote:

> Many of the DSI flags have names opposite to their actual effects,
> e.g. MIPI_DSI_MODE_EOT_PACKET means that EoT packets will actually
> be disabled. Fix this by including _NO_ in the flag names, e.g.
> MIPI_DSI_MODE_NO_EOT_PACKET.
>
> Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
