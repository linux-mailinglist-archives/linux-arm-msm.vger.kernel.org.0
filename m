Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44990333F80
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Mar 2021 14:44:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233005AbhCJNnZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Mar 2021 08:43:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232712AbhCJNnM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Mar 2021 08:43:12 -0500
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3076C061760
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Mar 2021 05:43:11 -0800 (PST)
Received: by mail-pg1-x533.google.com with SMTP id x29so11436535pgk.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Mar 2021 05:43:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=6QbKa5CfjNQBc5FrXPhFzCcSoLKh/vfGVckzjCzVcB4=;
        b=egY8UYuJ73dCVQenkJirSdVtrblugbkYTcJu1ncR5T+RsEr+DVZDGhqEHW9UucCIQ0
         Bno8YLlfcKOZ0p1+mfpkLpKpV8hohLpsjMbyNCF0zRn06st9pwojE6RfWB2OgY0t3cm7
         mRQxpfpUmuhdmFqqe9qK+olv8yLuLPTdkdL301goyEXg5HrjxQEFHzgGs/6uitpl5HK8
         Vj96cQVrx+LH5sngmBslgMjOWT2E5GXxZ7sh5od417wvVQSqTzJjortD8A0xXh++UBzH
         FDUN+aINAcRfg1R6Ef6c1bjicbuU3AmmItLH0hwcjti7IRPCIdeaoAdJdUnYDS1FhWUb
         4MCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6QbKa5CfjNQBc5FrXPhFzCcSoLKh/vfGVckzjCzVcB4=;
        b=n50U+9lL2WidjlLrEcFW7qdiIv3vOHCC2k6Q+QpExEeiL0qBTADyJwjno5FeuftSi9
         +1ok7h84vIqTbjKX15PQzG3Zl0wl4hnGsbEGNMkhzJEUpkZbUDEESYzhhw/MaejoF50A
         mdzIyERd8cdbpxLLcw/86j50iiu3HbL6FlMN84/tKq6zk08O8QVu2Z8984W8AL1IY6yM
         1VwpVxIpS0/sB6ID3yU94jzUjo9iuk0nrwZzEmVBKdfvtYMZiibUMT10z+amlJjxMAO8
         lcSz4rcuHRGK1AtSYGoH5tDDYaWO1Dsn9iPf8mQWjZuLCZDSnkBNSqoM6kPz+mx/Hjhw
         UixQ==
X-Gm-Message-State: AOAM533f6WSJi0GH9JKZ/FFm5sBNBYdPEf0MiZ5yfJZsXUslDI9MsJZt
        G0+AcvsFTT03QKrmCb6rN16N
X-Google-Smtp-Source: ABdhPJzFIIT+ZEylH3YM4w509OWf3OLlaMjhuB47h5yPdazMWz+tPkugTITbwWnBZNdg438R2XOejg==
X-Received: by 2002:a63:1b01:: with SMTP id b1mr2828631pgb.330.1615383791434;
        Wed, 10 Mar 2021 05:43:11 -0800 (PST)
Received: from thinkpad ([103.66.79.59])
        by smtp.gmail.com with ESMTPSA id 82sm16069872pfv.19.2021.03.10.05.43.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Mar 2021 05:43:10 -0800 (PST)
Date:   Wed, 10 Mar 2021 19:13:07 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        bbhatt@codeaurora.org
Subject: Re: [PATCH] mhi: pci_generic: Remove WQ_MEM_RECLAIM flag from state
 workqueue
Message-ID: <20210310134307.GJ30275@thinkpad>
References: <1614161930-8513-1-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1614161930-8513-1-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Feb 24, 2021 at 11:18:50AM +0100, Loic Poulain wrote:
> A recent change created a dedicated workqueue for the state-change work
> with WQ_HIGHPRI (no strong reason for that) and WQ_MEM_RECLAIM flags,
> but the state-change work (mhi_pm_st_worker) does not guarantee forward
> progress under memory pressure, and will even wait on various memory
> allocations when e.g. creating devices, loading firmware, etc... The
> work is then not part of a memory reclaim path...
> 
> Moreover, this causes a warning in check_flush_dependency() since we end
> up in code that flushes a non-reclaim workqueue:
> 
> [   40.969601] workqueue: WQ_MEM_RECLAIM mhi_hiprio_wq:mhi_pm_st_worker [mhi] is flushing !WQ_MEM_RECLAIM events_highpri:flush_backlog
> [   40.969612] WARNING: CPU: 4 PID: 158 at kernel/workqueue.c:2607 check_flush_dependency+0x11c/0x140
> [   40.969733] Call Trace:
> [   40.969740]  __flush_work+0x97/0x1d0
> [   40.969745]  ? wake_up_process+0x15/0x20
> [   40.969749]  ? insert_work+0x70/0x80
> [   40.969750]  ? __queue_work+0x14a/0x3e0
> [   40.969753]  flush_work+0x10/0x20
> [   40.969756]  rollback_registered_many+0x1c9/0x510
> [   40.969759]  unregister_netdevice_queue+0x94/0x120
> [   40.969761]  unregister_netdev+0x1d/0x30
> [   40.969765]  mhi_net_remove+0x1a/0x40 [mhi_net]
> [   40.969770]  mhi_driver_remove+0x124/0x250 [mhi]
> [   40.969776]  device_release_driver_internal+0xf0/0x1d0
> [   40.969778]  device_release_driver+0x12/0x20
> [   40.969782]  bus_remove_device+0xe1/0x150
> [   40.969786]  device_del+0x17b/0x3e0
> [   40.969791]  mhi_destroy_device+0x9a/0x100 [mhi]
> [   40.969796]  ? mhi_unmap_single_use_bb+0x50/0x50 [mhi]
> [   40.969799]  device_for_each_child+0x5e/0xa0
> [   40.969804]  mhi_pm_st_worker+0x921/0xf50 [mhi]
> 
> Fixes: 8f7039787687 ("bus: mhi: core: Move to using high priority workqueue")
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>

Applied to mhi-next!

Thanks,
Mani

> ---
>  drivers/bus/mhi/core/init.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
> index 32eb90f..03ddd6e 100644
> --- a/drivers/bus/mhi/core/init.c
> +++ b/drivers/bus/mhi/core/init.c
> @@ -890,8 +890,7 @@ int mhi_register_controller(struct mhi_controller *mhi_cntrl,
>  	INIT_WORK(&mhi_cntrl->st_worker, mhi_pm_st_worker);
>  	init_waitqueue_head(&mhi_cntrl->state_event);
>  
> -	mhi_cntrl->hiprio_wq = alloc_ordered_workqueue
> -				("mhi_hiprio_wq", WQ_MEM_RECLAIM | WQ_HIGHPRI);
> +	mhi_cntrl->hiprio_wq = alloc_ordered_workqueue("mhi_hiprio_wq", WQ_HIGHPRI);
>  	if (!mhi_cntrl->hiprio_wq) {
>  		dev_err(mhi_cntrl->cntrl_dev, "Failed to allocate workqueue\n");
>  		ret = -ENOMEM;
> -- 
> 2.7.4
> 
