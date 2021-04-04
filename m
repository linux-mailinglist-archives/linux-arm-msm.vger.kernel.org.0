Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C6463538FE
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Apr 2021 19:17:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230495AbhDDRSC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 4 Apr 2021 13:18:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230237AbhDDRSA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 4 Apr 2021 13:18:00 -0400
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 381BFC0613E6
        for <linux-arm-msm@vger.kernel.org>; Sun,  4 Apr 2021 10:17:55 -0700 (PDT)
Received: by mail-ot1-x32b.google.com with SMTP id 68-20020a9d0f4a0000b02901b663e6258dso9377399ott.13
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 Apr 2021 10:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=c1CessPpLzgh2a5AVf24K9ZsL30ILYIkWayYu/yt2/8=;
        b=ck/WMVXA3KQLbKNqUo4rGtmw+NgI8GSy5h2pThn9Nok952defCUZsftf4pI32pvsC3
         5gB3i1LoDHBKKQiJvr97nV+7uUguQt9+9++o2aucuSNcjDx6Lz+euO4jvv6nm3FqY9N9
         BR7PiMIb3wd0PBKapUQD0aisJyh+NMP0AcCWD7zvOKk5yDSApSrkqz6sAbGeZDc/zQWx
         vS6QTsToqKlH+AJ7kYuz6vIYSV7yG6RG3a0T7uO7XfYy9y6kDuau18+SjMK7+EaKdvgS
         AYxV9PHBOuz1h8z8Hi7W5KaC1w0QWRux4+lznR283yUIpL7R7jM0gRrBLWvGlvVwcb0v
         I1Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=c1CessPpLzgh2a5AVf24K9ZsL30ILYIkWayYu/yt2/8=;
        b=ZJ0/JeAz/a7fA8HVntLM4xUqumVDD/XLyYSqguCZxCN3nuukVxPalanV0r7NW2EXAS
         20DadzkF0Y4GoGZh5IVBrwk+dmLePUDOyUukrRmFxmDXxgxz1VanEtr/Qury1lmHse7U
         Dkj3kfmXcm/07tfFmQvv36s3xX0s1xbAjP7JiFJbPQMhrRvb8z7Tu5ugJaktZ2RBrnGI
         pkHTDJViNsP3c9KnXN7Dq6GbQFzi3Yh5KAjmiLiWXJT0mxatk00H/JLLlUI/92dkd2zl
         OTy8zoAYrEEZFuRP//npt1Q+/I6e9Ay4ZA8fLzsxlC4SJIN2G4rDFvzJ7qojOVGb2qyL
         KNag==
X-Gm-Message-State: AOAM531ByOKEoqEOKY+ytqXZzJFXVA7FLfHriZsbyrdExm0+axH8l53r
        elc7P4OeFrqSiWiPbv01SxjJUw==
X-Google-Smtp-Source: ABdhPJxChdfmhvt6D0eurGCCAP5+geqvhI7qaRQwc+qIUUf3jf1Z7EhiJi+4MKW17HZ7xkrqZKbeJg==
X-Received: by 2002:a9d:3e10:: with SMTP id a16mr19783276otd.261.1617556675225;
        Sun, 04 Apr 2021 10:17:55 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id s83sm2646719oif.43.2021.04.04.10.17.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Apr 2021 10:17:54 -0700 (PDT)
Date:   Sun, 4 Apr 2021 12:17:52 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Deepak Kumar Singh <deesin@codeaurora.org>
Cc:     clew@codeaurora.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Andy Gross <agross@kernel.org>
Subject: Re: [PATCH V1 1/2] soc: qcom: aoss: Expose send for generic usecase
Message-ID: <YGn0wBkOOILgaq5w@builder.lan>
References: <1617344238-12137-1-git-send-email-deesin@codeaurora.org>
 <1617344238-12137-2-git-send-email-deesin@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1617344238-12137-2-git-send-email-deesin@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 02 Apr 01:17 CDT 2021, Deepak Kumar Singh wrote:

> Not all upcoming usecases will have an interface to allow the aoss
> driver to hook onto. Expose the send api and create a get function to
> enable drivers to send their own messages to aoss.
> 
> Signed-off-by: Chris Lew <clew@codeaurora.org>
> Signed-off-by: Deepak Kumar Singh <deesin@codeaurora.org>
> ---
>  drivers/soc/qcom/qcom_aoss.c | 36 +++++++++++++++++++++++++++++++++++-
>  1 file changed, 35 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/qcom/qcom_aoss.c b/drivers/soc/qcom/qcom_aoss.c
> index 53acb94..5c643f0 100644
> --- a/drivers/soc/qcom/qcom_aoss.c
> +++ b/drivers/soc/qcom/qcom_aoss.c
> @@ -8,10 +8,12 @@
>  #include <linux/io.h>
>  #include <linux/mailbox_client.h>
>  #include <linux/module.h>
> +#include <linux/of_platform.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_domain.h>
>  #include <linux/thermal.h>
>  #include <linux/slab.h>
> +#include <linux/soc/qcom/qcom_aoss.h>

I believe you forgot to 'git add' this.

>  
>  #define QMP_DESC_MAGIC			0x0
>  #define QMP_DESC_VERSION		0x4
> @@ -223,11 +225,14 @@ static bool qmp_message_empty(struct qmp *qmp)
>   *
>   * Return: 0 on success, negative errno on failure
>   */
> -static int qmp_send(struct qmp *qmp, const void *data, size_t len)
> +int qmp_send(struct qmp *qmp, const void *data, size_t len)
>  {
>  	long time_left;
>  	int ret;
>  
> +	if (!qmp || !data)

I don't see a legit use case where these are NULL, so there's probably a
developer staring at the kernel log wondering why their code isn't
working. So better wrap this in a WARN_ON() to help him/her.


Also, a developer failing to check the return value of qmp_get() would
get here with qmp being -ENODEV, -EINVAL or -EPROBE_DEFER. Which we
would gladly dereference in the next conditional. So rather than !qmp,
IS_ERR_OR_NULL(qmp) would be useful.

> +		return -EINVAL;
> +
>  	if (WARN_ON(len + sizeof(u32) > qmp->size))
>  		return -EINVAL;
>  
> @@ -261,6 +266,7 @@ static int qmp_send(struct qmp *qmp, const void *data, size_t len)
>  
>  	return ret;
>  }
> +EXPORT_SYMBOL(qmp_send);
>  
>  static int qmp_qdss_clk_prepare(struct clk_hw *hw)
>  {
> @@ -515,6 +521,34 @@ static void qmp_cooling_devices_remove(struct qmp *qmp)
>  		thermal_cooling_device_unregister(qmp->cooling_devs[i].cdev);
>  }
>  
> +/**
> + * qmp_get() - get a qmp handle from a device
> + * @dev: client device pointer
> + *
> + * Return: handle to qmp device on success, ERR_PTR() on failure
> + */
> +struct qmp *qmp_get(struct device *dev)
> +{
> +	struct platform_device *pdev;
> +	struct device_node *np;
> +	struct qmp *qmp;
> +
> +	if (!dev || !dev->of_node)
> +		return ERR_PTR(-ENODEV);

Value of @dev is an invalid argument, so I think -EINVAL is suitable.

> +
> +	np = of_parse_phandle(dev->of_node, "qcom,qmp", 0);
> +	if (!np)
> +		return ERR_PTR(-ENODEV);
> +
> +	pdev = of_find_device_by_node(np);

of_find_device_by_node() will increment the refcount of the underlying
struct device of pdev, so you need to platform_device_put() once you're
done with it.

As a side effect of not putting the struct device, the devm_kzalloc'ed
qmp pointer will remain valid. So care is needed to make sure that the
client doesn't end up with a dangling pointer if the qmp device is
removed.

My suggestion is that you add a "qmp_put()" function, which invokes
platform_device_put() and that you add some sort of tracking ("bool
orphan"?) to the struct qmp and make qmp_send() fail if this is set.

That way if someone unbinds the aoss device, the client will still have
a "valid" pointer, but won't be able to qmp_send() after qmp_close() has
been called in the aoss remove function.

Regards,
Bjorn

> +	if (!pdev)
> +		return ERR_PTR(-EINVAL);
> +
> +	qmp = platform_get_drvdata(pdev);
> +	return qmp ? qmp : ERR_PTR(-EPROBE_DEFER);
> +}
> +EXPORT_SYMBOL(qmp_get);
> +
>  static int qmp_probe(struct platform_device *pdev)
>  {
>  	struct resource *res;
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
