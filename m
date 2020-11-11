Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6E6F2AF7F4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Nov 2020 19:33:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727042AbgKKSdX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Nov 2020 13:33:23 -0500
Received: from m42-4.mailgun.net ([69.72.42.4]:61157 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726570AbgKKSdX (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Nov 2020 13:33:23 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1605119602; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=jINwF2QHtuLQM6Tp+bAyXS1cxvGNm4sCVr97ExWltvA=;
 b=KWzDOI2jHtMU7FuiCavSXsMepZneGoxF2raHCmNRs8VW/0DpAnNHqQQLAIQB3Qq+F8/vsBOx
 DQNDjB4QTckWbAqMT8agYvPeNHJmvde+PdlWB88RPWX5N1PbEgUU3ARYJoq8pHZfOvjoQxiD
 p9fIqz945yIXprEmj/4EFS/QAFE=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 5fac2e72ba0e43f355f3094f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 11 Nov 2020 18:33:22
 GMT
Sender: sibis=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D754BC433F0; Wed, 11 Nov 2020 18:33:21 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 03678C433C8;
        Wed, 11 Nov 2020 18:33:20 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 12 Nov 2020 00:03:20 +0530
From:   Sibi Sankar <sibis@codeaurora.org>
To:     Chris Lew <clew@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] soc: qcom: aoss: Expose send for generic usecase
In-Reply-To: <1604373541-12641-1-git-send-email-clew@codeaurora.org>
References: <1604373541-12641-1-git-send-email-clew@codeaurora.org>
Message-ID: <3ae3e00dd8a6c2aacd852fca1f343779@codeaurora.org>
X-Sender: sibis@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hey Chris,
Thanks for the patch.

On 2020-11-03 08:49, Chris Lew wrote:
> Not all upcoming usecases will have an interface to allow the aoss
> driver to hook onto. Expose the send api and create a get function to
> enable drivers to send their own messages to aoss.
> 
> Signed-off-by: Chris Lew <clew@codeaurora.org>
> ---
>  drivers/soc/qcom/qcom_aoss.c       | 28 +++++++++++++++++++++++++++-
>  include/linux/soc/qcom/qcom_aoss.h | 33 
> +++++++++++++++++++++++++++++++++
>  2 files changed, 60 insertions(+), 1 deletion(-)
>  create mode 100644 include/linux/soc/qcom/qcom_aoss.h
> 
> diff --git a/drivers/soc/qcom/qcom_aoss.c 
> b/drivers/soc/qcom/qcom_aoss.c
> index ed2c687c16b3..8f052db1880a 100644
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
> @@ -222,12 +224,15 @@ static bool qmp_message_empty(struct qmp *qmp)
>   *
>   * Return: 0 on success, negative errno on failure
>   */
> -static int qmp_send(struct qmp *qmp, const void *data, size_t len)
> +int qmp_send(struct qmp *qmp, const void *data, size_t len)
>  {
>  	long time_left;
>  	size_t tlen;
>  	int ret;
> 
> +	if (!qmp || !data)
> +		return -EINVAL;
> +
>  	if (WARN_ON(len + sizeof(u32) > qmp->size))
>  		return -EINVAL;
> 
> @@ -261,6 +266,7 @@ static int qmp_send(struct qmp *qmp, const void
> *data, size_t len)
> 
>  	return ret;
>  }
> +EXPORT_SYMBOL_GPL(qmp_send);
> 
>  static int qmp_qdss_clk_prepare(struct clk_hw *hw)
>  {
> @@ -515,6 +521,26 @@ static void qmp_cooling_devices_remove(struct qmp 
> *qmp)
>  		thermal_cooling_device_unregister(qmp->cooling_devs[i].cdev);
>  }
> 
> +/**
> + * qmp_get() - get a qmp handle from device tree node
> + * @np: of node of qmp device
> + *
> + * Return: handle to qmp device on success, ERR_PTR() on failure
> + */
> +struct qmp_device *qmp_get(struct device_node *np)
> +{
> +	struct platform_device *pdev;
> +	struct qmp *qmp;

Can we use this patch series to determine
the binding the client are expected to use
to point to the qmp phandle and have it
parsed here? This would mean that qmp_get
would take in device as input instead.
Bjorn suggested that clients use "qcom,qmp"
during an offline discussion. Let me know
what you think.

> +
> +	pdev = of_find_device_by_node(np);
> +	if (!pdev)
> +		return ERR_PTR(-EINVAL);
> +
> +	qmp = platform_get_drvdata(pdev);
> +	return qmp ? qmp : ERR_PTR(-EPROBE_DEFER);
> +}
> +EXPORT_SYMBOL_GPL(qmp_get);
> +
>  static int qmp_probe(struct platform_device *pdev)
>  {
>  	struct resource *res;
> diff --git a/include/linux/soc/qcom/qcom_aoss.h
> b/include/linux/soc/qcom/qcom_aoss.h
> new file mode 100644
> index 000000000000..05fc0ed3a10d
> --- /dev/null
> +++ b/include/linux/soc/qcom/qcom_aoss.h
> @@ -0,0 +1,33 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2020, The Linux Foundation. All rights reserved.
> + */
> +
> +#ifndef __QCOM_AOSS_H__
> +#define __QCOM_AOSS_H__
> +
> +#include <linux/err.h>
> +#include <linux/of.h>
> +
> +struct qmp;
> +
> +#if IS_ENABLED(CONFIG_QCOM_AOSS_QMP)
> +
> +int qmp_send(struct qmp *qmp, const void *data, size_t len);
> +struct qmp_device *qmp_get(struct device_node *np);
> +
> +#else
> +
> +int qmp_send(struct qmp *qmp, const void *data, size_t len)
> +{
> +	return -ENODEV;
> +}
> +
> +struct qmp *qmp_get(struct device_node *np)
> +{
> +	return ERR_PTR(-ENODEV);
> +}
> +
> +#endif
> +
> +#endif

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.
