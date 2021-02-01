Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33CC030B24A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Feb 2021 22:48:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229621AbhBAVss (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Feb 2021 16:48:48 -0500
Received: from netrider.rowland.org ([192.131.102.5]:33887 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S229498AbhBAVsp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Feb 2021 16:48:45 -0500
Received: (qmail 421081 invoked by uid 1000); 1 Feb 2021 16:48:02 -0500
Date:   Mon, 1 Feb 2021 16:48:02 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     "Asutosh Das \(asd\)" <asutoshd@codeaurora.org>
Cc:     cang@codeaurora.org, martin.petersen@oracle.com,
        Bart Van Assche <bvanassche@acm.org>,
        linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org
Subject: Re: [RFC PATCH v2 0/2] Fix deadlock in ufs
Message-ID: <20210201214802.GB420232@rowland.harvard.edu>
References: <cover.1611719814.git.asutoshd@codeaurora.org>
 <84a182cc-de9c-4d6d-2193-3a44e4c88c8b@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <84a182cc-de9c-4d6d-2193-3a44e4c88c8b@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Feb 01, 2021 at 12:11:23PM -0800, Asutosh Das (asd) wrote:
> On 1/27/2021 7:26 PM, Asutosh Das wrote:
> > v1 -> v2
> > Use pm_runtime_get/put APIs.
> > Assuming that all bsg devices are scsi devices may break.
> > 
> > This patchset attempts to fix a deadlock in ufs.
> > This deadlock occurs because the ufs host driver tries to resume
> > its child (wlun scsi device) to send SSU to it during its suspend.
> > 
> > Asutosh Das (2):
> >    block: bsg: resume scsi device before accessing
> >    scsi: ufs: Fix deadlock while suspending ufs host
> > 
> >   block/bsg.c               |  8 ++++++++
> >   drivers/scsi/ufs/ufshcd.c | 18 ++----------------
> >   2 files changed, 10 insertions(+), 16 deletions(-)
> > 
> 
> Hi Alan/Bart
> 
> Please can you take a look at this series.
> Please let me know if you've any better suggestions for this.

I haven't commented on them so far because I don't understand them.

> [RFC PATCH v2 1/2] block: bsg: resume platform device before accessing:
> 
> It may happen that the underlying device's runtime-pm is
> not controlled by block-pm. So it's possible that when
> commands are sent to the device, it's suspended and may not
> be resumed by blk-pm. Hence explicitly resume the parent
> which is the platform device.

If you want to send a command to the underlying device, why do you 
resume the underlying device's _parent_?  Why not resume the device 
itself?

Why is bsg sending commands to the underlying device in a way that 
evades checks for whether the device is suspended?  Shouldn't the 
device's driver already be responsible for automatically resuming the 
device when a command is sent?

> [RFC PATCH v2 2/2] scsi: ufs: Fix deadlock while suspending ufs host:
> 
> During runtime-suspend of ufs host, the scsi devices are
> already suspended and so are the queues associated with them.
> But the ufs host sends SSU to wlun during its runtime-suspend.
> During the process blk_queue_enter checks if the queue is not in
> suspended state. If so, it waits for the queue to resume, and never
> comes out of it.
> The commit
> (d55d15a33: scsi: block: Do not accept any requests while suspended)
> adds the check if the queue is in suspended state in blk_queue_enter().
> 
> Fix this, by decoupling wlun scsi devices from block layer pm.
> The runtime-pm for these devices would be managed by bsg and sg drivers.

Why do you need to send a command to the wlun when the host is being 
suspended?  Shouldn't that command already have been sent, at the time 
when the wlun was suspended?

Alan Stern
