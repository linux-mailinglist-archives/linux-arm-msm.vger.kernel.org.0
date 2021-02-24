Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63C3A323A7A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Feb 2021 11:26:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232475AbhBXK0I (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Feb 2021 05:26:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232560AbhBXK0B (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Feb 2021 05:26:01 -0500
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD8EFC061574
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Feb 2021 02:25:20 -0800 (PST)
Received: by mail-pg1-x535.google.com with SMTP id o38so1147629pgm.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Feb 2021 02:25:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=6zEjknucr9elP+ydtyngud8wtITgLH3Mt7MahX/VoD4=;
        b=C4mWvnUDAckqeOK9M/vqYnzAK3BXpw35g0You47lsCmvbU02kbv0uYL5hUp3L4W08S
         LbZwMW9TofNYCljuqdJxmzS2gs1wuCJGhMBAKytbEdTSNRj+GfaBD2Li/kc/8OanRU+B
         iBfIhN4J54kq8PbVRWUgtnNvMAKDBN7Vtdu4MejJo1J2TDJTTdfkAWj5YL2fPdPpV35g
         UtADqRIBZUt8z4fXkrtFC8dX+eX/uj+YDrsv8PfE4j5IOOvd2Hb69bIgcPB1hl/jtRtE
         snnx7M+7DeBCzVUc4yZUOAN+XWXH08DOMCtaSgcQCJ5pXrVQGL7s6FjVvakErgH7/KhQ
         xrFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=6zEjknucr9elP+ydtyngud8wtITgLH3Mt7MahX/VoD4=;
        b=Bshl6ql4RpLns2wotnbRR/nzj7LpiRTxvjRE8tH/Yv3EvJ9NVaGz8oCCP2CWdEAQLU
         2raS3stYIysh+NnjFUEMxQAVQQQEpkLHN/1U+q4lPU/GRwOTshq/DIDxjMNf92KE3ByG
         oO3rytAJvKgJHgsYRdt7RcnGLK40Fcz4wzok91I0wV5EwwyfgpUSL9Y8MbjAV34bsDKz
         F1dEPmSfpqcklm/HxGdehViiO6VqtH/C6AizXxDYdrm5SCqtESSkWCNSxK4lO9I1vTXv
         FyF8nzNSpmjgt9rVo2JTJiU9+Cc1GJV30vSWgUCgUDgsLGKSOWatlp0fp8kLjxNdOHV2
         vnig==
X-Gm-Message-State: AOAM533USVnNHi+EN7oS6YRlVT2/6IjZ//VcH1PuYe+EEd1F/28c2ui2
        q2+zO/X5D7a2myeQfD5b/s2947RbG2Vu
X-Google-Smtp-Source: ABdhPJxuT8sC2csKNnK+T1lYLoJDrlE1cW26Nw9gepYWBGzI0vLBtpBLp9XS/1WI1UzI4ELZdq24ng==
X-Received: by 2002:a63:4761:: with SMTP id w33mr28504189pgk.118.1614162320324;
        Wed, 24 Feb 2021 02:25:20 -0800 (PST)
Received: from work ([103.66.79.25])
        by smtp.gmail.com with ESMTPSA id c29sm1952617pgb.58.2021.02.24.02.25.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Feb 2021 02:25:19 -0800 (PST)
Date:   Wed, 24 Feb 2021 15:55:16 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        bbhatt@codeaurora.org
Subject: Re: [PATCH] mhi: pci_generic: Remove WQ_MEM_RECLAIM flag from state
 workqueue
Message-ID: <20210224102516.GW27945@work>
References: <1614161930-8513-1-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1614161930-8513-1-git-send-email-loic.poulain@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
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

Fix looks good to me but I want Bhaumik to share his review since he
authored the offending patch.

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
