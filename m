Return-Path: <linux-arm-msm+bounces-53216-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7852BA7BAF3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Apr 2025 12:35:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 51AEF3AAD14
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Apr 2025 10:33:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB00A1B4254;
	Fri,  4 Apr 2025 10:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SdYgJILc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D76919DF66;
	Fri,  4 Apr 2025 10:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743762769; cv=none; b=QK/7OywRfS0iM/EUsCQyvHntAeO73D2B4a4WtMG39hRuEHZ4JyCVpYg++/J3Ldbg80pCtXsPpIXGROaG+LvezRip2L1ieuCLZWwfgXmfU89hoZ7c83g1Ks1FrxEoOPEmEWxvkcXBKrf5NXRMa5G6dricWo8VFLuUi3+1F88HZA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743762769; c=relaxed/simple;
	bh=RnB3hqCazfynhXC46ZCpg6iui2CdO8E5L3mhRcFt/kU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M+E+uOltO6jO817xg2WhfAbulCU7y4tsJUdk2TrNxo+Oe3wRCOe4ch8/hMDqMbOhQs+76/+JXYy3XVMk8LEU+SPE5QdafD/auppq5jC2d69swMX0CeE8aexKmT8dCZzDnw5PLiHuLLDECq60zI+1Jrkfkhf8pH1HwfV2mf9tdT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SdYgJILc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73BA7C4CEDD;
	Fri,  4 Apr 2025 10:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743762769;
	bh=RnB3hqCazfynhXC46ZCpg6iui2CdO8E5L3mhRcFt/kU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SdYgJILcljmS2dEju5a5G3ZhdswondY0YXolrLFuSzHVl1Qu7sD9zklAzlo/oFwlc
	 kBjZSTQObCQUB4lZZLouYFyGkiz3mxdjjnrZq5gDe4ozPtmwRL22f2ERSD2jL58mJ7
	 iHyGfr8tOh37pkOX5FEuYWEoVpIhmf/jqrOsqtZwqHLi1itnkBB6gX0sVsSqqf7zMI
	 MfIK1asSZZwKCgkYryNjmSxoTugZZfiFqJO4UucNsOkTh2zfQeVLAWIYc000+T7qD3
	 QfRGe2lT19kPVgaUiqR5up2BXfQw6202F4Dkdk6UAKuAN8vbOb2wT2FvPxRZdTWLm0
	 ioqcTZUjrp51Q==
Date: Fri, 4 Apr 2025 12:32:46 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Cc: alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, jarkko.nikula@linux.intel.com, linux-i3c@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	andersson@kernel.org, konradybcio@kernel.org
Subject: Re: [PATCH v3 2/3] i3c: master: Add Qualcomm I3C controller driver
Message-ID: <20250404-provocative-mayfly-of-drama-eeddc1@shite>
References: <20250403134644.3935983-1-quic_msavaliy@quicinc.com>
 <20250403134644.3935983-3-quic_msavaliy@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250403134644.3935983-3-quic_msavaliy@quicinc.com>

On Thu, Apr 03, 2025 at 07:16:43PM GMT, Mukesh Kumar Savaliya wrote:
> Add support for the Qualcomm I3C controller driver, which implements
> I3C master functionality as defined in the MIPI Alliance Specification
> for I3C, Version 1.0.
> 
> This driver supports master role in SDR mode.
> 
> Unlike some other I3C master controllers, this implementation
> does not support In-Band Interrupts (IBI) and Hot-join requests.
> 
> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> ---
>  drivers/i3c/master/Kconfig         |   13 +
>  drivers/i3c/master/Makefile        |    1 +
>  drivers/i3c/master/i3c-qcom-geni.c | 1099 ++++++++++++++++++++++++++++
>  3 files changed, 1113 insertions(+)
>  create mode 100644 drivers/i3c/master/i3c-qcom-geni.c
> 
> diff --git a/drivers/i3c/master/Kconfig b/drivers/i3c/master/Kconfig
> index 77da199c7413..30b768df94c9 100644
> --- a/drivers/i3c/master/Kconfig
> +++ b/drivers/i3c/master/Kconfig
> @@ -44,6 +44,19 @@ config SVC_I3C_MASTER
>  	help
>  	  Support for Silvaco I3C Dual-Role Master Controller.
>  
> +config I3C_QCOM_GENI
> +	tristate "Qualcomm Technologies Inc.'s I3C controller driver"
> +	depends on I3C
> +	depends on QCOM_GENI_SE
> +	help
> +	  This driver supports QUPV3 GENI based I3C controller in master
> +	  mode on the Qualcomm Technologies Inc.s SoCs. If you say yes to
> +	  this option, support will be included for the built-in I3C interface
> +	  on the Qualcomm Technologies Inc.s SoCs.
> +
> +	  This driver can also be built as a module.  If so, the module
> +	  will be called i3c-qcom-geni.
> +
>  config MIPI_I3C_HCI
>  	tristate "MIPI I3C Host Controller Interface driver (EXPERIMENTAL)"
>  	depends on I3C
> diff --git a/drivers/i3c/master/Makefile b/drivers/i3c/master/Makefile
> index 3e97960160bc..bc11eecd4692 100644
> --- a/drivers/i3c/master/Makefile
> +++ b/drivers/i3c/master/Makefile
> @@ -4,3 +4,4 @@ obj-$(CONFIG_DW_I3C_MASTER)		+= dw-i3c-master.o
>  obj-$(CONFIG_AST2600_I3C_MASTER)	+= ast2600-i3c-master.o
>  obj-$(CONFIG_SVC_I3C_MASTER)		+= svc-i3c-master.o
>  obj-$(CONFIG_MIPI_I3C_HCI)		+= mipi-i3c-hci/
> +obj-$(CONFIG_I3C_QCOM_GENI)		+= i3c-qcom-geni.o

Did you just add entry to the end of file? No, don't break ordering.
That's a standard rule for most subsystems.

...

> +irqret:
> +	if (m_stat)
> +		writel_relaxed(m_stat, gi3c->se.base + SE_GENI_M_IRQ_CLEAR);
> +
> +	if (dma) {
> +		if (dm_tx_st)
> +			writel_relaxed(dm_tx_st, gi3c->se.base + SE_DMA_TX_IRQ_CLR);
> +		if (dm_rx_st)
> +			writel_relaxed(dm_rx_st, gi3c->se.base + SE_DMA_RX_IRQ_CLR);
> +	}
> +
> +	/* if this is err with done-bit not set, handle that through timeout. */
> +	if (m_stat & M_CMD_DONE_EN || m_stat & M_CMD_ABORT_EN) {
> +		writel_relaxed(0, gi3c->se.base + SE_GENI_TX_WATERMARK_REG);
> +		complete(&gi3c->done);
> +	} else if (dm_tx_st & TX_DMA_DONE || dm_rx_st & RX_DMA_DONE	||
> +		dm_rx_st & RX_RESET_DONE) {
> +		complete(&gi3c->done);
> +	}
> +
> +	spin_unlock_irqrestore(&gi3c->irq_lock, flags);
> +	return IRQ_HANDLED;
> +}
> +
> +static int i3c_geni_runtime_get_mutex_lock(struct geni_i3c_dev *gi3c)
> +{

You miss sparse/lockdep annotations.

> +	int ret;
> +
> +	mutex_lock(&gi3c->lock);
> +	reinit_completion(&gi3c->done);
> +	ret = pm_runtime_get_sync(gi3c->se.dev);
> +	if (ret < 0) {
> +		dev_err(gi3c->se.dev, "error turning on SE resources:%d\n", ret);
> +		pm_runtime_put_noidle(gi3c->se.dev);
> +		/* Set device in suspended since resume failed */
> +		pm_runtime_set_suspended(gi3c->se.dev);
> +		mutex_unlock(&gi3c->lock);

Either you lock or don't lock, don't mix these up.

> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static void i3c_geni_runtime_put_mutex_unlock(struct geni_i3c_dev *gi3c)
> +{

Missing annotations.

> +	pm_runtime_mark_last_busy(gi3c->se.dev);
> +	pm_runtime_put_autosuspend(gi3c->se.dev);
> +	mutex_unlock(&gi3c->lock);
> +}
> +
> +static void geni_i3c_abort_xfer(struct geni_i3c_dev *gi3c)
> +{
> +	unsigned long time_remaining;
> +	unsigned long flags;
> +
> +	reinit_completion(&gi3c->done);
> +	spin_lock_irqsave(&gi3c->irq_lock, flags);
> +	geni_i3c_handle_err(gi3c, GENI_TIMEOUT);
> +	geni_se_abort_m_cmd(&gi3c->se);
> +	spin_unlock_irqrestore(&gi3c->irq_lock, flags);
> +	time_remaining = wait_for_completion_timeout(&gi3c->done, XFER_TIMEOUT);
> +	if (!time_remaining)
> +		dev_err(gi3c->se.dev, "Timeout abort_m_cmd\n");
> +}

...

> +
> +static int i3c_geni_resources_init(struct geni_i3c_dev *gi3c, struct platform_device *pdev)
> +{
> +	int ret;
> +
> +	gi3c->se.base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(gi3c->se.base))
> +		return PTR_ERR(gi3c->se.base);
> +
> +	gi3c->se.clk = devm_clk_get(&pdev->dev, "se");
> +	if (IS_ERR(gi3c->se.clk))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(gi3c->se.clk),
> +							"Unable to get serial engine core clock: %pe\n",
> +							gi3c->se.clk);

Totally messed indentation.

> +	ret = geni_icc_get(&gi3c->se, NULL);
> +	if (ret)
> +		return ret;
> +
> +	/* Set the bus quota to a reasonable value for register access */
> +	gi3c->se.icc_paths[GENI_TO_CORE].avg_bw = GENI_DEFAULT_BW;
> +	gi3c->se.icc_paths[CPU_TO_GENI].avg_bw = GENI_DEFAULT_BW;
> +	ret = geni_icc_set_bw(&gi3c->se);
> +	if (ret)
> +		return ret;
> +
> +	/* Default source clock (se-clock-frequency) freq is 100Mhz */
> +	gi3c->clk_src_freq = KHZ(100000);

And why can't you use clk_get_rate()?

> +
> +	return 0;
> +}
> +
> +static int geni_i3c_probe(struct platform_device *pdev)
> +{
> +	u32 proto, tx_depth, fifo_disable;
> +	struct geni_i3c_dev *gi3c;

Just store pdev->dev in local dev variable, to simplify everything here.

> +	int ret;
> +
> +	gi3c = devm_kzalloc(&pdev->dev, sizeof(*gi3c), GFP_KERNEL);
> +	if (!gi3c)
> +		return -ENOMEM;
> +
> +	gi3c->se.dev = &pdev->dev;
> +	gi3c->se.wrapper = dev_get_drvdata(pdev->dev.parent);
> +
> +	init_completion(&gi3c->done);
> +	mutex_init(&gi3c->lock);
> +	spin_lock_init(&gi3c->irq_lock);
> +	platform_set_drvdata(pdev, gi3c);
> +
> +	ret = i3c_geni_resources_init(gi3c, pdev);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret, "Error Initializing GENI Resources\n");
> +
> +	gi3c->irq = platform_get_irq(pdev, 0);
> +	if (gi3c->irq < 0)
> +		return dev_err_probe(&pdev->dev, gi3c->irq, "Error getting IRQ number for I3C\n");
> +
> +	ret = devm_request_irq(&pdev->dev, gi3c->irq, geni_i3c_irq,
> +			       IRQF_NO_AUTOEN, dev_name(&pdev->dev), gi3c);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret, "Error registering core IRQ\n");
> +
> +	ret = geni_se_resources_on(&gi3c->se);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret, "Error turning resources ON\n");
> +
> +	proto = geni_se_read_proto(&gi3c->se);
> +	if (proto != GENI_SE_I3C) {
> +		geni_se_resources_off(&gi3c->se);
> +		return dev_err_probe(&pdev->dev, -ENXIO, "Invalid proto %d\n", proto);
> +	}
> +
> +	fifo_disable = readl_relaxed(gi3c->se.base + GENI_IF_DISABLE_RO);
> +	if (fifo_disable) {
> +		geni_se_resources_off(&gi3c->se);
> +		return dev_err_probe(&pdev->dev, -ENXIO, "GPI DMA mode not supported\n");
> +	}
> +
> +	tx_depth = geni_se_get_tx_fifo_depth(&gi3c->se);
> +	gi3c->tx_wm = tx_depth - 1;
> +	geni_se_init(&gi3c->se, gi3c->tx_wm, tx_depth);
> +	geni_se_config_packing(&gi3c->se, BITS_PER_BYTE, PACKING_BYTES_PW, true, true, true);
> +	geni_se_resources_off(&gi3c->se);
> +	dev_dbg(&pdev->dev, "i3c fifo/se-dma mode. fifo depth:%d\n", tx_depth);
> +
> +	pm_runtime_set_autosuspend_delay(gi3c->se.dev, I3C_AUTO_SUSPEND_DELAY);
> +	pm_runtime_use_autosuspend(gi3c->se.dev);
> +	pm_runtime_set_active(gi3c->se.dev);
> +	pm_runtime_enable(gi3c->se.dev);
> +
> +	ret = i3c_master_register(&gi3c->ctrlr, &pdev->dev, &geni_i3c_master_ops, false);
> +	if (ret) {
> +		pm_runtime_disable(gi3c->se.dev);
> +		pm_runtime_set_suspended(gi3c->se.dev);
> +		pm_runtime_dont_use_autosuspend(gi3c->se.dev);
> +		return ret;
> +	}
> +
> +	return ret;

return 0;

> +}

Best regards,
Krzysztof


