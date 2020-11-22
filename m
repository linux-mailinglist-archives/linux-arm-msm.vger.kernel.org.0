Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAA6F2BC363
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Nov 2020 04:30:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727266AbgKVDZ1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 21 Nov 2020 22:25:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727237AbgKVDZ1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 21 Nov 2020 22:25:27 -0500
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com [IPv6:2607:f8b0:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2733C0613D2
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Nov 2020 19:25:25 -0800 (PST)
Received: by mail-ot1-x341.google.com with SMTP id 92so9699366otd.5
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Nov 2020 19:25:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=WJX+iwCNrLY6xkeYMcGsZvSc2bHXcPa6YPJqPYja4x8=;
        b=DN1PPyz9MoRKDfIWWWgkA09mEVlXnqYAWl8vTLJXTSRJkv2ClFu2i3aMYVbZdeoqX9
         pKLKGJ2Oc8i/zsMrza+EdthuBFm5g8R6a5Shq7pMQWJJNbJOWr1CYkZTRlU0YDfiJkWs
         6AWHQD7LST88nPRSwwXSmtm4Dka/f7i3srcDe3mBJNkjfNSI2Vpzt2Vy7zvfFA0w4urM
         UnNQeSy0B1tZwGBHPHDrEdxJRAJDDjtFrfLbyza30skD5tY6fjc2/ZOvryraDLB/8SzI
         CiLFAE6uqoaD8jf3JZ2LlvmnhOMyvKvU2Nsq+nw+0RR/xJ5xBkfAZXl1IQmz+jGcezpt
         og7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WJX+iwCNrLY6xkeYMcGsZvSc2bHXcPa6YPJqPYja4x8=;
        b=LZljKB+5BH9a4NdPxESY2JjrRD+HMnme15y9WUYHEosqsaR/CvPm/oDkp7jmlcEj2e
         1GAWowW3gNapBMVoYXY6hgqc1wVt1pyeJoK2pBCiENCxbLycLJy24qgJWWrsLw8nYIlX
         FH7xrb7i/Egv6ZYl6eB3BWMBeeUi0huzW9LtjFKFxNtd551XWev4FkqpT+q2N8Rv3NGK
         ch5tCKghq1lKcWWBj8I4HMHfi6RX6K/cFOOKHRhVFRWmWOdQA4C58bo52/HscUxFm8Pt
         ojkyFXkCX+xZNQAMsbAWP5uINDOzMoRiqLVhxE+G5125bvBd5cHmW70VABTykNqxNTX2
         D1pA==
X-Gm-Message-State: AOAM531HMd6y10CMLcfXXgf38pCES+YuLZsPLyTB7mLsoUJC1lTAXULf
        WGMM0febpkTAeLU7JpQ7i4Z/qA==
X-Google-Smtp-Source: ABdhPJyh2XqbjHC8c5Q3FOf+1H8wzUez6/STr7DtcQ/thhx2kELdbzX0Nbb5f516o/kaKVYR5uXi0A==
X-Received: by 2002:a9d:62c9:: with SMTP id z9mr19325119otk.18.1606015525052;
        Sat, 21 Nov 2020 19:25:25 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id s28sm4190142otd.2.2020.11.21.19.25.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2020 19:25:24 -0800 (PST)
Date:   Sat, 21 Nov 2020 21:25:22 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Chris Lew <clew@codeaurora.org>
Cc:     agross@kernel.org, sibis@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] soc: qcom: aoss: Add debugfs send entry
Message-ID: <20201122032522.GN8532@builder.lan>
References: <1604373541-12641-1-git-send-email-clew@codeaurora.org>
 <1604373541-12641-2-git-send-email-clew@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1604373541-12641-2-git-send-email-clew@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 02 Nov 21:19 CST 2020, Chris Lew wrote:

> It can be useful to control the different power states of various
> parts of hardware for device testing. Add a debugfs node to send
> messages through qmp to aoss for debugging and testing purposes.
> 
> Signed-off-by: Chris Lew <clew@codeaurora.org>
> ---
>  drivers/soc/qcom/qcom_aoss.c | 36 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
> 
> diff --git a/drivers/soc/qcom/qcom_aoss.c b/drivers/soc/qcom/qcom_aoss.c
> index 8f052db1880a..2fd755d2a92d 100644
> --- a/drivers/soc/qcom/qcom_aoss.c
> +++ b/drivers/soc/qcom/qcom_aoss.c
> @@ -4,6 +4,7 @@
>   */
>  #include <dt-bindings/power/qcom-aoss-qmp.h>
>  #include <linux/clk-provider.h>
> +#include <linux/debugfs.h>
>  #include <linux/interrupt.h>
>  #include <linux/io.h>
>  #include <linux/mailbox_client.h>
> @@ -85,6 +86,8 @@ struct qmp {
>  	struct clk_hw qdss_clk;
>  	struct genpd_onecell_data pd_data;
>  	struct qmp_cooling_device *cooling_devs;
> +
> +	struct dentry *debugfs_fp;
>  };
>  
>  struct qmp_pd {
> @@ -541,6 +544,34 @@ struct qmp_device *qmp_get(struct device_node *np)
>  }
>  EXPORT_SYMBOL_GPL(qmp_get);
>  
> +static ssize_t aoss_dbg_write(struct file *file, const char __user *userstr,
> +			      size_t len, loff_t *pos)
> +{
> +	struct qmp *qmp = file->private_data;
> +	char buf[QMP_MSG_LEN] = {};
> +	int ret;
> +
> +	if (!len || len >= QMP_MSG_LEN)
> +		return len;
> +
> +	ret  = copy_from_user(buf, userstr, len);
> +	if (ret) {
> +		dev_err(qmp->dev, "copy from user failed, ret:%d\n", ret);
> +		return len;
> +	}
> +
> +	ret = qmp_send(qmp, buf, QMP_MSG_LEN);
> +	if (ret)
> +		dev_err(qmp->dev, "debug send failed, ret:%d\n", ret);

You should propagate this error to the caller, i.e. 

	return ret ? ret : len;

And with that the error print doesn't really add any value, so please
drop it.

> +
> +	return len;
> +}
> +

This will result in a compile warning when compiled without
CONFIG_DEBUG_FS, so either mark it __maybe_unused or wrap the whole hunk
in a #if IS_ENABLED(CONFIG_DEBUG_FS).


PS. Feel free to resubmit this change on its own, as it can be merged
independently from patch 1.

Regards,
Bjorn

> +static const struct file_operations aoss_dbg_fops = {
> +	.open = simple_open,
> +	.write = aoss_dbg_write,
> +};
> +
>  static int qmp_probe(struct platform_device *pdev)
>  {
>  	struct resource *res;
> @@ -595,6 +626,9 @@ static int qmp_probe(struct platform_device *pdev)
>  
>  	platform_set_drvdata(pdev, qmp);
>  
> +	qmp->debugfs_fp = debugfs_create_file("aoss_send_message", 0220, NULL,
> +					      qmp, &aoss_dbg_fops);
> +
>  	return 0;
>  
>  err_remove_qdss_clk:
> @@ -611,6 +645,8 @@ static int qmp_remove(struct platform_device *pdev)
>  {
>  	struct qmp *qmp = platform_get_drvdata(pdev);
>  
> +	debugfs_remove(qmp->debugfs_fp);
> +
>  	qmp_qdss_clk_remove(qmp);
>  	qmp_pd_remove(qmp);
>  	qmp_cooling_devices_remove(qmp);
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
