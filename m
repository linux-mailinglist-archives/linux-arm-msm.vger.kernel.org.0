Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8AF0B27A5FA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Sep 2020 05:44:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726412AbgI1Dof (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 27 Sep 2020 23:44:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726393AbgI1Doe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 27 Sep 2020 23:44:34 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E412C0613CF
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Sep 2020 20:44:34 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id x22so8084819pfo.12
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Sep 2020 20:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=WX8I6TeAtE6bGaaQ9wL+CfgiteIwPWpE3Hg3QCXFsuU=;
        b=o87rEi97yE+/AGl6viKMZiX/s5DQrlHjq7VJFVhs63FVfrHngAU6cE40hf0/CXrQXt
         jKQln6Tq0oFrdqODyeezK9/vWpscrjg48IAt14jIO0Yio3T5M195Pq0Ppb8AKIvLayr/
         dDSaY8KwRlgNqpJ/px3alxXsU+v2EsQS0nPQdKi1/bHuRJ9T1X1AMNQOGER7OKP2l/fp
         FxpdkCkIcAJ/bde9+UuKgBgo+Ou+yHmphJAx4S3GVfSIBp442/OYwxFPlNc+rGfCvkpL
         C3JoK1sk5OARicBemvVMbmWXCc+5anhaBRUXrM9knTTo5y+bxnh4fAimDlrvo8tarjEC
         qpyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=WX8I6TeAtE6bGaaQ9wL+CfgiteIwPWpE3Hg3QCXFsuU=;
        b=SrSlaeDZhtpt4HN9dOTC/fmtqc849mn2WGL/9LmSeuFwNWCfgXe2BgmzK9XolE6+57
         t+w9rFgbxjxQDeHmzQovgx4bfBFAu6r7303YDrfMzgNaRgqnuR5kYJeTpcRRwZe9p+mH
         UtMWqK2/EVMmOna5FzMA1GQkbkCWCY6Qz9QxLQ9a2jhxDeV6k6s2On5v28fnnuVoi38a
         MtCGVRNqsEurw2EsK+4F2OJF14U1r8U14w3uFGAZBJT9AdK5xR3BkfTOdENp2tkHiZCC
         1lg9EFh8hkQf/fCECGXPUO//S3uDMFb1/6NEHk6nKa7PfDtP9YIqXAI1edkQZyGIN3a3
         yMNQ==
X-Gm-Message-State: AOAM532yOlZ+9a8J/o73LKD9UtvLDNSS0oTU8868Bkb0YqErSAFt3HnP
        AszbEOVi6Z/CW9miBiS6wljABb0GQcau
X-Google-Smtp-Source: ABdhPJxGCdXLtQvBncj28ldPe25ITVCehblYqwkAzBMrHE5DXglkfo9X6vnKHqroDNlh0nyMsg76qA==
X-Received: by 2002:a17:902:8e85:b029:d2:42a6:bb6 with SMTP id bg5-20020a1709028e85b02900d242a60bb6mr9213811plb.72.1601264673862;
        Sun, 27 Sep 2020 20:44:33 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:6003:40df:7c40:5a87:eb86:87b0])
        by smtp.gmail.com with ESMTPSA id e13sm9280449pfi.70.2020.09.27.20.44.29
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 27 Sep 2020 20:44:33 -0700 (PDT)
Date:   Mon, 28 Sep 2020 09:14:27 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     hemantk@codeaurora.org, jhugo@codeaurora.org,
        bbhatt@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 15/18] bus: mhi: core: Introduce sysfs entries for MHI
Message-ID: <20200928034426.GA3605@Mani-XPS-13-9360>
References: <20200921160815.28071-1-manivannan.sadhasivam@linaro.org>
 <20200921160815.28071-17-manivannan.sadhasivam@linaro.org>
 <20200927102659.GC87283@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200927102659.GC87283@kroah.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Sep 27, 2020 at 12:26:59PM +0200, Greg KH wrote:
> On Mon, Sep 21, 2020 at 09:38:12PM +0530, Manivannan Sadhasivam wrote:
> > From: Bhaumik Bhatt <bbhatt@codeaurora.org>
> > 
> > Introduce sysfs entries to enable userspace clients the ability to read
> > the serial number and the OEM PK Hash values obtained from BHI. OEMs
> > need to read these device-specific hardware information values through
> > userspace for factory testing purposes and cannot be exposed via degbufs
> > as it may remain disabled for performance reasons. Also, update the
> > documentation for ABI to include these entries.
> > 
> > Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> > Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >  Documentation/ABI/stable/sysfs-bus-mhi | 21 ++++++++++
> >  MAINTAINERS                            |  1 +
> >  drivers/bus/mhi/core/init.c            | 53 ++++++++++++++++++++++++++
> >  3 files changed, 75 insertions(+)
> >  create mode 100644 Documentation/ABI/stable/sysfs-bus-mhi
> > 
> > diff --git a/Documentation/ABI/stable/sysfs-bus-mhi b/Documentation/ABI/stable/sysfs-bus-mhi
> > new file mode 100644
> > index 000000000000..ecfe7662f8d0
> > --- /dev/null
> > +++ b/Documentation/ABI/stable/sysfs-bus-mhi
> > @@ -0,0 +1,21 @@
> > +What:		/sys/bus/mhi/devices/.../serialnumber
> > +Date:		Sept 2020
> > +KernelVersion:	5.10
> > +Contact:	Bhaumik Bhatt <bbhatt@codeaurora.org>
> > +Description:	The file holds the serial number of the client device obtained
> > +		using a BHI (Boot Host Interface) register read after at least
> > +		one attempt to power up the device has been done. If read
> > +		without having the device power on at least once, the file will
> > +		read all 0's.
> > +Users:		Any userspace application or clients interested in device info.
> > +
> > +What:		/sys/bus/mhi/devices/.../oem_pk_hash
> > +Date:		Sept 2020
> > +KernelVersion:	5.10
> > +Contact:	Bhaumik Bhatt <bbhatt@codeaurora.org>
> > +Description:	The file holds the OEM PK Hash value of the endpoint device
> > +		obtained using a BHI (Boot Host Interface) register read after
> > +		at least one attempt to power up the device has been done. If
> > +		read without having the device power on at least once, the file
> > +		will read all 0's.
> > +Users:		Any userspace application or clients interested in device info.
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index deaafb617361..11e7be9b9163 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -11323,6 +11323,7 @@ M:	Hemant Kumar <hemantk@codeaurora.org>
> >  L:	linux-arm-msm@vger.kernel.org
> >  S:	Maintained
> >  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git
> > +F:	Documentation/ABI/stable/sysfs-bus-mhi
> >  F:	Documentation/mhi/
> >  F:	drivers/bus/mhi/
> >  F:	include/linux/mhi.h
> > diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
> > index 61e5885a331a..1b4161eaf0d8 100644
> > --- a/drivers/bus/mhi/core/init.c
> > +++ b/drivers/bus/mhi/core/init.c
> > @@ -76,6 +76,56 @@ const char *to_mhi_pm_state_str(enum mhi_pm_state state)
> >  	return mhi_pm_state_str[index];
> >  }
> >  

[...]

> > +static int mhi_create_sysfs(struct mhi_controller *mhi_cntrl)
> > +{
> > +	return sysfs_create_group(&mhi_cntrl->mhi_dev->dev.kobj,
> > +				  &mhi_sysfs_group);
> 
> You should never have to call a sysfs_* function from a driver or bus
> code, that implies something is wrong :)
> 

Hmm. I think the inspiration is drawn from an old bus driver :(
Will submit a patch later to fix it!

> Just set the sysfs attributes to be the default groups for your
> bus/device/whatever-you-have-here and then the driver core will properly
> manage the creation and removal of these files, in a race-free manner.
> 
> As it is, I think this is racy and will cause userspace confusion, but I
> haven't looked for sure, as you should use the api that guarantees it is
> safe...
> 

Okay. Will use the dev_groups callback to manage the sysfs attributes.

Thanks,
Mani

> thanks,
> 
> greg k-h
