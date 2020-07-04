Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BFDB214674
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Jul 2020 16:35:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726643AbgGDOfv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 4 Jul 2020 10:35:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726488AbgGDOfv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 4 Jul 2020 10:35:51 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2090DC061794
        for <linux-arm-msm@vger.kernel.org>; Sat,  4 Jul 2020 07:35:51 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id f2so13642328plr.8
        for <linux-arm-msm@vger.kernel.org>; Sat, 04 Jul 2020 07:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ldDzD6j1Ghnm14TJPHt+NFHPYq/kJXWHkRtC3KR9Jqo=;
        b=lWxatR3CydK82tXUBLsIuuBMcL/c3ZNFYVQEczjmDaezp/1m6I/njfL94zsnxIkYiJ
         WwLVgCeRj9qBIgKVAgMJC6TZzNg7eQeG7AMhJSENg992QjpdrXSAB5b0u0Bw/NGryice
         QLSuEiQbbsv6iV3HSAJNAs8Nsr1NhaWvA0pSfjBqjOYENyg9oUnGRrT9jR7JkuMpy/V5
         A9njRJa4IyJ9TV+RcrIURMDfLMC99ZvX1XzxwUPP9oHlmIKR/oZL0zxqeDLrgSbf/0wO
         Gy4SMYWSMNGX55lKdJwvKwFeTA4r8I360YUOXLIWvMJy2E5sPBno3oDNhCysWWcLNqQz
         GzCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ldDzD6j1Ghnm14TJPHt+NFHPYq/kJXWHkRtC3KR9Jqo=;
        b=uMT+WSqWZozrkWLjrrwM5iKHKl+f7l/ftV3f8pb84CeYQH7BMCZhhRhi5DVQARwwwq
         8A+ydHOifvSbTuSILsQ2CPQ5R7Bw4K/R+9M8aNhiDSHqnEtI0zvnvHH1qgG/q2D501H+
         yDEoXRXW58WVbT/GhM/psBbRvih3Y7a0Q+hJcruoVmO8iExsYbX0pB8UXjzRqpH0fFyw
         zxVhppWZXfB9cfiTDgqHvF3VqaJZ8I7o7wF+y0isblZnaT5KviRfrdeOTUjQGgwMcrCe
         LOR7NjCzF9r7ZjoYqq1aDClaObkDk7w7q5IoNX23c7I8ygUBIg71/HJZ3uzBSeeP30VM
         al6g==
X-Gm-Message-State: AOAM532+tj/vXHqMIsO5iN4qfhKOBYf7Q5/1AFLal2vWGZpmoo288zA4
        s6Bk4BOlIUxL4xpzZazCbA3EiWiMbA==
X-Google-Smtp-Source: ABdhPJysN8fh7LoTfPGTTiQj5wIK/aKwxWQ7RwVppIPe90kMuwiMighz1Ms86yre6kmUCvW+mtRF3Q==
X-Received: by 2002:a17:90b:1b06:: with SMTP id nu6mr42982907pjb.106.1593873350593;
        Sat, 04 Jul 2020 07:35:50 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:680:29c6:d74:dc5c:e13f:c458])
        by smtp.gmail.com with ESMTPSA id s22sm14371481pgv.43.2020.07.04.07.35.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 04 Jul 2020 07:35:49 -0700 (PDT)
Date:   Sat, 4 Jul 2020 20:05:44 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/9] bus: mhi: core: Abort suspends due to outgoing
 pending packets
Message-ID: <20200704143544.GB3066@Mani-XPS-13-9360>
References: <1593448782-8385-1-git-send-email-bbhatt@codeaurora.org>
 <1593448782-8385-3-git-send-email-bbhatt@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1593448782-8385-3-git-send-email-bbhatt@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jun 29, 2020 at 09:39:35AM -0700, Bhaumik Bhatt wrote:
> Add the missing check to abort suspends if a client has pending outgoing
> packets to send to the device. This allows better utilization of the MHI
> bus wherein clients on the host are not left waiting for longer suspend
> or resume cycles to finish for data transfers.
> 

Just one nitpick: Please always use the terms 'client drivers' referring to the
MHI client drivers in the kernel and 'client devices' referring to the physical
MHI client devices. The term 'client' creates ambiguity.

> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  drivers/bus/mhi/core/pm.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
> index 7960980..661d704 100644
> --- a/drivers/bus/mhi/core/pm.c
> +++ b/drivers/bus/mhi/core/pm.c
> @@ -686,7 +686,8 @@ int mhi_pm_suspend(struct mhi_controller *mhi_cntrl)
>  		return -EIO;
>  
>  	/* Return busy if there are any pending resources */
> -	if (atomic_read(&mhi_cntrl->dev_wake))
> +	if (atomic_read(&mhi_cntrl->dev_wake) ||
> +	    atomic_read(&mhi_cntrl->pending_pkts))
>  		return -EBUSY;
>  
>  	/* Take MHI out of M2 state */
> @@ -712,7 +713,8 @@ int mhi_pm_suspend(struct mhi_controller *mhi_cntrl)
>  
>  	write_lock_irq(&mhi_cntrl->pm_lock);
>  
> -	if (atomic_read(&mhi_cntrl->dev_wake)) {
> +	if (atomic_read(&mhi_cntrl->dev_wake) ||
> +	    atomic_read(&mhi_cntrl->pending_pkts)) {
>  		write_unlock_irq(&mhi_cntrl->pm_lock);
>  		return -EBUSY;
>  	}
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
