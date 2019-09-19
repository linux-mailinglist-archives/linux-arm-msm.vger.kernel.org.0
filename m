Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D4932B8600
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Sep 2019 00:26:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394131AbfISW0H (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Sep 2019 18:26:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:42386 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2393783AbfISW0G (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Sep 2019 18:26:06 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 719BE2054F;
        Thu, 19 Sep 2019 22:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568931964;
        bh=xWK/p2ELdly/XdoxpRa2+V9wlIdhFi5y4+R1CLo6gIo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nH5xK9iO61ryVh8gRTwR8fQL7VN3XIQ3ImjJClMlQpIVnYnBBZ0wPhabZeHMvWd3I
         +nTjNrftcOCktbQ6oKYOeQGNebcDxQsHfJCKB4nR5mXyTxTRiFX1Vm/0wkrjq1nXyx
         FynRNttAzjNK4wxB2Yy82+1x4LKMZ6BgJKL+Q7SA=
Date:   Fri, 20 Sep 2019 00:25:25 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Murali Nalajala <mnalajal@codeaurora.org>, rafael@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] base: soc: Export soc_device_to_device API
Message-ID: <20190919222525.GA445429@kroah.com>
References: <1568927624-13682-1-git-send-email-mnalajal@codeaurora.org>
 <20190919213203.GA395325@kroah.com>
 <20190919215300.GC1418@minitux>
 <20190919215836.GA426988@kroah.com>
 <20190919221456.GA63675@minitux>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190919221456.GA63675@minitux>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Sep 19, 2019 at 03:14:56PM -0700, Bjorn Andersson wrote:
> On Thu 19 Sep 14:58 PDT 2019, Greg KH wrote:
> 
> > On Thu, Sep 19, 2019 at 02:53:00PM -0700, Bjorn Andersson wrote:
> > > On Thu 19 Sep 14:32 PDT 2019, Greg KH wrote:
> > > 
> > > > On Thu, Sep 19, 2019 at 02:13:44PM -0700, Murali Nalajala wrote:
> > > > > If the soc drivers want to add custom sysfs entries it needs to
> > > > > access "dev" field in "struct soc_device". This can be achieved
> > > > > by "soc_device_to_device" API. Soc drivers which are built as a
> > > > > module they need above API to be exported. Otherwise one can
> > > > > observe compilation issues.
> > > > > 
> > > > > Signed-off-by: Murali Nalajala <mnalajal@codeaurora.org>
> > > > > ---
> > > > >  drivers/base/soc.c | 1 +
> > > > >  1 file changed, 1 insertion(+)
> > > > > 
> > > > > diff --git a/drivers/base/soc.c b/drivers/base/soc.c
> > > > > index 7c0c5ca..4ad52f6 100644
> > > > > --- a/drivers/base/soc.c
> > > > > +++ b/drivers/base/soc.c
> > > > > @@ -41,6 +41,7 @@ struct device *soc_device_to_device(struct soc_device *soc_dev)
> > > > >  {
> > > > >  	return &soc_dev->dev;
> > > > >  }
> > > > > +EXPORT_SYMBOL_GPL(soc_device_to_device);
> > > > >  
> > > > >  static umode_t soc_attribute_mode(struct kobject *kobj,
> > > > >  				struct attribute *attr,
> > > > 
> > > > What in-kernel driver needs this?
> > > > 
> > > 
> > > Half of the drivers interacting with the soc driver calls this API,
> > > several of these I see no reason for being builtin (e.g.
> > > ux500 andversatile). So I think this patch makes sense to allow us to
> > > build these as modules.
> > > 
> > > > Is linux-next breaking without this?
> > > > 
> > > 
> > > No, we postponed the addition of any sysfs attributes in the Qualcomm
> > > socinfo driver.
> > > 
> > > > We don't export things unless we have a user of the export.
> > > > 
> > > > Also, adding "custom" sysfs attributes is almost always not the correct
> > > > thing to do at all.  The driver should be doing it, by setting up the
> > > > attribute group properly so that the driver core can do it automatically
> > > > for it.
> > > > 
> > > > No driver should be doing individual add/remove of sysfs files.  If it
> > > > does so, it is almost guaranteed to be doing it incorrectly and racing
> > > > userspace.
> > > > 
> > > 
> > > The problem here is that the attributes are expected to be attached to
> > > the soc driver, which is separate from the platform-specific drivers. So
> > > there's no way to do platform specific attributes the right way.
> > > 
> > > > And yes, there's loads of in-kernel examples of doing this wrong, I've
> > > > been working on fixing that up, look at the patches now in Linus's tree
> > > > for platform and USB drivers that do this as examples of how to do it
> > > > right.
> > > > 
> > > 
> > > Agreed, this patch should not be used as an approval for any crazy
> > > attributes; but it's necessary in order to extend the soc device's
> > > attributes, per the current design.
> > 
> > Wait, no, let's not let the "current design" remain if it is broken!
> > 
> > Why can't the soc driver handle the attributes properly so that the
> > individual driver doesn't have to do the create/remove?
> > 
> 
> The custom attributes that these drivers want to add to the common ones
> are known in advance, so I presume we could have them passed into
> soc_device_register() and registered together with the common
> attributes...
> 
> It sounds like it's worth a prototype.

Do you have an in-kernel example I can look at to get an idea of what is
needed here?

thanks,

greg k-h
