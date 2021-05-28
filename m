Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5774D393C01
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 May 2021 05:43:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236003AbhE1DpK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 May 2021 23:45:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229883AbhE1DpJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 May 2021 23:45:09 -0400
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A20BC061574
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 May 2021 20:43:35 -0700 (PDT)
Received: by mail-oi1-x231.google.com with SMTP id x15so2949915oic.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 May 2021 20:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=PkrVdJ/RJ079DbdQjbv4G0ln55eLr+Bw1ygQzJzg1t8=;
        b=FngLEKgaxH/huHl9PkWbmh4N/W582BVkVl/LqHzTyPGSbysn2I9SiXHfrfFeGwgAaN
         SKVuV5loqchkpS2BJCA5myUIXxvXbXIz4UMVw0U9pC1Bs5ST7gDJD6xq8WgUdhQ/97EH
         iQhtdGMtkwWNfPmFc+4+TOVHOtHG1dygpBeeYOVPMN49guJt7uEyvmWYWJvxlg4ap5rs
         oJJiEfGAh40USAsTc0kL6nJxvQv5TeW6pCyjdICFzUSVW1n1YJEYPFkTd1vqoZRuPucu
         YWzKPYOanuBkEHDK/EZ3+c8nEjueLXA4d3fsZFxWh4pZM/UMCAv1nOLhxIxL+zABuuQo
         M5kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=PkrVdJ/RJ079DbdQjbv4G0ln55eLr+Bw1ygQzJzg1t8=;
        b=ZDQ9WTxTvL1Yk3UBG3BH+SQevIbBs4LIoIM8frQj6UzCEu5KCDwW3DiNH+lcX9ZGTA
         ZyLA7/f2SHZ/z2CibOeX6JwR97G+HwwU61WBZdso7AoPOpQ2fiOi/ldbf6Ul3SdpSIN6
         mTYJWYjSDA5z+NS9EdKVoXJJYx6yrM249AlrdY3oD0Nx83owGWmWgYrUVt46aDz9HXvT
         mwf8PMEo8Uzs2adsvt307MVNlSRxkjlYV/dWzAj8z0VnGXFSwGbypLGvgcy/1ooSv0iD
         x7yxZhWcyv4ahZJQMJ6/TzkUpIGMPhD81r2mGbWh32viE8M8tzTjuAjXEGi2qdhbTbqD
         5ouQ==
X-Gm-Message-State: AOAM531HALqdsdSFyva7GmkIcJqyEAkiIgd363ls8afk8g/0UfUxu30T
        LbkgNlbZbqXZSHnoL8HBSGPBqA==
X-Google-Smtp-Source: ABdhPJzJQ/F9P2rDQpOIQZ4BrpRjzeQU7l8TlWMOb1c0njHs+ks9XUerp0awJMe4hJIUnozViN81MQ==
X-Received: by 2002:a54:4011:: with SMTP id x17mr4655166oie.112.1622173414900;
        Thu, 27 May 2021 20:43:34 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id a5sm1017714otb.41.2021.05.27.20.43.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 May 2021 20:43:34 -0700 (PDT)
Date:   Thu, 27 May 2021 22:43:32 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Siddharth Gupta <sidgup@codeaurora.org>
Cc:     ohad@wizery.com, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, psodagud@codeaurora.org,
        stable@vger.kernel.org
Subject: Re: [PATCH 1/3] remoteproc: core: Move cdev add before device add
Message-ID: <YLBm5Bd/iwF7Fi+h@builder.lan>
References: <1621284349-22752-1-git-send-email-sidgup@codeaurora.org>
 <1621284349-22752-2-git-send-email-sidgup@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1621284349-22752-2-git-send-email-sidgup@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 17 May 15:45 CDT 2021, Siddharth Gupta wrote:

> When cdev_add is called after device_add has been called there is no
> way for the userspace to know about the addition of a cdev as cdev_add
> itself doesn't trigger a uevent notification, or for the kernel to
> know about the change to devt. This results in two problems:
>  - mknod is never called for the cdev and hence no cdev appears on
>    devtmpfs.
>  - sysfs links to the new cdev are not established.
> 
> The cdev needs to be added and devt assigned before device_add() is
> called in order for the relevant sysfs and devtmpfs entries to be
> created and the uevent to be properly populated.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Signed-off-by: Siddharth Gupta <sidgup@codeaurora.org>
> ---
>  drivers/remoteproc/remoteproc_core.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 626a6b90f..562355a 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -2316,6 +2316,11 @@ int rproc_add(struct rproc *rproc)
>  	struct device *dev = &rproc->dev;
>  	int ret;
>  
> +	/* add char device for this remoteproc */
> +	ret = rproc_char_device_add(rproc);
> +	if (ret < 0)
> +		return ret;
> +
>  	ret = device_add(dev);
>  	if (ret < 0)
>  		return ret;
> @@ -2329,11 +2334,6 @@ int rproc_add(struct rproc *rproc)
>  	/* create debugfs entries */
>  	rproc_create_debug_dir(rproc);
>  
> -	/* add char device for this remoteproc */
> -	ret = rproc_char_device_add(rproc);
> -	if (ret < 0)
> -		return ret;
> -
>  	/* if rproc is marked always-on, request it to boot */
>  	if (rproc->auto_boot) {
>  		ret = rproc_trigger_auto_boot(rproc);
> -- 
> Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
