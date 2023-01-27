Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 34C1F67DE0C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jan 2023 07:58:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232038AbjA0G6c (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Jan 2023 01:58:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232027AbjA0G6b (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Jan 2023 01:58:31 -0500
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A50A1E5E4
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jan 2023 22:58:30 -0800 (PST)
Received: by mail-pl1-x62b.google.com with SMTP id p24so4073843plw.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jan 2023 22:58:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UD88AXFgT3CzfFTmhDllBM6242zq5MhdE+QtRpmSXls=;
        b=t3iTHktBk2dQo2soPkYRoHKrJUxXoZLE3eCAU9j0b4M231R8FfkYMaSROByf0kmR9K
         kWCZI3ErT3XvS0OdCVkGfbykuZMWBNsIchUcza4HLljYuREKskx0ESTRg4yQOQSksVKj
         IQ7/QVmcqG7Yf0nQ6z4G+ySrk1hF9Qrf4PxhGQLIb7xahH2o/EnDWW4RZr221ejmqNTm
         plSJEQpEU2MSaFmYaTCHjtGQGccRkRLtjOMIpf6O4sk8Nm9dPUO+G09IPqYPBU5JgZsG
         0Jdtd7bZKX2IQEpL8979KCeLQg/1uFQ5X53tz5LVKVsG5Plfj6XlX/OKHm1WtpqT/wpU
         IyPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UD88AXFgT3CzfFTmhDllBM6242zq5MhdE+QtRpmSXls=;
        b=lMi5SacU4++r2DMBcAERxHpbvTMvJUD7O/lE+Y9Z7oOBcsAYIuxzh5J0z/TcGBqm65
         r+Aknl6Y9dOkW4hZmqnmFJgxGvwaeOyZEupg4jIttkaJ5CImmOxGey3OOEc7gJB6LEjE
         8MTVR3ixnD343Kts2W2FcxpMs1LOyj6MkcOiItcUaB766Nn8hTW0cA9wH4l/b4pSCnNl
         z4qjeXj3XMUlgb2KKSKJeYby2xFerbusLDkklHkJBaz/wnWinQdwWsLmfSFgbzzfnoc0
         QJpjKUupSj2eYzN8afZIgQ64uWhRKd/mSHB4a+g+ypnmvrLzgZ0zw4c6nPZXpkPPYNzS
         SYPg==
X-Gm-Message-State: AO0yUKVJ9se+Rzz3HcwdFCJL58i+DN1VJBHgCq3NqnXRD9H072WL6jss
        K9vWEHLQgt5mazpPSWY3A7iinZDQ5TTxmy8=
X-Google-Smtp-Source: AK7set/vltcaFEnseucoiHsWDEEqQqTZtv6zDnDVzQR7i6VSXtXhXEJNPUvMIa6+iN3YhahoqkrSqA==
X-Received: by 2002:a17:903:454:b0:196:10b3:4364 with SMTP id iw20-20020a170903045400b0019610b34364mr12563430plb.51.1674802709376;
        Thu, 26 Jan 2023 22:58:29 -0800 (PST)
Received: from thinkpad ([117.193.209.55])
        by smtp.gmail.com with ESMTPSA id f11-20020a170902ce8b00b00172cb8b97a8sm2092949plg.5.2023.01.26.22.58.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 22:58:28 -0800 (PST)
Date:   Fri, 27 Jan 2023 12:28:21 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     mhi@lists.linux.dev
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] bus: mhi: ep: Change state_lock to mutex
Message-ID: <20230127065821.GF7809@thinkpad>
References: <20230123075049.168040-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230123075049.168040-1-manivannan.sadhasivam@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jan 23, 2023 at 01:20:49PM +0530, Manivannan Sadhasivam wrote:
> state_lock, the spinlock type is meant to protect race against concurrent
> MHI state transitions. In mhi_ep_set_m0_state(), while the state_lock is
> being held, the channels are resumed in mhi_ep_resume_channels() if the
> previous state was M3. This causes sleeping in atomic bug, since
> mhi_ep_resume_channels() use mutex internally.
> 
> Since the state_lock is supposed to be held throughout the state change,
> it is not ideal to drop the lock before calling mhi_ep_resume_channels().
> So to fix this issue, let's change the type of state_lock to mutex. This
> would also allow holding the lock throughout all state transitions thereby
> avoiding any potential race.
> 
> Cc: <stable@vger.kernel.org> # 5.19
> Fixes: e4b7b5f0f30a ("bus: mhi: ep: Add support for suspending and resuming channels")
> Reported-by: Dan Carpenter <error27@gmail.com>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Applied to mhi-next!

Thanks,
Mani

> ---
>  drivers/bus/mhi/ep/main.c |  8 +++++---
>  drivers/bus/mhi/ep/sm.c   | 42 ++++++++++++++++++++++-----------------
>  include/linux/mhi_ep.h    |  4 ++--
>  3 files changed, 31 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
> index bcaaba97ef63..528c00b232bf 100644
> --- a/drivers/bus/mhi/ep/main.c
> +++ b/drivers/bus/mhi/ep/main.c
> @@ -1001,11 +1001,11 @@ static void mhi_ep_reset_worker(struct work_struct *work)
>  
>  	mhi_ep_power_down(mhi_cntrl);
>  
> -	spin_lock_bh(&mhi_cntrl->state_lock);
> +	mutex_lock(&mhi_cntrl->state_lock);
> +
>  	/* Reset MMIO to signal host that the MHI_RESET is completed in endpoint */
>  	mhi_ep_mmio_reset(mhi_cntrl);
>  	cur_state = mhi_cntrl->mhi_state;
> -	spin_unlock_bh(&mhi_cntrl->state_lock);
>  
>  	/*
>  	 * Only proceed further if the reset is due to SYS_ERR. The host will
> @@ -1014,6 +1014,8 @@ static void mhi_ep_reset_worker(struct work_struct *work)
>  	 */
>  	if (cur_state == MHI_STATE_SYS_ERR)
>  		mhi_ep_power_up(mhi_cntrl);
> +
> +	mutex_unlock(&mhi_cntrl->state_lock);
>  }
>  
>  /*
> @@ -1386,8 +1388,8 @@ int mhi_ep_register_controller(struct mhi_ep_cntrl *mhi_cntrl,
>  
>  	INIT_LIST_HEAD(&mhi_cntrl->st_transition_list);
>  	INIT_LIST_HEAD(&mhi_cntrl->ch_db_list);
> -	spin_lock_init(&mhi_cntrl->state_lock);
>  	spin_lock_init(&mhi_cntrl->list_lock);
> +	mutex_init(&mhi_cntrl->state_lock);
>  	mutex_init(&mhi_cntrl->event_lock);
>  
>  	/* Set MHI version and AMSS EE before enumeration */
> diff --git a/drivers/bus/mhi/ep/sm.c b/drivers/bus/mhi/ep/sm.c
> index 3655c19e23c7..fd200b2ac0bb 100644
> --- a/drivers/bus/mhi/ep/sm.c
> +++ b/drivers/bus/mhi/ep/sm.c
> @@ -63,24 +63,23 @@ int mhi_ep_set_m0_state(struct mhi_ep_cntrl *mhi_cntrl)
>  	int ret;
>  
>  	/* If MHI is in M3, resume suspended channels */
> -	spin_lock_bh(&mhi_cntrl->state_lock);
> +	mutex_lock(&mhi_cntrl->state_lock);
> +
>  	old_state = mhi_cntrl->mhi_state;
>  	if (old_state == MHI_STATE_M3)
>  		mhi_ep_resume_channels(mhi_cntrl);
>  
>  	ret = mhi_ep_set_mhi_state(mhi_cntrl, MHI_STATE_M0);
> -	spin_unlock_bh(&mhi_cntrl->state_lock);
> -
>  	if (ret) {
>  		mhi_ep_handle_syserr(mhi_cntrl);
> -		return ret;
> +		goto err_unlock;
>  	}
>  
>  	/* Signal host that the device moved to M0 */
>  	ret = mhi_ep_send_state_change_event(mhi_cntrl, MHI_STATE_M0);
>  	if (ret) {
>  		dev_err(dev, "Failed sending M0 state change event\n");
> -		return ret;
> +		goto err_unlock;
>  	}
>  
>  	if (old_state == MHI_STATE_READY) {
> @@ -88,11 +87,14 @@ int mhi_ep_set_m0_state(struct mhi_ep_cntrl *mhi_cntrl)
>  		ret = mhi_ep_send_ee_event(mhi_cntrl, MHI_EE_AMSS);
>  		if (ret) {
>  			dev_err(dev, "Failed sending AMSS EE event\n");
> -			return ret;
> +			goto err_unlock;
>  		}
>  	}
>  
> -	return 0;
> +err_unlock:
> +	mutex_unlock(&mhi_cntrl->state_lock);
> +
> +	return ret;
>  }
>  
>  int mhi_ep_set_m3_state(struct mhi_ep_cntrl *mhi_cntrl)
> @@ -100,13 +102,12 @@ int mhi_ep_set_m3_state(struct mhi_ep_cntrl *mhi_cntrl)
>  	struct device *dev = &mhi_cntrl->mhi_dev->dev;
>  	int ret;
>  
> -	spin_lock_bh(&mhi_cntrl->state_lock);
> -	ret = mhi_ep_set_mhi_state(mhi_cntrl, MHI_STATE_M3);
> -	spin_unlock_bh(&mhi_cntrl->state_lock);
> +	mutex_lock(&mhi_cntrl->state_lock);
>  
> +	ret = mhi_ep_set_mhi_state(mhi_cntrl, MHI_STATE_M3);
>  	if (ret) {
>  		mhi_ep_handle_syserr(mhi_cntrl);
> -		return ret;
> +		goto err_unlock;
>  	}
>  
>  	mhi_ep_suspend_channels(mhi_cntrl);
> @@ -115,10 +116,13 @@ int mhi_ep_set_m3_state(struct mhi_ep_cntrl *mhi_cntrl)
>  	ret = mhi_ep_send_state_change_event(mhi_cntrl, MHI_STATE_M3);
>  	if (ret) {
>  		dev_err(dev, "Failed sending M3 state change event\n");
> -		return ret;
> +		goto err_unlock;
>  	}
>  
> -	return 0;
> +err_unlock:
> +	mutex_unlock(&mhi_cntrl->state_lock);
> +
> +	return ret;
>  }
>  
>  int mhi_ep_set_ready_state(struct mhi_ep_cntrl *mhi_cntrl)
> @@ -127,22 +131,24 @@ int mhi_ep_set_ready_state(struct mhi_ep_cntrl *mhi_cntrl)
>  	enum mhi_state mhi_state;
>  	int ret, is_ready;
>  
> -	spin_lock_bh(&mhi_cntrl->state_lock);
> +	mutex_lock(&mhi_cntrl->state_lock);
> +
>  	/* Ensure that the MHISTATUS is set to RESET by host */
>  	mhi_state = mhi_ep_mmio_masked_read(mhi_cntrl, EP_MHISTATUS, MHISTATUS_MHISTATE_MASK);
>  	is_ready = mhi_ep_mmio_masked_read(mhi_cntrl, EP_MHISTATUS, MHISTATUS_READY_MASK);
>  
>  	if (mhi_state != MHI_STATE_RESET || is_ready) {
>  		dev_err(dev, "READY state transition failed. MHI host not in RESET state\n");
> -		spin_unlock_bh(&mhi_cntrl->state_lock);
> -		return -EIO;
> +		ret = -EIO;
> +		goto err_unlock;
>  	}
>  
>  	ret = mhi_ep_set_mhi_state(mhi_cntrl, MHI_STATE_READY);
> -	spin_unlock_bh(&mhi_cntrl->state_lock);
> -
>  	if (ret)
>  		mhi_ep_handle_syserr(mhi_cntrl);
>  
> +err_unlock:
> +	mutex_unlock(&mhi_cntrl->state_lock);
> +
>  	return ret;
>  }
> diff --git a/include/linux/mhi_ep.h b/include/linux/mhi_ep.h
> index 478aece17046..f198a8ac7ee7 100644
> --- a/include/linux/mhi_ep.h
> +++ b/include/linux/mhi_ep.h
> @@ -70,8 +70,8 @@ struct mhi_ep_db_info {
>   * @cmd_ctx_cache_phys: Physical address of the host command context cache
>   * @chdb: Array of channel doorbell interrupt info
>   * @event_lock: Lock for protecting event rings
> - * @list_lock: Lock for protecting state transition and channel doorbell lists
>   * @state_lock: Lock for protecting state transitions
> + * @list_lock: Lock for protecting state transition and channel doorbell lists
>   * @st_transition_list: List of state transitions
>   * @ch_db_list: List of queued channel doorbells
>   * @wq: Dedicated workqueue for handling rings and state changes
> @@ -117,8 +117,8 @@ struct mhi_ep_cntrl {
>  
>  	struct mhi_ep_db_info chdb[4];
>  	struct mutex event_lock;
> +	struct mutex state_lock;
>  	spinlock_t list_lock;
> -	spinlock_t state_lock;
>  
>  	struct list_head st_transition_list;
>  	struct list_head ch_db_list;
> -- 
> 2.25.1
> 

-- 
மணிவண்ணன் சதாசிவம்
