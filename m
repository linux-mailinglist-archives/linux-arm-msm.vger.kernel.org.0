Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C45A4333F96
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Mar 2021 14:48:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232091AbhCJNsO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Mar 2021 08:48:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232712AbhCJNsN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Mar 2021 08:48:13 -0500
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70237C061760
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Mar 2021 05:48:13 -0800 (PST)
Received: by mail-pf1-x432.google.com with SMTP id y67so12148923pfb.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Mar 2021 05:48:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=PQxFaFRk1j0/L4YFKscUCjlWRlwxndUwdUGemllHofE=;
        b=hQtqDXVrKV07C6X87O561dR8WVJboJLb4UmMKhDiA1k1ScIUzY+mfen3TfJIgzD/f3
         3Hj2JEy0tih9YqqwVLbz3MTGnaC0hYmgWf2GO3GQsPN0Xb5kWlM2RIAlMv3Qze5k3hoN
         BGbjZHSOkuE7VjQkbhoy+m+d/PoFoD4pju09axO/yq+SlGLPZZBAE+H3bTVv1oQ8iq/y
         f4mkta4JwvBoaFZ84QSgAOi8aHh79gnH9NY7pwG5ExtX/XD5xXnY8CN2qgEKttnt0VDP
         katsGNky6EZM3cQrL71Z5KaThwDOFnX7uoVz+3BVymlYnCe4vA2lEnVOPQnXavesa5qQ
         uCHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=PQxFaFRk1j0/L4YFKscUCjlWRlwxndUwdUGemllHofE=;
        b=qORmlg1oYpjbzpz6/DehAKKf+WwZTxlIqvrKJ0PwyabNcHmBRC7dkKbW1lAPjVUxbN
         Il7tvkngp6KJ/3pvPf86MYh/8kHJ2l1E2dftBJhZY4tgCAU2vCX+gsY3HgDzDdbgU0lM
         9oNn9AKSz+K+lQbh7uO/NCbQjaxBzxOo/TTA0EL1UhA/YPzYVNRSnhvxom6MO0cQ0wco
         Sp8B+wZ95dSt9dDxP6/fVtJCWG0CL0T9wzF/J8drQvnCCy5P0g52bFv2HFEtDL55+BA2
         eZNK5CUFFJPOoFeGz1zd/iZcdHeQa68IOEXnVblIXD5lTpouP5N+1fJpoEz3UqKJgW9Y
         z1cw==
X-Gm-Message-State: AOAM531WKJ03Ys7JtBDlDhLjWXjQnxCTGqqeo6Bk2Bwd1A2ntuAL1DOK
        RjLhMDBQU58rGjOtvMpdp6OO
X-Google-Smtp-Source: ABdhPJzv+Dzkej5nxvGdRCMCoC/S3HwWXXruZ7OF0JWyxkXUBcEfjObnQloxWfrdqQskSeqbNEUUxQ==
X-Received: by 2002:a65:5c8d:: with SMTP id a13mr2840233pgt.63.1615384092876;
        Wed, 10 Mar 2021 05:48:12 -0800 (PST)
Received: from thinkpad ([103.66.79.59])
        by smtp.gmail.com with ESMTPSA id y16sm8696743pgl.58.2021.03.10.05.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Mar 2021 05:48:12 -0800 (PST)
Date:   Wed, 10 Mar 2021 19:18:08 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     hemantk@codeaurora.org, jhugo@codeaurora.org,
        bbhatt@codeaurora.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2] mhi: Fix invalid error returning in mhi_queue
Message-ID: <20210310134808.GK30275@thinkpad>
References: <1614336782-5809-1-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1614336782-5809-1-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Feb 26, 2021 at 11:53:02AM +0100, Loic Poulain wrote:
> mhi_queue returns an error when the doorbell is not accessible in
> the current state. This can happen when the device is in non M0
> state, like M3, and needs to be waken-up prior ringing the DB. This
> case is managed earlier by triggering an asynchronous M3 exit via
> controller resume/suspend callbacks, that in turn will cause M0
> transition and DB update.
> 
> So, since it's not an error but just delaying of doorbell update, there
> is no reason to return an error.
> 
> This also fixes a use after free error for skb case, indeed a caller
> queuing skb will try to free the skb if the queueing fails, but in
> that case queueing has been done.
> 
> Fixes: a8f75cb348fd ("mhi: core: Factorize mhi queuing")
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> Reviewed-by: Jeffrey Hugo <jhugo@codeaurora.org>
> Reviewed-by: Bhaumik Bhatt <bbhatt@codeaurora.org>

Applied to mhi-next!

Thanks,
Mani

> ---
>  v2: - Fix/reword commit message
>      - Add Fixes tag
> 
>  drivers/bus/mhi/core/main.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
> index 7fc2482..c780234 100644
> --- a/drivers/bus/mhi/core/main.c
> +++ b/drivers/bus/mhi/core/main.c
> @@ -1031,12 +1031,8 @@ static int mhi_queue(struct mhi_device *mhi_dev, struct mhi_buf_info *buf_info,
>  	if (mhi_chan->dir == DMA_TO_DEVICE)
>  		atomic_inc(&mhi_cntrl->pending_pkts);
>  
> -	if (unlikely(!MHI_DB_ACCESS_VALID(mhi_cntrl))) {
> -		ret = -EIO;
> -		goto exit_unlock;
> -	}
> -
> -	mhi_ring_chan_db(mhi_cntrl, mhi_chan);
> +	if (likely(MHI_DB_ACCESS_VALID(mhi_cntrl)))
> +		mhi_ring_chan_db(mhi_cntrl, mhi_chan);
>  
>  exit_unlock:
>  	read_unlock_irqrestore(&mhi_cntrl->pm_lock, flags);
> -- 
> 2.7.4
> 
