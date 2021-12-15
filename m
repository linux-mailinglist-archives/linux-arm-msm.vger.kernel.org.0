Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BFFA4763DA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Dec 2021 22:00:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229744AbhLOVAU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Dec 2021 16:00:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229517AbhLOVAU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Dec 2021 16:00:20 -0500
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com [IPv6:2607:f8b0:4864:20::f31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07C4FC061574
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Dec 2021 13:00:20 -0800 (PST)
Received: by mail-qv1-xf31.google.com with SMTP id i13so21486013qvm.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Dec 2021 13:00:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Igym6TOcUBNiC180+8CB1mq81TOoAiCxf/Elmklo1Gw=;
        b=a/2+RNh3pK+JrLvCLpck3va3w4anjHVD0+0YBAgFvx8f2pAlohe0DcYchXO9SeXduM
         ev1+igfhnC6x4YhWjDMGmuLh45hjB3t5WR7S5uNyqf/gp0/EVh6KIGTD0CENNM5jyJj8
         CV9es3d6MQ3P9Ln9sR+KpdMPQ7S0yAnsg+MkPDu1W9lj3HSyl2BEo+KGyZzHaDB5BNe2
         aiQCxXVql3d+TKeaQRVpGtf+vXsvSRDl9DWMyaxJl0/2AH7WXwA/izqqp3i9n+6q1ItK
         8Sc2AowhtYP0aQTBi2jSZeeVWqe0mt4/+BF1919vlm2R0SmdjDS4KQrO5GbgdSdkSRJc
         c6iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Igym6TOcUBNiC180+8CB1mq81TOoAiCxf/Elmklo1Gw=;
        b=YY3vU0WuNw7L32Nrr3ccqy1qQ55MjS2bqP++Tx7pUHbfwjek38N0NzzjUksf0FQCVT
         18bhZZyv8q4Qhn5+lgoOyEipiAvSQ/FzgJjWQL10SHboFWdPVnab85HAkOXCrfhZTApJ
         vcmoE+T4XJmWtjjYA659oTfiB8hQu/ThljqaWEpXDezVmV2woz0pzfS59s2XMQPgQXGb
         amri+lblzOB5OppTfzUaZCZ+JFonkzXWe4EDdk8fYZnnsbV6/CLhhv1/RPqNTmbHeERl
         zgP6l8Iq6Mk1HmqzEy+tr5C0v1y3yaCxHCGgVPAwwtBuXLHv6MiWrz4HlaiFSOZJBYmG
         HVDw==
X-Gm-Message-State: AOAM531SxyWzI6zNfxXnaznCnSiiA94bqRmqh1y8j3hc/pR90p6S3/hJ
        RQVkoStB+iy1Eft1+qj/e8KRAUJB9XluyYYyVqg8lQ==
X-Google-Smtp-Source: ABdhPJyDhI9R3Txh4WJoBPNSh6gRhD71ZHtF2dgljmcfj5zlKeDw7UcLIm7GxAe+s2Lh+pPgnrjAChNfcxXxo5CYtSQ=
X-Received: by 2002:a05:6214:83:: with SMTP id n3mr13069392qvr.122.1639602019162;
 Wed, 15 Dec 2021 13:00:19 -0800 (PST)
MIME-Version: 1.0
References: <20211215174524.1742389-1-robdclark@gmail.com> <20211215174524.1742389-2-robdclark@gmail.com>
 <CAA8EJpri+3AjazR2saJaa3Uo05BhC_2gEsRXHJ5wJ81zs5AUTw@mail.gmail.com> <CAF6AEGsZmQR8FvAN5GrDT9psBsNwFL5mWRZq+i0rFcC8Zf09fQ@mail.gmail.com>
In-Reply-To: <CAF6AEGsZmQR8FvAN5GrDT9psBsNwFL5mWRZq+i0rFcC8Zf09fQ@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 16 Dec 2021 00:00:08 +0300
Message-ID: <CAA8EJpp-PurZt4_EEbZS3Xnqc9tZgBxW2p6j+k20ZUZ8NqZ2=w@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] drm/msm/disp: Tweak display snapshot to match gpu snapshot
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Guo Zhengkui <guozhengkui@vivo.com>,
        Alexey Dobriyan <adobriyan@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Fernando Ramos <greenfoo@u92.eu>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 15 Dec 2021 at 23:09, Rob Clark <robdclark@gmail.com> wrote:
>
> On Wed, Dec 15, 2021 at 11:17 AM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > On Wed, 15 Dec 2021 at 20:49, Rob Clark <robdclark@gmail.com> wrote:
> > >
> > > From: Rob Clark <robdclark@chromium.org>
> > >
> > > Add UTS_RELEASE and show timestamp the same way for consistency.
> > >
> > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> >
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >
> > > ---
> > >  drivers/gpu/drm/msm/disp/msm_disp_snapshot.h      | 4 ++--
> > >  drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c | 9 ++++++---
> > >  2 files changed, 8 insertions(+), 5 deletions(-)
> >
> > We should pull this out of disp/, it's no longer disp-specific.
>
> Or possibly just move dsi/etc into disp?  It is disp specific in the
> sense that dumping GPU state works quite differently..

Not sure about this.  dsi/hdmi/dp seem to be perfect top-level
entities. I see your point here, however I'd rather prefer to move
mdp4/mdp5/dpu1 out of disp subdir rather than pushing all non-GPU code
into disp/

When I tried to move dsi/phy to a separate phy driver, I reworked
msm_disp_snapshot by splitting some parts into lib/ code. But I can
not say that I completely liked what I did. Partially it was one of
the reasons for me not pushing the dsi/phy patchset past RFC.

-- 
With best wishes
Dmitry
