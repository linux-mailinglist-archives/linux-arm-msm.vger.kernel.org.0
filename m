Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C13342EBE44
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Jan 2021 14:11:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726437AbhAFNKc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Jan 2021 08:10:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726074AbhAFNKb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Jan 2021 08:10:31 -0500
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0F8AC06134C
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Jan 2021 05:09:50 -0800 (PST)
Received: by mail-pl1-x634.google.com with SMTP id be12so1527193plb.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Jan 2021 05:09:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=9U2MqZTTezCg/BGUjilpsvMwu8AMHP3ogGjTb4sl0DY=;
        b=TZ9k2UeOww3RBNN/ahObJQdCarFRLLU83XEKi1PXXWzNsJ6e3OvgG628hyuKNTDVuV
         1EWiaKZgeFnljfAkQtPWQHDBjZL+TGT4Q7y4CJX6zKbDoO/RZqGpR+VSiEgMz0a7twa3
         imwonbxFH3zV007ekLk3OS8NiYywq/G7YeAIp91UsOyUFCXdO+9rnco2OcUz2u4K6Hoi
         45T1aZM2Kln37rnKMgq2+Hvigzc8bsS9mmdcUSivUcZ61OjD3XmpDtNHomofd5FhpgO5
         Cvn8WrlY8DrAu+y7ct2hc1eGx3SUWz20lg2XFz5ssj+l01Rtn6sf2l+Wo4kIeUS4ufNt
         FbtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9U2MqZTTezCg/BGUjilpsvMwu8AMHP3ogGjTb4sl0DY=;
        b=k0VVQcS/MhMMKU1jIHrpTVhsw9XKkxk+R6Oyx7foQw23CB5fc1e/1cR10i2v+k8Jyu
         JhWo6B4wp5HGRtRF1zyvRosR/9LrpcAFKm5sSODpdxVrKJ3XVbBHQp0CYQ6ydihhekxz
         7HY4l5t99lu5gzGxItJZLsJbmVJxesYnsPpxb4HXVPprU7uvjxK8FhQYR3Y1HQqiv50o
         kmqZpp8273+otCYmzv48dUJgn19FseLEUZ5EAwqrCwQWx7NwfIOjiyD3V+DHtE2yRC9x
         zstJN6XJOjusuXAL4Mq+Q9W230k0hOaw2HYuf8KO9jQPBiYX8auoZlvTr/g2dPNB19+z
         0i/w==
X-Gm-Message-State: AOAM532DYTfBSNJOnOOzqKU7P6zlfI4i1AxY1KJ7O4leRpP7UJwK5aer
        pl2sKT33fmys3quLrW5lgUnBxZXnUeU+
X-Google-Smtp-Source: ABdhPJxiijwGsatK28/fwHFftQz1xuuzanF+lncCzIgrMCKooPZ3Jk6UXUFYkbKJleR7T2lKEWSCDQ==
X-Received: by 2002:a17:90a:7844:: with SMTP id y4mr4291372pjl.68.1609938590169;
        Wed, 06 Jan 2021 05:09:50 -0800 (PST)
Received: from thinkpad ([2409:4072:6102:e7a2:51f0:bf72:bf80:ec88])
        by smtp.gmail.com with ESMTPSA id s7sm2386957pfh.207.2021.01.06.05.09.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jan 2021 05:09:49 -0800 (PST)
Date:   Wed, 6 Jan 2021 18:39:43 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        jhugo@codeaurora.org
Subject: Re: [PATCH v2] bus: mhi: Ensure correct ring update ordering with
 memory barrier
Message-ID: <20210106130943.GE3131@thinkpad>
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

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

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
