Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18A86357D58
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Apr 2021 09:29:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229510AbhDHHaB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Apr 2021 03:30:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:52104 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229623AbhDHHaA (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Apr 2021 03:30:00 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3436E61104;
        Thu,  8 Apr 2021 07:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1617866989;
        bh=AQnzc2cyjD+0otvwMhgDKob+JrmQbJnn7quJBoek+yM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=L0CatQJVypkmSBw+4BFdAF6HiRJAOZwqq4GsiVZ4flVTqr2tmdPRCJr9/lVSyDWv7
         kdernQc6wnYM8NaLRBhmEovMpQCxeC67OTU7amO6FVdyeANjC8dDrGzU9H+eXx/X58
         qvHK3t53M7dTrDkzf3DjaQfCwJTylPmf4+K7hkS4=
Date:   Thu, 8 Apr 2021 09:29:46 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Sandeep Maheswaram <sanm@codeaurora.org>
Cc:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, Manu Gautam <mgautam@codeaurora.org>
Subject: Re: [PATCH v1] usb: dwc3: core: Add shutdown callback for dwc3
Message-ID: <YG6w6uaDAu2fH/PW@kroah.com>
References: <1616527652-7937-1-git-send-email-sanm@codeaurora.org>
 <YF3jfshT3OSolcws@kroah.com>
 <e1afc071-57a6-5d7f-b467-92b618419b76@codeaurora.org>
 <YGLqXI8HOaOrMq1B@kroah.com>
 <d2348b758fa57acf53885b67f066e0a1@codeaurora.org>
 <YGMIoM3xIZzRvU3i@kroah.com>
 <c984ff015109ed606d2933125d385015@codeaurora.org>
 <YGMohXctT9FqiG4N@kroah.com>
 <7f67d898-2b04-8e38-a945-5a717d1ce8c4@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7f67d898-2b04-8e38-a945-5a717d1ce8c4@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Apr 08, 2021 at 10:22:57AM +0530, Sandeep Maheswaram wrote:
> 
> On 3/30/2021 7:02 PM, Greg Kroah-Hartman wrote:
> > On Tue, Mar 30, 2021 at 06:18:43PM +0530, Sai Prakash Ranjan wrote:
> > > On 2021-03-30 16:46, Greg Kroah-Hartman wrote:
> > > > On Tue, Mar 30, 2021 at 03:25:58PM +0530, Sai Prakash Ranjan wrote:
> > > > > On 2021-03-30 14:37, Greg Kroah-Hartman wrote:
> > > > > > On Tue, Mar 30, 2021 at 02:12:04PM +0530, Sandeep Maheswaram wrote:
> > > > > > > On 3/26/2021 7:07 PM, Greg Kroah-Hartman wrote:
> > > > > > > > On Wed, Mar 24, 2021 at 12:57:32AM +0530, Sandeep Maheswaram wrote:
> > > > > > > > > This patch adds a shutdown callback to USB DWC core driver to ensure that
> > > > > > > > > it is properly shutdown in reboot/shutdown path. This is required
> > > > > > > > > where SMMU address translation is enabled like on SC7180
> > > > > > > > > SoC and few others. If the hardware is still accessing memory after
> > > > > > > > > SMMU translation is disabled as part of SMMU shutdown callback in
> > > > > > > > > system reboot or shutdown path, then IOVAs(I/O virtual address)
> > > > > > > > > which it was using will go on the bus as the physical addresses which
> > > > > > > > > might result in unknown crashes (NoC/interconnect errors).
> > > > > > > > > 
> > > > > > > > > Previously this was added in dwc3 qcom glue driver.
> > > > > > > > > https://patchwork.kernel.org/project/linux-arm-msm/list/?series=382449
> > > > > > > > > But observed kernel panic as glue driver shutdown getting called after
> > > > > > > > > iommu shutdown. As we are adding iommu nodes in dwc core node
> > > > > > > > > in device tree adding shutdown callback in core driver seems correct.
> > > > > > > > So shouldn't you also remove this from the qcom glue driver at the same
> > > > > > > > time?  Please submit both as a patch series.
> > > > > > > > 
> > > > > > > > thanks,
> > > > > > > > 
> > > > > > > > greg k-h
> > > > > > > Hi Greg,
> > > > > > > 
> > > > > > > The qcom glue driver patch is not merged yet. I have just mentioned
> > > > > > > for it for reference.
> > > > > > You know that we can not add callbacks for no in-kernel user, so what
> > > > > > good is this patch for now?
> > > > > > 
> > > > > What in-kernel user? Since when does shutdown callback need an
> > > > > in-kernel
> > > > > user? When you reboot or shutdown a system, it gets called. The reason
> > > > > why the shutdown callback is needed is provided in the commit text.
> > > > As I can't see the patch here, I have no idea...
> > > You are replying now to the same patch which adds this shutdown callback :)
> > > Anyways the qcom dwc3 driver patch which is abandoned which is also
> > > mentioned
> > > in the commit text is here [1] and the new shutdown callback patch which we
> > > are both replying to is in here [2]
> > > 
> > > [1] https://lore.kernel.org/lkml/1605162619-10064-1-git-send-email-sanm@codeaurora.org/
> > > 
> > > [2] https://lore.kernel.org/lkml/1616527652-7937-1-git-send-email-sanm@codeaurora.org/
> > Thanks, so, what am I supposed to do here?  The patch is long gone from
> > my queue...
> > 
> > greg k-h
> 
> Hi Greg,
> 
> Should I resend this patch ? If so let me know your about opinion about
> Stephen's comment on just calling dwc3_remove in
> 
> dwc3_shutdown and ignoring return value.
> 
> https://lore.kernel.org/patchwork/patch/1401242/#1599316

Please resend as again, it's not in my queue of patches to review at
all...

And yes, Stephen's comment does make sense, why ignore that?

thanks,

greg k-h
