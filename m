Return-Path: <linux-arm-msm+bounces-43709-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BCEF79FED9C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Dec 2024 09:06:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6BDA01882BB2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Dec 2024 08:07:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3644188CA9;
	Tue, 31 Dec 2024 08:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ti8ueqzO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFFBD156C7B;
	Tue, 31 Dec 2024 08:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735632414; cv=none; b=qrShcJB6oi2d3hCx7IgFSIEcC3TPJO8G0/qVjGzfXcH8RdUp6EhJk+jyHhW2YjRw1ACExGJqf0wZJiLJBg0nlqNzYiEDZ1bRyOuNI10yEEMkhaBNGC2ueL1XD87qnm91iUuwXt5/TVi7FsiW3WgNXySu8M+frIjxlkYPAYofSWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735632414; c=relaxed/simple;
	bh=HHM0vtSsv8hiQvUcQpi7ulMcUxZRHB4jYtK7SJ8MWYE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=QUcKWe1+bKpnUU/pbQErqT772ncr6h5UbWAoWOcx4ZFyPWRP3cr90K14dWPSDqRTBHadHSiOqELOBPnHKIR9V6ORISGssf3QWHaXp/X/gX84G86nJAM2+QdvQwz3NWK2C7RnzdduwpmdmWnYe0r5C83WX6fGQCxJukbV028YBVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ti8ueqzO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D255C4CED6;
	Tue, 31 Dec 2024 08:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735632414;
	bh=HHM0vtSsv8hiQvUcQpi7ulMcUxZRHB4jYtK7SJ8MWYE=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=ti8ueqzOkpeNf0GnO5/7xWCIclsgQs1cxHFB52VacebcHIZk/KNNlM4TVKxTzKR8R
	 JFtapeUwl7oxE/ZvNc5tQZuagZNzbwswhoZ8dS0wOtS4sIlIrWtGuwC+oZx3hJOSi6
	 CO2fbhzo2BEZFGCwiWwAw3t8kD8aNWajLr3iuD1babyXIOwYCCJFEJOJO68Mo9Dn9V
	 GwUz52tj0mSNpWlABEjniHrAcHOEvkV+vgdqhivNejuWfcZ1ixCPnJZTuGc9BfoG/o
	 cn8fM8mtdTzbTi442d04AYsCR9S7KIbV/DzW873A+6ATg9gentEMmw9qFKKPenA7Lg
	 NVe0MxjDXqFaQ==
Message-ID: <f8981eda-5040-4288-8d7a-c699030ebe49@kernel.org>
Date: Tue, 31 Dec 2024 09:06:46 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 2/2] mailbox: tmelite-qmp: Introduce TMEL QMP mailbox
 driver
To: Sricharan R <quic_srichara@quicinc.com>, jassisinghbrar@gmail.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, andersson@kernel.org, konradybcio@kernel.org,
 manivannan.sadhasivam@linaro.org, dmitry.baryshkov@linaro.org
References: <20241231054900.2144961-1-quic_srichara@quicinc.com>
 <20241231054900.2144961-3-quic_srichara@quicinc.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20241231054900.2144961-3-quic_srichara@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31/12/2024 06:49, Sricharan R wrote:
> From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> 
> This mailbox facilitates the communication between the TME-L server based
> subsystems (Q6) and the TME-L client (APPSS/BTSS/AUDIOSS), used for security

<form letter>
This is a friendly reminder during the review process.

It seems my or other reviewer's previous comments were not fully
addressed. Maybe the feedback got lost between the quotes, maybe you
just forgot to apply it. Please go back to the previous discussion and
either implement all requested changes or keep discussing them.

Thank you.
</form letter>

Still wrong wrapping.

> services like secure image authentication, enable/disable efuses, crypto
> services. Each client in the   SoC has its own block of message RAM and IRQ
> for communication with the TME-L SS. The protocol used to communicate in the
> message RAM is known as Qualcomm Messaging Protocol (QMP).
> 
> Remote proc driver subscribes to this mailbox and uses the mbox_send_message
> to use TME-L to securely authenticate/teardown the images.
> 
> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> ---
>   [v2] Added worker for mailbox tx processing, since some of the operations can sleep
>        Fixed checkpatch warnings. Some [CHECK] like below still exist, but that looks
>        like a false postive.
> 
>        CHECK: Macro argument 'm' may be better as '(m)' to avoid precedence issues
>         #1072: FILE: include/linux/mailbox/tmelcom-qmp.h:40:
>         +#define TMEL_MSG_UID_CREATE(m, a)      ((u32)(((m & 0xff) << 8) | (a & 0xff)))
> 
>  drivers/mailbox/Kconfig             |   7 +
>  drivers/mailbox/Makefile            |   2 +
>  drivers/mailbox/qcom-tmel-qmp.c     | 971 ++++++++++++++++++++++++++++
>  include/linux/mailbox/tmelcom-qmp.h | 157 +++++
>  4 files changed, 1137 insertions(+)
>  create mode 100644 drivers/mailbox/qcom-tmel-qmp.c
>  create mode 100644 include/linux/mailbox/tmelcom-qmp.h
> 
> diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig
> index 8ecba7fb999e..8ad0b834d617 100644
> --- a/drivers/mailbox/Kconfig
> +++ b/drivers/mailbox/Kconfig
> @@ -306,4 +306,11 @@ config THEAD_TH1520_MBOX
>  	  kernel is running, and E902 core used for power management among other
>  	  things.
>  
> +config QCOM_TMEL_QMP_MAILBOX

Did you just place it at the end instead of gropped or sorted?

> +	tristate "QCOM Mailbox Protocol(QMP) for TME-L SS"
> +	help
> +	  Say yes to add support for the QMP Mailbox Protocol driver for TME-L.
> +	  QMP is a lightweight communication protocol for sending messages to
> +	  TME-L. This protocol fits into the Generic Mailbox Framework.
> +	  QMP uses a mailbox registers.
>  endif
> diff --git a/drivers/mailbox/Makefile b/drivers/mailbox/Makefile
> index 5f4f5b0ce2cc..4dba283a94ad 100644
> --- a/drivers/mailbox/Makefile
> +++ b/drivers/mailbox/Makefile
> @@ -66,3 +66,5 @@ obj-$(CONFIG_QCOM_CPUCP_MBOX)	+= qcom-cpucp-mbox.o
>  obj-$(CONFIG_QCOM_IPCC)		+= qcom-ipcc.o
>  
>  obj-$(CONFIG_THEAD_TH1520_MBOX)	+= mailbox-th1520.o
> +
> +obj-$(CONFIG_QCOM_TMEL_QMP_MAILBOX) += qcom-tmel-qmp.o

Same problem.

> diff --git a/drivers/mailbox/qcom-tmel-qmp.c b/drivers/mailbox/qcom-tmel-qmp.c
> new file mode 100644
> index 000000000000..6de0a418e0ae
> --- /dev/null
> +++ b/drivers/mailbox/qcom-tmel-qmp.c
> @@ -0,0 +1,971 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2018,2020 The Linux Foundation. All rights reserved.
> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#include <linux/completion.h>
> +#include <linux/delay.h>
> +#include <linux/dma-direction.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/init.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/kthread.h>
> +#include <linux/mailbox_client.h>
> +#include <linux/mailbox_controller.h>
> +#include <linux/mailbox/tmelcom-qmp.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_irq.h>

Not used

> +#include <linux/of_platform.h>

Looks also not used

> +#include <linux/platform_device.h>
> +#include <linux/spinlock.h>
> +#include <linux/types.h>
> +#include <linux/uaccess.h>
> +#include <linux/uio.h>
> +#include <linux/workqueue.h>


Several headers here look unused.

> +
> +#define QMP_NUM_CHANS	0x1
> +#define QMP_TOUT_MS	1000
> +#define MBOX_ALIGN_BYTES	3
> +#define QMP_CTRL_DATA_SIZE	4
> +#define QMP_MAX_PKT_SIZE	0x18
> +#define QMP_UCORE_DESC_OFFSET	0x1000
> +
> +#define QMP_CH_VAR_GET(mdev, desc, var) ((mdev)->desc.bits.var)
> +#define QMP_CH_VAR_SET(mdev, desc, var) (mdev)->desc.bits.var = 1
> +#define QMP_CH_VAR_CLR(mdev, desc, var) (mdev)->desc.bits.var = 0
> +
> +#define QMP_MCORE_CH_VAR_GET(mdev, var)	QMP_CH_VAR_GET(mdev, mcore, var)
> +#define QMP_MCORE_CH_VAR_SET(mdev, var)	QMP_CH_VAR_SET(mdev, mcore, var)
> +#define QMP_MCORE_CH_VAR_CLR(mdev, var)	QMP_CH_VAR_CLR(mdev, mcore, var)
> +
> +#define QMP_MCORE_CH_VAR_TOGGLE(mdev, var) \
> +	(mdev)->mcore.bits.var = !((mdev)->mcore.bits.var)
> +#define QMP_MCORE_CH_ACKED_CHECK(mdev, var) \
> +	((mdev)->ucore.bits.var == (mdev)->mcore.bits.var##_ack)
> +#define QMP_MCORE_CH_ACK_UPDATE(mdev, var) \
> +	(mdev)->mcore.bits.var##_ack = (mdev)->ucore.bits.var
> +#define QMP_MCORE_CH_VAR_ACK_CLR(mdev, var) \
> +	(mdev)->mcore.bits.var##_ack = 0
> +
> +#define QMP_UCORE_CH_VAR_GET(mdev, var)	QMP_CH_VAR_GET(mdev, ucore, var)
> +#define QMP_UCORE_CH_ACKED_CHECK(mdev, var) \
> +	((mdev)->mcore.bits.var == (mdev)->ucore.bits.var##_ack)
> +#define QMP_UCORE_CH_VAR_TOGGLED_CHECK(mdev, var) \
> +	((mdev)->ucore.bits.var != (mdev)->mcore.bits.var##_ack)
> +
> +/**
> + * enum qmp_local_state -	definition of the local state machine
> + * @LINK_DISCONNECTED:		Init state, waiting for ucore to start
> + * @LINK_NEGOTIATION:		Set local link state to up, wait for ucore ack
> + * @LINK_CONNECTED:		Link state up, channel not connected
> + * @LOCAL_CONNECTING:		Channel opening locally, wait for ucore ack
> + * @CHANNEL_CONNECTED:		Channel fully opened
> + * @LOCAL_DISCONNECTING:	Channel closing locally, wait for ucore ack
> + */
> +enum qmp_local_state {
> +	LINK_DISCONNECTED,
> +	LINK_NEGOTIATION,
> +	LINK_CONNECTED,
> +	LOCAL_CONNECTING,
> +	CHANNEL_CONNECTED,
> +	LOCAL_DISCONNECTING,
> +};
> +
> +union channel_desc {
> +	struct {
> +		u32 link_state:1;
> +		u32 link_state_ack:1;
> +		u32 ch_state:1;
> +		u32 ch_state_ack:1;
> +		u32 tx:1;
> +		u32 tx_ack:1;
> +		u32 rx_done:1;
> +		u32 rx_done_ack:1;
> +		u32 read_int:1;
> +		u32 read_int_ack:1;
> +		u32 reserved:6;
> +		u32 frag_size:8;
> +		u32 rem_frag_count:8;
> +	} bits;
> +	unsigned int val;
> +};
> +
> +struct qmp_work {
> +	struct work_struct work;
> +	void *data;
> +};
> +
> +/**
> + * struct qmp_device - local information for managing a single mailbox
> + * @dev:	    The device that corresponds to this mailbox
> + * @ctrl:	    The mbox controller for this mailbox
> + * @mcore_desc:	    Local core (APSS) mailbox descriptor
> + * @ucore_desc:	    Remote core (TME-L) mailbox descriptor
> + * @mcore:	    Local core (APSS) channel descriptor
> + * @ucore:	    Remote core (TME-L) channel descriptor
> + * @rx_pkt:	    Buffer to pass to client, holds received data from mailbox
> + * @tx_pkt:	    Buffer from client, holds data to send on mailbox
> + * @mbox_client:    Mailbox client for the IPC interrupt
> + * @mbox_chan:	    Mailbox client chan for the IPC interrupt
> + * @local_state:    Current state of mailbox protocol
> + * @state_lock:	    Serialize mailbox state changes
> + * @tx_lock:	    Serialize access for writes to mailbox
> + * @link_complete:  Use to block until link negotiation with remote proc
> + * @ch_complete:    Use to block until the channel is fully opened
> + * @dwork:	    Delayed work to detect timed out tx
> + * @tx_sent:	    True if tx is sent and remote proc has not sent ack
> + */
> +struct qmp_device {
> +	struct device *dev;
> +	struct mbox_controller ctrl;
> +	struct qmp_work qwork;
> +
> +	void __iomem *mcore_desc;
> +	void __iomem *ucore_desc;
> +	union channel_desc mcore;
> +	union channel_desc ucore;
> +
> +	struct kvec rx_pkt;
> +	struct kvec tx_pkt;
> +
> +	struct mbox_client mbox_client;
> +	struct mbox_chan *mbox_chan;
> +
> +	enum qmp_local_state local_state;
> +
> +	/* Lock for QMP link state changes */

Vague

> +	struct mutex state_lock;
> +	/* Lock to serialize access to mailbox */

No, I don't see serialized access to mailbox. I see some parts of access
being protected. Write descriptive lock descriptions.

> +	spinlock_t tx_lock;
> +
> +	struct completion link_complete;
> +	struct completion ch_complete;
> +	struct delayed_work dwork;
> +	void *data;
> +
> +	bool tx_sent;
> +	bool ch_in_use;
> +};
> +
> +struct tmel_msg_param_type_buf_in {
> +	u32 buf;
> +	u32 buf_len;
> +};
> +
> +struct tmel_secboot_sec_auth_req {
> +	u32 sw_id;
> +	struct tmel_msg_param_type_buf_in elf_buf;
> +	struct tmel_msg_param_type_buf_in region_list;
> +	u32 relocate;
> +} __packed;
> +
> +struct tmel_secboot_sec_auth_resp {
> +	u32 first_seg_addr;
> +	u32 first_seg_len;
> +	u32 entry_addr;
> +	u32 extended_error;
> +	u32 status;
> +} __packed;
> +
> +struct tmel_secboot_sec_auth {
> +	struct tmel_secboot_sec_auth_req req;
> +	struct tmel_secboot_sec_auth_resp resp;
> +} __packed;
> +
> +struct tmel_secboot_teardown_req {
> +	u32 sw_id;
> +	u32 secondary_sw_id;
> +} __packed;
> +
> +struct tmel_secboot_teardown_resp {
> +	u32 status;
> +} __packed;
> +
> +struct tmel_secboot_teardown {
> +	struct tmel_secboot_teardown_req req;
> +	struct tmel_secboot_teardown_resp resp;
> +} __packed;
> +
> +struct tmel {
> +	struct device *dev;
> +	struct qmp_device *mdev;
> +	struct kvec pkt;
> +	/* To serialize incoming tmel request */

No, explain what is exactly protected. We all know that mutex serializes...

> +	struct mutex lock;
> +	struct tmel_ipc_pkt *ipc_pkt;
> +	dma_addr_t sram_dma_addr;
> +	wait_queue_head_t waitq;
> +	bool rx_done;
> +};
> +
> +static struct tmel *tmeldev;

NAK, First: it is not needed, second: even if it in this spaghetti code
it was needed, answer would be drop it and fix your code not to create
fake singletons.

> +
> +/**
> + * qmp_send_irq() - send an irq to a remote entity as an event signal.
> + * @mdev:       Which remote entity that should receive the irq.
> + */
> +static void qmp_send_irq(struct qmp_device *mdev)
> +{
> +	/* Update the mcore val to mcore register */
> +	iowrite32(mdev->mcore.val, mdev->mcore_desc);
> +	/* Ensure desc update is visible before IPC */
> +	wmb();
> +
> +	dev_dbg(mdev->dev, "%s: mcore 0x%x ucore 0x%x", __func__,
> +		mdev->mcore.val, mdev->ucore.val);
> +
> +	mbox_send_message(mdev->mbox_chan, NULL);
> +	mbox_client_txdone(mdev->mbox_chan, 0);
> +}
> +

...

> +static irqreturn_t qmp_irq_handler(int irq, void *priv)
> +{
> +	struct qmp_device *mdev = (struct qmp_device *)priv;
> +
> +	qmp_rx(mdev);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int tmel_qmp_parse_devicetree(struct platform_device *pdev,
> +				     struct qmp_device *mdev)


Probe functions are always next to each other, not in other part of unit.

> +{
> +	struct device *dev = &pdev->dev;
> +
> +	mdev->mcore_desc = devm_platform_ioremap_resource(pdev, 0);
> +	if (!mdev->mcore_desc) {
> +		dev_err(dev, "ioremap failed for mcore reg\n");
> +		return -EIO;
> +	}
> +
> +	mdev->ucore_desc = mdev->mcore_desc + QMP_UCORE_DESC_OFFSET;
> +
> +	mdev->mbox_client.dev = dev;
> +	mdev->mbox_client.knows_txdone = false;
> +	mdev->mbox_chan = mbox_request_channel(&mdev->mbox_client, 0);
> +	if (IS_ERR(mdev->mbox_chan)) {
> +		dev_err(dev, "mbox chan for IPC is missing\n");

Syntax is: return dev_err_probe().

> +		return PTR_ERR(mdev->mbox_chan);
> +	}
> +
> +	return 0;
> +}
> +
> +static void tmel_qmp_remove(struct platform_device *pdev)

Again, why remove call is not next to probe?

> +{
> +	struct qmp_device *mdev = platform_get_drvdata(pdev);
> +
> +	mbox_controller_unregister(&mdev->ctrl);
> +	kfree(mdev->rx_pkt.iov_base);

I don't see this being allocated in probe.

> +}
> +
> +static struct device *tmel_get_device(void)
> +{
> +	struct tmel *tdev = tmeldev;

Nope. Do not create singletons.

> +
> +	if (!tdev)
> +		return NULL;
> +
> +	return tdev->dev;
> +}
> +
> +static int tmel_prepare_msg(struct tmel *tdev, u32 msg_uid,
> +			    void *msg_buf, size_t msg_size)
> +{
> +	struct tmel_ipc_pkt *ipc_pkt = tdev->ipc_pkt;
> +	struct ipc_header *msg_hdr = &ipc_pkt->msg_hdr;
> +	struct mbox_payload *mbox_payload = &ipc_pkt->payload.mbox_payload;
> +	struct sram_payload *sram_payload = &ipc_pkt->payload.sram_payload;
> +	int ret;
> +
> +	memset(ipc_pkt, 0, sizeof(struct tmel_ipc_pkt));
> +
> +	msg_hdr->msg_type = TMEL_MSG_UID_MSG_TYPE(msg_uid);
> +	msg_hdr->action_id = TMEL_MSG_UID_ACTION_ID(msg_uid);
> +
> +	pr_debug("uid: %d, msg_size: %zu msg_type:%d, action_id:%d\n",
> +		 msg_uid, msg_size, msg_hdr->msg_type, msg_hdr->action_id);

dev_dbg, stop using pr_ everywhere

> +
> +	if (sizeof(struct ipc_header) + msg_size <= MBOX_IPC_PACKET_SIZE) {
> +		/* Mbox only */
> +		msg_hdr->ipc_type = IPC_MBOX_ONLY;
> +		msg_hdr->msg_len = msg_size;
> +		memcpy((void *)mbox_payload, msg_buf, msg_size);
> +	} else if (msg_size <= SRAM_IPC_MAX_BUF_SIZE) {
> +		/* SRAM */
> +		msg_hdr->ipc_type = IPC_MBOX_SRAM;
> +		msg_hdr->msg_len = 8;
> +
> +		tdev->sram_dma_addr = dma_map_single(tdev->dev, msg_buf,
> +						     msg_size,
> +						     DMA_BIDIRECTIONAL);
> +		ret = dma_mapping_error(tdev->dev, tdev->sram_dma_addr);
> +		if (ret != 0) {
> +			pr_err("SRAM DMA mapping error: %d\n", ret);
> +			return ret;
> +		}
> +
> +		sram_payload->payload_ptr = tdev->sram_dma_addr;
> +		sram_payload->payload_len = msg_size;
> +	} else {
> +		pr_err("Invalid payload length: %zu\n", msg_size);

No, dev_err

> +	}
> +
> +	return 0;
> +}
> +
> +static void tmel_unprepare_message(struct tmel *tdev,
> +				   void *msg_buf, size_t msg_size)
> +{
> +	struct tmel_ipc_pkt *ipc_pkt = (struct tmel_ipc_pkt *)tdev->pkt.iov_base;
> +	struct mbox_payload *mbox_payload = &ipc_pkt->payload.mbox_payload;
> +
> +	if (ipc_pkt->msg_hdr.ipc_type == IPC_MBOX_ONLY) {
> +		memcpy(msg_buf, (void *)mbox_payload, msg_size);
> +	} else if (ipc_pkt->msg_hdr.ipc_type == IPC_MBOX_SRAM) {
> +		dma_unmap_single(tdev->dev, tdev->sram_dma_addr, msg_size,
> +				 DMA_BIDIRECTIONAL);
> +		tdev->sram_dma_addr = 0;
> +	}
> +}
> +
> +static bool tmel_rx_done(struct tmel *tdev)
> +{
> +	return tdev->rx_done;
> +}
> +
> +static int tmel_process_request(u32 msg_uid, void *msg_buf,
> +				size_t msg_size)
> +{
> +	struct tmel *tdev = tmeldev;
> +	unsigned long jiffies;
> +	struct tmel_ipc_pkt *resp_ipc_pkt;
> +	long time_left = 0;
> +	int ret = 0;
> +
> +	/*
> +	 * Check to handle if probe is not successful or not completed yet
> +	 */

No, it is impossible condition. This code cannot be called before probe.

Clean up your driver from such spaghetti prevention code and unspaghetti
it, so you will understand the code flow.


> +	if (!tdev) {
> +		pr_err("tmel dev is NULL\n");
> +		return -ENODEV;
> +	}
> +
> +	if (!msg_buf || !msg_size) {
> +		pr_err("Invalid msg_buf or msg_size\n");

No, use dev_err. This applies everywhere.

> +		return -EINVAL;
> +	}
> +
> +	mutex_lock(&tdev->lock);
> +	tdev->rx_done = false;
> +
> +	ret = tmel_prepare_msg(tdev, msg_uid, msg_buf, msg_size);
> +	if (ret)
> +		return ret;
> +
> +	tdev->pkt.iov_len = sizeof(struct tmel_ipc_pkt);
> +	tdev->pkt.iov_base = (void *)tdev->ipc_pkt;
> +
> +	qmp_send_data(tdev->mdev, &tdev->pkt);
> +	jiffies = msecs_to_jiffies(30000);
> +
> +	time_left = wait_event_interruptible_timeout(tdev->waitq,
> +						     tmel_rx_done(tdev),
> +						     jiffies);
> +
> +	if (!time_left) {
> +		pr_err("Request timed out\n");
> +		ret = -ETIMEDOUT;
> +		goto err_exit;
> +	}
> +
> +	if (tdev->pkt.iov_len != sizeof(struct tmel_ipc_pkt)) {
> +		pr_err("Invalid pkt.size received size: %lu, expected: %zu\n",
> +		       tdev->pkt.iov_len, sizeof(struct tmel_ipc_pkt));
> +		ret = -EPROTO;
> +		goto err_exit;
> +	}
> +
> +	resp_ipc_pkt = (struct tmel_ipc_pkt *)tdev->pkt.iov_base;
> +	tmel_unprepare_message(tdev, msg_buf, msg_size);
> +	tdev->rx_done = false;
> +	ret = resp_ipc_pkt->msg_hdr.response;
> +
> +err_exit:
> +	mutex_unlock(&tdev->lock);
> +	return ret;
> +}
> +
> +static int tmel_secboot_sec_auth(u32 sw_id, void *metadata, size_t size)
> +{
> +	struct device *dev = tmel_get_device();
> +	struct tmel_secboot_sec_auth *msg;
> +	dma_addr_t elf_buf_phys;
> +	void *elf_buf;
> +	int ret;
> +
> +	if (!dev || !metadata)
> +		return -EINVAL;
> +
> +	msg = kzalloc(sizeof(*msg), GFP_KERNEL);
> +
> +	elf_buf = dma_alloc_coherent(dev, size, &elf_buf_phys, GFP_KERNEL);
> +	if (!elf_buf)
> +		return -ENOMEM;
> +
> +	memcpy(elf_buf, metadata, size);
> +
> +	msg->req.sw_id = sw_id;
> +	msg->req.elf_buf.buf = (u32)elf_buf_phys;
> +	msg->req.elf_buf.buf_len = (u32)size;
> +
> +	ret = tmel_process_request(TMEL_MSG_UID_SECBOOT_SEC_AUTH, msg,
> +				   sizeof(struct tmel_secboot_sec_auth));
> +	if (ret) {
> +		pr_err("Failed to send IPC: %d\n", ret);
> +	} else if (msg->resp.status || msg->resp.extended_error) {
> +		pr_err("Failed with status: %d error: %d\n",
> +		       msg->resp.status, msg->resp.extended_error);
> +		ret = msg->resp.status;
> +	}
> +
> +	kfree(msg);
> +	dma_free_coherent(dev, size, elf_buf, elf_buf_phys);
> +
> +	return ret;
> +}
> +
> +static int tmel_secboot_teardown(u32 sw_id, u32 secondary_sw_id)
> +{
> +	struct device *dev = tmel_get_device();
> +	struct tmel_secboot_teardown msg = {0};
> +	int ret;
> +
> +	if (!dev)
> +		return -EINVAL;
> +
> +	msg.req.sw_id = sw_id;
> +	msg.req.secondary_sw_id = secondary_sw_id;
> +	msg.resp.status = TMEL_ERROR_GENERIC;
> +
> +	ret = tmel_process_request(TMEL_MSG_UID_SECBOOT_SS_TEAR_DOWN, &msg,
> +				   sizeof(msg));
> +	if (ret) {
> +		pr_err("Failed to send IPC: %d\n", ret);
> +	} else if (msg.resp.status) {
> +		pr_err("Failed with status: %d\n", msg.resp.status);
> +		ret = msg.resp.status;
> +	}
> +
> +	return ret;
> +}
> +
> +static int tmel_init(struct qmp_device *mdev)
> +{
> +	struct tmel *tdev;
> +
> +	tdev = devm_kzalloc(mdev->dev, sizeof(*tdev), GFP_KERNEL);
> +	if (!tdev)
> +		return -ENOMEM;
> +
> +	mutex_init(&tdev->lock);
> +
> +	tdev->ipc_pkt = devm_kzalloc(mdev->dev, sizeof(struct tmel_ipc_pkt),
> +				     GFP_KERNEL);
> +	if (!tdev->ipc_pkt)
> +		return -ENOMEM;
> +
> +	init_waitqueue_head(&tdev->waitq);
> +
> +	tdev->rx_done = false;
> +	tdev->dev = mdev->dev;
> +
> +	tmeldev = tdev;
> +	tmeldev->mdev = mdev;
> +
> +	return 0;
> +}
> +
> +static int tmel_qmp_send(struct mbox_chan *chan, void *data)
> +{
> +	struct qmp_device *mdev = chan->con_priv;
> +
> +	mdev->qwork.data =  data;
> +
> +	queue_work(system_wq, &mdev->qwork.work);
> +
> +	return 0;
> +}
> +
> +static void tmel_qmp_send_work(struct work_struct *work)
> +{
> +	struct qmp_work *qwork = container_of(work, struct qmp_work, work);
> +	struct qmp_device *mdev = tmeldev->mdev;
> +	struct mbox_chan *chan = &mdev->ctrl.chans[0];
> +
> +	struct tmel_qmp_msg *tmsg = qwork->data;
> +	struct tmel_sec_auth *smsg = tmsg->msg;
> +	int ret;
> +
> +	switch (tmsg->msg_id) {
> +	case TMEL_MSG_UID_SECBOOT_SEC_AUTH:
> +		ret = tmel_secboot_sec_auth(smsg->pas_id,
> +					    smsg->data,
> +					    smsg->size);
> +		break;
> +	case TMEL_MSG_UID_SECBOOT_SS_TEAR_DOWN:
> +		ret = tmel_secboot_teardown(smsg->pas_id, 0);
> +		break;
> +	}
> +
> +	mbox_chan_txdone(chan, 0);
> +}
> +
> +/**
> + * tmel_qmp_mbox_of_xlate() - Returns a mailbox channel to be used for this mailbox
> + *		      device. Make sure the channel is not already in use.
> + * @mbox:       Mailbox device controlls the requested channel.
> + * @spec:       Device tree arguments to specify which channel is requested.
> + */
> +static struct mbox_chan *tmel_qmp_mbox_of_xlate(struct mbox_controller *mbox,
> +						const struct of_phandle_args *spec)
> +{
> +	struct qmp_device *mdev = dev_get_drvdata(mbox->dev);
> +	unsigned int channel = spec->args[0];
> +
> +	if (!mdev)
> +		return ERR_PTR(-EPROBE_DEFER);
> +
> +	if (channel >= mbox->num_chans)
> +		return ERR_PTR(-EINVAL);
> +
> +	mutex_lock(&mdev->state_lock);
> +	if (mdev->ch_in_use) {
> +		dev_err(mdev->dev, "mbox channel already in use\n");
> +		mutex_unlock(&mdev->state_lock);
> +		return ERR_PTR(-EBUSY);


Why one cannot call xlate twice for the same argument? This looks wrong.
Xlate does not mean that mailbox is being used.


> +	}
> +	mdev->ch_in_use = true;
> +	mutex_unlock(&mdev->state_lock);
> +
> +	return &mbox->chans[0];
> +}
> +
> +static struct mbox_chan_ops tmel_qmp_ops = {
> +	.startup = tmel_qmp_startup,
> +	.shutdown = tmel_qmp_shutdown,
> +	.send_data = tmel_qmp_send,
> +};
> +
> +static int tmel_qmp_probe(struct platform_device *pdev)
> +{
> +	struct device_node *node = pdev->dev.of_node;
> +	struct mbox_chan *chans;
> +	struct qmp_device *mdev;
> +	int ret = 0;
> +
> +	mdev = devm_kzalloc(&pdev->dev, sizeof(*mdev), GFP_KERNEL);
> +	if (!mdev)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, mdev);
> +
> +	ret = tmel_qmp_parse_devicetree(pdev, mdev);
> +	if (ret)
> +		return ret;
> +
> +	mdev->dev = &pdev->dev;
> +
> +	chans = devm_kzalloc(mdev->dev,


devm_kcalloc

> +			     sizeof(*chans) * QMP_NUM_CHANS, GFP_KERNEL);
> +	if (!chans)
> +		return -ENOMEM;
> +
> +	INIT_WORK(&mdev->qwork.work, tmel_qmp_send_work);
> +
> +	mdev->ctrl.dev = &pdev->dev;
> +	mdev->ctrl.ops = &tmel_qmp_ops;
> +	mdev->ctrl.chans = chans;
> +	chans[0].con_priv = mdev;
> +	mdev->ctrl.num_chans = QMP_NUM_CHANS;
> +	mdev->ctrl.txdone_irq = true;
> +	mdev->ctrl.of_xlate = tmel_qmp_mbox_of_xlate;
> +
> +	ret = mbox_controller_register(&mdev->ctrl);
> +	if (ret) {
> +		dev_err(mdev->dev, "failed to register mbox controller\n");
> +		return ret;
> +	}
> +
> +	spin_lock_init(&mdev->tx_lock);
> +	mutex_init(&mdev->state_lock);
> +	mdev->local_state = LINK_DISCONNECTED;
> +	init_completion(&mdev->link_complete);
> +	init_completion(&mdev->ch_complete);
> +
> +	INIT_DELAYED_WORK(&mdev->dwork, qmp_notify_timeout);
> +
> +	ret = platform_get_irq(pdev, 0);
> +
> +	ret = devm_request_threaded_irq(mdev->dev, ret,
> +					NULL, qmp_irq_handler,
> +					IRQF_TRIGGER_RISING | IRQF_ONESHOT,
> +					node->name, (void *)mdev);
> +	if (ret < 0) {
> +		dev_err(mdev->dev, "request threaded irq failed, ret %d\n",
> +			ret);

dev_err_probe

> +




> +
> +static const struct of_device_id tmel_qmp_dt_match[] = {
> +	{ .compatible = "qcom,ipq5424-tmel-qmp" },
> +	{},
> +};
> +
> +static struct platform_driver tmel_qmp_driver = {
> +	.driver = {
> +		.name = "tmel_qmp_mbox",
> +		.of_match_table = tmel_qmp_dt_match,
> +	},
> +	.probe = tmel_qmp_probe,
> +	.remove = tmel_qmp_remove,
> +};
> +module_platform_driver(tmel_qmp_driver);
> +
> +MODULE_DESCRIPTION("QCOM TMEL QMP DRIVER");

"driver", this is not an acronym.

> +MODULE_LICENSE("GPL");
Best regards,
Krzysztof

