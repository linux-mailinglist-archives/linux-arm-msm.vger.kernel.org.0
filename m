Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4DC041C650
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Sep 2021 16:08:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245327AbhI2OIg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Sep 2021 10:08:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245320AbhI2OIg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Sep 2021 10:08:36 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4850C061755
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Sep 2021 07:06:54 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id d21so4453812wra.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Sep 2021 07:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Y6+n/lfUtQNb7qxNMbhrqZCy8qyW6fqKAhHV8iGHZZw=;
        b=OpgiANXU/3/OXbhNvpqGUYIYouWlMby/zTNMCF2wTpynbEhuPAWXqJU+9rFbMPQwGX
         +uOU9RpJIeaK9fvSX2b8G4rmKoiFXSKcluWheBDI8XxLR4AY8tPK/KmC/iXHrsrxiRCG
         78izZDqid6oPJYcohhhos73DelLYQytGqDnMxM69ynlZT9893A+eTO/YMwkTuMXaIgTN
         49NcfDx3e6EbXK0PAuKaMUIAqvr11GrqYfo4F1P7cRGTQgaX+I+nw4fTcEPSdvzwsLyZ
         NM1RZNZQ8ZzYa6S7XXF17FIeNVL7EGQ/Rj3yDwV0/5/ttbollTAm/8l5dNQL6iC5aRWz
         ruAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Y6+n/lfUtQNb7qxNMbhrqZCy8qyW6fqKAhHV8iGHZZw=;
        b=vUR584AxBAT/P5CLOG/ps2K2DIQMh7YkeRrkQCr6sfWGTvwBvETRJTl59Z/zJmnlWl
         ZQcc+NuIzkpTaayjUqgGyQMCjCWN2BxTE2OSsAZsLTvtLIxVS838/UJcR5d7FC8k031S
         qiyYtOqXgEmLfDPTtwcR5NgjCOo8afN7D576awKL4qPVjoD+mgD0EDGq2iQqKI7N24Pt
         sNE+NMZakcPaZ6Iv+iHNHvvzX5iqnPWxgXx3PX/nNN8bcF4zlyWmtK966DP4sQYDqmtS
         QL/t1uQMV/pgHGREvPSRN3puVsmKKlIGcTYWOPQ9eIjOILopjoI7nZOQfleziJUy64dN
         3eQQ==
X-Gm-Message-State: AOAM532ogUFip8gDNd+WcX2ONahsBQ1mYyA4iwUwTyA9fSICrlyEeH5/
        bmFOiWrkgkfgNE7Hii1c7B6qQ5qmZ4aDxw==
X-Google-Smtp-Source: ABdhPJw7uMuWmXWipWiaSYcEcuhzStS1VdNvTM+olCSxaIizkILUY8tnuAWaQQDGXSlXyAvJp1Pr1w==
X-Received: by 2002:a05:6000:160c:: with SMTP id u12mr26941wrb.100.1632924413393;
        Wed, 29 Sep 2021 07:06:53 -0700 (PDT)
Received: from [192.168.86.34] (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.googlemail.com with ESMTPSA id o13sm1963wri.53.2021.09.29.07.06.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Sep 2021 07:06:52 -0700 (PDT)
Subject: Re: [PATCH 4/4] misc: fastrpc: reject non-secure node for secure
 domain
To:     Jeya R <jeyr@codeaurora.org>, linux-arm-msm@vger.kernel.org
Cc:     gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
        fastrpc.upstream@qti.qualcomm.com
References: <1632485951-13473-1-git-send-email-jeyr@codeaurora.org>
 <1632485951-13473-5-git-send-email-jeyr@codeaurora.org>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <474a9c53-5623-0d7d-d996-aab22af9b627@linaro.org>
Date:   Wed, 29 Sep 2021 15:06:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1632485951-13473-5-git-send-email-jeyr@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 24/09/2021 13:19, Jeya R wrote:
> Reject session if domain is secure and device non-secure. Also check if
> opened device node is proper.
> 
> Signed-off-by: Jeya R <jeyr@codeaurora.org>
> ---
>   drivers/misc/fastrpc.c | 24 ++++++++++++++++++++++++
>   1 file changed, 24 insertions(+)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 631713d..adf2700 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -235,6 +235,7 @@ struct fastrpc_user {
>   	spinlock_t lock;
>   	/* lock for allocations */
>   	struct mutex mutex;
> +	int dev_minor;
>   };
>   
>   static void fastrpc_free_map(struct kref *ref)
> @@ -1013,6 +1014,17 @@ static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
>   	return err;
>   }
>   
> +static int is_session_rejected(struct fastrpc_user *fl)
> +{
> +	/* Check if the device node is non-secure and channel is secure*/
> +	if ((fl->dev_minor == fl->cctx->miscdev.minor) && fl->cctx->secure) {
> +		dev_err(&fl->cctx->rpdev->dev, "Cannot use non-secure device"
> +				"node on secure channel\n");

Am bit confused here,

so we create 2 device nodes /dev/fastrpc-adsp, /dev/fastrpc-adsp-secure
and mark any domain other than cdsp as secure
then here we check if access is via /dev/fastrpc-adsp then reject it.

But question is why did we even create /dev/fastrpc-adsp in first place?

Can you explain how is this secure and non secure nodes supposed to work?

> +		return -EACCES;
> +	}
> +	return 0;
> +}
> +
>   static int fastrpc_init_create_process(struct fastrpc_user *fl,
>   					char __user *argp)
>   {
> @@ -1033,6 +1045,10 @@ static int fastrpc_init_create_process(struct fastrpc_user *fl,
>   	} inbuf;
>   	u32 sc;
>   
> +	err = is_session_rejected(fl);
> +	if (err)
> +		return err;
> +
>   	args = kcalloc(FASTRPC_CREATE_PROCESS_NARGS, sizeof(*args), GFP_KERNEL);
>   	if (!args)
>   		return -ENOMEM;
> @@ -1221,6 +1237,7 @@ static int fastrpc_device_open(struct inode *inode, struct file *filp)
>   	struct fastrpc_user *fl = NULL;
>   	struct miscdevice *currdev = NULL;
>   	unsigned long flags;
> +	int dev_minor = MINOR(inode->i_rdev);
>   
>   	if (!filp)
>   		return -EFAULT;
> @@ -1234,6 +1251,12 @@ static int fastrpc_device_open(struct inode *inode, struct file *filp)
>   	else
>   		cctx = miscdev_to_cctx(filp->private_data);
>   

> +	if (!((dev_minor == cctx->miscdev.minor) ||
> +	     (dev_minor == cctx->securedev.minor))) {
> +		dev_err(&cctx->rpdev->dev, "Device node is not proper\n");
> +		return -EFAULT;
> +	}

This is bit of over checking, how can we enter without accessing proper 
device node?

> +
>   	fl = kzalloc(sizeof(*fl), GFP_KERNEL);
>   	if (!fl)
>   		return -ENOMEM;
> @@ -1250,6 +1273,7 @@ static int fastrpc_device_open(struct inode *inode, struct file *filp)
>   	INIT_LIST_HEAD(&fl->user);
>   	fl->tgid = current->tgid;
>   	fl->cctx = cctx;
> +	fl->dev_minor = dev_minor;
>   
>   	fl->sctx = fastrpc_session_alloc(cctx);
>   	if (!fl->sctx) {
> 
