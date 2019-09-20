Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 872EDB89BF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Sep 2019 05:36:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404059AbfITDgz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Sep 2019 23:36:55 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:39201 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404039AbfITDgz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Sep 2019 23:36:55 -0400
Received: by mail-pf1-f195.google.com with SMTP id i1so3595438pfa.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Sep 2019 20:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=lUYR9AKlw+Jg9fAgp+bo3evKjj5u2pOik0hEjvoOS0w=;
        b=b/bXOaJR7UYWCi+V3oKX2f3XqiEJ4C3XjD6bwqnfTXN8KE/2m6efJJGExtqcdVuzH7
         PjH/QPiHNdTWoefXDNhCyCzGEO8WC4dw8meNZF/6W1TJrWpO98qaJMvYM6Y54yAgYeUQ
         mhi911axepO0/Tb5iRaKWl705pV3Lz6Dw12YWE1r94lKivor6cElZeYmnrVwkYN0Nfvy
         Y85CYYlhnNr6d8nIXNjhhhizdNI8UHaPDv7mAmZmllIbcxHNCKkH1nx4yhYmIymQ0FZo
         gMKkQlEEPrkOcTyYI94oqn7/OtFDai7OHYP5V6Rc2Se+WZL/zbkM8D0K2UnGWP3Axj82
         uKTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=lUYR9AKlw+Jg9fAgp+bo3evKjj5u2pOik0hEjvoOS0w=;
        b=Z6fdCl986zZ5A7JIu2V28V60UWJX/Ok9yZ/GhedKjFjmJLCgQfDkmpGG0MrqpvX87b
         zkgBnbzqZh2mD+VbOR0ac2LcHh8CGLqCV23nyD03zLMff9qlayGI8YruJdsNsxpSevIr
         drjJ2yjdXcz8wXJaE8bmbjOEO76NJRnFJBYwoVX+7/MAu2kTiI82OO9U8nXxlN6iMDwi
         XUAkszTa4cbhwvVBO/1hujV0Iby62TvD6cXe0LOekHkZcUMc2Asp72g17+LMUKGhRaju
         qeRgQ6XzPkPlHDE61R96tkpBIG84+qz6E4Cm3I/TYGoB0BTtpjsKXAEmuEasO4T6yA7b
         KUkw==
X-Gm-Message-State: APjAAAVrcgTns2fEW/CvatM74gzG1oqQDp7L9rJ/mCZAnazTEwN/IxT5
        iW9o1T4W8eu/VAwfJ3r0UG7V1w==
X-Google-Smtp-Source: APXvYqwYu8Uko2gE0dG/f15yfaYTsBLl2OxEokOTCPqok1ivZmMoaulMDNzzxEQhIao/eOxoz+HN0Q==
X-Received: by 2002:a62:2ac9:: with SMTP id q192mr14936302pfq.189.1568950614272;
        Thu, 19 Sep 2019 20:36:54 -0700 (PDT)
Received: from minitux (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id q88sm443897pjq.9.2019.09.19.20.36.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2019 20:36:53 -0700 (PDT)
Date:   Thu, 19 Sep 2019 20:36:51 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Murali Nalajala <mnalajal@codeaurora.org>, rafael@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] base: soc: Export soc_device_to_device API
Message-ID: <20190920033651.GC63675@minitux>
References: <1568927624-13682-1-git-send-email-mnalajal@codeaurora.org>
 <20190919213203.GA395325@kroah.com>
 <20190919215300.GC1418@minitux>
 <20190919215836.GA426988@kroah.com>
 <20190919221456.GA63675@minitux>
 <20190919222525.GA445429@kroah.com>
 <20190919224017.GB63675@minitux>
 <20190919224514.GA447028@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190919224514.GA447028@kroah.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 19 Sep 15:45 PDT 2019, Greg KH wrote:

> On Thu, Sep 19, 2019 at 03:40:17PM -0700, Bjorn Andersson wrote:
> > On Thu 19 Sep 15:25 PDT 2019, Greg KH wrote:
> > 
> > > On Thu, Sep 19, 2019 at 03:14:56PM -0700, Bjorn Andersson wrote:
> > > > On Thu 19 Sep 14:58 PDT 2019, Greg KH wrote:
> > > > 
> > > > > On Thu, Sep 19, 2019 at 02:53:00PM -0700, Bjorn Andersson wrote:
> > > > > > On Thu 19 Sep 14:32 PDT 2019, Greg KH wrote:
> > > > > > 
> > > > > > > On Thu, Sep 19, 2019 at 02:13:44PM -0700, Murali Nalajala wrote:
> > > > > > > > If the soc drivers want to add custom sysfs entries it needs to
> > > > > > > > access "dev" field in "struct soc_device". This can be achieved
> > > > > > > > by "soc_device_to_device" API. Soc drivers which are built as a
> > > > > > > > module they need above API to be exported. Otherwise one can
> > > > > > > > observe compilation issues.
> > > > > > > > 
> > > > > > > > Signed-off-by: Murali Nalajala <mnalajal@codeaurora.org>
> > > > > > > > ---
> > > > > > > >  drivers/base/soc.c | 1 +
> > > > > > > >  1 file changed, 1 insertion(+)
> > > > > > > > 
> > > > > > > > diff --git a/drivers/base/soc.c b/drivers/base/soc.c
> > > > > > > > index 7c0c5ca..4ad52f6 100644
> > > > > > > > --- a/drivers/base/soc.c
> > > > > > > > +++ b/drivers/base/soc.c
> > > > > > > > @@ -41,6 +41,7 @@ struct device *soc_device_to_device(struct soc_device *soc_dev)
> > > > > > > >  {
> > > > > > > >  	return &soc_dev->dev;
> > > > > > > >  }
> > > > > > > > +EXPORT_SYMBOL_GPL(soc_device_to_device);
> > > > > > > >  
> > > > > > > >  static umode_t soc_attribute_mode(struct kobject *kobj,
> > > > > > > >  				struct attribute *attr,
> > > > > > > 
> > > > > > > What in-kernel driver needs this?
> > > > > > > 
> > > > > > 
> > > > > > Half of the drivers interacting with the soc driver calls this API,
> > > > > > several of these I see no reason for being builtin (e.g.
> > > > > > ux500 andversatile). So I think this patch makes sense to allow us to
> > > > > > build these as modules.
> > > > > > 
> > > > > > > Is linux-next breaking without this?
> > > > > > > 
> > > > > > 
> > > > > > No, we postponed the addition of any sysfs attributes in the Qualcomm
> > > > > > socinfo driver.
> > > > > > 
> > > > > > > We don't export things unless we have a user of the export.
> > > > > > > 
> > > > > > > Also, adding "custom" sysfs attributes is almost always not the correct
> > > > > > > thing to do at all.  The driver should be doing it, by setting up the
> > > > > > > attribute group properly so that the driver core can do it automatically
> > > > > > > for it.
> > > > > > > 
> > > > > > > No driver should be doing individual add/remove of sysfs files.  If it
> > > > > > > does so, it is almost guaranteed to be doing it incorrectly and racing
> > > > > > > userspace.
> > > > > > > 
> > > > > > 
> > > > > > The problem here is that the attributes are expected to be attached to
> > > > > > the soc driver, which is separate from the platform-specific drivers. So
> > > > > > there's no way to do platform specific attributes the right way.
> > > > > > 
> > > > > > > And yes, there's loads of in-kernel examples of doing this wrong, I've
> > > > > > > been working on fixing that up, look at the patches now in Linus's tree
> > > > > > > for platform and USB drivers that do this as examples of how to do it
> > > > > > > right.
> > > > > > > 
> > > > > > 
> > > > > > Agreed, this patch should not be used as an approval for any crazy
> > > > > > attributes; but it's necessary in order to extend the soc device's
> > > > > > attributes, per the current design.
> > > > > 
> > > > > Wait, no, let's not let the "current design" remain if it is broken!
> > > > > 
> > > > > Why can't the soc driver handle the attributes properly so that the
> > > > > individual driver doesn't have to do the create/remove?
> > > > > 
> > > > 
> > > > The custom attributes that these drivers want to add to the common ones
> > > > are known in advance, so I presume we could have them passed into
> > > > soc_device_register() and registered together with the common
> > > > attributes...
> > > > 
> > > > It sounds like it's worth a prototype.
> > > 
> > > Do you have an in-kernel example I can look at to get an idea of what is
> > > needed here?
> > > 
> > 
> > realview_soc_probe(), in drivers/soc/versatile/soc-realview.c,
> > implements the current mechanism of acquiring the soc's struct device
> > and then issuing a few device_create_file calls on that.
> 
> That looks to be a trivial driver to fix up.  Look at 6d03c140db2e
> ("USB: phy: fsl-usb: convert platform driver to use dev_groups") as an
> example of how to do this.
> 

The difference between the two cases is that in the fsl-usb case it's
attributes of the device itself, while in the soc case the realview-soc
driver (or the others doing this) calls soc_device_register() to
register a new (dangling) soc device, which it then adds its attributes
onto.

We can't use dev_groups, because the soc_device (soc.c) isn't actually a
driver and the list of attributes is a combination of things from soc.c
and e.g. soc-realview.c.

But if we pass a struct attribute_group into soc_device_register() and
then have that register both groups using dev.groups, this should be
much cleaner at least.

> Also gotta love the total lack of error checking when calling
> device_create_file() in that driver :(
> 

That's how we roll in the shire...

Regards,
Bjorn
