Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43F512C73B9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Nov 2020 23:15:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727653AbgK1Vty (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 28 Nov 2020 16:49:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731716AbgK1SzN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 28 Nov 2020 13:55:13 -0500
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9645BC061A55
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2020 22:03:39 -0800 (PST)
Received: by mail-pg1-x543.google.com with SMTP id w4so5898143pgg.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2020 22:03:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=k1LaUBvi1Ru4cGhN1CnSpPkyWOqHKwTmXVWJIEkDWK0=;
        b=ivQqE35ny759Sl5fBqEZBU69yulG/qefaDBg2osZOCRHdNz17/LawDm3gWBP8igwkO
         op8mAMXEJgHHIa1ORgpn5zjpOgvP3CczcC2bZ46VcqrTEndrvWKs5nBlvwnRH/a3pGtT
         UlCw7D5T7t2/GDWEuKYnm0L+mhMNIACnFH7sn0r86ywav4lGOKcwPIhmfj8C5pe1w7T1
         Y+e8ENIYvLDO/cYqbdUIe7lYDcQQp7/VhNdwRexryRGyEXRTqFgP/pMfR0nDU9YBD+RN
         UmC69AGSR4h6gQuA0NcQPNrMEdZjaTgNCAQo+6HOyw/PXP1KNKq7e/xFsqq20X9XQbRf
         yJ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=k1LaUBvi1Ru4cGhN1CnSpPkyWOqHKwTmXVWJIEkDWK0=;
        b=IBUxtUKAAz0QQbgMzN6d76mzZZ0s0MNMZSNS02srgQr4wNmxzlI0Z7zz8jSQnW+jYl
         +Z5M3HTiYsD0XkDm37ndWKAnIxOwZPmZePB+wVdOlXrfcTjtv7qhtZs+Bjj24/vWXA71
         zd9ZxmiOyoiW+JPShzX3gyEJYJPxW2SRp6WaJOgIE6eYL8uUuY6FiJFnGB59Fr+5aXPF
         BFSgBQqffqHD4R3mrsmRxvjuKbaKfKbjfHloyMFByvya/DvMUdJql0uFNZKDVz48G6h4
         u9Ogqgi8PSMc+DKZ2lfuGYKtkeH6xXY4qwtyVFTnkyM2vLuHd62/fy1zFSENCPAjA7xZ
         4DbA==
X-Gm-Message-State: AOAM531Ly5QbzJwawO9RqhNzu5k8VIhUiZLcPadwi3e96zt+IKrIybPP
        W/EiLUjWANvtmjrihZEOnrkr
X-Google-Smtp-Source: ABdhPJwTnt2aJ1IfwiwcR352OGKBZ4KO/rt9JPwLh7Nom0k3nhf69Y5OKnFhplW3QCh5b2dqgigASg==
X-Received: by 2002:a63:df05:: with SMTP id u5mr1616761pgg.73.1606543419063;
        Fri, 27 Nov 2020 22:03:39 -0800 (PST)
Received: from thinkpad ([2409:4072:15:c612:48ab:f1cc:6b16:2820])
        by smtp.gmail.com with ESMTPSA id d25sm9343156pfo.172.2020.11.27.22.03.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2020 22:03:38 -0800 (PST)
Date:   Sat, 28 Nov 2020 11:33:31 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        jhugo@codeaurora.org
Subject: Re: [PATCH v2] bus: mhi: Ensure correct ring update ordering with
 memory barrier
Message-ID: <20201128060331.GH3077@thinkpad>
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

As Jeff pointed out, the barrier should come after updating ctxt_wp.

Thanks,
Mani

> +
>  	mhi_chan->db_cfg.process_db(mhi_cntrl, &mhi_chan->db_cfg,
>  				    ring->db_addr, db);
>  }
> -- 
> 2.7.4
> 
