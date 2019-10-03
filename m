Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C52ACAE26
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2019 20:28:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732192AbfJCS2g (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Oct 2019 14:28:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:43172 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730777AbfJCS2g (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Oct 2019 14:28:36 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9E09F20867;
        Thu,  3 Oct 2019 18:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1570127315;
        bh=qWk4KL6IyNbqywj/uje+OIlaPyHD8QGpGwTbJRVklwE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WcgyBnoZyTyLNZOz6eCaddr2qnZYTEmT87GxGsWbv3DYmCYVaNTKJUPJvqWu6G54E
         QzbO4Tn1rK4yGqXbPheOYQcrWMtDuM1TeCIJ3CojBMYbz1j3cm+KPSJILJAZHlVQfr
         UEjWfb9msH4XqwES2fLv6msgYEbgtCvnoHrmrHKE=
Date:   Thu, 3 Oct 2019 20:28:32 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     mnalajal@codeaurora.org
Cc:     rafael@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org
Subject: Re: [PATCH] base: soc: Handle custom soc information sysfs entries
Message-ID: <20191003182832.GA3579521@kroah.com>
References: <1570061174-4918-1-git-send-email-mnalajal@codeaurora.org>
 <20191003070502.GB1814133@kroah.com>
 <dd126bd256feb2e32f38409b2a7ba5cc@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dd126bd256feb2e32f38409b2a7ba5cc@codeaurora.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Oct 03, 2019 at 11:17:39AM -0700, mnalajal@codeaurora.org wrote:
> On 2019-10-03 00:05, Greg KH wrote:
> > On Wed, Oct 02, 2019 at 05:06:14PM -0700, Murali Nalajala wrote:
> > > Soc framework exposed sysfs entries are not sufficient for some
> > > of the h/w platforms. Currently there is no interface where soc
> > > drivers can expose further information about their SoCs via soc
> > > framework. This change address this limitation where clients can
> > > pass their custom entries as attribute group and soc framework
> > > would expose them as sysfs properties.
> > > 
> > > Signed-off-by: Murali Nalajala <mnalajal@codeaurora.org>
> > > ---
> > >  drivers/base/soc.c      | 26 ++++++++++++++++++--------
> > >  include/linux/sys_soc.h |  1 +
> > >  2 files changed, 19 insertions(+), 8 deletions(-)
> > 
> > Can you change a soc driver to use this?  I don't think that this patch
> > works because:
> > 
> > > 
> > > diff --git a/drivers/base/soc.c b/drivers/base/soc.c
> > > index 7c0c5ca..ec70a58 100644
> > > --- a/drivers/base/soc.c
> > > +++ b/drivers/base/soc.c
> > > @@ -15,6 +15,8 @@
> > >  #include <linux/err.h>
> > >  #include <linux/glob.h>
> > > 
> > > +#define NUM_ATTR_GROUPS 3
> > > +
> > >  static DEFINE_IDA(soc_ida);
> > > 
> > >  static ssize_t soc_info_get(struct device *dev,
> > > @@ -104,11 +106,6 @@ static ssize_t soc_info_get(struct device *dev,
> > >  	.is_visible = soc_attribute_mode,
> > >  };
> > > 
> > > -static const struct attribute_group *soc_attr_groups[] = {
> > > -	&soc_attr_group,
> > > -	NULL,
> > > -};
> > > -
> > >  static void soc_release(struct device *dev)
> > >  {
> > >  	struct soc_device *soc_dev = container_of(dev, struct soc_device,
> > > dev);
> > > @@ -121,6 +118,7 @@ static void soc_release(struct device *dev)
> > >  struct soc_device *soc_device_register(struct soc_device_attribute
> > > *soc_dev_attr)
> > >  {
> > >  	struct soc_device *soc_dev;
> > > +	const struct attribute_group **soc_attr_groups = NULL;
> > >  	int ret;
> > > 
> > >  	if (!soc_bus_type.p) {
> > > @@ -136,10 +134,20 @@ struct soc_device *soc_device_register(struct
> > > soc_device_attribute *soc_dev_attr
> > >  		goto out1;
> > >  	}
> > > 
> > > +	soc_attr_groups = kzalloc(sizeof(*soc_attr_groups) *
> > > +						NUM_ATTR_GROUPS, GFP_KERNEL);
> > > +	if (!soc_attr_groups) {
> > > +		ret = -ENOMEM;
> > > +		goto out2;
> > > +	}
> > > +	soc_attr_groups[0] = &soc_attr_group;
> > > +	soc_attr_groups[1] = soc_dev_attr->custom_attr_group;
> > > +	soc_attr_groups[2] = NULL;
> > 
> > You set this, but never do anything with it that I can see.  What am I
> > missing?
> no, since i am using the "soc_attr_groups" name as it here you do not see
> the assignment below.
> It is something like this soc_dev->dev.groups = soc_attr_groups;

Ah, I see that now.  Tricky :)

nice work,

greg k-h
