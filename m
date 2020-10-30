Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 770D82A0688
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Oct 2020 14:36:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726259AbgJ3Nfn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Oct 2020 09:35:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726101AbgJ3Nfn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Oct 2020 09:35:43 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7992DC0613D5
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2020 06:35:43 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id t6so2934034plq.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2020 06:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=0xsC2u3VBe/xFD2Ko4VRHk+WyMUCitBIG419P9pQMzI=;
        b=ObyIPxRDRhvsSjXM8pz8yphyT7mluNa36YVmthE0VS+gljtXpZXqKVQ8xI4R9RTCN+
         Hn4klegQI1mXDClorCPv6wSzdOqEfEpAvRSCKjsz2x325CYWIykCaX9RX5HjKBzhcMhQ
         /6sm8A/mwXYOy4ZK9T/wHbTBASKNnNa6Ti5i5naL9wsBt6nzVAMm2yX5tV+bz8GaDgnM
         j4qyxjC9i7eauFkvKfJksRbSHGe9t0F6JMuqkopVUlJq8aAMrMF/Bw3m3qatb13zDIDo
         b+tol0zv4byQEcSNOidpUxDQT6jEdmkbgZdbamuGxqJj823JcHVYnor1+etkWyrzh6EC
         2RlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=0xsC2u3VBe/xFD2Ko4VRHk+WyMUCitBIG419P9pQMzI=;
        b=lW+JSR7E767aik3b3U9/+1pVtKRO3nFIpxzGOwk3+E4g+oezJ1kDMA1WtnsPMbDwUH
         Usrkly72tj1DgCWQpX5Xq2Qn7C84GGUQOQE0xUNbxSKGmuwyW2X74IbZ2Mw6kpiHOCyF
         88hYjzBQ5GSXJV68radoqa2/6iT1gA2rOqJ9KtNN95KC8g5BY98D5uDcuuOAb4XaaMDe
         G4NOj+RW/cGarkFCGhJHMKAixI6GsFNg9A9+rh6oSJVRtYhZ02MaJ4EZQRHupIU9yLXO
         eRBGUrBp3xWGw+usWiOi1WCDl7bv9lvd4XMcl1hqEtjiJ+vHHlSEnWrgKjGk9fNY2r/x
         id7g==
X-Gm-Message-State: AOAM532NV5L6vOPIgcnK107VhVsPkkkakbJAEIiYhC/ey8fMIoOs/WUd
        0bRxi8OZbrJ6fO27BNCe3jwPPI71wtB/
X-Google-Smtp-Source: ABdhPJxZGP6zx7y7rjJCbpOVTu5+SSX7gdS4ZIme9WGK6hv0ISpUdh94Q2m7moiFTqS+EImFSpO1Dw==
X-Received: by 2002:a17:902:db82:b029:d6:3fe4:9825 with SMTP id m2-20020a170902db82b02900d63fe49825mr8849882pld.29.1604064942827;
        Fri, 30 Oct 2020 06:35:42 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:918:28fe:10d5:aaf5:e319:ec72])
        by smtp.gmail.com with ESMTPSA id z30sm6239197pfq.87.2020.10.30.06.35.37
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Oct 2020 06:35:42 -0700 (PDT)
Date:   Fri, 30 Oct 2020 19:05:34 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 02/12] bus: mhi: core: Move to using high priority
 workqueue
Message-ID: <20201030133534.GF3818@Mani-XPS-13-9360>
References: <1604031057-32820-1-git-send-email-bbhatt@codeaurora.org>
 <1604031057-32820-3-git-send-email-bbhatt@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1604031057-32820-3-git-send-email-bbhatt@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Oct 29, 2020 at 09:10:47PM -0700, Bhaumik Bhatt wrote:
> MHI work is currently scheduled on the global/system workqueue and can
> encounter delays on a stressed system. To avoid those unforeseen
> delays which can hamper bootup or shutdown times, use a dedicated high
> priority workqueue instead of the global/system workqueue.
> 
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>

You are not destroying the workqueue in mhi_unregister_controller().
With that fixed,

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  drivers/bus/mhi/core/init.c | 8 ++++++++
>  drivers/bus/mhi/core/pm.c   | 2 +-
>  include/linux/mhi.h         | 2 ++
>  3 files changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
> index 0ffdebd..23b6dd6 100644
> --- a/drivers/bus/mhi/core/init.c
> +++ b/drivers/bus/mhi/core/init.c
> @@ -880,6 +880,13 @@ int mhi_register_controller(struct mhi_controller *mhi_cntrl,
>  	INIT_WORK(&mhi_cntrl->st_worker, mhi_pm_st_worker);
>  	init_waitqueue_head(&mhi_cntrl->state_event);
>  
> +	mhi_cntrl->hiprio_wq = alloc_ordered_workqueue
> +				("mhi_hiprio_wq", WQ_MEM_RECLAIM | WQ_HIGHPRI);
> +	if (!mhi_cntrl->hiprio_wq) {
> +		dev_err(mhi_cntrl->cntrl_dev, "Failed to allocate workqueue\n");
> +		goto error_alloc_cmd;
> +	}
> +
>  	mhi_cmd = mhi_cntrl->mhi_cmd;
>  	for (i = 0; i < NR_OF_CMD_RINGS; i++, mhi_cmd++)
>  		spin_lock_init(&mhi_cmd->lock);
> @@ -969,6 +976,7 @@ int mhi_register_controller(struct mhi_controller *mhi_cntrl,
>  error_alloc_cmd:
>  	vfree(mhi_cntrl->mhi_chan);
>  	kfree(mhi_cntrl->mhi_event);
> +	destroy_workqueue(mhi_cntrl->hiprio_wq);
>  
>  	return ret;
>  }
> diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
> index 3de7b16..805b6fa74 100644
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
> index d4841e5..8961cbc 100644
> --- a/include/linux/mhi.h
> +++ b/include/linux/mhi.h
> @@ -337,6 +337,7 @@ struct mhi_controller_config {
>   * @wlock: Lock for protecting device wakeup
>   * @mhi_link_info: Device bandwidth info
>   * @st_worker: State transition worker
> + * @hiprio_wq: High priority workqueue for MHI work such as state transitions
>   * @state_event: State change event
>   * @status_cb: CB function to notify power states of the device (required)
>   * @wake_get: CB function to assert device wake (optional)
> @@ -419,6 +420,7 @@ struct mhi_controller {
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
