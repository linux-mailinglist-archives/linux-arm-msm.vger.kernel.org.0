Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A36A712E5B4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jan 2020 12:30:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728264AbgABLav (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Jan 2020 06:30:51 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:19441 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728135AbgABLav (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Jan 2020 06:30:51 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1577964650; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: References: Cc: To:
 Subject: From: Sender; bh=SFlajEkHLlsUVLHVfmv2Qoe32uvgEMBTV5xvUKZ1oKY=;
 b=MQSREi7iEsYAi1U1W+LdvA8/5I1dGWJPu2Ram2A4TnxrHoBsQwa7xJGf7EOsRGJYb+hL+S1k
 pSyvyNqyBnUPkR4SvtRiI+aYqxWnYG9vsYw335BShiIlawJWMDT1093d8UhkEuXgOp/9ZdkG
 y5e7Rry+G9DtnnCvyEyYBCpnt4s=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e0dd469.7fe1663a2810-smtp-out-n03;
 Thu, 02 Jan 2020 11:30:49 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 31423C447A5; Thu,  2 Jan 2020 11:30:48 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.206.25.108] (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: vbadigan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 46D09C447A9;
        Thu,  2 Jan 2020 11:30:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 46D09C447A9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=vbadigan@codeaurora.org
From:   Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
Subject: Re: [PATCH V1] mmc: sdhci-msm: Add CQHCI support for sdhci-msm
To:     Adrian Hunter <adrian.hunter@intel.com>, ulf.hansson@linaro.org,
        agross@kernel.org
Cc:     asutoshd@codeaurora.org, stummala@codeaurora.org,
        sayalil@codeaurora.org, cang@codeaurora.org,
        rampraka@codeaurora.org, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Ritesh Harjani <riteshh@codeaurora.org>
References: <1576586233-28443-1-git-send-email-vbadigan@codeaurora.org>
 <1c6a6749-68c3-ee16-2c1b-e7534dee4791@intel.com>
Message-ID: <9720d5fe-1bb0-8a88-1373-935a9abdb9e0@codeaurora.org>
Date:   Thu, 2 Jan 2020 17:00:35 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <1c6a6749-68c3-ee16-2c1b-e7534dee4791@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 12/20/2019 7:29 PM, Adrian Hunter wrote:
> On 17/12/19 2:37 pm, Veerabhadrarao Badiganti wrote:
>> From: Ritesh Harjani<riteshh@codeaurora.org>
>>
>> This adds CQHCI support for sdhci-msm platforms.
>>
>> Signed-off-by: Ritesh Harjani<riteshh@codeaurora.org>
>> Signed-off-by: Veerabhadrarao Badiganti<vbadigan@codeaurora.org>
>>
>> ---
>> This patch is based on RFC patch
>> https://lkml.org/lkml/2017/8/30/313
>>
>> Changes since RFC:
>> 	- Updated settings so that TDLBA won't get reset when
>> 	  CQE is enabled.
>> 	- Removed new compatible string and moved to supports-cqe
>> 	  dt flag to identify CQE support.
>> 	- Incorporated review comments.
>>
>> Tested on: qcs404, sc7180
>> ---
>>   drivers/mmc/host/sdhci-msm.c | 115 ++++++++++++++++++++++++++++++++++++++++++-
>>   1 file changed, 114 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
>> index 3d0bb5e..a4e3507 100644
>> --- a/drivers/mmc/host/sdhci-msm.c
>> +++ b/drivers/mmc/host/sdhci-msm.c
>> @@ -15,6 +15,7 @@
>>   #include <linux/regulator/consumer.h>
>>   
>>   #include "sdhci-pltfm.h"
>> +#include "cqhci.h"
>>   
>>   #define CORE_MCI_VERSION		0x50
>>   #define CORE_VERSION_MAJOR_SHIFT	28
>> @@ -122,6 +123,10 @@
>>   #define msm_host_writel(msm_host, val, host, offset) \
>>   	msm_host->var_ops->msm_writel_relaxed(val, host, offset)
>>   
>> +/* CQHCI vendor specific registers */
>> +#define CQHCI_VENDOR_CFG1	0xA00
>> +#define DISABLE_RST_ON_CMDQ_EN	(0x3 << 13)
>> +
>>   struct sdhci_msm_offset {
>>   	u32 core_hc_mode;
>>   	u32 core_mci_data_cnt;
>> @@ -1567,6 +1572,109 @@ static void sdhci_msm_set_clock(struct sdhci_host *host, unsigned int clock)
>>   	__sdhci_msm_set_clock(host, clock);
>>   }
>>   
>> +/*****************************************************************************\
>> + *                                                                           *
>> + * MSM Command Queue Engine (CQE)                                            *
>> + *                                                                           *
>> +\*****************************************************************************/
>> +
>> +static u32 sdhci_msm_cqe_irq(struct sdhci_host *host, u32 intmask)
>> +{
>> +	int cmd_error = 0;
>> +	int data_error = 0;
>> +
>> +	if (!sdhci_cqe_irq(host, intmask, &cmd_error, &data_error))
>> +		return intmask;
>> +
>> +	cqhci_irq(host->mmc, intmask, cmd_error, data_error);
>> +	return 0;
>> +}
>> +
>> +void sdhci_msm_cqe_disable(struct mmc_host *mmc, bool recovery)
>> +{
>> +	struct sdhci_host *host = mmc_priv(mmc);
>> +	unsigned long flags;
>> +	u32 ctrl;
>> +
>> +	/*
>> +	 * When CQE is halted, the legacy SDHCI path operates only
>> +	 * on 128bit descriptors in 64bit mode.
>> +	 */
>> +	if (host->flags & SDHCI_USE_64_BIT_DMA)
>> +		host->desc_sz = 16;
> The adma_table_sz depends on desc_sz, so it cannot be changed here.
> If you do something like below, then you can set desc_sz before calling
> sdhci_setup_host()
>
> diff --git a/drivers/mmc/host/sdhci.c b/drivers/mmc/host/sdhci.c
> index f4540f9892ce..f1d3b70ff769 100644
> --- a/drivers/mmc/host/sdhci.c
> +++ b/drivers/mmc/host/sdhci.c
> @@ -3825,9 +3825,10 @@ int sdhci_setup_host(struct sdhci_host *host)
>   		void *buf;
>   
>   		if (host->flags & SDHCI_USE_64_BIT_DMA) {
> +			if (!host->desc_sz)
> +				host->desc_sz = SDHCI_ADMA2_64_DESC_SZ(host);
>   			host->adma_table_sz = host->adma_table_cnt *
> -					      SDHCI_ADMA2_64_DESC_SZ(host);
> -			host->desc_sz = SDHCI_ADMA2_64_DESC_SZ(host);
> +					      host->desc_sz;
>   		} else {
>   			host->adma_table_sz = host->adma_table_cnt *
>   					      SDHCI_ADMA2_32_DESC_SZ;

Thanks Adrian for the suggestion. I will add this change.

But even with this change, still i will have to override 'host->desc_sz' 
variable since qcom sdhci controller expects/operates-on

12-byte descriptor as long was CQE is not enabled. When CQE is enabled, 
it operates only on 16-bype descriptors (even when CQE is halted).

If i fix "host->desc_sz" to 16 then all the data transfer commands 
during card initialization (till CQE is enabled) would fail.

I may have to update as below:

     host->desc_sz = 16;

     sdhci_add_host()  ;

    host->desc_sz = 12;

And then cqhci_host_ops->enable() -> host->desc_sz = 16;

Please let me know if this is fine or if you have any other suggestion 
to support this limitation of qcom controller w.r.t ADMA descriptors 
with CQE.

>> +
>> +	spin_lock_irqsave(&host->lock, flags);
>> +
>> +	/*
>> +	 * During CQE operation command complete bit gets latched.
>> +	 * So s/w should clear command complete interrupt status when CQE is
>> +	 * halted. Otherwise unexpected SDCHI legacy interrupt gets
>> +	 * triggered when CQE is halted.
>> +	 */
>> +	ctrl = sdhci_readl(host, SDHCI_INT_ENABLE);
>> +	ctrl |= SDHCI_INT_RESPONSE;
>> +	sdhci_writel(host,  ctrl, SDHCI_INT_ENABLE);
>> +	sdhci_writel(host, SDHCI_INT_RESPONSE, SDHCI_INT_STATUS);
>> +
>> +	spin_unlock_irqrestore(&host->lock, flags);
>> +
>> +	sdhci_cqe_disable(mmc, recovery);
>> +}
>> +
>> +static const struct cqhci_host_ops sdhci_msm_cqhci_ops = {
>> +	.enable		= sdhci_cqe_enable,
>> +	.disable	= sdhci_msm_cqe_disable,
>> +};
>> +
>> +static int sdhci_msm_cqe_add_host(struct sdhci_host *host,
>> +				struct platform_device *pdev)
>> +{
>> +	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
>> +	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
>> +	struct cqhci_host *cq_host;
>> +	bool dma64;
>> +	int ret;
>> +
>> +	ret = sdhci_setup_host(host);
>> +	if (ret)
>> +		return ret;
>> +
>> +	cq_host = cqhci_pltfm_init(pdev);
>> +	if (IS_ERR(cq_host)) {
>> +		ret = PTR_ERR(cq_host);
>> +		dev_err(&pdev->dev, "cqhci-pltfm init: failed: %d\n", ret);
>> +		goto cleanup;
>> +	}
>> +
>> +	msm_host->mmc->caps2 |= MMC_CAP2_CQE | MMC_CAP2_CQE_DCMD;
>> +	cq_host->ops = &sdhci_msm_cqhci_ops;
>> +
>> +	dma64 = host->flags & SDHCI_USE_64_BIT_DMA;
>> +
>> +	ret = cqhci_init(cq_host, host->mmc, dma64);
>> +	if (ret) {
>> +		dev_err(&pdev->dev, "%s: CQE init: failed (%d)\n",
>> +				mmc_hostname(host->mmc), ret);
>> +		goto cleanup;
>> +	}
>> +
>> +	/* Disable cqe reset due to cqe enable signal */
>> +	cqhci_writel(cq_host, cqhci_readl(cq_host, CQHCI_VENDOR_CFG1) |
>> +		       DISABLE_RST_ON_CMDQ_EN, CQHCI_VENDOR_CFG1);
>> +
>> +	ret = __sdhci_add_host(host);
>> +	if (ret)
>> +		goto cleanup;
>> +
>> +	dev_info(&pdev->dev, "%s: CQE init: success\n",
>> +			mmc_hostname(host->mmc));
>> +	return ret;
>> +
>> +cleanup:
>> +	sdhci_cleanup_host(host);
>> +	return ret;
>> +}
>> +
>>   /*
>>    * Platform specific register write functions. This is so that, if any
>>    * register write needs to be followed up by platform specific actions,
>> @@ -1731,6 +1839,7 @@ static void sdhci_msm_set_regulator_caps(struct sdhci_msm_host *msm_host)
>>   	.set_uhs_signaling = sdhci_msm_set_uhs_signaling,
>>   	.write_w = sdhci_msm_writew,
>>   	.write_b = sdhci_msm_writeb,
>> +	.irq	= sdhci_msm_cqe_irq,
>>   };
>>   
>>   static const struct sdhci_pltfm_data sdhci_msm_pdata = {
>> @@ -1754,6 +1863,7 @@ static int sdhci_msm_probe(struct platform_device *pdev)
>>   	u8 core_major;
>>   	const struct sdhci_msm_offset *msm_offset;
>>   	const struct sdhci_msm_variant_info *var_info;
>> +	struct device_node *node = pdev->dev.of_node;
>>   
>>   	host = sdhci_pltfm_init(pdev, &sdhci_msm_pdata, sizeof(*msm_host));
>>   	if (IS_ERR(host))
>> @@ -1952,7 +2062,10 @@ static int sdhci_msm_probe(struct platform_device *pdev)
>>   	pm_runtime_use_autosuspend(&pdev->dev);
>>   
>>   	host->mmc_host_ops.execute_tuning = sdhci_msm_execute_tuning;
>> -	ret = sdhci_add_host(host);
>> +	if (of_property_read_bool(node, "supports-cqe"))
>> +		ret = sdhci_msm_cqe_add_host(host, pdev);
>> +	else
>> +		ret = sdhci_add_host(host);
>>   	if (ret)
>>   		goto pm_runtime_disable;
>>   	sdhci_msm_set_regulator_caps(msm_host);
>>
