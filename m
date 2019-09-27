Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17FC8BFEA6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Sep 2019 07:46:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725800AbfI0Fqd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Sep 2019 01:46:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:47022 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725268AbfI0Fqd (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Sep 2019 01:46:33 -0400
Received: from localhost (unknown [62.119.166.9])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 919B720872;
        Fri, 27 Sep 2019 05:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1569563191;
        bh=D2BTwThn4Ip/3GdBOPpIaF4bBt/l9J1HYEHqc3wOE70=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=p5RoYqjr6MAZSUFXUfAN3wmKZnQT3zf2oXrhS1R+GgxuJBdi2uyvf76/dSTRyo8rr
         bbgDMw//OYs4AP2bYFCXCuf/1A5U5yVYAi5jFi1z6GeBAqNkKlhbwC2sffOlkApV6V
         bHy1ol+j7ZLXqRIitBBOgcF7Xup7wApwybJWmaaI=
Date:   Fri, 27 Sep 2019 07:46:27 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     mnalajal@codeaurora.org
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>, rafael@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] base: soc: Export soc_device_to_device API
Message-ID: <20190927054627.GA1782250@kroah.com>
References: <20190919215836.GA426988@kroah.com>
 <20190919221456.GA63675@minitux>
 <20190919222525.GA445429@kroah.com>
 <20190919224017.GB63675@minitux>
 <20190919224514.GA447028@kroah.com>
 <20190920033651.GC63675@minitux>
 <20190920061006.GC473898@kroah.com>
 <5d9d1f3d11b1e4173990d4c5ac547193@codeaurora.org>
 <20190924045005.GB2700@kroah.com>
 <c2ea4365915e4a0fbb3e199cbdb9e1df@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c2ea4365915e4a0fbb3e199cbdb9e1df@codeaurora.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Sep 26, 2019 at 07:33:21AM -0700, mnalajal@codeaurora.org wrote:
> On 2019-09-23 21:50, Greg KH wrote:
> > On Mon, Sep 23, 2019 at 02:35:33PM -0700, mnalajal@codeaurora.org wrote:
> > > On 2019-09-19 23:10, Greg KH wrote:
> > > > On Thu, Sep 19, 2019 at 08:36:51PM -0700, Bjorn Andersson wrote:
> > > > > On Thu 19 Sep 15:45 PDT 2019, Greg KH wrote:
> > > > >
> > > > > > On Thu, Sep 19, 2019 at 03:40:17PM -0700, Bjorn Andersson wrote:
> > > > > > > On Thu 19 Sep 15:25 PDT 2019, Greg KH wrote:
> > > > > > >
> > > > > > > > On Thu, Sep 19, 2019 at 03:14:56PM -0700, Bjorn Andersson wrote:
> > > > > > > > > On Thu 19 Sep 14:58 PDT 2019, Greg KH wrote:
> > > > > > > > >
> > > > > > > > > > On Thu, Sep 19, 2019 at 02:53:00PM -0700, Bjorn Andersson wrote:
> > > > > > > > > > > On Thu 19 Sep 14:32 PDT 2019, Greg KH wrote:
> > > > > > > > > > >
> > > > > > > > > > > > On Thu, Sep 19, 2019 at 02:13:44PM -0700, Murali Nalajala wrote:
> > > > > > > > > > > > > If the soc drivers want to add custom sysfs entries it needs to
> > > > > > > > > > > > > access "dev" field in "struct soc_device". This can be achieved
> > > > > > > > > > > > > by "soc_device_to_device" API. Soc drivers which are built as a
> > > > > > > > > > > > > module they need above API to be exported. Otherwise one can
> > > > > > > > > > > > > observe compilation issues.
> > > > > > > > > > > > >
> > > > > > > > > > > > > Signed-off-by: Murali Nalajala <mnalajal@codeaurora.org>
> > > > > > > > > > > > > ---
> > > > > > > > > > > > >  drivers/base/soc.c | 1 +
> > > > > > > > > > > > >  1 file changed, 1 insertion(+)
> > > > > > > > > > > > >
> > > > > > > > > > > > > diff --git a/drivers/base/soc.c b/drivers/base/soc.c
> > > > > > > > > > > > > index 7c0c5ca..4ad52f6 100644
> > > > > > > > > > > > > --- a/drivers/base/soc.c
> > > > > > > > > > > > > +++ b/drivers/base/soc.c
> > > > > > > > > > > > > @@ -41,6 +41,7 @@ struct device *soc_device_to_device(struct soc_device *soc_dev)
> > > > > > > > > > > > >  {
> > > > > > > > > > > > >  	return &soc_dev->dev;
> > > > > > > > > > > > >  }
> > > > > > > > > > > > > +EXPORT_SYMBOL_GPL(soc_device_to_device);
> > > > > > > > > > > > >
> > > > > > > > > > > > >  static umode_t soc_attribute_mode(struct kobject *kobj,
> > > > > > > > > > > > >  				struct attribute *attr,
> > > > > > > > > > > >
> > > > > > > > > > > > What in-kernel driver needs this?
> > > > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > Half of the drivers interacting with the soc driver calls this API,
> > > > > > > > > > > several of these I see no reason for being builtin (e.g.
> > > > > > > > > > > ux500 andversatile). So I think this patch makes sense to allow us to
> > > > > > > > > > > build these as modules.
> > > > > > > > > > >
> > > > > > > > > > > > Is linux-next breaking without this?
> > > > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > No, we postponed the addition of any sysfs attributes in the Qualcomm
> > > > > > > > > > > socinfo driver.
> > > > > > > > > > >
> > > > > > > > > > > > We don't export things unless we have a user of the export.
> > > > > > > > > > > >
> > > > > > > > > > > > Also, adding "custom" sysfs attributes is almost always not the correct
> > > > > > > > > > > > thing to do at all.  The driver should be doing it, by setting up the
> > > > > > > > > > > > attribute group properly so that the driver core can do it automatically
> > > > > > > > > > > > for it.
> > > > > > > > > > > >
> > > > > > > > > > > > No driver should be doing individual add/remove of sysfs files.  If it
> > > > > > > > > > > > does so, it is almost guaranteed to be doing it incorrectly and racing
> > > > > > > > > > > > userspace.
> > > > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > The problem here is that the attributes are expected to be attached to
> > > > > > > > > > > the soc driver, which is separate from the platform-specific drivers. So
> > > > > > > > > > > there's no way to do platform specific attributes the right way.
> > > > > > > > > > >
> > > > > > > > > > > > And yes, there's loads of in-kernel examples of doing this wrong, I've
> > > > > > > > > > > > been working on fixing that up, look at the patches now in Linus's tree
> > > > > > > > > > > > for platform and USB drivers that do this as examples of how to do it
> > > > > > > > > > > > right.
> > > > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > Agreed, this patch should not be used as an approval for any crazy
> > > > > > > > > > > attributes; but it's necessary in order to extend the soc device's
> > > > > > > > > > > attributes, per the current design.
> > > > > > > > > >
> > > > > > > > > > Wait, no, let's not let the "current design" remain if it is broken!
> > > > > > > > > >
> > > > > > > > > > Why can't the soc driver handle the attributes properly so that the
> > > > > > > > > > individual driver doesn't have to do the create/remove?
> > > > > > > > > >
> > > > > > > > >
> > > > > > > > > The custom attributes that these drivers want to add to the common ones
> > > > > > > > > are known in advance, so I presume we could have them passed into
> > > > > > > > > soc_device_register() and registered together with the common
> > > > > > > > > attributes...
> > > > > > > > >
> > > > > > > > > It sounds like it's worth a prototype.
> > > > > > > >
> > > > > > > > Do you have an in-kernel example I can look at to get an idea of what is
> > > > > > > > needed here?
> > > > > > > >
> > > > > > >
> > > > > > > realview_soc_probe(), in drivers/soc/versatile/soc-realview.c,
> > > > > > > implements the current mechanism of acquiring the soc's struct device
> > > > > > > and then issuing a few device_create_file calls on that.
> > > > > >
> > > > > > That looks to be a trivial driver to fix up.  Look at 6d03c140db2e
> > > > > > ("USB: phy: fsl-usb: convert platform driver to use dev_groups") as an
> > > > > > example of how to do this.
> > > > > >
> > > > >
> > > > > The difference between the two cases is that in the fsl-usb case it's
> > > > > attributes of the device itself, while in the soc case the
> > > > > realview-soc
> > > > > driver (or the others doing this) calls soc_device_register() to
> > > > > register a new (dangling) soc device, which it then adds its
> > > > > attributes
> > > > > onto.
> > > >
> > > > That sounds really really odd.  Why can't the soc device do the creation
> > > > "automatically" when the device is registered?  The soc core should
> > > > handle this for the soc "drivers", that's what it is there for.
> > > >
> > > Clients are registering to soc framework using
> > > "soce_device_register()"
> > > with "soc_device_attribute". This attribute structure does not have
> > > all
> > > the sysfs fields what client are interested. Hence clients are
> > > handling
> > > their required sysfs fields in their drivers.
> > > https://elixir.bootlin.com/linux/v5.3/source/drivers/base/soc.c#L114
> > 
> > Then you should fix that :)
> If i understand, you are asking me to address additional sysfs entries from
> the client side using "default attribute" groups.
> I saw your patches about "dev_groups" usage which might be part of 5.4-rc1.
> If i go with above approach, i end up seeing the soc information at two
> different sysfs paths i.e.
> Is this my understanding correct?
> 
> 1. /sys/devices/soc0/*
> 2. /sys/bus/platform/drivers/msm-socinfo/*

Ah!

Ugh.

Ok, if the soc "core" wants devices to put sysfs files under the "socX"
device, then it needs to provide for a way to do this in a sane manner.
Exposing the "struct device" of the device here is NOT the sane way to
do this.

So we are back to the original request I made here, the SOC "core" needs
to be able to create these files for you, so an attribute group list
must be available for the soc "driver" to set.

What it is doing now is not ok.

> Couple of things which i can think of addressing this issue is:
> 1. Modify the soc framework APIs to pass the client side sysfs attributes.
> This will ensure all the soc information fall under /sys/devices/soc0/*

"pass"?  You mean "create", right?

> 2. Modify "struct soc_device_attribute" and add more entries. So that we do
> not need to change any soc framework.
> Problem here is others might have a different requirement which will not be
> full fill if i do this.

I don't understand what you mean by this second option, sorry.

See my suggestion above, what we have now is just not ok.

thanks,

greg k-h
