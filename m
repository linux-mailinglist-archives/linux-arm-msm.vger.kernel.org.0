Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 563402B57F9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Nov 2020 04:37:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726754AbgKQDg6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Nov 2020 22:36:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726300AbgKQDg5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Nov 2020 22:36:57 -0500
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C91EC0613D3
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2020 19:36:55 -0800 (PST)
Received: by mail-pg1-x544.google.com with SMTP id f18so15096509pgi.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2020 19:36:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=wP7FCG1Wf0qn1DM+IVox0EpzSIazGVCq2Pj59RjIqV4=;
        b=lz/bZsWDwkxUXSrkhvSsaVR/4m+Z0lHCP/+kRr5uB5pE0BTrWLRlH59S+Y//14SlHR
         F0Itj8TaegxtGVQ4nFccBLEK4Y+ALotHSKuNInN9A4URtXH+bghwxveIFrJeNSCyfdaG
         0NeJLpAo5JrVdbzOvQdeUTMrVARca9KWj7r7cmXCCwfDyoJaKCzurtqmYm9D0xd6cFH4
         1KT7t63hrUuf9GcsM8VWZZlBSXXs2QQeUCdcJxWOgqYb35gPHAbTH3HrFQLdfhX9wanS
         4DWndQYeIJgy3YdFkZXRApHuN+q9dWMFI/Lyiw6phGZQ//blU+02Lo0BbPXVlFhRfRn8
         h5lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=wP7FCG1Wf0qn1DM+IVox0EpzSIazGVCq2Pj59RjIqV4=;
        b=ftxIgFOxlp54/Dzvtl1GtO3e5AET6oDs4oDZao+W91ZSkAYYh1IK7apjrxyFArb1D1
         JrCY9mJRh4gWwd1WTgwYT8RnEWo0GY0AAFW/IH/cVXCMPuwfL1rZmqsJhhgxjRDKlTIw
         0D2U+sgQB8Y1/u2MAX2ljua3Ptf2oVT1Hi0hWw7tH9ppzsDXSeub0ldV6h6MKJUs5zsT
         +h90Z1SpEDOAXJsOasAWg2l8ITSYJbp7fXCsr1F18Zar4y1xLrXBgp7nYkHjb7ThbOiZ
         VyjlnweA7z7i1zVtUzKDzgkrMmpXhdam+Gyj22/EdzbTMU4727eBkMNbXzmn2IRdENkf
         sy3A==
X-Gm-Message-State: AOAM530h0N8BiG0B4iFNEWiQWmUuLo9amayPhjdmVUMpgR/N4OKB7RuA
        tU7CS2vr6Mrz9JuLL3OZKJ5jDAKCwsAX
X-Google-Smtp-Source: ABdhPJwNJazrLPDzWtcde/AiF/+ByrUOQqQipVTVBwThLv3zZBPLZNBzSDNalcitfSeZeTzEAaRZ5A==
X-Received: by 2002:a17:90a:2c46:: with SMTP id p6mr2404774pjm.166.1605584214882;
        Mon, 16 Nov 2020 19:36:54 -0800 (PST)
Received: from work ([103.59.133.81])
        by smtp.gmail.com with ESMTPSA id x4sm2719589pgg.94.2020.11.16.19.36.51
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Nov 2020 19:36:54 -0800 (PST)
Date:   Tue, 17 Nov 2020 09:06:48 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     kvalo@codeaurora.org, linux-arm-msm@vger.kernel.org,
        hemantk@codeaurora.org, jhugo@codeaurora.org,
        linux-kernel@vger.kernel.org, ath11k@lists.infradead.org
Subject: Re: [PATCH] ath11k: use MHI provided APIs to allocate and free MHI
 controller
Message-ID: <20201117033648.GA7787@work>
References: <1605571300-4438-1-git-send-email-bbhatt@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1605571300-4438-1-git-send-email-bbhatt@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

+ath11k list

On Mon, Nov 16, 2020 at 04:01:40PM -0800, Bhaumik Bhatt wrote:
> Use MHI provided APIs to allocate and free MHI controller to
> improve MHI host driver handling. This also fixes a memory leak
> as the MHI controller was allocated but never freed.
> 
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  drivers/net/wireless/ath/ath11k/mhi.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/mhi.c b/drivers/net/wireless/ath/ath11k/mhi.c
> index aded9a7..1c9d9dc 100644
> --- a/drivers/net/wireless/ath/ath11k/mhi.c
> +++ b/drivers/net/wireless/ath/ath11k/mhi.c
> @@ -218,7 +218,7 @@ int ath11k_mhi_register(struct ath11k_pci *ab_pci)
>  	struct mhi_controller *mhi_ctrl;
>  	int ret;
>  
> -	mhi_ctrl = kzalloc(sizeof(*mhi_ctrl), GFP_KERNEL);
> +	mhi_ctrl = mhi_alloc_controller();
>  	if (!mhi_ctrl)
>  		return -ENOMEM;
>  
> @@ -234,7 +234,7 @@ int ath11k_mhi_register(struct ath11k_pci *ab_pci)
>  	ret = ath11k_mhi_get_msi(ab_pci);
>  	if (ret) {
>  		ath11k_err(ab, "failed to get msi for mhi\n");
> -		kfree(mhi_ctrl);
> +		mhi_free_controller(mhi_ctrl);
>  		return ret;
>  	}
>  
> @@ -252,7 +252,7 @@ int ath11k_mhi_register(struct ath11k_pci *ab_pci)
>  	ret = mhi_register_controller(mhi_ctrl, &ath11k_mhi_config);
>  	if (ret) {
>  		ath11k_err(ab, "failed to register to mhi bus, err = %d\n", ret);
> -		kfree(mhi_ctrl);
> +		mhi_free_controller(mhi_ctrl);
>  		return ret;
>  	}
>  
> @@ -265,6 +265,7 @@ void ath11k_mhi_unregister(struct ath11k_pci *ab_pci)
>  
>  	mhi_unregister_controller(mhi_ctrl);
>  	kfree(mhi_ctrl->irq);
> +	mhi_free_controller(mhi_ctrl);
>  }
>  
>  static char *ath11k_mhi_state_to_str(enum ath11k_mhi_state mhi_state)
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
