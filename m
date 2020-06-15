Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E674D1F8F8D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2020 09:27:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728510AbgFOH13 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 Jun 2020 03:27:29 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:32765 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728380AbgFOH13 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 Jun 2020 03:27:29 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1592206047; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=fEk7YP/LrCEAqKTSFo02hM8U5W6/ymF6qtRNJISca3Y=; b=EM1R07b5Da7PTxLCCgAClAEvMYLlG6j06IvoZb5HxMvlHG2ncINnp6/LTg3KQmcSaJPof0x5
 qoVPcZFFpBtVa90wSqliTMnPGT6hYNxu2HCVOZuwBKdAS3tbnxHpf3ZFQbOWW9NcK8GlRk1J
 7l0+AykFEokqNbjc+fO6CeAWRL0=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n08.prod.us-east-1.postgun.com with SMTP id
 5ee722dda3d8a44743c2b318 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 15 Jun 2020 07:27:25
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 762AFC43391; Mon, 15 Jun 2020 07:27:24 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.0.12] (unknown [183.83.138.47])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id DBBFAC433C8;
        Mon, 15 Jun 2020 07:27:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org DBBFAC433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=akashast@codeaurora.org
Subject: Re: [PATCH V7 RESEND 6/7] spi: spi-qcom-qspi: Add interconnect
 support
To:     broonie@kernel.org
Cc:     linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, swboyd@chromium.org,
        mgautam@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, mka@chromium.org,
        dianders@chromium.org, evgreen@chromium.org,
        msavaliy@codeaurora.org
References: <1591682194-32388-1-git-send-email-akashast@codeaurora.org>
 <1591682194-32388-7-git-send-email-akashast@codeaurora.org>
From:   Akash Asthana <akashast@codeaurora.org>
Message-ID: <2e299942-2a51-f023-ea6a-fa7822912d9e@codeaurora.org>
Date:   Mon, 15 Jun 2020 12:57:12 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1591682194-32388-7-git-send-email-akashast@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Mark,

Would you be able to review/ack this QSPI patch, you have already acked 
"QUP SPI" patch from the series "[Patch V7 RESEND 4/7]"

Putting a gentle reminder in-case this patch is missed.

Regards,

Akash

On 6/9/2020 11:26 AM, Akash Asthana wrote:
> Get the interconnect paths for QSPI device and vote according to the
> current bus speed of the driver.
>
> Signed-off-by: Akash Asthana <akashast@codeaurora.org>
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> ---
> Changes in V2:
>   - As per Bjorn's comment, introduced and using devm_of_icc_get API for getting
>     path handle
>   - As per Matthias comment, added error handling for icc_set_bw call
>
> Changes in V3:
>   - No Change.
>
> Changes in V4:
>   - As per Mark's comment move peak_bw guess as twice of avg_bw if
>     nothing mentioned explicitly to ICC core.
>
> Changes in V5:
>   - Add icc_enable/disable to power on/off call.
>   - Save some non-zero avg/peak value to ICC core by calling geni_icc_set_bw
>     from probe so that when resume/icc_enable is called NOC are running at
>     some non-zero value.
>
> Changes in V6:
>   - As per Matthias's comment made print statement consistent across driver
>
> Changes in V7:
>   - As per Matthias's comment removed usage of peak_bw variable because we don't
>     have explicit peak requirement, we were voting peak = avg and this can be
>     tracked using single variable for avg bw.
>   - As per Matthias's comment improved print log.
>
> Changes in Resend V7:
>   - As per Matthias comment removed "unsigned int avg_bw_cpu" from
>     struct qcom_qspi as we are using that variable only once.
>
>   drivers/spi/spi-qcom-qspi.c | 56 ++++++++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 55 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/spi/spi-qcom-qspi.c b/drivers/spi/spi-qcom-qspi.c
> index 3c4f83b..b5b4cf6 100644
> --- a/drivers/spi/spi-qcom-qspi.c
> +++ b/drivers/spi/spi-qcom-qspi.c
> @@ -2,6 +2,7 @@
>   // Copyright (c) 2017-2018, The Linux foundation. All rights reserved.
>   
>   #include <linux/clk.h>
> +#include <linux/interconnect.h>
>   #include <linux/interrupt.h>
>   #include <linux/io.h>
>   #include <linux/module.h>
> @@ -139,7 +140,8 @@ struct qcom_qspi {
>   	struct device *dev;
>   	struct clk_bulk_data *clks;
>   	struct qspi_xfer xfer;
> -	/* Lock to protect xfer and IRQ accessed registers */
> +	struct icc_path *icc_path_cpu_to_qspi;
> +	/* Lock to protect data accessed by IRQs */
>   	spinlock_t lock;
>   };
>   
> @@ -229,6 +231,7 @@ static int qcom_qspi_transfer_one(struct spi_master *master,
>   	int ret;
>   	unsigned long speed_hz;
>   	unsigned long flags;
> +	unsigned int avg_bw_cpu;
>   
>   	speed_hz = slv->max_speed_hz;
>   	if (xfer->speed_hz)
> @@ -241,6 +244,18 @@ static int qcom_qspi_transfer_one(struct spi_master *master,
>   		return ret;
>   	}
>   
> +	/*
> +	 * Set BW quota for CPU as driver supports FIFO mode only.
> +	 * We don't have explicit peak requirement so keep it equal to avg_bw.
> +	 */
> +	avg_bw_cpu = Bps_to_icc(speed_hz);
> +	ret = icc_set_bw(ctrl->icc_path_cpu_to_qspi, avg_bw_cpu, avg_bw_cpu);
> +	if (ret) {
> +		dev_err(ctrl->dev, "%s: ICC BW voting failed for cpu: %d\n",
> +			__func__, ret);
> +		return ret;
> +	}
> +
>   	spin_lock_irqsave(&ctrl->lock, flags);
>   
>   	/* We are half duplex, so either rx or tx will be set */
> @@ -458,6 +473,29 @@ static int qcom_qspi_probe(struct platform_device *pdev)
>   	if (ret)
>   		goto exit_probe_master_put;
>   
> +	ctrl->icc_path_cpu_to_qspi = devm_of_icc_get(dev, "qspi-config");
> +	if (IS_ERR(ctrl->icc_path_cpu_to_qspi)) {
> +		ret = PTR_ERR(ctrl->icc_path_cpu_to_qspi);
> +		if (ret != -EPROBE_DEFER)
> +			dev_err(dev, "Failed to get cpu path: %d\n", ret);
> +		goto exit_probe_master_put;
> +	}
> +	/* Set BW vote for register access */
> +	ret = icc_set_bw(ctrl->icc_path_cpu_to_qspi, Bps_to_icc(1000),
> +				Bps_to_icc(1000));
> +	if (ret) {
> +		dev_err(ctrl->dev, "%s: ICC BW voting failed for cpu: %d\n",
> +				__func__, ret);
> +		goto exit_probe_master_put;
> +	}
> +
> +	ret = icc_disable(ctrl->icc_path_cpu_to_qspi);
> +	if (ret) {
> +		dev_err(ctrl->dev, "%s: ICC disable failed for cpu: %d\n",
> +				__func__, ret);
> +		goto exit_probe_master_put;
> +	}
> +
>   	ret = platform_get_irq(pdev, 0);
>   	if (ret < 0)
>   		goto exit_probe_master_put;
> @@ -511,9 +549,17 @@ static int __maybe_unused qcom_qspi_runtime_suspend(struct device *dev)
>   {
>   	struct spi_master *master = dev_get_drvdata(dev);
>   	struct qcom_qspi *ctrl = spi_master_get_devdata(master);
> +	int ret;
>   
>   	clk_bulk_disable_unprepare(QSPI_NUM_CLKS, ctrl->clks);
>   
> +	ret = icc_disable(ctrl->icc_path_cpu_to_qspi);
> +	if (ret) {
> +		dev_err_ratelimited(ctrl->dev, "%s: ICC disable failed for cpu: %d\n",
> +			__func__, ret);
> +		return ret;
> +	}
> +
>   	return 0;
>   }
>   
> @@ -521,6 +567,14 @@ static int __maybe_unused qcom_qspi_runtime_resume(struct device *dev)
>   {
>   	struct spi_master *master = dev_get_drvdata(dev);
>   	struct qcom_qspi *ctrl = spi_master_get_devdata(master);
> +	int ret;
> +
> +	ret = icc_enable(ctrl->icc_path_cpu_to_qspi);
> +	if (ret) {
> +		dev_err_ratelimited(ctrl->dev, "%s: ICC enable failed for cpu: %d\n",
> +			__func__, ret);
> +		return ret;
> +	}
>   
>   	return clk_bulk_prepare_enable(QSPI_NUM_CLKS, ctrl->clks);
>   }

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project

