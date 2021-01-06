Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB5ED2EBE5A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Jan 2021 14:16:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726572AbhAFNMc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Jan 2021 08:12:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726503AbhAFNMb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Jan 2021 08:12:31 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72EDCC06134C
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Jan 2021 05:11:51 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id hk16so1559171pjb.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Jan 2021 05:11:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=kJC3VjuBaPsO/ZoO+fTkvLRc8VsVOuvCeNlRPyiHess=;
        b=YPixwzX7MH5XFVPxWq8qx2RK9yx+rNotua9Fyzi4s0iiGseP6S/Q+Yojujgiw9mOdz
         PStVZmXr1+Ho21V+SThLsajD4okt5huKNdg8hUVrMVkgISWdV4JfudGnmOP+I2TH+57Y
         Mj9fN8aNKaojfH+cteBnTGAl0YmcijZcPjpvoGHp/0bTGGnJb0KR7ZbdubHBN2GPdLDG
         G3jxchIiqRP89n1k76Zq975LMpaJFgbiUbVM717/i/5RN2DAx5ESjNiSmtjuaYR7/Yca
         NydUoVWsZiE+s4tloyY6D9VMdm1VL5YZhECKlghoAbOvXk0kFMYcLejbAKwWpAbYE7qH
         5jmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kJC3VjuBaPsO/ZoO+fTkvLRc8VsVOuvCeNlRPyiHess=;
        b=IBWykv6POKLs8R1BEoJwaw5IHqwOK+XSmpfuhtfrA8sBgbaSmEVvEFKtSshiBTfhaT
         Zgvg4WAyJjEalS0t00IofmH/w5ZzStlyNCSXhPJDm5WZJAUywqG3OhYJBmwTja7lf9Bn
         UAKygBxm8iJcZHATz/+nBaKGeDQXU/j76yMPzcX3kbXKcIjNQxOkV2HUVpNR1z7oRzE2
         nY5VpV+nXjnLC8oyeyuuijUmh2FIG6yzwQ3uWkCyQqo70WJbPUByt0szkz3fn+Sc/Eau
         HjRvFWRbbFGEAjVhiEWGkxa0eZ0Nd7RhqLL40iOdNaXg8ygQJ8Cv4tIP1Ui7FR9j/Cub
         ty5A==
X-Gm-Message-State: AOAM531qQdDhKDKdnCEa8Xf6/xvDYi/QU0RIwFoUxAf6L9dhjQOTCDmN
        K3+sEiWqlZhzOmuSMQGP92Ua
X-Google-Smtp-Source: ABdhPJxMUTjR+MquwKZXQIJnaOOgyREIkRrwDYlGDt5Nzj8qotpl2+vrKyxym0Egb5uAAqetp/61tw==
X-Received: by 2002:a17:902:fe87:b029:da:5d3b:4a84 with SMTP id x7-20020a170902fe87b02900da5d3b4a84mr4231532plm.51.1609938710984;
        Wed, 06 Jan 2021 05:11:50 -0800 (PST)
Received: from thinkpad ([2409:4072:6102:e7a2:51f0:bf72:bf80:ec88])
        by smtp.gmail.com with ESMTPSA id x21sm3030950pgi.75.2021.01.06.05.11.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jan 2021 05:11:50 -0800 (PST)
Date:   Wed, 6 Jan 2021 18:41:45 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        jhugo@codeaurora.org
Subject: Re: [PATCH v2] bus: mhi: Ensure correct ring update ordering with
 memory barrier
Message-ID: <20210106131145.GF3131@thinkpad>
References: <1606403201-5656-1-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1606403201-5656-1-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Nov 26, 2020 at 04:06:41PM +0100, Loic Poulain wrote:
> The ring element data, though being part of coherent memory, still need
> to be performed before updating the ring context to point to this new
> element. That can be guaranteed with a memory barrier (dma_wmb).
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>

Applied to mhi-next!

Thanks,
Mani

> ---
>  v2: fix comment style
> 
>  drivers/bus/mhi/core/main.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
> index 67188ea..ea39df0 100644
> --- a/drivers/bus/mhi/core/main.c
> +++ b/drivers/bus/mhi/core/main.c
> @@ -111,7 +111,14 @@ void mhi_ring_chan_db(struct mhi_controller *mhi_cntrl,
>  	dma_addr_t db;
>  
>  	db = ring->iommu_base + (ring->wp - ring->base);
> +
> +	/*
> +	 * Writes to the new ring element must be visible to the hardware
> +	 * before letting h/w know there is new element to fetch.
> +	 */
> +	dma_wmb();
>  	*ring->ctxt_wp = db;
> +
>  	mhi_chan->db_cfg.process_db(mhi_cntrl, &mhi_chan->db_cfg,
>  				    ring->db_addr, db);
>  }
> -- 
> 2.7.4
> 
