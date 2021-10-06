Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9227C4234FE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Oct 2021 02:29:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230218AbhJFAbk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Oct 2021 20:31:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236909AbhJFAbh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Oct 2021 20:31:37 -0400
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E6FFC061749
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Oct 2021 17:29:46 -0700 (PDT)
Received: by mail-ot1-x32c.google.com with SMTP id 66-20020a9d0548000000b0054e21cd00f4so905730otw.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Oct 2021 17:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=rJXZL/E2rjizDw2g+xUTHgR6xfpHLrz6baH//WpupIA=;
        b=eILFxHdQkwHM2kDcZ7UcWGBVC7H2Pu2GtoXIw+Mf1tmpqUPjk0FxN9egL2wcdGHjmQ
         +TKV21OleaafcJGX/LlBIYkxSSU6MkgB7ayxOOdJpYOdNbeXmMUXrv6DIdkyfT7ip8yV
         xevbRV4FwvKdg7BuJcnjAihYLxXU3fqbBhPIo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=rJXZL/E2rjizDw2g+xUTHgR6xfpHLrz6baH//WpupIA=;
        b=ci+dv6e58/ADraBOGs31jqRKqVYr+vEJM7gdk91E8PYNQ+0yAKyUjuilqNgr7ogIVm
         4r5/eCewYTVHRiTByKvIcj0a1mitPRa3WJoUMRFpeeQhqVk7xDatIUINDxsWkKMFd30E
         +DTx0Ya1VljOdMWB4gHrJ4CdVtOYcXMu4Qgr6dxwmLn9B4JarthjRhVTaS8xFxdiqNKc
         WQWbQcE2WBbo7G8nJP43pETKtmCP68HmfzegPvvUxiiYRH/jvNAez0z6FMLsVOaFgFeB
         d1vuyXXDZKsj8nG42IIvGrstpM0qyaHXyDd4zYNd9rlBy8fMlNFIQU05vy1MTH9A1t43
         HRZQ==
X-Gm-Message-State: AOAM531huqFf2PxfRtdVfm52p+qD9K9AcfAKkAx6U9JDmCSu7kD+ESNj
        UAciUilzbPCCJk4iP+BplnXhNTZDeQ6DsLsNxIcUxw==
X-Google-Smtp-Source: ABdhPJxzCxjnxno+e1ko51qFrcaIW6A2GioGxAa2xz6r8QTE5XFA3HZvXeCGDv6WRirQFECvcUk6zhmJwJvvexsKQPo=
X-Received: by 2002:a9d:1f4:: with SMTP id e107mr16724345ote.77.1633480185918;
 Tue, 05 Oct 2021 17:29:45 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 5 Oct 2021 17:29:45 -0700
MIME-Version: 1.0
In-Reply-To: <20211005231323.2663520-4-bjorn.andersson@linaro.org>
References: <20211005231323.2663520-1-bjorn.andersson@linaro.org> <20211005231323.2663520-4-bjorn.andersson@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Tue, 5 Oct 2021 17:29:45 -0700
Message-ID: <CAE-0n53bGyVSBC9zsFu9Uacp+t=56vrttq+fWj155zA_LXJbuw@mail.gmail.com>
Subject: Re: [PATCH v4 3/7] drm/msm/dp: Allow specifying connector_type per controller
To:     Abhinav Kumar <abhinavk@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        Kuogee Hsieh <khsieh@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Bjorn Andersson (2021-10-05 16:13:19)
> As the following patches introduced support for multiple DP blocks in a
> platform and some of those block might be eDP it becomes useful to be
> able to specify the connector type per block.
>
> Although there's only a single block at this point, the array of descs
> and the search in dp_display_get_desc() are introduced here to simplify
> the next patch, that does introduce support for multiple DP blocks.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>
> Changes since v3:
> - New patch
> - Extended msm_dp_config with connector_type, wrapped in inner struct
> - Refactored out of the next patch
> - Pass the connector_type to drm_connector_init(), from yet another patch
> - Dropped double newline and unnecessary {}

BTW, I see that we check for the connector type in debugfs.

$ git grep DRM_MODE_CONNECTOR_DisplayPort -- drivers/gpu/drm/msm/dp/
drivers/gpu/drm/msm/dp/dp_debug.c:
DRM_MODE_CONNECTOR_DisplayPort)
drivers/gpu/drm/msm/dp/dp_debug.c:
DRM_MODE_CONNECTOR_DisplayPort)
drivers/gpu/drm/msm/dp/dp_debug.c:
DRM_MODE_CONNECTOR_DisplayPort)
drivers/gpu/drm/msm/dp/dp_debug.c:
DRM_MODE_CONNECTOR_DisplayPort)

So do those need to be updated to handle either connector type?
