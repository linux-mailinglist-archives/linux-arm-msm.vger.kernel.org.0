Return-Path: <linux-arm-msm+bounces-33209-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F44991C27
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 04:33:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 54D24B22B0A
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 02:33:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4EBB15748F;
	Sun,  6 Oct 2024 02:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lBWkivxV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 785B9150990;
	Sun,  6 Oct 2024 02:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728181988; cv=none; b=caCFPBXIyg1dX99YPgUT3n/nHM+uiYECVBjxdNDwCFKFTGeAjGdYKmLK6zYmdFYY25sfrqTm6tCAV+Cb+wxT0Z4aeyYlDp1C1SyhLFqTXbkNnoU4k/MBNmmtOyKfpFq2Z+bijXjl0MkRSP6xNUYVx1aZpxgJOiOzNDM7lUU2nm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728181988; c=relaxed/simple;
	bh=T3atJqm7ZOV2yisi8eKQe00NIrA6eNu39ES72TrLnIs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DsFZ2sTtQo1iLVxJAU32cwVzbi9RdQXh33TgBjz8ZRtMpC6EfQHX8q3wzXnB+4ntlykjyXAoh9IRy6h3uCfi1VACd4ZHuLjzsDiBr9CPKYWFhB4n1DEp0kwHaVlMukxYnLAaC1BWF1ULqUpr/kO02Ky+HjDspbHfhzsJXG9kCcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lBWkivxV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1ADE6C4CEC2;
	Sun,  6 Oct 2024 02:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728181988;
	bh=T3atJqm7ZOV2yisi8eKQe00NIrA6eNu39ES72TrLnIs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lBWkivxVl/Vw+803plgtXqVzv399SjHbM5mx6u7TDv8Yudn5dYlDuHflQBjYB6ryE
	 3nXhOkHmlJgP5CGjUJlZvpUCWxEXj8DewNNP8/r21E8Y9vQEaWZgP6WI4iYWb1FNpU
	 eGrWnHkOcYDza/7fcWSh75p6XwKeS+Qy9u4Uon+0uobt5R+jVhdwHGgxIh0cqHjL0V
	 bm7YzWlKpbm+8+5EA1v71sLMHoDVKjmG1JeJEsIMoHjFMbSkqrlf3U/WQcJQU9vqg1
	 Jr19ETrGGM08JQ+ixHTJohPZcCrvNVbkTOdNo3LR70T47cg56v6slOoQ/hB4cjaVXY
	 Hep39BgoULFww==
Date: Sat, 5 Oct 2024 21:33:05 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Shivnandan Kumar <quic_kshivnan@quicinc.com>
Cc: Sibi Sankar <quic_sibis@quicinc.com>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	cros-qcom-dts-watchers@chromium.org, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Ramakrishna Gottimukkula <quic_rgottimu@quicinc.com>
Subject: Re: [PATCH 2/3] mailbox: qcom-cpucp-mbox: Add support for SC7280
 CPUCP mailbox controller
Message-ID: <daorjvhony2y2ye2b3tus37bzux4hqqmhftyjsem7fz5cp2z42@a7ftfpnuvbja>
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

"mailbox hardware" is a very vague description of something.

> Implement support for this functionality which enable HLOS to
> CPUCP communication.
> 

Please describe the problem that this solves. What "legacy mailbox
hardware"? Why do you want to talk to the CPUCP?  What is a HLOS? What
is the CPUCP?

It seems from the patch that the current implementation supports
something we call "version 2" of the cpucp mailbox interface and you're
adding support for v1. Please make sure that the commit message describe
such things.

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

Do you really need these parameters to be dynamic? E.g. you only touch
enable_reg from the v2 code paths...

> +	u32 map_reg;
> +	u32 rx_reg;
> +	u32 tx_reg;
> +	u32 status_reg;
> +	u32 clear_reg;
> +	u32 chan_stride;

"u32" tells me that this has to be 32 bits, e.g. because the value is
going into a register... But these are just offsets...

Please use "unsigned int" to denote "a natural number".

> +	bool v2_mbox;

How about "version" and give it a value 1 or 2?

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

Why is the existing function renamed "v2" and this newly introduced
function not given a version?

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

No equivalent in "legacy"?
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

Ditto

>  }
> 
>  static int qcom_cpucp_mbox_send_data(struct mbox_chan *chan, void *data)
>  {
>  	struct qcom_cpucp_mbox *cpucp = container_of(chan->mbox, struct qcom_cpucp_mbox, mbox);
> +	const struct qcom_cpucp_mbox_desc *desc = cpucp->desc;
> +	u32 val = desc->v2_mbox ? *(u32 *)data : APSS_CPUCP_V1_SEND_IRQ_VAL;

Please rewrite this without ternary operators.

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

Why can't we have the same code in both cases?

> +	} else {
> +		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +		if (!res) {
> +			dev_err(&pdev->dev, "Failed to get the device base address\n");

It's not only base address.

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


Is there a reason why the legacy system does not need or want to clear
these?

> +	}
> 
>  	irq = platform_get_irq(pdev, 0);
>  	if (irq < 0)
>  		return irq;
> 
> -	ret = devm_request_irq(dev, irq, qcom_cpucp_mbox_irq_fn,
> -			       IRQF_TRIGGER_HIGH, "apss_cpucp_mbox", cpucp);
> +	ret = devm_request_irq(dev, irq, desc->v2_mbox ? qcom_cpucp_v2_mbox_irq_fn :
> +		qcom_cpucp_mbox_irq_fn, IRQF_TRIGGER_HIGH, "apss_cpucp_mbox", cpucp);

The use of a ternary operator, in combination with odd line wrapping
makes this completely unreadable. Please fix.

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

Lowercase hex digits please (although the question above whether these
needs to be defined remains).

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

Perhaps I'm missing something, but seems like the only information you
actually need to pass here is 1 or 2, to denote which version/code paths
you should take through the driver.

Regards,
Bjorn

>  	{}
>  };
>  MODULE_DEVICE_TABLE(of, qcom_cpucp_mbox_of_match);
> --
> 2.25.1
> 

