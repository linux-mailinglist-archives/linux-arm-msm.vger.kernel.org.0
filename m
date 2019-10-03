Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 82862CB13C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2019 23:36:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733197AbfJCVgy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Oct 2019 17:36:54 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:37249 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731945AbfJCVgy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Oct 2019 17:36:54 -0400
Received: by mail-pl1-f193.google.com with SMTP id u20so2117108plq.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Oct 2019 14:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=tcX5x0C+xpmYXyYNCFKGEi47GTPK36S9z6JV/CqMXvM=;
        b=oLC2xsYXDT6rruB+EivBNYLkjtGT43Znq/A4fpIT7TrnxT717GlHuh7q5l7Cx6PSZL
         HgPaqXdV3HcScyLxcPyesIJnhgo/CmZzY4R6cigv339E7eetOe8JvnZRvuNvVjlwPEGG
         ekBAYMSQ0a8ECLOez4o8F/i05ij0CO4eoPxYYhJdGVXEK+eG543ow7IGuoQJYwfbioNN
         JpGmrDV/poiTVnaQA+KU5uQCslDt1K3CXFz9bCyuLq0iB8Zku1eELxPcWAJvDEP+B65e
         RE5An2nrTjyFJP62QEuBcrDH1xSp4vzTPilPj/uwxvUcWtP8UKczoXPQssUHZbZahk8i
         ti8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=tcX5x0C+xpmYXyYNCFKGEi47GTPK36S9z6JV/CqMXvM=;
        b=e/QgliSrkBKN4H7XFGhKjll/pig6SG0WGfpUlC46LntpHt0Wb6zHqIA+KgMzUOWHUs
         cH7LZLxFC7k8y/9jh49daVbbPflhEGRCSRE6135AULuf6XFo28d9Tcb7X7GqGU+uP3xy
         BPF8EFqgJU+TrH0l3GdKUqOJu6Pd+Lmir73y11w7Bzwq4yLVlrEWsI18svN/watm6lw0
         T5sr2xgkJ5DbCb2ATe4Z+jlDuIkDYf+guRT20E3RG+3oiZ/mfdMKRVvwhr6S3u5gEHZ3
         5K794VU7tHiYcNIFQt8LRIih2NpALly11HoN5u6H82VfIrb3Usl+RC7KxEzSEuus/zki
         nXlQ==
X-Gm-Message-State: APjAAAUWk0u3BvdvMFr8yDLjpyCm+Vt0WGh2uNKY+pznIz6NxXGzKshb
        /f961CcWkfDrqjD8S8+UOjThgQ==
X-Google-Smtp-Source: APXvYqwqTDr05PZx0Wi+AfRkYdAL2FYdwltFLrXQo5Tysz6jBXVcQebqzX54I5rDTZYv8rn8zWh6/g==
X-Received: by 2002:a17:902:9b86:: with SMTP id y6mr12091545plp.10.1570138613043;
        Thu, 03 Oct 2019 14:36:53 -0700 (PDT)
Received: from minitux (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id w11sm4841457pfd.116.2019.10.03.14.36.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2019 14:36:52 -0700 (PDT)
Date:   Thu, 3 Oct 2019 14:36:50 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     mnalajal@codeaurora.org
Cc:     Greg KH <gregkh@linuxfoundation.org>, rafael@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] base: soc: Handle custom soc information sysfs entries
Message-ID: <20191003213650.GF63675@minitux>
References: <1570061174-4918-1-git-send-email-mnalajal@codeaurora.org>
 <20191003070610.GC1814133@kroah.com>
 <0d219d344cea82b5f6c1ab23341de25b@codeaurora.org>
 <20191003183357.GA3580296@kroah.com>
 <6e7d5e14c231d2fe51c7ae78d5d0dee8@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6e7d5e14c231d2fe51c7ae78d5d0dee8@codeaurora.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 03 Oct 14:11 PDT 2019, mnalajal@codeaurora.org wrote:

> On 2019-10-03 11:33, Greg KH wrote:
> > On Thu, Oct 03, 2019 at 11:23:45AM -0700, mnalajal@codeaurora.org wrote:
> > > On 2019-10-03 00:06, Greg KH wrote:
> > > > On Wed, Oct 02, 2019 at 05:06:14PM -0700, Murali Nalajala wrote:
> > > > > Soc framework exposed sysfs entries are not sufficient for some
> > > > > of the h/w platforms. Currently there is no interface where soc
> > > > > drivers can expose further information about their SoCs via soc
> > > > > framework. This change address this limitation where clients can
> > > > > pass their custom entries as attribute group and soc framework
> > > > > would expose them as sysfs properties.
> > > > >
> > > > > Signed-off-by: Murali Nalajala <mnalajal@codeaurora.org>
> > > > > ---
> > > > >  drivers/base/soc.c      | 26 ++++++++++++++++++--------
> > > > >  include/linux/sys_soc.h |  1 +
> > > > >  2 files changed, 19 insertions(+), 8 deletions(-)
> > > > >
> > > > > diff --git a/drivers/base/soc.c b/drivers/base/soc.c
> > > > > index 7c0c5ca..ec70a58 100644
> > > > > --- a/drivers/base/soc.c
> > > > > +++ b/drivers/base/soc.c
> > > > > @@ -15,6 +15,8 @@
> > > > >  #include <linux/err.h>
> > > > >  #include <linux/glob.h>
> > > > >
> > > > > +#define NUM_ATTR_GROUPS 3
> > > > > +
> > > > >  static DEFINE_IDA(soc_ida);
> > > > >
> > > > >  static ssize_t soc_info_get(struct device *dev,
> > > > > @@ -104,11 +106,6 @@ static ssize_t soc_info_get(struct device *dev,
> > > > >  	.is_visible = soc_attribute_mode,
> > > > >  };
> > > > >
> > > > > -static const struct attribute_group *soc_attr_groups[] = {
> > > > > -	&soc_attr_group,
> > > > > -	NULL,
> > > > > -};
> > > > > -
> > > > >  static void soc_release(struct device *dev)
> > > > >  {
> > > > >  	struct soc_device *soc_dev = container_of(dev, struct soc_device,
> > > > > dev);
> > > > > @@ -121,6 +118,7 @@ static void soc_release(struct device *dev)
> > > > >  struct soc_device *soc_device_register(struct soc_device_attribute
> > > > > *soc_dev_attr)
> > > > >  {
> > > > >  	struct soc_device *soc_dev;
> > > > > +	const struct attribute_group **soc_attr_groups = NULL;
> > > > >  	int ret;
> > > > >
> > > > >  	if (!soc_bus_type.p) {
> > > > > @@ -136,10 +134,20 @@ struct soc_device *soc_device_register(struct
> > > > > soc_device_attribute *soc_dev_attr
> > > > >  		goto out1;
> > > > >  	}
> > > > >
> > > > > +	soc_attr_groups = kzalloc(sizeof(*soc_attr_groups) *
> > > > > +						NUM_ATTR_GROUPS, GFP_KERNEL);
> > > > > +	if (!soc_attr_groups) {
> > > > > +		ret = -ENOMEM;
> > > > > +		goto out2;
> > > > > +	}
> > > > > +	soc_attr_groups[0] = &soc_attr_group;
> > > > > +	soc_attr_groups[1] = soc_dev_attr->custom_attr_group;
> > > > > +	soc_attr_groups[2] = NULL;
> > > > > +
> > > > >  	/* Fetch a unique (reclaimable) SOC ID. */
> > > > >  	ret = ida_simple_get(&soc_ida, 0, 0, GFP_KERNEL);
> > > > >  	if (ret < 0)
> > > > > -		goto out2;
> > > > > +		goto out3;
> > > > >  	soc_dev->soc_dev_num = ret;
> > > > >
> > > > >  	soc_dev->attr = soc_dev_attr;
> > > > > @@ -151,14 +159,16 @@ struct soc_device *soc_device_register(struct
> > > > > soc_device_attribute *soc_dev_attr
> > > > >
> > > > >  	ret = device_register(&soc_dev->dev);
> > > > >  	if (ret)
> > > > > -		goto out3;
> > > > > +		goto out4;
> > > > >
> > > > >  	return soc_dev;
> > > > >
> > > > > -out3:
> > > > > +out4:
> > > > >  	ida_simple_remove(&soc_ida, soc_dev->soc_dev_num);
> > > > >  	put_device(&soc_dev->dev);
> > > > >  	soc_dev = NULL;
> > > > > +out3:
> > > > > +	kfree(soc_attr_groups);
> > > > >  out2:
> > > > >  	kfree(soc_dev);
> > > > >  out1:
> > > > > diff --git a/include/linux/sys_soc.h b/include/linux/sys_soc.h
> > > > > index 48ceea8..d9b3cf0 100644
> > > > > --- a/include/linux/sys_soc.h
> > > > > +++ b/include/linux/sys_soc.h
> > > > > @@ -15,6 +15,7 @@ struct soc_device_attribute {
> > > > >  	const char *serial_number;
> > > > >  	const char *soc_id;
> > > > >  	const void *data;
> > > > > +	const struct attribute_group *custom_attr_group;
> > > >
> > > > Shouldn't you make this:
> > > > 	const struct attribute_group **soc_groups;
> > > >
> > > > to match up with the rest of the way the driver core works?
> > > Assumption is, soc drivers send their custom attribute group and soc
> > > framework has already soc_attr_group" (basic info exposed).
> > > With my changes i am combining these two groups and passing to
> > > "device_register()".
> > > I do not think soc drivers have a requirement where they can pass
> > > various
> > > groups rather one single group attribute.
> > 
> > Ok, I guess this is "good enough" such that no individual SOC driver
> > will want to create subdirs and lots of fun like that.  If they do, then
> > we can change the api at that point in time :)
> > 
> > thanks,
> > 
> > greg k-h
> 
> I trying to fix an issue in the existing "soc_device_register()" code. This
> looks to me a memory leak.
> 
> 	ret = device_register(&soc_dev->dev);
> 	if (ret)
> 		goto out3;
> 	return soc_dev;
> out3:
> 	ida_simple_remove(&soc_ida, soc_dev->soc_dev_num);
> 	put_device(&soc_dev->dev);

This put_device() will invoke soc_release() which will free soc_dev.

> 	soc_dev = NULL;

So setting soc_dev to NULL here turns below kfree() into a nop.
> out2:
> 	kfree(soc_dev);
> 
> Here we are assigning "soc_dev=NULL" before freeing. I see this assignment
> is unnecessary here.

The code works as intended and the assignment prevents a double free.
But it's perhaps slightly too clever.


Swapping the allocation order of the ida and soc_dev would make this
clearer.

Regards,
Bjorn
