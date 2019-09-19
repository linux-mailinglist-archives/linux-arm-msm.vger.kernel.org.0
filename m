Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 254E5B8643
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Sep 2019 00:28:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406472AbfISW1u (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Sep 2019 18:27:50 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:51630 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405935AbfISW1t (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Sep 2019 18:27:49 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id BABD3616DA; Thu, 19 Sep 2019 22:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1568932068;
        bh=v4Fw1Ccf/Ml4nw4r3xNknb4uIdQAiU0adr4+naX9xMs=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=REVa0NcMISAwfAkmgDXqIsrb/PKRju1p2TcymQ3K1GRyZha783cRfzyQ0RgVYWweI
         Il9X/TAUJsPwdC6AuxodvIyNQN9TwPR2iUgZIi6rnMpOAgsnBEUYFXEQ1p7I1oAhsf
         vG86uU71203hGkIq8RAskE4Itmw5J9jSxk9+Q80E=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        by smtp.codeaurora.org (Postfix) with ESMTP id 7BF93616B8;
        Thu, 19 Sep 2019 22:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1568932065;
        bh=v4Fw1Ccf/Ml4nw4r3xNknb4uIdQAiU0adr4+naX9xMs=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=jMzhJlLamm3vIz12gBBjv49vXxrXiPMzuK1RKoyEL25W2yhYvJXsmyspjEo5z7Efj
         X9MTR9VJgAfAzEYvkmXijuo2QcL+l5/xFfCOfOQJD1Q4FDTroT308vPcyTRYY9d4rS
         s+UL1if4W15NxZCpxCcXU6XHDSnwoRATi2f0dZw0=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 19 Sep 2019 15:27:45 -0700
From:   mnalajal@codeaurora.org
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>, rafael@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] base: soc: Export soc_device_to_device API
In-Reply-To: <20190919215836.GA426988@kroah.com>
References: <1568927624-13682-1-git-send-email-mnalajal@codeaurora.org>
 <20190919213203.GA395325@kroah.com> <20190919215300.GC1418@minitux>
 <20190919215836.GA426988@kroah.com>
Message-ID: <0fa861c7210c0e929a9955f48e1486ee@codeaurora.org>
X-Sender: mnalajal@codeaurora.org
User-Agent: Roundcube Webmail/1.2.5
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2019-09-19 14:58, Greg KH wrote:
> On Thu, Sep 19, 2019 at 02:53:00PM -0700, Bjorn Andersson wrote:
>> On Thu 19 Sep 14:32 PDT 2019, Greg KH wrote:
>> 
>> > On Thu, Sep 19, 2019 at 02:13:44PM -0700, Murali Nalajala wrote:
>> > > If the soc drivers want to add custom sysfs entries it needs to
>> > > access "dev" field in "struct soc_device". This can be achieved
>> > > by "soc_device_to_device" API. Soc drivers which are built as a
>> > > module they need above API to be exported. Otherwise one can
>> > > observe compilation issues.
>> > >
>> > > Signed-off-by: Murali Nalajala <mnalajal@codeaurora.org>
>> > > ---
>> > >  drivers/base/soc.c | 1 +
>> > >  1 file changed, 1 insertion(+)
>> > >
>> > > diff --git a/drivers/base/soc.c b/drivers/base/soc.c
>> > > index 7c0c5ca..4ad52f6 100644
>> > > --- a/drivers/base/soc.c
>> > > +++ b/drivers/base/soc.c
>> > > @@ -41,6 +41,7 @@ struct device *soc_device_to_device(struct soc_device *soc_dev)
>> > >  {
>> > >  	return &soc_dev->dev;
>> > >  }
>> > > +EXPORT_SYMBOL_GPL(soc_device_to_device);
>> > >
>> > >  static umode_t soc_attribute_mode(struct kobject *kobj,
>> > >  				struct attribute *attr,
>> >
>> > What in-kernel driver needs this?
>> >
>> 
>> Half of the drivers interacting with the soc driver calls this API,
>> several of these I see no reason for being builtin (e.g.
>> ux500 andversatile). So I think this patch makes sense to allow us to
>> build these as modules.
>> 
>> > Is linux-next breaking without this?
>> >
>> 
>> No, we postponed the addition of any sysfs attributes in the Qualcomm
>> socinfo driver.
>> 
>> > We don't export things unless we have a user of the export.
>> >
>> > Also, adding "custom" sysfs attributes is almost always not the correct
>> > thing to do at all.  The driver should be doing it, by setting up the
>> > attribute group properly so that the driver core can do it automatically
>> > for it.
>> >
>> > No driver should be doing individual add/remove of sysfs files.  If it
>> > does so, it is almost guaranteed to be doing it incorrectly and racing
>> > userspace.
>> >
>> 
>> The problem here is that the attributes are expected to be attached to
>> the soc driver, which is separate from the platform-specific drivers. 
>> So
>> there's no way to do platform specific attributes the right way.
>> 
>> > And yes, there's loads of in-kernel examples of doing this wrong, I've
>> > been working on fixing that up, look at the patches now in Linus's tree
>> > for platform and USB drivers that do this as examples of how to do it
>> > right.
>> >
>> 
>> Agreed, this patch should not be used as an approval for any crazy
>> attributes; but it's necessary in order to extend the soc device's
>> attributes, per the current design.
> 
> Wait, no, let's not let the "current design" remain if it is broken!
> 
> Why can't the soc driver handle the attributes properly so that the
> individual driver doesn't have to do the create/remove?
> 
> thanks,
> 
> greg k-h

Current soc framework is allowing the soc info drivers to create very 
limited
soc information as sysfs entries like machine name, family, revision and 
soc_id.
Sometimes it become a limited information for the clients to know more 
about soc
information. In this scenario soc info drivers are adding their own 
sysfs entries
on top of what soc framework is doing like hw_platform, 
hw_platform_subtype etc.
I believe this will be an issue for the other soc vendors as well. It is 
good that
if we could add these into the soc framework rather than individual 
clients defining
and adding them as per their requirement.
