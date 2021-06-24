Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A6253B328F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jun 2021 17:27:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232427AbhFXP3l (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Jun 2021 11:29:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:52406 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231819AbhFXP3i (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Jun 2021 11:29:38 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 50CB3613DA;
        Thu, 24 Jun 2021 15:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1624548439;
        bh=9oXNZ4LONOItdd4Iwzgt2g0W7nQL9dFt8yuG4eI83PA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pimteVpqN76owi61qo8qtVG82hSx2tn1YevOIFbJLVwp1O0djvB3U2OUUd1o9W+X+
         vcqDkjUk9nEkym/BIzsjNGXb2m1uGm0NR6avAC8C/ASvfDyMS50COYsiLxtLZM4fuM
         0Br5GrSP3B1/S9F+JJxcjUs+TBiEbJDxiGbtmLBQ=
Date:   Thu, 24 Jun 2021 17:27:17 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        loic.poulain@linaro.org, stable@vger.kernel.org,
        Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: Re: [PATCH 1/8] bus: mhi: core: Validate channel ID when processing
 command completions
Message-ID: <YNSkVZ4PzkDqX/g+@kroah.com>
References: <20210621161616.77524-1-manivannan.sadhasivam@linaro.org>
 <20210621161616.77524-2-manivannan.sadhasivam@linaro.org>
 <YNSNtQxVaegArG2f@kroah.com>
 <20210624143248.GC6108@workstation>
 <YNSZNxMjX/vNvae+@kroah.com>
 <20210624144752.GD6108@workstation>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210624144752.GD6108@workstation>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jun 24, 2021 at 08:17:52PM +0530, Manivannan Sadhasivam wrote:
> On Thu, Jun 24, 2021 at 04:39:51PM +0200, Greg KH wrote:
> > On Thu, Jun 24, 2021 at 08:02:48PM +0530, Manivannan Sadhasivam wrote:
> > > On Thu, Jun 24, 2021 at 03:50:45PM +0200, Greg KH wrote:
> > > > On Mon, Jun 21, 2021 at 09:46:09PM +0530, Manivannan Sadhasivam wrote:
> > > > > From: Bhaumik Bhatt <bbhatt@codeaurora.org>
> > > > > 
> > > > > MHI reads the channel ID from the event ring element sent by the
> > > > > device which can be any value between 0 and 255. In order to
> > > > > prevent any out of bound accesses, add a check against the maximum
> > > > > number of channels supported by the controller and those channels
> > > > > not configured yet so as to skip processing of that event ring
> > > > > element.
> > > > > 
> > > > > Cc: stable@vger.kernel.org
> > > > > Fixes: 1d3173a3bae7 ("bus: mhi: core: Add support for processing events from client device")
> > > > > Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> > > > > Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>
> > > > > Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > > > > Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> > > > > Link: https://lore.kernel.org/r/1619481538-4435-1-git-send-email-bbhatt@codeaurora.org
> > > > > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > > > > ---
> > > > >  drivers/bus/mhi/core/main.c | 15 ++++++++++-----
> > > > >  1 file changed, 10 insertions(+), 5 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
> > > > > index 22acde118bc3..ed07421c4870 100644
> > > > > --- a/drivers/bus/mhi/core/main.c
> > > > > +++ b/drivers/bus/mhi/core/main.c
> > > > > @@ -773,11 +773,16 @@ static void mhi_process_cmd_completion(struct mhi_controller *mhi_cntrl,
> > > > >  	cmd_pkt = mhi_to_virtual(mhi_ring, ptr);
> > > > >  
> > > > >  	chan = MHI_TRE_GET_CMD_CHID(cmd_pkt);
> > > > > -	mhi_chan = &mhi_cntrl->mhi_chan[chan];
> > > > > -	write_lock_bh(&mhi_chan->lock);
> > > > > -	mhi_chan->ccs = MHI_TRE_GET_EV_CODE(tre);
> > > > > -	complete(&mhi_chan->completion);
> > > > > -	write_unlock_bh(&mhi_chan->lock);
> > > > > +	WARN_ON(chan >= mhi_cntrl->max_chan);
> > > > 
> > > > What can ever trigger this WARN_ON()?  Do you mean to reboot a machine
> > > > if panic-on-warn is set?
> > > > 
> > > > If this can actually happen, then check for it and recover properly,
> > > > don't just blindly warn and then keep on going.
> > > > 
> > > 
> > > We can't do much here other than warning the user and dropping the
> > > command.
> > 
> > But you didn't warn anyone.  Well, you rebooted the machine, is that ok?
> > If this can be triggered by a user, this should never happen.
> > 
> > Do not use WARN_ON() ever please.
> > 
> > > There is no recovery possible because, the device has sent the command
> > > completion event on a wrong channel. It can't happen usually unless a
> > > malcious device sits on the other end.
> > 
> > Then just eat the message and move on, please do not crash the box.
> > 
> 
> Okay. We'll spit an error message and drop the event.

If this can be triggered by a user, don't provide a way to DoS the
kernel error log.

thanks,

greg k-h
