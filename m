Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16256288D4A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Oct 2020 17:49:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389431AbgJIPtL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Oct 2020 11:49:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389289AbgJIPtK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Oct 2020 11:49:10 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6B03C0613D5
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Oct 2020 08:49:09 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id w21so7205631pfc.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2020 08:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=h1HEHBOion93MLuzoQuc94mGi98U7sgqTmm3qL/oASo=;
        b=CUqOzKTUgZsduo47Nq6rZCIV7/fJXfEyh3NmSl07zo2XBRvYtDRrydUi0XObgLoQVZ
         m/1Xf6X6vVlpZ/TdHlCcNGBfTesExjRmycqh3+PJUtWRR/YBGhjhrfgZhnc0YpcMJ2xG
         CQlbmGQ1SW1eZLZC25P0Z2HKSgTIfCNFcuIIxZEucTHza+PxpnTMrTlUyzC8NX808NAm
         tJubWQw4aJ4s2TBT0JvmtF3cYhAIUWc4UC0j7iBDrO+y4jynVquPdpD6LYOMxIN+MOVo
         23Tb2gUn+dBYqswqfyUjy8F/OkiT5maogQmKi+RLDs8fmbWjXs8pGrddYhqh7SNU3lVB
         DL8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=h1HEHBOion93MLuzoQuc94mGi98U7sgqTmm3qL/oASo=;
        b=A9m66F5mPlIP5EAWbc7UWNywQAiFSw0Pdtpp3Tkd77opl+Ldw6/UmvwoqVV/fVGqLe
         3LKD0AbMZvk8D8DmKdl1Dk/bQDMU/NMxm4yv3U3VIBd1Q5etPyAVTGAr1cnKp+nk0MS8
         pBPZPABw+WfgDtl8bZC3arbAuisBD1zQQwLwGBhIQgxpMXcMBBfYe8O6zUZXvTXEqMrI
         4mEdgs0CBqM5k5vHkUYh/mrS9mtq82TX3wn/Et+m5LE3aJ9HMiNA8xpScEmal8xMCsD9
         fefmq301/RubTGQSqahYgi+Xhw0E0/0eXD2KUHpsTphowO0ENPTN96cr4LyWnj2btPoK
         6hoQ==
X-Gm-Message-State: AOAM532wL7Lv5CD9xZc7bLbFVok38JRw5bCedwbv/BdIYynErHexhiYM
        UPyEmgxaMbptdRh8vzZKfsZzmzU0/Bwj
X-Google-Smtp-Source: ABdhPJwpZlC16EgeNKCHgUtx/cKKuyBarJpHuYUCv6vFzXwERsObz0AYRgEb2QmoxGr5CSbOwC1m5g==
X-Received: by 2002:a63:f84f:: with SMTP id v15mr3827674pgj.180.1602258549020;
        Fri, 09 Oct 2020 08:49:09 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:6292:5a21:d5ff:f3e8:fcf2:ccc7])
        by smtp.gmail.com with ESMTPSA id y5sm12547501pge.62.2020.10.09.08.49.05
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Oct 2020 08:49:08 -0700 (PDT)
Date:   Fri, 9 Oct 2020 21:19:02 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 02/10] bus: mhi: core: Move to using high priority
 workqueue
Message-ID: <20201009154902.GC4810@Mani-XPS-13-9360>
References: <1600480955-16827-1-git-send-email-bbhatt@codeaurora.org>
 <1600480955-16827-3-git-send-email-bbhatt@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1600480955-16827-3-git-send-email-bbhatt@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Sep 18, 2020 at 07:02:27PM -0700, Bhaumik Bhatt wrote:
> MHI work is currently scheduled on the global/system workqueue and can
> encounter delays on a stressed system. To avoid those unforeseen
> delays which can hamper bootup or shutdown times, use a dedicated high
> priority workqueue instead of the global/system workqueue.
> 
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> ---
>  drivers/bus/mhi/core/init.c | 7 +++++++
>  drivers/bus/mhi/core/pm.c   | 2 +-
>  include/linux/mhi.h         | 2 ++
>  3 files changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
> index 1b4161e..ca32563 100644
> --- a/drivers/bus/mhi/core/init.c
> +++ b/drivers/bus/mhi/core/init.c
> @@ -890,6 +890,11 @@ int mhi_register_controller(struct mhi_controller *mhi_cntrl,
>  	INIT_WORK(&mhi_cntrl->st_worker, mhi_pm_st_worker);
>  	init_waitqueue_head(&mhi_cntrl->state_event);
>  
> +	mhi_cntrl->hiprio_wq = alloc_ordered_workqueue
> +				("mhi_hiprio_wq", WQ_MEM_RECLAIM | WQ_HIGHPRI);
> +	if (!mhi_cntrl->hiprio_wq)

Printing an error here would be helpful.

> +		goto error_alloc_cmd;
> +
>  	mhi_cmd = mhi_cntrl->mhi_cmd;
>  	for (i = 0; i < NR_OF_CMD_RINGS; i++, mhi_cmd++)
>  		spin_lock_init(&mhi_cmd->lock);
> @@ -977,10 +982,12 @@ int mhi_register_controller(struct mhi_controller *mhi_cntrl,
>  
>  error_alloc_dev:
>  	kfree(mhi_cntrl->mhi_cmd);
> +	destroy_workqueue(mhi_cntrl->hiprio_wq);

So you're destroying the queue two times? You don't need it here.

>  
>  error_alloc_cmd:
>  	vfree(mhi_cntrl->mhi_chan);
>  	kfree(mhi_cntrl->mhi_event);
> +	destroy_workqueue(mhi_cntrl->hiprio_wq);
>  
>  	return ret;
>  }
> diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
> index ce4d969..9d4789d 100644
> --- a/drivers/bus/mhi/core/pm.c
> +++ b/drivers/bus/mhi/core/pm.c
> @@ -597,7 +597,7 @@ int mhi_queue_state_transition(struct mhi_controller *mhi_cntrl,
>  	list_add_tail(&item->node, &mhi_cntrl->transition_list);
>  	spin_unlock_irqrestore(&mhi_cntrl->transition_lock, flags);
>  
> -	schedule_work(&mhi_cntrl->st_worker);
> +	queue_work(mhi_cntrl->hiprio_wq, &mhi_cntrl->st_worker);
>  
>  	return 0;
>  }
> diff --git a/include/linux/mhi.h b/include/linux/mhi.h
> index fb45a0f..7677676 100644
> --- a/include/linux/mhi.h
> +++ b/include/linux/mhi.h
> @@ -338,6 +338,7 @@ struct mhi_controller_config {
>   * @wlock: Lock for protecting device wakeup
>   * @mhi_link_info: Device bandwidth info
>   * @st_worker: State transition worker
> + * @hiprio_wq: High priority workqueue

For what? Please state the purpose.

Thanks,
Mani

>   * @state_event: State change event
>   * @status_cb: CB function to notify power states of the device (required)
>   * @wake_get: CB function to assert device wake (optional)
> @@ -421,6 +422,7 @@ struct mhi_controller {
>  	spinlock_t wlock;
>  	struct mhi_link_info mhi_link_info;
>  	struct work_struct st_worker;
> +	struct workqueue_struct *hiprio_wq;
>  	wait_queue_head_t state_event;
>  
>  	void (*status_cb)(struct mhi_controller *mhi_cntrl,
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
