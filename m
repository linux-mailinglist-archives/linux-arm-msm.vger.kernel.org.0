Return-Path: <linux-arm-msm+bounces-24192-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 950F39176D1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 05:32:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5869BB223F3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 03:32:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B261365E20;
	Wed, 26 Jun 2024 03:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="avOUoXH+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8206E535BF;
	Wed, 26 Jun 2024 03:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719372729; cv=none; b=bQkbyM5RpSXqGB/CIHY5bk5VhiauCKNbFDOzo86ZCjg2Yp0qdf6PSWXfVmE/HuGocTitTUnZi/taQF2YlOCggqq6OdVCeShrMPA6S3qVoxi9Gc99owD3AvhTWp+1S+l9IPvhQw0mc7l7G9Q8gK22yThTv7ZK2/hCDJ8t6wYGwqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719372729; c=relaxed/simple;
	bh=eWbBhX9k944SJTI4O0zGJTeCD4qto99oUH4KL/3trE8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dXQsQ2tbR+2wIKY11mo/vJMJme3yhqgU4JoMuI9ywNnFLQQXKUpDMzBh3Yo6jWO5HCA3sPY7W+WXb5AKnztonHl3P1ldn0QcU/IeUsHfjtJp+2GUWjbklU04kIauzaEyX60H3DwLx6pNH4pzYkMZMT8qSDrv8uH0jAFUE8rVO+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=avOUoXH+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC09CC32781;
	Wed, 26 Jun 2024 03:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719372729;
	bh=eWbBhX9k944SJTI4O0zGJTeCD4qto99oUH4KL/3trE8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=avOUoXH+S8nWhUMRudWV2EoHuMO4/UPv6uCnuqmU0tIBTNSOo1CvV0v1tBZ9zrgmW
	 WeeSTwA8dOotpyUAeUeIjnxNyKElom7hM95pzciN/TTKWYvMYSeiPo8n9g6ZDXQKr9
	 dPVgi4UC0Gq+pI8lgvbMa7lCUJxFt8Y9L9X1wcfFJgc+cQskgvydGUav2Ct5gnRrqj
	 0YAMCLysB61/+q2X4yBGFTHkAVS52eoTj32kUR2EBakk8L4iOq8tRwWdjHNEF7tj5v
	 JOvJhgBYYzLCN5z7XtswIzqdIa7W7YsEQL4QNmtMotYpEEPRR5FOYKggr2ojNfLypd
	 zG2sl+mQULbXA==
Date: Tue, 25 Jun 2024 22:32:05 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: sudeep.holla@arm.com, cristian.marussi@arm.com, 
	konrad.dybcio@linaro.org, jassisinghbrar@gmail.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, dmitry.baryshkov@linaro.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, quic_rgottimu@quicinc.com, 
	quic_kshivnan@quicinc.com, conor+dt@kernel.org, quic_nkela@quicinc.com, 
	quic_psodagud@quicinc.com, abel.vesa@linaro.org
Subject: Re: [PATCH V6 2/5] mailbox: Add support for QTI CPUCP mailbox
 controller
Message-ID: <5jdageun2ystel4jrt6ailgx4bay34aqjbg2opd24m4l5eau6f@xcne7jhc3wui>
References: <20240612124056.39230-1-quic_sibis@quicinc.com>
 <20240612124056.39230-3-quic_sibis@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240612124056.39230-3-quic_sibis@quicinc.com>

On Wed, Jun 12, 2024 at 06:10:53PM GMT, Sibi Sankar wrote:
> Add support for CPUSS Control Processor (CPUCP) mailbox controller,
> this driver enables communication between AP and CPUCP by acting as
> a doorbell between them.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>

Reviewed-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn

> ---
> 
> v5:
> * Fix build error reported by kernel test robot by adding 64BIT requirement
>   to COMPILE_TEST
> 
>  MAINTAINERS                       |   7 ++
>  drivers/mailbox/Kconfig           |   8 ++
>  drivers/mailbox/Makefile          |   2 +
>  drivers/mailbox/qcom-cpucp-mbox.c | 187 ++++++++++++++++++++++++++++++
>  4 files changed, 204 insertions(+)
>  create mode 100644 drivers/mailbox/qcom-cpucp-mbox.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e04f583780c5..d7c00abe2f93 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -18533,6 +18533,13 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/power/avs/qcom,cpr.yaml
>  F:	drivers/pmdomain/qcom/cpr.c
>  
> +QUALCOMM CPUCP MAILBOX DRIVER
> +M:	Sibi Sankar <quic_sibis@quicinc.com>
> +L:	linux-arm-msm@vger.kernel.org
> +S:	Supported
> +F:	Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml
> +F:	drivers/mailbox/qcom-cpucp-mbox.c
> +
>  QUALCOMM CPUFREQ DRIVER MSM8996/APQ8096
>  M:	Ilia Lin <ilia.lin@kernel.org>
>  L:	linux-pm@vger.kernel.org
> diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig
> index 3b8842c4a340..d1f6c758b5e8 100644
> --- a/drivers/mailbox/Kconfig
> +++ b/drivers/mailbox/Kconfig
> @@ -276,6 +276,14 @@ config SPRD_MBOX
>  	  to send message between application processors and MCU. Say Y here if
>  	  you want to build the Spreatrum mailbox controller driver.
>  
> +config QCOM_CPUCP_MBOX
> +	tristate "Qualcomm Technologies, Inc. CPUCP mailbox driver"
> +	depends on ARCH_QCOM || (COMPILE_TEST && 64BIT)
> +	help
> +	  Qualcomm Technologies, Inc. CPUSS Control Processor (CPUCP) mailbox
> +	  controller driver enables communication between AP and CPUCP. Say
> +	  Y here if you want to build this driver.
> +
>  config QCOM_IPCC
>  	tristate "Qualcomm Technologies, Inc. IPCC driver"
>  	depends on ARCH_QCOM || COMPILE_TEST
> diff --git a/drivers/mailbox/Makefile b/drivers/mailbox/Makefile
> index 5cf2f54debaf..3c3c27d54c13 100644
> --- a/drivers/mailbox/Makefile
> +++ b/drivers/mailbox/Makefile
> @@ -61,4 +61,6 @@ obj-$(CONFIG_SUN6I_MSGBOX)	+= sun6i-msgbox.o
>  
>  obj-$(CONFIG_SPRD_MBOX)		+= sprd-mailbox.o
>  
> +obj-$(CONFIG_QCOM_CPUCP_MBOX)	+= qcom-cpucp-mbox.o
> +
>  obj-$(CONFIG_QCOM_IPCC)		+= qcom-ipcc.o
> diff --git a/drivers/mailbox/qcom-cpucp-mbox.c b/drivers/mailbox/qcom-cpucp-mbox.c
> new file mode 100644
> index 000000000000..e5437c294803
> --- /dev/null
> +++ b/drivers/mailbox/qcom-cpucp-mbox.c
> @@ -0,0 +1,187 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#include <linux/bitops.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/irq.h>
> +#include <linux/irqdomain.h>
> +#include <linux/mailbox_controller.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +
> +#define APSS_CPUCP_IPC_CHAN_SUPPORTED		3
> +#define APSS_CPUCP_MBOX_CMD_OFF			0x4
> +
> +/* Tx Registers */
> +#define APSS_CPUCP_TX_MBOX_CMD(i)		(0x100 + ((i) * 8))
> +
> +/* Rx Registers */
> +#define APSS_CPUCP_RX_MBOX_CMD(i)		(0x100 + ((i) * 8))
> +#define APSS_CPUCP_RX_MBOX_MAP			0x4000
> +#define APSS_CPUCP_RX_MBOX_STAT			0x4400
> +#define APSS_CPUCP_RX_MBOX_CLEAR		0x4800
> +#define APSS_CPUCP_RX_MBOX_EN			0x4c00
> +#define APSS_CPUCP_RX_MBOX_CMD_MASK		GENMASK_ULL(63, 0)
> +
> +/**
> + * struct qcom_cpucp_mbox - Holder for the mailbox driver
> + * @chans:			The mailbox channel
> + * @mbox:			The mailbox controller
> + * @tx_base:			Base address of the CPUCP tx registers
> + * @rx_base:			Base address of the CPUCP rx registers
> + */
> +struct qcom_cpucp_mbox {
> +	struct mbox_chan chans[APSS_CPUCP_IPC_CHAN_SUPPORTED];
> +	struct mbox_controller mbox;
> +	void __iomem *tx_base;
> +	void __iomem *rx_base;
> +};
> +
> +static inline int channel_number(struct mbox_chan *chan)
> +{
> +	return chan - chan->mbox->chans;
> +}
> +
> +static irqreturn_t qcom_cpucp_mbox_irq_fn(int irq, void *data)
> +{
> +	struct qcom_cpucp_mbox *cpucp = data;
> +	u64 status;
> +	int i;
> +
> +	status = readq(cpucp->rx_base + APSS_CPUCP_RX_MBOX_STAT);
> +
> +	for_each_set_bit(i, (unsigned long *)&status, APSS_CPUCP_IPC_CHAN_SUPPORTED) {
> +		u32 val = readl(cpucp->rx_base + APSS_CPUCP_RX_MBOX_CMD(i) + APSS_CPUCP_MBOX_CMD_OFF);
> +		struct mbox_chan *chan = &cpucp->chans[i];
> +		unsigned long flags;
> +
> +		/* Provide mutual exclusion with changes to chan->cl */
> +		spin_lock_irqsave(&chan->lock, flags);
> +		if (chan->cl)
> +			mbox_chan_received_data(chan, &val);
> +		writeq(BIT(i), cpucp->rx_base + APSS_CPUCP_RX_MBOX_CLEAR);
> +		spin_unlock_irqrestore(&chan->lock, flags);
> +	}
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int qcom_cpucp_mbox_startup(struct mbox_chan *chan)
> +{
> +	struct qcom_cpucp_mbox *cpucp = container_of(chan->mbox, struct qcom_cpucp_mbox, mbox);
> +	unsigned long chan_id = channel_number(chan);
> +	u64 val;
> +
> +	val = readq(cpucp->rx_base + APSS_CPUCP_RX_MBOX_EN);
> +	val |= BIT(chan_id);
> +	writeq(val, cpucp->rx_base + APSS_CPUCP_RX_MBOX_EN);
> +
> +	return 0;
> +}
> +
> +static void qcom_cpucp_mbox_shutdown(struct mbox_chan *chan)
> +{
> +	struct qcom_cpucp_mbox *cpucp = container_of(chan->mbox, struct qcom_cpucp_mbox, mbox);
> +	unsigned long chan_id = channel_number(chan);
> +	u64 val;
> +
> +	val = readq(cpucp->rx_base + APSS_CPUCP_RX_MBOX_EN);
> +	val &= ~BIT(chan_id);
> +	writeq(val, cpucp->rx_base + APSS_CPUCP_RX_MBOX_EN);
> +}
> +
> +static int qcom_cpucp_mbox_send_data(struct mbox_chan *chan, void *data)
> +{
> +	struct qcom_cpucp_mbox *cpucp = container_of(chan->mbox, struct qcom_cpucp_mbox, mbox);
> +	unsigned long chan_id = channel_number(chan);
> +	u32 *val = data;
> +
> +	writel(*val, cpucp->tx_base + APSS_CPUCP_TX_MBOX_CMD(chan_id) + APSS_CPUCP_MBOX_CMD_OFF);
> +
> +	return 0;
> +}
> +
> +static const struct mbox_chan_ops qcom_cpucp_mbox_chan_ops = {
> +	.startup = qcom_cpucp_mbox_startup,
> +	.send_data = qcom_cpucp_mbox_send_data,
> +	.shutdown = qcom_cpucp_mbox_shutdown
> +};
> +
> +static int qcom_cpucp_mbox_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct qcom_cpucp_mbox *cpucp;
> +	struct mbox_controller *mbox;
> +	int irq, ret;
> +
> +	cpucp = devm_kzalloc(dev, sizeof(*cpucp), GFP_KERNEL);
> +	if (!cpucp)
> +		return -ENOMEM;
> +
> +	cpucp->rx_base = devm_of_iomap(dev, dev->of_node, 0, NULL);
> +	if (IS_ERR(cpucp->rx_base))
> +		return PTR_ERR(cpucp->rx_base);
> +
> +	cpucp->tx_base = devm_of_iomap(dev, dev->of_node, 1, NULL);
> +	if (IS_ERR(cpucp->tx_base))
> +		return PTR_ERR(cpucp->tx_base);
> +
> +	writeq(0, cpucp->rx_base + APSS_CPUCP_RX_MBOX_EN);
> +	writeq(0, cpucp->rx_base + APSS_CPUCP_RX_MBOX_CLEAR);
> +	writeq(0, cpucp->rx_base + APSS_CPUCP_RX_MBOX_MAP);
> +
> +	irq = platform_get_irq(pdev, 0);
> +	if (irq < 0)
> +		return irq;
> +
> +	ret = devm_request_irq(dev, irq, qcom_cpucp_mbox_irq_fn,
> +			       IRQF_TRIGGER_HIGH, "apss_cpucp_mbox", cpucp);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "Failed to register irq: %d\n", irq);
> +
> +	writeq(APSS_CPUCP_RX_MBOX_CMD_MASK, cpucp->rx_base + APSS_CPUCP_RX_MBOX_MAP);
> +
> +	mbox = &cpucp->mbox;
> +	mbox->dev = dev;
> +	mbox->num_chans = APSS_CPUCP_IPC_CHAN_SUPPORTED;
> +	mbox->chans = cpucp->chans;
> +	mbox->ops = &qcom_cpucp_mbox_chan_ops;
> +
> +	ret = devm_mbox_controller_register(dev, mbox);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to create mailbox\n");
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id qcom_cpucp_mbox_of_match[] = {
> +	{ .compatible = "qcom,x1e80100-cpucp-mbox" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, qcom_cpucp_mbox_of_match);
> +
> +static struct platform_driver qcom_cpucp_mbox_driver = {
> +	.probe = qcom_cpucp_mbox_probe,
> +	.driver = {
> +		.name = "qcom_cpucp_mbox",
> +		.of_match_table = qcom_cpucp_mbox_of_match,
> +	},
> +};
> +
> +static int __init qcom_cpucp_mbox_init(void)
> +{
> +	return platform_driver_register(&qcom_cpucp_mbox_driver);
> +}
> +core_initcall(qcom_cpucp_mbox_init);
> +
> +static void __exit qcom_cpucp_mbox_exit(void)
> +{
> +	platform_driver_unregister(&qcom_cpucp_mbox_driver);
> +}
> +module_exit(qcom_cpucp_mbox_exit);
> +
> +MODULE_DESCRIPTION("QTI CPUCP MBOX Driver");
> +MODULE_LICENSE("GPL");
> -- 
> 2.34.1
> 

