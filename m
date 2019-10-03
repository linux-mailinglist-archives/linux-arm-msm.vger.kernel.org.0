Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EF5B0CB0DA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2019 23:11:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729763AbfJCVLF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Oct 2019 17:11:05 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:56462 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727789AbfJCVLE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Oct 2019 17:11:04 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 64B306155E; Thu,  3 Oct 2019 21:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1570137063;
        bh=6Y7obBeUmhg7/SW9V/ajjOEqPTX+NgguganrNVb4VwI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=dFQI5g+svq2BS+x87vr+N0qhKq7jPQfnR0UVViT3hxAmI8cX7AMgpDdWo4rMkUpjv
         ooCP6mBjOHVuWAmUjz4xpx/Bqu6yZ1mf/d3VsLb8WIbTR8mJDbpvTYQQsGDcfsx7fX
         nJqAVdhjpCQgkl6+Pg7C22rJ5L02hxp15glCLyL4=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        by smtp.codeaurora.org (Postfix) with ESMTP id 71EE26034E;
        Thu,  3 Oct 2019 21:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1570137062;
        bh=6Y7obBeUmhg7/SW9V/ajjOEqPTX+NgguganrNVb4VwI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=WyhoZ2nqBpVdaN1DlEfAP3JK+Jb6VszufCRKdeQt+e2H24sqAdihEW4iWu/me4lCk
         tlm6mvOhhzkE5nnNaL9IrgI6RdzrZoc7VXBSCOFZf+oGWEu6rpWWGJdAdaDGC3XuDZ
         2vn3qDxmtQrvhUl1nnLusFJ0JEEnUX4evB52kKuE=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 03 Oct 2019 14:11:02 -0700
From:   mnalajal@codeaurora.org
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     rafael@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org
Subject: Re: [PATCH] base: soc: Handle custom soc information sysfs entries
In-Reply-To: <20191003183357.GA3580296@kroah.com>
References: <1570061174-4918-1-git-send-email-mnalajal@codeaurora.org>
 <20191003070610.GC1814133@kroah.com>
 <0d219d344cea82b5f6c1ab23341de25b@codeaurora.org>
 <20191003183357.GA3580296@kroah.com>
Message-ID: <6e7d5e14c231d2fe51c7ae78d5d0dee8@codeaurora.org>
X-Sender: mnalajal@codeaurora.org
User-Agent: Roundcube Webmail/1.2.5
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2019-10-03 11:33, Greg KH wrote:
> On Thu, Oct 03, 2019 at 11:23:45AM -0700, mnalajal@codeaurora.org 
> wrote:
>> On 2019-10-03 00:06, Greg KH wrote:
>> > On Wed, Oct 02, 2019 at 05:06:14PM -0700, Murali Nalajala wrote:
>> > > Soc framework exposed sysfs entries are not sufficient for some
>> > > of the h/w platforms. Currently there is no interface where soc
>> > > drivers can expose further information about their SoCs via soc
>> > > framework. This change address this limitation where clients can
>> > > pass their custom entries as attribute group and soc framework
>> > > would expose them as sysfs properties.
>> > >
>> > > Signed-off-by: Murali Nalajala <mnalajal@codeaurora.org>
>> > > ---
>> > >  drivers/base/soc.c      | 26 ++++++++++++++++++--------
>> > >  include/linux/sys_soc.h |  1 +
>> > >  2 files changed, 19 insertions(+), 8 deletions(-)
>> > >
>> > > diff --git a/drivers/base/soc.c b/drivers/base/soc.c
>> > > index 7c0c5ca..ec70a58 100644
>> > > --- a/drivers/base/soc.c
>> > > +++ b/drivers/base/soc.c
>> > > @@ -15,6 +15,8 @@
>> > >  #include <linux/err.h>
>> > >  #include <linux/glob.h>
>> > >
>> > > +#define NUM_ATTR_GROUPS 3
>> > > +
>> > >  static DEFINE_IDA(soc_ida);
>> > >
>> > >  static ssize_t soc_info_get(struct device *dev,
>> > > @@ -104,11 +106,6 @@ static ssize_t soc_info_get(struct device *dev,
>> > >  	.is_visible = soc_attribute_mode,
>> > >  };
>> > >
>> > > -static const struct attribute_group *soc_attr_groups[] = {
>> > > -	&soc_attr_group,
>> > > -	NULL,
>> > > -};
>> > > -
>> > >  static void soc_release(struct device *dev)
>> > >  {
>> > >  	struct soc_device *soc_dev = container_of(dev, struct soc_device,
>> > > dev);
>> > > @@ -121,6 +118,7 @@ static void soc_release(struct device *dev)
>> > >  struct soc_device *soc_device_register(struct soc_device_attribute
>> > > *soc_dev_attr)
>> > >  {
>> > >  	struct soc_device *soc_dev;
>> > > +	const struct attribute_group **soc_attr_groups = NULL;
>> > >  	int ret;
>> > >
>> > >  	if (!soc_bus_type.p) {
>> > > @@ -136,10 +134,20 @@ struct soc_device *soc_device_register(struct
>> > > soc_device_attribute *soc_dev_attr
>> > >  		goto out1;
>> > >  	}
>> > >
>> > > +	soc_attr_groups = kzalloc(sizeof(*soc_attr_groups) *
>> > > +						NUM_ATTR_GROUPS, GFP_KERNEL);
>> > > +	if (!soc_attr_groups) {
>> > > +		ret = -ENOMEM;
>> > > +		goto out2;
>> > > +	}
>> > > +	soc_attr_groups[0] = &soc_attr_group;
>> > > +	soc_attr_groups[1] = soc_dev_attr->custom_attr_group;
>> > > +	soc_attr_groups[2] = NULL;
>> > > +
>> > >  	/* Fetch a unique (reclaimable) SOC ID. */
>> > >  	ret = ida_simple_get(&soc_ida, 0, 0, GFP_KERNEL);
>> > >  	if (ret < 0)
>> > > -		goto out2;
>> > > +		goto out3;
>> > >  	soc_dev->soc_dev_num = ret;
>> > >
>> > >  	soc_dev->attr = soc_dev_attr;
>> > > @@ -151,14 +159,16 @@ struct soc_device *soc_device_register(struct
>> > > soc_device_attribute *soc_dev_attr
>> > >
>> > >  	ret = device_register(&soc_dev->dev);
>> > >  	if (ret)
>> > > -		goto out3;
>> > > +		goto out4;
>> > >
>> > >  	return soc_dev;
>> > >
>> > > -out3:
>> > > +out4:
>> > >  	ida_simple_remove(&soc_ida, soc_dev->soc_dev_num);
>> > >  	put_device(&soc_dev->dev);
>> > >  	soc_dev = NULL;
>> > > +out3:
>> > > +	kfree(soc_attr_groups);
>> > >  out2:
>> > >  	kfree(soc_dev);
>> > >  out1:
>> > > diff --git a/include/linux/sys_soc.h b/include/linux/sys_soc.h
>> > > index 48ceea8..d9b3cf0 100644
>> > > --- a/include/linux/sys_soc.h
>> > > +++ b/include/linux/sys_soc.h
>> > > @@ -15,6 +15,7 @@ struct soc_device_attribute {
>> > >  	const char *serial_number;
>> > >  	const char *soc_id;
>> > >  	const void *data;
>> > > +	const struct attribute_group *custom_attr_group;
>> >
>> > Shouldn't you make this:
>> > 	const struct attribute_group **soc_groups;
>> >
>> > to match up with the rest of the way the driver core works?
>> Assumption is, soc drivers send their custom attribute group and soc
>> framework has already soc_attr_group" (basic info exposed).
>> With my changes i am combining these two groups and passing to
>> "device_register()".
>> I do not think soc drivers have a requirement where they can pass 
>> various
>> groups rather one single group attribute.
> 
> Ok, I guess this is "good enough" such that no individual SOC driver
> will want to create subdirs and lots of fun like that.  If they do, 
> then
> we can change the api at that point in time :)
> 
> thanks,
> 
> greg k-h

I trying to fix an issue in the existing "soc_device_register()" code. 
This looks to me a memory leak.

	ret = device_register(&soc_dev->dev);
	if (ret)
		goto out3;
	return soc_dev;
out3:
	ida_simple_remove(&soc_ida, soc_dev->soc_dev_num);
	put_device(&soc_dev->dev);
	soc_dev = NULL;
out2:
	kfree(soc_dev);

Here we are assigning "soc_dev=NULL" before freeing. I see this 
assignment is unnecessary here.
