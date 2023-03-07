Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C9B9E6AE745
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Mar 2023 17:52:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230487AbjCGQwx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Mar 2023 11:52:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231422AbjCGQwe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Mar 2023 11:52:34 -0500
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50233888AC
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Mar 2023 08:48:28 -0800 (PST)
Received: by mail-pg1-x52d.google.com with SMTP id d10so7960613pgt.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Mar 2023 08:48:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678207701;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FQnICWvYNs7bD2B+ziOmGBVgtAqH+5wOKJPUGlck5eg=;
        b=z2ozD7ZRJgyIlEMW8q3T9LWyeevK9dBUmKibHc/1FJlFiyDrsvLAYj4xkJe3eFp3aY
         PUj/lf0VBUulWKNWcGVh3nWijnzJfDrDv51PSbRfRvAG8EqAu/QetAk3Q91guu85Fnnf
         DYpUtqsfxn2DLqozmhF71gsMFo4ekpt8nzABC3Z74/g7qDlK4H8RYSKVPDBAF2rsbcTR
         KTwW/XPlmZQ2OpW6iE05808tI6+EWazlk1DeIcp7ZpebXLtfat2dtN/oBKw5rR9n0dTw
         hFtlJUkUhislJFikc44YQKXYYGO0qyRKitUOlRGyGw7TYdPOexPHT3QquaiTPW5sH/rx
         bv9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678207701;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FQnICWvYNs7bD2B+ziOmGBVgtAqH+5wOKJPUGlck5eg=;
        b=oWAkbWNp+Wj3w9BvPAjWcsoBsip6WTCFUtZaKv1TmtxNCFHtXRgNcIyJH2GBqmUP8f
         cpyAKuGSydy5LPIpZaCsGjbJtgiZCt3gyiuPXRIT9MuhKiqAVnpsCr0j3vKslznr4Xyx
         UVZED6ZDA5i+d0te1DxVCB0TKQgHY/KUmzRdyVPPRKuXQVym16VfDmNfYqaj6vmsHhjr
         UtaUpRrz50BRYomcP5EZWSA+UJWDbprBLabWoFhgp5Z3Mj8VYG73a24DBSD4vSsEl46Y
         HZyarzYfhpxBN91gZvXVUBL7ybSWZ6Dg/euN9VrMTfCK8/SZcdVggsO6r1i3c8PyXc0u
         nMpA==
X-Gm-Message-State: AO0yUKXLm9RV+LOoAL89MYbywANLe+ovB9XvC2EyW1Db/InPvyfAM1wl
        S6ZsG2z11qIi7khl3ZpjsAGR
X-Google-Smtp-Source: AK7set/xI2XzvtghAIfjdss+dCxdLBLJoPdvd/R/wO5iEqlbPT2FT9l8MyPTUZxYk26HbVjL/HTF7w==
X-Received: by 2002:aa7:9489:0:b0:5a9:d619:e5e4 with SMTP id z9-20020aa79489000000b005a9d619e5e4mr13037993pfk.0.1678207701215;
        Tue, 07 Mar 2023 08:48:21 -0800 (PST)
Received: from thinkpad ([59.97.52.140])
        by smtp.gmail.com with ESMTPSA id d22-20020aa78e56000000b005a8512c9988sm8383488pfr.93.2023.03.07.08.48.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 08:48:20 -0800 (PST)
Date:   Tue, 7 Mar 2023 22:18:16 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: ep: Demote unsupported channel error log to
 debug
Message-ID: <20230307164816.GH5599@thinkpad>
References: <20230307074248.86731-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230307074248.86731-1-manivannan.sadhasivam@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Mar 07, 2023 at 01:12:48PM +0530, Manivannan Sadhasivam wrote:
> Not all MHI endpoints will support all available channels. Most of them
> support only a selected number of channels based on the implementations.
> In those cases, it is not needed to print error messages in the endpoint.
> So let's demote the error log to debug.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Applied to mhi-next!

Thanks,
Mani

> ---
>  drivers/bus/mhi/ep/main.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
> index 48bc6abb7b37..ba062df4fe25 100644
> --- a/drivers/bus/mhi/ep/main.c
> +++ b/drivers/bus/mhi/ep/main.c
> @@ -126,7 +126,7 @@ static int mhi_ep_process_cmd_ring(struct mhi_ep_ring *ring, struct mhi_ring_ele
>  
>  	/* Check if the channel is supported by the controller */
>  	if ((ch_id >= mhi_cntrl->max_chan) || !mhi_cntrl->mhi_chan[ch_id].name) {
> -		dev_err(dev, "Channel (%u) not supported!\n", ch_id);
> +		dev_dbg(dev, "Channel (%u) not supported!\n", ch_id);
>  		return -ENODEV;
>  	}
>  
> @@ -702,7 +702,7 @@ static void mhi_ep_cmd_ring_worker(struct work_struct *work)
>  		el = &ring->ring_cache[ring->rd_offset];
>  
>  		ret = mhi_ep_process_cmd_ring(ring, el);
> -		if (ret)
> +		if (ret && ret != -ENODEV)
>  			dev_err(dev, "Error processing cmd ring element: %zu\n", ring->rd_offset);
>  
>  		mhi_ep_ring_inc_index(ring);
> -- 
> 2.25.1
> 

-- 
மணிவண்ணன் சதாசிவம்
