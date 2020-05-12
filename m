Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28A481CED2F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2020 08:46:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728903AbgELGqa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 May 2020 02:46:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728878AbgELGq3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 May 2020 02:46:29 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5DE2C061A0C
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2020 23:46:29 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id l73so164221pjb.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2020 23:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=E4Phsh2eMHFW2nv+ZpCJ1jY+XUspl2e96HpcVdZRuj8=;
        b=bDOD8wXZarSO4eWec1zEBoXJUeLc0sE7VwxO/+RPgQ1cZ/CkVTqBXr75hNxaWVzpiv
         okD53HZPDlhLtdA20gqjH4ykl9no9i5tbhGILzAFWqsfdOqEp+8fhj5HgLdjE8O/bBvW
         b449pBdx1eJ4xHY7AmFnXDZ7RyFTIH+S4l6KAy+IbOpvkWyV575h03baJsR3Rq0dXiKU
         A9wW+BbK30Cvg0JAlNDg3iHB7OJusQnJc+KVbdITt/2poRxUAB/MNZe+qMhqkgNnre7G
         cZ1NNgx8Wl83BGDc6b7Z1oiRdzoPUEiWzvlyua587l8tivEq5DZWwhdiSwkqgh6OUq4t
         YvTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=E4Phsh2eMHFW2nv+ZpCJ1jY+XUspl2e96HpcVdZRuj8=;
        b=QOLA1WkoGEkjUeyPI6A3s0FbuUSgxJuVPgKczjmA0pE1nl/PA+zDFozshMwbPr9ovX
         WE4hdEeNyf1/5MfiC142PDl01hiUVklwkAnMTWtYFEFQtyHOpSVh7Br5/2i7zmYhPVmm
         sBV2KcBmFIFqi8NXTF+wgYD6RGL5h/zvqs3c4MIfUvSmm2jdW9JlNdI1p8EEoZ8INKtX
         19P/SKlyVJbYrVNh6JI4SKDN+qYrhX9Su/j5spXtYJArvEuNB6qJpzTj9P6xpwzaznqf
         6Pgy5rOEyT/9yk8YNeNNcNaSu2vdLc32cCBhawvCAtBclwV0SE/CX3XWIm1VMiu890IG
         TJ5w==
X-Gm-Message-State: AGi0PuYZlnhNIsl4HZGZbAAuKiln0YL2gU8+CelVpS62/ON2Vh326MgR
        0TQA0/43RhqVXXbn/hwMD1443B11Og==
X-Google-Smtp-Source: APiQypJEg+ggTneK2wNSFCrv/8WbUlg9I49RmP2/vCeJvMgsXfoDFDN9+574dGJ0/gsqhagmTHx0ZQ==
X-Received: by 2002:a17:902:8205:: with SMTP id x5mr19455407pln.82.1589265989065;
        Mon, 11 May 2020 23:46:29 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:6007:2f23:5151:5dd:ea86:4678])
        by smtp.gmail.com with ESMTPSA id y63sm11012828pfg.138.2020.05.11.23.46.24
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 May 2020 23:46:28 -0700 (PDT)
Date:   Tue, 12 May 2020 12:16:21 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Hemant Kumar <hemantk@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        jhugo@codeaurora.org, bbhatt@codeaurora.org
Subject: Re: [PATCH v1 1/5] bus: mhi: core: Remove the system error worker
 thread
Message-ID: <20200512064621.GC4928@Mani-XPS-13-9360>
References: <1589248989-23824-1-git-send-email-hemantk@codeaurora.org>
 <1589248989-23824-2-git-send-email-hemantk@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1589248989-23824-2-git-send-email-hemantk@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, May 11, 2020 at 07:03:05PM -0700, Hemant Kumar wrote:
> Remove the system error worker thread and instead have the
> execution environment worker handle that transition to serialize
> processing and avoid any possible race conditions during
> shutdown.
> 
> Signed-off-by: Hemant Kumar <hemantk@codeaurora.org>
> Reviewed-by: Jeffrey Hugo <jhugo@codeaurora.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  drivers/bus/mhi/core/init.c     |  2 +-
>  drivers/bus/mhi/core/internal.h |  3 ++-
>  drivers/bus/mhi/core/main.c     |  6 +++---
>  drivers/bus/mhi/core/pm.c       | 32 ++++++++++++++------------------
>  include/linux/mhi.h             |  2 --
>  5 files changed, 20 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
> index 6882206..3a853c5 100644
> --- a/drivers/bus/mhi/core/init.c
> +++ b/drivers/bus/mhi/core/init.c
> @@ -34,6 +34,7 @@
>  	[DEV_ST_TRANSITION_READY] = "READY",
>  	[DEV_ST_TRANSITION_SBL] = "SBL",
>  	[DEV_ST_TRANSITION_MISSION_MODE] = "MISSION_MODE",
> +	[DEV_ST_TRANSITION_SYS_ERR] = "SYS_ERR",
>  };
>  
>  const char * const mhi_state_str[MHI_STATE_MAX] = {
> @@ -834,7 +835,6 @@ int mhi_register_controller(struct mhi_controller *mhi_cntrl,
>  	spin_lock_init(&mhi_cntrl->transition_lock);
>  	spin_lock_init(&mhi_cntrl->wlock);
>  	INIT_WORK(&mhi_cntrl->st_worker, mhi_pm_st_worker);
> -	INIT_WORK(&mhi_cntrl->syserr_worker, mhi_pm_sys_err_worker);
>  	init_waitqueue_head(&mhi_cntrl->state_event);
>  
>  	mhi_cmd = mhi_cntrl->mhi_cmd;
> diff --git a/drivers/bus/mhi/core/internal.h b/drivers/bus/mhi/core/internal.h
> index 80b32c2..f01283b 100644
> --- a/drivers/bus/mhi/core/internal.h
> +++ b/drivers/bus/mhi/core/internal.h
> @@ -386,6 +386,7 @@ enum dev_st_transition {
>  	DEV_ST_TRANSITION_READY,
>  	DEV_ST_TRANSITION_SBL,
>  	DEV_ST_TRANSITION_MISSION_MODE,
> +	DEV_ST_TRANSITION_SYS_ERR,
>  	DEV_ST_TRANSITION_MAX,
>  };
>  
> @@ -587,7 +588,7 @@ enum mhi_pm_state __must_check mhi_tryset_pm_state(
>  int mhi_queue_state_transition(struct mhi_controller *mhi_cntrl,
>  			       enum dev_st_transition state);
>  void mhi_pm_st_worker(struct work_struct *work);
> -void mhi_pm_sys_err_worker(struct work_struct *work);
> +void mhi_pm_sys_err_handler(struct mhi_controller *mhi_cntrl);
>  void mhi_fw_load_worker(struct work_struct *work);
>  int mhi_ready_state_transition(struct mhi_controller *mhi_cntrl);
>  void mhi_ctrl_ev_task(unsigned long data);
> diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
> index 6a80666..9ec9b36 100644
> --- a/drivers/bus/mhi/core/main.c
> +++ b/drivers/bus/mhi/core/main.c
> @@ -406,7 +406,7 @@ irqreturn_t mhi_intvec_threaded_handler(int irq_number, void *dev)
>  		if (MHI_IN_PBL(ee))
>  			mhi_cntrl->status_cb(mhi_cntrl, MHI_CB_FATAL_ERROR);
>  		else
> -			schedule_work(&mhi_cntrl->syserr_worker);
> +			mhi_pm_sys_err_handler(mhi_cntrl);
>  	}
>  
>  exit_intvec:
> @@ -734,7 +734,7 @@ int mhi_process_ctrl_ev_ring(struct mhi_controller *mhi_cntrl,
>  							MHI_PM_SYS_ERR_DETECT);
>  				write_unlock_irq(&mhi_cntrl->pm_lock);
>  				if (new_state == MHI_PM_SYS_ERR_DETECT)
> -					schedule_work(&mhi_cntrl->syserr_worker);
> +					mhi_pm_sys_err_handler(mhi_cntrl);
>  				break;
>  			}
>  			default:
> @@ -920,7 +920,7 @@ void mhi_ctrl_ev_task(unsigned long data)
>  		}
>  		write_unlock_irq(&mhi_cntrl->pm_lock);
>  		if (pm_state == MHI_PM_SYS_ERR_DETECT)
> -			schedule_work(&mhi_cntrl->syserr_worker);
> +			mhi_pm_sys_err_handler(mhi_cntrl);
>  	}
>  }
>  
> diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
> index 3cc238a..d9964d4 100644
> --- a/drivers/bus/mhi/core/pm.c
> +++ b/drivers/bus/mhi/core/pm.c
> @@ -449,19 +449,8 @@ static void mhi_pm_disable_transition(struct mhi_controller *mhi_cntrl,
>  		to_mhi_pm_state_str(transition_state));
>  
>  	/* We must notify MHI control driver so it can clean up first */
> -	if (transition_state == MHI_PM_SYS_ERR_PROCESS) {
> -		/*
> -		 * If controller supports RDDM, we do not process
> -		 * SYS error state, instead we will jump directly
> -		 * to RDDM state
> -		 */
> -		if (mhi_cntrl->rddm_image) {
> -			dev_dbg(dev,
> -				 "Controller supports RDDM, so skip SYS_ERR\n");
> -			return;
> -		}
> +	if (transition_state == MHI_PM_SYS_ERR_PROCESS)
>  		mhi_cntrl->status_cb(mhi_cntrl, MHI_CB_SYS_ERROR);
> -	}
>  
>  	mutex_lock(&mhi_cntrl->pm_mutex);
>  	write_lock_irq(&mhi_cntrl->pm_lock);
> @@ -527,7 +516,6 @@ static void mhi_pm_disable_transition(struct mhi_controller *mhi_cntrl,
>  	mutex_unlock(&mhi_cntrl->pm_mutex);
>  	dev_dbg(dev, "Waiting for all pending threads to complete\n");
>  	wake_up_all(&mhi_cntrl->state_event);
> -	flush_work(&mhi_cntrl->st_worker);
>  
>  	dev_dbg(dev, "Reset all active channels and remove MHI devices\n");
>  	device_for_each_child(mhi_cntrl->cntrl_dev, NULL, mhi_destroy_device);
> @@ -607,13 +595,17 @@ int mhi_queue_state_transition(struct mhi_controller *mhi_cntrl,
>  }
>  
>  /* SYS_ERR worker */
> -void mhi_pm_sys_err_worker(struct work_struct *work)
> +void mhi_pm_sys_err_handler(struct mhi_controller *mhi_cntrl)
>  {
> -	struct mhi_controller *mhi_cntrl = container_of(work,
> -							struct mhi_controller,
> -							syserr_worker);
> +	struct device *dev = &mhi_cntrl->mhi_dev->dev;
> +
> +	/* skip if controller supports RDDM */
> +	if (mhi_cntrl->rddm_image) {
> +		dev_dbg(dev, "Controller supports RDDM, skip SYS_ERROR\n");
> +		return;
> +	}
>  
> -	mhi_pm_disable_transition(mhi_cntrl, MHI_PM_SYS_ERR_PROCESS);
> +	mhi_queue_state_transition(mhi_cntrl, DEV_ST_TRANSITION_SYS_ERR);
>  }
>  
>  /* Device State Transition worker */
> @@ -661,6 +653,10 @@ void mhi_pm_st_worker(struct work_struct *work)
>  		case DEV_ST_TRANSITION_READY:
>  			mhi_ready_state_transition(mhi_cntrl);
>  			break;
> +		case DEV_ST_TRANSITION_SYS_ERR:
> +			mhi_pm_disable_transition
> +				(mhi_cntrl, MHI_PM_SYS_ERR_PROCESS);
> +			break;
>  		default:
>  			break;
>  		}
> diff --git a/include/linux/mhi.h b/include/linux/mhi.h
> index 2b20b9c..b008914 100644
> --- a/include/linux/mhi.h
> +++ b/include/linux/mhi.h
> @@ -331,7 +331,6 @@ struct mhi_controller_config {
>   * @wlock: Lock for protecting device wakeup
>   * @mhi_link_info: Device bandwidth info
>   * @st_worker: State transition worker
> - * @syserr_worker: System error worker
>   * @state_event: State change event
>   * @status_cb: CB function to notify power states of the device (required)
>   * @wake_get: CB function to assert device wake (optional)
> @@ -411,7 +410,6 @@ struct mhi_controller {
>  	spinlock_t wlock;
>  	struct mhi_link_info mhi_link_info;
>  	struct work_struct st_worker;
> -	struct work_struct syserr_worker;
>  	wait_queue_head_t state_event;
>  
>  	void (*status_cb)(struct mhi_controller *mhi_cntrl,
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
