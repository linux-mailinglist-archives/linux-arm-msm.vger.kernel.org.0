Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 38D6115C144
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2020 16:20:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727763AbgBMPUY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Feb 2020 10:20:24 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:52801 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725781AbgBMPUY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Feb 2020 10:20:24 -0500
Received: by mail-pj1-f65.google.com with SMTP id ep11so2517909pjb.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Feb 2020 07:20:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=aAFiSr4SyAhq9M+d4Wm2KbZuHqn84PAHjUeDlIWTta8=;
        b=EsoTXbhpR3vS790bdPXs7IDHK2ZoygezwT8Xa8p+uBNPUrb2AHA/yOFrs4qZCvZC2k
         jQgJCvMdio7UZkVy9pO0rauTGoM2QKItjO1X7KOs7gmMP1M3wv6wTSGufseMBDtD1i6k
         FKCqLfIr/rveDg6jyxsALom60n/OCwVN0nVYGeI7A4Lwds5bfBkxcKz+WHUKGYRLQ/Za
         Wadf0C8gxrlNzVqnyzsXHWu3YS+zBiacWCnchwIHjIW7s2vuBCrEdWLd8Bd7Zyj2abBI
         CejlVUJZqZQa81viz0l10LzLIC3jPqEX7U+lzc8HrlmR7c/xZO/JgYVbMH/1foku80KC
         ZeZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=aAFiSr4SyAhq9M+d4Wm2KbZuHqn84PAHjUeDlIWTta8=;
        b=eDym9CfKh9U/LTCGbYhStOKeCwOOQSnfw/JXbp3l1ibC4aeltim0LkCjhvvnVUtYTX
         wng3CcKuRa/RPDxu5+PNBbfe+tdMlcEHa8gyC9jPxuHl9o3Qzo06xpxzBj844iLblR8Y
         /NcudRMY1jzox9QAeY6H6CQmlpEV/qIcY/FY1bDau49LFaIeaPNppiXbmNn+YPaAtQUz
         kmsUOxuNbIDlgwjEhEaOaxc/wFOtlkDrdT3gvM5lSdpkD5JikT15+C08vy0nYhDh4//Q
         8PrhMD/TvZnbSAcm95E3qVJyC9vGYzodapL7ZyzPLyykbcW3+g8z8+WU/O/Mhh6ycCAF
         vOdQ==
X-Gm-Message-State: APjAAAWOIT/HxGKF18gj6MS7AQNFD9YhvlYDqmyMpXApi4fuAIc5S5/r
        aR1UJ6eU2eKW4MdyfisUamGr
X-Google-Smtp-Source: APXvYqzZFf08bYh7LWgG7o2bIBCeY0g8Ylgi3mcUEIWAD6iIMr/8vOmlSfQgaTbqrVC28KmJPvRpRw==
X-Received: by 2002:a17:90a:930f:: with SMTP id p15mr6048297pjo.0.1581607222003;
        Thu, 13 Feb 2020 07:20:22 -0800 (PST)
Received: from mani ([103.59.133.81])
        by smtp.gmail.com with ESMTPSA id a10sm3665189pgm.81.2020.02.13.07.20.18
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Feb 2020 07:20:21 -0800 (PST)
Date:   Thu, 13 Feb 2020 20:50:13 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     arnd@arndb.de, smohanad@codeaurora.org, jhugo@codeaurora.org,
        kvalo@codeaurora.org, bjorn.andersson@linaro.org,
        hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 02/16] bus: mhi: core: Add support for registering MHI
 controllers
Message-ID: <20200213152013.GB15010@mani>
References: <20200131135009.31477-1-manivannan.sadhasivam@linaro.org>
 <20200131135009.31477-3-manivannan.sadhasivam@linaro.org>
 <20200206165755.GB3894455@kroah.com>
 <20200211184130.GA11908@Mani-XPS-13-9360>
 <20200211192055.GA1962867@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200211192055.GA1962867@kroah.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Feb 11, 2020 at 11:20:55AM -0800, Greg KH wrote:
> On Wed, Feb 12, 2020 at 12:11:30AM +0530, Manivannan Sadhasivam wrote:
> > Hi Greg,
> > 
> > On Thu, Feb 06, 2020 at 05:57:55PM +0100, Greg KH wrote:
> > > On Fri, Jan 31, 2020 at 07:19:55PM +0530, Manivannan Sadhasivam wrote:
> > > > --- /dev/null
> > > > +++ b/drivers/bus/mhi/core/init.c
> > > > @@ -0,0 +1,407 @@
> > > > +// SPDX-License-Identifier: GPL-2.0
> > > > +/*
> > > > + * Copyright (c) 2018-2020, The Linux Foundation. All rights reserved.
> > > > + *
> > > > + */
> > > > +
> > > > +#define dev_fmt(fmt) "MHI: " fmt
> > > 
> > > This should not be needed, right?  The bus/device name should give you
> > > all you need here from what I can tell.  So why is this needed?
> > > 
> > 
> > The log will have only the device name as like PCI-E. But that won't specify
> > where the error is coming from. Having "MHI" prefix helps the users to
> > quickly identify that the error is coming from MHI stack.
> 
> If the driver binds properly to the device, the name of the driver will
> be there in the message, so I suggest using that please.
> 
> No need for this prefix...
> 

So the driver name will be in the log but that won't help identifying where
the log is coming from. This is more important for MHI since it reuses the
`struct device` of the transport device like PCI-E. For instance, below is
the log without MHI prefix:

[   47.355582] ath11k_pci 0000:01:00.0: Requested to power on
[   47.355724] ath11k_pci 0000:01:00.0: Power on setup success

As you can see, this gives the assumption that the log is coming from the
ath11k_pci driver. But the reality is, it is coming from MHI bus.

With the prefix added, we will get below:

[   47.355582] ath11k_pci 0000:01:00.0: MHI: Requested to power on
[   47.355724] ath11k_pci 0000:01:00.0: MHI: Power on setup success

IMO, the prefix will give users a clear idea of logs and that will be very
useful for debugging.

Hope this clarifies.

Thanks,
Mani

> thanks,
> 
> greg k-h
