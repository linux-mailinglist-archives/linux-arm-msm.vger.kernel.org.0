Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CA7141F289
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Oct 2021 18:52:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240982AbhJAQyV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Oct 2021 12:54:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232094AbhJAQyU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Oct 2021 12:54:20 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69A91C06177E
        for <linux-arm-msm@vger.kernel.org>; Fri,  1 Oct 2021 09:52:36 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id v19so6956881pjh.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Oct 2021 09:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=B9JRnpnzyxG2nP5T86XeSaWXclNSjrYmASL3XpSJd8w=;
        b=lGkY1nEzWYLgETEgZE5BqJRxE0lcEYa27xwcGl8G015eHsLD/NfFvgCO4JyhTN8hSD
         zVPDZc+nRDjRfDh8VCLw2jmflUqRVCOyDl8cMDomg0D9djazgYChjjBkQkLs/NleZ4be
         jHucjFLr+ylqI2gDn8xpaYqNpqHDzNJ0NC5BY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=B9JRnpnzyxG2nP5T86XeSaWXclNSjrYmASL3XpSJd8w=;
        b=jyRqB0bQAdb5hgnetf4hr6yq02XKE3gqjp8A/91NAg2J7fWzjkdqjVQML4F9PPdMgn
         /b0zcl+nbUKUWe10HlYFINjJYRpSZpuZONaP72LBQhFqkT2xBHmhrZHxhKHyCCcii9iW
         UGwb9BfqwELEst2iDwtHjuoYO91ZbCa/zH+v/qGKU8NVDS+Id7YqaCIwE49qSSzUbB12
         CGaXZpvG4/eEjWS2buIAE35we31O3tFW7xCkxaM6h+Q2+QQiZA//IYCc4ISN/WYHRREL
         WjiWabE26Kpcs9bQ+RcHgVMT8QrfpbS4XtbfWdhWu49q/lDPmvrwDDOn2dQvogaKXorj
         6hRw==
X-Gm-Message-State: AOAM530kp3QaR6fLoh+xNz+RmwXsvwMp9f1Mh5iXqaEiF1e0245cEFDk
        +NGMrdC4zC+q+iF44y1JoGubiw==
X-Google-Smtp-Source: ABdhPJzpjDJZme7REyCKMA97ajepds6T64hi0LW3fPEW6NNgOpg0OlOiBsGCx1ZQ+pGlNLreYoHFyA==
X-Received: by 2002:a17:90b:3841:: with SMTP id nl1mr14208296pjb.206.1633107155660;
        Fri, 01 Oct 2021 09:52:35 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:f57f:9f3a:1408:a801])
        by smtp.gmail.com with UTF8SMTPSA id g27sm7010350pfk.173.2021.10.01.09.52.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Oct 2021 09:52:35 -0700 (PDT)
Date:   Fri, 1 Oct 2021 09:52:33 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
        bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
        srinivas.kandagatla@linaro.org, rohitkr@codeaurora.org,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        swboyd@chromium.org, judyhsiao@chromium.org,
        Venkata Prasad Potturu <potturu@codeaurora.org>
Subject: Re: [PATCH 5/8] ASoC: qcom: Add support for codec dma driver
Message-ID: <YVc80cNQS+CHfbpV@google.com>
References: <1633087292-1378-1-git-send-email-srivasam@codeaurora.org>
 <1633087292-1378-6-git-send-email-srivasam@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1633087292-1378-6-git-send-email-srivasam@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Oct 01, 2021 at 04:51:29PM +0530, Srinivasa Rao Mandadapu wrote:
> Upadate lpass cpu and platform driver to support audio over codec dma
> in ADSP bypass use case.
> 
> Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> ---
>  sound/soc/qcom/lpass-cpu.c      | 312 ++++++++++++++++++++++++-
>  sound/soc/qcom/lpass-platform.c | 499 +++++++++++++++++++++++++++++++++++++---
>  2 files changed, 773 insertions(+), 38 deletions(-)
> 
> diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
> index 3bd9eb3..c8dec52 100644
> --- a/sound/soc/qcom/lpass-cpu.c
> +++ b/sound/soc/qcom/lpass-cpu.c
> @@ -798,6 +798,251 @@ static struct regmap_config lpass_hdmi_regmap_config = {
>  	.cache_type = REGCACHE_FLAT,
>  };
>  
> +static bool lpass_rxtx_regmap_writeable(struct device *dev, unsigned int reg)
> +{
> +	struct lpass_data *drvdata = dev_get_drvdata(dev);
> +	struct lpass_variant *v = drvdata->variant;
> +	int i;
> +
> +	for (i = 0; i < v->rxtx_irq_ports; ++i) {
> +		if (reg == LPAIF_RXTX_IRQCLEAR_REG(v, i, LPASS_CDC_DMA_RX0))
> +			return true;
> +		if (reg == LPAIF_RXTX_IRQEN_REG(v, i, LPASS_CDC_DMA_RX0))
> +			return true;
> +		if (reg == LPAIF_RXTX_IRQSTAT_REG(v, i, LPASS_CDC_DMA_RX0))
> +			return true;
> +	}
> +
> +	for (i = 0; i < v->rxtx_rdma_channels; ++i) {
> +		if (reg == LPAIF_CDC_RDMACTL_REG(v, i, LPASS_CDC_DMA_RX0))
> +			return true;
> +		if (reg == LPAIF_CDC_RDMABASE_REG(v, i, LPASS_CDC_DMA_RX0))
> +			return true;
> +		if (reg == LPAIF_CDC_RDMABUFF_REG(v, i, LPASS_CDC_DMA_RX0))
> +			return true;
> +		if (reg == LPAIF_CDC_RDMAPER_REG(v, i, LPASS_CDC_DMA_RX0))
> +			return true;
> +		if (reg == LPAIF_CDC_RDMA_INTF_REG(v, i, LPASS_CDC_DMA_RX0))
> +			return true;
> +	}
> +
> +	for (i = 0; i < v->rxtx_wrdma_channels; ++i) {
> +		if (reg == LPAIF_CDC_WRDMACTL_REG(v, i + v->rxtx_wrdma_channel_start,
> +							LPASS_CDC_DMA_TX3))
> +			return true;
> +		if (reg == LPAIF_CDC_WRDMABASE_REG(v, i + v->rxtx_wrdma_channel_start,
> +							LPASS_CDC_DMA_TX3))
> +			return true;
> +		if (reg == LPAIF_CDC_WRDMABUFF_REG(v, i + v->rxtx_wrdma_channel_start,
> +							LPASS_CDC_DMA_TX3))
> +			return true;
> +		if (reg == LPAIF_CDC_WRDMAPER_REG(v, i + v->rxtx_wrdma_channel_start,
> +							LPASS_CDC_DMA_TX3))
> +			return true;
> +		if (reg == LPAIF_CDC_WRDMA_INTF_REG(v, i + v->rxtx_wrdma_channel_start,
> +							LPASS_CDC_DMA_TX3))
> +			return true;
> +	}
> +
> +	return false;
> +}
> +
> +static bool lpass_rxtx_regmap_readable(struct device *dev, unsigned int reg)
> +{
> +	struct lpass_data *drvdata = dev_get_drvdata(dev);
> +	struct lpass_variant *v = drvdata->variant;
> +	int i;
> +
> +	for (i = 0; i < v->rxtx_irq_ports; ++i) {
> +		if (reg == LPAIF_RXTX_IRQCLEAR_REG(v, i, LPASS_CDC_DMA_RX0))
> +			return true;
> +		if (reg == LPAIF_RXTX_IRQEN_REG(v, i, LPASS_CDC_DMA_RX0))
> +			return true;
> +		if (reg == LPAIF_RXTX_IRQSTAT_REG(v, i, LPASS_CDC_DMA_RX0))
> +			return true;
> +	}
> +
> +	for (i = 0; i < v->rxtx_rdma_channels; ++i) {
> +		if (reg == LPAIF_CDC_RDMACTL_REG(v, i, LPASS_CDC_DMA_RX0))
> +			return true;
> +		if (reg == LPAIF_CDC_RDMABASE_REG(v, i, LPASS_CDC_DMA_RX0))
> +			return true;
> +		if (reg == LPAIF_CDC_RDMABUFF_REG(v, i, LPASS_CDC_DMA_RX0))
> +			return true;
> +		if (reg == LPAIF_CDC_RDMACURR_REG(v, i, LPASS_CDC_DMA_RX0))
> +			return true;
> +		if (reg == LPAIF_CDC_RDMAPER_REG(v, i, LPASS_CDC_DMA_RX0))
> +			return true;
> +		if (reg == LPAIF_CDC_RDMA_INTF_REG(v, i, LPASS_CDC_DMA_RX0))
> +			return true;
> +	}
> +
> +	for (i = 0; i < v->rxtx_wrdma_channels; ++i) {
> +		if (reg == LPAIF_CDC_WRDMACTL_REG(v, i + v->rxtx_wrdma_channel_start,
> +							LPASS_CDC_DMA_TX3))
> +			return true;
> +		if (reg == LPAIF_CDC_WRDMABASE_REG(v, i + v->rxtx_wrdma_channel_start,
> +							LPASS_CDC_DMA_TX3))
> +			return true;
> +		if (reg == LPAIF_CDC_WRDMABUFF_REG(v, i + v->rxtx_wrdma_channel_start,
> +							LPASS_CDC_DMA_TX3))
> +			return true;
> +		if (reg == LPAIF_CDC_WRDMACURR_REG(v, i + v->rxtx_wrdma_channel_start,
> +							LPASS_CDC_DMA_TX3))
> +			return true;
> +		if (reg == LPAIF_CDC_WRDMAPER_REG(v, i + v->rxtx_wrdma_channel_start,
> +							LPASS_CDC_DMA_TX3))
> +			return true;
> +		if (reg == LPAIF_CDC_WRDMA_INTF_REG(v, i + v->rxtx_wrdma_channel_start,
> +							LPASS_CDC_DMA_TX3))
> +			return true;
> +	}
> +
> +	return false;
> +}

lpass_rxtx_regmap_readable() is almost the same as lpass_rxtx_regmap_writeable(),
except for LPAIF_CDC_RDMACURR_REG and LPAIF_CDC_WRDMACURR_REG. Add something like

static bool __lpass_rxtx_regmap_accessible(struct device *dev, unsigned int reg, bool rw)

which would look essentially like lpass_rxtx_regmap_readable() but checks the
'rw' parameter for LPAIF_CDC_RDMACURR_REG and LPAIF_CDC_WRDMACURR_REG.
lpass_rxtx_regmap_readable() and lpass_rxtx_regmap_writeable() then call this
function with the corresponding value for 'rw'

> +
> +static bool lpass_rxtx_regmap_volatile(struct device *dev, unsigned int reg)
> +{
> +	struct lpass_data *drvdata = dev_get_drvdata(dev);
> +	struct lpass_variant *v = drvdata->variant;
> +	int i;
> +
> +	for (i = 0; i < v->rxtx_irq_ports; ++i) {
> +		if (reg == LPAIF_RXTX_IRQCLEAR_REG(v, i, LPASS_CDC_DMA_RX0))
> +			return true;
> +		if (reg == LPAIF_RXTX_IRQSTAT_REG(v, i, LPASS_CDC_DMA_RX0))
> +			return true;
> +	}
> +
> +	for (i = 0; i < v->rxtx_rdma_channels; ++i)
> +		if (reg == LPAIF_CDC_RDMACURR_REG(v, i, LPASS_CDC_DMA_RX0))
> +			return true;
> +
> +	for (i = 0; i < v->rxtx_wrdma_channels; ++i)
> +		if (reg == LPAIF_CDC_WRDMACURR_REG(v, i + v->rxtx_wrdma_channel_start,
> +							LPASS_CDC_DMA_TX3))
> +			return true;
> +
> +	return false;
> +}
> +
> +static bool lpass_va_regmap_writeable(struct device *dev, unsigned int reg)
> +{
> +	struct lpass_data *drvdata = dev_get_drvdata(dev);
> +	struct lpass_variant *v = drvdata->variant;
> +	int i;
> +
> +	for (i = 0; i < v->va_irq_ports; ++i) {
> +		if (reg == LPAIF_RXTX_IRQCLEAR_REG(v, i, LPASS_CDC_DMA_VA_TX0))
> +			return true;
> +		if (reg == LPAIF_RXTX_IRQEN_REG(v, i, LPASS_CDC_DMA_VA_TX0))
> +			return true;
> +		if (reg == LPAIF_RXTX_IRQSTAT_REG(v, i, LPASS_CDC_DMA_VA_TX0))
> +			return true;
> +	}
> +
> +	for (i = 0; i < v->va_wrdma_channels; ++i) {
> +		if (reg == LPAIF_CDC_WRDMACTL_REG(v, i + v->va_wrdma_channel_start,
> +							LPASS_CDC_DMA_VA_TX0))
> +			return true;
> +		if (reg == LPAIF_CDC_WRDMABASE_REG(v, i + v->va_wrdma_channel_start,
> +							LPASS_CDC_DMA_VA_TX0))
> +			return true;
> +		if (reg == LPAIF_CDC_WRDMABUFF_REG(v, i + v->va_wrdma_channel_start,
> +							LPASS_CDC_DMA_VA_TX0))
> +			return true;
> +		if (reg == LPAIF_CDC_WRDMAPER_REG(v, i + v->va_wrdma_channel_start,
> +							LPASS_CDC_DMA_VA_TX0))
> +			return true;
> +		if (reg == LPAIF_CDC_WRDMA_INTF_REG(v, i + v->va_wrdma_channel_start,
> +							LPASS_CDC_DMA_VA_TX0))
> +			return true;
> +	}
> +
> +	return false;
> +}
> +
> +static bool lpass_va_regmap_readable(struct device *dev, unsigned int reg)
> +{
> +	struct lpass_data *drvdata = dev_get_drvdata(dev);
> +	struct lpass_variant *v = drvdata->variant;
> +	int i;
> +
> +	for (i = 0; i < v->va_irq_ports; ++i) {
> +		if (reg == LPAIF_RXTX_IRQCLEAR_REG(v, i, LPASS_CDC_DMA_VA_TX0))
> +			return true;
> +		if (reg == LPAIF_RXTX_IRQEN_REG(v, i, LPASS_CDC_DMA_VA_TX0))
> +			return true;
> +		if (reg == LPAIF_RXTX_IRQSTAT_REG(v, i, LPASS_CDC_DMA_VA_TX0))
> +			return true;
> +	}
> +
> +	for (i = 0; i < v->va_wrdma_channels; ++i) {
> +		if (reg == LPAIF_CDC_WRDMACTL_REG(v, i + v->va_wrdma_channel_start,
> +							LPASS_CDC_DMA_VA_TX0))
> +			return true;
> +		if (reg == LPAIF_CDC_WRDMABASE_REG(v, i + v->va_wrdma_channel_start,
> +							LPASS_CDC_DMA_VA_TX0))
> +			return true;
> +		if (reg == LPAIF_CDC_WRDMABUFF_REG(v, i + v->va_wrdma_channel_start,
> +							LPASS_CDC_DMA_VA_TX0))
> +			return true;
> +		if (reg == LPAIF_CDC_WRDMACURR_REG(v, i + v->va_wrdma_channel_start,
> +							LPASS_CDC_DMA_VA_TX0))
> +			return true;
> +		if (reg == LPAIF_CDC_WRDMAPER_REG(v, i + v->va_wrdma_channel_start,
> +							LPASS_CDC_DMA_VA_TX0))
> +			return true;
> +		if (reg == LPAIF_CDC_WRDMA_INTF_REG(v, i + v->va_wrdma_channel_start,
> +							LPASS_CDC_DMA_VA_TX0))
> +			return true;
> +	}
> +
> +	return false;
> +}

Same as for lpass_rxtx_regmap_readable/writable()

> +
> +static bool lpass_va_regmap_volatile(struct device *dev, unsigned int reg)
> +{
> +	struct lpass_data *drvdata = dev_get_drvdata(dev);
> +	struct lpass_variant *v = drvdata->variant;
> +	int i;
> +
> +	for (i = 0; i < v->va_irq_ports; ++i) {
> +		if (reg == LPAIF_RXTX_IRQCLEAR_REG(v, i, LPASS_CDC_DMA_VA_TX0))
> +			return true;
> +		if (reg == LPAIF_RXTX_IRQSTAT_REG(v, i, LPASS_CDC_DMA_VA_TX0))
> +			return true;
> +	}
> +
> +	for (i = 0; i < v->va_wrdma_channels; ++i) {
> +		if (reg == LPAIF_CDC_WRDMACURR_REG(v, i + v->va_wrdma_channel_start,
> +							LPASS_CDC_DMA_VA_TX0))
> +			return true;
> +	}
> +
> +	return false;
> +}
> +
> +static struct regmap_config lpass_rxtx_regmap_config = {
> +	.reg_bits = 32,
> +	.reg_stride = 4,
> +	.val_bits = 32,
> +	.writeable_reg = lpass_rxtx_regmap_writeable,
> +	.readable_reg = lpass_rxtx_regmap_readable,
> +	.volatile_reg = lpass_rxtx_regmap_volatile,
> +	.cache_type = REGCACHE_FLAT,
> +};
> +
> +static struct regmap_config lpass_va_regmap_config = {
> +	.reg_bits = 32,
> +	.reg_stride = 4,
> +	.val_bits = 32,
> +	.writeable_reg = lpass_va_regmap_writeable,
> +	.readable_reg = lpass_va_regmap_readable,
> +	.volatile_reg = lpass_va_regmap_volatile,
> +	.cache_type = REGCACHE_FLAT,
> +};
> +
>  static unsigned int of_lpass_cpu_parse_sd_lines(struct device *dev,
>  						struct device_node *node,
>  						const char *name)
> @@ -837,6 +1082,17 @@ static unsigned int of_lpass_cpu_parse_sd_lines(struct device *dev,
>  	}
>  }
>  
> +static bool is_cdc_dma_port(int dai_id)
> +{
> +	switch (dai_id) {
> +	case LPASS_CDC_DMA_RX0:
> +	case LPASS_CDC_DMA_TX3:
> +	case LPASS_CDC_DMA_VA_TX0:
> +		return true;
> +	default:
> +		return false;
> +	}
> +}
>  static void of_lpass_cpu_parse_dai_data(struct device *dev,
>  					struct lpass_data *data)
>  {
> @@ -857,7 +1113,9 @@ static void of_lpass_cpu_parse_dai_data(struct device *dev,
>  		}
>  		if (id == LPASS_DP_RX) {
>  			data->hdmi_port_enable = 1;
> -		} else {
> +		} else if (is_cdc_dma_port(id))
> +			data->wcd_codec_enable = 1;
> +		else {
>  			data->mi2s_playback_sd_mode[id] =
>  				of_lpass_cpu_parse_sd_lines(dev, node,
>  							    "qcom,playback-sd-lines");
> @@ -897,6 +1155,53 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
>  
>  	of_lpass_cpu_parse_dai_data(dev, drvdata);
>  
> +	drvdata->num_clks =  variant->num_clks;
> +	if (drvdata->wcd_codec_enable) {
> +		drvdata->rxtx_lpaif =
> +				devm_platform_ioremap_resource_byname(pdev, "lpass-rxtx-lpaif");
> +		if (IS_ERR(drvdata->rxtx_lpaif))
> +			return PTR_ERR(drvdata->rxtx_lpaif);
> +
> +		drvdata->va_lpaif = devm_platform_ioremap_resource_byname(pdev, "lpass-va-lpaif");
> +		if (IS_ERR(drvdata->va_lpaif))
> +			return PTR_ERR(drvdata->va_lpaif);
> +
> +		lpass_rxtx_regmap_config.max_register = LPAIF_CDC_WRDMAPER_REG(variant,
> +					variant->rxtx_wrdma_channels +
> +					variant->rxtx_wrdma_channel_start, LPASS_CDC_DMA_TX3);
> +
> +		drvdata->rxtx_lpaif_map = devm_regmap_init_mmio(dev, drvdata->rxtx_lpaif,
> +					&lpass_rxtx_regmap_config);
> +		if (IS_ERR(drvdata->rxtx_lpaif_map)) {
> +			dev_err(dev, "error initializing regmap: %ld\n",

The same error is logged a few lines below, you might want to log which regmap
couldn't be initialized.

> +			PTR_ERR(drvdata->rxtx_lpaif_map));

fix indentation

> +			return PTR_ERR(drvdata->rxtx_lpaif_map);
> +		}
> +		lpass_va_regmap_config.max_register = LPAIF_CDC_WRDMAPER_REG(variant,
> +					variant->va_wrdma_channels +
> +					variant->va_wrdma_channel_start, LPASS_CDC_DMA_VA_TX0);
> +
> +		drvdata->va_lpaif_map = devm_regmap_init_mmio(dev, drvdata->va_lpaif,
> +					&lpass_va_regmap_config);
> +		if (IS_ERR(drvdata->va_lpaif_map)) {
> +			dev_err(dev, "error initializing regmap: %ld\n",

see above

> +			PTR_ERR(drvdata->va_lpaif_map));

fix indentation

> +			return PTR_ERR(drvdata->va_lpaif_map);
> +		}
> +		drvdata->cdc_num_clks =  variant->cdc_dma_num_clks;
> +		for (i = 0; i < variant->cdc_dma_num_clks; i++) {
> +			drvdata->cdc_dma_clks[i] = devm_clk_get(dev,
> +							variant->cdc_dma_clk_names[i]);
> +			if (IS_ERR(drvdata->cdc_dma_clks[i])) {
> +	vdata->lpaif_map;
> +		}
>  	}
>  
>  	ret = regmap_write(map, LPAIF_DMABASE_REG(v, ch, dir, dai_id),
> @@ -423,6 +578,16 @@ static int lpass_platform_pcmops_prepare(struct snd_soc_component *component,
>  		return ret;
>  	}
>  
> +	if (dai_id == LPASS_CDC_DMA_RX0 ||
> +		dai_id == LPASS_CDC_DMA_TX3 ||
> +		dai_id == LPASS_CDC_DMA_VA_TX0) {
> +		ret = regmap_fields_write(dmactl->fifowm, id, LPAIF_DMACTL_FIFOWM_8);
> +		if (ret) {
> +			dev_err(soc_runtime->dev, "error writing fifowm field to dmactl reg: %d, id: %d\n",
> +				ret, id);
> +			return ret;
> +		}
> +	}
>  	ret = regmap_fields_write(dmactl->enable, id, LPAIF_DMACTL_ENABLE_ON);
>  	if (ret) {
>  		dev_err(soc_runtime->dev, "error writing to rdmactl reg: %d\n",
> @@ -457,14 +622,27 @@ static int lpass_platform_pcmops_trigger(struct snd_soc_component *component,
>  		if (dai_id == LPASS_DP_RX) {
>  			dmactl = drvdata->hdmi_rd_dmactl;
>  			map = drvdata->hdmiif_map;
> +		} else if (dai_id == LPASS_CDC_DMA_RX0) {
> +			map = drvdata->rxtx_lpaif_map;
> +			dmactl = drvdata->rxtx_rd_dmactl;
>  		} else {
>  			dmactl = drvdata->rd_dmactl;
>  			map = drvdata->lpaif_map;
>  		}
>  	} else {
> -		dmactl = drvdata->wr_dmactl;
> -		id = pcm_data->dma_ch - v->wrdma_channel_start;
> -		map = drvdata->lpaif_map;
> +		if (dai_id == LPASS_CDC_DMA_TX3) {
> +			dmactl = drvdata->rxtx_wr_dmactl;
> +			map = drvdata->rxtx_lpaif_map;
> +			id = pcm_data->dma_ch - v->rxtx_wrdma_channel_start;
> +		} else if (dai_id == LPASS_CDC_DMA_VA_TX0) {
> +			dmactl = drvdata->va_wr_dmactl;
> +			map = drvdata->va_lpaif_map;
> +			id = pcm_data->dma_ch - v->va_wrdma_channel_start;
> +		} else {
> +			dmactl = drvdata->wr_dmactl;
> +			id = pcm_data->dma_ch - v->wrdma_channel_start;
> +			map = drvdata->lpaif_map;
> +		}


As for "[4/8] ASoC: qcom: Add lapss CPU driver for codec dma control", I think
you want a helper that encapsulates the above, instead of open coding it
multiple times in the driver.

>  	}
>  
>  	switch (cmd) {
> @@ -479,6 +657,24 @@ static int lpass_platform_pcmops_trigger(struct snd_soc_component *component,
>  			return ret;
>  		}
>  		switch (dai_id) {
> +		case LPASS_CDC_DMA_RX0:
> +		case LPASS_CDC_DMA_TX3:
> +		case LPASS_CDC_DMA_VA_TX0:
> +			ret = regmap_fields_write(dmactl->dyncclk, id, LPAIF_DMACTL_DYNCLK_ON);
> +			if (ret) {
> +				dev_err(soc_runtime->dev,
> +					"error writing to rdmactl reg field: %d\n", ret);
> +				return ret;
> +			}
> +			map = (dai_id == LPASS_CDC_DMA_VA_TX0) ?
> +				drvdata->va_lpaif_map : drvdata->rxtx_lpaif_map;

'map' was already assigned earlier.

> +			reg_irqclr = LPAIF_RXTX_IRQCLEAR_REG(v, LPAIF_IRQ_PORT_HOST, dai_id);
> +			val_irqclr = LPAIF_IRQ_ALL(ch);
> +
> +			reg_irqen = LPAIF_RXTX_IRQEN_REG(v, LPAIF_IRQ_PORT_HOST, dai_id);
> +			val_mask = LPAIF_IRQ_ALL(ch);
> +			val_irqen = LPAIF_IRQ_ALL(ch);
> +			break;
>  		case LPASS_DP_RX:
>  			ret = regmap_fields_write(dmactl->dyncclk, id,
>  					 LPAIF_DMACTL_DYNCLK_ON);
> @@ -543,6 +739,26 @@ static int lpass_platform_pcmops_trigger(struct snd_soc_component *component,
>  			return ret;
>  		}
>  		switch (dai_id) {
> +		case LPASS_CDC_DMA_RX0:
> +		case LPASS_CDC_DMA_TX3:
> +		case LPASS_CDC_DMA_VA_TX0:
> +			ret = regmap_fields_write(dmactl->dyncclk, id, LPAIF_DMACTL_DYNCLK_OFF);
> +			if (ret) {
> +				dev_err(soc_runtime->dev,
> +					"error writing to rdmactl reg field: %d\n", ret);
> +				return ret;
> +			}
> +			map = (dai_id == LPASS_CDC_DMA_VA_TX0) ?
> +				drvdata->va_lpaif_map : drvdata->rxtx_lpaif_map;

ditto

> +
> +			reg_irqclr = LPAIF_RXTX_IRQCLEAR_REG(v, LPAIF_IRQ_PORT_HOST, dai_id);
> +			val_irqclr = LPAIF_IRQ_ALL(ch);
> +
> +			reg_irqen = LPAIF_RXTX_IRQEN_REG(v, LPAIF_IRQ_PORT_HOST, dai_id);
> +			val_mask = LPAIF_IRQ_ALL(ch);
> +			val_irqen = LPAIF_IRQ_ALL(ch);
> +
> +		break;
>  		case LPASS_DP_RX:
>  			ret = regmap_fields_write(dmactl->dyncclk, id,
>  					 LPAIF_DMACTL_DYNCLK_OFF);
> @@ -601,6 +817,12 @@ static snd_pcm_uframes_t lpass_platform_pcmops_pointer(
>  
>  	if (dai_id == LPASS_DP_RX)
>  		map = drvdata->hdmiif_map;
> +	else if (dai_id == LPASS_CDC_DMA_RX0 ||
> +		dai_id == LPASS_CDC_DMA_TX3 ||
> +		dai_id == LPASS_CDC_DMA_VA_TX0)
> +		map = (dai_id == LPASS_CDC_DMA_VA_TX0) ?
> +			drvdata->va_lpaif_map :
> +			drvdata->rxtx_lpaif_map;
>  	else
>  		map = drvdata->lpaif_map;

use helper to get map from dai id

>  
> @@ -625,12 +847,39 @@ static snd_pcm_uframes_t lpass_platform_pcmops_pointer(
>  	return bytes_to_frames(substream->runtime, curr_addr - base_addr);
>  }
>  
> +static int lpass_platform_cdc_dma_mmap(struct snd_soc_component *component,
> +			struct snd_pcm_substream *substream,
> +			struct vm_area_struct *vma)
> +{
> +	struct snd_pcm_runtime *runtime = substream->runtime;
> +	unsigned long size, offset;
> +	int ret;
> +
> +	vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
> +	size = vma->vm_end - vma->vm_start;
> +	offset = vma->vm_pgoff << PAGE_SHIFT;
> +	ret = io_remap_pfn_range(vma, vma->vm_start,
> +			(runtime->dma_addr + offset) >> PAGE_SHIFT,
> +			size, vma->vm_page_prot);
> +
> +	return ret;

no need for 'ret' just 'return io_remap_pfn_range(...);'

> +}
> +
>  static int lpass_platform_pcmops_mmap(struct snd_soc_component *component,
>  				      struct snd_pcm_substream *substream,
>  				      struct vm_area_struct *vma)
>  {
>  	struct snd_pcm_runtime *runtime = substream->runtime;
> +	struct snd_soc_pcm_runtime *soc_runtime = asoc_substream_to_rtd(substream);
> +	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(soc_runtime, 0);
> +	unsigned int dai_id = cpu_dai->driver->id;
>  
> +	if (dai_id == LPASS_CDC_DMA_RX0 ||
> +		dai_id == LPASS_CDC_DMA_TX3 ||
> +		dai_id == LPASS_CDC_DMA_VA_TX0) {
> +		lpass_platform_cdc_dma_mmap(component, substream, vma);
> +		return 0;
> +	}
>  	return dma_mmap_coherent(component->dev, vma, runtime->dma_area,
>  				 runtime->dma_addr, runtime->dma_bytes);
>  }
> @@ -651,6 +900,14 @@ static irqreturn_t lpass_dma_interrupt_handler(
>  
>  	mask = LPAIF_IRQ_ALL(chan);
>  	switch (dai_id) {
> +	case LPASS_CDC_DMA_RX0:
> +	case LPASS_CDC_DMA_TX3:
> +	case LPASS_CDC_DMA_VA_TX0:
> +		map = (dai_id == LPASS_CDC_DMA_VA_TX0) ?
> +				drvdata->va_lpaif_map : drvdata->rxtx_lpaif_map;
> +		reg = LPAIF_RXTX_IRQCLEAR_REG(v, LPAIF_IRQ_PORT_HOST, dai_id);
> +		val = 0;
> +		break;
>  	case LPASS_DP_RX:
>  		map = drvdata->hdmiif_map;
>  		reg = LPASS_HDMITX_APP_IRQCLEAR_REG(v);
> @@ -774,41 +1031,131 @@ static irqreturn_t lpass_platform_hdmiif_irq(int irq, void *data)
>  				return rv;
>  		}
>  	}
> +	return IRQ_HANDLED;
> +}
> +
> +static irqreturn_t lpass_platform_rxtxif_irq(int irq, void *data)
> +{
> +	struct lpass_data *drvdata = data;
> +	struct lpass_variant *v = drvdata->variant;
> +	unsigned int irqs;
> +	int rv, chan;
> +
> +	rv = regmap_read(drvdata->rxtx_lpaif_map,
> +			LPAIF_RXTX_IRQSTAT_REG(v, LPAIF_IRQ_PORT_HOST, LPASS_CDC_DMA_RX0), &irqs);
> +	if (rv)
> +		return IRQ_NONE;
> +	/* Handle per channel interrupts */
> +	for (chan = 0; chan < LPASS_MAX_CDC_DMA_CHANNELS; chan++) {
> +		if (irqs & LPAIF_IRQ_ALL(chan) && drvdata->rxtx_substream[chan]) {
> +			rv = lpass_dma_interrupt_handler(
> +						drvdata->rxtx_substream[chan],
> +						drvdata, chan, irqs);
> +			if (rv != IRQ_HANDLED)
> +				return rv;
> +		}
> +	}
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static irqreturn_t lpass_platform_vaif_irq(int irq, void *data)
> +{
> +	struct lpass_data *drvdata = data;
> +	struct lpass_variant *v = drvdata->variant;
> +	unsigned int irqs;
> +	int rv, chan;
>  
> +	rv = regmap_read(drvdata->va_lpaif_map,
> +			LPAIF_RXTX_IRQSTAT_REG(v, LPAIF_IRQ_PORT_HOST,
> +			LPASS_CDC_DMA_VA_TX0), &irqs);
> +	if (rv)
> +		return IRQ_NONE;
> +	/* Handle per channel interrupts */
> +	for (chan = 0; chan < LPASS_MAX_VA_CDC_DMA_CHANNELS; chan++) {
> +		if (irqs & LPAIF_IRQ_ALL(chan) && drvdata->va_substream[chan]) {
> +			rv = lpass_dma_interrupt_handler(
> +						drvdata->va_substream[chan],
> +						drvdata, chan, irqs);
> +			if (rv != IRQ_HANDLED)
> +				return rv;
> +		}
> +	}
>  	return IRQ_HANDLED;
>  }
>  
> +static int lpass_platform_prealloc_cdc_dma_buffer(struct snd_pcm *pcm,
> +			struct snd_pcm_substream *substream, int dai_id)
> +{
> +	struct snd_dma_buffer *buf = &substream->dma_buffer;
> +	int ret;
> +
> +	ret = dma_coerce_mask_and_coherent(pcm->card->dev, DMA_BIT_MASK(64));
> +	if (ret)
> +		return ret;
> +
> +	buf->dev.dev = pcm->card->dev;
> +	buf->private_data = NULL;
> +
> +	/* Assign Codec DMA buffer pointers */
> +	buf->dev.type = SNDRV_DMA_TYPE_CONTINUOUS;
> +	if (dai_id == LPASS_CDC_DMA_RX0) {
> +		buf->bytes = lpass_platform_rxtx_hardware.buffer_bytes_max;
> +		buf->addr = LPSAS_RXTX_CDC_DMA_LPM_ADDR;
> +	} else if (dai_id == LPASS_CDC_DMA_TX3) {
> +		buf->bytes = lpass_platform_rxtx_hardware.buffer_bytes_max;
> +		buf->addr = LPSAS_RXTX_CDC_DMA_LPM_ADDR + LPSAS_RXTX_CDC_DMA_LPM_BUFF_SIZE;
> +	} else if (dai_id == LPASS_CDC_DMA_VA_TX0) {
> +		buf->bytes = lpass_platform_va_hardware.buffer_bytes_max;
> +		buf->addr = LPSAS_VA_CDC_DMA_LPM_ADDR;
> +	}
> +
> +	buf->area = (unsigned char * __force)ioremap(buf->addr, buf->bytes);
> +
> +	return 0;
> +}
> +
>  static int lpass_platform_pcm_new(struct snd_soc_component *component,
>  				  struct snd_soc_pcm_runtime *soc_runtime)
>  {
>  	struct snd_pcm *pcm = soc_runtime->pcm;
>  	struct snd_pcm_substream *psubstream, *csubstream;
>  	int ret;
> +	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(soc_runtime, 0);
> +	unsigned int dai_id = cpu_dai->driver->id;
> +
>  	size_t size = lpass_platform_pcm_hardware.buffer_bytes_max;
>  
>  	psubstream = pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream;
>  	if (psubstream) {
> -		ret = snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV,
> -					component->dev,
> -					size, &psubstream->dma_buffer);
> -		if (ret) {
> -			dev_err(soc_runtime->dev, "Cannot allocate buffer(s)\n");
> -			return ret;
> +		if (dai_id == LPASS_CDC_DMA_RX0) {
> +			lpass_platform_prealloc_cdc_dma_buffer(pcm, psubstream, dai_id);
> +		} else {
> +			ret = snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV,
> +						component->dev,
> +						size, &psubstream->dma_buffer);
> +			if (ret) {
> +				dev_err(soc_runtime->dev, "Cannot allocate buffer(s)\n");
> +				return ret;
> +			}
>  		}
>  	}
>  
>  	csubstream = pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream;
>  	if (csubstream) {
> -		ret = snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV,
> -					component->dev,
> -					size, &csubstream->dma_buffer);
> -		if (ret) {
> -			dev_err(soc_runtime->dev, "Cannot allocate buffer(s)\n");
> -			if (psubstream)
> -				snd_dma_free_pages(&psubstream->dma_buffer);
> -			return ret;
> +		if (dai_id == LPASS_CDC_DMA_TX3 || dai_id == LPASS_CDC_DMA_VA_TX0) {
> +			lpass_platform_prealloc_cdc_dma_buffer(pcm, csubstream, dai_id);
> +		} else {
> +			ret = snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV,
> +						component->dev,
> +						size, &csubstream->dma_buffer);
> +			if (ret) {
> +				dev_err(soc_runtime->dev, "Cannot allocate buffer(s)\n");
> +				if (psubstream)
> +					snd_dma_free_pages(&psubstream->dma_buffer);
> +				return ret;
> +			}
>  		}
> -
>  	}
>  
>  	return 0;
> @@ -818,18 +1165,43 @@ static void lpass_platform_pcm_free(struct snd_soc_component *component,
>  				    struct snd_pcm *pcm)
>  {
>  	struct snd_pcm_substream *substream;
> +	unsigned int dai_id = component->id;
>  	int i;
>  
>  	for_each_pcm_streams(i) {
>  		substream = pcm->streams[i].substream;
>  		if (substream) {
> -			snd_dma_free_pages(&substream->dma_buffer);
> +			if (dai_id == LPASS_CDC_DMA_RX0 ||
> +				dai_id == LPASS_CDC_DMA_TX3 ||
> +				dai_id == LPASS_CDC_DMA_VA_TX0) {
> +				if (substream->dma_buffer.area)
> +					iounmap((void __iomem *)substream->dma_buffer.area);
> +			} else {
> +				snd_dma_free_pages(&substream->dma_buffer);
> +			}
>  			substream->dma_buffer.area = NULL;
>  			substream->dma_buffer.addr = 0;
>  		}
>  	}
>  }
>  
> +int lpass_platform_copy(struct snd_soc_component *component,
> +			 struct snd_pcm_substream *substream, int channel,
> +			 unsigned long pos, void __user *buf, unsigned long bytes)
> +{
> +	struct snd_pcm_runtime *rt = substream->runtime;
> +

delete empty line

> +	unsigned char *dma_buf = rt->dma_area + pos +
> +				channel * (rt->dma_bytes / rt->channels);
> +
> +	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
> +		return copy_from_user_toio(dma_buf, buf, bytes);
> +	else if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
> +		return copy_to_user_fromio(buf, dma_buf, bytes);
> +
> +	return 0;

Can 'substream->stream' have any other value than SNDRV_PCM_STREAM_PLAYBACK or
SNDRV_PCM_STREAM_CAPTURE? If not maybe return -EINVAL here?

> +}
> +
>  static int lpass_platform_pcmops_suspend(struct snd_soc_component *component)
>  {
>  	struct lpass_data *drvdata = snd_soc_component_get_drvdata(component);
> @@ -875,6 +1247,7 @@ static const struct snd_soc_component_driver lpass_component_driver = {
>  	.mmap		= lpass_platform_pcmops_mmap,
>  	.pcm_construct	= lpass_platform_pcm_new,
>  	.pcm_destruct	= lpass_platform_pcm_free,
> +	.copy_user		= lpass_platform_copy,
>  	.suspend		= lpass_platform_pcmops_suspend,
>  	.resume			= lpass_platform_pcmops_resume,
>  
> @@ -914,6 +1287,60 @@ int asoc_qcom_lpass_platform_register(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> +	if (drvdata->wcd_codec_enable) {
> +		ret = regmap_write(drvdata->rxtx_lpaif_map,
> +			LPAIF_RXTX_IRQEN_REG(v, LPAIF_IRQ_PORT_HOST, LPASS_CDC_DMA_TX3), 0x0);
> +		if (ret) {
> +			dev_err(&pdev->dev, "error writing to rxtx irqen reg: %d\n", ret);
> +			return ret;
> +		}
> +		ret = regmap_write(drvdata->va_lpaif_map,
> +			LPAIF_RXTX_IRQEN_REG(v, LPAIF_IRQ_PORT_HOST, LPASS_CDC_DMA_VA_TX0), 0x0);
> +		if (ret) {
> +			dev_err(&pdev->dev, "error writing to rxtx irqen reg: %d\n", ret);
> +			return ret;
> +		}
> +		drvdata->rxtxif_irq = platform_get_irq_byname(pdev, "lpass-irq-rxtxif");
> +		if (drvdata->rxtxif_irq < 0)
> +			return -ENODEV;
> +
> +		ret = devm_request_irq(&pdev->dev, drvdata->rxtxif_irq,
> +				lpass_platform_rxtxif_irq, IRQF_TRIGGER_RISING,
> +				"lpass-irq-rxtxif", drvdata);
> +		if (ret) {
> +			dev_err(&pdev->dev, "rxtx irq request failed: %d\n", ret);
> +			return ret;
> +		}
> +
> +		ret = lpass_platform_alloc_rxtx_dmactl_fields(&pdev->dev,
> +						 drvdata->rxtx_lpaif_map);
> +		if (ret) {
> +			dev_err(&pdev->dev,
> +				"error initializing rxtx dmactl fields: %d\n", ret);
> +			return ret;
> +		}
> +
> +		drvdata->vaif_irq = platform_get_irq_byname(pdev, "lpass-irq-vaif");
> +		if (drvdata->vaif_irq < 0)
> +			return -ENODEV;
> +
> +		ret = devm_request_irq(&pdev->dev, drvdata->vaif_irq,
> +				lpass_platform_vaif_irq, IRQF_TRIGGER_RISING,
> +				"lpass-irq-vaif", drvdata);
> +		if (ret) {
> +			dev_err(&pdev->dev, "va irq request failed: %d\n", ret);
> +			return ret;
> +		}
> +
> +		ret = lpass_platform_alloc_va_dmactl_fields(&pdev->dev,
> +						 drvdata->va_lpaif_map);
> +		if (ret) {
> +			dev_err(&pdev->dev,
> +				"error initializing va dmactl fields: %d\n", ret);
> +			return ret;
> +		}
> +	}
> +
>  	if (drvdata->hdmi_port_enable) {
>  		drvdata->hdmiif_irq = platform_get_irq_byname(pdev, "lpass-irq-hdmi");
>  		if (drvdata->hdmiif_irq < 0)
> -- 
> Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
> is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.
> 
