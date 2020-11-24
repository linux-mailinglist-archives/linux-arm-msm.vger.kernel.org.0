Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACE4B2C2CBB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Nov 2020 17:22:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390284AbgKXQWY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Nov 2020 11:22:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387694AbgKXQWY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Nov 2020 11:22:24 -0500
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com [IPv6:2607:f8b0:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1002C0613D6
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2020 08:22:23 -0800 (PST)
Received: by mail-ot1-x341.google.com with SMTP id k3so19855246otp.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2020 08:22:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=yAx0bZUynwPp6ieRFwBxeKJxMhDlw8QUeMjYHWg4GQU=;
        b=s9F3mzNow1EmxBZlldMkYWyr9UjLbpyDCzrSEych7mauy1jw8KniN+3GJUb6ET7ULT
         nZyyf4DwpxVQc5rwbcLYj/Ii5/Km/DPMcTb/njkImGsDDZPpOX1mSM2vpN9YeE/dbLBi
         vnFZ9lP7TKYuKelnmOfxotdTGyjOtE4fPqGuCq8bmlMAi4lrZU/ozSjO5gREOd7AVQJ1
         Tca3033U0LaLHKoOfynk3kmmpymUpBEupJIqNlQiuqG6cYI4atLY+w7h3lF2Y6KkTIjW
         spF53e0p2UBEHHh/Yu9x4anaqC45GChVTdf4zJYbkm7U5OM1libzhMnxOoOnW89Bkuoy
         qkFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=yAx0bZUynwPp6ieRFwBxeKJxMhDlw8QUeMjYHWg4GQU=;
        b=RERdV25QyhDYTaey1VKW8u9zLg+q+UcsesavojlJwwGy8kr+npp9PTzD0EM2y6BrZ3
         GQQSdWCA3c8owyqnLYTb7yNtj1RZs/paUzo1q+QV5hLPXWqwk+k5Nl5pt2MufSyKRNsg
         gr8bCMvp9CN7LEzP8qtx/sMv0py4ncrxHsNIOzq4TU7lJm1uw0mZvvJX8h7dqXnA2hHY
         Rqn1MIuZIq1erbT/aY+6DiFaY6yWZQPhp2CGM3exnpVzxBnkAWdTk3qJLG82Tczge8D9
         FlvgE8RlEjVNQylfWUhmVdudeEOdO7VZgmoV5RkLxvIwPAWkhLQLwJfbUB42w4PZibIf
         DLjw==
X-Gm-Message-State: AOAM53254vd31Rdee4wCbiQq0WnamA1YKeLMEsfnCDiOqJ4SMNHHDRrv
        5zkxtc1i7LNwPoeYmUmqqF4mgg==
X-Google-Smtp-Source: ABdhPJwFSa8qQqQZZjQ4qPOcjBm6mGcsgXICH2unaCUf/0gU4cAxQgWN3P+36aQCMEblPR5qqpBJ6Q==
X-Received: by 2002:a9d:7b48:: with SMTP id f8mr4113940oto.135.1606234943223;
        Tue, 24 Nov 2020 08:22:23 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id c18sm9795000oob.45.2020.11.24.08.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2020 08:22:22 -0800 (PST)
Date:   Tue, 24 Nov 2020 10:22:20 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     ohad@wizery.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        agross@kernel.org, evgreen@chromium.org
Subject: Re: [PATCH 2/2] remoteproc: qcom_q6v5_mss: map/unmap MBA region
 before/after use
Message-ID: <20201124162220.GN9177@builder.lan>
References: <1604473422-29639-1-git-send-email-sibis@codeaurora.org>
 <1604473422-29639-2-git-send-email-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1604473422-29639-2-git-send-email-sibis@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 04 Nov 01:03 CST 2020, Sibi Sankar wrote:

> The application processor accessing the MBA region after assigning it to
> the remote Q6 would lead to an XPU violation. Fix this by un-mapping the
> MBA region post firmware copy and MBA text log dumps.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

I renamed "ptr" to "mba_region" throughout the patch and applied the
pair.

Thanks,
Bjorn

> ---
>  drivers/remoteproc/qcom_q6v5_mss.c | 37 ++++++++++++++++++++++---------------
>  1 file changed, 22 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
> index 2c866b6da23c..1b4a34325788 100644
> --- a/drivers/remoteproc/qcom_q6v5_mss.c
> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
> @@ -189,7 +189,6 @@ struct q6v5 {
>  	size_t total_dump_size;
>  
>  	phys_addr_t mba_phys;
> -	void *mba_region;
>  	size_t mba_size;
>  	size_t dp_size;
>  
> @@ -408,7 +407,7 @@ static int q6v5_xfer_mem_ownership(struct q6v5 *qproc, int *current_perm,
>  				   current_perm, next, perms);
>  }
>  
> -static void q6v5_debug_policy_load(struct q6v5 *qproc)
> +static void q6v5_debug_policy_load(struct q6v5 *qproc, void *ptr)
>  {
>  	const struct firmware *dp_fw;
>  
> @@ -416,7 +415,7 @@ static void q6v5_debug_policy_load(struct q6v5 *qproc)
>  		return;
>  
>  	if (SZ_1M + dp_fw->size <= qproc->mba_size) {
> -		memcpy(qproc->mba_region + SZ_1M, dp_fw->data, dp_fw->size);
> +		memcpy(ptr + SZ_1M, dp_fw->data, dp_fw->size);
>  		qproc->dp_size = dp_fw->size;
>  	}
>  
> @@ -426,6 +425,7 @@ static void q6v5_debug_policy_load(struct q6v5 *qproc)
>  static int q6v5_load(struct rproc *rproc, const struct firmware *fw)
>  {
>  	struct q6v5 *qproc = rproc->priv;
> +	void *ptr;
>  
>  	/* MBA is restricted to a maximum size of 1M */
>  	if (fw->size > qproc->mba_size || fw->size > SZ_1M) {
> @@ -433,8 +433,16 @@ static int q6v5_load(struct rproc *rproc, const struct firmware *fw)
>  		return -EINVAL;
>  	}
>  
> -	memcpy(qproc->mba_region, fw->data, fw->size);
> -	q6v5_debug_policy_load(qproc);
> +	ptr = memremap(qproc->mba_phys, qproc->mba_size, MEMREMAP_WC);
> +	if (!ptr) {
> +		dev_err(qproc->dev, "unable to map memory region: %pa+%zx\n",
> +			&qproc->mba_phys, qproc->mba_size);
> +		return -EBUSY;
> +	}
> +
> +	memcpy(ptr, fw->data, fw->size);
> +	q6v5_debug_policy_load(qproc, ptr);
> +	memunmap(ptr);
>  
>  	return 0;
>  }
> @@ -541,6 +549,7 @@ static void q6v5_dump_mba_logs(struct q6v5 *qproc)
>  {
>  	struct rproc *rproc = qproc->rproc;
>  	void *data;
> +	void *ptr;
>  
>  	if (!qproc->has_mba_logs)
>  		return;
> @@ -549,12 +558,16 @@ static void q6v5_dump_mba_logs(struct q6v5 *qproc)
>  				    qproc->mba_size))
>  		return;
>  
> -	data = vmalloc(MBA_LOG_SIZE);
> -	if (!data)
> +	ptr = memremap(qproc->mba_phys, qproc->mba_size, MEMREMAP_WC);
> +	if (!ptr)
>  		return;
>  
> -	memcpy(data, qproc->mba_region, MBA_LOG_SIZE);
> -	dev_coredumpv(&rproc->dev, data, MBA_LOG_SIZE, GFP_KERNEL);
> +	data = vmalloc(MBA_LOG_SIZE);
> +	if (data) {
> +		memcpy(data, ptr, MBA_LOG_SIZE);
> +		dev_coredumpv(&rproc->dev, data, MBA_LOG_SIZE, GFP_KERNEL);
> +	}
> +	memunmap(ptr);
>  }
>  
>  static int q6v5proc_reset(struct q6v5 *qproc)
> @@ -1605,12 +1618,6 @@ static int q6v5_alloc_memory_region(struct q6v5 *qproc)
>  
>  	qproc->mba_phys = r.start;
>  	qproc->mba_size = resource_size(&r);
> -	qproc->mba_region = devm_ioremap_wc(qproc->dev, qproc->mba_phys, qproc->mba_size);
> -	if (!qproc->mba_region) {
> -		dev_err(qproc->dev, "unable to map memory region: %pa+%zx\n",
> -			&r.start, qproc->mba_size);
> -		return -EBUSY;
> -	}
>  
>  	if (!child) {
>  		node = of_parse_phandle(qproc->dev->of_node,
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
