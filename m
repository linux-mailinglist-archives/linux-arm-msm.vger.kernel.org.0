Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8DE51CBDEB
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 May 2020 07:50:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728797AbgEIFtx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 9 May 2020 01:49:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726214AbgEIFtx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 9 May 2020 01:49:53 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12DE9C061A0C
        for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2020 22:49:53 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id a7so5254709pju.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2020 22:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=18NQbr/bzMf1DLQ12FvdIKkiBeFLqAwCuMChQsSXE6k=;
        b=nIfnXbpcXmVwgpPR93KHXEPgOUEWBz/c6iQuWifLqY4BG4JBNJM6HGesBipJ4DaN1Z
         zFIQC3v8OaMjl3kvQG/8DGz72mH9yrvaGO/515UUq20ajfBYGXYw+dCxKBuawK+hC4aM
         7IbTxxsuMVYtBxAUOqrjFTOKKaN/PykKyEXuJ9toxqGWpgKUtEZffe2/V/Azp4kYphff
         11D6bJp4MkthzT8IfGURRMMdZRwLWoNRRMOzCxvrmgF6JgRG9JYgxMT8/cDzhejTQQZj
         eiuXB+kcKCQJFApsrdlf8huXCuGEP9qRspCm9AOMCsIs37k9r3Yhe6SwLAmI3+bM/zOl
         jCjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=18NQbr/bzMf1DLQ12FvdIKkiBeFLqAwCuMChQsSXE6k=;
        b=UWeW42MhKmhcEJp0gZ4BNJo7UqhKx2xCQVz/Bb6dk8jFTbcOxgJ+jnt1St1Q4c5SYV
         EWU1TvjfgIexX5nk89wq7nZtppy0eXbJQeBaA7zug4wtogaJkxN/UimWNEUJeT1JAW7z
         oWYCn//qr/qp+0p40UmFWm4PXjGvakJeztZCHjlCQLdBZBf5wI7mKfpZ0TbT/+FDZ1lr
         TWLViK2xzedDYz/V4b7KdusBG+U3FaExd4jEdJq3+Bz1t/h6x1OoPVzknbQAc3SFu5WL
         OIpGlyE7C4+Lk9wqikb4WPTO7dNky2Oi520+g7Ht+5r7nq5Jw6Mkd73ukjEXDta38Jh0
         sSUg==
X-Gm-Message-State: AGi0PuaxXX06ox6yQr2fQwgJnnEJYHMUSZ3ZYUw2EHCeXMV2H3aj530V
        oifCMyIW49tFrXr9lllV2nHq
X-Google-Smtp-Source: APiQypJBQe6/RQIgueyvWR3LJsZW3G/hapw+sEtbfmGWS4edOCwJQATIbgDmhfd90eaPOsb3YejKSQ==
X-Received: by 2002:a17:90a:1b26:: with SMTP id q35mr9162437pjq.149.1589003392480;
        Fri, 08 May 2020 22:49:52 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:6e0c:55d2:2cb4:da01:ad1e:6ad9])
        by smtp.gmail.com with ESMTPSA id t8sm2731284pgn.81.2020.05.08.22.49.49
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 May 2020 22:49:51 -0700 (PDT)
Date:   Sat, 9 May 2020 11:19:46 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        hemantk@codeaurora.org, jhugo@codeaurora.org
Subject: Re: [PATCH v7 5/8] bus: mhi: core: Handle firmware load using state
 worker
Message-ID: <20200509054946.GE5845@Mani-XPS-13-9360>
References: <1588991208-26928-1-git-send-email-bbhatt@codeaurora.org>
 <1588991208-26928-6-git-send-email-bbhatt@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1588991208-26928-6-git-send-email-bbhatt@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, May 08, 2020 at 07:26:45PM -0700, Bhaumik Bhatt wrote:
> Upon power up, driver queues firmware worker thread if the execution
> environment is PBL. Firmware worker is blocked with a timeout until
> state worker gets a chance to run and unblock firmware worker. An
> endpoint power up failure can be seen if state worker gets a chance to
> run after firmware worker has timed out. Remove this dependency and
> handle firmware load directly using state worker thread.
> 
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> Reviewed-by: Jeffrey Hugo <jhugo@codeaurora.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  drivers/bus/mhi/core/boot.c     | 18 +++---------------
>  drivers/bus/mhi/core/init.c     |  1 -
>  drivers/bus/mhi/core/internal.h |  1 +
>  drivers/bus/mhi/core/pm.c       |  6 +-----
>  include/linux/mhi.h             |  2 --
>  5 files changed, 5 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/bus/mhi/core/boot.c b/drivers/bus/mhi/core/boot.c
> index ebad5eb..17c636b 100644
> --- a/drivers/bus/mhi/core/boot.c
> +++ b/drivers/bus/mhi/core/boot.c
> @@ -377,30 +377,18 @@ static void mhi_firmware_copy(struct mhi_controller *mhi_cntrl,
>  	}
>  }
>  
> -void mhi_fw_load_worker(struct work_struct *work)
> +void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
>  {
> -	struct mhi_controller *mhi_cntrl;
>  	const struct firmware *firmware = NULL;
>  	struct image_info *image_info;
> -	struct device *dev;
> +	struct device *dev = &mhi_cntrl->mhi_dev->dev;
>  	const char *fw_name;
>  	void *buf;
>  	dma_addr_t dma_addr;
>  	size_t size;
>  	int ret;
>  
> -	mhi_cntrl = container_of(work, struct mhi_controller, fw_worker);
> -	dev = &mhi_cntrl->mhi_dev->dev;
> -
> -	dev_dbg(dev, "Waiting for device to enter PBL from: %s\n",
> -		TO_MHI_EXEC_STR(mhi_cntrl->ee));
> -
> -	ret = wait_event_timeout(mhi_cntrl->state_event,
> -				 MHI_IN_PBL(mhi_cntrl->ee) ||
> -				 MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state),
> -				 msecs_to_jiffies(mhi_cntrl->timeout_ms));
> -
> -	if (!ret || MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state)) {
> +	if (MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state)) {
>  		dev_err(dev, "Device MHI is not in valid state\n");
>  		return;
>  	}
> diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
> index 1a93d24..6882206 100644
> --- a/drivers/bus/mhi/core/init.c
> +++ b/drivers/bus/mhi/core/init.c
> @@ -835,7 +835,6 @@ int mhi_register_controller(struct mhi_controller *mhi_cntrl,
>  	spin_lock_init(&mhi_cntrl->wlock);
>  	INIT_WORK(&mhi_cntrl->st_worker, mhi_pm_st_worker);
>  	INIT_WORK(&mhi_cntrl->syserr_worker, mhi_pm_sys_err_worker);
> -	INIT_WORK(&mhi_cntrl->fw_worker, mhi_fw_load_worker);
>  	init_waitqueue_head(&mhi_cntrl->state_event);
>  
>  	mhi_cmd = mhi_cntrl->mhi_cmd;
> diff --git a/drivers/bus/mhi/core/internal.h b/drivers/bus/mhi/core/internal.h
> index 40c47f9..0965ca3 100644
> --- a/drivers/bus/mhi/core/internal.h
> +++ b/drivers/bus/mhi/core/internal.h
> @@ -627,6 +627,7 @@ void mhi_ring_chan_db(struct mhi_controller *mhi_cntrl,
>  void mhi_deinit_free_irq(struct mhi_controller *mhi_cntrl);
>  void mhi_rddm_prepare(struct mhi_controller *mhi_cntrl,
>  		      struct image_info *img_info);
> +void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl);
>  int mhi_prepare_channel(struct mhi_controller *mhi_cntrl,
>  			struct mhi_chan *mhi_chan);
>  int mhi_init_chan_ctxt(struct mhi_controller *mhi_cntrl,
> diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
> index e7c8318..3cc238a 100644
> --- a/drivers/bus/mhi/core/pm.c
> +++ b/drivers/bus/mhi/core/pm.c
> @@ -528,7 +528,6 @@ static void mhi_pm_disable_transition(struct mhi_controller *mhi_cntrl,
>  	dev_dbg(dev, "Waiting for all pending threads to complete\n");
>  	wake_up_all(&mhi_cntrl->state_event);
>  	flush_work(&mhi_cntrl->st_worker);
> -	flush_work(&mhi_cntrl->fw_worker);
>  
>  	dev_dbg(dev, "Reset all active channels and remove MHI devices\n");
>  	device_for_each_child(mhi_cntrl->cntrl_dev, NULL, mhi_destroy_device);
> @@ -643,7 +642,7 @@ void mhi_pm_st_worker(struct work_struct *work)
>  				mhi_cntrl->ee = mhi_get_exec_env(mhi_cntrl);
>  			write_unlock_irq(&mhi_cntrl->pm_lock);
>  			if (MHI_IN_PBL(mhi_cntrl->ee))
> -				wake_up_all(&mhi_cntrl->state_event);
> +				mhi_fw_load_handler(mhi_cntrl);
>  			break;
>  		case DEV_ST_TRANSITION_SBL:
>  			write_lock_irq(&mhi_cntrl->pm_lock);
> @@ -976,9 +975,6 @@ int mhi_async_power_up(struct mhi_controller *mhi_cntrl)
>  	next_state = MHI_IN_PBL(current_ee) ?
>  		DEV_ST_TRANSITION_PBL : DEV_ST_TRANSITION_READY;
>  
> -	if (next_state == DEV_ST_TRANSITION_PBL)
> -		schedule_work(&mhi_cntrl->fw_worker);
> -
>  	mhi_queue_state_transition(mhi_cntrl, next_state);
>  
>  	mutex_unlock(&mhi_cntrl->pm_mutex);
> diff --git a/include/linux/mhi.h b/include/linux/mhi.h
> index e909b8f..2b20b9c 100644
> --- a/include/linux/mhi.h
> +++ b/include/linux/mhi.h
> @@ -331,7 +331,6 @@ struct mhi_controller_config {
>   * @wlock: Lock for protecting device wakeup
>   * @mhi_link_info: Device bandwidth info
>   * @st_worker: State transition worker
> - * @fw_worker: Firmware download worker
>   * @syserr_worker: System error worker
>   * @state_event: State change event
>   * @status_cb: CB function to notify power states of the device (required)
> @@ -412,7 +411,6 @@ struct mhi_controller {
>  	spinlock_t wlock;
>  	struct mhi_link_info mhi_link_info;
>  	struct work_struct st_worker;
> -	struct work_struct fw_worker;
>  	struct work_struct syserr_worker;
>  	wait_queue_head_t state_event;
>  
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
