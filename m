Return-Path: <linux-arm-msm+bounces-40449-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BB72B9E4F58
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 09:09:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 773FD288F20
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 08:09:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 534EB1D3564;
	Thu,  5 Dec 2024 08:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dIx74bgB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA0F19645D;
	Thu,  5 Dec 2024 08:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733386153; cv=none; b=lQ+YthjpeZBjQ4qZmUjLCS44yXP733J5KGZYyGlkw4tNq5605Jyy7l5xheLyJyA9qhghwVP91kMnis3tiz0llfJAWh/AzLGiYHpbpKaF4HBFSGIqq8HwFsU/3QksV9uCQ5z0dyZ/m6zUKTUkfAlEXbcOAlW1ZxR00kK617+ZMWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733386153; c=relaxed/simple;
	bh=vNybodLUVrY7TLmdjoQ+Efi6eVqyhdJVSgd2fyAVKtw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HAHkTnWSYxhOaG1hHK/dO4y1lkwWs+CSF64MglxHscuvNnr7CsaQ/SJ9/AcWQ+mPtR0pcvXhGUyTKgjnCW1/vAcZu3C9uTM6qNxnFZjRJMlMKPLyNIFlEHspUZZSj3aI4/ShbfP/eIboUvFbxA9jgwNIlemKeeG3nHHVrBxoCok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dIx74bgB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B4NKImW025897;
	Thu, 5 Dec 2024 08:09:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zahlliXcSMtRAVCI9RKGgVseBlZYyWeb8o1vUjvques=; b=dIx74bgBg8k0NYEs
	qooOa1gLCidLJgnlIon2CrhWpu1slW9K71gm8hoIJDC5+UIsDGGnLLqP6j6qE753
	rM4lkGSJKF6VpqkhhK1Ax/j/NQulpBEVyOvyuxkTSyW8WaRifzCYe1jtAK2NYxrA
	Lwm0boCnlUMXuRHMNly3WQXZ+Vt1VAOrMPVaDqtpQzO77BKmnja0SuFJBjhVwkD8
	jXkfxjlomRec2ZVq0KYGusKhDficpgMc5N+WtJAvvd3x3wEf0tJT6PaFZmuFpznf
	wg4NH1M6BEhK0wCV43OsrfoDAvl40CTgn0hUJgN5fvl8dUZykfcHINWWaM8QQPHu
	m1gXzQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 439yr9p8q6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Dec 2024 08:09:03 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B5893IU026044
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 5 Dec 2024 08:09:03 GMT
Received: from hu-srichara-blr.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 5 Dec 2024 00:08:59 -0800
From: Sricharan R <quic_srichara@quicinc.com>
To: <jassisinghbrar@gmail.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <quic_srichara@quicinc.com>
Subject: [PATCH RFC 2/2] mailbox: tmelite-qmp: Introduce QCOM TMEL QMP mailbox driver
Date: Thu, 5 Dec 2024 13:36:33 +0530
Message-ID: <20241205080633.2623142-3-quic_srichara@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241205080633.2623142-1-quic_srichara@quicinc.com>
References: <20241205080633.2623142-1-quic_srichara@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: DuevDLb10efSQtTb9RKRZ-8tAMPosRo1
X-Proofpoint-GUID: DuevDLb10efSQtTb9RKRZ-8tAMPosRo1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 clxscore=1011 priorityscore=1501 mlxlogscore=999 phishscore=0
 lowpriorityscore=0 malwarescore=0 mlxscore=0 suspectscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412050059

From: Sricharan Ramabadhran <quic_srichara@quicinc.com>

The QMP mailbox is the primary means of communication between TME-L SS
and other subsystem on the SoC. A dedicated pair of inbound and outbound
mailboxes is implemented for each subsystem/external execution environment
which needs to communicate with TME-L for security services. The inbound
mailboxes are used to send IPC requests to TME-L, which are then processed
by TME-L firmware and accordingly the responses are sent to the requestor
via outbound mailboxes.

It is an IPC transport protocol which is light weight and supports
a subset of API's. It handles link initialization, negotiation,
establishment and communication across client(APPSS/BTSS/AUDIOSS)
and server(TME-L SS).

   -----------------------------------------------       ---------------------------------------------------
  |                                              |       |                                                 |
  |                 SOC  CLIENT                  | SOC   |                TME-L  SS                        |
  |                                              | AHB   |                                                 |
  |     ----------    ---------   ---------      |       | ------    -------     --------    ------------  |
  |     |        |    |       |   |       |      | WO    | |     | R |     |     |      |    |SERVICES   | |
  |     | APPS   |<-->| TMEL  |<->|       |------------->| | IN  |-->|     |     | TMEL |    |--------   | |
  |     |        |    | COM   |   | QMP   |      | RO    | |     | W | QMP |<--->| COM  |<-->| a) ATTEST | |
  |     |        |    |       |   |       |<-------------| | OUT |<--|     |     |      |    | b) CRYPTO | |
  |     |        |    |       |   |       |      |       | |     |   |     |     |      |    | .. more   | |
  |     ---------     ---------   ---------      |       | ------    -------     -------     ------------  |
  |                                              |       |                                                 |
   -----------------------------------------------       --------------------------------------------------

TME-L SS provides different kinds of services like secureboot, remote image authentication,
key management, crypto, OEM provisioning etc. This patch adds support for remote image
authentication. Support for rest of the services can be added.

Remote proc driver subscribes to this mailbox and uses the mbox_send_message to use
TME-L to securely authenticate/teardown the images.

The intention of posting this is to get the design reviewed/corrected since there are also
other possible ways of having this SS support.

a) Make TMEL QMP as a 'rpmsg' driver and clients can connect using rmpsg_send

b) Keep TMEL APIs seperately in drivers/firmware which would export APIs
   and QMP mailbox seperately.
   Clients can then call the exported APIS.

c) Combine both TMEL and QMP as mailbox (this is the approach used here)

Since clients like same rproc driver use SCM/TMEL across socs, the goal here was to abstract
the TMEL-QMP SS functionality, so that clients should be able to connect and send messages with
a common API.

Based on the feedback can explore any other options as well.

Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
---
 drivers/mailbox/Kconfig             |   7 +
 drivers/mailbox/Makefile            |   2 +
 drivers/mailbox/qcom-tmelite-qmp.c  | 949 ++++++++++++++++++++++++++++
 include/linux/mailbox/tmelcom-qmp.h | 157 +++++
 4 files changed, 1115 insertions(+)
 create mode 100644 drivers/mailbox/qcom-tmelite-qmp.c
 create mode 100644 include/linux/mailbox/tmelcom-qmp.h

diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig
index 6fb995778636..ecb588b608f5 100644
--- a/drivers/mailbox/Kconfig
+++ b/drivers/mailbox/Kconfig
@@ -295,4 +295,11 @@ config QCOM_IPCC
 	  acts as an interrupt controller for receiving interrupts from clients.
 	  Say Y here if you want to build this driver.
 
+config QCOM_TMEL_QMP_MAILBOX
+	tristate "QCOM Mailbox Protocol(QMP) for TME-L SS"
+	help
+	  Say yes to add support for the QMP Mailbox Protocol driver for TME-L.
+	  QMP is a lightweight communication protocol for sending messages to
+	  TME-L. This protocol fits into the Generic Mailbox Framework.
+	  QMP uses a mailbox registers.
 endif
diff --git a/drivers/mailbox/Makefile b/drivers/mailbox/Makefile
index 3c3c27d54c13..7bc836714c25 100644
--- a/drivers/mailbox/Makefile
+++ b/drivers/mailbox/Makefile
@@ -64,3 +64,5 @@ obj-$(CONFIG_SPRD_MBOX)		+= sprd-mailbox.o
 obj-$(CONFIG_QCOM_CPUCP_MBOX)	+= qcom-cpucp-mbox.o
 
 obj-$(CONFIG_QCOM_IPCC)		+= qcom-ipcc.o
+
+obj-$(CONFIG_QCOM_TMEL_QMP_MAILBOX) += qcom-tmelite-qmp.o
diff --git a/drivers/mailbox/qcom-tmelite-qmp.c b/drivers/mailbox/qcom-tmelite-qmp.c
new file mode 100644
index 000000000000..0e06ae13e1b9
--- /dev/null
+++ b/drivers/mailbox/qcom-tmelite-qmp.c
@@ -0,0 +1,949 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2018,2020 The Linux Foundation. All rights reserved.
+ * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <linux/completion.h>
+#include <linux/delay.h>
+#include <linux/dma-direction.h>
+#include <linux/dma-mapping.h>
+#include <linux/init.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/kthread.h>
+#include <linux/mailbox_client.h>
+#include <linux/mailbox_controller.h>
+#include <linux/mailbox/tmelcom-qmp.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_irq.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/spinlock.h>
+#include <linux/types.h>
+#include <linux/uaccess.h>
+#include <linux/uio.h>
+#include <linux/workqueue.h>
+
+#define QMP_NUM_CHANS	0x1
+#define QMP_TOUT_MS	1000
+#define MBOX_ALIGN_BYTES	3
+#define QMP_CTRL_DATA_SIZE	4
+#define QMP_MAX_PKT_SIZE	0x18
+#define QMP_UCORE_DESC_OFFSET	0x1000
+
+#define QMP_CH_VAR_GET(mdev, desc, var) ((mdev)->desc.bits.var)
+#define QMP_CH_VAR_SET(mdev, desc, var) (mdev)->desc.bits.var = 1
+#define QMP_CH_VAR_CLR(mdev, desc, var) (mdev)->desc.bits.var = 0
+
+#define QMP_MCORE_CH_VAR_GET(mdev, var)	QMP_CH_VAR_GET(mdev, mcore, var)
+#define QMP_MCORE_CH_VAR_SET(mdev, var)	QMP_CH_VAR_SET(mdev, mcore, var)
+#define QMP_MCORE_CH_VAR_CLR(mdev, var)	QMP_CH_VAR_CLR(mdev, mcore, var)
+
+#define QMP_MCORE_CH_VAR_TOGGLE(mdev, var) \
+	(mdev)->mcore.bits.var = !((mdev)->mcore.bits.var)
+#define QMP_MCORE_CH_ACKED_CHECK(mdev, var) \
+	((mdev)->ucore.bits.var == (mdev)->mcore.bits.var##_ack)
+#define QMP_MCORE_CH_ACK_UPDATE(mdev, var) \
+	(mdev)->mcore.bits.var##_ack = (mdev)->ucore.bits.var
+#define QMP_MCORE_CH_VAR_ACK_CLR(mdev, var) \
+	(mdev)->mcore.bits.var##_ack = 0
+
+#define QMP_UCORE_CH_VAR_GET(mdev, var)	QMP_CH_VAR_GET(mdev, ucore, var)
+#define QMP_UCORE_CH_ACKED_CHECK(mdev, var) \
+	((mdev)->mcore.bits.var == (mdev)->ucore.bits.var##_ack)
+#define QMP_UCORE_CH_VAR_TOGGLED_CHECK(mdev, var) \
+	((mdev)->ucore.bits.var != (mdev)->mcore.bits.var##_ack)
+
+/**
+ * enum qmp_local_state -	definition of the local state machine
+ * @LINK_DISCONNECTED:		Init state, waiting for ucore to start
+ * @LINK_NEGOTIATION:		Set local link state to up, wait for ucore ack
+ * @LINK_CONNECTED:		Link state up, channel not connected
+ * @LOCAL_CONNECTING:		Channel opening locally, wait for ucore ack
+ * @CHANNEL_CONNECTED:		Channel fully opened
+ * @LOCAL_DISCONNECTING:	Channel closing locally, wait for ucore ack
+ */
+enum qmp_local_state {
+	LINK_DISCONNECTED,
+	LINK_NEGOTIATION,
+	LINK_CONNECTED,
+	LOCAL_CONNECTING,
+	CHANNEL_CONNECTED,
+	LOCAL_DISCONNECTING,
+};
+
+union channel_desc {
+	struct {
+		u32 link_state:1;
+		u32 link_state_ack:1;
+		u32 ch_state:1;
+		u32 ch_state_ack:1;
+		u32 tx:1;
+		u32 tx_ack:1;
+		u32 rx_done:1;
+		u32 rx_done_ack:1;
+		u32 read_int:1;
+		u32 read_int_ack:1;
+		u32 reserved:6;
+		u32 frag_size:8;
+		u32 rem_frag_count:8;
+	} bits;
+	unsigned int val;
+};
+
+/**
+ * struct qmp_device - local information for managing a single mailbox
+ * @dev:	    The device that corresponds to this mailbox
+ * @ctrl:	    The mbox controller for this mailbox
+ * @mcore_desc:	    Local core (APSS) mailbox descriptor
+ * @ucore_desc:	    Remote core (TME-L) mailbox descriptor
+ * @mcore:	    Local core (APSS) channel descriptor
+ * @ucore:	    Remote core (TME-L) channel descriptor
+ * @rx_pkt:	    Buffer to pass to client, holds received data from mailbox
+ * @tx_pkt:	    Buffer from client, holds data to send on mailbox
+ * @mbox_client:    Mailbox client for the IPC interrupt
+ * @mbox_chan:	    Mailbox client chan for the IPC interrupt
+ * @local_state:    Current state of mailbox protocol
+ * @state_lock:	    Serialize mailbox state changes
+ * @tx_lock:	    Serialize access for writes to mailbox
+ * @link_complete:  Use to block until link negotiation with remote proc
+ * @ch_complete:    Use to block until the channel is fully opened
+ * @dwork:	    Delayed work to detect timed out tx
+ * @tx_sent:	    True if tx is sent and remote proc has not sent ack
+ */
+struct qmp_device {
+	struct device *dev;
+	struct mbox_controller ctrl;
+
+	void __iomem *mcore_desc;
+	void __iomem *ucore_desc;
+	union channel_desc mcore;
+	union channel_desc ucore;
+
+	struct kvec rx_pkt;
+	struct kvec tx_pkt;
+
+	struct mbox_client mbox_client;
+	struct mbox_chan *mbox_chan;
+
+	enum qmp_local_state local_state;
+
+	struct mutex state_lock;
+	spinlock_t tx_lock;
+
+	struct completion link_complete;
+	struct completion ch_complete;
+	struct delayed_work dwork;
+	void *data;
+
+	bool tx_sent;
+	bool ch_in_use;
+};
+
+struct tmel_msg_param_type_buf_in {
+	u32 buf;
+	u32 buf_len;
+};
+
+struct tmel_secboot_sec_auth_req {
+	u32 sw_id;
+	struct tmel_msg_param_type_buf_in elf_buf;
+	struct tmel_msg_param_type_buf_in region_list;
+	u32 relocate;
+} __packed;
+
+struct tmel_secboot_sec_auth_resp {
+	u32 first_seg_addr;
+	u32 first_seg_len;
+	u32 entry_addr;
+	u32 extended_error;
+	u32 status;
+} __packed;
+
+struct tmel_secboot_sec_auth {
+	struct tmel_secboot_sec_auth_req req;
+	struct tmel_secboot_sec_auth_resp resp;
+} __packed;
+
+struct tmel_secboot_teardown_req {
+	u32 sw_id;
+	u32 secondary_sw_id;
+} __packed;
+
+struct tmel_secboot_teardown_resp {
+	u32 status;
+} __packed;
+
+struct tmel_secboot_teardown {
+	struct tmel_secboot_teardown_req req;
+	struct tmel_secboot_teardown_resp resp;
+} __packed;
+
+struct tmelcom {
+	struct device *dev;
+	struct qmp_device *mdev;
+	struct mutex lock;
+	struct kvec pkt;
+	struct tmel_ipc_pkt *ipc_pkt;
+	dma_addr_t sram_dma_addr;
+	wait_queue_head_t waitq;
+	bool rx_done;
+};
+
+static struct tmelcom *tmeldev;
+
+/**
+ * send_irq() - send an irq to a remote entity as an event signal.
+ * @mdev:       Which remote entity that should receive the irq.
+ */
+static void send_irq(struct qmp_device *mdev)
+{
+	/* Update the mcore val to mcore register */
+	iowrite32(mdev->mcore.val, mdev->mcore_desc);
+	/* Ensure desc update is visible before IPC */
+	wmb();
+
+	dev_dbg(mdev->dev, "%s: mcore 0x%x ucore 0x%x", __func__,
+		mdev->mcore.val, mdev->ucore.val);
+
+	mbox_send_message(mdev->mbox_chan, NULL);
+	mbox_client_txdone(mdev->mbox_chan, 0);
+}
+
+/**
+ * qmp_notify_timeout() - Notify client of tx timeout with -ETIME
+ * @work:		  Structure for work that was scheduled.
+ */
+static void qmp_notify_timeout(struct work_struct *work)
+{
+	struct delayed_work *dwork = to_delayed_work(work);
+	struct qmp_device *mdev = container_of(dwork, struct qmp_device, dwork);
+	struct mbox_chan *chan = &mdev->ctrl.chans[0];
+	int err = -ETIME;
+	unsigned long flags;
+
+	spin_lock_irqsave(&mdev->tx_lock, flags);
+	if (!mdev->tx_sent) {
+		spin_unlock_irqrestore(&mdev->tx_lock, flags);
+		return;
+	}
+	mdev->tx_sent = false;
+	spin_unlock_irqrestore(&mdev->tx_lock, flags);
+	dev_dbg(mdev->dev, "%s: TX timeout", __func__);
+	mbox_chan_txdone(chan, err);
+}
+
+static inline void qmp_schedule_tx_timeout(struct qmp_device *mdev)
+{
+	schedule_delayed_work(&mdev->dwork, msecs_to_jiffies(QMP_TOUT_MS));
+}
+
+/**
+ * tme_qmp_startup() - Start qmp mailbox channel for communication. Waits for
+ *		       remote subsystem to open channel if link is not
+ *		       initated or until timeout.
+ * @chan:	       mailbox channel that is being opened.
+ *
+ * Return: 0 on succes or standard Linux error code.
+ */
+static int tme_qmp_startup(struct mbox_chan *chan)
+{
+	struct qmp_device *mdev = chan->con_priv;
+	int ret;
+
+	if (!mdev)
+		return -EINVAL;
+
+	ret = wait_for_completion_timeout(&mdev->link_complete,
+					  msecs_to_jiffies(QMP_TOUT_MS));
+	if (!ret)
+		return -EAGAIN;
+
+	mutex_lock(&mdev->state_lock);
+	if (mdev->local_state == LINK_CONNECTED) {
+		QMP_MCORE_CH_VAR_SET(mdev, ch_state);
+		mdev->local_state = LOCAL_CONNECTING;
+		dev_dbg(mdev->dev, "link complete, local connecting");
+		send_irq(mdev);
+	}
+	mutex_unlock(&mdev->state_lock);
+
+	ret = wait_for_completion_timeout(&mdev->ch_complete,
+					  msecs_to_jiffies(QMP_TOUT_MS));
+	if (!ret)
+		return -ETIME;
+
+	return 0;
+}
+
+/**
+ * qmp_send_data() - Copy the data to the channel's mailbox and notify
+ *		     remote subsystem of new data. This function will
+ *		     return an error if the previous message sent has
+ *		     not been read. Cannot Sleep.
+ * @chan:	mailbox channel that data is to be sent over.
+ * @data:	Data to be sent to remote processor, should be in the format of
+ *		a kvec.
+ *
+ * Return: 0 on succes or standard Linux error code.
+ */
+static int qmp_send_data(struct qmp_device *mdev, void *data)
+{
+	struct kvec *pkt = (struct kvec *)data;
+	void __iomem *addr;
+	unsigned long flags;
+
+	if (!mdev || !data || !completion_done(&mdev->ch_complete))
+		return -EINVAL;
+
+	if (pkt->iov_len > QMP_MAX_PKT_SIZE) {
+		dev_err(mdev->dev, "Unsupported packet size %lu\n", pkt->iov_len);
+		return -EINVAL;
+	}
+
+	spin_lock_irqsave(&mdev->tx_lock, flags);
+	if (mdev->tx_sent) {
+		spin_unlock_irqrestore(&mdev->tx_lock, flags);
+		return -EAGAIN;
+	}
+
+	dev_dbg(mdev->dev, "%s: mcore 0x%x ucore 0x%x", __func__,
+		mdev->mcore.val, mdev->ucore.val);
+
+	addr = mdev->mcore_desc + QMP_CTRL_DATA_SIZE;
+	memcpy_toio(addr, pkt->iov_base, pkt->iov_len);
+
+	mdev->mcore.bits.frag_size = pkt->iov_len;
+	mdev->mcore.bits.rem_frag_count = 0;
+
+	dev_dbg(mdev->dev, "Copied buffer to mbox, sz: %d",
+		mdev->mcore.bits.frag_size);
+
+	mdev->tx_sent = true;
+	QMP_MCORE_CH_VAR_TOGGLE(mdev, tx);
+	send_irq(mdev);
+	qmp_schedule_tx_timeout(mdev);
+	spin_unlock_irqrestore(&mdev->tx_lock, flags);
+
+	return 0;
+}
+
+/**
+ * tmel_qmp_shutdown() - Disconnect this mailbox channel so the client does not
+ *			 receive anymore data and can reliquish control
+ *			 of the channel.
+ * @chan:		 mailbox channel to be shutdown.
+ */
+static void tmel_qmp_shutdown(struct mbox_chan *chan)
+{
+	struct qmp_device *mdev = chan->con_priv;
+
+	mutex_lock(&mdev->state_lock);
+	if (mdev->local_state != LINK_DISCONNECTED) {
+		mdev->local_state = LOCAL_DISCONNECTING;
+		QMP_MCORE_CH_VAR_CLR(mdev, ch_state);
+		send_irq(mdev);
+	}
+	mutex_unlock(&mdev->state_lock);
+}
+
+
+static void tmelcom_receive_message(void *message)
+{
+	struct tmelcom *tdev = tmeldev;
+	struct kvec *pkt = NULL;
+
+	if (!message) {
+		pr_err("spurious message received\n");
+		goto tmelcom_receive_end;
+	}
+
+	if (tdev->rx_done) {
+		pr_err("tmelcom response pending\n");
+		goto tmelcom_receive_end;
+	}
+
+	pkt = (struct kvec *)message;
+	tdev->pkt.iov_len = pkt->iov_len;
+	tdev->pkt.iov_base = pkt->iov_base;
+	tdev->rx_done = true;
+
+tmelcom_receive_end:
+	wake_up_interruptible(&tdev->waitq);
+}
+
+/**
+ * qmp_recv_data() -	received notification that data is available in the
+ *			mailbox. Copy data from mailbox and pass to client.
+ * @mbox:		mailbox device that received the notification.
+ * @mbox_of:		offset of mailbox after QMP Control data.
+ */
+static void qmp_recv_data(struct qmp_device *mdev, u32 mbox_of)
+{
+	void __iomem *addr;
+	struct kvec *pkt;
+
+	addr = mdev->ucore_desc + mbox_of;
+	pkt = &mdev->rx_pkt;
+	pkt->iov_len = mdev->ucore.bits.frag_size;
+
+	memcpy_fromio(pkt->iov_base, addr, pkt->iov_len);
+	QMP_MCORE_CH_ACK_UPDATE(mdev, tx);
+	dev_dbg(mdev->dev, "%s: Send RX data to TMEL Client", __func__);
+	tmelcom_receive_message(pkt);
+
+	QMP_MCORE_CH_VAR_TOGGLE(mdev, rx_done);
+	send_irq(mdev);
+}
+
+/**
+ * clr_mcore_ch_state() - Clear the mcore state of a mailbox.
+ * @mdev:	mailbox device to be initialized.
+ */
+static void clr_mcore_ch_state(struct qmp_device *mdev)
+{
+	QMP_MCORE_CH_VAR_CLR(mdev, ch_state);
+	QMP_MCORE_CH_VAR_ACK_CLR(mdev, ch_state);
+
+	QMP_MCORE_CH_VAR_CLR(mdev, tx);
+	QMP_MCORE_CH_VAR_ACK_CLR(mdev, tx);
+
+	QMP_MCORE_CH_VAR_CLR(mdev, rx_done);
+	QMP_MCORE_CH_VAR_ACK_CLR(mdev, rx_done);
+
+	QMP_MCORE_CH_VAR_CLR(mdev, read_int);
+	QMP_MCORE_CH_VAR_ACK_CLR(mdev, read_int);
+
+	mdev->mcore.bits.frag_size = 0;
+	mdev->mcore.bits.rem_frag_count = 0;
+}
+
+/**
+ * qmp_rx() - Handle incoming messages from remote processor.
+ * @mbox:	mailbox device that received notification.
+ */
+static void qmp_rx(struct qmp_device *mdev)
+{
+	unsigned long flags;
+
+	/* read remote_desc from mailbox register */
+	mdev->ucore.val = ioread32(mdev->ucore_desc);
+
+	dev_dbg(mdev->dev, "%s: mcore 0x%x ucore 0x%x", __func__,
+		mdev->mcore.val, mdev->ucore.val);
+
+	mutex_lock(&mdev->state_lock);
+
+	/* Check if remote link down */
+	if ((mdev->local_state >= LINK_CONNECTED) &&
+	    (!QMP_UCORE_CH_VAR_GET(mdev, link_state))) {
+		mdev->local_state = LINK_NEGOTIATION;
+		QMP_MCORE_CH_ACK_UPDATE(mdev, link_state);
+		send_irq(mdev);
+		mutex_unlock(&mdev->state_lock);
+		return;
+	}
+
+	switch (mdev->local_state) {
+	case LINK_DISCONNECTED:
+		QMP_MCORE_CH_VAR_SET(mdev, link_state);
+		mdev->local_state = LINK_NEGOTIATION;
+		mdev->rx_pkt.iov_base = kzalloc(QMP_MAX_PKT_SIZE,
+						GFP_KERNEL);
+
+		if (!mdev->rx_pkt.iov_base) {
+			dev_err(mdev->dev, "rx pkt alloc failed");
+			break;
+		}
+		dev_dbg(mdev->dev, "Set to link negotiation");
+		send_irq(mdev);
+
+		break;
+	case LINK_NEGOTIATION:
+		if (!QMP_MCORE_CH_VAR_GET(mdev, link_state) ||
+		    !QMP_UCORE_CH_VAR_GET(mdev, link_state)) {
+			dev_err(mdev->dev, "rx irq:link down state\n");
+			break;
+		}
+
+		clr_mcore_ch_state(mdev);
+		QMP_MCORE_CH_ACK_UPDATE(mdev, link_state);
+		mdev->local_state = LINK_CONNECTED;
+		complete_all(&mdev->link_complete);
+		dev_dbg(mdev->dev, "Set to link connected");
+
+		break;
+	case LINK_CONNECTED:
+		/* No need to handle until local opens */
+		break;
+	case LOCAL_CONNECTING:
+		/* Ack to remote ch_state change */
+		QMP_MCORE_CH_ACK_UPDATE(mdev, ch_state);
+
+		mdev->local_state = CHANNEL_CONNECTED;
+		complete_all(&mdev->ch_complete);
+		dev_dbg(mdev->dev, "Set to channel connected");
+		send_irq(mdev);
+		break;
+	case CHANNEL_CONNECTED:
+		/* Check for remote channel down */
+		if (!QMP_UCORE_CH_VAR_GET(mdev, ch_state)) {
+			mdev->local_state = LOCAL_CONNECTING;
+			QMP_MCORE_CH_ACK_UPDATE(mdev, ch_state);
+			dev_dbg(mdev->dev, "Remote Disconnect");
+			send_irq(mdev);
+		}
+
+		spin_lock_irqsave(&mdev->tx_lock, flags);
+		/* Check TX done */
+		if (mdev->tx_sent &&
+		    QMP_UCORE_CH_VAR_TOGGLED_CHECK(mdev, rx_done)) {
+			/* Ack to remote */
+			QMP_MCORE_CH_ACK_UPDATE(mdev, rx_done);
+			mdev->tx_sent = false;
+			cancel_delayed_work(&mdev->dwork);
+			dev_dbg(mdev->dev, "TX flag cleared");
+			spin_unlock_irqrestore(&mdev->tx_lock, flags);
+			//mbox_chan_txdone(&mdev->ctrl.chans[0], 0);
+			spin_lock_irqsave(&mdev->tx_lock, flags);
+		}
+		spin_unlock_irqrestore(&mdev->tx_lock, flags);
+
+		/* Check if remote is Transmitting */
+		if (!QMP_UCORE_CH_VAR_TOGGLED_CHECK(mdev, tx))
+			break;
+		if ((mdev->ucore.bits.frag_size == 0) ||
+		    (mdev->ucore.bits.frag_size > QMP_MAX_PKT_SIZE)) {
+			dev_err(mdev->dev, "Rx frag size error %d\n",
+				mdev->ucore.bits.frag_size);
+			break;
+		}
+
+		qmp_recv_data(mdev, QMP_CTRL_DATA_SIZE);
+		break;
+	case LOCAL_DISCONNECTING:
+		if (!QMP_MCORE_CH_VAR_GET(mdev, ch_state)) {
+			clr_mcore_ch_state(mdev);
+			mdev->local_state = LINK_CONNECTED;
+			dev_dbg(mdev->dev, "Channel closed");
+			reinit_completion(&mdev->ch_complete);
+		}
+
+		break;
+	default:
+		dev_err(mdev->dev, "Local Channel State corrupted\n");
+	}
+	mutex_unlock(&mdev->state_lock);
+}
+
+static irqreturn_t qmp_irq_handler(int irq, void *priv)
+{
+	struct qmp_device *mdev = (struct qmp_device *)priv;
+
+	qmp_rx(mdev);
+
+	return IRQ_HANDLED;
+}
+
+static int qmp_parse_devicetree(struct platform_device *pdev,
+				struct qmp_device *mdev)
+{
+	struct device *dev = &pdev->dev;
+
+	mdev->mcore_desc = devm_platform_ioremap_resource(pdev, 0);
+	if (!mdev->mcore_desc) {
+		dev_err(dev, "ioremap failed for mcore reg\n");
+		return -EIO;
+	}
+
+	mdev->ucore_desc = mdev->mcore_desc + QMP_UCORE_DESC_OFFSET;
+
+	mdev->mbox_client.dev = dev;
+	mdev->mbox_client.knows_txdone = false;
+	mdev->mbox_chan = mbox_request_channel(&mdev->mbox_client, 0);
+	if (IS_ERR(mdev->mbox_chan)) {
+		dev_err(dev, "mbox chan for IPC is missing\n");
+		return PTR_ERR(mdev->mbox_chan);
+	}
+
+	return 0;
+}
+
+static void qmp_tmel_remove(struct platform_device *pdev)
+{
+	struct qmp_device *mdev = platform_get_drvdata(pdev);
+
+	mbox_controller_unregister(&mdev->ctrl);
+	kfree(mdev->rx_pkt.iov_base);
+}
+
+static struct device *tmelcom_get_device(void)
+{
+	struct tmelcom *tdev = tmeldev;
+
+	if (!tdev)
+		return NULL;
+
+	return tdev->dev;
+}
+
+static int tmelcom_prepare_msg(struct tmelcom *tdev, u32 msg_uid,
+			       void *msg_buf, size_t msg_size)
+{
+	struct tmel_ipc_pkt *ipc_pkt = tdev->ipc_pkt;
+	struct ipc_header *msg_hdr = &ipc_pkt->msg_hdr;
+	struct mbox_payload *mbox_payload = &ipc_pkt->payload.mbox_payload;
+	struct sram_payload *sram_payload = &ipc_pkt->payload.sram_payload;
+	int ret;
+
+	memset(ipc_pkt, 0, sizeof(struct tmel_ipc_pkt));
+
+	msg_hdr->msg_type = TMEL_MSG_UID_MSG_TYPE(msg_uid);
+	msg_hdr->action_id = TMEL_MSG_UID_ACTION_ID(msg_uid);
+
+	pr_debug("uid: %d, msg_size: %zu msg_type:%d, action_id:%d\n",
+		 msg_uid, msg_size, msg_hdr->msg_type, msg_hdr->action_id);
+
+	if (sizeof(struct ipc_header) + msg_size <= MBOX_IPC_PACKET_SIZE) {
+		/* Mbox only */
+		msg_hdr->ipc_type = IPC_MBOX_ONLY;
+		msg_hdr->msg_len = msg_size;
+		memcpy((void *)mbox_payload, msg_buf, msg_size);
+	} else if (msg_size <= SRAM_IPC_MAX_BUF_SIZE) {
+		/* SRAM */
+		msg_hdr->ipc_type = IPC_MBOX_SRAM;
+		msg_hdr->msg_len = 8;
+
+		tdev->sram_dma_addr = dma_map_single(tdev->dev, msg_buf,
+						     msg_size,
+						     DMA_BIDIRECTIONAL);
+		ret = dma_mapping_error(tdev->dev, tdev->sram_dma_addr);
+		if (ret != 0) {
+			pr_err("SRAM DMA mapping error: %d\n", ret);
+			return ret;
+		}
+
+		sram_payload->payload_ptr = tdev->sram_dma_addr;
+		sram_payload->payload_len = msg_size;
+	} else {
+		pr_err("Invalid payload length: %zu\n", msg_size);
+	}
+
+	return 0;
+}
+
+static void tmelcom_unprepare_message(struct tmelcom *tdev,
+				      void *msg_buf, size_t msg_size)
+{
+	struct tmel_ipc_pkt *ipc_pkt = (struct tmel_ipc_pkt *)tdev->pkt.iov_base;
+	struct mbox_payload *mbox_payload = &ipc_pkt->payload.mbox_payload;
+
+	if (ipc_pkt->msg_hdr.ipc_type == IPC_MBOX_ONLY) {
+		memcpy(msg_buf, (void *)mbox_payload, msg_size);
+	} else if (ipc_pkt->msg_hdr.ipc_type == IPC_MBOX_SRAM) {
+		dma_unmap_single(tdev->dev, tdev->sram_dma_addr, msg_size,
+				 DMA_BIDIRECTIONAL);
+		tdev->sram_dma_addr = 0;
+	}
+}
+
+static bool tmelcom_rx_done(struct tmelcom *tdev)
+{
+	return tdev->rx_done;
+}
+
+static int tmelcom_process_request(u32 msg_uid, void *msg_buf,
+				   size_t msg_size)
+{
+	struct tmelcom *tdev = tmeldev;
+	unsigned long jiffies;
+	struct tmel_ipc_pkt *resp_ipc_pkt;
+	long time_left = 0;
+	int ret = 0;
+
+	/*
+	 * Check to handle if probe is not successful or not completed yet
+	 */
+	if (!tdev) {
+		pr_err("tmelcom dev is NULL\n");
+		return -ENODEV;
+	}
+
+	if (!msg_buf || !msg_size) {
+		pr_err("Invalid msg_buf or msg_size\n");
+		return -EINVAL;
+	}
+
+	mutex_lock(&tdev->lock);
+	tdev->rx_done = false;
+
+	ret = tmelcom_prepare_msg(tdev, msg_uid, msg_buf, msg_size);
+	if (ret)
+		return ret;
+
+	tdev->pkt.iov_len = sizeof(struct tmel_ipc_pkt);
+	tdev->pkt.iov_base = (void *)tdev->ipc_pkt;
+
+	qmp_send_data(tdev->mdev, &tdev->pkt);
+	jiffies = msecs_to_jiffies(30000);
+
+	time_left = wait_event_interruptible_timeout(tdev->waitq,
+						     tmelcom_rx_done(tdev),
+						     jiffies);
+
+	if (!time_left) {
+		pr_err("Request timed out\n");
+		ret = -ETIMEDOUT;
+		goto err_exit;
+	}
+
+	if (tdev->pkt.iov_len != sizeof(struct tmel_ipc_pkt)) {
+		pr_err("Invalid pkt.size received size: %lu, expected: %zu\n",
+		       tdev->pkt.iov_len, sizeof(struct tmel_ipc_pkt));
+		ret = -EPROTO;
+		goto err_exit;
+	}
+
+	resp_ipc_pkt = (struct tmel_ipc_pkt *)tdev->pkt.iov_base;
+	tmelcom_unprepare_message(tdev, msg_buf, msg_size);
+	tdev->rx_done = false;
+	ret = resp_ipc_pkt->msg_hdr.response;
+
+err_exit:
+	mutex_unlock(&tdev->lock);
+	return ret;
+}
+
+static int tmelcom_secboot_sec_auth(u32 sw_id, void *metadata, size_t size)
+{
+	struct device *dev = tmelcom_get_device();
+	struct tmel_secboot_sec_auth *msg;
+	dma_addr_t elf_buf_phys;
+	void *elf_buf;
+	int ret;
+
+	if (!dev || !metadata)
+		return -EINVAL;
+
+	msg = kzalloc(sizeof(struct tmel_secboot_sec_auth), GFP_KERNEL);
+
+	elf_buf = dma_alloc_coherent(dev, size, &elf_buf_phys, GFP_KERNEL);
+	if (!elf_buf)
+		return -ENOMEM;
+
+	memcpy(elf_buf, metadata, size);
+
+	msg->req.sw_id = sw_id;
+	msg->req.elf_buf.buf = (u32)elf_buf_phys;
+	msg->req.elf_buf.buf_len = (u32)size;
+
+	ret = tmelcom_process_request(TMEL_MSG_UID_SECBOOT_SEC_AUTH, msg,
+				      sizeof(struct tmel_secboot_sec_auth));
+	if (ret) {
+		pr_err("Failed to send IPC: %d\n", ret);
+	} else if (msg->resp.status || msg->resp.extended_error) {
+		pr_err("Failed with status: %d error: %d\n",
+		       msg->resp.status, msg->resp.extended_error);
+		ret = msg->resp.status;
+	}
+
+	dma_free_coherent(dev, size, elf_buf, elf_buf_phys);
+
+	return ret;
+}
+
+static int tmelcom_secboot_teardown(u32 sw_id, u32 secondary_sw_id)
+{
+	struct device *dev = tmelcom_get_device();
+	struct tmel_secboot_teardown msg = {0};
+	int ret;
+
+	if (!dev)
+		return -EINVAL;
+
+	msg.req.sw_id = sw_id;
+	msg.req.secondary_sw_id = secondary_sw_id;
+	msg.resp.status = TMEL_ERROR_GENERIC;
+
+	ret = tmelcom_process_request(TMEL_MSG_UID_SECBOOT_SS_TEAR_DOWN, &msg,
+				      sizeof(msg));
+	if (ret) {
+		pr_err("Failed to send IPC: %d\n", ret);
+	} else if (msg.resp.status) {
+		pr_err("Failed with status: %d\n", msg.resp.status);
+		ret = msg.resp.status;
+	}
+
+	return ret;
+}
+
+static int tmelcom_init(struct qmp_device *mdev)
+{
+	struct tmelcom *tdev;
+
+	tdev = devm_kzalloc(mdev->dev, sizeof(*tdev), GFP_KERNEL);
+	if (!tdev)
+		return -ENOMEM;
+
+	mutex_init(&tdev->lock);
+
+	tdev->ipc_pkt = devm_kzalloc(mdev->dev, sizeof(struct tmel_ipc_pkt),
+				     GFP_KERNEL);
+	if (!tdev->ipc_pkt)
+		return -ENOMEM;
+
+	init_waitqueue_head(&tdev->waitq);
+
+	tdev->rx_done = false;
+	tdev->dev = mdev->dev;
+
+	tmeldev = tdev;
+	tmeldev->mdev = mdev;
+
+	return 0;
+}
+
+static int tme_qmp_send(struct mbox_chan *chan, void *data)
+{
+	struct tmel_qmp_msg *tmsg = data;
+	struct tmel_sec_auth *smsg = tmsg->msg;
+	int ret;
+
+	switch (tmsg->msg_id) {
+	case TMEL_MSG_UID_SECBOOT_SEC_AUTH:
+
+		ret = tmelcom_secboot_sec_auth(smsg->pas_id,
+					       smsg->data,
+					       smsg->size);
+		break;
+	case TMEL_MSG_UID_SECBOOT_SS_TEAR_DOWN:
+		ret = tmelcom_secboot_teardown(smsg->pas_id, 0);
+		break;
+	}
+
+	return ret;
+}
+
+/**
+ * qmp_mbox_of_xlate() - Returns a mailbox channel to be used for this mailbox
+ *		      device. Make sure the channel is not already in use.
+ * @mbox:       Mailbox device controlls the requested channel.
+ * @spec:       Device tree arguments to specify which channel is requested.
+ */
+static struct mbox_chan *qmp_mbox_of_xlate(struct mbox_controller *mbox,
+					   const struct of_phandle_args *spec)
+{
+	struct qmp_device *mdev = dev_get_drvdata(mbox->dev);
+	unsigned int channel = spec->args[0];
+
+	if (!mdev)
+		return ERR_PTR(-EPROBE_DEFER);
+
+	if (channel >= mbox->num_chans)
+		return ERR_PTR(-EINVAL);
+
+	mutex_lock(&mdev->state_lock);
+	if (mdev->ch_in_use) {
+		dev_err(mdev->dev, "mbox channel already in use\n");
+		mutex_unlock(&mdev->state_lock);
+		return ERR_PTR(-EBUSY);
+	}
+	mdev->ch_in_use = true;
+	mutex_unlock(&mdev->state_lock);
+
+	return &mbox->chans[0];
+}
+
+static struct mbox_chan_ops tmel_mbox_ops = {
+	.startup = tme_qmp_startup,
+	.shutdown = tmel_qmp_shutdown,
+	.send_data = tme_qmp_send,
+};
+
+static int qmp_tmel_probe(struct platform_device *pdev)
+{
+	struct device_node *node = pdev->dev.of_node;
+	struct mbox_chan *chans;
+	struct qmp_device *mdev;
+	int ret = 0;
+
+	mdev = devm_kzalloc(&pdev->dev, sizeof(*mdev), GFP_KERNEL);
+	if (!mdev)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, mdev);
+
+	ret = qmp_parse_devicetree(pdev, mdev);
+	if (ret)
+		return ret;
+
+	mdev->dev = &pdev->dev;
+
+	chans = devm_kzalloc(mdev->dev,
+			     sizeof(*chans) * QMP_NUM_CHANS, GFP_KERNEL);
+	if (!chans)
+		return -ENOMEM;
+
+	mdev->ctrl.dev = &pdev->dev;
+	mdev->ctrl.ops = &tmel_mbox_ops;
+	mdev->ctrl.chans = chans;
+	chans[0].con_priv = mdev;
+	mdev->ctrl.num_chans = QMP_NUM_CHANS;
+	mdev->ctrl.txdone_poll = false;
+	mdev->ctrl.of_xlate = qmp_mbox_of_xlate;
+
+	ret = mbox_controller_register(&mdev->ctrl);
+	if (ret) {
+		dev_err(mdev->dev, "failed to register mbox controller\n");
+		return ret;
+	}
+
+	spin_lock_init(&mdev->tx_lock);
+	mutex_init(&mdev->state_lock);
+	mdev->local_state = LINK_DISCONNECTED;
+	init_completion(&mdev->link_complete);
+	init_completion(&mdev->ch_complete);
+
+	INIT_DELAYED_WORK(&mdev->dwork, qmp_notify_timeout);
+
+	ret = platform_get_irq(pdev, 0);
+
+	ret = devm_request_threaded_irq(mdev->dev, ret,
+					NULL, qmp_irq_handler,
+					IRQF_TRIGGER_RISING | IRQF_ONESHOT,
+					node->name, (void *)mdev);
+	if (ret < 0) {
+		dev_err(mdev->dev, "request threaded irq failed, ret %d\n",
+			ret);
+
+		qmp_tmel_remove(pdev);
+		return ret;
+	}
+
+	/* Receive any outstanding initial data */
+	qmp_rx(mdev);
+	tmelcom_init(mdev);
+
+	return 0;
+}
+
+static const struct of_device_id qmp_tmel_dt_match[] = {
+	{ .compatible = "qcom,tmelite-qmp" },
+	{},
+};
+
+static struct platform_driver qmp_tmel_driver = {
+	.driver = {
+		.name = "tmel_qmp_mbox",
+		.of_match_table = qmp_tmel_dt_match,
+	},
+	.probe = qmp_tmel_probe,
+	.remove = qmp_tmel_remove,
+};
+module_platform_driver(qmp_tmel_driver);
+
+MODULE_DESCRIPTION("QCOM TMELITE QMP DRIVER");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/mailbox/tmelcom-qmp.h b/include/linux/mailbox/tmelcom-qmp.h
new file mode 100644
index 000000000000..9fa450eaf736
--- /dev/null
+++ b/include/linux/mailbox/tmelcom-qmp.h
@@ -0,0 +1,157 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2022,2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+#ifndef _TMELCOM_H_
+#define _TMELCOM_H_
+
+/*----------------------------------------------------------------------------
+ * Documentation
+ * --------------------------------------------------------------------------
+ */
+
+/*
+ * TMEL Messages Unique Identifiers bit layout
+    _____________________________________
+   |	   |	    |	   |
+   | 31------16| 15-------8 | 7-------0 |
+   | Reserved  |messageType | actionID  |
+   |___________|____________|___________|
+	       \___________  ___________/
+			   \/
+		      TMEL_MSG_UID
+*/
+
+/*
+ * TMEL Messages Unique Identifiers Parameter ID bit layout
+_________________________________________________________________________________________
+|     |     |     |     |     |     |     |     |     |     |     |    |    |    |       |
+|31-30|29-28|27-26|25-24|23-22|21-20|19-18|17-16|15-14|13-12|11-10|9--8|7--6|5--4|3-----0|
+| p14 | p13 | p12 | p11 | p10 | p9  | p8  | p7  | p6  | p5  | p4  | p3 | p2 | p1 | nargs |
+|type |type |type |type |type |type |type |type |type |type |type |type|type|type|       |
+|_____|_____|_____|_____|_____|_____|_____|_____|_____|_____|_____|____|____|____|_______|
+
+*/
+
+/*
+ * Macro used to define unique TMEL Message Identifier based on
+ * message type and action identifier.
+ */
+#define TMEL_MSG_UID_CREATE(m, a)	((u32)(((m & 0xff) << 8) | (a & 0xff)))
+
+/** Helper macro to extract the messageType from TMEL_MSG_UID. */
+#define TMEL_MSG_UID_MSG_TYPE(v)	((v & GENMASK(15, 8)) >> 8)
+
+/** Helper macro to extract the actionID from TMEL_MSG_UID. */
+#define TMEL_MSG_UID_ACTION_ID(v)	(v & GENMASK(7, 0))
+
+/****************************************************************************
+ *
+ * All definitions of supported messageType's.
+ *
+ * 0x00 -> 0xF0 messageType used for production use cases.
+ * 0xF1 -> 0xFF messageType reserved(can be used for test puprposes).
+ *
+ * <Template> : TMEL_MSG_<MSGTYPE_NAME>
+ * **************************************************************************/
+#define TMEL_MSG_SECBOOT		 0x00
+
+/****************************************************************************
+ *
+ * All definitions of action ID's per messageType.
+ *
+ * 0x00 -> 0xBF actionID used for production use cases.
+ * 0xC0 -> 0xFF messageType must be reserved for test use cases.
+ *
+ * NOTE: Test ID's shouldn't appear in this file.
+ *
+ * <Template> : TMEL_ACTION_<MSGTYPE_NAME>_<ACTIONID_NAME>
+ * **************************************************************************/
+
+/*
+ * ----------------------------------------------------------------------------
+		Action ID's for TMEL_MSG_SECBOOT
+ * ------------------------------------------------------------------------
+ */
+#define TMEL_ACTION_SECBOOT_SEC_AUTH		     0x04
+#define TMEL_ACTION_SECBOOT_SS_TEAR_DOWN	     0x0A
+
+/****************************************************************************
+ *
+ * All definitions of TMEL Message UID's (messageType | actionID).
+ *
+ * <Template> : TMEL_MSG_UID_<MSGTYPE_NAME>_<ACTIONID_NAME>
+ * *************************************************************************/
+
+/*----------------------------------------------------------------------------
+ * UID's for TMEL_MSG_SECBOOT
+ *-------------------------------------------------------------------------
+ */
+#define TMEL_MSG_UID_SECBOOT_SEC_AUTH	    TMEL_MSG_UID_CREATE(TMEL_MSG_SECBOOT,\
+					    TMEL_ACTION_SECBOOT_SEC_AUTH)
+
+#define TMEL_MSG_UID_SECBOOT_SS_TEAR_DOWN	TMEL_MSG_UID_CREATE(TMEL_MSG_SECBOOT,\
+						TMEL_ACTION_SECBOOT_SS_TEAR_DOWN)
+
+#define HW_MBOX_SIZE			32
+#define MBOX_QMP_CTRL_DATA_SIZE		4
+#define MBOX_RSV_SIZE			4
+#define MBOX_IPC_PACKET_SIZE		(HW_MBOX_SIZE - MBOX_QMP_CTRL_DATA_SIZE - MBOX_RSV_SIZE)
+#define MBOX_IPC_MAX_PARAMS		5
+
+#define MAX_PARAM_IN_PARAM_ID		14
+#define PARAM_CNT_FOR_PARAM_TYPE_OUTBUF	3
+#define SRAM_IPC_MAX_PARAMS		(MAX_PARAM_IN_PARAM_ID * PARAM_CNT_FOR_PARAM_TYPE_OUTBUF)
+#define SRAM_IPC_MAX_BUF_SIZE		(SRAM_IPC_MAX_PARAMS * sizeof(u32))
+
+#define TMEL_ERROR_GENERIC		(0x1U)
+#define TMEL_ERROR_NOT_SUPPORTED	(0x2U)
+#define TMEL_ERROR_BAD_PARAMETER	(0x3U)
+#define TMEL_ERROR_BAD_MESSAGE		(0x4U)
+#define TMEL_ERROR_BAD_ADDRESS		(0x5U)
+#define TMEL_ERROR_TMELCOM_FAILURE	(0x6U)
+#define TMEL_ERROR_TMEL_BUSY		(0x7U)
+
+enum ipc_type {
+	IPC_MBOX_ONLY,
+	IPC_MBOX_SRAM,
+};
+
+struct ipc_header {
+	u8 ipc_type:1;
+	u8 msg_len:7;
+	u8 msg_type;
+	u8 action_id;
+	s8 response;
+} __packed;
+
+struct mbox_payload {
+	u32 param[MBOX_IPC_MAX_PARAMS];
+};
+
+struct sram_payload {
+	u32 payload_ptr;
+	u32 payload_len;
+};
+
+union ipc_payload {
+	struct mbox_payload mbox_payload;
+	struct sram_payload sram_payload;
+} __packed;
+
+struct tmel_ipc_pkt {
+	struct ipc_header msg_hdr;
+	union ipc_payload payload;
+} __packed;
+
+struct tmel_qmp_msg {
+	void *msg;
+	u32 msg_id;
+};
+
+struct tmel_sec_auth {
+	void *data;
+	u32 size;
+	u32 pas_id;
+};
+#endif  /*_TMELCOM_H_ */
-- 
2.34.1


