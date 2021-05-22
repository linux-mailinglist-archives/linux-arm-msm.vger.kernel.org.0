Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 339B338D52D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 May 2021 12:34:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230216AbhEVKgI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 22 May 2021 06:36:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230168AbhEVKgH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 22 May 2021 06:36:07 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B65BAC061574
        for <linux-arm-msm@vger.kernel.org>; Sat, 22 May 2021 03:34:41 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id t17so10267099ljd.9
        for <linux-arm-msm@vger.kernel.org>; Sat, 22 May 2021 03:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GYUGb+Vmff9gIUFyntVd0FDSDvGjX/ufL9sA1nyH3vE=;
        b=BoJ8q46zkHwgiqwqQriO/CkcH2ITeLf1ezMGx+UzZ8wDLGLO89xIOlJochoYDjDjWD
         VKfN6KnYmFLB6KSnYwg+92T2S7iOLUicG+XA/VkwSPkDfLa0WoMwqCiNkWhUogFjad74
         m6WXkkfcz9fq/r+HAtrmj/7OmM2bIeWOW1c7iMm5v8+ZHPQBbU5g2oeV2FQZj8sFlhI5
         Vxayp7bWj1GlHkAtIK5GTCSwY8mn0K8RTEfO50R/b0+ozUyYoiTomGDigFs5riqELBa5
         Y8zobRoz3tuQhl8Kc5/PykT1s7cppXe7/V2Hke6tIKBaDMkyYY23avqaiUk98xQ5gFcU
         2B+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GYUGb+Vmff9gIUFyntVd0FDSDvGjX/ufL9sA1nyH3vE=;
        b=Xsl3AaDNV3+AZKynnbyhWa4TQkFynJdk07ee2di9Yjxzq94JbH0RVq1pvt4tmg0J3+
         gBBsnd1tyDVaJJI+Ql8yGLNw25w3P6MDziweSC8LecnXJqWKGSxP2mLwkpHFfkWDxYFH
         UNrfewyix+3HgHV3VHRuT7bXyRO7mljJt+4ZGNyHCdlOoIxzZKBPzmXwoFSbCO3iORki
         uLCgo0fOCIYCWyxPSlOFJNI8KFPAjYX5BJvegnF7KU5pur2QTA+W/pumyetMzxpceOQ+
         jdWRTckDUUCpXZ3YakgNrm7rvhgWQhX9DVfGBHE4/CzLtMAA98IxdyEYM0N5wxWYGI+G
         u/Kw==
X-Gm-Message-State: AOAM533wIQDWWbOPb+BoeOUwRQL00mBu0fjylaYIfAIMC6FblV/7e0WW
        Eit/WfY1xc0t4mlf4WoBGM+74YJZlLnYwodXJMDeoQ==
X-Google-Smtp-Source: ABdhPJz+ibDLMNP419ZZFrjVh+qJ+I+wQfZgaVgBBcDbk/aF9PHnxGEBejFwxuPQTBjJzM6NkcCaBX514iUfRyBvKSw=
X-Received: by 2002:a2e:889a:: with SMTP id k26mr9933011lji.438.1621679679967;
 Sat, 22 May 2021 03:34:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210517200907.1459182-1-dianders@chromium.org> <20210517130450.v7.4.I787c9ba09ed5ce12500326ded73a4f7c9265b1b3@changeid>
In-Reply-To: <20210517130450.v7.4.I787c9ba09ed5ce12500326ded73a4f7c9265b1b3@changeid>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 22 May 2021 12:34:28 +0200
Message-ID: <CACRpkda_MTBrXR-as5t_Ji8mU4=95NQ_GTDtjcERncm9yS1moA@mail.gmail.com>
Subject: Re: [PATCH v7 04/10] drm: Introduce the DP AUX bus
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
        Rajeev Nandan <rajeevny@codeaurora.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, May 17, 2021 at 10:09 PM Douglas Anderson <dianders@chromium.org> wrote:

> Historically "simple" eDP panels have been handled by panel-simple
> which is a basic platform_device. In the device tree, the panel node
> was at the top level and not connected to anything else.
>
> Let's change it so that, instead, panels can be represented as being
> children of the "DP AUX bus". Essentially we're saying that the
> hierarchy that we're going to represent is the "control" connections
> between devices. The DP AUX bus is a control bus provided by an eDP
> controller (the parent) and consumed by a device like a panel (the
> child).
>
> The primary incentive here is to cleanly provide the panel driver the
> ability to communicate over the AUX bus while handling lifetime issues
> properly. The panel driver may want the AUX bus for controlling the
> backlight or querying the panel's EDID.
>
> The idea for this bus's design was hashed out over IRC [1].
>
> [1] https://people.freedesktop.org/~cbrill/dri-log/?channel=dri-devel&date=2021-05-11
>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Rajeev Nandan <rajeevny@codeaurora.org>
> Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

I like the concept and the general idea behind this, clean and
helpful design.
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
