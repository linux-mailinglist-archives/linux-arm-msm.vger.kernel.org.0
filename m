Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9378750B96A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Apr 2022 16:03:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1448292AbiDVOGV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 22 Apr 2022 10:06:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1448185AbiDVOGT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 22 Apr 2022 10:06:19 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D3465A15D
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Apr 2022 07:03:26 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id y21so3668786edo.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Apr 2022 07:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XXfqebKK5B9iW+cuu7Wrx8oyDP/rWO517FbDuh8GYTA=;
        b=EwnC0F+Pg4MtRzeeWPuywGVVfrIfoQpkjZejmyOOhaV3NRtb5XzudpYoMW98fIdcAm
         NUM6hR06S3J+6kzWZeWdVcyZdI0Toqj/vsaUJ+zpNTbPAQhBWPEucmWtE0wTHtBDsJ05
         p7cS3QW5VSa1GBar/5aair5GlO7o2wDtoN4xo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XXfqebKK5B9iW+cuu7Wrx8oyDP/rWO517FbDuh8GYTA=;
        b=11doCLxpbQYbrroA2H9uSE5WrW8+rmywmCMpZQnke/watVZmB+hmNjqacC7oKNzizU
         PzxK6IH4M+7GMgXQNSQv4Ik8t644dMfoXRyvWcI4MaubpcOldbdsAxpuNIc9xIcELTOn
         J1SSygL4BD8FFu9oBW5qtjds9LZTb7rI9gfzhbU066q5oj6Pk7p8xaf8BM/DIkC70D7s
         oGxxXNoCrLVkOHzaaZr7J4AOo7mVEjoSxdPLGLmgxpAINsaZa75I365AVbRWGiVn4U3r
         +dVBrICYZVz+u7uzumXgJnIu7x3nbHrJUc15zP6vjbeU3fdSx8+rvcENoob+y3Gacxhj
         CCTg==
X-Gm-Message-State: AOAM533MPWovH4QTE1J8ce3ubgP0fxnDTVE6fX+cxIeSCIg2GLIpXxcX
        qhA0s/45FinRRqtnexraajwNkspPY/FIwXHvkGU=
X-Google-Smtp-Source: ABdhPJzfO9bBnegq9GSW01OejVkjKir8TOjfZ9hu1QXwZ0eyc9OH9rVNXugUfpHP8WmOOLkmXkN1vA==
X-Received: by 2002:a50:a6d4:0:b0:41d:77aa:d876 with SMTP id f20-20020a50a6d4000000b0041d77aad876mr5063002edc.48.1650636204408;
        Fri, 22 Apr 2022 07:03:24 -0700 (PDT)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com. [209.85.221.43])
        by smtp.gmail.com with ESMTPSA id u12-20020aa7d54c000000b00423e004bf9asm930414edr.86.2022.04.22.07.03.22
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Apr 2022 07:03:22 -0700 (PDT)
Received: by mail-wr1-f43.google.com with SMTP id m14so11215854wrb.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Apr 2022 07:03:22 -0700 (PDT)
X-Received: by 2002:a5d:6506:0:b0:20a:c240:90e2 with SMTP id
 x6-20020a5d6506000000b0020ac24090e2mr3855081wru.342.1650636201140; Fri, 22
 Apr 2022 07:03:21 -0700 (PDT)
MIME-Version: 1.0
References: <1650618666-15342-1-git-send-email-quic_sbillaka@quicinc.com> <1650618666-15342-2-git-send-email-quic_sbillaka@quicinc.com>
In-Reply-To: <1650618666-15342-2-git-send-email-quic_sbillaka@quicinc.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 22 Apr 2022 07:03:07 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U9M_qsEacBHundgZAHMg7NEnW1LKZX6niN4fmsKUwt6A@mail.gmail.com>
Message-ID: <CAD=FV=U9M_qsEacBHundgZAHMg7NEnW1LKZX6niN4fmsKUwt6A@mail.gmail.com>
Subject: Re: [PATCH v9 1/4] drm/msm/dp: Add eDP support via aux_bus
To:     Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Clark <robdclark@gmail.com>,
        Sean Paul <seanpaul@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        quic_kalyant <quic_kalyant@quicinc.com>,
        "Abhinav Kumar (QUIC)" <quic_abhinavk@quicinc.com>,
        "Kuogee Hsieh (QUIC)" <quic_khsieh@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        quic_vproddut <quic_vproddut@quicinc.com>,
        "Aravind Venkateswaran (QUIC)" <quic_aravindh@quicinc.com>,
        Steev Klimaszewski <steev@kali.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Apr 22, 2022 at 2:11 AM Sankeerth Billakanti
<quic_sbillaka@quicinc.com> wrote:
>
> This patch adds support for generic eDP sink through aux_bus. The eDP/DP
> controller driver should support aux transactions originating from the
> panel-edp driver and hence should be initialized and ready.
>
> The panel bridge supporting the panel should be ready before the bridge
> connector is initialized. The generic panel probe needs the controller
> resources to be enabled to support the aux transactions originating from
> the panel probe.
>
> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> ---
> Changes in v9:
>   - add comments for panel probe
>   - modify the error handling checks
>
> Changes in v8:
>   - handle corner cases
>   - add comment for the bridge ops
>
> Changes in v7:
>   - aux_bus is mandatory for eDP
>   - connector type check modified to just check for eDP
>
> Changes in v6:
>   - Remove initialization
>   - Fix aux_bus node leak
>   - Split the patches
>
>  drivers/gpu/drm/msm/dp/dp_display.c | 73 +++++++++++++++++++++++++++++++++++--
>  drivers/gpu/drm/msm/dp/dp_display.h |  1 +
>  drivers/gpu/drm/msm/dp/dp_drm.c     | 21 +++++++++--
>  drivers/gpu/drm/msm/dp/dp_parser.c  | 23 +-----------
>  drivers/gpu/drm/msm/dp/dp_parser.h  | 13 ++++++-
>  5 files changed, 101 insertions(+), 30 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
