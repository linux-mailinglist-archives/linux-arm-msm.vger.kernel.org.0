Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 855AF258663
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Sep 2020 05:42:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726323AbgIADmN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Aug 2020 23:42:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726112AbgIADmM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Aug 2020 23:42:12 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A243C0612FE;
        Mon, 31 Aug 2020 20:42:11 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id w5so7904936wrp.8;
        Mon, 31 Aug 2020 20:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gEP+l6VmZ2AQhT9y6MxnJyCmEVijpcWpEhbN/rykvcE=;
        b=CWrOGraZ3/zNXixoJEwLA3hwBYU2PWVJEJ6ylxVJux52OFGXCCNEGTUhC6mkNsNKpA
         i1TXATaF9rTSGwMaVqrUu1Zz/Y1O9y1drCGCIQXqHRHg9tOaU+j7fvsU/CuvZxVlMMw5
         jVxSR6ue24PPOYOWBejC9MloKJqqT/iDlRnzo7+6cRlhm0s17nQW9Gh2F7FrU9ZfvUxp
         kAj8AgciZRjeU/IJPsUe/joigfP+Mc6xw8KC+pdmtDdlV3fkmAR0oIVELnk2GPlk1ru0
         iqtKfLijhcQEQ37e9PwlNuKupuMgl1u6xVjd2ZRO3vozd8LXzB4Mr45MwWeEmJ4j6Osg
         kkIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gEP+l6VmZ2AQhT9y6MxnJyCmEVijpcWpEhbN/rykvcE=;
        b=EweFKDjX+clP5mxkMY0DlaoNwLVBNJILyvXJReUJD49WiHllT60lCeDlLkD+/agiSA
         zE+90OUpJmDgwN+w+yz6Jo2FKR8XrwQf+HCJDZRS7xCssR8E34/06jgUurOuKvpKGelG
         xjHb7H3a1RPM3vCBEpTL+18kTNE3h+Dyb8aAY4LdadWmSx8JP8mo4mGnI9KmLhnUydAi
         t6fXwdTHRl392S0pSYnoJhy7KO8JGoZ2w5rCcvBQ9+36Z2yEGUoOxHfnd4u+psjKFb5L
         NLVQHgFb0BNPuLNEnjte4XP9BJRwWiMbjTf0CFJck4POvkfKRsxNhiXtPfhxDVwELS72
         w59A==
X-Gm-Message-State: AOAM530elihLRNX3YUSBPug59E9c7/Y+QSm/cATVi/aCwKRTx8Irw+Aj
        +t6vxjiTW2hOkB2UPXCr9fWB1cqUZOIBQb6qm1w=
X-Google-Smtp-Source: ABdhPJyAYV0Dm0qLaL1mXbuG+PPAW1SP8BjwTCx+mqZtIG0Clr3g+Jy+4HR4m6cw7nu44h9gRxaSIWDuskrjmVwm3j8=
X-Received: by 2002:adf:e6c7:: with SMTP id y7mr4030589wrm.147.1598931729990;
 Mon, 31 Aug 2020 20:42:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200810222657.1841322-1-jcrouse@codeaurora.org>
 <20200814024114.1177553-2-robdclark@gmail.com> <20200901023517.GA54956@uller>
In-Reply-To: <20200901023517.GA54956@uller>
From:   Rob Clark <robdclark@gmail.com>
Date:   Mon, 31 Aug 2020 20:42:57 -0700
Message-ID: <CAF6AEGsx5mmUCuNApP692L-rS3wEbn4UqJBXuSr-38MAcVfoBw@mail.gmail.com>
Subject: Re: [PATCH 01/19] drm/msm: remove dangling submitqueue references
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Will Deacon <will@kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Aug 31, 2020 at 7:35 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Fri 14 Aug 02:40 UTC 2020, Rob Clark wrote:
>
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Currently it doesn't matter, since we free the ctx immediately.  But
> > when we start refcnt'ing the ctx, we don't want old dangling list
> > entries to hang around.
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >  drivers/gpu/drm/msm/msm_submitqueue.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/msm/msm_submitqueue.c
> > index a1d94be7883a..90c9d84e6155 100644
> > --- a/drivers/gpu/drm/msm/msm_submitqueue.c
> > +++ b/drivers/gpu/drm/msm/msm_submitqueue.c
> > @@ -49,8 +49,10 @@ void msm_submitqueue_close(struct msm_file_private *ctx)
> >        * No lock needed in close and there won't
> >        * be any more user ioctls coming our way
> >        */
> > -     list_for_each_entry_safe(entry, tmp, &ctx->submitqueues, node)
> > +     list_for_each_entry_safe(entry, tmp, &ctx->submitqueues, node) {
> > +             list_del(&entry->node);
>
> If you refcount ctx, what does that do for the entries in the submit
> queue?
>
> "entry" here is kref'ed, but you're popping it off the list regardless
> of the put ends up freeing the object or not - which afaict would mean
> leaking the object.
>

What ends up happening is the submit has reference to submit-queue,
which has reference to the ctx.. the submitqueue could be alive still
pending in-flight submits (in a later patch), but dead from the PoV of
userspace interface.

We aren't relying (or at least aren't in the end, and I *think* I
didn't miss anything in the middle) relying on ctx->submitqueues list
to clean anything up in the end, just track what is still a valid
submitqueue from userspace PoV

BR,
-R

>
> On the other hand, with the current implementation an object with higher
> refcount with adjacent objects of single refcount would end up with
> dangling pointers after the put. So in itself this change seems like a
> net gain, but I'm wondering about the plan described in the commit
> message.
>
> Regards,
> Bjorn
>
> >               msm_submitqueue_put(entry);
> > +     }
> >  }
> >
> >  int msm_submitqueue_create(struct drm_device *drm, struct msm_file_private *ctx,
> > --
> > 2.26.2
> >
