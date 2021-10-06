Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55133423651
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Oct 2021 05:35:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230317AbhJFDhN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Oct 2021 23:37:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230306AbhJFDhN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Oct 2021 23:37:13 -0400
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CAA3C06174E
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Oct 2021 20:35:20 -0700 (PDT)
Received: by mail-ot1-x334.google.com with SMTP id o27-20020a9d411b000000b005453f95356cso533218ote.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Oct 2021 20:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=2sbh8LLwhe0nCiTyzEPV2SKVkwsiELLTCq3fosoU3eY=;
        b=CjWp3tQXqVMU4eM/Dp4xP9dx5gR1kbkWFj9qKDDDpvaOnn1iV6QvRhvIhuov5BjYB/
         kZDWWfvJL0yJhr46rXLxozF9dIDwcdWEvrbO6lOlL1TSoRbAuZYJdEOjI5a6hDl81R/h
         If9IlPYsS/KlslkIn1yT84KelCrJsELo8wC41lqaaBOXvrYKkurIzZqaghU/XR2iG/Y2
         TmSkcxwCp8JIAxdhzjnxfZ46oZw9mXp57GoIgKUdQZU1dsfZz23PQ4a63kTmQurjj/5+
         J2o6gz/HN1nrrWD3ga9Ff6XLOh0yjfrO5r9XYXRgvLBNEa6/dwcXzTNN/PUnJ3g+Jpku
         ZAlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2sbh8LLwhe0nCiTyzEPV2SKVkwsiELLTCq3fosoU3eY=;
        b=lpB/edVjGPgtrpl+3XY3D303jDNP+udGKNO1uk3ZBZQOn9/gUACehqcidjOvAPb+3/
         qPw3jGgfflGartWOWChgxzeylQRKoutCHyJxzyCfcG+QzTbBoLBWsAvWPClK5PdrwZCb
         7QhFYeG1/22WcctXlv4nes7rt+sl49IadRIYrXy6lwGwLxJkkg2D2z6NLF3RgzQqaSE1
         /DVg9QKsLyfVtasytaoXoNkArkfeczuG3YPwt8xJJ2HhZHZLZ4NU3X2iT690TygM+puy
         LplvF9a+2jjl2c9nbbe0yaMkrs3j9gm167a8Se34S5j2xYqe69i+LYGDn54dFa+ABgnN
         mKrA==
X-Gm-Message-State: AOAM53394atmzLKzNFStnDRQyJdGhtP+1WrAMnkHzVXISmHa8EQhaA87
        +tbC8lOyUx/k4ehk5xLOEt1Xtg==
X-Google-Smtp-Source: ABdhPJzTy8d/HbUt5693DrCKpOktGkmrPUKavSTW1qTcXIrEfQMG1KpYwY3dDGC13/Rs5VW2onMJXA==
X-Received: by 2002:a9d:6396:: with SMTP id w22mr17247964otk.26.1633491319916;
        Tue, 05 Oct 2021 20:35:19 -0700 (PDT)
Received: from yoga ([2600:1700:a0:3dc8:c84c:8eff:fe1e:256f])
        by smtp.gmail.com with ESMTPSA id w1sm3947298ote.41.2021.10.05.20.35.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 20:35:19 -0700 (PDT)
Date:   Tue, 5 Oct 2021 22:35:16 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Abhinav Kumar <abhinavk@codeaurora.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        Kuogee Hsieh <khsieh@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/7] drm/msm/dp: Allow specifying connector_type per
 controller
Message-ID: <YV0ZdF1nMMkDDWRF@yoga>
References: <20211005231323.2663520-1-bjorn.andersson@linaro.org>
 <20211005231323.2663520-4-bjorn.andersson@linaro.org>
 <CAE-0n53bGyVSBC9zsFu9Uacp+t=56vrttq+fWj155zA_LXJbuw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAE-0n53bGyVSBC9zsFu9Uacp+t=56vrttq+fWj155zA_LXJbuw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 05 Oct 19:29 CDT 2021, Stephen Boyd wrote:

> Quoting Bjorn Andersson (2021-10-05 16:13:19)
> > As the following patches introduced support for multiple DP blocks in a
> > platform and some of those block might be eDP it becomes useful to be
> > able to specify the connector type per block.
> >
> > Although there's only a single block at this point, the array of descs
> > and the search in dp_display_get_desc() are introduced here to simplify
> > the next patch, that does introduce support for multiple DP blocks.
> >
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > ---
> >
> > Changes since v3:
> > - New patch
> > - Extended msm_dp_config with connector_type, wrapped in inner struct
> > - Refactored out of the next patch
> > - Pass the connector_type to drm_connector_init(), from yet another patch
> > - Dropped double newline and unnecessary {}
> 
> BTW, I see that we check for the connector type in debugfs.
> 
> $ git grep DRM_MODE_CONNECTOR_DisplayPort -- drivers/gpu/drm/msm/dp/
> drivers/gpu/drm/msm/dp/dp_debug.c:
> DRM_MODE_CONNECTOR_DisplayPort)
> drivers/gpu/drm/msm/dp/dp_debug.c:
> DRM_MODE_CONNECTOR_DisplayPort)
> drivers/gpu/drm/msm/dp/dp_debug.c:
> DRM_MODE_CONNECTOR_DisplayPort)
> drivers/gpu/drm/msm/dp/dp_debug.c:
> DRM_MODE_CONNECTOR_DisplayPort)
> 
> So do those need to be updated to handle either connector type?

The debugfs code loops over all the connectors for the DRM device and
skips those that aren't DisplayPort ones. So fixing this up to properly
support multiple instances in the dp_debugfs code as well should resolve
this.

Regards,
Bjorn
