Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 782D238D532
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 May 2021 12:36:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230265AbhEVKhd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 22 May 2021 06:37:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230186AbhEVKha (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 22 May 2021 06:37:30 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F668C061574
        for <linux-arm-msm@vger.kernel.org>; Sat, 22 May 2021 03:36:05 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id p20so26982065ljj.8
        for <linux-arm-msm@vger.kernel.org>; Sat, 22 May 2021 03:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uEhRMz+h4s+U252SiXX0wJyFMC3DU6kb4X4RIqT3O+Y=;
        b=zz4FoFVJqy8UtrEZzcqoNqGE/xS1BRFRsXQ/rs1MIjHMJNz7zpJvBNzE902fPGbdRH
         ZDN4vaUJ+D+oxbTlgdvAXqZr0a1sJsK4q5nVUnKtAaukoduVKLUj75FB7wJX61IQ65cS
         TpgC0DcZXzi+PomwBK/TipbXqCXYXd9pm3NzITCVNSaMuumN2TKm3fVmQmOzcXuAlJgv
         3Lo8Tbxjhpfa448yBf4cCqmmcCBchyla8VHgeDiH2rOGkXV/3bg529Hj3ur6MaqsIuzS
         WlAl2Zc79g7PXqs+DgPwSqqvS0R9nAJ7IKXibuzp0GZ/izx5MmzmmTM7eiyhOBEjjj7w
         vDAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uEhRMz+h4s+U252SiXX0wJyFMC3DU6kb4X4RIqT3O+Y=;
        b=Vt/Dm1I2GwkRv9yL4iEr1agOeHMvh2vqBhfdd5GF7kE7Iwfp8pXW6VqomvspofeBRg
         ZJlt0yIVu5O58SWizz9IoJNIyfrAB+nSok+CbVT9MZd4B67M0LhOMF5+QwjlnhvjyMzi
         6+w1+zyBroiQh6YgTvuwkp5Hrf4ykHavJFqGDuLvwzM6G0Omq93kniFb24H8C9ljgWls
         1hECC4Omxzud9esomInyeYxXfZChrUvj4hR9YYDFJO5zLm0XzWe7sVSKkKJrrIbroAVk
         OXuXVvkeC0wLxKd+kT+eBmASZkBCZUCyURay+lI2V+eqjNZ4lqtM/R/d6PXtGfenWHO+
         i1bA==
X-Gm-Message-State: AOAM533tmZR4JPAjK5VgK281fuulPkujgL8SfvoY34CkL+Vhfcap/Men
        4V+uBCrZ4lc2cdUXHk3NzupPuiEvA6zoYslQk/2aSA==
X-Google-Smtp-Source: ABdhPJxycv64EJ7V1TCZmsfzdpdPw+UifhMakV61YhCiGLTIcrIBnId4CHLWEyyg2ghmKXaVDG5iILa/Ym8q0MXZZsM=
X-Received: by 2002:a2e:81d0:: with SMTP id s16mr10522164ljg.74.1621679763505;
 Sat, 22 May 2021 03:36:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210517200907.1459182-1-dianders@chromium.org> <20210517130450.v7.8.Ib5fe0638da85800141ce141bb8e441c5f25438d4@changeid>
In-Reply-To: <20210517130450.v7.8.Ib5fe0638da85800141ce141bb8e441c5f25438d4@changeid>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 22 May 2021 12:35:52 +0200
Message-ID: <CACRpkdYYw5yH2LF7PQ_eQRR6VdfGthUdTBrrrqN-0wc+A39WnA@mail.gmail.com>
Subject: Re: [PATCH v7 08/10] drm/bridge: ti-sn65dsi86: Add support for the DP
 AUX bus
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Sam Ravnborg <sam@ravnborg.org>,
        Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
        Lyude Paul <lyude@redhat.com>,
        Thierry Reding <treding@nvidia.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        Rob Clark <robdclark@chromium.org>,
        Steev Klimaszewski <steev@kali.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Robert Foss <robert.foss@linaro.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, May 17, 2021 at 10:09 PM Douglas Anderson <dianders@chromium.org> wrote:

> We want to provide our panel with access to the DP AUX channel. The
> way to do this is to let our panel be a child of ours using the fancy
> new DP AUX bus support.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

That's neat.
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
