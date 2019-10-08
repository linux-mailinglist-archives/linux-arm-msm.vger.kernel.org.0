Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C896D0077
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2019 20:07:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729616AbfJHSGs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Oct 2019 14:06:48 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:41981 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726384AbfJHSGs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Oct 2019 14:06:48 -0400
Received: by mail-pg1-f193.google.com with SMTP id t3so4851163pga.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Oct 2019 11:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=9k22JdnTV8IuRdbYO3IAN2HJ7ZCOjIEh/nswIg1lfuQ=;
        b=MCRb2iTlomnfBtouVkKEDuO553yc8SUSxUKjfPTpHEwXI1jeXnew0Z0Ddez3M2fXx/
         rA2P9rXv0NNizrZCdub5wGeeFVN06GScndU6XPjiNa08tpSTlwcm0hyjVVpJH+QCp9BU
         hfw51DrnS0ZacnsH7ny0/ARzKPESpLAt1gs372Hno15pUybo5EW5ugiGamWCecB56sB9
         ztXq6GPdLp7hUzzTX6sRZomaq0kYxTTT/aox99qN3OCdksR2eQ72zsCheG8yB9/uqohn
         Wb7lIWna7NosQnwAXJWUkloK7FsXzNv+n5aI8aSbvLeS2xtIVGwNC73/HaSVzGHd8BKF
         Oc2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=9k22JdnTV8IuRdbYO3IAN2HJ7ZCOjIEh/nswIg1lfuQ=;
        b=Z+FJGJMNRpPs+uaJkAJtvV3Ly5eMjFZx9lbG41/eTkh8rQSjPdNg3Vy3nyFePAgTTL
         /JD6HzlFnAItZcK9U//H1sr33farQnfhI1NMkEt68InRHlQwOaZGMh6AFyJmiFz8gKHJ
         6s3yi+6YC6btjgSuzY7/rV1bAYmZueDnOFJy3jrDkYH7IosqMNjKh6qxkPmbBEPsnRy5
         HANBKRJDUlalePMxNxHc70k9dL0tneH0B3e5LlyUykwVephRat8To0uNupkmQvdPAqKo
         FP0M5h8ugEoo8xd1eBGQEESVQ+tHO8pM9bUYNx/j+KLjaJ2/G+cGM2H7iKglGpFKy7KW
         3VCQ==
X-Gm-Message-State: APjAAAW1ynk0xHW20sNJ3AJkoTRmtq3ucj3d2u28tGDgWSwIN/zXE8Uc
        5FG18Dch2fi8uFyE8VREubTupMQ1hN4=
X-Google-Smtp-Source: APXvYqz1sEVhEgGPcKClIqNzftGgElPBwTnrJTbBUeF21A1lzGp78FE91ZlOnE2yQqFNO7foYAPkqw==
X-Received: by 2002:a65:6681:: with SMTP id b1mr10308144pgw.393.1570558006561;
        Tue, 08 Oct 2019 11:06:46 -0700 (PDT)
Received: from minitux (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id t21sm2269075pgi.87.2019.10.08.11.06.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2019 11:06:45 -0700 (PDT)
Date:   Tue, 8 Oct 2019 11:06:43 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Murali Nalajala <mnalajal@codeaurora.org>
Cc:     gregkh@linuxfoundation.org, rafael@kernel.org, swboyd@chromium.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] base: soc: Handle custom soc information sysfs entries
Message-ID: <20191008180643.GJ63675@minitux>
References: <1570480662-25252-1-git-send-email-mnalajal@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1570480662-25252-1-git-send-email-mnalajal@codeaurora.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 07 Oct 13:37 PDT 2019, Murali Nalajala wrote:

> Soc framework exposed sysfs entries are not sufficient for some
> of the h/w platforms. Currently there is no interface where soc
> drivers can expose further information about their SoCs via soc
> framework. This change address this limitation where clients can
> pass their custom entries as attribute group and soc framework
> would expose them as sysfs properties.
> 
> Signed-off-by: Murali Nalajala <mnalajal@codeaurora.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
> Changes in v2:
> - Address comments from Stephen Boyd about "soc_dev" clean up in error paths.
> 
> Changes in v1:
> - Remove NULL initialization of "soc_attr_groups"
> - Taken care of freeing "soc_attr_groups" in soc_release()
> - Addressed Stephen Boyd comments on usage of "kalloc"
> 
>  drivers/base/soc.c      | 30 +++++++++++++++++-------------
>  include/linux/sys_soc.h |  1 +
>  2 files changed, 18 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/base/soc.c b/drivers/base/soc.c
> index 7c0c5ca..4af11a4 100644
> --- a/drivers/base/soc.c
> +++ b/drivers/base/soc.c
> @@ -104,15 +104,12 @@ static ssize_t soc_info_get(struct device *dev,
>  	.is_visible = soc_attribute_mode,
>  };
>  
> -static const struct attribute_group *soc_attr_groups[] = {
> -	&soc_attr_group,
> -	NULL,
> -};
> -
>  static void soc_release(struct device *dev)
>  {
>  	struct soc_device *soc_dev = container_of(dev, struct soc_device, dev);
>  
> +	ida_simple_remove(&soc_ida, soc_dev->soc_dev_num);
> +	kfree(soc_dev->dev.groups);
>  	kfree(soc_dev);
>  }
>  
> @@ -121,6 +118,7 @@ static void soc_release(struct device *dev)
>  struct soc_device *soc_device_register(struct soc_device_attribute *soc_dev_attr)
>  {
>  	struct soc_device *soc_dev;
> +	const struct attribute_group **soc_attr_groups;
>  	int ret;
>  
>  	if (!soc_bus_type.p) {
> @@ -136,10 +134,18 @@ struct soc_device *soc_device_register(struct soc_device_attribute *soc_dev_attr
>  		goto out1;
>  	}
>  
> +	soc_attr_groups = kcalloc(3, sizeof(*soc_attr_groups), GFP_KERNEL);
> +	if (!soc_attr_groups) {
> +		ret = -ENOMEM;
> +		goto out2;
> +	}
> +	soc_attr_groups[0] = &soc_attr_group;
> +	soc_attr_groups[1] = soc_dev_attr->custom_attr_group;
> +
>  	/* Fetch a unique (reclaimable) SOC ID. */
>  	ret = ida_simple_get(&soc_ida, 0, 0, GFP_KERNEL);
>  	if (ret < 0)
> -		goto out2;
> +		goto out3;
>  	soc_dev->soc_dev_num = ret;
>  
>  	soc_dev->attr = soc_dev_attr;
> @@ -150,15 +156,15 @@ struct soc_device *soc_device_register(struct soc_device_attribute *soc_dev_attr
>  	dev_set_name(&soc_dev->dev, "soc%d", soc_dev->soc_dev_num);
>  
>  	ret = device_register(&soc_dev->dev);
> -	if (ret)
> -		goto out3;
> +	if (ret) {
> +		put_device(&soc_dev->dev);
> +		return ERR_PTR(ret);
> +	}
>  
>  	return soc_dev;
>  
>  out3:
> -	ida_simple_remove(&soc_ida, soc_dev->soc_dev_num);
> -	put_device(&soc_dev->dev);
> -	soc_dev = NULL;
> +	kfree(soc_attr_groups);
>  out2:
>  	kfree(soc_dev);
>  out1:
> @@ -169,8 +175,6 @@ struct soc_device *soc_device_register(struct soc_device_attribute *soc_dev_attr
>  /* Ensure soc_dev->attr is freed prior to calling soc_device_unregister. */
>  void soc_device_unregister(struct soc_device *soc_dev)
>  {
> -	ida_simple_remove(&soc_ida, soc_dev->soc_dev_num);
> -
>  	device_unregister(&soc_dev->dev);
>  	early_soc_dev_attr = NULL;
>  }
> diff --git a/include/linux/sys_soc.h b/include/linux/sys_soc.h
> index 48ceea8..d9b3cf0 100644
> --- a/include/linux/sys_soc.h
> +++ b/include/linux/sys_soc.h
> @@ -15,6 +15,7 @@ struct soc_device_attribute {
>  	const char *serial_number;
>  	const char *soc_id;
>  	const void *data;
> +	const struct attribute_group *custom_attr_group;
>  };
>  
>  /**
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
