Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E79383B31C2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jun 2021 16:50:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232053AbhFXOw3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Jun 2021 10:52:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231608AbhFXOw3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Jun 2021 10:52:29 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DB74C061756
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jun 2021 07:50:10 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id m2so4913826pgk.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jun 2021 07:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=6gRbND3XlnFRjxaAFjazt4t2CTzeQHjH9Rv+KQ2khaQ=;
        b=CN5a8joLkzaqbmkYg56qrlGLFVf//X5GU2u3nXsLilDK0o9UwUxDsjPfHaiUrylnYL
         LVkpGs+tG0w3i2+pxdoBC3hn37adQF3+PUoLENdcSbAR9Sy2NPwSjiR7NXqobp7zzupJ
         d0rkicbffZnYLXFVQ/YEQqxiqeJjdZFea0XP0NstQdI29GcNnGery+czH40BXP7v68ql
         RBEmAq2C7wyp96U+HaIZANcOLxTSb2g/TPV8yQCc9npS+6q6zUq1JsEyV5lKd4+lw8I2
         LCjP0S+0XzvaKqkIIgbuxF6YNu9sgsCE142m7ziZ0wiGZOsOREpdAtUCCJIi00c1KRC/
         vB8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=6gRbND3XlnFRjxaAFjazt4t2CTzeQHjH9Rv+KQ2khaQ=;
        b=I5m7JIL/wlC/EHhczY1ssjBxWMmJRp7WrCEMrwwHdt6U8b6gIvJea+kPJVHMGhpqVY
         NNtdgZnk6ghMYsjOUznk3aegzupwUzr1YidHJ+TfxpJZRN/G0W/K0Y/eRBzkcBnTin3+
         Bivdrur/mRu22ocpuVXMQ3j1GFXrEVPC+WCFTsIUE0IkvPeBkv4J7ZcABoeNQVfxfI2/
         rbUqrJiom+2v4afts354DnBOgzkiM/VAYjg6IxDNgQ5YgyKD1y5Yf3iqA8Ik32q3WB5D
         jefG6alESdv2mwzxscJ96krALSS8m3NEblcx0nPFVRH618jydk7FKZims6zNRur/F1rJ
         HfgQ==
X-Gm-Message-State: AOAM533dFheTu5CtTERJF/2j7oa1v1zu8cd0TWwHlURkg7v1RaX4SoE2
        14YEzbx0d4dK4cdkVIlLVk+/
X-Google-Smtp-Source: ABdhPJxGK1UjuX/vighv2ORISjGThUrb8ytgGnsIeZ62mStFW21XjjolJzYWV54+ToUH7EwAQpqzAQ==
X-Received: by 2002:aa7:82cb:0:b029:2e6:f397:d248 with SMTP id f11-20020aa782cb0000b02902e6f397d248mr5551594pfn.52.1624546209966;
        Thu, 24 Jun 2021 07:50:09 -0700 (PDT)
Received: from workstation ([120.138.12.173])
        by smtp.gmail.com with ESMTPSA id g38sm2616315pgg.63.2021.06.24.07.50.07
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 24 Jun 2021 07:50:09 -0700 (PDT)
Date:   Thu, 24 Jun 2021 20:20:06 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        loic.poulain@linaro.org
Subject: Re: [PATCH 6/8] bus: mhi: core: Add support for processing priority
 of event ring
Message-ID: <20210624145006.GE6108@workstation>
References: <20210621161616.77524-1-manivannan.sadhasivam@linaro.org>
 <20210621161616.77524-7-manivannan.sadhasivam@linaro.org>
 <YNSOXaWt3YX3yDQC@kroah.com>
 <20210624142453.GB6108@workstation>
 <YNSZZhGSZ0lFgS+U@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YNSZZhGSZ0lFgS+U@kroah.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jun 24, 2021 at 04:40:38PM +0200, Greg KH wrote:
> On Thu, Jun 24, 2021 at 07:54:53PM +0530, Manivannan Sadhasivam wrote:
> > On Thu, Jun 24, 2021 at 03:53:33PM +0200, Greg KH wrote:
> > > On Mon, Jun 21, 2021 at 09:46:14PM +0530, Manivannan Sadhasivam wrote:
> > > > From: Hemant Kumar <hemantk@codeaurora.org>
> > > > 
> > > > Event ring priorities are currently set to 1 and are unused.
> > > > Default processing priority for event rings is set to regular
> > > > tasklet. Controllers can choose to use high priority tasklet
> > > > scheduling for certain event rings critical for processing such
> > > > as ones transporting control information if they wish to avoid
> > > > system scheduling delays for those packets. In order to support
> > > > these use cases, allow controllers to set event ring priority to
> > > > high.
> > > > 
> > > > Signed-off-by: Hemant Kumar <hemantk@codeaurora.org>
> > > > Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> > > > Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > > > Link: https://lore.kernel.org/r/1624053903-24653-2-git-send-email-bbhatt@codeaurora.org
> > > > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > > > ---
> > > >  drivers/bus/mhi/core/init.c | 3 +--
> > > >  drivers/bus/mhi/core/main.c | 9 +++++++--
> > > >  include/linux/mhi.h         | 2 +-
> > > >  3 files changed, 9 insertions(+), 5 deletions(-)
> > > > 
> > > > diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
> > > > index c81b377fca8f..444676034bf0 100644
> > > > --- a/drivers/bus/mhi/core/init.c
> > > > +++ b/drivers/bus/mhi/core/init.c

[...]

> > That's because, "1" was used from the beginning by the controller drivers
> > as the regular priority. And I thought of using "0" as high priority so
> > that we can leave the controller drivers unmodified.
> 
> There's no problem modifying everyone, how much work is that?
> 

I thought of minimizing the diff if we can avoid...err

> > > Shouldn't this be a boolean, or if not, an enumerated type so that
> > > people can read the code over time?
> > > 
> > 
> > Bhaumik proposed an enum but I wanted 0/1 so that the controller drivers
> > can be untouched. Also, I don't see any immediate requirement for other
> > priorities.
> > 
> > Will make it a bool then.
> 
> Rename it when you change it so that you know you catch all existing
> users.
> 

Okay. Bhaumik, can you please use the enum (as you did)?

Thanks,
Mani

> thanks,
> 
> greg k-h
