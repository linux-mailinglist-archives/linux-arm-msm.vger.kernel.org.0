Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D5094303A1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Oct 2021 18:20:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240541AbhJPQWN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 16 Oct 2021 12:22:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:51396 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230374AbhJPQWL (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 16 Oct 2021 12:22:11 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3CD9561027;
        Sat, 16 Oct 2021 16:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634401203;
        bh=xDu3yjHy7Vfc0xSf0OVL8219o+oDBzfxEjriLZOQ+jY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nU7wtoofX+dy7jx95w1zHprMIHYVtW36BixoDqdgmPgycpogYHwH/v8TOhCDghccz
         CRxr1JGICyOTIwjLG6R7/0yrQ21oqsxk3SpSH/ZIpIzr4p4cn70ql+HFsb6WBjLFP1
         58tBlGjKqx1t51G2oCYS5a9ho6yGQiJiA4bp7e0W/k5v6tgGLCjUeZKdUwdWAYvDD2
         fQmRDX/ZiTYPnBHCYFnWn3YuD2hNDYlXwtHKhoVc+tHKE2xDmsEv1zrBcIjGkWlm7y
         h5PZ6EzL7UYkwFBFjsttJKYwJ0tcRes+CRKYWcOiht4+SoHCZD/fgy8hf7j6DcEoA5
         Q/pDNR85VnpJg==
Date:   Sat, 16 Oct 2021 21:49:56 +0530
From:   Manivannan Sadhasivam <mani@kernel.org>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        hemantk@codeaurora.org, bbhatt@codeaurora.org,
        loic.poulain@linaro.org, wangqing@vivo.com, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] bus: mhi: replace snprintf in show functions with
 sysfs_emit
Message-ID: <20211016161956.GB4048@thinkpad>
References: <20211016065734.28802-1-manivannan.sadhasivam@linaro.org>
 <20211016065734.28802-4-manivannan.sadhasivam@linaro.org>
 <YWqBTj4slHq7HexS@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YWqBTj4slHq7HexS@kroah.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Oct 16, 2021 at 09:37:50AM +0200, Greg KH wrote:
> On Sat, Oct 16, 2021 at 12:27:34PM +0530, Manivannan Sadhasivam wrote:
> > From: Qing Wang <wangqing@vivo.com>
> > 
> > coccicheck complains about the use of snprintf() in sysfs show functions.
> > 
> > Fix the following coccicheck warning:
> > drivers/bus/mhi/core/init.c:97:8-16: WARNING: use scnprintf or sprintf.
> > 
> > Use sysfs_emit instead of scnprintf or sprintf makes more sense.
> > 
> > Signed-off-by: Qing Wang <wangqing@vivo.com>
> > Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>
> > Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
> > Link: https://lore.kernel.org/r/1634095550-3978-1-git-send-email-wangqing@vivo.com
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >  drivers/bus/mhi/core/init.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
> > index 5aaca6d0f52b..a5a5c722731e 100644
> > --- a/drivers/bus/mhi/core/init.c
> > +++ b/drivers/bus/mhi/core/init.c
> > @@ -94,7 +94,7 @@ static ssize_t serial_number_show(struct device *dev,
> >  	struct mhi_device *mhi_dev = to_mhi_device(dev);
> >  	struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
> >  
> > -	return snprintf(buf, PAGE_SIZE, "Serial Number: %u\n",
> > +	return sysfs_emit(buf, "Serial Number: %u\n",
> >  			mhi_cntrl->serial_number);
> 
> The text "Serial Number: " should not be in here, right?  It's obvious
> this is a serial number, that's what the documentation and file name
> says.  Userspace should not have to parse sysfs files.
> 

Right, somehow missed it :/

> And why is only one sysfs entry being changed in this file?  Either they
> all should be, or none, no need to do this one-patch-per-entry, right?
> 
> Note, I have rejected Qing's patches like this for other subsystems
> already because they are not complete, this is something they are well
> aware of by now...
> 

Oh, I'm not aware of this.

Qing: Please modify the other instance of snprintf also.

Thanks,
Mani

> thanks,
> 
> greg k-h
