Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8E79FB8824
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Sep 2019 01:39:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390469AbfISXja (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Sep 2019 19:39:30 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:45508 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390217AbfISXja (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Sep 2019 19:39:30 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 6751E6118C; Thu, 19 Sep 2019 23:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1568936368;
        bh=/N5LA3VZRheX/0Vim93hGoS5MshyffKsHn+ugEInpsU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=d/MLPwEBBiqRT+DvBnqFclfRSiEfy5PaUKHX9mJZE1KDQLd/7ydZMsIPHhZBOqcHF
         yE8iMG9AWvOPwgo7ID04znjQZpj4K+DsLal1e2Q51GzwEPkpKVQYYKXtRomLqvdP2P
         aN8bEOZI8Ga8VUPhDEN8kpSP+Zr8rPaU1USvRTKQ=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        by smtp.codeaurora.org (Postfix) with ESMTP id 80DB561197;
        Thu, 19 Sep 2019 23:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1568936367;
        bh=/N5LA3VZRheX/0Vim93hGoS5MshyffKsHn+ugEInpsU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=fcaT3HBOanXCmHj2+Xb2t7at/xuhDH6/FyHlyTAReApGsnPC8QmNm9Xb+PXi8QCkT
         8gu/S7l1I/tM8CwrGm2PBCrjGqaXZbzu8uUbVv2tr8QGGRKJAsdn+WvUgvSfidFl4Y
         4ImccfN01246ZwoVDIeWwlG0zmrvA/xO6msMyu7g=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 19 Sep 2019 16:39:27 -0700
From:   mnalajal@codeaurora.org
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>, rafael@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] base: soc: Export soc_device_to_device API
In-Reply-To: <20190919224514.GA447028@kroah.com>
References: <1568927624-13682-1-git-send-email-mnalajal@codeaurora.org>
 <20190919213203.GA395325@kroah.com> <20190919215300.GC1418@minitux>
 <20190919215836.GA426988@kroah.com> <20190919221456.GA63675@minitux>
 <20190919222525.GA445429@kroah.com> <20190919224017.GB63675@minitux>
 <20190919224514.GA447028@kroah.com>
Message-ID: <e14ea48acef0776bd3bd442074441288@codeaurora.org>
X-Sender: mnalajal@codeaurora.org
User-Agent: Roundcube Webmail/1.2.5
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2019-09-19 15:45, Greg KH wrote:
> On Thu, Sep 19, 2019 at 03:40:17PM -0700, Bjorn Andersson wrote:
>> On Thu 19 Sep 15:25 PDT 2019, Greg KH wrote:
>> 
>> > On Thu, Sep 19, 2019 at 03:14:56PM -0700, Bjorn Andersson wrote:
>> > > On Thu 19 Sep 14:58 PDT 2019, Greg KH wrote:
>> > >
>> > > > On Thu, Sep 19, 2019 at 02:53:00PM -0700, Bjorn Andersson wrote:
>> > > > > On Thu 19 Sep 14:32 PDT 2019, Greg KH wrote:
>> > > > >
>> > > > > > On Thu, Sep 19, 2019 at 02:13:44PM -0700, Murali Nalajala wrote:
>> > > > > > > If the soc drivers want to add custom sysfs entries it needs to
>> > > > > > > access "dev" field in "struct soc_device". This can be achieved
>> > > > > > > by "soc_device_to_device" API. Soc drivers which are built as a
>> > > > > > > module they need above API to be exported. Otherwise one can
>> > > > > > > observe compilation issues.
>> > > > > > >
>> > > > > > > Signed-off-by: Murali Nalajala <mnalajal@codeaurora.org>
>> > > > > > > ---
>> > > > > > >  drivers/base/soc.c | 1 +
>> > > > > > >  1 file changed, 1 insertion(+)
>> > > > > > >
>> > > > > > > diff --git a/drivers/base/soc.c b/drivers/base/soc.c
>> > > > > > > index 7c0c5ca..4ad52f6 100644
>> > > > > > > --- a/drivers/base/soc.c
>> > > > > > > +++ b/drivers/base/soc.c
>> > > > > > > @@ -41,6 +41,7 @@ struct device *soc_device_to_device(struct soc_device *soc_dev)
>> > > > > > >  {
>> > > > > > >  	return &soc_dev->dev;
>> > > > > > >  }
>> > > > > > > +EXPORT_SYMBOL_GPL(soc_device_to_device);
>> > > > > > >
>> > > > > > >  static umode_t soc_attribute_mode(struct kobject *kobj,
>> > > > > > >  				struct attribute *attr,
>> > > > > >
>> > > > > > What in-kernel driver needs this?
>> > > > > >
>> > > > >
>> > > > > Half of the drivers interacting with the soc driver calls this API,
>> > > > > several of these I see no reason for being builtin (e.g.
>> > > > > ux500 andversatile). So I think this patch makes sense to allow us to
>> > > > > build these as modules.
>> > > > >
>> > > > > > Is linux-next breaking without this?
>> > > > > >
>> > > > >
>> > > > > No, we postponed the addition of any sysfs attributes in the Qualcomm
>> > > > > socinfo driver.
>> > > > >
>> > > > > > We don't export things unless we have a user of the export.
>> > > > > >
>> > > > > > Also, adding "custom" sysfs attributes is almost always not the correct
>> > > > > > thing to do at all.  The driver should be doing it, by setting up the
>> > > > > > attribute group properly so that the driver core can do it automatically
>> > > > > > for it.
>> > > > > >
>> > > > > > No driver should be doing individual add/remove of sysfs files.  If it
>> > > > > > does so, it is almost guaranteed to be doing it incorrectly and racing
>> > > > > > userspace.
>> > > > > >
>> > > > >
>> > > > > The problem here is that the attributes are expected to be attached to
>> > > > > the soc driver, which is separate from the platform-specific drivers. So
>> > > > > there's no way to do platform specific attributes the right way.
>> > > > >
>> > > > > > And yes, there's loads of in-kernel examples of doing this wrong, I've
>> > > > > > been working on fixing that up, look at the patches now in Linus's tree
>> > > > > > for platform and USB drivers that do this as examples of how to do it
>> > > > > > right.
>> > > > > >
>> > > > >
>> > > > > Agreed, this patch should not be used as an approval for any crazy
>> > > > > attributes; but it's necessary in order to extend the soc device's
>> > > > > attributes, per the current design.
>> > > >
>> > > > Wait, no, let's not let the "current design" remain if it is broken!
>> > > >
>> > > > Why can't the soc driver handle the attributes properly so that the
>> > > > individual driver doesn't have to do the create/remove?
>> > > >
>> > >
>> > > The custom attributes that these drivers want to add to the common ones
>> > > are known in advance, so I presume we could have them passed into
>> > > soc_device_register() and registered together with the common
>> > > attributes...
>> > >
>> > > It sounds like it's worth a prototype.
>> >
>> > Do you have an in-kernel example I can look at to get an idea of what is
>> > needed here?
>> >
>> 
>> realview_soc_probe(), in drivers/soc/versatile/soc-realview.c,
>> implements the current mechanism of acquiring the soc's struct device
>> and then issuing a few device_create_file calls on that.
> 
> That looks to be a trivial driver to fix up.  Look at 6d03c140db2e
> ("USB: phy: fsl-usb: convert platform driver to use dev_groups") as an
> example of how to do this.
> 
> Also gotta love the total lack of error checking when calling
> device_create_file() in that driver :(
> 
> thanks,
> 
> greg k-h

You can see example here 
https://android.googlesource.com/kernel/msm/+/android-7.1.0_r0.2/drivers/soc/qcom/socinfo.c#1356
I want to add the custom entries to "soc" device path. This can be 
achieved if i go with "dev_groups"?

sys/devices/soc0 # ls -l
total 0
-r--r--r--    1 root     0             4096 Jan  1 00:01 family
-r--r--r--    1 root     0             4096 Jan  1 00:01 machine
drwxr-xr-x    2 root     0                0 Jan  1 00:01 power
-r--r--r--    1 root     0             4096 Jan  1 00:01 revision
-r--r--r--    1 root     0             4096 Jan  1 00:01 serial_number
lrwxrwxrwx    1 root     0                0 Jan  1 00:01 subsystem -> 
../../bus/soc
-rw-r--r--    1 root     0             4096 Jan  1 00:01 uevent

