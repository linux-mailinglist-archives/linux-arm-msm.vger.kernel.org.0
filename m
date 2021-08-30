Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89E133FBF65
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Aug 2021 01:28:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238966AbhH3X0F (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Aug 2021 19:26:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231783AbhH3X0D (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Aug 2021 19:26:03 -0400
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85693C06175F
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Aug 2021 16:25:09 -0700 (PDT)
Received: by mail-ot1-x336.google.com with SMTP id v33-20020a0568300921b0290517cd06302dso20522439ott.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Aug 2021 16:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=w4/IsuVv9oo3M3aKM3cA3InZRtIzixTG8bEPAEfnTls=;
        b=c5B+huAXwVCck8wf85wSYwP3k+wUjlYIcoCcEH9p3HWqTCpdXt4hGFC+qnNJc+dPsm
         nZ/WJKxAOMQ3Fe7E4U68Y2h0JFyYfVcK9cX6LLphOW8xkwIOxTu5NdtGbInbk1wcsr5e
         uzkhS5J8gu9Eq1TP43kE1/IlkpU+zVhpC3ntwL7js8/CcU/dk2O84BCWQa7d6Q7FDuUx
         D1rZI4seCX0fUqDR9ZFhGeFoxXiUY901U51wMJWgma/lYzIkIcugBQE9oopLSo/6edSq
         mNnX9qVlMO5bllSQE4+3ykjUPAjQlEREbAaZFa9jca2zeybIzdprHJC4Q2i6gHFWlgvq
         7haw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=w4/IsuVv9oo3M3aKM3cA3InZRtIzixTG8bEPAEfnTls=;
        b=CTHNQgJxiT2vDoaEZlmoqvUirzFTbSf36IyOnX0HfHab5ipycfBjQVcvMkG2jb+sLP
         8Lj3a2BvhG+xPndg0RDYfttyz3VSU9h6zHBXxdBMPUjxz4gQzfrDrO+fKPNIL5QJT6S0
         FNRsoHX5OOL4+vvWeWnhD5TB22TXLskxF/G8dhqh4OV5jfkDWprhOpT70b3wp5kRaCNk
         jKWqfLDtsqAeOGyZ6m42fvEIQPHcrbOj3X7Hx2loRad0mxWMuQn1Re4n33rjX7/HU1B8
         nmuh4FjeDIHS9L+uOR7N3ztfmmZXSzrw6hgJvpKqiTH+pVvJmmfKY3JVU23+2lBOoyaj
         ARQg==
X-Gm-Message-State: AOAM530tfxxeg2rWoaeru34dS1s8dX0pCPM5uyNtzMFglLIONZL+Cun+
        TpxC31QWScNIoUD4iFvvoOBhWA==
X-Google-Smtp-Source: ABdhPJxsDMoje5wLuQQ9Kp7DnKAzCEWWc6pFAa7nBJRiedJC/ShJFR+WOdDp6ztjI8hjPxVOhWAR7w==
X-Received: by 2002:a05:6830:1056:: with SMTP id b22mr21759892otp.325.1630365908859;
        Mon, 30 Aug 2021 16:25:08 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id v24sm3543993ote.66.2021.08.30.16.25.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Aug 2021 16:25:08 -0700 (PDT)
Date:   Mon, 30 Aug 2021 18:25:06 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Deepak Kumar Singh <deesin@codeaurora.org>
Cc:     swboyd@chromium.org, clew@codeaurora.org, sibis@codeaurora.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, Andy Gross <agross@kernel.org>
Subject: Re: [PATCH V7 1/2] soc: qcom: aoss: Expose send for generic usecase
Message-ID: <YS1o0u16pWa6iwPh@yoga>
References: <1630323451-7160-1-git-send-email-deesin@codeaurora.org>
 <1630323451-7160-2-git-send-email-deesin@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1630323451-7160-2-git-send-email-deesin@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 30 Aug 06:37 CDT 2021, Deepak Kumar Singh wrote:

> Not all upcoming usecases will have an interface to allow the aoss
> driver to hook onto. Expose the send api and create a get function to
> enable drivers to send their own messages to aoss.
> 
> Signed-off-by: Chris Lew <clew@codeaurora.org>
> Signed-off-by: Deepak Kumar Singh <deesin@codeaurora.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  drivers/soc/qcom/qcom_aoss.c       | 54 +++++++++++++++++++++++++++++++++++++-
>  include/linux/soc/qcom/qcom_aoss.h | 38 +++++++++++++++++++++++++++
>  2 files changed, 91 insertions(+), 1 deletion(-)
>  create mode 100644 include/linux/soc/qcom/qcom_aoss.h
> 
> diff --git a/drivers/soc/qcom/qcom_aoss.c b/drivers/soc/qcom/qcom_aoss.c
> index 934fcc4..bf0a6280 100644
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
> +	if (WARN_ON(IS_ERR_OR_NULL(qmp) || !data))
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
> @@ -515,6 +521,51 @@ static void qmp_cooling_devices_remove(struct qmp *qmp)
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
> +		return ERR_PTR(-EINVAL);
> +
> +	np = of_parse_phandle(dev->of_node, "qcom,qmp", 0);
> +	if (!np)
> +		return ERR_PTR(-ENODEV);
> +
> +	pdev = of_find_device_by_node(np);
> +	of_node_put(np);
> +	if (!pdev)
> +		return ERR_PTR(-EINVAL);
> +
> +	qmp = platform_get_drvdata(pdev);
> +
> +	return qmp ? qmp : ERR_PTR(-EPROBE_DEFER);
> +}
> +EXPORT_SYMBOL(qmp_get);
> +
> +/**
> + * qmp_put() - release a qmp handle
> + * @qmp: qmp handle obtained from qmp_get()
> + */
> +void qmp_put(struct qmp *qmp)
> +{
> +	if (!IS_ERR_OR_NULL(qmp))
> +		put_device(qmp->dev);
> +	/*
> +	 * Match get_device() inside of_find_device_by_node() in
> +	 * qmp_get()
> +	 */

Afaict this comment relates to the put_device() above, which typically
would imply that the comment should be above or inside the if
statement?

> +}
> +EXPORT_SYMBOL(qmp_put);
> +

Regards,
Bjorn

>  static int qmp_probe(struct platform_device *pdev)
>  {
>  	struct resource *res;
> @@ -610,6 +661,7 @@ static struct platform_driver qmp_driver = {
>  	.driver = {
>  		.name		= "qcom_aoss_qmp",
>  		.of_match_table	= qmp_dt_match,
> +		.suppress_bind_attrs = true,
>  	},
>  	.probe = qmp_probe,
>  	.remove	= qmp_remove,
> diff --git a/include/linux/soc/qcom/qcom_aoss.h b/include/linux/soc/qcom/qcom_aoss.h
> new file mode 100644
> index 0000000..3c2a82e
> --- /dev/null
> +++ b/include/linux/soc/qcom/qcom_aoss.h
> @@ -0,0 +1,38 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2021, The Linux Foundation. All rights reserved.
> + */
> +
> +#ifndef __QCOM_AOSS_H__
> +#define __QCOM_AOSS_H__
> +
> +#include <linux/err.h>
> +#include <linux/device.h>
> +
> +struct qmp;
> +
> +#if IS_ENABLED(CONFIG_QCOM_AOSS_QMP)
> +
> +int qmp_send(struct qmp *qmp, const void *data, size_t len);
> +struct qmp *qmp_get(struct device *dev);
> +void qmp_put(struct qmp *qmp);
> +
> +#else
> +
> +static inline int qmp_send(struct qmp *qmp, const void *data, size_t len)
> +{
> +	return -ENODEV;
> +}
> +
> +static inline struct qmp *qmp_get(struct device *dev)
> +{
> +	return ERR_PTR(-ENODEV);
> +}
> +
> +static inline void qmp_put(struct qmp *qmp)
> +{
> +}
> +
> +#endif
> +
> +#endif
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
