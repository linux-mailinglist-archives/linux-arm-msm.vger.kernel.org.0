Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5EB4515C740
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2020 17:13:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728908AbgBMQIj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Feb 2020 11:08:39 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:39559 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728218AbgBMPXB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Feb 2020 10:23:01 -0500
Received: by mail-pl1-f194.google.com with SMTP id g6so2466984plp.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Feb 2020 07:23:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=mG5Pj3Ga2qn/6UPh/hiM2vYUP7QMzFr/lGer+oLepCc=;
        b=ojjKqoJqn3YNbRS9pIbai3sOzbP1aYkgdpr7OpIR1y2+KaxVGpme9iesoJCJU3SRhU
         HAfQ/pbQUu2k4NcORvH4RHD/TgpX9EwAE3ASjn75CwsQ6aifFHMjui0B/keNeiEfBYAm
         9VxkhZ441f/jNEys8dffVo1BnGSySP3/lfTo111fQACZ4xowTWKgUHPWcGpSloattgia
         zE46NmTrTYDxxlLpkEth0WCXUsAzom8BBeNY/XXQAwBpEzm6aNRbYbNJ8efaNmdblTej
         qEP6ATS99mxjh7IbNgoJcGNL4co6kAqB61eQiK4MdYk2h3VWemMGVBmIpbBfcQdfTTz9
         T1SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=mG5Pj3Ga2qn/6UPh/hiM2vYUP7QMzFr/lGer+oLepCc=;
        b=JU6Nnyzz/MDjWgAhdRiUKQMzUnXWqd2lc6NUyD2lX734i8VApG1UiDfJDNV7QuH4JK
         uHglezieDvUVw17+5EHb3OYj3fl6GwS813+niqKi13CFgzv9PRzZZfOYDeX/SGrWmPYu
         r50cmawEkaWzVYk268+AqF3FN3lcYHak1sCME4g8VetHItPx44Qb7ogKVhVSJ48Mw8GA
         22JgW8duQkVbf+W39GxcKFf/Holbn6JXEhOKJqhja6VJjOtLSPH57mjFMZ8F0qf3J1mQ
         FaL2m2tnwlYJj4RHm45Av7p8C4Vkb8/k2FDVXJc6finlhz1L2cosPQFemXPhKbd6u3S4
         nsLg==
X-Gm-Message-State: APjAAAUATEM2TsrcgviBhYSklgrrER389rz4H6Bv5mmAEi+HP2/+KuOF
        JPOj8uEFE8vaaeAlfZSOJ6S6
X-Google-Smtp-Source: APXvYqyFO7tCYmZ8k+SqmOtcnU6W7tN/B4ksrngWczKUIT1JduB/3SDAP6TvrlAIs6RKKyY3gUuZ5Q==
X-Received: by 2002:a17:902:a58a:: with SMTP id az10mr28645091plb.20.1581607380940;
        Thu, 13 Feb 2020 07:23:00 -0800 (PST)
Received: from mani ([103.59.133.81])
        by smtp.gmail.com with ESMTPSA id n2sm3561515pgn.71.2020.02.13.07.22.58
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Feb 2020 07:23:00 -0800 (PST)
Date:   Thu, 13 Feb 2020 20:52:55 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     arnd@arndb.de, smohanad@codeaurora.org, jhugo@codeaurora.org,
        kvalo@codeaurora.org, bjorn.andersson@linaro.org,
        hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 02/16] bus: mhi: core: Add support for registering MHI
 controllers
Message-ID: <20200213152255.GC15010@mani>
References: <20200131135009.31477-1-manivannan.sadhasivam@linaro.org>
 <20200131135009.31477-3-manivannan.sadhasivam@linaro.org>
 <20200206165606.GA3894455@kroah.com>
 <20200211191147.GB11908@Mani-XPS-13-9360>
 <20200211192236.GB1962867@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200211192236.GB1962867@kroah.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Greg,

On Tue, Feb 11, 2020 at 11:22:36AM -0800, Greg KH wrote:
> On Wed, Feb 12, 2020 at 12:41:47AM +0530, Manivannan Sadhasivam wrote:
> > Hi Greg,
> > 
> > On Thu, Feb 06, 2020 at 05:56:06PM +0100, Greg KH wrote:
> > > On Fri, Jan 31, 2020 at 07:19:55PM +0530, Manivannan Sadhasivam wrote:
> > > > +static void mhi_release_device(struct device *dev)
> > > > +{
> > > > +	struct mhi_device *mhi_dev = to_mhi_device(dev);
> > > > +
> > > > +	if (mhi_dev->ul_chan)
> > > > +		mhi_dev->ul_chan->mhi_dev = NULL;
> > > 
> > > That looks really odd.  Why didn't you just drop the reference you
> > > should have grabbed here for this pointer?  You did properly increment
> > > it when you saved it, right?  :)
> > > 
> > 
> > Well, there is no reference count (kref) exist for mhi_dev.
> 
> Then something is wrong with your model :(
> 
> You can't save pointers off to things without reference counting, that
> is going to cause you real problems.  See the coding style document for
> all the details.
> 
> > And we really needed to NULL the mhi_dev to avoid any dangling
> > reference to it.
> 
> Again, that's not how to do this correctly.
> 
> > The reason for not having kref is that, each mhi_dev will be used by
> > maximum of 2 channels only. So thought that refcounting is not needed.
> > Please correct me if I'm wrong.
> 
> Please read section 11 of Documentation/process/coding-style.rst
> 

I have fixed it and will send the next iteration soon.

Thanks,
Mani

> thanks,
> 
> greg k-h
