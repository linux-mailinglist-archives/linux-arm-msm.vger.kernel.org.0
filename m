Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69DC82DF874
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Dec 2020 05:59:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728372AbgLUE6k (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 20 Dec 2020 23:58:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728128AbgLUE6j (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 20 Dec 2020 23:58:39 -0500
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E878C0613D3
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Dec 2020 20:57:59 -0800 (PST)
Received: by mail-yb1-xb29.google.com with SMTP id x2so7746322ybt.11
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Dec 2020 20:57:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=XBn6ZaN2/e80TT6li1FQJn5DAlS/Vz3aVp5cdanhwx0=;
        b=eD8gurwuCeouZfOp095joie+CkUfk2Qq8jzl/CxCPCYo1FDAsZDtayDjD2XMxGh7pp
         Vx2E+zd5zQHvmskowfnDUMSGluzZ9BYqwwySe7dbVtEgeiBDefleuDiea/TLtIoi0OaB
         Ol1sEMZ4mL4D2varqEMMjBDc1qcPd0u/rw9fFy8IlP7hYUdgTt9HHMaELLE5GxKplYVI
         y4KLvoLPSxuh2xT7I5ixlF1920p28igJ1Z/goiUNto2PzJxck7VTvUwjdK0CLpHinBAH
         FfqPKBbPQvlr+NbhdQRCs0N2Ci97vS8EPx62uXqV+tmtU/V/ayXNTU9cbFpsy8GwrIhC
         R4ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XBn6ZaN2/e80TT6li1FQJn5DAlS/Vz3aVp5cdanhwx0=;
        b=SrQ03SEPpyewleeOCBUsnKtM6mWLSMnS6iCRRpUojtzVy8X3H1pEb/xB0/VObgKmac
         HAGJhd3ZVnJJ3IX3y5wsrhSzJNPsyFsOIM20XeE2AaxtMUjVZJeZ/UkD73Ki1gF3cfG0
         o0t3NrYqX56LNqWSZr8YDFSiMu1vBRbtkYamROnvT7YAz4rY3oS5yhmToK33QBMxYCjh
         0w9CfiBHaU8GvKR9u5fDexQA8xY+A8CJq915HbQucffxcwN0uZCjfGzf7osrODIiQwUu
         HjNVikYFuWnA3ptVI5uBPFqSvBjwA77PEbkC/NCYLSyNLWXrUusJvfAgOUEbtEdAILQT
         Qh+A==
X-Gm-Message-State: AOAM532s+b61+qAtZiuxaquGNNScw/DV9ygxhNFzsMjQdciw4ju1QtKG
        KYiaKVLjY/+QFrG8Gm7IK7msv6a2uScd3A==
X-Google-Smtp-Source: ABdhPJw+J9b0p/Ufag3WxMIn6M+MA093oET0b4OpVhuLP6+98+UVeWLiJmyyucgkbeZWJ/XgVAltTw==
X-Received: by 2002:a05:6830:17c7:: with SMTP id p7mr10742164ota.21.1608522636756;
        Sun, 20 Dec 2020 19:50:36 -0800 (PST)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id i126sm2408687oif.22.2020.12.20.19.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Dec 2020 19:50:35 -0800 (PST)
Date:   Sun, 20 Dec 2020 19:51:20 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Xiaoming Ni <nixiaoming@huawei.com>
Cc:     vkoul@kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        agross@kernel.org, wangle6@huawei.com
Subject: Re: [PATCH] dma/qcom/gpi: Fixes a format mismatch
Message-ID: <X+AbuEhwExGxrkax@ripper>
References: <20201218104137.59200-1-nixiaoming@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201218104137.59200-1-nixiaoming@huawei.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 18 Dec 02:41 PST 2020, Xiaoming Ni wrote:

> drivers/dma/qcom/gpi.c:1419:3: warning: format '%lu' expects argument of
>  type 'long unsigned int', but argument 8 has type 'size_t {aka unsigned
>  int}' [-Wformat=]
> drivers/dma/qcom/gpi.c:1427:31: warning: format '%lu' expects argument of
>  type 'long unsigned int', but argument 3 has type 'size_t {aka unsigned
>  int}' [-Wformat=]
> drivers/dma/qcom/gpi.c:1447:3: warning: format '%llx' expects argument of
>  type 'long long unsigned int', but argument 4 has type 'dma_addr_t {aka
>  unsigned int}' [-Wformat=]
> drivers/dma/qcom/gpi.c:1447:3: warning: format '%llx' expects argument of
>  type 'long long unsigned int', but argument 5 has type 'phys_addr_t {aka
>  unsigned int}' [-Wformat=]
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Xiaoming Ni <nixiaoming@huawei.com>
> ---
>  drivers/dma/qcom/gpi.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
> index d2334f535de2..556c070a514c 100644
> --- a/drivers/dma/qcom/gpi.c
> +++ b/drivers/dma/qcom/gpi.c
> @@ -1416,7 +1416,7 @@ static int gpi_alloc_ring(struct gpi_ring *ring, u32 elements,
>  	len = 1 << bit;
>  	ring->alloc_size = (len + (len - 1));
>  	dev_dbg(gpii->gpi_dev->dev,
> -		"#el:%u el_size:%u len:%u actual_len:%llu alloc_size:%lu\n",
> +		"#el:%u el_size:%u len:%u actual_len:%llu alloc_size:%zu\n",
>  		  elements, el_size, (elements * el_size), len,
>  		  ring->alloc_size);
>  
> @@ -1424,7 +1424,7 @@ static int gpi_alloc_ring(struct gpi_ring *ring, u32 elements,
>  					       ring->alloc_size,
>  					       &ring->dma_handle, GFP_KERNEL);
>  	if (!ring->pre_aligned) {
> -		dev_err(gpii->gpi_dev->dev, "could not alloc size:%lu mem for ring\n",
> +		dev_err(gpii->gpi_dev->dev, "could not alloc size:%zu mem for ring\n",
>  			ring->alloc_size);
>  		return -ENOMEM;
>  	}
> @@ -1444,8 +1444,8 @@ static int gpi_alloc_ring(struct gpi_ring *ring, u32 elements,
>  	smp_wmb();
>  
>  	dev_dbg(gpii->gpi_dev->dev,
> -		"phy_pre:0x%0llx phy_alig:0x%0llx len:%u el_size:%u elements:%u\n",
> -		ring->dma_handle, ring->phys_addr, ring->len,
> +		"phy_pre:%pad phy_alig:%pa len:%u el_size:%u elements:%u\n",
> +		&ring->dma_handle, &ring->phys_addr, ring->len,
>  		ring->el_size, ring->elements);
>  
>  	return 0;
> -- 
> 2.27.0
> 
