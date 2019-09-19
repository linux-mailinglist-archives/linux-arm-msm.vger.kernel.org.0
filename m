Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5C4F2B8785
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Sep 2019 00:40:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390601AbfISWkW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Sep 2019 18:40:22 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:33809 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390935AbfISWkV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Sep 2019 18:40:21 -0400
Received: by mail-pf1-f193.google.com with SMTP id b128so3237250pfa.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Sep 2019 15:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=b9dhi22DGfV4gcOygtm3SNQ6uvFYEDEiNsnuOQe93u0=;
        b=gKu+Ahg2yuB0oO2ZMTwP07rspnSYPv2zlzsDoy9slSv2rv9oH/1jh+FJsu6EOOTypI
         8DEU4O23dUOZEeQeA9i0D5DXLF4u/KJGTQyvbkDxDwfdhgs/L8phVoH9jrF8l0D7+cg1
         Oa5GtWtFe1dAuVa3T4UtZZbZu88UFl76NvsF5wqyzSTp6K4yLrX70iqfZ94PoZohAEHJ
         puy2hY1lUU/Y+/UPyZlokquJHVWoQiWCpqMt3h/314+T8ie+bdaPf1Q25cpDeKtXpw1j
         9bhpOAJZavRfJmESl7utTImMCaCQBOVTgpyO54dg8Q4es4a5bAvobd36/MjY5sS98Uma
         DO1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=b9dhi22DGfV4gcOygtm3SNQ6uvFYEDEiNsnuOQe93u0=;
        b=HZrJnjH/L68IN+MKoyuiVDDEQtj78LKNE6MjAsCvXR+QPpv8atTCvI9iw2Mk0mGP6K
         27Mai85SVnsvAgGB65OdssT/bz7vRy8Ag2DRZGVQVQ1teQeu8lidDN3jPBZu+4RykTc3
         HNeBXntaYHBbXJqNbnpWIKFlob9bJsVB83Hdy6xgskuBCylkVWicFOMNBhDv+4+keqep
         6YD/dalZJmKeah96SVol0olhmR2hm7XmMzIbrkn2LE/NdKJPS0KhxuEGy4ClKuv5gWSY
         r4y6bkbdJIPHgXFonAdXkBVA+lcyqC2so/rYUI5Tj39GAYiQ+hrFBVsghjw4jNlmCy7Y
         Pfkg==
X-Gm-Message-State: APjAAAXGqSVJZ74EG3Qzbx+sWOKIlisOnzxEU3gSBrm0gQ0Doui+t0XK
        MWy2UT05eDQ3JnV6NJpDsIbimw==
X-Google-Smtp-Source: APXvYqw08Msr4i0nhQ2ndrhAG+NouWNKIz2XrT97vzibdTxq0LQvBREu3FJamjdwMk+UhTHvJmQM6Q==
X-Received: by 2002:a17:90a:b309:: with SMTP id d9mr335328pjr.8.1568932819932;
        Thu, 19 Sep 2019 15:40:19 -0700 (PDT)
Received: from minitux (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id g12sm8619350pgb.26.2019.09.19.15.40.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2019 15:40:19 -0700 (PDT)
Date:   Thu, 19 Sep 2019 15:40:17 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Murali Nalajala <mnalajal@codeaurora.org>, rafael@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] base: soc: Export soc_device_to_device API
Message-ID: <20190919224017.GB63675@minitux>
References: <1568927624-13682-1-git-send-email-mnalajal@codeaurora.org>
 <20190919213203.GA395325@kroah.com>
 <20190919215300.GC1418@minitux>
 <20190919215836.GA426988@kroah.com>
 <20190919221456.GA63675@minitux>
 <20190919222525.GA445429@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190919222525.GA445429@kroah.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 19 Sep 15:25 PDT 2019, Greg KH wrote:

> On Thu, Sep 19, 2019 at 03:14:56PM -0700, Bjorn Andersson wrote:
> > On Thu 19 Sep 14:58 PDT 2019, Greg KH wrote:
> > 
> > > On Thu, Sep 19, 2019 at 02:53:00PM -0700, Bjorn Andersson wrote:
> > > > On Thu 19 Sep 14:32 PDT 2019, Greg KH wrote:
> > > > 
> > > > > On Thu, Sep 19, 2019 at 02:13:44PM -0700, Murali Nalajala wrote:
> > > > > > If the soc drivers want to add custom sysfs entries it needs to
> > > > > > access "dev" field in "struct soc_device". This can be achieved
> > > > > > by "soc_device_to_device" API. Soc drivers which are built as a
> > > > > > module they need above API to be exported. Otherwise one can
> > > > > > observe compilation issues.
> > > > > > 
> > > > > > Signed-off-by: Murali Nalajala <mnalajal@codeaurora.org>
> > > > > > ---
> > > > > >  drivers/base/soc.c | 1 +
> > > > > >  1 file changed, 1 insertion(+)
> > > > > > 
> > > > > > diff --git a/drivers/base/soc.c b/drivers/base/soc.c
> > > > > > index 7c0c5ca..4ad52f6 100644
> > > > > > --- a/drivers/base/soc.c
> > > > > > +++ b/drivers/base/soc.c
> > > > > > @@ -41,6 +41,7 @@ struct device *soc_device_to_device(struct soc_device *soc_dev)
> > > > > >  {
> > > > > >  	return &soc_dev->dev;
> > > > > >  }
> > > > > > +EXPORT_SYMBOL_GPL(soc_device_to_device);
> > > > > >  
> > > > > >  static umode_t soc_attribute_mode(struct kobject *kobj,
> > > > > >  				struct attribute *attr,
> > > > > 
> > > > > What in-kernel driver needs this?
> > > > > 
> > > > 
> > > > Half of the drivers interacting with the soc driver calls this API,
> > > > several of these I see no reason for being builtin (e.g.
> > > > ux500 andversatile). So I think this patch makes sense to allow us to
> > > > build these as modules.
> > > > 
> > > > > Is linux-next breaking without this?
> > > > > 
> > > > 
> > > > No, we postponed the addition of any sysfs attributes in the Qualcomm
> > > > socinfo driver.
> > > > 
> > > > > We don't export things unless we have a user of the export.
> > > > > 
> > > > > Also, adding "custom" sysfs attributes is almost always not the correct
> > > > > thing to do at all.  The driver should be doing it, by setting up the
> > > > > attribute group properly so that the driver core can do it automatically
> > > > > for it.
> > > > > 
> > > > > No driver should be doing individual add/remove of sysfs files.  If it
> > > > > does so, it is almost guaranteed to be doing it incorrectly and racing
> > > > > userspace.
> > > > > 
> > > > 
> > > > The problem here is that the attributes are expected to be attached to
> > > > the soc driver, which is separate from the platform-specific drivers. So
> > > > there's no way to do platform specific attributes the right way.
> > > > 
> > > > > And yes, there's loads of in-kernel examples of doing this wrong, I've
> > > > > been working on fixing that up, look at the patches now in Linus's tree
> > > > > for platform and USB drivers that do this as examples of how to do it
> > > > > right.
> > > > > 
> > > > 
> > > > Agreed, this patch should not be used as an approval for any crazy
> > > > attributes; but it's necessary in order to extend the soc device's
> > > > attributes, per the current design.
> > > 
> > > Wait, no, let's not let the "current design" remain if it is broken!
> > > 
> > > Why can't the soc driver handle the attributes properly so that the
> > > individual driver doesn't have to do the create/remove?
> > > 
> > 
> > The custom attributes that these drivers want to add to the common ones
> > are known in advance, so I presume we could have them passed into
> > soc_device_register() and registered together with the common
> > attributes...
> > 
> > It sounds like it's worth a prototype.
> 
> Do you have an in-kernel example I can look at to get an idea of what is
> needed here?
> 

realview_soc_probe(), in drivers/soc/versatile/soc-realview.c,
implements the current mechanism of acquiring the soc's struct device
and then issuing a few device_create_file calls on that.

Regards,
Bjorn
