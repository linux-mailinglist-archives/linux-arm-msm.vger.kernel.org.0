Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AAAA495AED
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jan 2022 08:38:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245347AbiAUHh6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 Jan 2022 02:37:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231687AbiAUHh5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 Jan 2022 02:37:57 -0500
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com [IPv6:2607:f8b0:4864:20::732])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57E75C061574
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Jan 2022 23:37:57 -0800 (PST)
Received: by mail-qk1-x732.google.com with SMTP id z10so9040498qkf.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Jan 2022 23:37:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/NsTFmbJRFMqEPN6TQaECc+hiLY0/v9eV3DVPhW44GY=;
        b=PuWCb9iH9vKdzPSOA+cnzoC5jXVWy1AxxiEArf+ovVTKyq6Rs8b9hRdqqysFgZO3RH
         6HR5CHUYtgLvFzY41BzyTZnhtdVBI2dlVkadACZfkbJeiCHh8hOkTRlnPN/l9GmSI+Id
         mQu8TpqBpn8pYss2p8mm2Ylw68LDjOSh/YPOoMT5GrYBX3FVUnHxnSWIv6AHbc9CKyFq
         pRXqz33+o2U+kCAOOqq+fJMR9aPYxAqjwLWxTsOR8seSgKB1lER2TEf8VRXONBQKR7Ee
         zKn4EwFBihlTG3TooPkxvtIHW9a0KRVMGmir3ujmoCXdA3mwiVVcMurDL3u1o7Oh92lF
         /mBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/NsTFmbJRFMqEPN6TQaECc+hiLY0/v9eV3DVPhW44GY=;
        b=nhtmkIh9wZvt51+aKoqVnODN+agVaTpPxq7EVeQZ9VMXEQmmQjMqzdu57L9jdZFSyJ
         eAouT5MDVqp3SSqGLk8E6vOmz9lsfhvJ+NmwAmdfpq5OV6RnoHALaajdLrnw09Nea8at
         0fxE7W7xGCDERsBNdrwb8J0K5dZBXquyhxqgo7/H79xoqf9+QhrTHPKifzy06JHSWf8V
         rMO8UBJCbpWYX0Dn3vqRDnfX0qP+LjRzSkofsOToKclUdv/E4IS87N+59pGHh+gwMlVZ
         2kT6TNjW+tEqViL1ZuguzqNeJdAIO9RETyTJO85xAbYBzjdAN2w605IbPRowX7YPkPk3
         1SCA==
X-Gm-Message-State: AOAM531UM5Gvdvk0aNQc445HVXP5FTbguIp7vR25m+ToYVkApI2ImLDj
        6MLqxHW0YbhMqCpiTte1GAfewP4P1Fm9WnTrTiaoeQ==
X-Google-Smtp-Source: ABdhPJw9OZfOWatupIhHHWLCFkKsSFA5JB0Def6mqorRivdXWOXbcfFf1iqBjl+UybZDdM37TVcPw1r6mgO0fI/hWGM=
X-Received: by 2002:a37:a211:: with SMTP id l17mr1812465qke.593.1642750676511;
 Thu, 20 Jan 2022 23:37:56 -0800 (PST)
MIME-Version: 1.0
References: <20220119221616.3089119-1-dmitry.baryshkov@linaro.org>
 <20220119221616.3089119-3-dmitry.baryshkov@linaro.org> <CAE-0n53=vj53a_u-5rUmrhV79_-c=F5gtjbejoVs+=PR=hc1Nw@mail.gmail.com>
In-Reply-To: <CAE-0n53=vj53a_u-5rUmrhV79_-c=F5gtjbejoVs+=PR=hc1Nw@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 21 Jan 2022 10:37:45 +0300
Message-ID: <CAA8EJprSTDhox33q0d37NQVKrkdhh+Ubq5_8wXqgstFkr_EtaQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] drm/msm/dpu: simplify clocks handling
To:     Stephen Boyd <swboyd@chromium.org>
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

On Fri, 21 Jan 2022 at 07:30, Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Dmitry Baryshkov (2022-01-19 14:16:15)
> > diff --git a/drivers/gpu/drm/msm/msm_io_utils.c b/drivers/gpu/drm/msm/msm_io_utils.c
> > index 7b504617833a..5533c87c7158 100644
> > --- a/drivers/gpu/drm/msm/msm_io_utils.c
> > +++ b/drivers/gpu/drm/msm/msm_io_utils.c
> > @@ -5,6 +5,8 @@
> >   * Author: Rob Clark <robdclark@gmail.com>
> >   */
> >
> > +#include <linux/clk/clk-conf.h>
> > +
> >  #include "msm_drv.h"
> >
> >  /*
> > @@ -47,6 +49,54 @@ struct clk *msm_clk_get(struct platform_device *pdev, const char *name)
> >         return clk;
> >  }
> >
> > +int msm_parse_clock(struct platform_device *pdev, struct clk_bulk_data **clocks)
> > +{
> > +       u32 i, rc = 0;
> > +       const char *clock_name;
> > +       struct clk_bulk_data *bulk;
> > +       int num_clk = 0;
>
> No need to assign and then reassign before testing. Same goes for 'rc'.

Ack

>
> > +
> > +       if (!pdev)
> > +               return -EINVAL;
> > +
> > +       num_clk = of_property_count_strings(pdev->dev.of_node, "clock-names");
> > +       if (num_clk <= 0) {
> > +               pr_debug("clocks are not defined\n");
> > +               return 0;
> > +       }
> > +
> > +       bulk = devm_kcalloc(&pdev->dev, num_clk, sizeof(struct clk_bulk_data), GFP_KERNEL);
> > +       if (!bulk)
> > +               return -ENOMEM;
> > +
> > +       for (i = 0; i < num_clk; i++) {
> > +               rc = of_property_read_string_index(pdev->dev.of_node,
> > +                                                  "clock-names", i,
> > +                                                  &clock_name);
> > +               if (rc) {
> > +                       DRM_DEV_ERROR(&pdev->dev, "Failed to get clock name for %d\n", i);
> > +                       return rc;
> > +               }
> > +               bulk[i].id = devm_kstrdup(&pdev->dev, clock_name, GFP_KERNEL);
> > +       }
> > +
> > +       rc = devm_clk_bulk_get(&pdev->dev, num_clk, bulk);
>
> Use devm_clk_bulk_get_all()?

Oh, wow. I missed this API. Then this function becomes unnecessary.

>
> > +       if (rc) {
> > +               DRM_DEV_ERROR(&pdev->dev, "Failed to get clock refs %d\n", rc);
> > +               return rc;
> > +       }
> > +
> > +       rc = of_clk_set_defaults(pdev->dev.of_node, false);
>
> Why is this needed?

Both mdss and mdp devices use assigned-clocks properties, while not
being a clock provider (or a child of it).
So I assumed it should call the of_clk_set_defaults(node, false)
Not to mention that this call exists in the msm_dss_parse_clock(),
which is being refactored/replaced.

>
> > +       if (rc) {
> > +               DRM_DEV_ERROR(&pdev->dev, "Failed to set clock defaults %d\n", rc);
> > +               return rc;
> > +       }
> > +
> > +       *clocks = bulk;
> > +
> > +       return num_clk;


-- 
With best wishes
Dmitry
