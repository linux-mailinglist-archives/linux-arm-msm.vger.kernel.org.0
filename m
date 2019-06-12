Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 76BD6420C0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2019 11:28:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408795AbfFLJ2J (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Jun 2019 05:28:09 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:53358 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407778AbfFLJ2I (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Jun 2019 05:28:08 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id A045B60240; Wed, 12 Jun 2019 09:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1560331686;
        bh=X7nc1zXeGW0SXwqL2la5jhEeD4ZzGaudxZFNXN3Ed2A=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=UDUUmKlGMFxXJw0SsOI2uZ9pZ41SzCUkK3AsERaPI69OaBichBP8OCzrp/t05CHXj
         bX4z+0+NCJxd6bgZtLVwsYoBLiOOPyAQvzeWWftt8tgVlQdCRYbe2uO6HIj1R9M/2J
         yqdG/Xtr6glPshLoh4AN1cVEnc6qqU18vZFL8BFo=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        by smtp.codeaurora.org (Postfix) with ESMTP id 6415A60275;
        Wed, 12 Jun 2019 09:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1560331685;
        bh=X7nc1zXeGW0SXwqL2la5jhEeD4ZzGaudxZFNXN3Ed2A=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=VsrYCLrGwi69c6zrzdOPf2IKKhlTHc9iphyxxzVSo6ZojTi4CYX/MOrh8h029kWfS
         qW7HsD4GMfg1MOHILuOiTwiIqLE5bKRcJQuMc3S6/pJZWlWyw9mpyoEgw9rS16gKDH
         NuB90Wkc0VoyeYlq+nQ7cd29YtFXjC3VdCxH9YeU=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 12 Jun 2019 14:58:05 +0530
From:   Sibi Sankar <sibis@codeaurora.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm-owner@vger.kernel.org
Subject: Re: [PATCH v9 2/4] soc: qcom: Add AOSS QMP driver
In-Reply-To: <20190612044536.13940-3-bjorn.andersson@linaro.org>
References: <20190612044536.13940-1-bjorn.andersson@linaro.org>
 <20190612044536.13940-3-bjorn.andersson@linaro.org>
Message-ID: <297d68d21bbd3465ef344cbea888e653@codeaurora.org>
X-Sender: sibis@codeaurora.org
User-Agent: Roundcube Webmail/1.2.5
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2019-06-12 10:15, Bjorn Andersson wrote:
> The Always On Subsystem (AOSS) Qualcomm Messaging Protocol (QMP) driver
> is used to communicate with the AOSS for certain side-channel requests,
> that are not available through the RPMh interface.
> 
> The communication is a very simple synchronous mechanism of messages
> being written in message RAM and a doorbell in the AOSS is rung. As the
> AOSS has processed the message length is cleared and an interrupt is
> fired by the AOSS as acknowledgment.
> 
> The driver exposes the QDSS clock as a clock and the low-power state
> associated with the remoteprocs in the system as a set of 
> power-domains.
> 

Tested-by: Sibi Sankar <sibis@codeaurora.org>
Reviewed-by: Sibi Sankar <sibis@codeaurora.org>

> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Vinod Koul <vkoul@kernel.org>
> Tested-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> Changes since v8:
> - ret => time_left
> - static const the clk_init_data
> 
>  drivers/soc/qcom/Kconfig     |  12 +
>  drivers/soc/qcom/Makefile    |   1 +
>  drivers/soc/qcom/qcom_aoss.c | 480 +++++++++++++++++++++++++++++++++++
>  3 files changed, 493 insertions(+)
>  create mode 100644 drivers/soc/qcom/qcom_aoss.c
> 
> diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
> index 880cf0290962..1ecd95a1c654 100644
> --- a/drivers/soc/qcom/Kconfig
> +++ b/drivers/soc/qcom/Kconfig
> @@ -4,6 +4,18 @@
>  #
>  menu "Qualcomm SoC drivers"
> 
> +config QCOM_AOSS_QMP
> +	tristate "Qualcomm AOSS Driver"
> +	depends on ARCH_QCOM || COMPILE_TEST
> +	depends on MAILBOX
> +	depends on COMMON_CLK
> +	select PM_GENERIC_DOMAINS
> +	help
> +	  This driver provides the means of communicating with and 
> controlling
> +	  the low-power state for resources related to the remoteproc
> +	  subsystems as well as controlling the debug clocks exposed by the 
> Always On
> +	  Subsystem (AOSS) using Qualcomm Messaging Protocol (QMP).
> +
>  config QCOM_COMMAND_DB
>  	bool "Qualcomm Command DB"
>  	depends on ARCH_QCOM || COMPILE_TEST
> diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
> index ffe519b0cb66..eeb088beb15f 100644
> --- a/drivers/soc/qcom/Makefile
> +++ b/drivers/soc/qcom/Makefile
> @@ -1,5 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0
>  CFLAGS_rpmh-rsc.o := -I$(src)
> +obj-$(CONFIG_QCOM_AOSS_QMP) +=	qcom_aoss.o
>  obj-$(CONFIG_QCOM_GENI_SE) +=	qcom-geni-se.o
>  obj-$(CONFIG_QCOM_COMMAND_DB) += cmd-db.o
>  obj-$(CONFIG_QCOM_GLINK_SSR) +=	glink_ssr.o
> diff --git a/drivers/soc/qcom/qcom_aoss.c 
> b/drivers/soc/qcom/qcom_aoss.c
> new file mode 100644
> index 000000000000..5f885196f4d0
> --- /dev/null
> +++ b/drivers/soc/qcom/qcom_aoss.c
> @@ -0,0 +1,480 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2019, Linaro Ltd
> + */
> +#include <dt-bindings/power/qcom-aoss-qmp.h>
> +#include <linux/clk-provider.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/mailbox_client.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_domain.h>
> +
> +#define QMP_DESC_MAGIC			0x0
> +#define QMP_DESC_VERSION		0x4
> +#define QMP_DESC_FEATURES		0x8
> +
> +/* AOP-side offsets */
> +#define QMP_DESC_UCORE_LINK_STATE	0xc
> +#define QMP_DESC_UCORE_LINK_STATE_ACK	0x10
> +#define QMP_DESC_UCORE_CH_STATE		0x14
> +#define QMP_DESC_UCORE_CH_STATE_ACK	0x18
> +#define QMP_DESC_UCORE_MBOX_SIZE	0x1c
> +#define QMP_DESC_UCORE_MBOX_OFFSET	0x20
> +
> +/* Linux-side offsets */
> +#define QMP_DESC_MCORE_LINK_STATE	0x24
> +#define QMP_DESC_MCORE_LINK_STATE_ACK	0x28
> +#define QMP_DESC_MCORE_CH_STATE		0x2c
> +#define QMP_DESC_MCORE_CH_STATE_ACK	0x30
> +#define QMP_DESC_MCORE_MBOX_SIZE	0x34
> +#define QMP_DESC_MCORE_MBOX_OFFSET	0x38
> +
> +#define QMP_STATE_UP			GENMASK(15, 0)
> +#define QMP_STATE_DOWN			GENMASK(31, 16)
> +
> +#define QMP_MAGIC			0x4d41494c /* mail */
> +#define QMP_VERSION			1
> +
> +/* 64 bytes is enough to store the requests and provides padding to 4 
> bytes */
> +#define QMP_MSG_LEN			64
> +
> +/**
> + * struct qmp - driver state for QMP implementation
> + * @msgram: iomem referencing the message RAM used for communication
> + * @dev: reference to QMP device
> + * @mbox_client: mailbox client used to ring the doorbell on transmit
> + * @mbox_chan: mailbox channel used to ring the doorbell on transmit
> + * @offset: offset within @msgram where messages should be written
> + * @size: maximum size of the messages to be transmitted
> + * @event: wait_queue for synchronization with the IRQ
> + * @tx_lock: provides synchronization between multiple callers of 
> qmp_send()
> + * @qdss_clk: QDSS clock hw struct
> + * @pd_data: genpd data
> + */
> +struct qmp {
> +	void __iomem *msgram;
> +	struct device *dev;
> +
> +	struct mbox_client mbox_client;
> +	struct mbox_chan *mbox_chan;
> +
> +	size_t offset;
> +	size_t size;
> +
> +	wait_queue_head_t event;
> +
> +	struct mutex tx_lock;
> +
> +	struct clk_hw qdss_clk;
> +	struct genpd_onecell_data pd_data;
> +};
> +
> +struct qmp_pd {
> +	struct qmp *qmp;
> +	struct generic_pm_domain pd;
> +};
> +
> +#define to_qmp_pd_resource(res) container_of(res, struct qmp_pd, pd)
> +
> +static void qmp_kick(struct qmp *qmp)
> +{
> +	mbox_send_message(qmp->mbox_chan, NULL);
> +	mbox_client_txdone(qmp->mbox_chan, 0);
> +}
> +
> +static bool qmp_magic_valid(struct qmp *qmp)
> +{
> +	return readl(qmp->msgram + QMP_DESC_MAGIC) == QMP_MAGIC;
> +}
> +
> +static bool qmp_link_acked(struct qmp *qmp)
> +{
> +	return readl(qmp->msgram + QMP_DESC_MCORE_LINK_STATE_ACK) == 
> QMP_STATE_UP;
> +}
> +
> +static bool qmp_mcore_channel_acked(struct qmp *qmp)
> +{
> +	return readl(qmp->msgram + QMP_DESC_MCORE_CH_STATE_ACK) == 
> QMP_STATE_UP;
> +}
> +
> +static bool qmp_ucore_channel_up(struct qmp *qmp)
> +{
> +	return readl(qmp->msgram + QMP_DESC_UCORE_CH_STATE) == QMP_STATE_UP;
> +}
> +
> +static int qmp_open(struct qmp *qmp)
> +{
> +	int ret;
> +	u32 val;
> +
> +	if (!qmp_magic_valid(qmp)) {
> +		dev_err(qmp->dev, "QMP magic doesn't match\n");
> +		return -EINVAL;
> +	}
> +
> +	val = readl(qmp->msgram + QMP_DESC_VERSION);
> +	if (val != QMP_VERSION) {
> +		dev_err(qmp->dev, "unsupported QMP version %d\n", val);
> +		return -EINVAL;
> +	}
> +
> +	qmp->offset = readl(qmp->msgram + QMP_DESC_MCORE_MBOX_OFFSET);
> +	qmp->size = readl(qmp->msgram + QMP_DESC_MCORE_MBOX_SIZE);
> +	if (!qmp->size) {
> +		dev_err(qmp->dev, "invalid mailbox size\n");
> +		return -EINVAL;
> +	}
> +
> +	/* Ack remote core's link state */
> +	val = readl(qmp->msgram + QMP_DESC_UCORE_LINK_STATE);
> +	writel(val, qmp->msgram + QMP_DESC_UCORE_LINK_STATE_ACK);
> +
> +	/* Set local core's link state to up */
> +	writel(QMP_STATE_UP, qmp->msgram + QMP_DESC_MCORE_LINK_STATE);
> +
> +	qmp_kick(qmp);
> +
> +	ret = wait_event_timeout(qmp->event, qmp_link_acked(qmp), HZ);
> +	if (!ret) {
> +		dev_err(qmp->dev, "ucore didn't ack link\n");
> +		goto timeout_close_link;
> +	}
> +
> +	writel(QMP_STATE_UP, qmp->msgram + QMP_DESC_MCORE_CH_STATE);
> +
> +	qmp_kick(qmp);
> +
> +	ret = wait_event_timeout(qmp->event, qmp_ucore_channel_up(qmp), HZ);
> +	if (!ret) {
> +		dev_err(qmp->dev, "ucore didn't open channel\n");
> +		goto timeout_close_channel;
> +	}
> +
> +	/* Ack remote core's channel state */
> +	writel(QMP_STATE_UP, qmp->msgram + QMP_DESC_UCORE_CH_STATE_ACK);
> +
> +	qmp_kick(qmp);
> +
> +	ret = wait_event_timeout(qmp->event, qmp_mcore_channel_acked(qmp), 
> HZ);
> +	if (!ret) {
> +		dev_err(qmp->dev, "ucore didn't ack channel\n");
> +		goto timeout_close_channel;
> +	}
> +
> +	return 0;
> +
> +timeout_close_channel:
> +	writel(QMP_STATE_DOWN, qmp->msgram + QMP_DESC_MCORE_CH_STATE);
> +
> +timeout_close_link:
> +	writel(QMP_STATE_DOWN, qmp->msgram + QMP_DESC_MCORE_LINK_STATE);
> +	qmp_kick(qmp);
> +
> +	return -ETIMEDOUT;
> +}
> +
> +static void qmp_close(struct qmp *qmp)
> +{
> +	writel(QMP_STATE_DOWN, qmp->msgram + QMP_DESC_MCORE_CH_STATE);
> +	writel(QMP_STATE_DOWN, qmp->msgram + QMP_DESC_MCORE_LINK_STATE);
> +	qmp_kick(qmp);
> +}
> +
> +static irqreturn_t qmp_intr(int irq, void *data)
> +{
> +	struct qmp *qmp = data;
> +
> +	wake_up_interruptible_all(&qmp->event);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static bool qmp_message_empty(struct qmp *qmp)
> +{
> +	return readl(qmp->msgram + qmp->offset) == 0;
> +}
> +
> +/**
> + * qmp_send() - send a message to the AOSS
> + * @qmp: qmp context
> + * @data: message to be sent
> + * @len: length of the message
> + *
> + * Transmit @data to AOSS and wait for the AOSS to acknowledge the 
> message.
> + * @len must be a multiple of 4 and not longer than the mailbox size. 
> Access is
> + * synchronized by this implementation.
> + *
> + * Return: 0 on success, negative errno on failure
> + */
> +static int qmp_send(struct qmp *qmp, const void *data, size_t len)
> +{
> +	long time_left;
> +	int ret;
> +
> +	if (WARN_ON(len + sizeof(u32) > qmp->size))
> +		return -EINVAL;
> +
> +	if (WARN_ON(len % sizeof(u32)))
> +		return -EINVAL;
> +
> +	mutex_lock(&qmp->tx_lock);
> +
> +	/* The message RAM only implements 32-bit accesses */
> +	__iowrite32_copy(qmp->msgram + qmp->offset + sizeof(u32),
> +			 data, len / sizeof(u32));
> +	writel(len, qmp->msgram + qmp->offset);
> +	qmp_kick(qmp);
> +
> +	time_left = wait_event_interruptible_timeout(qmp->event,
> +						     qmp_message_empty(qmp), HZ);
> +	if (!time_left) {
> +		dev_err(qmp->dev, "ucore did not ack channel\n");
> +		ret = -ETIMEDOUT;
> +
> +		/* Clear message from buffer */
> +		writel(0, qmp->msgram + qmp->offset);
> +	} else {
> +		ret = 0;
> +	}
> +
> +	mutex_unlock(&qmp->tx_lock);
> +
> +	return ret;
> +}
> +
> +static int qmp_qdss_clk_prepare(struct clk_hw *hw)
> +{
> +	static const char buf[QMP_MSG_LEN] = "{class: clock, res: qdss, val: 
> 1}";
> +	struct qmp *qmp = container_of(hw, struct qmp, qdss_clk);
> +
> +	return qmp_send(qmp, buf, sizeof(buf));
> +}
> +
> +static void qmp_qdss_clk_unprepare(struct clk_hw *hw)
> +{
> +	static const char buf[QMP_MSG_LEN] = "{class: clock, res: qdss, val: 
> 0}";
> +	struct qmp *qmp = container_of(hw, struct qmp, qdss_clk);
> +
> +	qmp_send(qmp, buf, sizeof(buf));
> +}
> +
> +static const struct clk_ops qmp_qdss_clk_ops = {
> +	.prepare = qmp_qdss_clk_prepare,
> +	.unprepare = qmp_qdss_clk_unprepare,
> +};
> +
> +static int qmp_qdss_clk_add(struct qmp *qmp)
> +{
> +	static const struct clk_init_data qdss_init = {
> +		.ops = &qmp_qdss_clk_ops,
> +		.name = "qdss",
> +	};
> +	int ret;
> +
> +	qmp->qdss_clk.init = &qdss_init;
> +	ret = clk_hw_register(qmp->dev, &qmp->qdss_clk);
> +	if (ret < 0) {
> +		dev_err(qmp->dev, "failed to register qdss clock\n");
> +		return ret;
> +	}
> +
> +	ret = of_clk_add_hw_provider(qmp->dev->of_node, of_clk_hw_simple_get,
> +				     &qmp->qdss_clk);
> +	if (ret < 0) {
> +		dev_err(qmp->dev, "unable to register of clk hw provider\n");
> +		clk_hw_unregister(&qmp->qdss_clk);
> +	}
> +
> +	return ret;
> +}
> +
> +static void qmp_qdss_clk_remove(struct qmp *qmp)
> +{
> +	of_clk_del_provider(qmp->dev->of_node);
> +	clk_hw_unregister(&qmp->qdss_clk);
> +}
> +
> +static int qmp_pd_power_toggle(struct qmp_pd *res, bool enable)
> +{
> +	char buf[QMP_MSG_LEN] = {};
> +
> +	snprintf(buf, sizeof(buf),
> +		 "{class: image, res: load_state, name: %s, val: %s}",
> +		 res->pd.name, enable ? "on" : "off");
> +	return qmp_send(res->qmp, buf, sizeof(buf));
> +}
> +
> +static int qmp_pd_power_on(struct generic_pm_domain *domain)
> +{
> +	return qmp_pd_power_toggle(to_qmp_pd_resource(domain), true);
> +}
> +
> +static int qmp_pd_power_off(struct generic_pm_domain *domain)
> +{
> +	return qmp_pd_power_toggle(to_qmp_pd_resource(domain), false);
> +}
> +
> +static const char * const sdm845_resources[] = {
> +	[AOSS_QMP_LS_CDSP] = "cdsp",
> +	[AOSS_QMP_LS_LPASS] = "adsp",
> +	[AOSS_QMP_LS_MODEM] = "modem",
> +	[AOSS_QMP_LS_SLPI] = "slpi",
> +	[AOSS_QMP_LS_SPSS] = "spss",
> +	[AOSS_QMP_LS_VENUS] = "venus",
> +};
> +
> +static int qmp_pd_add(struct qmp *qmp)
> +{
> +	struct genpd_onecell_data *data = &qmp->pd_data;
> +	struct device *dev = qmp->dev;
> +	struct qmp_pd *res;
> +	size_t num = ARRAY_SIZE(sdm845_resources);
> +	int ret;
> +	int i;
> +
> +	res = devm_kcalloc(dev, num, sizeof(*res), GFP_KERNEL);
> +	if (!res)
> +		return -ENOMEM;
> +
> +	data->domains = devm_kcalloc(dev, num, sizeof(*data->domains),
> +				     GFP_KERNEL);
> +	if (!data->domains)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < num; i++) {
> +		res[i].qmp = qmp;
> +		res[i].pd.name = sdm845_resources[i];
> +		res[i].pd.power_on = qmp_pd_power_on;
> +		res[i].pd.power_off = qmp_pd_power_off;
> +
> +		ret = pm_genpd_init(&res[i].pd, NULL, true);
> +		if (ret < 0) {
> +			dev_err(dev, "failed to init genpd\n");
> +			goto unroll_genpds;
> +		}
> +
> +		data->domains[i] = &res[i].pd;
> +	}
> +
> +	data->num_domains = i;
> +
> +	ret = of_genpd_add_provider_onecell(dev->of_node, data);
> +	if (ret < 0)
> +		goto unroll_genpds;
> +
> +	return 0;
> +
> +unroll_genpds:
> +	for (i--; i >= 0; i--)
> +		pm_genpd_remove(data->domains[i]);
> +
> +	return ret;
> +}
> +
> +static void qmp_pd_remove(struct qmp *qmp)
> +{
> +	struct genpd_onecell_data *data = &qmp->pd_data;
> +	struct device *dev = qmp->dev;
> +	int i;
> +
> +	of_genpd_del_provider(dev->of_node);
> +
> +	for (i = 0; i < data->num_domains; i++)
> +		pm_genpd_remove(data->domains[i]);
> +}
> +
> +static int qmp_probe(struct platform_device *pdev)
> +{
> +	struct resource *res;
> +	struct qmp *qmp;
> +	int irq;
> +	int ret;
> +
> +	qmp = devm_kzalloc(&pdev->dev, sizeof(*qmp), GFP_KERNEL);
> +	if (!qmp)
> +		return -ENOMEM;
> +
> +	qmp->dev = &pdev->dev;
> +	init_waitqueue_head(&qmp->event);
> +	mutex_init(&qmp->tx_lock);
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	qmp->msgram = devm_ioremap_resource(&pdev->dev, res);
> +	if (IS_ERR(qmp->msgram))
> +		return PTR_ERR(qmp->msgram);
> +
> +	qmp->mbox_client.dev = &pdev->dev;
> +	qmp->mbox_client.knows_txdone = true;
> +	qmp->mbox_chan = mbox_request_channel(&qmp->mbox_client, 0);
> +	if (IS_ERR(qmp->mbox_chan)) {
> +		dev_err(&pdev->dev, "failed to acquire ipc mailbox\n");
> +		return PTR_ERR(qmp->mbox_chan);
> +	}
> +
> +	irq = platform_get_irq(pdev, 0);
> +	ret = devm_request_irq(&pdev->dev, irq, qmp_intr, IRQF_ONESHOT,
> +			       "aoss-qmp", qmp);
> +	if (ret < 0) {
> +		dev_err(&pdev->dev, "failed to request interrupt\n");
> +		goto err_free_mbox;
> +	}
> +
> +	ret = qmp_open(qmp);
> +	if (ret < 0)
> +		goto err_free_mbox;
> +
> +	ret = qmp_qdss_clk_add(qmp);
> +	if (ret)
> +		goto err_close_qmp;
> +
> +	ret = qmp_pd_add(qmp);
> +	if (ret)
> +		goto err_remove_qdss_clk;
> +
> +	platform_set_drvdata(pdev, qmp);
> +
> +	return 0;
> +
> +err_remove_qdss_clk:
> +	qmp_qdss_clk_remove(qmp);
> +err_close_qmp:
> +	qmp_close(qmp);
> +err_free_mbox:
> +	mbox_free_channel(qmp->mbox_chan);
> +
> +	return ret;
> +}
> +
> +static int qmp_remove(struct platform_device *pdev)
> +{
> +	struct qmp *qmp = platform_get_drvdata(pdev);
> +
> +	qmp_qdss_clk_remove(qmp);
> +	qmp_pd_remove(qmp);
> +
> +	qmp_close(qmp);
> +	mbox_free_channel(qmp->mbox_chan);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id qmp_dt_match[] = {
> +	{ .compatible = "qcom,sdm845-aoss-qmp", },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, qmp_dt_match);
> +
> +static struct platform_driver qmp_driver = {
> +	.driver = {
> +		.name		= "qcom_aoss_qmp",
> +		.of_match_table	= qmp_dt_match,
> +	},
> +	.probe = qmp_probe,
> +	.remove	= qmp_remove,
> +};
> +module_platform_driver(qmp_driver);
> +
> +MODULE_DESCRIPTION("Qualcomm AOSS QMP driver");
> +MODULE_LICENSE("GPL v2");

-- 
-- Sibi Sankar --
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.
