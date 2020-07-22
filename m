Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BCF5228ED1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jul 2020 05:56:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731980AbgGVD4X (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Jul 2020 23:56:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731856AbgGVD4W (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Jul 2020 23:56:22 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2434CC061794
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2020 20:56:22 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id g67so486061pgc.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2020 20:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=eocmnDIsQLfevW1nQrEzuqjG8rUX3ygxa1czr+P2gmM=;
        b=TI6grtPKFFAbd5jxTwUjjnzEFinPbwpMNEo11SKc2mYL6DD7emvsK1cLuMTc8516xv
         Ne1q/n2DwtDGb9PQrePzYtMrzeldMxy7T8Mnq2o2s7/YUhEKn5FNwNo8Q7/p6wzyFyy1
         eCDzDFcZe1tGeMY9FQT9Yu/PwG2w0p+KtUYQyOjGiKmeoE13kgZnLpnARa8wefs9qC4j
         LbGN8tQN/0wwo+NrlxEzflKqwwO+oklwCQ6tXBB3vvCIfpjG1Qi0jPkQxppiyOLy/sXy
         BFUN5FuUFf7P3DcLvPNxa7GyfC8a1WCC1iOda2F32hdJ3nOrI/S12pcYWhuBHPhWJtSF
         NTJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=eocmnDIsQLfevW1nQrEzuqjG8rUX3ygxa1czr+P2gmM=;
        b=sGOj6/8fVjm/UdiukH6thloMFm1mSdk+DwIDM/bZHyD2jUNWGJTLTcC30IaBxUr5Qa
         XlQ472j5RPGhWnX1B9a+BdgfrayPOCjk6ucZxIsSKgtYCl2UWyY9fOGRm1dwVX4QRvyr
         GcOGDQe/u+EBuxVH4URnJunv0gqzt8odmvqSmUEcWRO78iPvsn6oehACnWddXU6c5kW1
         CRJFTtLudeLzYsGKqxET4M7sGQYP2RdtWPlmdAOFPXXpHnl04JxKgHmuSdvYDhN6QUyq
         KKQkIxNmooHebQY1aHoaQ2ufcYLPPgWMSlCcYW1ds8UYzdJ3qhMGq7MMZZh6PJlTwNgR
         RWRQ==
X-Gm-Message-State: AOAM533/K6uJP8MvrcWiIzbL8GGkKGzBFF60VXsBDVGVUL0nAWxlxOVA
        VvjUREfDHKHew3fN0SraS/GERw==
X-Google-Smtp-Source: ABdhPJwejzId9c6+xg8NWwUEGs51S8vMOaY1Z1gQDLh5jElHYxI3WwTJQ6RdiKmoi6Cph1s04ez8sg==
X-Received: by 2002:a05:6a00:5c:: with SMTP id i28mr27768787pfk.274.1595390181536;
        Tue, 21 Jul 2020 20:56:21 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id r6sm19592723pgn.65.2020.07.21.20.56.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2020 20:56:20 -0700 (PDT)
Date:   Tue, 21 Jul 2020 20:54:27 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     agross@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        evgreen@chromium.org, ohad@wizery.com
Subject: Re: [PATCH v2 1/2] remoteproc: qcom_q6v5_mss: Add modem debug policy
 support
Message-ID: <20200722035427.GQ388985@builder.lan>
References: <20200721112935.25716-1-sibis@codeaurora.org>
 <20200721112935.25716-2-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200721112935.25716-2-sibis@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 21 Jul 04:29 PDT 2020, Sibi Sankar wrote:

> Add modem debug policy support which will enable coredumps and live
> debug support when the msadp firmware is present on secure devices.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
> 
> v2:
>  * Use request_firmware_direct [Bjorn]
>  * Use Bjorn's template to show if debug policy is present
>  * Add size check to prevent memcpy out of bounds [Bjorn]
> 
>  drivers/remoteproc/qcom_q6v5_mss.c | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
> index 0b6f260eb5349..49cd16e050533 100644
> --- a/drivers/remoteproc/qcom_q6v5_mss.c
> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
> @@ -189,6 +189,7 @@ struct q6v5 {
>  	phys_addr_t mba_phys;
>  	void *mba_region;
>  	size_t mba_size;
> +	size_t dp_size;
>  
>  	phys_addr_t mpss_phys;
>  	phys_addr_t mpss_reloc;
> @@ -408,6 +409,14 @@ static int q6v5_xfer_mem_ownership(struct q6v5 *qproc, int *current_perm,
>  static int q6v5_load(struct rproc *rproc, const struct firmware *fw)
>  {
>  	struct q6v5 *qproc = rproc->priv;
> +	const struct firmware *dp_fw;
> +
> +	if (!request_firmware_direct(&dp_fw, "msadp", qproc->dev) && fw->size <= SZ_1M &&
> +	    (SZ_1M + dp_fw->size) <= qproc->mba_size) {
> +		memcpy(qproc->mba_region + SZ_1M, dp_fw->data, dp_fw->size);
> +		qproc->dp_size = dp_fw->size;
> +		release_firmware(dp_fw);

If request_firmware_direct() succeeds, but return a firmware blob bigger
than mba_size - SZ_1M you won't get here and will end up leaking dp_fw.

Additionally, there really isn't a need for requesting the firmware in
the first place if fw->size > SZ_1M.

So I think it's better if you break this out in it's own function where
you don't need to squeeze everything into one or two conditionals.

Regards,
Bjorn

> +	}
>  
>  	memcpy(qproc->mba_region, fw->data, fw->size);
>  
> @@ -896,6 +905,10 @@ static int q6v5_mba_load(struct q6v5 *qproc)
>  	}
>  
>  	writel(qproc->mba_phys, qproc->rmb_base + RMB_MBA_IMAGE_REG);
> +	if (qproc->dp_size) {
> +		writel(qproc->mba_phys + SZ_1M, qproc->rmb_base + RMB_PMI_CODE_START_REG);
> +		writel(qproc->dp_size, qproc->rmb_base + RMB_PMI_CODE_LENGTH_REG);
> +	}
>  
>  	ret = q6v5proc_reset(qproc);
>  	if (ret)
> @@ -1257,7 +1270,8 @@ static int q6v5_start(struct rproc *rproc)
>  	if (ret)
>  		return ret;
>  
> -	dev_info(qproc->dev, "MBA booted, loading mpss\n");
> +	dev_info(qproc->dev, "MBA booted with%s debug policy, loading mpss\n",
> +		 qproc->dp_size ? "" : "out");
>  
>  	ret = q6v5_mpss_load(qproc);
>  	if (ret)
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
