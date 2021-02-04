Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 123AA30FD38
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Feb 2021 20:49:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238860AbhBDTtP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Feb 2021 14:49:15 -0500
Received: from netrider.rowland.org ([192.131.102.5]:35171 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S237778AbhBDTtN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Feb 2021 14:49:13 -0500
Received: (qmail 568050 invoked by uid 1000); 4 Feb 2021 14:48:31 -0500
Date:   Thu, 4 Feb 2021 14:48:31 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Asutosh Das <asutoshd@codeaurora.org>
Cc:     cang@codeaurora.org, martin.petersen@oracle.com,
        Bart Van Assche <bvanassche@acm.org>,
        linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org
Subject: Re: [RFC PATCH v2 0/2] Fix deadlock in ufs
Message-ID: <20210204194831.GA567391@rowland.harvard.edu>
References: <cover.1611719814.git.asutoshd@codeaurora.org>
 <84a182cc-de9c-4d6d-2193-3a44e4c88c8b@codeaurora.org>
 <20210201214802.GB420232@rowland.harvard.edu>
 <20210202205245.GA8444@stor-presley.qualcomm.com>
 <20210202220536.GA464234@rowland.harvard.edu>
 <20210204001354.GD37557@stor-presley.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210204001354.GD37557@stor-presley.qualcomm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Feb 03, 2021 at 04:13:54PM -0800, Asutosh Das wrote:
> Thanks Alan.
> I understand the issues with the current ufs design.
> 
> ufs has a wlun (well-known lun) that handles power management commands,
> such as SSUs. Now this wlun (device wlun) is registered as a scsi_device.
> It's queue is also set up for runtime-pm. Likewise there're 2
> more wluns, BOOT and RPMB.
> 
> Currently, the scsi devices independently runtime suspend/resume - request driven.
> So to send SSU while suspending wlun (scsi_device) this scsi device should
> be the last to be runtime suspended amongst all other ufs luns (scsi devices). The
> reason is syncronize_cache() is sent to luns during their suspend and if SSU has
> been sent already, it mostly would fail.

The SCSI subsystem assumes that different LUNs operate independently.
Evidently that isn't true here.

> Perhaps that's the reason to send SSU during platform-device suspend. I'm not
> sure if that's the right thing to do, but that's what it is now and is causing
> this deadlock.
> Now this wlun is also registered to bsg and some applications interact with rpmb
> wlun and the device-wlun using that interface. Registering the corresponding
> queues to runtime-pm ensures that the whole path is resumed before the request
> is issued.
> Because, we see this deadlock, in the RFC patch, I skipped registering the
> queues representing the wluns to runtime-pm, thus removing the restrictions to
> issue the request until queue is resumed.
> But when the requests come-in via bsg, the device has to be resumed. Hence the
> get_sync()/put_sync() in bsg driver.

Does the bsg interface send its I/O requests to the LUNs through the
block request queue?

> The reason for initiating get_sync()/put_sync() on the parent device was because
> the corresponding queue of this wlun was not setup for runtime-pm anymore.
> And for ufs resuming the scsi device essentially means sending a SSU to wlun
> which the ufs platform device does in its runtime resume now. I'm not sure if
> that was a good idea though, hence the RFC on the patches.
> 
> And now it looks to me that adding a cb to sd_suspend_runtime may not work.
> Because the scsi devices suspend asynchronously and the wlun suspends earlier than the others.
> 
> [    7.846165]scsi 0:0:0:49488: scsi_runtime_idle
> [    7.851547]scsi 0:0:0:49488: device wlun
> [    7.851809]sd 0:0:0:49488: scsi_runtime_idle
> [    7.861536]sd 0:0:0:49488: scsi_runtime_suspend < suspends prior to other luns
> [...]
> [   12.861984]sd 0:0:0:1: [sdb] Synchronizing SCSI cache
> [   12.868894]sd 0:0:0:2: [sdc] Synchronizing SCSI cache
> [   13.124331]sd 0:0:0:0: [sda] Synchronizing SCSI cache
> [   13.143961]sd 0:0:0:3: [sdd] Synchronizing SCSI cache
> [   13.163876]sd 0:0:0:6: [sdg] Synchronizing SCSI cache
> [   13.164024]sd 0:0:0:4: [sde] Synchronizing SCSI cache
> [   13.167066]sd 0:0:0:5: [sdf] Synchronizing SCSI cache
> [   17.101285]sd 0:0:0:7: [sdh] Synchronizing SCSI cache
> [   73.889551]sd 0:0:0:4: [sde] Synchronizing SCSI cache
> 
> I'm not sure if there's a way to force the wlun to suspend only after all other luns are suspended.
> Is there? I hope Bart/others help provide some inputs on this.

I don't know what would work best for you; it depends on how the LUNs
are used.  But one possibility is to make sure that whenever the boot
and rpmb wluns are resumed, the device wlun is also resumed.  So for
example, the runtime-resume callback routines for the rpmb and boot
wluns could call pm_runtime_get_sync() for the device wlun, and their
runtime-suspend callback routines could call pm_runtime_put() for the
device wlun.  And of course there would have to be appropriate 
operations when those LUNs are bound to and unbound from their drivers.

Alan Stern
