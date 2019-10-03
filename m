Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 04CBACAE3D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2019 20:34:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730541AbfJCSeB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Oct 2019 14:34:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:45404 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729993AbfJCSeA (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Oct 2019 14:34:00 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 475E320865;
        Thu,  3 Oct 2019 18:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1570127639;
        bh=2UCdJign97YF4IL+ZKIvS2RsD/fiynf2EXRn2WAn1Tc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pPhDg94CBzRjcrynQGR547eqXKamvDgr/Zox/aoTQANLgJGRa+URmyElU/09TFKAB
         I4pUmmKoE7kwSTfSVPqVE68tqOXftoz6DZDEpv8h5urg065EfHhideGfVOKY813ov5
         3mCtU6qHtfha7pVAFlfkkR8jvtju0WBLeBkF3APk=
Date:   Thu, 3 Oct 2019 20:33:57 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     mnalajal@codeaurora.org
Cc:     rafael@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org
Subject: Re: [PATCH] base: soc: Handle custom soc information sysfs entries
Message-ID: <20191003183357.GA3580296@kroah.com>
References: <1570061174-4918-1-git-send-email-mnalajal@codeaurora.org>
 <20191003070610.GC1814133@kroah.com>
 <0d219d344cea82b5f6c1ab23341de25b@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0d219d344cea82b5f6c1ab23341de25b@codeaurora.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Oct 03, 2019 at 11:23:45AM -0700, mnalajal@codeaurora.org wrote:
> On 2019-10-03 00:06, Greg KH wrote:
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
> > > +
> > >  	/* Fetch a unique (reclaimable) SOC ID. */
> > >  	ret = ida_simple_get(&soc_ida, 0, 0, GFP_KERNEL);
> > >  	if (ret < 0)
> > > -		goto out2;
> > > +		goto out3;
> > >  	soc_dev->soc_dev_num = ret;
> > > 
> > >  	soc_dev->attr = soc_dev_attr;
> > > @@ -151,14 +159,16 @@ struct soc_device *soc_device_register(struct
> > > soc_device_attribute *soc_dev_attr
> > > 
> > >  	ret = device_register(&soc_dev->dev);
> > >  	if (ret)
> > > -		goto out3;
> > > +		goto out4;
> > > 
> > >  	return soc_dev;
> > > 
> > > -out3:
> > > +out4:
> > >  	ida_simple_remove(&soc_ida, soc_dev->soc_dev_num);
> > >  	put_device(&soc_dev->dev);
> > >  	soc_dev = NULL;
> > > +out3:
> > > +	kfree(soc_attr_groups);
> > >  out2:
> > >  	kfree(soc_dev);
> > >  out1:
> > > diff --git a/include/linux/sys_soc.h b/include/linux/sys_soc.h
> > > index 48ceea8..d9b3cf0 100644
> > > --- a/include/linux/sys_soc.h
> > > +++ b/include/linux/sys_soc.h
> > > @@ -15,6 +15,7 @@ struct soc_device_attribute {
> > >  	const char *serial_number;
> > >  	const char *soc_id;
> > >  	const void *data;
> > > +	const struct attribute_group *custom_attr_group;
> > 
> > Shouldn't you make this:
> > 	const struct attribute_group **soc_groups;
> > 
> > to match up with the rest of the way the driver core works?
> Assumption is, soc drivers send their custom attribute group and soc
> framework has already soc_attr_group" (basic info exposed).
> With my changes i am combining these two groups and passing to
> "device_register()".
> I do not think soc drivers have a requirement where they can pass various
> groups rather one single group attribute.

Ok, I guess this is "good enough" such that no individual SOC driver
will want to create subdirs and lots of fun like that.  If they do, then
we can change the api at that point in time :)

thanks,

greg k-h
