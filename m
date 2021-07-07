Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E585D3BEB94
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jul 2021 17:49:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231925AbhGGPvn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Jul 2021 11:51:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231883AbhGGPvn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Jul 2021 11:51:43 -0400
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com [IPv6:2607:f8b0:4864:20::c34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD889C061760
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jul 2021 08:49:01 -0700 (PDT)
Received: by mail-oo1-xc34.google.com with SMTP id 128-20020a4a11860000b029024b19a4d98eso603082ooc.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jul 2021 08:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=TRjwdSb4Zqrnk9xOXwD41+qNRE3CXecz0OfnXbeAS58=;
        b=RlxKToVJlQHGox7LiMYJ/J5S2rsQpAtoZzbwH3VdDiieI2G5jdTAe2OABpXhcrSQBe
         5rAw5cSFy+pbQ66jGlIboASoKg/94B39xmKg/+JvEU7EMk9lwzijritJ566nGWZeR5Dk
         Scq3ogMBtiIXvAvE6hzhr+j0bYF2Ci7DOmi7g/zePXFzl1eHUqi6xH2OpsyBOZ3QYSEb
         dPQViJkpQs03q59hJGEKm4acRcBH9DefUzFZe8Knnz0A62JyGrD7pgRNx32PHkNr9HHt
         4ibqYrEmdqqTYmcNJT12s19EDbfmyR6aOH5BQbuRb32aSNOZmNSNWfycu83Yi9usWjfp
         4BsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=TRjwdSb4Zqrnk9xOXwD41+qNRE3CXecz0OfnXbeAS58=;
        b=OwOwY1tJOSqcyM35Kd0js3KAfbb7Jucu3GHshKXoeG6TnsXKzjXy9t1QufffcQyfjq
         n4uhXZz+6mUTP1N8MZcc859hcBmT2JFwfarjxlA3z4VEhFS0CAKn/R7/dcoyUnauzCnL
         cCrvuiBQQIkuDK5xLnUhbEivx5jqKwIHD0Q7rUiuSFNUPv6Rd34UIeF0x2jBNXYieJry
         cVIAmEKkviv2/9yfQPWrXkbXPKhGwOyVor/4z1HwgcjOir8aJsvJ8W9HA9FUMcCl9I7A
         GNAsvtdi0twKcE2CVsOM7HeU4SSJZ5QezpWMB9xvT9kI+CgSzVGiS3uxjB20Kih5F2lW
         VaBw==
X-Gm-Message-State: AOAM533XFsvhxKHHlf+xPYx1/jgQdYw93dwygrH2ppULR8NnMikcSVMe
        oW+PRatGFmKgHSnvAt2dYKdvog==
X-Google-Smtp-Source: ABdhPJykJA4pq2CnNOGWottG6Gryv3lJXePlFoXG+hYkMXyop2gLq+jBTQ9RFWuTu8wN22KVv5ByQQ==
X-Received: by 2002:a4a:ae8c:: with SMTP id u12mr18699977oon.3.1625672940853;
        Wed, 07 Jul 2021 08:49:00 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id c14sm4254420oic.50.2021.07.07.08.49.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jul 2021 08:49:00 -0700 (PDT)
Date:   Wed, 7 Jul 2021 10:48:58 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] soc: qcom: rpmhpd: Use corner in power_off
Message-ID: <YOXM6l0oRhpMKr+9@builder.lan>
References: <20210703005416.2668319-1-bjorn.andersson@linaro.org>
 <20210703005416.2668319-2-bjorn.andersson@linaro.org>
 <cacd1a1f-01c8-b913-23e5-538a772cd118@codeaurora.org>
 <CAOCOHw4sufqC3=ixNud8Oz7vO0_ZcO8u5mqNQTKLZX4LGe9aow@mail.gmail.com>
 <c4440f5e-592c-b849-3ca7-57e812de2df5@codeaurora.org>
 <YOUyRrvdPLkbTqUp@yoga>
 <534fca70-d277-4154-b932-a4d6ab3b0b66@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <534fca70-d277-4154-b932-a4d6ab3b0b66@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 07 Jul 01:31 CDT 2021, Rajendra Nayak wrote:

> 
> 
> On 7/7/2021 10:19 AM, Bjorn Andersson wrote:
> > On Mon 05 Jul 00:40 CDT 2021, Rajendra Nayak wrote:
> > > On 7/5/2021 10:36 AM, Bjorn Andersson wrote:
> > > > On Sun, Jul 4, 2021 at 11:27 PM Rajendra Nayak <rnayak@codeaurora.org> wrote:
> > > > > 
> > > > > 
> > > > > 
> > > > > On 7/3/2021 6:24 AM, Bjorn Andersson wrote:
> > > > > > rpmhpd_aggregate_corner() takes a corner as parameter, but in
> > > > > > rpmhpd_power_off() the code requests the level of the first corner
> > > > > > instead.
> > > > > > 
> > > > > > In all (known) current cases the first corner has level 0, so this
> > > > > > change should be a nop, but in case that there's a power domain with a
> > > > > > non-zero lowest level this makes sure that rpmhpd_power_off() actually
> > > > > > requests the lowest level - which is the closest to "power off" we can
> > > > > > get.
> > > > > > 
> > > > > > While touching the code, also skip the unnecessary zero-initialization
> > > > > > of "ret".
> > > > > > 
> > > > > > Fixes: 279b7e8a62cc ("soc: qcom: rpmhpd: Add RPMh power domain driver")
> > > > > > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > > > > > ---
> > > > > >     drivers/soc/qcom/rpmhpd.c | 5 ++---
> > > > > >     1 file changed, 2 insertions(+), 3 deletions(-)
> > > > > > 
> > > > > > diff --git a/drivers/soc/qcom/rpmhpd.c b/drivers/soc/qcom/rpmhpd.c
> > > > > > index 2daa17ba54a3..fa209b479ab3 100644
> > > > > > --- a/drivers/soc/qcom/rpmhpd.c
> > > > > > +++ b/drivers/soc/qcom/rpmhpd.c
> > > > > > @@ -403,12 +403,11 @@ static int rpmhpd_power_on(struct generic_pm_domain *domain)
> > > > > >     static int rpmhpd_power_off(struct generic_pm_domain *domain)
> > > > > >     {
> > > > > >         struct rpmhpd *pd = domain_to_rpmhpd(domain);
> > > > > > -     int ret = 0;
> > > > > > +     int ret;
> > > > > > 
> > > > > >         mutex_lock(&rpmhpd_lock);
> > > > > > 
> > > > > > -     ret = rpmhpd_aggregate_corner(pd, pd->level[0]);
> > > > > > -
> > > > > > +     ret = rpmhpd_aggregate_corner(pd, 0);
> > > > > 
> > > > > This won't work for cases where pd->level[0] != 0, rpmh would just ignore this and keep the
> > > > > resource at whatever corner it was previously at.
> > > > > (unless command DB tells you a 0 is 'valid' for a resource, sending a 0 is a nop)
> > > > > The right thing to do is to send in whatever command DB tells you is the lowest level that's valid,
> > > > > which is pd->level[0].
> > > > > 
> > > > 
> > > > I'm afraid this doesn't make sense to me.
> > > > 
> > > > In rpmh_power_on() if cmd-db tells us that we have [0, 64, ...] and we
> > > > request 64 we rpmhpd_aggregate_corner(pd, 1); but in power off, if
> > > > cmd-db would provide [64, ...] we would end up sending
> > > > rpmhpd_aggregate_corner(pd, 64);
> > > > So in power_on we request the corner (i.e. index in the array provided
> > > > in cmd-db) and in power-off the same function takes the level?
> > > 
> > > ah that's right, I did not read the commit log properly and got confused.
> > 
> > Thanks for confirming my understanding.
> > 
> > > Looks like this bug existed from the day this driver for merged :/, thanks
> > > for catching it.
> > > Does it make sense to also mark this fix for stable?
> > > 
> > 
> > I can certainly add a Cc: stable@ as I'm applying this.
> 
> sure, sounds good
> > May I have your R-b?
> 
> Reviewed-by: Rajendra Nayak <rnayak@codeaurora.org>
> 

Thank you.

> > 
> > PS. Do you have any input on patch 2/2? That actually solves a practical
> > problem we're seeing. Would it perhaps aid in your need for the new
> > "assigned-opp-level" property?
> 
> We would perhaps still need the 'assigned-opp-level' or equivalent since
> the default requirement of devices is not always the least level supported,
> in some cases it might be slightly higher corner which would then need to
> be set explicitly.
> 

Right, for situations where we use assign-clock-rates to drive up the
clock rate this mechanism might be needed in order to keep things
stable.

But I presume as soon as you have some sort of dynamic nature to that
you'll be back to an opp-table and the means we already have.

> I was hoping on getting some more testing done with that patch especially for
> any regression on the sc7180 and sc7280 devices, which I haven't got to yet.
> Are you getting these patches ready for merge for the -rc cycle or for the
> next merge window?
> 

That would be much appreciated, I've not done extensive testing myself,
mostly just booted a few different boards.

But I would like to see us correct the MDSS_GDSC->MMCX setup in time for
v5.15, in particular since we have a few new users of the mmcx
power-domain-regulator arriving in this cycle.

Regards,
Bjorn
