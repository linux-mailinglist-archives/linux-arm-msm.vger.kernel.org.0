Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4D014214AE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Oct 2021 19:02:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238012AbhJDREF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Oct 2021 13:04:05 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:10671 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237982AbhJDREE (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Oct 2021 13:04:04 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1633366935; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=EUFbS3OOfHKwGr8EDLAYrhedge6jUNhS9K9NOR2H+zs=; b=W/9WGoECBipYrmVE152eQyaRlwCD15/7dqRKGb14zyoZJyVVi+xvEGAhD6NzEN17GOgefKcl
 ax9uyfyKqjT5PlWHcylaPGzWmIsJgC+LXIoFmSlkjjWsZJZ0FWRfjTxziCi2E/y3tzdhTpla
 6nJDbFtE92FiIqmD1R1r0ho10ys=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 615b3392fc6e34f8cd6f6948 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 04 Oct 2021 17:02:10
 GMT
Sender: srivasam=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A1896C4360D; Mon,  4 Oct 2021 17:02:10 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from [192.168.1.102] (unknown [157.48.255.211])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: srivasam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 20453C43460;
        Mon,  4 Oct 2021 17:01:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 20453C43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
Subject: Re: [PATCH 5/8] ASoC: qcom: Add support for codec dma driver
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
        bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
        srinivas.kandagatla@linaro.org, rohitkr@codeaurora.org,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        swboyd@chromium.org, judyhsiao@chromium.org,
        Venkata Prasad Potturu <potturu@codeaurora.org>
References: <1633087292-1378-1-git-send-email-srivasam@codeaurora.org>
 <1633087292-1378-6-git-send-email-srivasam@codeaurora.org>
 <YVc80cNQS+CHfbpV@google.com>
From:   Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Organization: Qualcomm India Private Limited.
Message-ID: <3080b04f-df7e-1b07-ed7b-9898cc53b7f9@codeaurora.org>
Date:   Mon, 4 Oct 2021 22:31:55 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YVc80cNQS+CHfbpV@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 10/1/2021 10:22 PM, Matthias Kaehlcke wrote:
Thanks for your time Matthias!!!
> On Fri, Oct 01, 2021 at 04:51:29PM +0530, Srinivasa Rao Mandadapu wrote:
>> Upadate lpass cpu and platform driver to support audio over codec dma
>> in ADSP bypass use case.
>>
>> Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
>> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
>> ---
>>   sound/soc/qcom/lpass-cpu.c      | 312 ++++++++++++++++++++++++-
>>   sound/soc/qcom/lpass-platform.c | 499 +++++++++++++++++++++++++++++++++++++---
>>   2 files changed, 773 insertions(+), 38 deletions(-)
>>
>> diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
>> index 3bd9eb3..c8dec52 100644
>> --- a/sound/soc/qcom/lpass-cpu.c
>> +++ b/sound/soc/qcom/lpass-cpu.c
>> @@ -798,6 +798,251 @@ static struct regmap_config lpass_hdmi_regmap_config = {
>>   	.cache_type = REGCACHE_FLAT,
>>   };
>>   
>> +static bool lpass_rxtx_regmap_writeable(struct device *dev, unsigned int reg)
>> +{
>> +	struct lpass_data *drvdata = dev_get_drvdata(dev);
>> +	struct lpass_variant *v = drvdata->variant;
>> +	int i;
>> +
>> +	for (i = 0; i < v->rxtx_irq_ports; ++i) {
>> +		if (reg == LPAIF_RXTX_IRQCLEAR_REG(v, i, LPASS_CDC_DMA_RX0))
>> +			return true;
>> +		if (reg == LPAIF_RXTX_IRQEN_REG(v, i, LPASS_CDC_DMA_RX0))
>> +			return true;
>> +		if (reg == LPAIF_RXTX_IRQSTAT_REG(v, i, LPASS_CDC_DMA_RX0))
>> +			return true;
>> +	}
>> +
>> +	for (i = 0; i < v->rxtx_rdma_channels; ++i) {
>> +		if (reg == LPAIF_CDC_RDMACTL_REG(v, i, LPASS_CDC_DMA_RX0))
>> +			return true;
>> +		if (reg == LPAIF_CDC_RDMABASE_REG(v, i, LPASS_CDC_DMA_RX0))
>> +			return true;
>> +		if (reg == LPAIF_CDC_RDMABUFF_REG(v, i, LPASS_CDC_DMA_RX0))
>> +			return true;
>> +		if (reg == LPAIF_CDC_RDMAPER_REG(v, i, LPASS_CDC_DMA_RX0))
>> +			return true;
>> +		if (reg == LPAIF_CDC_RDMA_INTF_REG(v, i, LPASS_CDC_DMA_RX0))
>> +			return true;
>> +	}
>> +
>> +	for (i = 0; i < v->rxtx_wrdma_channels; ++i) {
>> +		if (reg == LPAIF_CDC_WRDMACTL_REG(v, i + v->rxtx_wrdma_channel_start,
>> +							LPASS_CDC_DMA_TX3))
>> +			return true;
>> +		if (reg == LPAIF_CDC_WRDMABASE_REG(v, i + v->rxtx_wrdma_channel_start,
>> +							LPASS_CDC_DMA_TX3))
>> +			return true;
>> +		if (reg == LPAIF_CDC_WRDMABUFF_REG(v, i + v->rxtx_wrdma_channel_start,
>> +							LPASS_CDC_DMA_TX3))
>> +			return true;
>> +		if (reg == LPAIF_CDC_WRDMAPER_REG(v, i + v->rxtx_wrdma_channel_start,
>> +							LPASS_CDC_DMA_TX3))
>> +			return true;
>> +		if (reg == LPAIF_CDC_WRDMA_INTF_REG(v, i + v->rxtx_wrdma_channel_start,
>> +							LPASS_CDC_DMA_TX3))
>> +			return true;
>> +	}
>> +
>> +	return false;
>> +}
>> +
>> +static bool lpass_rxtx_regmap_readable(struct device *dev, unsigned int reg)
>> +{
>> +	struct lpass_data *drvdata = dev_get_drvdata(dev);
>> +	struct lpass_variant *v = drvdata->variant;
>> +	int i;
>> +
>> +	for (i = 0; i < v->rxtx_irq_ports; ++i) {
>> +		if (reg == LPAIF_RXTX_IRQCLEAR_REG(v, i, LPASS_CDC_DMA_RX0))
>> +			return true;
>> +		if (reg == LPAIF_RXTX_IRQEN_REG(v, i, LPASS_CDC_DMA_RX0))
>> +			return true;
>> +		if (reg == LPAIF_RXTX_IRQSTAT_REG(v, i, LPASS_CDC_DMA_RX0))
>> +			return true;
>> +	}
>> +
>> +	for (i = 0; i < v->rxtx_rdma_channels; ++i) {
>> +		if (reg == LPAIF_CDC_RDMACTL_REG(v, i, LPASS_CDC_DMA_RX0))
>> +			return true;
>> +		if (reg == LPAIF_CDC_RDMABASE_REG(v, i, LPASS_CDC_DMA_RX0))
>> +			return true;
>> +		if (reg == LPAIF_CDC_RDMABUFF_REG(v, i, LPASS_CDC_DMA_RX0))
>> +			return true;
>> +		if (reg == LPAIF_CDC_RDMACURR_REG(v, i, LPASS_CDC_DMA_RX0))
>> +			return true;
>> +		if (reg == LPAIF_CDC_RDMAPER_REG(v, i, LPASS_CDC_DMA_RX0))
>> +			return true;
>> +		if (reg == LPAIF_CDC_RDMA_INTF_REG(v, i, LPASS_CDC_DMA_RX0))
>> +			return true;
>> +	}
>> +
>> +	for (i = 0; i < v->rxtx_wrdma_channels; ++i) {
>> +		if (reg == LPAIF_CDC_WRDMACTL_REG(v, i + v->rxtx_wrdma_channel_start,
>> +							LPASS_CDC_DMA_TX3))
>> +			return true;
>> +		if (reg == LPAIF_CDC_WRDMABASE_REG(v, i + v->rxtx_wrdma_channel_start,
>> +							LPASS_CDC_DMA_TX3))
>> +			return true;
>> +		if (reg == LPAIF_CDC_WRDMABUFF_REG(v, i + v->rxtx_wrdma_channel_start,
>> +							LPASS_CDC_DMA_TX3))
>> +			return true;
>> +		if (reg == LPAIF_CDC_WRDMACURR_REG(v, i + v->rxtx_wrdma_channel_start,
>> +							LPASS_CDC_DMA_TX3))
>> +			return true;
>> +		if (reg == LPAIF_CDC_WRDMAPER_REG(v, i + v->rxtx_wrdma_channel_start,
>> +							LPASS_CDC_DMA_TX3))
>> +			return true;
>> +		if (reg == LPAIF_CDC_WRDMA_INTF_REG(v, i + v->rxtx_wrdma_channel_start,
>> +							LPASS_CDC_DMA_TX3))
>> +			return true;
>> +	}
>> +
>> +	return false;
>> +}
> lpass_rxtx_regmap_readable() is almost the same as lpass_rxtx_regmap_writeable(),
> except for LPAIF_CDC_RDMACURR_REG and LPAIF_CDC_WRDMACURR_REG. Add something like
>
> static bool __lpass_rxtx_regmap_accessible(struct device *dev, unsigned int reg, bool rw)
>
> which would look essentially like lpass_rxtx_regmap_readable() but checks the
> 'rw' parameter for LPAIF_CDC_RDMACURR_REG and LPAIF_CDC_WRDMACURR_REG.
> lpass_rxtx_regmap_readable() and lpass_rxtx_regmap_writeable() then call this
> function with the corresponding value for 'rw'
Okay. Will change it accordingly.
>> +
>> +static bool lpass_rxtx_regmap_volatile(struct device *dev, unsigned int reg)
>> +{
>> +	struct lpass_data *drvdata = dev_get_drvdata(dev);
>> +	struct lpass_variant *v = drvdata->variant;
>> +	int i;
>> +
>> +	for (i = 0; i < v->rxtx_irq_ports; ++i) {
>> +		if (reg == LPAIF_RXTX_IRQCLEAR_REG(v, i, LPASS_CDC_DMA_RX0))
>> +			return true;
>> +		if (reg == LPAIF_RXTX_IRQSTAT_REG(v, i, LPASS_CDC_DMA_RX0))
>> +			return true;
>> +	}
>> +
>> +	for (i = 0; i < v->rxtx_rdma_channels; ++i)
>> +		if (reg == LPAIF_CDC_RDMACURR_REG(v, i, LPASS_CDC_DMA_RX0))
>> +			return true;
>> +
>> +	for (i = 0; i < v->rxtx_wrdma_channels; ++i)
>> +		if (reg == LPAIF_CDC_WRDMACURR_REG(v, i + v->rxtx_wrdma_channel_start,
>> +							LPASS_CDC_DMA_TX3))
>> +			return true;
>> +
>> +	return false;
>> +}
>> +
>> +static bool lpass_va_regmap_writeable(struct device *dev, unsigned int reg)
>> +{
>> +	struct lpass_data *drvdata = dev_get_drvdata(dev);
>> +	struct lpass_variant *v = drvdata->variant;
>> +	int i;
>> +
>> +	for (i = 0; i < v->va_irq_ports; ++i) {
>> +		if (reg == LPAIF_RXTX_IRQCLEAR_REG(v, i, LPASS_CDC_DMA_VA_TX0))
>> +			return true;
>> +		if (reg == LPAIF_RXTX_IRQEN_REG(v, i, LPASS_CDC_DMA_VA_TX0))
>> +			return true;
>> +		if (reg == LPAIF_RXTX_IRQSTAT_REG(v, i, LPASS_CDC_DMA_VA_TX0))
>> +			return true;
>> +	}
>> +
>> +	for (i = 0; i < v->va_wrdma_channels; ++i) {
>> +		if (reg == LPAIF_CDC_WRDMACTL_REG(v, i + v->va_wrdma_channel_start,
>> +							LPASS_CDC_DMA_VA_TX0))
>> +			return true;
>> +		if (reg == LPAIF_CDC_WRDMABASE_REG(v, i + v->va_wrdma_channel_start,
>> +							LPASS_CDC_DMA_VA_TX0))
>> +			return true;
>> +		if (reg == LPAIF_CDC_WRDMABUFF_REG(v, i + v->va_wrdma_channel_start,
>> +							LPASS_CDC_DMA_VA_TX0))
>> +			return true;
>> +		if (reg == LPAIF_CDC_WRDMAPER_REG(v, i + v->va_wrdma_channel_start,
>> +							LPASS_CDC_DMA_VA_TX0))
>> +			return true;
>> +		if (reg == LPAIF_CDC_WRDMA_INTF_REG(v, i + v->va_wrdma_channel_start,
>> +							LPASS_CDC_DMA_VA_TX0))
>> +			return true;
>> +	}
>> +
>> +	return false;
>> +}
>> +
>> +static bool lpass_va_regmap_readable(struct device *dev, unsigned int reg)
>> +{
>> +	struct lpass_data *drvdata = dev_get_drvdata(dev);
>> +	struct lpass_variant *v = drvdata->variant;
>> +	int i;
>> +
>> +	for (i = 0; i < v->va_irq_ports; ++i) {
>> +		if (reg == LPAIF_RXTX_IRQCLEAR_REG(v, i, LPASS_CDC_DMA_VA_TX0))
>> +			return true;
>> +		if (reg == LPAIF_RXTX_IRQEN_REG(v, i, LPASS_CDC_DMA_VA_TX0))
>> +			return true;
>> +		if (reg == LPAIF_RXTX_IRQSTAT_REG(v, i, LPASS_CDC_DMA_VA_TX0))
>> +			return true;
>> +	}
>> +
>> +	for (i = 0; i < v->va_wrdma_channels; ++i) {
>> +		if (reg == LPAIF_CDC_WRDMACTL_REG(v, i + v->va_wrdma_channel_start,
>> +							LPASS_CDC_DMA_VA_TX0))
>> +			return true;
>> +		if (reg == LPAIF_CDC_WRDMABASE_REG(v, i + v->va_wrdma_channel_start,
>> +							LPASS_CDC_DMA_VA_TX0))
>> +			return true;
>> +		if (reg == LPAIF_CDC_WRDMABUFF_REG(v, i + v->va_wrdma_channel_start,
>> +							LPASS_CDC_DMA_VA_TX0))
>> +			return true;
>> +		if (reg == LPAIF_CDC_WRDMACURR_REG(v, i + v->va_wrdma_channel_start,
>> +							LPASS_CDC_DMA_VA_TX0))
>> +			return true;
>> +		if (reg == LPAIF_CDC_WRDMAPER_REG(v, i + v->va_wrdma_channel_start,
>> +							LPASS_CDC_DMA_VA_TX0))
>> +			return true;
>> +		if (reg == LPAIF_CDC_WRDMA_INTF_REG(v, i + v->va_wrdma_channel_start,
>> +							LPASS_CDC_DMA_VA_TX0))
>> +			return true;
>> +	}
>> +
>> +	return false;
>> +}
> Same as for lpass_rxtx_regmap_readable/writable()
Okay. Will change it.
>
>> +
>> +static bool lpass_va_regmap_volatile(struct device *dev, unsigned int reg)
>> +{
>> +	struct lpass_data *drvdata = dev_get_drvdata(dev);
>> +	struct lpass_variant *v = drvdata->variant;
>> +	int i;
>> +
>> +	for (i = 0; i < v->va_irq_ports; ++i) {
>> +		if (reg == LPAIF_RXTX_IRQCLEAR_REG(v, i, LPASS_CDC_DMA_VA_TX0))
>> +			return true;
>> +		if (reg == LPAIF_RXTX_IRQSTAT_REG(v, i, LPASS_CDC_DMA_VA_TX0))
>> +			return true;
>> +	}
>> +
>> +	for (i = 0; i < v->va_wrdma_channels; ++i) {
>> +		if (reg == LPAIF_CDC_WRDMACURR_REG(v, i + v->va_wrdma_channel_start,
>> +							LPASS_CDC_DMA_VA_TX0))
>> +			return true;
>> +	}
>> +
>> +	return false;
>> +}
>> +
>> +static struct regmap_config lpass_rxtx_regmap_config = {
>> +	.reg_bits = 32,
>> +	.reg_stride = 4,
>> +	.val_bits = 32,
>> +	.writeable_reg = lpass_rxtx_regmap_writeable,
>> +	.readable_reg = lpass_rxtx_regmap_readable,
>> +	.volatile_reg = lpass_rxtx_regmap_volatile,
>> +	.cache_type = REGCACHE_FLAT,
>> +};
>> +
>> +static struct regmap_config lpass_va_regmap_config = {
>> +	.reg_bits = 32,
>> +	.reg_stride = 4,
>> +	.val_bits = 32,
>> +	.writeable_reg = lpass_va_regmap_writeable,
>> +	.readable_reg = lpass_va_regmap_readable,
>> +	.volatile_reg = lpass_va_regmap_volatile,
>> +	.cache_type = REGCACHE_FLAT,
>> +};
>> +
>>   static unsigned int of_lpass_cpu_parse_sd_lines(struct device *dev,
>>   						struct device_node *node,
>>   						const char *name)
>> @@ -837,6 +1082,17 @@ static unsigned int of_lpass_cpu_parse_sd_lines(struct device *dev,
>>   	}
>>   }
>>   
>> +static bool is_cdc_dma_port(int dai_id)
>> +{
>> +	switch (dai_id) {
>> +	case LPASS_CDC_DMA_RX0:
>> +	case LPASS_CDC_DMA_TX3:
>> +	case LPASS_CDC_DMA_VA_TX0:
>> +		return true;
>> +	default:
>> +		return false;
>> +	}
>> +}
>>   static void of_lpass_cpu_parse_dai_data(struct device *dev,
>>   					struct lpass_data *data)
>>   {
>> @@ -857,7 +1113,9 @@ static void of_lpass_cpu_parse_dai_data(struct device *dev,
>>   		}
>>   		if (id == LPASS_DP_RX) {
>>   			data->hdmi_port_enable = 1;
>> -		} else {
>> +		} else if (is_cdc_dma_port(id))
>> +			data->wcd_codec_enable = 1;
>> +		else {
>>   			data->mi2s_playback_sd_mode[id] =
>>   				of_lpass_cpu_parse_sd_lines(dev, node,
>>   							    "qcom,playback-sd-lines");
>> @@ -897,6 +1155,53 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
>>   
>>   	of_lpass_cpu_parse_dai_data(dev, drvdata);
>>   
>> +	drvdata->num_clks =  variant->num_clks;
>> +	if (drvdata->wcd_codec_enable) {
>> +		drvdata->rxtx_lpaif =
>> +				devm_platform_ioremap_resource_byname(pdev, "lpass-rxtx-lpaif");
>> +		if (IS_ERR(drvdata->rxtx_lpaif))
>> +			return PTR_ERR(drvdata->rxtx_lpaif);
>> +
>> +		drvdata->va_lpaif = devm_platform_ioremap_resource_byname(pdev, "lpass-va-lpaif");
>> +		if (IS_ERR(drvdata->va_lpaif))
>> +			return PTR_ERR(drvdata->va_lpaif);
>> +
>> +		lpass_rxtx_regmap_config.max_register = LPAIF_CDC_WRDMAPER_REG(variant,
>> +					variant->rxtx_wrdma_channels +
>> +					variant->rxtx_wrdma_channel_start, LPASS_CDC_DMA_TX3);
>> +
>> +		drvdata->rxtx_lpaif_map = devm_regmap_init_mmio(dev, drvdata->rxtx_lpaif,
>> +					&lpass_rxtx_regmap_config);
>> +		if (IS_ERR(drvdata->rxtx_lpaif_map)) {
>> +			dev_err(dev, "error initializing regmap: %ld\n",
> The same error is logged a few lines below, you might want to log which regmap
> couldn't be initialized.
Okay. will update it.
>
>> +			PTR_ERR(drvdata->rxtx_lpaif_map));
> fix indentation
Okay. will fix it.
>> +			return PTR_ERR(drvdata->rxtx_lpaif_map);
>> +		}
>> +		lpass_va_regmap_config.max_register = LPAIF_CDC_WRDMAPER_REG(variant,
>> +					variant->va_wrdma_channels +
>> +					variant->va_wrdma_channel_start, LPASS_CDC_DMA_VA_TX0);
>> +
>> +		drvdata->va_lpaif_map = devm_regmap_init_mmio(dev, drvdata->va_lpaif,
>> +					&lpass_va_regmap_config);
>> +		if (IS_ERR(drvdata->va_lpaif_map)) {
>> +			dev_err(dev, "error initializing regmap: %ld\n",
> see above
>
>> +			PTR_ERR(drvdata->va_lpaif_map));
> fix indentation
Okay. will update it.
>> +			return PTR_ERR(drvdata->va_lpaif_map);
>> +		}
>> +		drvdata->cdc_num_clks =  variant->cdc_dma_num_clks;
>> +		for (i = 0; i < variant->cdc_dma_num_clks; i++) {
>> +			drvdata->cdc_dma_clks[i] = devm_clk_get(dev,
>> +							variant->cdc_dma_clk_names[i]);
>> +			if (IS_ERR(drvdata->cdc_dma_clks[i])) {
>> +	vdata->lpaif_map;
>> +		}
>>   	}
>>   
>>   	ret = regmap_write(map, LPAIF_DMABASE_REG(v, ch, dir, dai_id),
>> @@ -423,6 +578,16 @@ static int lpass_platform_pcmops_prepare(struct snd_soc_component *component,
>>   		return ret;
>>   	}
>>   
>> +	if (dai_id == LPASS_CDC_DMA_RX0 ||
>> +		dai_id == LPASS_CDC_DMA_TX3 ||
>> +		dai_id == LPASS_CDC_DMA_VA_TX0) {
>> +		ret = regmap_fields_write(dmactl->fifowm, id, LPAIF_DMACTL_FIFOWM_8);
>> +		if (ret) {
>> +			dev_err(soc_runtime->dev, "error writing fifowm field to dmactl reg: %d, id: %d\n",
>> +				ret, id);
>> +			return ret;
>> +		}
>> +	}
>>   	ret = regmap_fields_write(dmactl->enable, id, LPAIF_DMACTL_ENABLE_ON);
>>   	if (ret) {
>>   		dev_err(soc_runtime->dev, "error writing to rdmactl reg: %d\n",
>> @@ -457,14 +622,27 @@ static int lpass_platform_pcmops_trigger(struct snd_soc_component *component,
>>   		if (dai_id == LPASS_DP_RX) {
>>   			dmactl = drvdata->hdmi_rd_dmactl;
>>   			map = drvdata->hdmiif_map;
>> +		} else if (dai_id == LPASS_CDC_DMA_RX0) {
>> +			map = drvdata->rxtx_lpaif_map;
>> +			dmactl = drvdata->rxtx_rd_dmactl;
>>   		} else {
>>   			dmactl = drvdata->rd_dmactl;
>>   			map = drvdata->lpaif_map;
>>   		}
>>   	} else {
>> -		dmactl = drvdata->wr_dmactl;
>> -		id = pcm_data->dma_ch - v->wrdma_channel_start;
>> -		map = drvdata->lpaif_map;
>> +		if (dai_id == LPASS_CDC_DMA_TX3) {
>> +			dmactl = drvdata->rxtx_wr_dmactl;
>> +			map = drvdata->rxtx_lpaif_map;
>> +			id = pcm_data->dma_ch - v->rxtx_wrdma_channel_start;
>> +		} else if (dai_id == LPASS_CDC_DMA_VA_TX0) {
>> +			dmactl = drvdata->va_wr_dmactl;
>> +			map = drvdata->va_lpaif_map;
>> +			id = pcm_data->dma_ch - v->va_wrdma_channel_start;
>> +		} else {
>> +			dmactl = drvdata->wr_dmactl;
>> +			id = pcm_data->dma_ch - v->wrdma_channel_start;
>> +			map = drvdata->lpaif_map;
>> +		}
>
> As for "[4/8] ASoC: qcom: Add lapss CPU driver for codec dma control", I think
> you want a helper that encapsulates the above, instead of open coding it
> multiple times in the driver.
Okay Agreed. But will post as a separate patch.
>>   	}
>>   
>>   	switch (cmd) {
>> @@ -479,6 +657,24 @@ static int lpass_platform_pcmops_trigger(struct snd_soc_component *component,
>>   			return ret;
>>   		}
>>   		switch (dai_id) {
>> +		case LPASS_CDC_DMA_RX0:
>> +		case LPASS_CDC_DMA_TX3:
>> +		case LPASS_CDC_DMA_VA_TX0:
>> +			ret = regmap_fields_write(dmactl->dyncclk, id, LPAIF_DMACTL_DYNCLK_ON);
>> +			if (ret) {
>> +				dev_err(soc_runtime->dev,
>> +					"error writing to rdmactl reg field: %d\n", ret);
>> +				return ret;
>> +			}
>> +			map = (dai_id == LPASS_CDC_DMA_VA_TX0) ?
>> +				drvdata->va_lpaif_map : drvdata->rxtx_lpaif_map;
> 'map' was already assigned earlier.
Okay. will remove it.
>
>> +			reg_irqclr = LPAIF_RXTX_IRQCLEAR_REG(v, LPAIF_IRQ_PORT_HOST, dai_id);
>> +			val_irqclr = LPAIF_IRQ_ALL(ch);
>> +
>> +			reg_irqen = LPAIF_RXTX_IRQEN_REG(v, LPAIF_IRQ_PORT_HOST, dai_id);
>> +			val_mask = LPAIF_IRQ_ALL(ch);
>> +			val_irqen = LPAIF_IRQ_ALL(ch);
>> +			break;
>>   		case LPASS_DP_RX:
>>   			ret = regmap_fields_write(dmactl->dyncclk, id,
>>   					 LPAIF_DMACTL_DYNCLK_ON);
>> @@ -543,6 +739,26 @@ static int lpass_platform_pcmops_trigger(struct snd_soc_component *component,
>>   			return ret;
>>   		}
>>   		switch (dai_id) {
>> +		case LPASS_CDC_DMA_RX0:
>> +		case LPASS_CDC_DMA_TX3:
>> +		case LPASS_CDC_DMA_VA_TX0:
>> +			ret = regmap_fields_write(dmactl->dyncclk, id, LPAIF_DMACTL_DYNCLK_OFF);
>> +			if (ret) {
>> +				dev_err(soc_runtime->dev,
>> +					"error writing to rdmactl reg field: %d\n", ret);
>> +				return ret;
>> +			}
>> +			map = (dai_id == LPASS_CDC_DMA_VA_TX0) ?
>> +				drvdata->va_lpaif_map : drvdata->rxtx_lpaif_map;
> ditto
Okay.
>
>> +
>> +			reg_irqclr = LPAIF_RXTX_IRQCLEAR_REG(v, LPAIF_IRQ_PORT_HOST, dai_id);
>> +			val_irqclr = LPAIF_IRQ_ALL(ch);
>> +
>> +			reg_irqen = LPAIF_RXTX_IRQEN_REG(v, LPAIF_IRQ_PORT_HOST, dai_id);
>> +			val_mask = LPAIF_IRQ_ALL(ch);
>> +			val_irqen = LPAIF_IRQ_ALL(ch);
>> +
>> +		break;
>>   		case LPASS_DP_RX:
>>   			ret = regmap_fields_write(dmactl->dyncclk, id,
>>   					 LPAIF_DMACTL_DYNCLK_OFF);
>> @@ -601,6 +817,12 @@ static snd_pcm_uframes_t lpass_platform_pcmops_pointer(
>>   
>>   	if (dai_id == LPASS_DP_RX)
>>   		map = drvdata->hdmiif_map;
>> +	else if (dai_id == LPASS_CDC_DMA_RX0 ||
>> +		dai_id == LPASS_CDC_DMA_TX3 ||
>> +		dai_id == LPASS_CDC_DMA_VA_TX0)
>> +		map = (dai_id == LPASS_CDC_DMA_VA_TX0) ?
>> +			drvdata->va_lpaif_map :
>> +			drvdata->rxtx_lpaif_map;
>>   	else
>>   		map = drvdata->lpaif_map;
> use helper to get map from dai id
Okay. As existing code also needs changes, will do as a separate patch.
>
>>   
>> @@ -625,12 +847,39 @@ static snd_pcm_uframes_t lpass_platform_pcmops_pointer(
>>   	return bytes_to_frames(substream->runtime, curr_addr - base_addr);
>>   }
>>   
>> +static int lpass_platform_cdc_dma_mmap(struct snd_soc_component *component,
>> +			struct snd_pcm_substream *substream,
>> +			struct vm_area_struct *vma)
>> +{
>> +	struct snd_pcm_runtime *runtime = substream->runtime;
>> +	unsigned long size, offset;
>> +	int ret;
>> +
>> +	vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
>> +	size = vma->vm_end - vma->vm_start;
>> +	offset = vma->vm_pgoff << PAGE_SHIFT;
>> +	ret = io_remap_pfn_range(vma, vma->vm_start,
>> +			(runtime->dma_addr + offset) >> PAGE_SHIFT,
>> +			size, vma->vm_page_prot);
>> +
>> +	return ret;
> no need for 'ret' just 'return io_remap_pfn_range(...);'
Okay. will change it.
>> +}
>> +
>>   static int lpass_platform_pcmops_mmap(struct snd_soc_component *component,
>>   				      struct snd_pcm_substream *substream,
>>   				      struct vm_area_struct *vma)
>>   {
>>   	struct snd_pcm_runtime *runtime = substream->runtime;
>> +	struct snd_soc_pcm_runtime *soc_runtime = asoc_substream_to_rtd(substream);
>> +	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(soc_runtime, 0);
>> +	unsigned int dai_id = cpu_dai->driver->id;
>>   
>> +	if (dai_id == LPASS_CDC_DMA_RX0 ||
>> +		dai_id == LPASS_CDC_DMA_TX3 ||
>> +		dai_id == LPASS_CDC_DMA_VA_TX0) {
>> +		lpass_platform_cdc_dma_mmap(component, substream, vma);
>> +		return 0;
>> +	}
>>   	return dma_mmap_coherent(component->dev, vma, runtime->dma_area,
>>   				 runtime->dma_addr, runtime->dma_bytes);
>>   }
>> @@ -651,6 +900,14 @@ static irqreturn_t lpass_dma_interrupt_handler(
>>   
>>   	mask = LPAIF_IRQ_ALL(chan);
>>   	switch (dai_id) {
>> +	case LPASS_CDC_DMA_RX0:
>> +	case LPASS_CDC_DMA_TX3:
>> +	case LPASS_CDC_DMA_VA_TX0:
>> +		map = (dai_id == LPASS_CDC_DMA_VA_TX0) ?
>> +				drvdata->va_lpaif_map : drvdata->rxtx_lpaif_map;
>> +		reg = LPAIF_RXTX_IRQCLEAR_REG(v, LPAIF_IRQ_PORT_HOST, dai_id);
>> +		val = 0;
>> +		break;
>>   	case LPASS_DP_RX:
>>   		map = drvdata->hdmiif_map;
>>   		reg = LPASS_HDMITX_APP_IRQCLEAR_REG(v);
>> @@ -774,41 +1031,131 @@ static irqreturn_t lpass_platform_hdmiif_irq(int irq, void *data)
>>   				return rv;
>>   		}
>>   	}
>> +	return IRQ_HANDLED;
>> +}
>> +
>> +static irqreturn_t lpass_platform_rxtxif_irq(int irq, void *data)
>> +{
>> +	struct lpass_data *drvdata = data;
>> +	struct lpass_variant *v = drvdata->variant;
>> +	unsigned int irqs;
>> +	int rv, chan;
>> +
>> +	rv = regmap_read(drvdata->rxtx_lpaif_map,
>> +			LPAIF_RXTX_IRQSTAT_REG(v, LPAIF_IRQ_PORT_HOST, LPASS_CDC_DMA_RX0), &irqs);
>> +	if (rv)
>> +		return IRQ_NONE;
>> +	/* Handle per channel interrupts */
>> +	for (chan = 0; chan < LPASS_MAX_CDC_DMA_CHANNELS; chan++) {
>> +		if (irqs & LPAIF_IRQ_ALL(chan) && drvdata->rxtx_substream[chan]) {
>> +			rv = lpass_dma_interrupt_handler(
>> +						drvdata->rxtx_substream[chan],
>> +						drvdata, chan, irqs);
>> +			if (rv != IRQ_HANDLED)
>> +				return rv;
>> +		}
>> +	}
>> +
>> +	return IRQ_HANDLED;
>> +}
>> +
>> +static irqreturn_t lpass_platform_vaif_irq(int irq, void *data)
>> +{
>> +	struct lpass_data *drvdata = data;
>> +	struct lpass_variant *v = drvdata->variant;
>> +	unsigned int irqs;
>> +	int rv, chan;
>>   
>> +	rv = regmap_read(drvdata->va_lpaif_map,
>> +			LPAIF_RXTX_IRQSTAT_REG(v, LPAIF_IRQ_PORT_HOST,
>> +			LPASS_CDC_DMA_VA_TX0), &irqs);
>> +	if (rv)
>> +		return IRQ_NONE;
>> +	/* Handle per channel interrupts */
>> +	for (chan = 0; chan < LPASS_MAX_VA_CDC_DMA_CHANNELS; chan++) {
>> +		if (irqs & LPAIF_IRQ_ALL(chan) && drvdata->va_substream[chan]) {
>> +			rv = lpass_dma_interrupt_handler(
>> +						drvdata->va_substream[chan],
>> +						drvdata, chan, irqs);
>> +			if (rv != IRQ_HANDLED)
>> +				return rv;
>> +		}
>> +	}
>>   	return IRQ_HANDLED;
>>   }
>>   
>> +static int lpass_platform_prealloc_cdc_dma_buffer(struct snd_pcm *pcm,
>> +			struct snd_pcm_substream *substream, int dai_id)
>> +{
>> +	struct snd_dma_buffer *buf = &substream->dma_buffer;
>> +	int ret;
>> +
>> +	ret = dma_coerce_mask_and_coherent(pcm->card->dev, DMA_BIT_MASK(64));
>> +	if (ret)
>> +		return ret;
>> +
>> +	buf->dev.dev = pcm->card->dev;
>> +	buf->private_data = NULL;
>> +
>> +	/* Assign Codec DMA buffer pointers */
>> +	buf->dev.type = SNDRV_DMA_TYPE_CONTINUOUS;
>> +	if (dai_id == LPASS_CDC_DMA_RX0) {
>> +		buf->bytes = lpass_platform_rxtx_hardware.buffer_bytes_max;
>> +		buf->addr = LPSAS_RXTX_CDC_DMA_LPM_ADDR;
>> +	} else if (dai_id == LPASS_CDC_DMA_TX3) {
>> +		buf->bytes = lpass_platform_rxtx_hardware.buffer_bytes_max;
>> +		buf->addr = LPSAS_RXTX_CDC_DMA_LPM_ADDR + LPSAS_RXTX_CDC_DMA_LPM_BUFF_SIZE;
>> +	} else if (dai_id == LPASS_CDC_DMA_VA_TX0) {
>> +		buf->bytes = lpass_platform_va_hardware.buffer_bytes_max;
>> +		buf->addr = LPSAS_VA_CDC_DMA_LPM_ADDR;
>> +	}
>> +
>> +	buf->area = (unsigned char * __force)ioremap(buf->addr, buf->bytes);
>> +
>> +	return 0;
>> +}
>> +
>>   static int lpass_platform_pcm_new(struct snd_soc_component *component,
>>   				  struct snd_soc_pcm_runtime *soc_runtime)
>>   {
>>   	struct snd_pcm *pcm = soc_runtime->pcm;
>>   	struct snd_pcm_substream *psubstream, *csubstream;
>>   	int ret;
>> +	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(soc_runtime, 0);
>> +	unsigned int dai_id = cpu_dai->driver->id;
>> +
>>   	size_t size = lpass_platform_pcm_hardware.buffer_bytes_max;
>>   
>>   	psubstream = pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream;
>>   	if (psubstream) {
>> -		ret = snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV,
>> -					component->dev,
>> -					size, &psubstream->dma_buffer);
>> -		if (ret) {
>> -			dev_err(soc_runtime->dev, "Cannot allocate buffer(s)\n");
>> -			return ret;
>> +		if (dai_id == LPASS_CDC_DMA_RX0) {
>> +			lpass_platform_prealloc_cdc_dma_buffer(pcm, psubstream, dai_id);
>> +		} else {
>> +			ret = snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV,
>> +						component->dev,
>> +						size, &psubstream->dma_buffer);
>> +			if (ret) {
>> +				dev_err(soc_runtime->dev, "Cannot allocate buffer(s)\n");
>> +				return ret;
>> +			}
>>   		}
>>   	}
>>   
>>   	csubstream = pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream;
>>   	if (csubstream) {
>> -		ret = snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV,
>> -					component->dev,
>> -					size, &csubstream->dma_buffer);
>> -		if (ret) {
>> -			dev_err(soc_runtime->dev, "Cannot allocate buffer(s)\n");
>> -			if (psubstream)
>> -				snd_dma_free_pages(&psubstream->dma_buffer);
>> -			return ret;
>> +		if (dai_id == LPASS_CDC_DMA_TX3 || dai_id == LPASS_CDC_DMA_VA_TX0) {
>> +			lpass_platform_prealloc_cdc_dma_buffer(pcm, csubstream, dai_id);
>> +		} else {
>> +			ret = snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV,
>> +						component->dev,
>> +						size, &csubstream->dma_buffer);
>> +			if (ret) {
>> +				dev_err(soc_runtime->dev, "Cannot allocate buffer(s)\n");
>> +				if (psubstream)
>> +					snd_dma_free_pages(&psubstream->dma_buffer);
>> +				return ret;
>> +			}
>>   		}
>> -
>>   	}
>>   
>>   	return 0;
>> @@ -818,18 +1165,43 @@ static void lpass_platform_pcm_free(struct snd_soc_component *component,
>>   				    struct snd_pcm *pcm)
>>   {
>>   	struct snd_pcm_substream *substream;
>> +	unsigned int dai_id = component->id;
>>   	int i;
>>   
>>   	for_each_pcm_streams(i) {
>>   		substream = pcm->streams[i].substream;
>>   		if (substream) {
>> -			snd_dma_free_pages(&substream->dma_buffer);
>> +			if (dai_id == LPASS_CDC_DMA_RX0 ||
>> +				dai_id == LPASS_CDC_DMA_TX3 ||
>> +				dai_id == LPASS_CDC_DMA_VA_TX0) {
>> +				if (substream->dma_buffer.area)
>> +					iounmap((void __iomem *)substream->dma_buffer.area);
>> +			} else {
>> +				snd_dma_free_pages(&substream->dma_buffer);
>> +			}
>>   			substream->dma_buffer.area = NULL;
>>   			substream->dma_buffer.addr = 0;
>>   		}
>>   	}
>>   }
>>   
>> +int lpass_platform_copy(struct snd_soc_component *component,
>> +			 struct snd_pcm_substream *substream, int channel,
>> +			 unsigned long pos, void __user *buf, unsigned long bytes)
>> +{
>> +	struct snd_pcm_runtime *rt = substream->runtime;
>> +
> delete empty line
Okay. will remove it.
>
>> +	unsigned char *dma_buf = rt->dma_area + pos +
>> +				channel * (rt->dma_bytes / rt->channels);
>> +
>> +	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
>> +		return copy_from_user_toio(dma_buf, buf, bytes);
>> +	else if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
>> +		return copy_to_user_fromio(buf, dma_buf, bytes);
>> +
>> +	return 0;
> Can 'substream->stream' have any other value than SNDRV_PCM_STREAM_PLAYBACK or
> SNDRV_PCM_STREAM_CAPTURE? If not maybe return -EINVAL here?
Okay. will update it.
>> +}
>> +
>>   static int lpass_platform_pcmops_suspend(struct snd_soc_component *component)
>>   {
>>   	struct lpass_data *drvdata = snd_soc_component_get_drvdata(component);
>> @@ -875,6 +1247,7 @@ static const struct snd_soc_component_driver lpass_component_driver = {
>>   	.mmap		= lpass_platform_pcmops_mmap,
>>   	.pcm_construct	= lpass_platform_pcm_new,
>>   	.pcm_destruct	= lpass_platform_pcm_free,
>> +	.copy_user		= lpass_platform_copy,
>>   	.suspend		= lpass_platform_pcmops_suspend,
>>   	.resume			= lpass_platform_pcmops_resume,
>>   
>> @@ -914,6 +1287,60 @@ int asoc_qcom_lpass_platform_register(struct platform_device *pdev)
>>   		return ret;
>>   	}
>>   
>> +	if (drvdata->wcd_codec_enable) {
>> +		ret = regmap_write(drvdata->rxtx_lpaif_map,
>> +			LPAIF_RXTX_IRQEN_REG(v, LPAIF_IRQ_PORT_HOST, LPASS_CDC_DMA_TX3), 0x0);
>> +		if (ret) {
>> +			dev_err(&pdev->dev, "error writing to rxtx irqen reg: %d\n", ret);
>> +			return ret;
>> +		}
>> +		ret = regmap_write(drvdata->va_lpaif_map,
>> +			LPAIF_RXTX_IRQEN_REG(v, LPAIF_IRQ_PORT_HOST, LPASS_CDC_DMA_VA_TX0), 0x0);
>> +		if (ret) {
>> +			dev_err(&pdev->dev, "error writing to rxtx irqen reg: %d\n", ret);
>> +			return ret;
>> +		}
>> +		drvdata->rxtxif_irq = platform_get_irq_byname(pdev, "lpass-irq-rxtxif");
>> +		if (drvdata->rxtxif_irq < 0)
>> +			return -ENODEV;
>> +
>> +		ret = devm_request_irq(&pdev->dev, drvdata->rxtxif_irq,
>> +				lpass_platform_rxtxif_irq, IRQF_TRIGGER_RISING,
>> +				"lpass-irq-rxtxif", drvdata);
>> +		if (ret) {
>> +			dev_err(&pdev->dev, "rxtx irq request failed: %d\n", ret);
>> +			return ret;
>> +		}
>> +
>> +		ret = lpass_platform_alloc_rxtx_dmactl_fields(&pdev->dev,
>> +						 drvdata->rxtx_lpaif_map);
>> +		if (ret) {
>> +			dev_err(&pdev->dev,
>> +				"error initializing rxtx dmactl fields: %d\n", ret);
>> +			return ret;
>> +		}
>> +
>> +		drvdata->vaif_irq = platform_get_irq_byname(pdev, "lpass-irq-vaif");
>> +		if (drvdata->vaif_irq < 0)
>> +			return -ENODEV;
>> +
>> +		ret = devm_request_irq(&pdev->dev, drvdata->vaif_irq,
>> +				lpass_platform_vaif_irq, IRQF_TRIGGER_RISING,
>> +				"lpass-irq-vaif", drvdata);
>> +		if (ret) {
>> +			dev_err(&pdev->dev, "va irq request failed: %d\n", ret);
>> +			return ret;
>> +		}
>> +
>> +		ret = lpass_platform_alloc_va_dmactl_fields(&pdev->dev,
>> +						 drvdata->va_lpaif_map);
>> +		if (ret) {
>> +			dev_err(&pdev->dev,
>> +				"error initializing va dmactl fields: %d\n", ret);
>> +			return ret;
>> +		}
>> +	}
>> +
>>   	if (drvdata->hdmi_port_enable) {
>>   		drvdata->hdmiif_irq = platform_get_irq_byname(pdev, "lpass-irq-hdmi");
>>   		if (drvdata->hdmiif_irq < 0)
>> -- 
>> Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
>> is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.
>>
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

