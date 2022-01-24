Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DEA11497DAD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jan 2022 12:15:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237243AbiAXLPv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Jan 2022 06:15:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232330AbiAXLPu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Jan 2022 06:15:50 -0500
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com [IPv6:2607:f8b0:4864:20::835])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C085AC06173B
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jan 2022 03:15:49 -0800 (PST)
Received: by mail-qt1-x835.google.com with SMTP id y17so19195866qtx.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jan 2022 03:15:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cUptRqDtEkkJPAHl0ynJV1wbRGCqMae2UeMqdj24E40=;
        b=ozD9KbWWkge+fKJkJPYI849+fGP9YlVD9EGKkwKfFJs7KuCKLN9oh6rahrLp7L2k5J
         KDSyAUzqF8GF2GW04tu1Hvym3Hcbje7xnixhm3IbxqsiOuHPeTY3EBrQgEjjvVmBG4HN
         10rduo9r8r6zECj4k1CJ6nkaadOR3z0eBv3goQO2moqdTj6ZM+CokAge1jxTsHrHYxxF
         NdiPGHlDNSjlb5sHkrvwHt/lUSkrpScorOogg0j6o/MTGoCLnlU5WzQVGmP8pNQtAxI1
         52jbapRmZNnsvTAgw9j5/k9xyKkLUcVUsPZ+MpkbPdqBOlG6EzbW7yjPvFI8J3k9VFp3
         R7uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cUptRqDtEkkJPAHl0ynJV1wbRGCqMae2UeMqdj24E40=;
        b=PApmnh8FtZzfCsl5GycL6P2pUTxe+szGLu7my7X28HBt9eDjPLBByElUKCLGw6xoJ0
         DUBTuoZ9jSl0MH6+UR7srOHvI+xwA/w0DHTkrsc75KS1yS6fJR9UdL+MJpKQZ36enIV0
         b81BsvpwVEhWub9emdv3jCrrYeJvFncQUqedFYfhpJsOYynpZFRGUpc+OMf9wqTt0fMS
         m6Ff3599/s6HFI/aO6uZW2uizpgIil4cp/ODHX/B8xYKPx7VVidr+q53DV7mRc+bHzBv
         MJLtdrl/Z0eQnf43PnOf6ncaxGiVYSUZ6azzEAV1Czz3EGmZcmbNxpQtm8o9neEsQ7Gd
         FoLg==
X-Gm-Message-State: AOAM533SFGx2PA5HxNocJZJdnJ0fxqZbShAiow58Kuo5YbCUzcg9D0bS
        bWqu53WTE+ed732hSXr7ghR6Pqn126RdjUk3toqOZw==
X-Google-Smtp-Source: ABdhPJwhOzuV07VQgBe5fQl8ymvUNqjpFobsJtXh++gWZGbvgvZckIMii1JjIezWZTFU2tWjY2riJOYrtiVV0UjUFbM=
X-Received: by 2002:a05:622a:241:: with SMTP id c1mr11853967qtx.295.1643022948878;
 Mon, 24 Jan 2022 03:15:48 -0800 (PST)
MIME-Version: 1.0
References: <20220119221616.3089119-1-dmitry.baryshkov@linaro.org>
 <20220119221616.3089119-3-dmitry.baryshkov@linaro.org> <CAE-0n53=vj53a_u-5rUmrhV79_-c=F5gtjbejoVs+=PR=hc1Nw@mail.gmail.com>
 <CAA8EJprSTDhox33q0d37NQVKrkdhh+Ubq5_8wXqgstFkr_EtaQ@mail.gmail.com> <CAE-0n53i6yCdFZpgZqyybP1eJEKmrry1LpPxt410fCQ_LGmJ-w@mail.gmail.com>
In-Reply-To: <CAE-0n53i6yCdFZpgZqyybP1eJEKmrry1LpPxt410fCQ_LGmJ-w@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Mon, 24 Jan 2022 14:15:37 +0300
Message-ID: <CAA8EJprLvMhzN3DZ=JnV3C0TUmrE=3XPkf6dpuV-NQm-J3CeRg@mail.gmail.com>
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

On Fri, 21 Jan 2022 at 23:44, Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Dmitry Baryshkov (2022-01-20 23:37:45)
> > On Fri, 21 Jan 2022 at 07:30, Stephen Boyd <swboyd@chromium.org> wrote:
> > >
> > > Quoting Dmitry Baryshkov (2022-01-19 14:16:15)
> > > > diff --git a/drivers/gpu/drm/msm/msm_io_utils.c b/drivers/gpu/drm/msm/msm_io_utils.c
> > > > index 7b504617833a..5533c87c7158 100644
> > > > --- a/drivers/gpu/drm/msm/msm_io_utils.c
> > > > +++ b/drivers/gpu/drm/msm/msm_io_utils.c
> >
> > >
> > > > +       if (rc) {
> > > > +               DRM_DEV_ERROR(&pdev->dev, "Failed to get clock refs %d\n", rc);
> > > > +               return rc;
> > > > +       }
> > > > +
> > > > +       rc = of_clk_set_defaults(pdev->dev.of_node, false);
> > >
> > > Why is this needed?
> >
> > Both mdss and mdp devices use assigned-clocks properties, while not
> > being a clock provider (or a child of it).
> > So I assumed it should call the of_clk_set_defaults(node, false)
>
> A device node doesn't need to be a clk provider to call
> of_clk_set_defaults(). Does the call to of_clk_set_defaults() in
> drivers/base/platform.c cover this?

I'll check if it does.

>
> > Not to mention that this call exists in the msm_dss_parse_clock(),
> > which is being refactored/replaced.
> >
>
> Indeed it's already in the code.
>
> > >
> > > > +       if (rc) {
> > > > +               DRM_DEV_ERROR(&pdev->dev, "Failed to set clock defaults %d\n", rc);
> > > > +               return rc;
> > > > +       }
> > > > +
> > > > +       *clocks = bulk;
> > > > +



-- 
With best wishes
Dmitry
