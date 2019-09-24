Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F946BC125
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2019 06:50:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404402AbfIXEuJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Sep 2019 00:50:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:57316 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2394439AbfIXEuJ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Sep 2019 00:50:09 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8E6A0207FD;
        Tue, 24 Sep 2019 04:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1569300608;
        bh=G9RP+Qa3dNbYQldyep2Vb0GBoLFopZ+7tVc/FnTIKlQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Nb8MS+IEqhMvhrlbvBw0bZaZ8fGhQdqJG7WWs5zsFdBiUlqYUdrDQ800F4hJwiixv
         wlE1LZT/jmCMEIRniIUEsGRaMdRt2cUwjgzEuSeLpLDQhLLg4PF0JDtIWxcV0q8MBC
         FVOqb7G8xPF8REzEg5yNQTkerUWwGsNuZxEy3YRw=
Date:   Tue, 24 Sep 2019 06:50:05 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     mnalajal@codeaurora.org
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>, rafael@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] base: soc: Export soc_device_to_device API
Message-ID: <20190924045005.GB2700@kroah.com>
References: <20190919213203.GA395325@kroah.com>
 <20190919215300.GC1418@minitux>
 <20190919215836.GA426988@kroah.com>
 <20190919221456.GA63675@minitux>
 <20190919222525.GA445429@kroah.com>
 <20190919224017.GB63675@minitux>
 <20190919224514.GA447028@kroah.com>
 <20190920033651.GC63675@minitux>
 <20190920061006.GC473898@kroah.com>
 <5d9d1f3d11b1e4173990d4c5ac547193@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5d9d1f3d11b1e4173990d4c5ac547193@codeaurora.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Sep 23, 2019 at 02:35:33PM -0700, mnalajal@codeaurora.org wrote:
> On 2019-09-19 23:10, Greg KH wrote:
> > On Thu, Sep 19, 2019 at 08:36:51PM -0700, Bjorn Andersson wrote:
> > > On Thu 19 Sep 15:45 PDT 2019, Greg KH wrote:
> > > 
> > > > On Thu, Sep 19, 2019 at 03:40:17PM -0700, Bjorn Andersson wrote:
> > > > > On Thu 19 Sep 15:25 PDT 2019, Greg KH wrote:
> > > > >
> > > > > > On Thu, Sep 19, 2019 at 03:14:56PM -0700, Bjorn Andersson wrote:
> > > > > > > On Thu 19 Sep 14:58 PDT 2019, Greg KH wrote:
> > > > > > >
> > > > > > > > On Thu, Sep 19, 2019 at 02:53:00PM -0700, Bjorn Andersson wrote:
> > > > > > > > > On Thu 19 Sep 14:32 PDT 2019, Greg KH wrote:
> > > > > > > > >
> > > > > > > > > > On Thu, Sep 19, 2019 at 02:13:44PM -0700, Murali Nalajala wrote:
> > > > > > > > > > > If the soc drivers want to add custom sysfs entries it needs to
> > > > > > > > > > > access "dev" field in "struct soc_device". This can be achieved
> > > > > > > > > > > by "soc_device_to_device" API. Soc drivers which are built as a
> > > > > > > > > > > module they need above API to be exported. Otherwise one can
> > > > > > > > > > > observe compilation issues.
> > > > > > > > > > >
> > > > > > > > > > > Signed-off-by: Murali Nalajala <mnalajal@codeaurora.org>
> > > > > > > > > > > ---
> > > > > > > > > > >  drivers/base/soc.c | 1 +
> > > > > > > > > > >  1 file changed, 1 insertion(+)
> > > > > > > > > > >
> > > > > > > > > > > diff --git a/drivers/base/soc.c b/drivers/base/soc.c
> > > > > > > > > > > index 7c0c5ca..4ad52f6 100644
> > > > > > > > > > > --- a/drivers/base/soc.c
> > > > > > > > > > > +++ b/drivers/base/soc.c
> > > > > > > > > > > @@ -41,6 +41,7 @@ struct device *soc_device_to_device(struct soc_device *soc_dev)
> > > > > > > > > > >  {
> > > > > > > > > > >  	return &soc_dev->dev;
> > > > > > > > > > >  }
> > > > > > > > > > > +EXPORT_SYMBOL_GPL(soc_device_to_device);
> > > > > > > > > > >
> > > > > > > > > > >  static umode_t soc_attribute_mode(struct kobject *kobj,
> > > > > > > > > > >  				struct attribute *attr,
> > > > > > > > > >
> > > > > > > > > > What in-kernel driver needs this?
> > > > > > > > > >
> > > > > > > > >
> > > > > > > > > Half of the drivers interacting with the soc driver calls this API,
> > > > > > > > > several of these I see no reason for being builtin (e.g.
> > > > > > > > > ux500 andversatile). So I think this patch makes sense to allow us to
> > > > > > > > > build these as modules.
> > > > > > > > >
> > > > > > > > > > Is linux-next breaking without this?
> > > > > > > > > >
> > > > > > > > >
> > > > > > > > > No, we postponed the addition of any sysfs attributes in the Qualcomm
> > > > > > > > > socinfo driver.
> > > > > > > > >
> > > > > > > > > > We don't export things unless we have a user of the export.
> > > > > > > > > >
> > > > > > > > > > Also, adding "custom" sysfs attributes is almost always not the correct
> > > > > > > > > > thing to do at all.  The driver should be doing it, by setting up the
> > > > > > > > > > attribute group properly so that the driver core can do it automatically
> > > > > > > > > > for it.
> > > > > > > > > >
> > > > > > > > > > No driver should be doing individual add/remove of sysfs files.  If it
> > > > > > > > > > does so, it is almost guaranteed to be doing it incorrectly and racing
> > > > > > > > > > userspace.
> > > > > > > > > >
> > > > > > > > >
> > > > > > > > > The problem here is that the attributes are expected to be attached to
> > > > > > > > > the soc driver, which is separate from the platform-specific drivers. So
> > > > > > > > > there's no way to do platform specific attributes the right way.
> > > > > > > > >
> > > > > > > > > > And yes, there's loads of in-kernel examples of doing this wrong, I've
> > > > > > > > > > been working on fixing that up, look at the patches now in Linus's tree
> > > > > > > > > > for platform and USB drivers that do this as examples of how to do it
> > > > > > > > > > right.
> > > > > > > > > >
> > > > > > > > >
> > > > > > > > > Agreed, this patch should not be used as an approval for any crazy
> > > > > > > > > attributes; but it's necessary in order to extend the soc device's
> > > > > > > > > attributes, per the current design.
> > > > > > > >
> > > > > > > > Wait, no, let's not let the "current design" remain if it is broken!
> > > > > > > >
> > > > > > > > Why can't the soc driver handle the attributes properly so that the
> > > > > > > > individual driver doesn't have to do the create/remove?
> > > > > > > >
> > > > > > >
> > > > > > > The custom attributes that these drivers want to add to the common ones
> > > > > > > are known in advance, so I presume we could have them passed into
> > > > > > > soc_device_register() and registered together with the common
> > > > > > > attributes...
> > > > > > >
> > > > > > > It sounds like it's worth a prototype.
> > > > > >
> > > > > > Do you have an in-kernel example I can look at to get an idea of what is
> > > > > > needed here?
> > > > > >
> > > > >
> > > > > realview_soc_probe(), in drivers/soc/versatile/soc-realview.c,
> > > > > implements the current mechanism of acquiring the soc's struct device
> > > > > and then issuing a few device_create_file calls on that.
> > > >
> > > > That looks to be a trivial driver to fix up.  Look at 6d03c140db2e
> > > > ("USB: phy: fsl-usb: convert platform driver to use dev_groups") as an
> > > > example of how to do this.
> > > >
> > > 
> > > The difference between the two cases is that in the fsl-usb case it's
> > > attributes of the device itself, while in the soc case the
> > > realview-soc
> > > driver (or the others doing this) calls soc_device_register() to
> > > register a new (dangling) soc device, which it then adds its
> > > attributes
> > > onto.
> > 
> > That sounds really really odd.  Why can't the soc device do the creation
> > "automatically" when the device is registered?  The soc core should
> > handle this for the soc "drivers", that's what it is there for.
> > 
> Clients are registering to soc framework using "soce_device_register()"
> with "soc_device_attribute". This attribute structure does not have all
> the sysfs fields what client are interested. Hence clients are handling
> their required sysfs fields in their drivers.
> https://elixir.bootlin.com/linux/v5.3/source/drivers/base/soc.c#L114

Then you should fix that :)

> > > We can't use dev_groups, because the soc_device (soc.c) isn't
> > > actually a
> > > driver and the list of attributes is a combination of things from
> > > soc.c
> > > and e.g. soc-realview.c.
> > > 
> > > But if we pass a struct attribute_group into soc_device_register() and
> > > then have that register both groups using dev.groups, this should be
> > > much cleaner at least.
> > 
> > Don't you have a structure you can store these in as well?
> At present client is populating entries one-by-one
> https://android.googlesource.com/kernel/msm/+/android-7.1.0_r0.2/drivers/soc/qcom/socinfo.c#1254

And that is known to be broken and racy and will cause problems with
userspace.  This should be fixed...

thanks,

greg k-h
