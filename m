Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D848E30CE6E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Feb 2021 23:07:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232465AbhBBWG0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Feb 2021 17:06:26 -0500
Received: from netrider.rowland.org ([192.131.102.5]:56713 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S232257AbhBBWGV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Feb 2021 17:06:21 -0500
Received: (qmail 464709 invoked by uid 1000); 2 Feb 2021 17:05:36 -0500
Date:   Tue, 2 Feb 2021 17:05:36 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Asutosh Das <asutoshd@codeaurora.org>
Cc:     cang@codeaurora.org, martin.petersen@oracle.com,
        Bart Van Assche <bvanassche@acm.org>,
        linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org
Subject: Re: [RFC PATCH v2 0/2] Fix deadlock in ufs
Message-ID: <20210202220536.GA464234@rowland.harvard.edu>
References: <cover.1611719814.git.asutoshd@codeaurora.org>
 <84a182cc-de9c-4d6d-2193-3a44e4c88c8b@codeaurora.org>
 <20210201214802.GB420232@rowland.harvard.edu>
 <20210202205245.GA8444@stor-presley.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210202205245.GA8444@stor-presley.qualcomm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Feb 02, 2021 at 12:52:45PM -0800, Asutosh Das wrote:
> On Mon, Feb 01 2021 at 13:48 -0800, Alan Stern wrote:
> > On Mon, Feb 01, 2021 at 12:11:23PM -0800, Asutosh Das (asd) wrote:
> > > On 1/27/2021 7:26 PM, Asutosh Das wrote:
> > > > v1 -> v2
> > > > Use pm_runtime_get/put APIs.
> > > > Assuming that all bsg devices are scsi devices may break.
> > > >
> > > > This patchset attempts to fix a deadlock in ufs.
> > > > This deadlock occurs because the ufs host driver tries to resume
> > > > its child (wlun scsi device) to send SSU to it during its suspend.
> > > >
> > > > Asutosh Das (2):
> > > >    block: bsg: resume scsi device before accessing
> > > >    scsi: ufs: Fix deadlock while suspending ufs host
> > > >
> > > >   block/bsg.c               |  8 ++++++++
> > > >   drivers/scsi/ufs/ufshcd.c | 18 ++----------------
> > > >   2 files changed, 10 insertions(+), 16 deletions(-)
> > > >
> > > 
> > > Hi Alan/Bart
> > > 
> > > Please can you take a look at this series.
> > > Please let me know if you've any better suggestions for this.
> > 
> > I haven't commented on them so far because I don't understand them.
> 
> Merging thread with Bart.
> 
> > Against which kernel version has this patch series been prepared and
> > tested? Have you noticed the following patch series that went into
> > v5.11-rc1
> > https://lore.kernel.org/linux-scsi/20201209052951.16136-1-bvanassche@acm.org/
> Hi Bart - Yes this was tested with this series pulled in.
> I'm on 5.10.9.
> 
> Thanks Alan.
> I've tried to summarize below the problem that I'm seeing.
> 
> Problem:
> There's a deadlock seen in ufs's runtime-suspend path.
> Currently, the wlun's are registered to request based blk-pm.
> During ufs pltform-dev runtime-suspend cb, as per protocol needs,
> it sends a few cmds (uac, ssu) to wlun.

That doesn't make sense.  Why send commands to the wlun at a time when 
you know the wlun is already suspended?  If you wanted the wlun to 
execute those commands, you should have sent them while the wlun was 
still powered up.

> In this path, it tries to resume the ufs platform device which is actually
> suspending and deadlocks.

Because you have violated the power management layering.  The platform 
device's suspend routine is meant to assume that all of its child 
devices are already suspended and therefore it must not try to 
communicate with them.

> Yes, if the host doesn't send any commands during it's suspend there wouldn't be
> this deadlock.
> Setting manage_start_stop would send ssu only.
> I can't seem to find a way to send cmds to wlun during it's suspend.

You can't send commands to _any_ device while it is suspended!  That's 
kind of the whole point -- being suspended means the device is in a 
low-power state and therefore is unable to execute commands.

> Would overriding sd_pm_ops for wlun be a good idea?
> Do you've any other pointers on how to do this?
> I'd appreciate any pointers.

I am not a good person to answer these questions, mainly because I know 
so little about this.  What is the relation between the wlun and the sd 
driver?  For that matter, what does the "w" in "wlun" stand for?

(And for that matter, what do "ufs" and "bsg" stand for?)

You really need to direct these questions to the SCSI maintainers; I am 
not in charge of any of that code.  I can only suggest a couple of 
possibilities.  For instance, you could modify the sd_suspend_runtime 
routine: make it send the commands whenever they are needed.  Or you 
could add a callback pointer to a routine that would send the commands.

Alan Stern
