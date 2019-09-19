Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1DBBEB86B2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Sep 2019 00:31:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404088AbfISWbS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Sep 2019 18:31:18 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:42534 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392385AbfISWPA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Sep 2019 18:15:00 -0400
Received: by mail-pg1-f194.google.com with SMTP id z12so2638868pgp.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Sep 2019 15:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=fB4zQQtxD6RQxzuoXRwLfGvFn/ooCdWNGohHK66LQ08=;
        b=xODCt9c4PPzf7ZJP+bySIqn30TXjt1heT30OW1TE2tgQtVhEZ7PHRfvCGWTlZvgjNV
         apIa133AHQl1MXOGINvY5iFkudp6kx2frahxdJAcNMzV4Y4J64OAEOnRdDYg8+HNB/99
         nqJBshr9YGEOTxr7GHCPTuHdo1o0hTVg/jt0hakbqbYZt2h/5166qpMQW5S6VqM1V+Xw
         etWTjs94jRmnO7JqoXz7dZN92pFkE5YflNvMSyPlBjqvNtq64WMXpUqtQB5kuK8Sbwo9
         fx1+RAgTe8xE+mAHEuDd8+bLlYv0yz3sQOkn8B4Fkqa6lUkA15fs422p51e3RUn/AkKS
         vMeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=fB4zQQtxD6RQxzuoXRwLfGvFn/ooCdWNGohHK66LQ08=;
        b=Rpw8NajaLAKgquPqwbBHZOkcnHJiZG0gne+12y262GsyLEmU8GfkZi+8lXHb2Ll66u
         0Z86DHmfphlXTuRGEfBPDtTX6vCD1uuqKFWx08PaJIoK4X+Wit4Pl9JKz5p/LWWX/cZi
         9pJETsrbgK/QRN5BsTe/3rB4dcgqySaAqhtdZTnQvWmZEsZjIUm5wvURBMWjHRlOklAv
         6F7M/vDWF+l6Bk1o6euWkIJjgrHGlieCocy2+vaISbE4yBX2yk73OuB+6tSi4TwPRqYX
         lDhfQc9YpPyYzRySXIIabZJhqZBUG6Z6s9mqJsOw5zorLSGwVIilLznr5A1pxxBxjuNF
         +CnQ==
X-Gm-Message-State: APjAAAWGiS8c2InxKWzXAErt2oINsqi+oqqiW+gO+uSwDzbSL/pGy5GB
        z/98VxGFvtka03GDZmqIjsentg==
X-Google-Smtp-Source: APXvYqwHnPaYhBk4Lt3yi1dUPz66jlOkeds9a5M1ZpocrTHis+sK2zkXHck+Dypk2L3DX5oswWkkiQ==
X-Received: by 2002:a17:90a:8991:: with SMTP id v17mr145915pjn.127.1568931299611;
        Thu, 19 Sep 2019 15:14:59 -0700 (PDT)
Received: from minitux (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id c62sm7071pfa.92.2019.09.19.15.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2019 15:14:59 -0700 (PDT)
Date:   Thu, 19 Sep 2019 15:14:56 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Murali Nalajala <mnalajal@codeaurora.org>, rafael@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] base: soc: Export soc_device_to_device API
Message-ID: <20190919221456.GA63675@minitux>
References: <1568927624-13682-1-git-send-email-mnalajal@codeaurora.org>
 <20190919213203.GA395325@kroah.com>
 <20190919215300.GC1418@minitux>
 <20190919215836.GA426988@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190919215836.GA426988@kroah.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 19 Sep 14:58 PDT 2019, Greg KH wrote:

> On Thu, Sep 19, 2019 at 02:53:00PM -0700, Bjorn Andersson wrote:
> > On Thu 19 Sep 14:32 PDT 2019, Greg KH wrote:
> > 
> > > On Thu, Sep 19, 2019 at 02:13:44PM -0700, Murali Nalajala wrote:
> > > > If the soc drivers want to add custom sysfs entries it needs to
> > > > access "dev" field in "struct soc_device". This can be achieved
> > > > by "soc_device_to_device" API. Soc drivers which are built as a
> > > > module they need above API to be exported. Otherwise one can
> > > > observe compilation issues.
> > > > 
> > > > Signed-off-by: Murali Nalajala <mnalajal@codeaurora.org>
> > > > ---
> > > >  drivers/base/soc.c | 1 +
> > > >  1 file changed, 1 insertion(+)
> > > > 
> > > > diff --git a/drivers/base/soc.c b/drivers/base/soc.c
> > > > index 7c0c5ca..4ad52f6 100644
> > > > --- a/drivers/base/soc.c
> > > > +++ b/drivers/base/soc.c
> > > > @@ -41,6 +41,7 @@ struct device *soc_device_to_device(struct soc_device *soc_dev)
> > > >  {
> > > >  	return &soc_dev->dev;
> > > >  }
> > > > +EXPORT_SYMBOL_GPL(soc_device_to_device);
> > > >  
> > > >  static umode_t soc_attribute_mode(struct kobject *kobj,
> > > >  				struct attribute *attr,
> > > 
> > > What in-kernel driver needs this?
> > > 
> > 
> > Half of the drivers interacting with the soc driver calls this API,
> > several of these I see no reason for being builtin (e.g.
> > ux500 andversatile). So I think this patch makes sense to allow us to
> > build these as modules.
> > 
> > > Is linux-next breaking without this?
> > > 
> > 
> > No, we postponed the addition of any sysfs attributes in the Qualcomm
> > socinfo driver.
> > 
> > > We don't export things unless we have a user of the export.
> > > 
> > > Also, adding "custom" sysfs attributes is almost always not the correct
> > > thing to do at all.  The driver should be doing it, by setting up the
> > > attribute group properly so that the driver core can do it automatically
> > > for it.
> > > 
> > > No driver should be doing individual add/remove of sysfs files.  If it
> > > does so, it is almost guaranteed to be doing it incorrectly and racing
> > > userspace.
> > > 
> > 
> > The problem here is that the attributes are expected to be attached to
> > the soc driver, which is separate from the platform-specific drivers. So
> > there's no way to do platform specific attributes the right way.
> > 
> > > And yes, there's loads of in-kernel examples of doing this wrong, I've
> > > been working on fixing that up, look at the patches now in Linus's tree
> > > for platform and USB drivers that do this as examples of how to do it
> > > right.
> > > 
> > 
> > Agreed, this patch should not be used as an approval for any crazy
> > attributes; but it's necessary in order to extend the soc device's
> > attributes, per the current design.
> 
> Wait, no, let's not let the "current design" remain if it is broken!
> 
> Why can't the soc driver handle the attributes properly so that the
> individual driver doesn't have to do the create/remove?
> 

The custom attributes that these drivers want to add to the common ones
are known in advance, so I presume we could have them passed into
soc_device_register() and registered together with the common
attributes...

It sounds like it's worth a prototype.

Regards,
Bjorn
