Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 791D82A13E2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Oct 2020 07:54:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726308AbgJaGyS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 31 Oct 2020 02:54:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725822AbgJaGyS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 31 Oct 2020 02:54:18 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A086C0613D7
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2020 23:54:16 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id s35so313565pjd.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2020 23:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:user-agent:in-reply-to:references:mime-version
         :content-transfer-encoding:subject:to:cc:from:message-id;
        bh=Uz9fZJirGz5rg1PNxpm5+ozOP5Z9m1CqkLBt9ZMRBuk=;
        b=Vn4u4rMl4ccB832WIUJa9KVV/V8iW6F/3kLc6h08AyV8g3h58rzVycgsNL5A4tgmiw
         UazOyyv/KGdifkXAi821inqV5ct5eJdZKbpyt/R4jozLLKgbEcbBXnlpDZrU8pMifj2M
         OSHt3vHs7VBp7UJgqavXeScesRrYkwLFFUDAdqgAeUvPiMSu7Wpm7CJQo3efgv1NE46R
         6MFY+ZD5ZONef6u/L4uThXki3XlUh8EpINKSaE40Q+iGN1efQF6Zp7H+erJ3fkejyt93
         wuaMb1uv+PIcQIkf1ZiH7ByxFwXIIHD7s052iSZ9a1k1Kl2hdTlxDG3tptKcK8Y2peK5
         dzrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:user-agent:in-reply-to:references
         :mime-version:content-transfer-encoding:subject:to:cc:from
         :message-id;
        bh=Uz9fZJirGz5rg1PNxpm5+ozOP5Z9m1CqkLBt9ZMRBuk=;
        b=QalIqTlCDpUIzcGPFzDUQDvSVsQwvVdj2qE1M8KF6m+7oVWyvAGMrKkP0pe8I4hqxI
         05OM9EBa2Q9W1ZFMjKZdC3FpuMcdEXd70X9O/4YQqF3DX2LbU40C5g1OOw2lZt6dBnYv
         O33+2HA2WMf2Xa37vC8qk7IC83E3/EEY5nV43tIsZGcEB0f1xN4EzORQzqtW2EDE9uQw
         yXcWdpGXN4lMpbj9Zi2vHxQXssSC+ISk0MrOeA5xuxbvGw/DEmTnveOo8/VFoMbirmYz
         RerOsGamWP021FjOp/vnbmzCQH/iau4DU4tTMsHxVlD1Zt8RduvpeLcdEd774+CwYYmC
         MGMA==
X-Gm-Message-State: AOAM5323NoBNCApUs4nm8RDLs+ncafLnnLcv9Gd5173hpXAKtWTd6+He
        hQAVd2T/xViEhwDmv/bnvni9
X-Google-Smtp-Source: ABdhPJxmYfdXh6sPKEFafNYca1Oxj1jJI0t4NQB3r78Fm+GQO9iEAWzEDcMzc0ZeuVE//4rKXF1dUw==
X-Received: by 2002:a17:902:788f:b029:d6:4c68:f652 with SMTP id q15-20020a170902788fb02900d64c68f652mr12801442pll.1.1604127255694;
        Fri, 30 Oct 2020 23:54:15 -0700 (PDT)
Received: from ?IPv6:2409:4072:86:5271:fc52:2b7d:2a92:4df5? ([2409:4072:86:5271:fc52:2b7d:2a92:4df5])
        by smtp.gmail.com with ESMTPSA id i1sm5576526pjh.52.2020.10.30.23.54.14
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 30 Oct 2020 23:54:15 -0700 (PDT)
Date:   Sat, 31 Oct 2020 12:24:09 +0530
User-Agent: K-9 Mail for Android
In-Reply-To: <a02c31409d696075b155ef2d6ee33009@codeaurora.org>
References: <1604031057-32820-1-git-send-email-bbhatt@codeaurora.org> <1604031057-32820-11-git-send-email-bbhatt@codeaurora.org> <20201030140656.GL3818@Mani-XPS-13-9360> <a02c31409d696075b155ef2d6ee33009@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 10/12] bus: mhi: core: Separate system error and power down handling
To:     bbhatt@codeaurora.org, Bhaumik Bhatt <bbhatt@codeaurora.org>
CC:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Message-ID: <716796DC-0E3E-4021-B764-228E42A3B7FD@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bhaumik,=20

On 31 October 2020 1:04:07 AM IST, Bhaumik Bhatt <bbhatt@codeaurora=2Eorg>=
 wrote:
>Hi Mani,
>
>On 2020-10-30 07:06, Manivannan Sadhasivam wrote:
>> On Thu, Oct 29, 2020 at 09:10:55PM -0700, Bhaumik Bhatt wrote:
>>> Currently, there exist a set of if=2E=2E=2Eelse statements in the
>>> mhi_pm_disable_transition() function which make handling system
>>> error and disable transitions differently complex=2E To make that
>>> cleaner and facilitate differences in behavior, separate these
>>> two transitions for MHI host=2E
>>>=20
>>=20
>> And this results in a lot of duplicated code :/
>>=20
>> Thanks,
>> Mani
>>=20
>
>I knew this was coming=2E Mainly, we can avoid adding confusing if=2E=2E=
=2Eelse
>statements that plague the current mhi_pm_disable_transition() function
>
>and in
>return for some duplicate code, we can make handling separate use cases
>
>easier
>as they could pop-up anytime in the future=2E
>

If that happens then do it but now, please no=2E=20

Thanks,=20
Mani

>>> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora=2Eorg>
>>> ---
>>>  drivers/bus/mhi/core/pm=2Ec | 159=20
>>> +++++++++++++++++++++++++++++++++++++++-------
>>>  1 file changed, 137 insertions(+), 22 deletions(-)
>>>=20
>>> diff --git a/drivers/bus/mhi/core/pm=2Ec b/drivers/bus/mhi/core/pm=2Ec
>>> index 1d04e401=2E=2E347ae7d 100644
>>> --- a/drivers/bus/mhi/core/pm=2Ec
>>> +++ b/drivers/bus/mhi/core/pm=2Ec
>>> @@ -444,7 +444,7 @@ static int mhi_pm_mission_mode_transition(struct
>
>>> mhi_controller *mhi_cntrl)
>>>  	return ret;
>>>  }
>>>=20
>>> -/* Handle SYS_ERR and Shutdown transitions */
>>> +/* Handle shutdown transitions */
>>>  static void mhi_pm_disable_transition(struct mhi_controller=20
>>> *mhi_cntrl,
>>>  				      enum mhi_pm_state transition_state)
>>>  {
>>> @@ -460,10 +460,6 @@ static void mhi_pm_disable_transition(struct=20
>>> mhi_controller *mhi_cntrl,
>>>  		to_mhi_pm_state_str(mhi_cntrl->pm_state),
>>>  		to_mhi_pm_state_str(transition_state));
>>>=20
>>> -	/* We must notify MHI control driver so it can clean up first */
>>> -	if (transition_state =3D=3D MHI_PM_SYS_ERR_PROCESS)
>>> -		mhi_cntrl->status_cb(mhi_cntrl, MHI_CB_SYS_ERROR);
>>> -
>>>  	mutex_lock(&mhi_cntrl->pm_mutex);
>>>  	write_lock_irq(&mhi_cntrl->pm_lock);
>>>  	prev_state =3D mhi_cntrl->pm_state;
>>> @@ -502,11 +498,8 @@ static void mhi_pm_disable_transition(struct=20
>>> mhi_controller *mhi_cntrl,
>>>  							    MHICTRL_RESET_SHIFT,
>>>  							    &in_reset) ||
>>>  					!in_reset, timeout);
>>> -		if ((!ret || in_reset) && cur_state =3D=3D MHI_PM_SYS_ERR_PROCESS) =
{
>>> +		if (!ret || in_reset)
>>>  			dev_err(dev, "Device failed to exit MHI Reset state\n");
>>> -			mutex_unlock(&mhi_cntrl->pm_mutex);
>>> -			return;
>>> -		}
>>>=20
>>>  		/*
>>>  		 * Device will clear BHI_INTVEC as a part of RESET processing,
>>> @@ -566,19 +559,142 @@ static void mhi_pm_disable_transition(struct=20
>>> mhi_controller *mhi_cntrl,
>>>  		er_ctxt->wp =3D er_ctxt->rbase;
>>>  	}
>>>=20
>>> -	if (cur_state =3D=3D MHI_PM_SYS_ERR_PROCESS) {
>>> -		mhi_ready_state_transition(mhi_cntrl);
>>> -	} else {
>>> -		/* Move to disable state */
>>> -		write_lock_irq(&mhi_cntrl->pm_lock);
>>> -		cur_state =3D mhi_tryset_pm_state(mhi_cntrl, MHI_PM_DISABLE);
>>> -		write_unlock_irq(&mhi_cntrl->pm_lock);
>>> -		if (unlikely(cur_state !=3D MHI_PM_DISABLE))
>>> -			dev_err(dev, "Error moving from PM state: %s to: %s\n",
>>> -				to_mhi_pm_state_str(cur_state),
>>> -				to_mhi_pm_state_str(MHI_PM_DISABLE));
>>> +	/* Move to disable state */
>>> +	write_lock_irq(&mhi_cntrl->pm_lock);
>>> +	cur_state =3D mhi_tryset_pm_state(mhi_cntrl, MHI_PM_DISABLE);
>>> +	write_unlock_irq(&mhi_cntrl->pm_lock);
>>> +	if (unlikely(cur_state !=3D MHI_PM_DISABLE))
>>> +		dev_err(dev, "Error moving from PM state: %s to: %s\n",
>>> +			to_mhi_pm_state_str(cur_state),
>>> +			to_mhi_pm_state_str(MHI_PM_DISABLE));
>>> +
>>> +	dev_dbg(dev, "Exiting with PM state: %s, MHI state: %s\n",
>>> +		to_mhi_pm_state_str(mhi_cntrl->pm_state),
>>> +		TO_MHI_STATE_STR(mhi_cntrl->dev_state));
>>> +
>>> +	mutex_unlock(&mhi_cntrl->pm_mutex);
>>> +}
>>> +
>>> +/* Handle system error transitions */
>>> +static void mhi_pm_sys_error_transition(struct mhi_controller=20
>>> *mhi_cntrl)
>>> +{
>>> +	enum mhi_pm_state cur_state, prev_state;
>>> +	struct mhi_event *mhi_event;
>>> +	struct mhi_cmd_ctxt *cmd_ctxt;
>>> +	struct mhi_cmd *mhi_cmd;
>>> +	struct mhi_event_ctxt *er_ctxt;
>>> +	struct device *dev =3D &mhi_cntrl->mhi_dev->dev;
>>> +	int ret, i;
>>> +
>>> +	dev_dbg(dev, "Transitioning from PM state: %s to: %s\n",
>>> +		to_mhi_pm_state_str(mhi_cntrl->pm_state),
>>> +		to_mhi_pm_state_str(MHI_PM_SYS_ERR_PROCESS));
>>> +
>>> +	/* We must notify MHI control driver so it can clean up first */
>>> +	mhi_cntrl->status_cb(mhi_cntrl, MHI_CB_SYS_ERROR);
>>> +
>>> +	mutex_lock(&mhi_cntrl->pm_mutex);
>>> +	write_lock_irq(&mhi_cntrl->pm_lock);
>>> +	prev_state =3D mhi_cntrl->pm_state;
>>> +	cur_state =3D mhi_tryset_pm_state(mhi_cntrl,
>MHI_PM_SYS_ERR_PROCESS);
>>> +	write_unlock_irq(&mhi_cntrl->pm_lock);
>>> +
>>> +	if (cur_state !=3D MHI_PM_SYS_ERR_PROCESS) {
>>> +		dev_err(dev, "Failed to transition from PM state: %s to: %s\n",
>>> +			to_mhi_pm_state_str(cur_state),
>>> +			to_mhi_pm_state_str(MHI_PM_SYS_ERR_PROCESS));
>>> +		goto exit_sys_error_transition;
>>> +	}
>>> +
>>> +	mhi_cntrl->ee =3D MHI_EE_DISABLE_TRANSITION;
>>> +	mhi_cntrl->dev_state =3D MHI_STATE_RESET;
>>> +
>>> +	/* Wake up threads waiting for state transition */
>>> +	wake_up_all(&mhi_cntrl->state_event);
>>> +
>>> +	/* Trigger MHI RESET so that the device will not access host
>memory=20
>>> */
>>> +	if (MHI_REG_ACCESS_VALID(prev_state)) {
>>> +		u32 in_reset =3D -1;
>>> +		unsigned long timeout =3D msecs_to_jiffies(mhi_cntrl->timeout_ms);
>>> +
>>> +		dev_dbg(dev, "Triggering MHI Reset in device\n");
>>> +		mhi_set_mhi_state(mhi_cntrl, MHI_STATE_RESET);
>>> +
>>> +		/* Wait for the reset bit to be cleared by the device */
>>> +		ret =3D wait_event_timeout(mhi_cntrl->state_event,
>>> +					 mhi_read_reg_field(mhi_cntrl,
>>> +							    mhi_cntrl->regs,
>>> +							    MHICTRL,
>>> +							    MHICTRL_RESET_MASK,
>>> +							    MHICTRL_RESET_SHIFT,
>>> +							    &in_reset) ||
>>> +					!in_reset, timeout);
>>> +		if (!ret || in_reset) {
>>> +			dev_err(dev, "Device failed to exit MHI Reset state\n");
>>> +			goto exit_sys_error_transition;
>>> +		}
>>> +
>>> +		/*
>>> +		 * Device will clear BHI_INTVEC as a part of RESET processing,
>>> +		 * hence re-program it
>>> +		 */
>>> +		mhi_write_reg(mhi_cntrl, mhi_cntrl->bhi, BHI_INTVEC, 0);
>>> +	}
>>> +
>>> +	dev_dbg(dev,
>>> +		"Waiting for all pending event ring processing to complete\n");
>>> +	mhi_event =3D mhi_cntrl->mhi_event;
>>> +	for (i =3D 0; i < mhi_cntrl->total_ev_rings; i++, mhi_event++) {
>>> +		if (mhi_event->offload_ev)
>>> +			continue;
>>> +		tasklet_kill(&mhi_event->task);
>>>  	}
>>>=20
>>> +	/* Release lock and wait for all pending threads to complete */
>>> +	mutex_unlock(&mhi_cntrl->pm_mutex);
>>> +	dev_dbg(dev, "Waiting for all pending threads to complete\n");
>>> +	wake_up_all(&mhi_cntrl->state_event);
>>> +
>>> +	dev_dbg(dev, "Reset all active channels and remove MHI
>devices\n");
>>> +	device_for_each_child(mhi_cntrl->cntrl_dev, NULL,=20
>>> mhi_destroy_device);
>>> +
>>> +	mutex_lock(&mhi_cntrl->pm_mutex);
>>> +
>>> +	WARN_ON(atomic_read(&mhi_cntrl->dev_wake));
>>> +	WARN_ON(atomic_read(&mhi_cntrl->pending_pkts));
>>> +
>>> +	/* Reset the ev rings and cmd rings */
>>> +	dev_dbg(dev, "Resetting EV CTXT and CMD CTXT\n");
>>> +	mhi_cmd =3D mhi_cntrl->mhi_cmd;
>>> +	cmd_ctxt =3D mhi_cntrl->mhi_ctxt->cmd_ctxt;
>>> +	for (i =3D 0; i < NR_OF_CMD_RINGS; i++, mhi_cmd++, cmd_ctxt++) {
>>> +		struct mhi_ring *ring =3D &mhi_cmd->ring;
>>> +
>>> +		ring->rp =3D ring->base;
>>> +		ring->wp =3D ring->base;
>>> +		cmd_ctxt->rp =3D cmd_ctxt->rbase;
>>> +		cmd_ctxt->wp =3D cmd_ctxt->rbase;
>>> +	}
>>> +
>>> +	mhi_event =3D mhi_cntrl->mhi_event;
>>> +	er_ctxt =3D mhi_cntrl->mhi_ctxt->er_ctxt;
>>> +	for (i =3D 0; i < mhi_cntrl->total_ev_rings; i++, er_ctxt++,
>>> +	     mhi_event++) {
>>> +		struct mhi_ring *ring =3D &mhi_event->ring;
>>> +
>>> +		/* Skip offload events */
>>> +		if (mhi_event->offload_ev)
>>> +			continue;
>>> +
>>> +		ring->rp =3D ring->base;
>>> +		ring->wp =3D ring->base;
>>> +		er_ctxt->rp =3D er_ctxt->rbase;
>>> +		er_ctxt->wp =3D er_ctxt->rbase;
>>> +	}
>>> +
>>> +	mhi_ready_state_transition(mhi_cntrl);
>>> +
>>> +exit_sys_error_transition:
>>>  	dev_dbg(dev, "Exiting with PM state: %s, MHI state: %s\n",
>>>  		to_mhi_pm_state_str(mhi_cntrl->pm_state),
>>>  		TO_MHI_STATE_STR(mhi_cntrl->dev_state));
>>> @@ -666,8 +782,7 @@ void mhi_pm_st_worker(struct work_struct *work)
>>>  			mhi_ready_state_transition(mhi_cntrl);
>>>  			break;
>>>  		case DEV_ST_TRANSITION_SYS_ERR:
>>> -			mhi_pm_disable_transition
>>> -				(mhi_cntrl, MHI_PM_SYS_ERR_PROCESS);
>>> +			mhi_pm_sys_error_transition(mhi_cntrl);
>>>  			break;
>>>  		case DEV_ST_TRANSITION_DISABLE:
>>>  			mhi_pm_disable_transition
>>> --
>>> The Qualcomm Innovation Center, Inc=2E is a member of the Code Aurora=
=20
>>> Forum,
>>> a Linux Foundation Collaborative Project
>>>=20
>
>Thanks,
>Bhaumik

--=20
Sent from my Android device with K-9 Mail=2E Please excuse my brevity=2E
