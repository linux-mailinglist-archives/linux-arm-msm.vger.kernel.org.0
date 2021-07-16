Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 599AD3CB2D7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jul 2021 08:45:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235173AbhGPGsN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Jul 2021 02:48:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:44482 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235125AbhGPGsN (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Jul 2021 02:48:13 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E4F9F613CC;
        Fri, 16 Jul 2021 06:45:16 +0000 (UTC)
Date:   Fri, 16 Jul 2021 12:15:12 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     Jia-Ju Bai <baijiaju1990@gmail.com>, hemantk@codeaurora.org,
        linux-arm-msm@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [BUG] bus: mhi: possible ABBA deadlock in mhi_pm_m0_transition()
 and mhi_send_cmd()
Message-ID: <20210716064512.GE3323@workstation>
References: <0a213c92-32d5-efc8-079b-dd20d5ecfe20@gmail.com>
 <2fbeeb8dc647dc88e69ec6624c2078d1@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2fbeeb8dc647dc88e69ec6624c2078d1@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jul 15, 2021 at 09:57:22AM -0700, Bhaumik Bhatt wrote:
> On 2021-07-15 02:45 AM, Jia-Ju Bai wrote:
> > Hello,
> > 
> > I find there is a possible ABBA deadlock in the MHI driver in Linux
> > 5.10:
> > 
> > In mhi_pm_m0_transition():
> > 262:     read_lock_bh(&mhi_cntrl->pm_lock);
> > 281:     spin_lock_irq(&mhi_cmd->lock);
> > 
> > In mhi_send_cmd():
> > 1181:   spin_lock_bh(&mhi_cmd->lock);
> > 1207:   read_lock_bh(&mhi_cntrl->pm_lock);
> > 
> > When mhi_pm_m0_transition() and mhi_send_cmd() are concurrently
> > executed, the deadlock can occur.
> > 
> > I check the code and find a possible case of such concurrent execution:
> > 
> > #CPU1:
> > mhi_poll (mhi_event->process_event(...))
> >   mhi_process_ctrl_ev_ring
> >     mhi_pm_m0_transition
> > 
> > #CPU2:
> > mhi_prepare_for_transfer
> >   mhi_prepare_channel
> >     mhi_send_cmd
> > 
> > Note that mhi_poll() and mhi_prepare_for_transfer() are both exported
> > by EXPORT_SYMBOL.
> > Thus, I guess these two functions could be concurrently called by a MHI
> > driver.
> > 
> > I am not quite sure whether this possible deadlock is real and how to
> > fix it if it is real.
> > Any feedback would be appreciated, thanks :)
> > 
> > 
> > Best wishes,
> > Jia-Ju Bai
> 
> Few pointers from your example:
> 
> 1. mhi_poll() is currently not used by any client upstream yet.

Then this shouldn't be added in first place... :/

> 2. Polling is not to be used for single event ring (shared control + data)
> cases
> since it is meant to be for client drivers with dedicated data packets only.
> 3. mhi_send_cmd() will always be called after an mhi_pm_m0_transition() has
> completed by design since we wait for the device to be held in M0 prior to
> it.
> 

But client can be unloaded during M0 event!

Anyway, I don't think the deadlock scenario is valid because of the usage
of "read_lock_bh()". So if "mhi_send_cmd()" has acquired
"spin_lock_bh(&mhi_cmd->lock)", it can always acquire
"read_lock_bh(&mhi_cntrl->pm_lock)" as multiple readers can acquire the
read lock.

Deadlock would only occur if one of the functions take write lock.

Thanks for auditing.

Regards,
Mani

> Would like to know what Mani and Hemant have to say. I don't think we can
> run in
> to the scenario from your example so we should be safe.
> 
> Thanks,
> Bhaumik
> ---
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
