Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A978A49668A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jan 2022 21:45:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230285AbiAUUo7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 Jan 2022 15:44:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230196AbiAUUo7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 Jan 2022 15:44:59 -0500
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EA65C06173D
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Jan 2022 12:44:56 -0800 (PST)
Received: by mail-oi1-x232.google.com with SMTP id x193so15360853oix.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Jan 2022 12:44:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=nNz54uRGsVGq1YmuK1HNWWa+LTEnTSopROjQ2zq4zm0=;
        b=m1s4c2vAOxuTO6Lu0LPAgPXMbmvG4gd3tc9bw2TM7FE1U0bPUh6bhXhmEHwvv+fZCl
         z8Z3w303cT/YXM52NPJsTMCWCLGbrmzpF9ha986eX6m7fhkNLbIyDgGxrs92a+Bx8fND
         7aLwNyV2nnstJzfLFfJEZeC31paYHI71CeT5o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=nNz54uRGsVGq1YmuK1HNWWa+LTEnTSopROjQ2zq4zm0=;
        b=AIjMW1a88mF6SN7L6tvx1VrgXAhOgOgTVlYYFEFBN+NPw9ufuUfcQLwpLZo8kumU2H
         3HxGgByJNFRPnmRJJlm0piowhiJ7ziFDGQfRr+SYlT7CxpTCMc32hYFO+dYDo4PfpM9Z
         RIG/49339MOHJVQNrZOZbVkftKCIP3xWfJ99weUKoDDW7RUMWMcEg1AgrvkfodUWZ8+1
         ybMdGtPO54LIpq8C/CmcCY65jJdi7DNrh+JqNMEFvpawC6VimK7neq0IW3vxGKUhPc9/
         20mLx7IM99LnLnLnI+09mWb1MPzFGBrAaTFKTl2DLohw/RTykrr2kHSuOB5RI22fonAb
         CuPw==
X-Gm-Message-State: AOAM530YOY8/cQFSbEChlrk5XbsB1yDYenWKm8tKNpERuNx7Tr398RCJ
        tp/rTwETBzXfORoWg2BX+SNjwHZdQAMvNKlSetF8Jw==
X-Google-Smtp-Source: ABdhPJzDcldej/njJqo9IkYjzGOwjYvA2xC1t1LUcIdHN8PEmwRwA+T0bX98AEPzf48OgQoQSBKj/6v9PKUCO5XIZlI=
X-Received: by 2002:a05:6808:cc:: with SMTP id t12mr2046276oic.32.1642797894159;
 Fri, 21 Jan 2022 12:44:54 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 21 Jan 2022 12:44:53 -0800
MIME-Version: 1.0
In-Reply-To: <CAA8EJprSTDhox33q0d37NQVKrkdhh+Ubq5_8wXqgstFkr_EtaQ@mail.gmail.com>
References: <20220119221616.3089119-1-dmitry.baryshkov@linaro.org>
 <20220119221616.3089119-3-dmitry.baryshkov@linaro.org> <CAE-0n53=vj53a_u-5rUmrhV79_-c=F5gtjbejoVs+=PR=hc1Nw@mail.gmail.com>
 <CAA8EJprSTDhox33q0d37NQVKrkdhh+Ubq5_8wXqgstFkr_EtaQ@mail.gmail.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Fri, 21 Jan 2022 12:44:53 -0800
Message-ID: <CAE-0n53i6yCdFZpgZqyybP1eJEKmrry1LpPxt410fCQ_LGmJ-w@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] drm/msm/dpu: simplify clocks handling
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2022-01-20 23:37:45)
> On Fri, 21 Jan 2022 at 07:30, Stephen Boyd <swboyd@chromium.org> wrote:
> >
> > Quoting Dmitry Baryshkov (2022-01-19 14:16:15)
> > > diff --git a/drivers/gpu/drm/msm/msm_io_utils.c b/drivers/gpu/drm/msm/msm_io_utils.c
> > > index 7b504617833a..5533c87c7158 100644
> > > --- a/drivers/gpu/drm/msm/msm_io_utils.c
> > > +++ b/drivers/gpu/drm/msm/msm_io_utils.c
>
> >
> > > +       if (rc) {
> > > +               DRM_DEV_ERROR(&pdev->dev, "Failed to get clock refs %d\n", rc);
> > > +               return rc;
> > > +       }
> > > +
> > > +       rc = of_clk_set_defaults(pdev->dev.of_node, false);
> >
> > Why is this needed?
>
> Both mdss and mdp devices use assigned-clocks properties, while not
> being a clock provider (or a child of it).
> So I assumed it should call the of_clk_set_defaults(node, false)

A device node doesn't need to be a clk provider to call
of_clk_set_defaults(). Does the call to of_clk_set_defaults() in
drivers/base/platform.c cover this?

> Not to mention that this call exists in the msm_dss_parse_clock(),
> which is being refactored/replaced.
>

Indeed it's already in the code.

> >
> > > +       if (rc) {
> > > +               DRM_DEV_ERROR(&pdev->dev, "Failed to set clock defaults %d\n", rc);
> > > +               return rc;
> > > +       }
> > > +
> > > +       *clocks = bulk;
> > > +
