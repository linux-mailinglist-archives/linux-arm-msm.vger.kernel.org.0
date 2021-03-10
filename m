Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71B0A333F74
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Mar 2021 14:42:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232268AbhCJNlR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Mar 2021 08:41:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232814AbhCJNlL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Mar 2021 08:41:11 -0500
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B418FC061760
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Mar 2021 05:41:11 -0800 (PST)
Received: by mail-pf1-x436.google.com with SMTP id t85so6794928pfc.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Mar 2021 05:41:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=UbhhyWoe+kwKLjav6AJDnNFsECfMG7SVHQQPd0gOaTM=;
        b=Ee7ETjgjN1B0jE16ceXAhxdto1+Uz3JvLlhFRR0zQVX7G9YhE6NyHf1eUhAbKdCBOB
         eOuBcgkx37r+raObg9JXAr0wUfwj0toQr/w0zskOSkj8nHR3T5xU+r8ye4TGoUykM6OL
         pZf6iaz8JFfwumgGhxTFD0RxTDTIZrhnVmr8zbtMInsl4Gn7XbIpUYrhctTAqpJfbu5/
         Kiz8pPlwD2OChhBeyofPmzfhKJ9kJK3+jScBfnCtJlBXydO4U/lKnvrTGDamocHHfryz
         UZ7kOCF8C0oirKJIQSoIFCnVinRqRb86/o+MCpKA+R4MjPvB+Qr68llMLdSoLcj+MqY9
         Zw4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=UbhhyWoe+kwKLjav6AJDnNFsECfMG7SVHQQPd0gOaTM=;
        b=eKm4ofTurUZlbPZe/aKX5yxQ/1c1Z3N2F9CsVXdCaiWYU58ANxOe+FO02aELMZxBbr
         6ZnDI6J+hNjL2QOxhxGcbV3wgTRYcb+w0soPdqy/8sf/kBoUQQfm2SL4VthXaidIKuup
         GqYZt89RNBPnHeYjjxcbZOqO0NsW2b/UAJas3/XWspviwImnewy3+msiub2hOiOcRDku
         1NKbfnQueA2DBBOnp4T/SL4zUg/bCCEZND6BFvSn8sW2cAMvfAAcZOsgdtervvUD2miZ
         JkLeL/Wlpf/wC/Nhm5NESNI1cIQ5X7GgXpOgs40abiNt9wDiySg6cZfzzmN6uGkPpUCh
         Ic8Q==
X-Gm-Message-State: AOAM5312KEpe+RnB5zT0yFSlwZq403pB+mMqHIAxOb52gip7i7UIMuBX
        MXTdFANyG/Oe1DrGr/OFr8/C
X-Google-Smtp-Source: ABdhPJxzjuI/v/GYPDoqk70w20NksNHhtzXf7A6rrm81dmrdNpHoSdT30oUYwA8G4ZP5M+zWrvN9lQ==
X-Received: by 2002:a62:88c4:0:b029:1ee:4e39:dccc with SMTP id l187-20020a6288c40000b02901ee4e39dcccmr2898952pfd.59.1615383671200;
        Wed, 10 Mar 2021 05:41:11 -0800 (PST)
Received: from thinkpad ([103.66.79.59])
        by smtp.gmail.com with ESMTPSA id e190sm1605238pfe.3.2021.03.10.05.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Mar 2021 05:41:10 -0800 (PST)
Date:   Wed, 10 Mar 2021 19:11:06 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        bbhatt@codeaurora.org
Subject: Re: [PATCH] mhi: pci_generic: Remove WQ_MEM_RECLAIM flag from state
 workqueue
Message-ID: <20210310134106.GI30275@thinkpad>
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

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

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
