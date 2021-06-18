Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2543F3AD12F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jun 2021 19:31:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236112AbhFRRdS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Jun 2021 13:33:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234369AbhFRRdR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Jun 2021 13:33:17 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41E50C06175F
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jun 2021 10:31:07 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id h16so6086742pjv.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jun 2021 10:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=BgUyoQmgb8QX9cTY7JZU2JqDkUBRtHtvOyEzX/t4lQo=;
        b=YpqbKyoVKxVEVZ7iQ3N9ddFReT21fNd2vOeP+Ppob/ucr4/OOGG3eOk6/EsyKH7GE8
         klz81yLz92bRKTeem69uA+odvtmSZWQZgTEdSRkBFzd3HkJ4cazyMD/9Wk2vorjBNjdw
         m5UDPuQWbmeVPoSQM8keIX4Ax5D8SI2lC1cp9/UkaTm+tWFec1xuVmJHYYUGXuC8TPEd
         1rRV8/zVRIq58TdZQFTK/4gpmYdtVD+zVhkX08vzbPO+uocyigUuwy8CFJAB/vT/NSDM
         lQM7ZZTgImav10SEpP/WdoPCbhRf7XD2cxjGnFVpRNaYrHDr7kfqwMNyzX2G+KfJOzaB
         LVsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=BgUyoQmgb8QX9cTY7JZU2JqDkUBRtHtvOyEzX/t4lQo=;
        b=dvnziO7a4mJ1rrhE5Qk1+lguXpiHvH22ZyA9hMVxaZ8yXbxDcNtK6jnldelGVl9VIg
         LA2cOLndi/UVafC340ETeyc1ZXuTcHbd2UdmWqDZqa697iUtWp7sguwaqsoYXr+kxIQg
         JD9haNxhYbe+05PDrk9ABYkxgVGG5sRamPoh/G9rXoExfRD3/dBLYbo3PF82owJWg0A3
         NDaMRsZTK8IuvTTXo2WF3DakpLGHjbSShqPybi5RsB6PUYTjlsQJ4SZE/DYPqET6FFgX
         UYgCiLdbEB1mdgV+NJRyPUJ4cEy5jPe2kWYKYLvqaNsY+4eI8i5gyGCcZjGLgYWeGrFV
         R4Bg==
X-Gm-Message-State: AOAM530dfJkAACYqfrc5afhMBpG9+msKsYGR9pC3juFB2pta7Y/YNNET
        INQrBzELxSWsO2jRNzzkCnKU
X-Google-Smtp-Source: ABdhPJzY7X+YNwXlP5sshe3b04sne3vfgPFlNR1AjK5Y6Ob2WRhbWbVFdfZFEuc34asbVdsmKCQ2nA==
X-Received: by 2002:a17:902:8d97:b029:113:d891:2ea0 with SMTP id v23-20020a1709028d97b0290113d8912ea0mr5884936plo.61.1624037466662;
        Fri, 18 Jun 2021 10:31:06 -0700 (PDT)
Received: from workstation ([120.138.13.221])
        by smtp.gmail.com with ESMTPSA id 3sm346571pfb.202.2021.06.18.10.31.03
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Jun 2021 10:31:05 -0700 (PDT)
Date:   Fri, 18 Jun 2021 23:01:02 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        carl.yin@quectel.com, naveen.kumar@quectel.com,
        loic.poulain@linaro.org
Subject: Re: [PATCH v1 1/4] bus: mhi: core: Add support for processing
 priority of event ring
Message-ID: <20210618173102.GB30140@workstation>
References: <1623965435-30224-1-git-send-email-bbhatt@codeaurora.org>
 <1623965435-30224-2-git-send-email-bbhatt@codeaurora.org>
 <20210618070322.GO3682@workstation>
 <df7c735f0caeb449bbaa8a6e040ae556@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <df7c735f0caeb449bbaa8a6e040ae556@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jun 18, 2021 at 10:17:59AM -0700, Bhaumik Bhatt wrote:
> Hi Mani,
> 
> On 2021-06-18 12:03 AM, Manivannan Sadhasivam wrote:
> > On Thu, Jun 17, 2021 at 02:30:32PM -0700, Bhaumik Bhatt wrote:
> > > From: Hemant Kumar <hemantk@codeaurora.org>
> > > 
> > > Event ring priorities are currently set to 1 and are unused.
> > > Default processing priority for event rings is set to regular
> > > tasklet. Controllers can choose to use high priority tasklet
> > > scheduling for certain event rings critical for processing such
> > > as ones transporting control information if they wish to avoid
> > > with system scheduling delays for those packets. In order to
> > > support these use cases, allow controllers to set event ring
> > > priority to high. This patch only adds support and does not
> > > enable usage of these priorities.
> > > 
> > > Signed-off-by: Hemant Kumar <hemantk@codeaurora.org>
> > > Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> > > ---
> > >  drivers/bus/mhi/core/internal.h |  2 +-
> > >  drivers/bus/mhi/core/main.c     | 19 ++++++++++++++++---
> > >  include/linux/mhi.h             | 14 ++++++++++++--
> > >  3 files changed, 29 insertions(+), 6 deletions(-)
> > > 
> > > diff --git a/drivers/bus/mhi/core/internal.h
> > > b/drivers/bus/mhi/core/internal.h
> > > index 672052f..666e102 100644
> > > --- a/drivers/bus/mhi/core/internal.h
> > > +++ b/drivers/bus/mhi/core/internal.h
> > > @@ -535,7 +535,7 @@ struct mhi_event {
> > >  	u32 intmod;
> > >  	u32 irq;
> > >  	int chan; /* this event ring is dedicated to a channel (optional) */
> > > -	u32 priority;
> > > +	enum mhi_er_priority priority;
> > 
> > Instead of using enum for priorities, can we just make use of the
> > existing "priority" field? Since the existing controllers set it to "1",
> > can we use "0" as the high priority?
> > 
> > This way we don't need to change the controller drivers.
> > 
> I agree but the reasons to do the enum approach was to allow for future
> expansion of the handling if it becomes necessary and provide clarity for
> the field.
> 
> I can always do it this way for now and we can have the enum for another
> time but would prefer updating what we have now.

Yeah, let's deal with it later once the necessity arises.

> > >  	enum mhi_er_data_type data_type;
> > >  	struct mhi_ring ring;
> > >  	struct db_cfg db_cfg;
> > > diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
> > > index 8ac73f9..bfc9776 100644
> > > --- a/drivers/bus/mhi/core/main.c
> > > +++ b/drivers/bus/mhi/core/main.c
> > > @@ -425,10 +425,11 @@ void mhi_create_devices(struct mhi_controller
> > > *mhi_cntrl)
> > >  	}
> > >  }
> > > 

[...]

> Existing controllers would be fine.
> 
> Do you think we have a problem if a new controller blindly inputs a "0" in
> the priority not knowing the impact of it?
> 

We should document it in the kernel doc for the struct field and that
should be enough. We can't do much if people doesn't read the doc ;)

Thanks,
Mani

> If you give me a go ahead, I can make these changes in v2 and leave the enum
> stuff out.
> 
> Thanks,
> Bhaumik
> ---
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
