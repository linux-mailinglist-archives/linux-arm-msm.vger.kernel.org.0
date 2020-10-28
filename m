Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C028229D31E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Oct 2020 22:41:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727305AbgJ1VlE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Oct 2020 17:41:04 -0400
Received: from m42-4.mailgun.net ([69.72.42.4]:23201 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727300AbgJ1VlC (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Oct 2020 17:41:02 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1603921261; h=Message-ID: References: In-Reply-To: Reply-To:
 Subject: Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=nbFvQguPkxxwx+60D1Le0qVEla23bBYBdIBPkAWp1/c=;
 b=DitGRq2C5u8HyhInUI8W2BtPODwROjRqxWl9IOs+2LxLOTWNv61Ms1LC7Krz3YSYGSkRwI+J
 yC8YgvLR1xoiZztx3ZTMxvPef5HFcjvTd/WOb7aCWN3ra5rp9WA7eG8QN9XfdVkO//tgFRdY
 wGlbufdQxlhsS40KxNWiJBBmYtk=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 5f99e56d20b52b32d7118f86 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 28 Oct 2020 21:41:01
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 53DEDC433A0; Wed, 28 Oct 2020 21:41:00 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 834C7C43382;
        Wed, 28 Oct 2020 21:40:58 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Wed, 28 Oct 2020 14:40:58 -0700
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     =?UTF-8?Q?Carl_Yin=28=E6=AE=B7=E5=BC=A0=E6=88=90=29?= 
        <carl.yin@quectel.com>
Cc:     Hemant Kumar <hemantk@codeaurora.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        manivannan.sadhasivam@linaro.org, sfr@canb.auug.org.au,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Naveen Kumar <naveen.kumar@quectel.com>,
        hemantk=codeaurora.org@codeaurora.org
Subject: =?UTF-8?Q?Re=3A_=E7=AD=94=E5=A4=8D=3A_=5BPATCH=5D_bus=3A_mhi=3A_?=
 =?UTF-8?Q?core=3A_Add_support_MHI_EE_FP_for_download_firmware?=
Organization: Qualcomm Innovation Center, Inc.
Reply-To: bbhatt@codeaurora.org
Mail-Reply-To: bbhatt@codeaurora.org
In-Reply-To: <HK2PR06MB35079CE0636E6B940F6A7E5686170@HK2PR06MB3507.apcprd06.prod.outlook.com>
References: <632f397f8c8bdc4df85a26d78beb58f3@sslemail.net>
 <27de7fd88ffeb7f95b2a709f0eaec6c5@codeaurora.org>
 <HK2PR06MB35079CE0636E6B940F6A7E5686170@HK2PR06MB3507.apcprd06.prod.outlook.com>
Message-ID: <fe391e0e9cb4b8caa790210dff558c2a@codeaurora.org>
X-Sender: bbhatt@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-10-27 18:57, Carl Yin wrote:
> Hi bbhatt:
> 
> On Wednesday, October 28, 2020 9:34 AM, bbhatt wrote:
>> Hi Carl,
>> On 2020-10-27 16:01, Hemant Kumar wrote:
>> > Hi Jeff,
>> >
>> > On 10/27/20 8:11 AM, Jeffrey Hugo wrote:
>> >> On 10/27/2020 3:43 AM, carl.yin@quectel.com wrote:
>> >>> From: "carl.yin" <carl.yin@quectel.com>
>> >>>
>> >>> MHI wwan modems support download firmware to nand or emmc by
>> >>> firehose protocol, process as next:
>> >>> 1. wwan modem normal bootup and enter EE AMSS, create mhi DIAG chan
>> >>> device 2. send EDL cmd via DIAG chan, then modem enter EE EDL 3.
>> >>> boot.c download 'firehose/prog_firehose_sdx55.mbn' via BHI interface
>> >>> 4. modem enter EE FP, and create mhi EDL chan device 5. user space
>> >>> tool download FW to modem via EDL chan by firehose protocol
>> >>>
>> >>> Signed-off-by: carl.yin <carl.yin@quectel.com>
>> >>> ---
>> >>>   drivers/bus/mhi/core/boot.c     |  4 +++-
>> >>>   drivers/bus/mhi/core/init.c     |  2 ++
>> >>>   drivers/bus/mhi/core/internal.h |  1 +
>> >>>   drivers/bus/mhi/core/main.c     |  3 +++
>> >>>   drivers/bus/mhi/core/pm.c       | 16 +++++++++++++++-
>> >>>   include/linux/mhi.h             |  4 +++-
>> >>>   6 files changed, 27 insertions(+), 3 deletions(-)
>> >>>
>> >>> diff --git a/drivers/bus/mhi/core/boot.c
>> >>> b/drivers/bus/mhi/core/boot.c index 24422f5..ab39ad6 100644
>> >>> --- a/drivers/bus/mhi/core/boot.c
>> >>> +++ b/drivers/bus/mhi/core/boot.c
>> >>> @@ -460,8 +460,10 @@ void mhi_fw_load_handler(struct mhi_controller
>> >>> *mhi_cntrl)
>> >>>           return;
>> >>>       }
>> >>> -    if (mhi_cntrl->ee == MHI_EE_EDL)
>> >>> +    if (mhi_cntrl->ee == MHI_EE_EDL) {
>> >>> +        mhi_ready_state_transition(mhi_cntrl);
>> >>>           return;
>> >>> +    }
>> >>>       write_lock_irq(&mhi_cntrl->pm_lock);
>> >>>       mhi_cntrl->dev_state = MHI_STATE_RESET; diff --git
>> >>> a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c index
>> >>> ac4aa5c..9c2c2f3 100644
>> >>> --- a/drivers/bus/mhi/core/init.c
>> >>> +++ b/drivers/bus/mhi/core/init.c
>> >>> @@ -26,6 +26,7 @@ const char * const mhi_ee_str[MHI_EE_MAX] = {
>> >>>       [MHI_EE_WFW] = "WFW",
>> >>>       [MHI_EE_PTHRU] = "PASS THRU",
>> >>>       [MHI_EE_EDL] = "EDL",
>> >>> +    [MHI_EE_FP] = "FP",
>> >>>       [MHI_EE_DISABLE_TRANSITION] = "DISABLE",
>> >>>       [MHI_EE_NOT_SUPPORTED] = "NOT SUPPORTED",
>> >>>   };
>> >>> @@ -35,6 +36,7 @@ const char * const
>> >>> dev_state_tran_str[DEV_ST_TRANSITION_MAX] = {
>> >>>       [DEV_ST_TRANSITION_READY] = "READY",
>> >>>       [DEV_ST_TRANSITION_SBL] = "SBL",
>> >>>       [DEV_ST_TRANSITION_MISSION_MODE] = "MISSION_MODE",
>> >>> +    [DEV_ST_TRANSITION_FP] = "FP",
>> Longer description here would be nice (FLASH PROGRAMMER).
> [carl.yin] yes, for SDX24 and SDX55 chip, 'FIREHOSE PROGRAMMER' is more 
> better.
I agree with Jeff, should be generic.
>> 
>> >>>       [DEV_ST_TRANSITION_SYS_ERR] = "SYS_ERR",
>> >>>       [DEV_ST_TRANSITION_DISABLE] = "DISABLE",
>> >>>   };
>> >>> diff --git a/drivers/bus/mhi/core/internal.h
>> >>> b/drivers/bus/mhi/core/internal.h index 4abf0cf..6ae897a 100644
>> >>> --- a/drivers/bus/mhi/core/internal.h
>> >>> +++ b/drivers/bus/mhi/core/internal.h
>> >>> @@ -386,6 +386,7 @@ enum dev_st_transition {
>> >>>       DEV_ST_TRANSITION_READY,
>> >>>       DEV_ST_TRANSITION_SBL,
>> >>>       DEV_ST_TRANSITION_MISSION_MODE,
>> >>> +    DEV_ST_TRANSITION_FP,
>> >>>       DEV_ST_TRANSITION_SYS_ERR,
>> >>>       DEV_ST_TRANSITION_DISABLE,
>> >>>       DEV_ST_TRANSITION_MAX,
>> >>> diff --git a/drivers/bus/mhi/core/main.c
>> >>> b/drivers/bus/mhi/core/main.c index 3950792..e307b58 100644
>> >>> --- a/drivers/bus/mhi/core/main.c
>> >>> +++ b/drivers/bus/mhi/core/main.c
>> >>> @@ -782,6 +782,9 @@ int mhi_process_ctrl_ev_ring(struct
>> >>> mhi_controller *mhi_cntrl,
>> >>>               case MHI_EE_SBL:
>> >>>                   st = DEV_ST_TRANSITION_SBL;
>> >>>                   break;
>> >>> +            case MHI_EE_FP:
>> >>> +                st = DEV_ST_TRANSITION_FP;
>> >>> +                break;
>> >>>               case MHI_EE_WFW:
>> >>>               case MHI_EE_AMSS:
>> >>>                   st = DEV_ST_TRANSITION_MISSION_MODE; diff
>> --git
>> >>> a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c index
>> >>> 3de7b16..3c95a5d 100644
>> >>> --- a/drivers/bus/mhi/core/pm.c
>> >>> +++ b/drivers/bus/mhi/core/pm.c
>> >>> @@ -563,7 +563,15 @@ static void mhi_pm_disable_transition(struct
>> >>> mhi_controller *mhi_cntrl,
>> >>>       }
>> >>>       if (cur_state == MHI_PM_SYS_ERR_PROCESS) {
>> >>> -        mhi_ready_state_transition(mhi_cntrl);
>> >>> +        if (mhi_get_exec_env(mhi_cntrl) == MHI_EE_EDL
>> >>> +            && mhi_get_mhi_state(mhi_cntrl) == MHI_STATE_RESET)
>> {
>> >>> +            write_lock_irq(&mhi_cntrl->pm_lock);
>> >>> +            cur_state = mhi_tryset_pm_state(mhi_cntrl,
>> MHI_PM_POR);
>> >>> +            write_unlock_irq(&mhi_cntrl->pm_lock);
>> >>> +            mhi_queue_state_transition(mhi_cntrl,
>> >>> DEV_ST_TRANSITION_PBL);
>> >>> +        } else {
>> >>> +            mhi_ready_state_transition(mhi_cntrl);
>> >>> +        }
>> >>>       } else {
>> >>>           /* Move to disable state */
>> >>>           write_lock_irq(&mhi_cntrl->pm_lock);
>> >>> @@ -658,6 +666,12 @@ void mhi_pm_st_worker(struct work_struct *work)
>> >>>           case DEV_ST_TRANSITION_MISSION_MODE:
>> >>>               mhi_pm_mission_mode_transition(mhi_cntrl);
>> >>>               break;
>> >>> +        case DEV_ST_TRANSITION_FP:
>> >>> +            write_lock_irq(&mhi_cntrl->pm_lock);
>> >>> +            mhi_cntrl->ee = MHI_EE_FP;
>> >>> +            write_unlock_irq(&mhi_cntrl->pm_lock);
>> >>> +            mhi_create_devices(mhi_cntrl);
>> >>> +            break;
>> >>>           case DEV_ST_TRANSITION_READY:
>> >>>               mhi_ready_state_transition(mhi_cntrl);
>> >>>               break;
>> >>> diff --git a/include/linux/mhi.h b/include/linux/mhi.h index
>> >>> 6e1122c..4620af8 100644
>> >>> --- a/include/linux/mhi.h
>> >>> +++ b/include/linux/mhi.h
>> >>> @@ -120,6 +120,7 @@ struct mhi_link_info {
>> >>>    * @MHI_EE_WFW: WLAN firmware mode
>> >>>    * @MHI_EE_PTHRU: Passthrough
>> >>>    * @MHI_EE_EDL: Embedded downloader
>> >>> + * @MHI_EE_FP, Flash Programmer Environment
>> >>>    */
>> >>>   enum mhi_ee_type {
>> >>>       MHI_EE_PBL,
>> >>> @@ -129,7 +130,8 @@ enum mhi_ee_type {
>> >>>       MHI_EE_WFW,
>> >>>       MHI_EE_PTHRU,
>> >>>       MHI_EE_EDL,
>> >>> -    MHI_EE_MAX_SUPPORTED = MHI_EE_EDL,
>> >>> +    MHI_EE_FP,
>> >>> +    MHI_EE_MAX_SUPPORTED = MHI_EE_FP,
>> >>>       MHI_EE_DISABLE_TRANSITION, /* local EE, not related to mhi
>> >>> spec */
>> >>>       MHI_EE_NOT_SUPPORTED,
>> >>>       MHI_EE_MAX,
>> >>>
>> >>
>> >> This gets a NACK from me.  I don't see the FP_EE that this patch
>> >> introduces defined in the spec.  Where did it come from?
>> >>
>> > There is indeed a FP EE, BHI spec will be updated with this EE next
>> > month.
>> >
>> > Basically, once device goes to EDL, flash programmer image is
>> > downloaded using BHI protocol (same as we download SBL image using BHI
>> > from PBL in current use case). Once it is downloaded intvec sends EE
>> > change event for FP. Also event is generated for the same which is
>> > used to create EDL channels (34, 35) which is used by flash programmer
>> > to flash image for AMSS.
>> >
>> >>> 2. send EDL cmd via DIAG chan, then modem enter EE EDL
>> > #2 needs to be done in cleaner way. From AMSS when diag cmd is sent to
>> > switch to EDL, device would send SYS_ERR which we can use to do a call
>> > back to mhi controller to perform power down and power up. Instead of
>> > moving pm state to POR from disable transition :-
>> >
>> The callback that Hemant refers to is for MHI_CB_FATAL_ERROR. It 
>> should be
>> seen by the controller once device enters EDL EE with MHI in SYS_ERROR 
>> state.
>> 
>> Can you confirm you see this? If yes, it should be used to power down 
>> and power
>> up MHI with EE set to EDL.
> [carl.yin] from AMSS EE to SBL EE or EDL EE, I think it is not a
> really ' FATAL_ERROR '.
> It is a normal EE state change, no need to power down and power up 
> device.
> When ' FATAL_ERROR ' occurs, we can get really EE state from the MHI 
> devices.
> Then just stay here, let the user space tools to decide how to handle
> this new EE.
> 
Why do you think it is a normal EE change? FATAL ERROR callback is a 
means to
notify the controller that the device is back to one of the PBL EEs 
(PBL/EDL/
PTHRU) and a clean-up must be done. Hence, the emphasis on doing an MHI 
power
down and power up.

Because any move to from AMSS -> PBL is essentially treated as a reboot 
of the
device, MHI host should instruct the controller to do the same for MHI. 
Once
the next power up happens, you are free to load the EDL image because EE 
will
be EDL if mhi_cntrl->edl_image is set as 
'firehose/prog_firehose_sdx55.mbn'.

This if check is not a good idea. If you want to load the EDL image, 
just use
what already exists.
>> 
>> This, along with the mhi_cntrl->edl_image set from the controller, 
>> will result in
>> MHI loading the EDL image for you.
>> > @@ -563,7 +563,15 @@ static void mhi_pm_disable_transition(struct
>> >>> mhi_controller *mhi_cntrl,
>> >>>       }
>> >>>       if (cur_state == MHI_PM_SYS_ERR_PROCESS) {
>> >>> -        mhi_ready_state_transition(mhi_cntrl);
>> >>> +        if (mhi_get_exec_env(mhi_cntrl) == MHI_EE_EDL
>> >>> +            && mhi_get_mhi_state(mhi_cntrl) == MHI_STATE_RESET) {
>> >>> +            write_lock_irq(&mhi_cntrl->pm_lock);
>> >>> +            cur_state = mhi_tryset_pm_state(mhi_cntrl, MHI_PM_POR);
>> >>> +            write_unlock_irq(&mhi_cntrl->pm_lock);
>> >>> +            mhi_queue_state_transition(mhi_cntrl,
>> >>> DEV_ST_TRANSITION_PBL);
>> >>> +        } else {
>> >>> +            mhi_ready_state_transition(mhi_cntrl);
>> >>> +        }
> [carl.yin] I am working on SDX24 and SDX55 chip, maybe the process is
> different form MHI wlan chips?
> For these chips, SBL EE means the chip enter RAMDUMP state. mhi driver
> just need export SAHARA chan
> to user space, then user space tool to catch RADDUMP.
> 
>> >
>> > Thanks,
>> > Hemant
>> 
>> Thanks,
>> Bhaumik
>> --
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
>> Forum, a
>> Linux Foundation Collaborative Project

Thanks,
Bhaumik
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum,
a Linux Foundation Collaborative Project
