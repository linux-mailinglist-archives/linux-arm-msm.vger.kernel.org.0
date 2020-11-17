Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D40A2B57DD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Nov 2020 04:28:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726181AbgKQD1f (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Nov 2020 22:27:35 -0500
Received: from z5.mailgun.us ([104.130.96.5]:36570 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726203AbgKQD1f (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Nov 2020 22:27:35 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1605583654; h=Message-ID: References: In-Reply-To: Reply-To:
 Subject: Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=MkS07NKZoy/2VA0L8h4CVshpGnMxVinLn5NIN+SVjeo=;
 b=fvEJb5Yt2EtIixwD/2gOI7mn5IGb/FJUqDwDHhKPDSL3lzGupqJeubWbBDCnUsEhAkyPUb4I
 YjjC6daEqQdaDRl3ikf9hVgTiQ22uyoeLNdk8rRV44FIFqP+IqMnu0zFqwxK8uxMMwDnYg6L
 I/tzx+9lzb6RfU4dnPQ5GgcfHsE=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n10.prod.us-east-1.postgun.com with SMTP id
 5fb3430e6c42d983b9602af5 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 17 Nov 2020 03:27:10
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 5BDE4C43463; Tue, 17 Nov 2020 03:27:09 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A2E0AC433C6;
        Tue, 17 Nov 2020 03:27:07 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 16 Nov 2020 19:27:07 -0800
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     =?UTF-8?Q?Carl_Yin=28=E6=AE=B7=E5=BC=A0=E6=88=90=29?= 
        <carl.yin@quectel.com>
Cc:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org,
        sfr@canb.auug.org.au, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Naveen Kumar <naveen.kumar@quectel.com>
Subject: =?UTF-8?Q?Re=3A_=E7=AD=94=E5=A4=8D=3A_=5BPATCH_v2=5D_bus=3A_mhi?=
 =?UTF-8?Q?=3A_core=3A_Add_support_MHI_EE_FP_for_download_firmware?=
Organization: Qualcomm Innovation Center, Inc.
Reply-To: bbhatt@codeaurora.org
Mail-Reply-To: bbhatt@codeaurora.org
In-Reply-To: <HK2PR06MB3507CCF9B324045197F7659186E60@HK2PR06MB3507.apcprd06.prod.outlook.com>
References: <b1a1aaac0093518acf1cf575f0bb1b48@sslemail.net>
 <c6cf57064c8b1e431dbdcbfa0297d4e3@codeaurora.org>
 <HK2PR06MB3507CCF9B324045197F7659186E60@HK2PR06MB3507.apcprd06.prod.outlook.com>
Message-ID: <56caa9e38602dc1e318438732ddc6081@codeaurora.org>
X-Sender: bbhatt@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-11-12 06:48 PM, Carl Yin wrote:
> Hi bbhatt:
> 
> On November 04, 2020 1:32 AM, bbhatt wrote:
>> On 2020-11-02 17:47, Carl Yin wrote:
>> > Hi bbhatt:
>> >
>> > On November 03, 2020 12:34 AM, Bhatt wrote:
>> >> On 2020-11-02 04:27, carl.yin@quectel.com wrote:
>> >> > From: "carl.yin" <carl.yin@quectel.com>
>> >> >
>> >> > MHI wwan modems support download firmware to nand or emmc by
>> >> > firehose protocol, process as next:
>> >> > 1. modem boot up and enter EE AMSS, create DIAG channels (4, 5)
>> >> > device 2. user space tool send EDL command via DIAG channel,
>> >> >    then modem enter EE EDL
>> >> > 3. boot.c download 'flash programmer image' via BHI interface 4.
>> >> > modem enter EE FP, and create EDL channels (34, 35) device 5. user
>> >> > space tool download 'firmware image' to modem via EDL channels
>> >> >    by firehose protocol
>> >> >
>> >> > Signed-off-by: carl.yin <carl.yin@quectel.com>
> [carl.yin] can you give some advice one above commit message? I am
> afraid it is clear and brief.
> 
Sure. Can we sync-up on a separate thread to work on this patch?
>> >> > ---
>> >> >  drivers/bus/mhi/core/init.c     |  2 ++
>> >> >  drivers/bus/mhi/core/internal.h |  1 +
>> >> >  drivers/bus/mhi/core/main.c     |  5 ++++-
>> >> >  drivers/bus/mhi/core/pm.c       | 13 ++++++++++++-
>> >> >  include/linux/mhi.h             |  4 +++-
>> >> >  5 files changed, 22 insertions(+), 3 deletions(-)
>> >> >
>> >> > diff --git a/drivers/bus/mhi/core/init.c
>> >> > b/drivers/bus/mhi/core/init.c index ac4aa5c..e34616b 100644
>> >> > --- a/drivers/bus/mhi/core/init.c
>> >> > +++ b/drivers/bus/mhi/core/init.c
>> >> > @@ -26,6 +26,7 @@ const char * const mhi_ee_str[MHI_EE_MAX] = {
>> >> >  	[MHI_EE_WFW] = "WFW",
>> >> >  	[MHI_EE_PTHRU] = "PASS THRU",
>> >> >  	[MHI_EE_EDL] = "EDL",
>> >> > +	[MHI_EE_FP] = "FLASH PROGRAMMER",
>> >> >  	[MHI_EE_DISABLE_TRANSITION] = "DISABLE",
>> >> >  	[MHI_EE_NOT_SUPPORTED] = "NOT SUPPORTED",  }; @@ -35,6 +36,7
>> @@
>> >> > const char * const dev_state_tran_str[DEV_ST_TRANSITION_MAX] = {
>> >> >  	[DEV_ST_TRANSITION_READY] = "READY",
>> >> >  	[DEV_ST_TRANSITION_SBL] = "SBL",
>> >> >  	[DEV_ST_TRANSITION_MISSION_MODE] = "MISSION_MODE",
>> >> > +	[DEV_ST_TRANSITION_FP] = "FLASH_PROGRAMMER",
>> >> >  	[DEV_ST_TRANSITION_SYS_ERR] = "SYS_ERR",
>> >> >  	[DEV_ST_TRANSITION_DISABLE] = "DISABLE",  }; diff --git
>> >> > a/drivers/bus/mhi/core/internal.h b/drivers/bus/mhi/core/internal.h
>> >> > index 4abf0cf..6ae897a 100644
>> >> > --- a/drivers/bus/mhi/core/internal.h
>> >> > +++ b/drivers/bus/mhi/core/internal.h
>> >> > @@ -386,6 +386,7 @@ enum dev_st_transition {
>> >> >  	DEV_ST_TRANSITION_READY,
>> >> >  	DEV_ST_TRANSITION_SBL,
>> >> >  	DEV_ST_TRANSITION_MISSION_MODE,
>> >> > +	DEV_ST_TRANSITION_FP,
>> >> >  	DEV_ST_TRANSITION_SYS_ERR,
>> >> >  	DEV_ST_TRANSITION_DISABLE,
>> >> >  	DEV_ST_TRANSITION_MAX,
>> >> > diff --git a/drivers/bus/mhi/core/main.c
>> >> > b/drivers/bus/mhi/core/main.c index 3950792..a1e1561 100644
>> >> > --- a/drivers/bus/mhi/core/main.c
>> >> > +++ b/drivers/bus/mhi/core/main.c
>> >> > @@ -422,7 +422,7 @@ irqreturn_t mhi_intvec_threaded_handler(int
>> >> > irq_number, void *priv)
>> >> >  		wake_up_all(&mhi_cntrl->state_event);
>> >> >
>> >> >  		/* For fatal errors, we let controller decide next step */
>> >> > -		if (MHI_IN_PBL(ee))
>> >> > +		if (MHI_IN_PBL(mhi_cntrl->ee))
>> >> Let's please have this as a separate patch with a fixes tag, as it
>> >> fixes a pre-existing bug. I am sure Mani would want this.
> [carl.yin] should I wait this bug fixed, then submit patch v3?
> 
I have introduced a fix for this, added you in CC, and waiting for 
Mani's review.
It would be nice if you could wait until that is picked.
>> >> >  			mhi_cntrl->status_cb(mhi_cntrl, MHI_CB_FATAL_ERROR);
>> >> >  		else
>> >> >  			mhi_pm_sys_err_handler(mhi_cntrl);
>> >> > @@ -782,6 +782,9 @@ int mhi_process_ctrl_ev_ring(struct
>> >> > mhi_controller *mhi_cntrl,
>> >> >  			case MHI_EE_SBL:
>> >> >  				st = DEV_ST_TRANSITION_SBL;
>> >> >  				break;
>> >> > +			case MHI_EE_FP:
>> >> > +				st = DEV_ST_TRANSITION_FP;
>> >> > +				break;
>> >> When do you get this EE event on the control event ring? Does it come
>> >> by after you have detected EE as FP from mhi_sync_power_up() and move
>> >> to ready and then M0?
>> > [carl.yin] it is from the log, next is the sdx24's log.
>> > Another thing, I find mhi controller's status_cb() should not directly
>> > call mhi_power_down(), The function stack is
>> >
>> mhi_intvec_threaded_handler()->status_cb()->mhi_power_down()->free_irq().
>> > Should not free irq in the irq thread.
>> >
>> > [  304.263111] mhi 0000:03:00.0: Preparing channel: 4 [  304.275580]
>> > mhi 0000:03:00.0: Chan: 4 successfully moved to start state [
>> > 304.275580] mhi 0000:03:00.0: Preparing channel: 5 [  304.285901] mhi
>> > 0000:03:00.0: Chan: 5 successfully moved to start state [  307.380999]
>> > mhi 0000:03:00.0: local ee:EDL device ee:AMSS dev_state:SYS_ERR [
>> > 307.381000] mhi 0000:03:00.0: System error detected [  307.381001]
>> > mhi-pci-generic 0000:03:00.0: mhi_pci_status_cb ee=6,
>> > cb=7
>> > [  307.381006] mhi 0000:03:00.0: Handling state transition: DISABLE [
>> > 307.381007] mhi 0000:03:00.0: Transitioning from PM state: SYS_ERR
>> > Detect to: SHUTDOWN Process [  307.381008] mhi 0000:03:00.0:
>> > Triggering MHI Reset in device [  307.381114] mhi 0000:03:00.0: local
>> > ee:EDL device ee:DISABLE dev_state:RESET [  307.381120] mhi
>> > 0000:03:00.0: Waiting for all pending event ring processing to
>> > complete [  307.381120] mhi 0000:03:00.0: Waiting for all pending
>> > threads to complete [  307.381121] mhi 0000:03:00.0: Reset all active
>> > channels and remove MHI devices ......
>> > [  307.402279] mhi 0000:03:00.0: Resetting EV CTXT and CMD CTXT [
>> > 307.402280] mhi 0000:03:00.0: Exiting with PM state: DISABLE, MHI
>> > state: RESET
>> > [  307.402567] mhi 0000:03:00.0: Requested to power ON [  307.402845]
>> > mhi 0000:03:00.0: Power on setup success [  307.402847] mhi
>> > 0000:03:00.0: Handling state transition: PBL [  307.402985] mhi
>> > 0000:03:00.0: Starting SBL download via BHI.
>> > Session ID:1048927456
>> > [  307.435259] mhi 0000:03:00.0: local ee:EDL device ee:EDL
>> > dev_state:RESET [  308.460322] mhi 0000:03:00.0: local ee:FLASH
>> > PROGRAMMER device ee:EDL dev_state:READY [  308.460326] mhi
>> > 0000:03:00.0: Handling state transition: READY [  308.460335] mhi
>> > 0000:03:00.0: Device in READY State [  308.460335] mhi 0000:03:00.0:
>> > Initializing MHI registers [  308.464301] mhi 0000:03:00.0: State
>> > change event to state: M0 [  308.465303] mhi 0000:03:00.0: Received EE
>> > event: FLASH PROGRAMMER [  308.465311] mhi 0000:03:00.0: Handling
>> > state transition:
>> > FLASH_PROGRAMMER
>> > [  309.381506] mhi 0000:03:00.0: Preparing channel: 34 [  309.384631]
>> > mhi 0000:03:00.0: Chan: 34 successfully moved to start state [
>> > 309.384631] mhi 0000:03:00.0: Preparing channel: 35 [  309.387910] mhi
>> > 0000:03:00.0: Chan: 35 successfully moved to start state
>> >
>> Yes, you should not call mhi_power_down() from the status_cb() 
>> directly.
>> It is a
>> blocking function which should not called from a threaded IRQ handler, 
>> if possible
>> and it also ends up freeing the IRQ from the handler itself which 
>> should not be
>> done. Can you spawn a separate thread to do this work?
>> >> >  			case MHI_EE_WFW:
>> >> >  			case MHI_EE_AMSS:
>> >> >  				st = DEV_ST_TRANSITION_MISSION_MODE; diff --git
>> >> > a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c index
>> >> > 3de7b16..2d68812 100644
>> >> > --- a/drivers/bus/mhi/core/pm.c
>> >> > +++ b/drivers/bus/mhi/core/pm.c
>> >> > @@ -658,6 +658,12 @@ void mhi_pm_st_worker(struct work_struct *work)
>> >> >  		case DEV_ST_TRANSITION_MISSION_MODE:
>> >> >  			mhi_pm_mission_mode_transition(mhi_cntrl);
>> >> >  			break;
>> >> > +		case DEV_ST_TRANSITION_FP:
>> >> > +			write_lock_irq(&mhi_cntrl->pm_lock);
>> >> > +			mhi_cntrl->ee = MHI_EE_FP;
>> >> > +			write_unlock_irq(&mhi_cntrl->pm_lock);
>> >> > +			mhi_create_devices(mhi_cntrl);
>> >> > +			break;
>> >> >  		case DEV_ST_TRANSITION_READY:
>> >> >  			mhi_ready_state_transition(mhi_cntrl);
>> >> >  			break;
>> >> > @@ -1077,10 +1083,15 @@ int mhi_sync_power_up(struct mhi_controller
>> >> > *mhi_cntrl)
>> >> >
>> >> >  	wait_event_timeout(mhi_cntrl->state_event,
>> >> >  			   MHI_IN_MISSION_MODE(mhi_cntrl->ee) ||
>> >> > +			   mhi_cntrl->ee == MHI_EE_FP ||
>> >> >  			   MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state),
>> >> >  			   msecs_to_jiffies(mhi_cntrl->timeout_ms));
>> >> >
>> >> > -	ret = (MHI_IN_MISSION_MODE(mhi_cntrl->ee)) ? 0 : -ETIMEDOUT;
>> >> > +	if (mhi_cntrl->ee == MHI_EE_FP)
>> >> > +		mhi_queue_state_transition(mhi_cntrl,
>> >> DEV_ST_TRANSITION_READY);
>> >> > +	else
>> >> > +		ret = (MHI_IN_MISSION_MODE(mhi_cntrl->ee)) ? 0 :
>> -ETIMEDOUT;
>> >> > +
>> >> >  	if (ret)
>> >> >  		mhi_power_down(mhi_cntrl, false);
>> >> >
>> >> We should come up with a better design for this later on.
> [carl.yin] I move sync_power_up() to aysnc_power_up(), so modifies in
> this function is not need.
> for I found some time the "wait" will block long time. "long time
> block" is not accept by other device's drivers.
> 
> I do the transition of EDL -> FP in next function.
> --- a/drivers/bus/mhi/core/main.c
> +++ b/drivers/bus/mhi/core/main.c
> @@ -406,6 +406,9 @@ irqreturn_t mhi_intvec_threaded_handler(int
> irq_number, void *priv)
>                 dev_dbg(dev, "System error detected\n");
>                 pm_state = mhi_tryset_pm_state(mhi_cntrl,
>                                                MHI_PM_SYS_ERR_DETECT);
> +       } else if (state == MHI_STATE_READY) {
> +               if (ee == MHI_EE_EDL && mhi_cntrl->ee == MHI_EE_FP)
> +                       mhi_queue_state_transition(mhi_cntrl,
> DEV_ST_TRANSITION_READY);
This check for mhi_cntrl->ee == MHI_EE_FP will not work with my upcoming 
fixes.
>         }
>         write_unlock_irq(&mhi_cntrl->pm_lock);
> 
> and it also works well, next is the log.
I feel this should be in mhi_fw_load_handler() in function in boot.c 
before we return
success and exit the function.
-if (mhi_cntrl->ee == MHI_EE_EDL)
+if (mhi_cntrl->ee == MHI_EE_EDL) {
+        mhi_queue_state_transition(mhi_cntrl, DEV_ST_TRANSITION_READY);
          return;
+}
I can submit a patch for this as well so you can wait and have it picked 
before
your current patch. There is no need to include the check for ee as 
MHI_EE_FP, as it
should be implied.

So, basically the next power up with EDL will push EDL image, then wait 
for READY and
after an M0 is done to the device, it will trigger the EE change to FP 
on ctrl event
ring.
> [ 1048.424679] mhi 0000:03:00.0: Exiting with PM state: DISABLE, MHI
> state: RESET
> [ 1048.424743] mhi 0000:03:00.0: Requested to power ON
> [ 1048.424885] mhi 0000:03:00.0: Power on setup success
> [ 1048.424887] mhi 0000:03:00.0: Handling state transition: PBL
> [ 1048.425034] mhi 0000:03:00.0: Starting SBL download via BHI.
> Session ID:584611751
> [ 1048.446610] mhi 0000:03:00.0: local ee:EDL device ee:EDL 
> dev_state:RESET
> [ 1049.469896] mhi 0000:03:00.0: local ee:FLASH PROGRAMMER device
> ee:EDL dev_state:READY
> [ 1049.469919] mhi 0000:03:00.0: Handling state transition: READY
> [ 1049.469930] mhi 0000:03:00.0: Device in READY State
> [ 1049.469933] mhi 0000:03:00.0: Initializing MHI registers
> [ 1049.473818] mhi 0000:03:00.0: State change event to state: M0
> [ 1049.474850] mhi 0000:03:00.0: Received EE event: FLASH PROGRAMMER
> [ 1049.474888] mhi 0000:03:00.0: Handling state transition: 
> FLASH_PROGRAMMER
> [ 1050.402805] mhi 0000:03:00.0: Preparing channel: 34
> [ 1050.406175] mhi 0000:03:00.0: Chan: 34 successfully moved to start 
> state
> 
>> >> > diff --git a/include/linux/mhi.h b/include/linux/mhi.h index
>> >> > 6e1122c..4620af8 100644
>> >> > --- a/include/linux/mhi.h
>> >> > +++ b/include/linux/mhi.h
>> >> > @@ -120,6 +120,7 @@ struct mhi_link_info {
>> >> >   * @MHI_EE_WFW: WLAN firmware mode
>> >> >   * @MHI_EE_PTHRU: Passthrough
>> >> >   * @MHI_EE_EDL: Embedded downloader
>> >> > + * @MHI_EE_FP, Flash Programmer Environment
>> >> >   */
>> >> >  enum mhi_ee_type {
>> >> >  	MHI_EE_PBL,
>> >> > @@ -129,7 +130,8 @@ enum mhi_ee_type {
>> >> >  	MHI_EE_WFW,
>> >> >  	MHI_EE_PTHRU,
>> >> >  	MHI_EE_EDL,
>> >> > -	MHI_EE_MAX_SUPPORTED = MHI_EE_EDL,
>> >> > +	MHI_EE_FP,
>> >> > +	MHI_EE_MAX_SUPPORTED = MHI_EE_FP,
>> >> >  	MHI_EE_DISABLE_TRANSITION, /* local EE, not related to mhi spec */
>> >> >  	MHI_EE_NOT_SUPPORTED,
>> >> >  	MHI_EE_MAX,
>> >>
>> >> Thanks,
>> >> Bhaumik
>> >> --
>> >> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora
>> >> Forum, a Linux Foundation Collaborative Project
>> 
>> Thanks,
>> Bhaumik
>> --
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
>> Forum, a
>> Linux Foundation Collaborative Project

Thanks,
Bhaumik
---
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum,
a Linux Foundation Collaborative Project
