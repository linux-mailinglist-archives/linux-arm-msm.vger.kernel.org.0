Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F2173BE22D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jul 2021 06:49:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230024AbhGGEvz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Jul 2021 00:51:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229883AbhGGEvx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Jul 2021 00:51:53 -0400
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70CC5C061574
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jul 2021 21:49:14 -0700 (PDT)
Received: by mail-ot1-x32d.google.com with SMTP id n99-20020a9d206c0000b029045d4f996e62so1085862ota.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jul 2021 21:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=aOCf7bJeTup3O5eKuyZwInvrSG4Mv/tqBhQi8R6hdxM=;
        b=gvmrhC4d8H5yix0DMHA4jOtQWxhe/pbOUEJ0sR0d6NJG+fIDsVdEjfTvqlepOXCFsl
         gbcs/Mf1hrNAdfVEVhiym2AlbsN+zSla8yWRL6Ya+hAYsTFQG7nGe7TQSgXpYcaeOI10
         +p/XGJlfuW109UH90jhaPioP8SX9meDl4FH8RltQ9KHrKy69G6c1YxsNFBVCuYirZ7g6
         30AqJ1xRk4H/5OqcdEx7z+XXEJrN/ZbZbVN/teQWRhWcTKBo7Qbm8SAYu4Rsxx2XrvPw
         OhNfbCPs0vxaF6Fvz/5fDXfqHCFlLPTGruQcrPAtrzBG4TLQ4NAzVMoJPp4vpsnEQxXJ
         aw3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=aOCf7bJeTup3O5eKuyZwInvrSG4Mv/tqBhQi8R6hdxM=;
        b=csIEcTH8Aa2JhS+Eb1H88c86M56BJKklZS/i4d3yxL/GzvgPL2e6zsu2YraUBXlM9e
         eidy+NWxmxfVQKya/RQBLZgxdwkwV9fRM8UZRQmvXn960rscyrbo1zT6KQiB8IQAcD73
         gwFIQchVFhAGrpGyZA/Q4CxP2nFIKRzvT0WgFfdo15Ru/gmiN59HIq888thHoLMbMiYJ
         LdXWCEIIZXBKQrj5OWj3uavdvyFEN9fgPd5ANAM7SlvvPZKA2dJxIO5qILmjcG6CHIt+
         faiXlU0ncmj/iEV+b/Tp3aDqK+Oth5CvlARc16x2geahztbGGdnU2LYlYjfjmHA/dHMi
         L/cw==
X-Gm-Message-State: AOAM533I0Z3HgZ6AZ33G0gT7e7VTSYisQWz0KqaQFMPUUpIIRv59pnHu
        keIne3/wSx/H/EZdHJkAKkKHmg==
X-Google-Smtp-Source: ABdhPJz801zAUtHhSa2wgMK/AtXNvZh2sfgoDGJeOjFxsYJRW0cbmPkRvfEIv0Ubkk5KgL8qd+BxUA==
X-Received: by 2002:a05:6830:200a:: with SMTP id e10mr8150358otp.24.1625633353678;
        Tue, 06 Jul 2021 21:49:13 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id m1sm3705028otl.0.2021.07.06.21.49.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jul 2021 21:49:12 -0700 (PDT)
Date:   Tue, 6 Jul 2021 23:49:10 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] soc: qcom: rpmhpd: Use corner in power_off
Message-ID: <YOUyRrvdPLkbTqUp@yoga>
References: <20210703005416.2668319-1-bjorn.andersson@linaro.org>
 <20210703005416.2668319-2-bjorn.andersson@linaro.org>
 <cacd1a1f-01c8-b913-23e5-538a772cd118@codeaurora.org>
 <CAOCOHw4sufqC3=ixNud8Oz7vO0_ZcO8u5mqNQTKLZX4LGe9aow@mail.gmail.com>
 <c4440f5e-592c-b849-3ca7-57e812de2df5@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c4440f5e-592c-b849-3ca7-57e812de2df5@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 05 Jul 00:40 CDT 2021, Rajendra Nayak wrote:
> On 7/5/2021 10:36 AM, Bjorn Andersson wrote:
> > On Sun, Jul 4, 2021 at 11:27 PM Rajendra Nayak <rnayak@codeaurora.org> wrote:
> > > 
> > > 
> > > 
> > > On 7/3/2021 6:24 AM, Bjorn Andersson wrote:
> > > > rpmhpd_aggregate_corner() takes a corner as parameter, but in
> > > > rpmhpd_power_off() the code requests the level of the first corner
> > > > instead.
> > > > 
> > > > In all (known) current cases the first corner has level 0, so this
> > > > change should be a nop, but in case that there's a power domain with a
> > > > non-zero lowest level this makes sure that rpmhpd_power_off() actually
> > > > requests the lowest level - which is the closest to "power off" we can
> > > > get.
> > > > 
> > > > While touching the code, also skip the unnecessary zero-initialization
> > > > of "ret".
> > > > 
> > > > Fixes: 279b7e8a62cc ("soc: qcom: rpmhpd: Add RPMh power domain driver")
> > > > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > > > ---
> > > >    drivers/soc/qcom/rpmhpd.c | 5 ++---
> > > >    1 file changed, 2 insertions(+), 3 deletions(-)
> > > > 
> > > > diff --git a/drivers/soc/qcom/rpmhpd.c b/drivers/soc/qcom/rpmhpd.c
> > > > index 2daa17ba54a3..fa209b479ab3 100644
> > > > --- a/drivers/soc/qcom/rpmhpd.c
> > > > +++ b/drivers/soc/qcom/rpmhpd.c
> > > > @@ -403,12 +403,11 @@ static int rpmhpd_power_on(struct generic_pm_domain *domain)
> > > >    static int rpmhpd_power_off(struct generic_pm_domain *domain)
> > > >    {
> > > >        struct rpmhpd *pd = domain_to_rpmhpd(domain);
> > > > -     int ret = 0;
> > > > +     int ret;
> > > > 
> > > >        mutex_lock(&rpmhpd_lock);
> > > > 
> > > > -     ret = rpmhpd_aggregate_corner(pd, pd->level[0]);
> > > > -
> > > > +     ret = rpmhpd_aggregate_corner(pd, 0);
> > > 
> > > This won't work for cases where pd->level[0] != 0, rpmh would just ignore this and keep the
> > > resource at whatever corner it was previously at.
> > > (unless command DB tells you a 0 is 'valid' for a resource, sending a 0 is a nop)
> > > The right thing to do is to send in whatever command DB tells you is the lowest level that's valid,
> > > which is pd->level[0].
> > > 
> > 
> > I'm afraid this doesn't make sense to me.
> > 
> > In rpmh_power_on() if cmd-db tells us that we have [0, 64, ...] and we
> > request 64 we rpmhpd_aggregate_corner(pd, 1); but in power off, if
> > cmd-db would provide [64, ...] we would end up sending
> > rpmhpd_aggregate_corner(pd, 64);
> > So in power_on we request the corner (i.e. index in the array provided
> > in cmd-db) and in power-off the same function takes the level?
> 
> ah that's right, I did not read the commit log properly and got confused.

Thanks for confirming my understanding.

> Looks like this bug existed from the day this driver for merged :/, thanks
> for catching it.
> Does it make sense to also mark this fix for stable?
> 

I can certainly add a Cc: stable@ as I'm applying this.

May I have your R-b?


PS. Do you have any input on patch 2/2? That actually solves a practical
problem we're seeing. Would it perhaps aid in your need for the new
"assigned-opp-level" property?

Regards,
Bjorn
