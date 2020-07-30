Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75B4F23375B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jul 2020 19:07:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730205AbgG3RH1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Jul 2020 13:07:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730190AbgG3RH0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Jul 2020 13:07:26 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95B2EC061756
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2020 10:07:26 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id t6so1269757pjr.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2020 10:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=BrrFi53izKwosuWkfkeFHip15csxCCcTUoGMUdNgzIE=;
        b=upLJW/xoau1GH4gHQU9IpMBZeZOp3GkQWfyPRsOVW6ELiK775/dkgcSzKDDsBLUK00
         VZTO5NQc4kOLT+ta1IDw7PBqMLmTMR2tTUfkTyyAavqcvf2GHe4nqloQdoYEjV7eYLmk
         R1xXRoU+zmI65QO0iPp43p88hvcg7lKwbe1Qz3VEMOq+rsjFetVkNnbXXyt6do3+ZcBj
         G4+IYg1SaBnZu6u/NwCorANwQ1++l+/nko7ytjQzwJOxXGYZ9OiLj8Ec1eUiABJvXvOX
         TMeJm7a/jEjaUiSSmAHo+GfToUCssYizLmCNRVkwzZ0wT455H99++JzLQ5dAY2DA21XM
         T9Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BrrFi53izKwosuWkfkeFHip15csxCCcTUoGMUdNgzIE=;
        b=K+1cEjo/cBs1e3NWL2Vwf8zL6rWkcV2Fa3ZxtHJdardaIRzP8AUFWfUbElx5rvD5Lp
         iE7D/iKuUuLVP8OTa/VlXKCoJX9Nz6bz/KeUTquSpXht7CimrT9MC7Y210zf+emTom9t
         xVzgK1dOBEhxm4p3rukQisJPoZLneMc/S62+K3KYXG0xMdFI8K8aEnYLku34qJvOfBpx
         5NnsnAcjsGyW4unA/jMtpKe7uSN/vQI+4rRbpH0m5RgLUD+NgIFXZ/hktGK2JA8Uoqka
         DCvyZlYpkEEqahzn5onQHyqyeEsKB/k3M534fM+ZkTiqxPSZqJe4JjVnpzWPE3PbTeg9
         HJ6g==
X-Gm-Message-State: AOAM533FfUhHTKBabmVSYhYU7GqsCw33nn0Y6pQQMymdjoe/jHhLOytk
        SXRw2SwC7r/zaSF1TzVFBamwVg==
X-Google-Smtp-Source: ABdhPJwvawgZdhNUFWl2ijm5c7x8BwzYl4UjT3262yWGEl9IresjaGvjO+BENkxYlNNrvWq61lPn1Q==
X-Received: by 2002:aa7:9f46:: with SMTP id h6mr4273416pfr.321.1596128846055;
        Thu, 30 Jul 2020 10:07:26 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id 190sm227969pfe.174.2020.07.30.10.07.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2020 10:07:25 -0700 (PDT)
Date:   Thu, 30 Jul 2020 11:07:23 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Siddharth Gupta <sidgup@codeaurora.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, ohad@wizery.com,
        corbet@lwn.net, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, tsoni@codeaurora.org,
        psodagud@codeaurora.org, rishabhb@codeaurora.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 2/2] remoteproc: core: Register the character device
 interface
Message-ID: <20200730170723.GB3155400@xps15>
References: <1596044401-22083-1-git-send-email-sidgup@codeaurora.org>
 <1596044401-22083-3-git-send-email-sidgup@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1596044401-22083-3-git-send-email-sidgup@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jul 29, 2020 at 10:40:01AM -0700, Siddharth Gupta wrote:
> Add the character device during rproc_add. This would create
> a character device node at /dev/remoteproc<index>. Userspace
> applications can interact with the remote processor using this
> interface.
> 
> Signed-off-by: Rishabh Bhatnagar <rishabhb@codeaurora.org>
> Signed-off-by: Siddharth Gupta <sidgup@codeaurora.org>

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

> ---
>  drivers/remoteproc/remoteproc_core.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 277d3bf..7f90eee 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1986,6 +1986,11 @@ int rproc_add(struct rproc *rproc)
>  	/* create debugfs entries */
>  	rproc_create_debug_dir(rproc);
>  
> +	/* add char device for this remoteproc */
> +	ret = rproc_char_device_add(rproc);
> +	if (ret < 0)
> +		return ret;
> +
>  	/*
>  	 * Remind ourselves the remote processor has been attached to rather
>  	 * than booted by the remoteproc core.  This is important because the
> @@ -2262,6 +2267,7 @@ int rproc_del(struct rproc *rproc)
>  	mutex_unlock(&rproc->lock);
>  
>  	rproc_delete_debug_dir(rproc);
> +	rproc_char_device_remove(rproc);
>  
>  	/* the rproc is downref'ed as soon as it's removed from the klist */
>  	mutex_lock(&rproc_list_mutex);
> @@ -2430,6 +2436,7 @@ static int __init remoteproc_init(void)
>  {
>  	rproc_init_sysfs();
>  	rproc_init_debugfs();
> +	rproc_init_cdev();
>  	rproc_init_panic();
>  
>  	return 0;
> -- 
> Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
