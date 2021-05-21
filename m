Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3888438C6BD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 May 2021 14:45:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230280AbhEUMrA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 May 2021 08:47:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:60100 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229915AbhEUMrA (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 May 2021 08:47:00 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id CB6EB613AC;
        Fri, 21 May 2021 12:45:34 +0000 (UTC)
Date:   Fri, 21 May 2021 18:15:30 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Baochen Qiang <bqiang@codeaurora.org>
Cc:     hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath11k@lists.infradead.org
Subject: Re: [PATCH] mhi: add MHI_STATE_M2 to resume success criteria
Message-ID: <20210521124530.GF70095@thinkpad>
References: <20210420035339.282963-1-bqiang@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210420035339.282963-1-bqiang@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

The patch subject should be,

"bus: mhi: Wait for M2 state during system resume"

We follow "bus: mhi:" prefix for all MHI patches. Also, the subject should
clearly portray what the patch is intend to do.

On Tue, Apr 20, 2021 at 11:53:39AM +0800, Baochen Qiang wrote:
> During system resume, mhi driver triggers M3->M0 transition and then waits

s/mhi driver/MHI host

> for target device to enter M0 state. Once done, the device queues a state
> change event into ctrl event ring and notify mhi dirver by raising an

s/notify/notifies and s/mhi dirver/MHI host. MHI driver is somewhat confusing
since we have the MHI device driver (QRTR etc...) as well. So just use MHI host
everywhere.

> interrupt, where a tasklet is scheduled to process this event. In most cases,
> the taklet is served timely and wait operation succeeds.
> 

s/taklet/tasklet

> However, there are cases where CPU is busy and can not serve this tasklet

a/can not/cannot

> for some time. Once delay goes long enough, the device moves itself to M1
> state and also interrupts mhi driver after inserting a new state change
> event to ctrl ring. Later CPU finally has time to process the ring, however
> there are two events in it now:
> 	1. for M3->M0 event, which is processed first as queued first,
> 	   tasklet handler updates device state to M0 and wakes up the task,
> 	   i.e., the mhi driver.
> 	2. for M0->M1 event, which is processed later, tasklet handler
> 	   triggers M1->M2 transition and updates device state to M2 directly,
> 	   then wakes up the mhi driver(if still sleeping on this wait queue).
> Note that although mhi driver has been woken up while processing the first
> event, it may still has no chance to run before the second event is processed.
> In other words, mhi driver has to keep waiting till timeout cause the M0 state
> has been missed.
> 
> kernel log here:
> ...
> Apr 15 01:45:14 test-NUC8i7HVK kernel: [ 4247.911251] mhi 0000:06:00.0: Entered with PM state: M3, MHI state: M3
> Apr 15 01:45:14 test-NUC8i7HVK kernel: [ 4247.917762] mhi 0000:06:00.0: State change event to state: M0
> Apr 15 01:45:14 test-NUC8i7HVK kernel: [ 4247.917767] mhi 0000:06:00.0: State change event to state: M1
> Apr 15 01:45:14 test-NUC8i7HVK kernel: [ 4338.788231] mhi 0000:06:00.0: Did not enter M0 state, MHI state: M2, PM state: M2
> ...
> 
> Fix this issue by simply adding M2 as a valid state for resume.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
> 
> Signed-off-by: Baochen Qiang <bqiang@codeaurora.org>

Could you please add a fixes tag as well? And this patch should be backported to
stable kernels also, so please CC stable@vger.kernel.org.

Thanks,
Mani

> ---
>  drivers/bus/mhi/core/pm.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
> index ce73cfa63cb3..ca5f2feed9d5 100644
> --- a/drivers/bus/mhi/core/pm.c
> +++ b/drivers/bus/mhi/core/pm.c
> @@ -900,6 +900,7 @@ int mhi_pm_resume(struct mhi_controller *mhi_cntrl)
>  
>  	ret = wait_event_timeout(mhi_cntrl->state_event,
>  				 mhi_cntrl->dev_state == MHI_STATE_M0 ||
> +				 mhi_cntrl->dev_state == MHI_STATE_M2 ||
>  				 MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state),
>  				 msecs_to_jiffies(mhi_cntrl->timeout_ms));
>  
> -- 
> 2.25.1
> 
