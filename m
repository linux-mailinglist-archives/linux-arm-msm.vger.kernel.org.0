Return-Path: <linux-arm-msm+bounces-32227-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C3D983D46
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 08:44:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 21401B227C4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 06:44:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00AB67604F;
	Tue, 24 Sep 2024 06:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="whkQAY/7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD6F17BBF
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Sep 2024 06:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727160284; cv=none; b=Ok3TG+EXl10fz4xK27cUJNpOs12RnUpsqtRcueOQSvGZzOVTOmBBqBV4GO2XRc3758a/bUnvh8YZcu/O9puE/FBhNObtBtau6SMj259FTz0R1+0rUiS/sFxFsFVr3TdPMUx9ikLRuHdXapQY2+iO07sQ89XkSvcNX7fzDInet8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727160284; c=relaxed/simple;
	bh=qkVA+8GnWSBbpcFh7+Kzw7Gbzm4sqiceJp9YkI28LoQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pg0mSCZ4hThLnNzrwJGKEJuY4Ut9hHNl/1sLJ2rYzkhW6gIMn+YidSwPtFMZjc53a/8glX9uryxM+4rzE8FXKDgcwTAOdelEAGF+snv/qVNJXnPeaHoDmG+knjF78yJJj4qNQ1/QrGVM0tnZsTMROReLatsVR4yC61G7xNbFXi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=whkQAY/7; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5356bb5522bso6077427e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Sep 2024 23:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727160280; x=1727765080; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WobonbhvLVWVF2SpQIM2Ox9WVV/IkG6i0xq7CuV8wbM=;
        b=whkQAY/7N/nMRfqPcHz/fIkRC8av5Zf8L3uXFimRKdZ93bBEe1FZF+jNrBOd1UOkaR
         oAqlLFFvHKInoX9zo7gqrOfbU/rOIeE4w28e8FJ0pC96EJUSA0PD/pJuZo2eRrgc6Wix
         mo2qst7HPGkyVi0qbhQaH+h1065Bo4JlNKrWkS9r1zgQcaabnb835GDAF4WcD0Aahkem
         cGMCt39E/B8fQlD8+GucmdmHQHVrpbGqDDTZNn9jla9AmTUsOddOpH5Kd0vGreHHecIu
         9LgJG8+iTmwondBkOQJZoEriFAafeEV0adeI2NZayoTqnuMxrjZ1jAAlimQQiKzuw3tq
         ugDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727160280; x=1727765080;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WobonbhvLVWVF2SpQIM2Ox9WVV/IkG6i0xq7CuV8wbM=;
        b=RMNbRp3+JYuBeFP8J4Vau+doprwDRru5+29BW80qlf4ZMh+pYXJUs6ZwldzB7++f1k
         2XeGvlFvlLSC8CDW703fl3kjsm1iAgARzXsndsTAyGwmoXWCt7i9xXPiqJjYQ1ivi9nu
         KmY36FZGBKq3kMgU97w++Yzf3CpOykc3uN6oBYYtmMHN55v90hq7WCMrDXviz+OndgiI
         eoVgtLGe1A8ALLqxvJ1DifiwU2/PjFAZWfcysDmGeLzPiJyWl33j9p+yGsYi3vER1BXS
         56g/gJ8Kc/XFPLhu3IMoGckutm1INA6zzMwc+STzgzRflh60BOOz7mQPVIg5vHdRUbGv
         JMLw==
X-Forwarded-Encrypted: i=1; AJvYcCW3yliG1GjVoZrEl0koET9v7nLFjo5Gcf4VOWLPgtzxhlrz/nSzwNKlE7qffOL8scYg/DXTs5d9mtwueQSx@vger.kernel.org
X-Gm-Message-State: AOJu0YzaZjN48WB6mkzS6K1qo8K5zqWvwWyyITOeJue0a5iDhWBm5Gmc
	hpcnfUCejBDP5Brg+ghBc1hwNuieaZMZAjJ/WXm1ch7sc8gtZlyn2QWFopxx+w8=
X-Google-Smtp-Source: AGHT+IE3ZlISpugtJ0PmRL0uNfnDhM2JMwQjm+V2w6O7hjj/KrsSRtVuh4RZHdbgJYLfPXyNXOJGaA==
X-Received: by 2002:ac2:4c41:0:b0:536:533c:c460 with SMTP id 2adb3069b0e04-536ac3401d2mr6456450e87.50.1727160279634;
        Mon, 23 Sep 2024 23:44:39 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-537a864d905sm107249e87.251.2024.09.23.23.44.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Sep 2024 23:44:39 -0700 (PDT)
Date: Tue, 24 Sep 2024 09:44:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Shivnandan Kumar <quic_kshivnan@quicinc.com>
Cc: Sibi Sankar <quic_sibis@quicinc.com>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	cros-qcom-dts-watchers@chromium.org, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Ramakrishna Gottimukkula <quic_rgottimu@quicinc.com>
Subject: Re: [PATCH 2/3] mailbox: qcom-cpucp-mbox: Add support for SC7280
 CPUCP mailbox controller
Message-ID: <txdkvdzqiqevwripzxljaxictuy2kn6jbk3hoolj3vgth67mx5@3qnpawbf6243>
References: <20240924050941.1251485-1-quic_kshivnan@quicinc.com>
 <20240924050941.1251485-3-quic_kshivnan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240924050941.1251485-3-quic_kshivnan@quicinc.com>

On Tue, Sep 24, 2024 at 10:39:40AM GMT, Shivnandan Kumar wrote:
> The SC7280 CPUCP mailbox controller is compatible with legacy mailbox
> hardware.
> Implement support for this functionality which enable HLOS to

s/HLOS/Linux/

> CPUCP communication.

This enables Linux to do this and that.

> 
> Signed-off-by: Shivnandan Kumar <quic_kshivnan@quicinc.com>
> ---
>  drivers/mailbox/qcom-cpucp-mbox.c | 156 +++++++++++++++++++++++-------
>  1 file changed, 122 insertions(+), 34 deletions(-)
> 
> diff --git a/drivers/mailbox/qcom-cpucp-mbox.c b/drivers/mailbox/qcom-cpucp-mbox.c
> index e5437c294803..faae6e069ea1 100644
> --- a/drivers/mailbox/qcom-cpucp-mbox.c
> +++ b/drivers/mailbox/qcom-cpucp-mbox.c
> @@ -13,18 +13,24 @@
>  #include <linux/platform_device.h>
> 
>  #define APSS_CPUCP_IPC_CHAN_SUPPORTED		3
> -#define APSS_CPUCP_MBOX_CMD_OFF			0x4
> -
> -/* Tx Registers */
> -#define APSS_CPUCP_TX_MBOX_CMD(i)		(0x100 + ((i) * 8))
> 
>  /* Rx Registers */
> -#define APSS_CPUCP_RX_MBOX_CMD(i)		(0x100 + ((i) * 8))
> -#define APSS_CPUCP_RX_MBOX_MAP			0x4000
> -#define APSS_CPUCP_RX_MBOX_STAT			0x4400
> -#define APSS_CPUCP_RX_MBOX_CLEAR		0x4800
> -#define APSS_CPUCP_RX_MBOX_EN			0x4c00
> -#define APSS_CPUCP_RX_MBOX_CMD_MASK		GENMASK_ULL(63, 0)
> +#define APSS_CPUCP_V2_RX_MBOX_CMD_MASK		GENMASK_ULL(63, 0)
> +#define APSS_CPUCP_V1_SEND_IRQ_VAL		BIT(28)
> +#define APSS_CPUCP_V1_CLEAR_IRQ_VAL		BIT(3)
> +#define APSS_CPUCP_V1_STATUS_IRQ_VAL		BIT(3)
> +
> +struct qcom_cpucp_mbox_desc {
> +	u32 enable_reg;
> +	u32 map_reg;
> +	u32 rx_reg;
> +	u32 tx_reg;
> +	u32 status_reg;
> +	u32 clear_reg;
> +	u32 chan_stride;
> +	bool v2_mbox;
> +	u32 num_chans;
> +};
> 
>  /**
>   * struct qcom_cpucp_mbox - Holder for the mailbox driver
> @@ -35,6 +41,7 @@
>   */
>  struct qcom_cpucp_mbox {
>  	struct mbox_chan chans[APSS_CPUCP_IPC_CHAN_SUPPORTED];
> +	const struct qcom_cpucp_mbox_desc *desc;
>  	struct mbox_controller mbox;
>  	void __iomem *tx_base;
>  	void __iomem *rx_base;
> @@ -48,13 +55,40 @@ static inline int channel_number(struct mbox_chan *chan)
>  static irqreturn_t qcom_cpucp_mbox_irq_fn(int irq, void *data)

qcom_cpucp_v1_mbox_irq_fn()

>  {
>  	struct qcom_cpucp_mbox *cpucp = data;
> +	const struct qcom_cpucp_mbox_desc *desc = cpucp->desc;
> +	int i;
> +
> +	for (i = 0; i < desc->num_chans; i++) {
> +		u32 val = readl(cpucp->rx_base + desc->status_reg + (i * desc->chan_stride));
> +		struct mbox_chan *chan = &cpucp->chans[i];
> +		unsigned long flags;
> +
> +		if (val & APSS_CPUCP_V1_STATUS_IRQ_VAL) {
> +			writel(APSS_CPUCP_V1_CLEAR_IRQ_VAL,
> +			       cpucp->rx_base + desc->clear_reg + (i * desc->chan_stride));
> +			/* Make sure reg write is complete before proceeding */
> +			mb();
> +			spin_lock_irqsave(&chan->lock, flags);
> +			if (chan->cl)
> +				mbox_chan_received_data(chan, NULL);

v1 clears IRQ before processing, v2 does it after pinging mbox subsys.
Is that expected? What warrants such a difference?

> +			spin_unlock_irqrestore(&chan->lock, flags);
> +		}
> +	}
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static irqreturn_t qcom_cpucp_v2_mbox_irq_fn(int irq, void *data)
> +{
> +	struct qcom_cpucp_mbox *cpucp = data;
> +	const struct qcom_cpucp_mbox_desc *desc = cpucp->desc;
>  	u64 status;
>  	int i;
> 
> -	status = readq(cpucp->rx_base + APSS_CPUCP_RX_MBOX_STAT);
> +	status = readq(cpucp->rx_base + desc->status_reg);
> 
> -	for_each_set_bit(i, (unsigned long *)&status, APSS_CPUCP_IPC_CHAN_SUPPORTED) {
> -		u32 val = readl(cpucp->rx_base + APSS_CPUCP_RX_MBOX_CMD(i) + APSS_CPUCP_MBOX_CMD_OFF);
> +	for_each_set_bit(i, (unsigned long *)&status, desc->num_chans) {
> +		u32 val = readl(cpucp->rx_base + desc->rx_reg + (i * desc->chan_stride));
>  		struct mbox_chan *chan = &cpucp->chans[i];
>  		unsigned long flags;
> 
> @@ -62,7 +96,7 @@ static irqreturn_t qcom_cpucp_mbox_irq_fn(int irq, void *data)
>  		spin_lock_irqsave(&chan->lock, flags);
>  		if (chan->cl)
>  			mbox_chan_received_data(chan, &val);
> -		writeq(BIT(i), cpucp->rx_base + APSS_CPUCP_RX_MBOX_CLEAR);
> +		writeq(BIT(i), cpucp->rx_base + desc->clear_reg);
>  		spin_unlock_irqrestore(&chan->lock, flags);
>  	}
> 
> @@ -72,12 +106,15 @@ static irqreturn_t qcom_cpucp_mbox_irq_fn(int irq, void *data)
>  static int qcom_cpucp_mbox_startup(struct mbox_chan *chan)
>  {
>  	struct qcom_cpucp_mbox *cpucp = container_of(chan->mbox, struct qcom_cpucp_mbox, mbox);
> +	const struct qcom_cpucp_mbox_desc *desc = cpucp->desc;
>  	unsigned long chan_id = channel_number(chan);
>  	u64 val;
> 
> -	val = readq(cpucp->rx_base + APSS_CPUCP_RX_MBOX_EN);
> -	val |= BIT(chan_id);
> -	writeq(val, cpucp->rx_base + APSS_CPUCP_RX_MBOX_EN);
> +	if (desc->v2_mbox) {
> +		val = readq(cpucp->rx_base + desc->enable_reg);
> +		val |= BIT(chan_id);
> +		writeq(val, cpucp->rx_base + desc->enable_reg);
> +	}

So, startup and shutdown are effectively empty for v1 CPUCP chips? Could
you please add two separate families of functions and two separate
mbox_chan_ops instances? Which probably will mean one register less in
the qcom_cpucp_mbox_desc structure.

> 
>  	return 0;
>  }
> @@ -85,22 +122,26 @@ static int qcom_cpucp_mbox_startup(struct mbox_chan *chan)
>  static void qcom_cpucp_mbox_shutdown(struct mbox_chan *chan)
>  {
>  	struct qcom_cpucp_mbox *cpucp = container_of(chan->mbox, struct qcom_cpucp_mbox, mbox);
> +	const struct qcom_cpucp_mbox_desc *desc = cpucp->desc;
>  	unsigned long chan_id = channel_number(chan);
>  	u64 val;
> 
> -	val = readq(cpucp->rx_base + APSS_CPUCP_RX_MBOX_EN);
> -	val &= ~BIT(chan_id);
> -	writeq(val, cpucp->rx_base + APSS_CPUCP_RX_MBOX_EN);
> +	if (desc->v2_mbox) {
> +		val = readq(cpucp->rx_base + desc->enable_reg);
> +		val &= ~BIT(chan_id);
> +		writeq(val, cpucp->rx_base + desc->enable_reg);
> +	}
>  }
> 
>  static int qcom_cpucp_mbox_send_data(struct mbox_chan *chan, void *data)
>  {
>  	struct qcom_cpucp_mbox *cpucp = container_of(chan->mbox, struct qcom_cpucp_mbox, mbox);
> +	const struct qcom_cpucp_mbox_desc *desc = cpucp->desc;
> +	u32 val = desc->v2_mbox ? *(u32 *)data : APSS_CPUCP_V1_SEND_IRQ_VAL;
>  	unsigned long chan_id = channel_number(chan);
> -	u32 *val = data;
> -
> -	writel(*val, cpucp->tx_base + APSS_CPUCP_TX_MBOX_CMD(chan_id) + APSS_CPUCP_MBOX_CMD_OFF);
> +	u32 offset = desc->v2_mbox ? (chan_id * desc->chan_stride) : 0;
> 
> +	writel(val, cpucp->tx_base + desc->tx_reg + offset);
>  	return 0;
>  }
> 
> @@ -112,41 +153,66 @@ static const struct mbox_chan_ops qcom_cpucp_mbox_chan_ops = {
> 
>  static int qcom_cpucp_mbox_probe(struct platform_device *pdev)
>  {
> +	const struct qcom_cpucp_mbox_desc *desc;
>  	struct device *dev = &pdev->dev;
>  	struct qcom_cpucp_mbox *cpucp;
>  	struct mbox_controller *mbox;
> +	struct resource *res;
>  	int irq, ret;
> 
> +	desc = device_get_match_data(&pdev->dev);
> +	if (!desc)
> +		return -EINVAL;
> +
>  	cpucp = devm_kzalloc(dev, sizeof(*cpucp), GFP_KERNEL);
>  	if (!cpucp)
>  		return -ENOMEM;
> 
> -	cpucp->rx_base = devm_of_iomap(dev, dev->of_node, 0, NULL);
> -	if (IS_ERR(cpucp->rx_base))
> -		return PTR_ERR(cpucp->rx_base);
> +	cpucp->desc = desc;
> +
> +	if (desc->v2_mbox) {
> +		cpucp->rx_base = devm_of_iomap(dev, dev->of_node, 0, NULL);
> +		if (IS_ERR(cpucp->rx_base))
> +			return PTR_ERR(cpucp->rx_base);
> +	/* Legacy mailbox quirks due to shared region with EPSS register space */

Does that mean that on these platforms cpucp should be a child node of the EPSS? Also it might be a high time when the drivers should be switched to use regmaps.

> +	} else {
> +		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +		if (!res) {
> +			dev_err(&pdev->dev, "Failed to get the device base address\n");
> +			return -ENODEV;
> +		}
> +		cpucp->rx_base = devm_ioremap(dev, res->start, resource_size(res));
> +		if (!cpucp->rx_base) {
> +			dev_err(dev, "Failed to ioremap the cpucp rx irq addr\n");
> +			return -ENOMEM;
> +		}
> +	}
> 
>  	cpucp->tx_base = devm_of_iomap(dev, dev->of_node, 1, NULL);
>  	if (IS_ERR(cpucp->tx_base))
>  		return PTR_ERR(cpucp->tx_base);
> 
> -	writeq(0, cpucp->rx_base + APSS_CPUCP_RX_MBOX_EN);
> -	writeq(0, cpucp->rx_base + APSS_CPUCP_RX_MBOX_CLEAR);
> -	writeq(0, cpucp->rx_base + APSS_CPUCP_RX_MBOX_MAP);
> +	if (desc->v2_mbox) {
> +		writeq(0, cpucp->rx_base + desc->enable_reg);
> +		writeq(0, cpucp->rx_base + desc->clear_reg);
> +		writeq(0, cpucp->rx_base + desc->map_reg);
> +	}

If these registers are only present on V2, there is no need to have them
in the qcom_cpucp_mbox_desc.

> 
>  	irq = platform_get_irq(pdev, 0);
>  	if (irq < 0)
>  		return irq;
> 
> -	ret = devm_request_irq(dev, irq, qcom_cpucp_mbox_irq_fn,
> -			       IRQF_TRIGGER_HIGH, "apss_cpucp_mbox", cpucp);
> +	ret = devm_request_irq(dev, irq, desc->v2_mbox ? qcom_cpucp_v2_mbox_irq_fn :
> +		qcom_cpucp_mbox_irq_fn, IRQF_TRIGGER_HIGH, "apss_cpucp_mbox", cpucp);
>  	if (ret < 0)
>  		return dev_err_probe(dev, ret, "Failed to register irq: %d\n", irq);
> 
> -	writeq(APSS_CPUCP_RX_MBOX_CMD_MASK, cpucp->rx_base + APSS_CPUCP_RX_MBOX_MAP);
> +	if (desc->v2_mbox)
> +		writeq(APSS_CPUCP_V2_RX_MBOX_CMD_MASK, cpucp->rx_base + desc->map_reg);
> 
>  	mbox = &cpucp->mbox;
>  	mbox->dev = dev;
> -	mbox->num_chans = APSS_CPUCP_IPC_CHAN_SUPPORTED;
> +	mbox->num_chans = desc->num_chans;
>  	mbox->chans = cpucp->chans;
>  	mbox->ops = &qcom_cpucp_mbox_chan_ops;
> 
> @@ -157,8 +223,30 @@ static int qcom_cpucp_mbox_probe(struct platform_device *pdev)
>  	return 0;
>  }
> 
> +static const struct qcom_cpucp_mbox_desc sc7280_cpucp_mbox = {
> +	.tx_reg = 0xC,
> +	.chan_stride = 0x1000,
> +	.status_reg = 0x30C,
> +	.clear_reg = 0x308,
> +	.v2_mbox = false,
> +	.num_chans = 2,
> +};
> +
> +static const struct qcom_cpucp_mbox_desc x1e80100_cpucp_mbox = {
> +	.rx_reg = 0x104,
> +	.tx_reg = 0x104,
> +	.chan_stride = 0x8,
> +	.map_reg = 0x4000,
> +	.status_reg = 0x4400,
> +	.clear_reg = 0x4800,
> +	.enable_reg = 0x4C00,
> +	.v2_mbox = true,
> +	.num_chans = 3,
> +};
> +
>  static const struct of_device_id qcom_cpucp_mbox_of_match[] = {
> -	{ .compatible = "qcom,x1e80100-cpucp-mbox" },
> +	{ .compatible = "qcom,x1e80100-cpucp-mbox", .data = &x1e80100_cpucp_mbox},
> +	{ .compatible = "qcom,sc7280-cpucp-mbox", .data = &sc7280_cpucp_mbox},

Please keep the table sorted.

>  	{}
>  };
>  MODULE_DEVICE_TABLE(of, qcom_cpucp_mbox_of_match);
> --
> 2.25.1
> 

-- 
With best wishes
Dmitry

