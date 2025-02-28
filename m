Return-Path: <linux-arm-msm+bounces-49797-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED336A4909C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 05:55:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 37D083B84CC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 04:54:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50C221B21A9;
	Fri, 28 Feb 2025 04:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lA5f9RTS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2DBE1ADC89;
	Fri, 28 Feb 2025 04:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740718470; cv=none; b=Bdnvwid07w1TDuxXzauIujMvbVlKpLT2bXe20C+XsmZO0isVIKk2cUgEdO9McTfAr8pgkrxSWGwkQGr4/d2DdFBsOKm8T4juXOaUpaK3NhSix9frHp7NxRH9HSHL/wvKnLB+joTzhBjv490XPI+0PjZOPyflTZiJsYL4jqkslGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740718470; c=relaxed/simple;
	bh=8/j+HafkO4qXQgzmTZKLKTJtnVrEQJLsyfFWw+eTnHc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZAgEj+93CMn8MpGAEX8eQ047TtQwZ/UWwzdcZl72T54ch9G2+H+mEkmmzKsoK5aWzNGr06/7Fj6ImvHamT2f70HN84y040tDaJm8ma0r6eoZTKU4r7Pp7xpaTrUdNTWSMWAfz90XOjPIbBamO77MmX6c8fUfASVTXY6J7j34QAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lA5f9RTS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51RK9VE7005917;
	Fri, 28 Feb 2025 04:54:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	euVPPPVq64yKb/SCJ93Bmtfn2DRwC8z7sWjUF8EsZ34=; b=lA5f9RTSFG/TwX4E
	Id6HYalrT91ak/JbFIWRqdfCEcT1Sd6qFVJCZTBh4fUSppBsn0kZ6RcPXqs0SFix
	jySgWagJmx7WEcI0HzRHHUwf0iUlZlBk9rZR3yA+wWN0dCmdG9AQVdJeJ/gT55bS
	2TUwLgLK1capNN6HNk+Qn3hlx5RmQx5afo8FGngwiYdqE+PH7+QkX6QHzkEN0Jr5
	7tSXciHKFHoLpL+TB1NxUfQa55/NMQaMht9fYKLajxjzFJQmJKSauMt4LJousOkC
	wrIPARUDNO6wwtRIsZNrhYcuUlwC+R4X+WcGcnuUbC/BhMC8pAWmmeLpd9w2ANph
	5rO27w==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 452be6mkrx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Feb 2025 04:54:20 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51S4sJDX021443
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Feb 2025 04:54:19 GMT
Received: from hu-srichara-blr.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 27 Feb 2025 20:54:15 -0800
From: Sricharan R <quic_srichara@quicinc.com>
To: <jassisinghbrar@gmail.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <andersson@kernel.org>, <konradybcio@kernel.org>,
        <manivannan.sadhasivam@linaro.org>, <dmitry.baryshkov@linaro.org>,
        <quic_srichara@quicinc.com>
Subject: [PATCH V3 2/2] mailbox: tmelite-qmp: Introduce TMEL QMP mailbox driver
Date: Fri, 28 Feb 2025 10:23:56 +0530
Message-ID: <20250228045356.3527662-3-quic_srichara@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250228045356.3527662-1-quic_srichara@quicinc.com>
References: <20250228045356.3527662-1-quic_srichara@quicinc.com>
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
X-Proofpoint-GUID: XRSeLl3pFBQHCsihnZ3l7s0temAZm8Du
X-Proofpoint-ORIG-GUID: XRSeLl3pFBQHCsihnZ3l7s0temAZm8Du
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-27_08,2025-02-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 malwarescore=0
 impostorscore=0 mlxlogscore=999 phishscore=0 mlxscore=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2502280032

From: Sricharan Ramabadhran <quic_srichara@quicinc.com>

This mailbox facilitates the communication between the TME-L server based
subsystems (Q6) and the TME-L client (APPSS/BTSS/AUDIOSS), used for secure
services like secure image authentication, enable/disable efuses, crypto
services. Each client in the   SoC has its own block of message RAM and
IRQ for communication with the TME-L SS. The protocol used to communicate
in the message RAM is known as Qualcomm Messaging Protocol (QMP).

Remote proc driver subscribes to this mailbox and uses the
mbox_send_message to use TME-L to securely authenticate/teardown the
images.

Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
---
#V3:
---
        Fixed wrong code/comments wrappings.
        Fixed Kconfig and Makefile entries to right place.
        Removed unused headers inclusion.
        Fixed locking, removed the mutexes and having only tx spinlock.
        Removed the use of global ptr for tmel, made it as device specific.
        Replaced pr_err/pr_debug with dev_err/dev_dbg in all places.
        Fixed usage of dev_err_probe.
        Fixed xlate callback as per comments.
        Used devm equivalents and kcalloc version as per comments.
        Removed all un-nessecary wrapper macros for register access, inlined it
        as per comments.
        Re-organised the function layout as per comments and make it more readable.
        Removed the pictures in headers files as per comments.
        Used Field_prep/get as per comments.
        Fixed Kernel test reported issues.
        Fixed all other comments as well.

    Following tests were done and no issues.

       *)  Checkpatch
       *)  Codespell
       *)  Sparse
       *)  kerneldoc check
       *)  Kernel lock debugging
       *)  dt_binding_check and dtbs_check

 drivers/mailbox/Kconfig             |  10 +
 drivers/mailbox/Makefile            |   2 +
 drivers/mailbox/qcom-tmel-qmp.c     | 836 ++++++++++++++++++++++++++++
 include/linux/mailbox/tmelcom-qmp.h | 122 ++++
 4 files changed, 970 insertions(+)
 create mode 100644 drivers/mailbox/qcom-tmel-qmp.c
 create mode 100644 include/linux/mailbox/tmelcom-qmp.h

diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig
index ed52db272f4d..eee5a2a4aeb8 100644
--- a/drivers/mailbox/Kconfig
+++ b/drivers/mailbox/Kconfig
@@ -320,6 +320,16 @@ config QCOM_IPCC
 	  acts as an interrupt controller for receiving interrupts from clients.
 	  Say Y here if you want to build this driver.
 
+config QCOM_TMEL_QMP_MAILBOX
+	tristate "QCOM Mailbox Protocol(QMP) for TMEL SS"
+	depends on ARCH_QCOM || COMPILE_TEST
+	help
+	  Say yes to add support for the QMP Mailbox Protocol driver for
+	  Trust Management Engine-Lite Sub System (TMEL SS).
+	  QMP is a lightweight communication protocol for sending messages to
+	  TME-L. This protocol fits into the Generic Mailbox Framework.
+	  QMP uses a mailbox registers.
+
 config THEAD_TH1520_MBOX
 	tristate "T-head TH1520 Mailbox"
 	depends on ARCH_THEAD || COMPILE_TEST
diff --git a/drivers/mailbox/Makefile b/drivers/mailbox/Makefile
index 9a1542b55539..31d5a4f96690 100644
--- a/drivers/mailbox/Makefile
+++ b/drivers/mailbox/Makefile
@@ -69,4 +69,6 @@ obj-$(CONFIG_QCOM_CPUCP_MBOX)	+= qcom-cpucp-mbox.o
 
 obj-$(CONFIG_QCOM_IPCC)		+= qcom-ipcc.o
 
+obj-$(CONFIG_QCOM_TMEL_QMP_MAILBOX) += qcom-tmel-qmp.o
+
 obj-$(CONFIG_THEAD_TH1520_MBOX)	+= mailbox-th1520.o
diff --git a/drivers/mailbox/qcom-tmel-qmp.c b/drivers/mailbox/qcom-tmel-qmp.c
new file mode 100644
index 000000000000..f6479d7dba56
--- /dev/null
+++ b/drivers/mailbox/qcom-tmel-qmp.c
@@ -0,0 +1,836 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <linux/dma-mapping.h>
+#include <linux/interrupt.h>
+#include <linux/mailbox_client.h>
+#include <linux/mailbox_controller.h>
+#include <linux/mailbox/tmelcom-qmp.h>
+#include <linux/platform_device.h>
+#include <linux/uio.h>
+
+#define QMP_NUM_CHANS	0x1
+#define QMP_TOUT_MS	1000
+#define MBOX_ALIGN_BYTES	3
+#define QMP_CTRL_DATA_SIZE	4
+#define QMP_MAX_PKT_SIZE	0x18
+#define QMP_UCORE_DESC_OFFSET	0x1000
+#define QMP_SEND_TIMEOUT	30000
+
+/**
+ * enum qmp_local_state - definition of the local state machine
+ * @LINK_DISCONNECTED: Init state, waiting for ucore to start
+ * @LINK_NEGOTIATION: Set local link state to up, wait for ucore ack
+ * @LINK_CONNECTED: Link state up, channel not connected
+ * @LOCAL_CONNECTING: Channel opening locally, wait for ucore ack
+ * @CHANNEL_CONNECTED: Channel fully opened
+ * @LOCAL_DISCONNECTING: Channel closing locally, wait for ucore ack
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
+union qmp_channel_desc {
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
+ * @dev: The device that corresponds to this mailbox
+ * @mcore_desc: Local core (APSS) mailbox descriptor
+ * @ucore_desc: Remote core (TME-L) mailbox descriptor
+ * @mcore: Local core (APSS) channel descriptor
+ * @ucore: Remote core (TME-L) channel descriptor
+ * @rx_pkt: Buffer to pass to client, holds received data from mailbox
+ * @tx_pkt: Buffer from client, holds data to send on mailbox
+ * @mbox_client: Mailbox client for the IPC interrupt
+ * @mbox_chan: Mailbox client chan for the IPC interrupt
+ * @local_state: Current state of mailbox protocol
+ * @tx_lock: Serialize access for writes to mailbox
+ * @link_complete: Use to block until link negotiation with remote proc
+ * @ch_complete: Use to block until the channel is fully opened
+ * @tx_sent: True if tx is sent and remote proc has not sent ack
+ */
+struct qmp_device {
+	struct device *dev;
+
+	void __iomem *mcore_desc;
+	void __iomem *ucore_desc;
+	union qmp_channel_desc mcore;
+	union qmp_channel_desc ucore;
+
+	struct kvec rx_pkt;
+	struct kvec tx_pkt;
+
+	struct mbox_client mbox_client;
+	struct mbox_chan *mbox_chan;
+
+	enum qmp_local_state local_state;
+
+	/*
+	 * Serialize access to mcore IPC descriptors.
+	 * mcore refers to the IPC request descriptors sent to TMEL,
+	 * protecting it from various SM transitions using this.
+	 */
+	spinlock_t tx_lock;
+
+	struct completion link_complete;
+	struct completion ch_complete;
+
+	atomic_t tx_sent;
+};
+
+struct tmel_work {
+	struct work_struct work;
+	void *data;
+};
+
+struct tmel {
+	struct device *dev;
+	struct mbox_controller ctrl;
+	struct qmp_device *mdev;
+	struct tmel_work qwork;
+	struct kvec pkt;
+	struct tmel_ipc_pkt *ipc_pkt;
+	dma_addr_t sram_dma_addr;
+	wait_queue_head_t waitq;
+	bool rx_done;
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
+/**
+ * qmp_send_irq() - send an irq to a remote entity as an event signal.
+ * @mdev: Which remote entity that should receive the irq.
+ */
+static void qmp_send_irq(struct qmp_device *mdev)
+{
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
+ * qmp_send_data() - Copy the data to the channel's mailbox and notify
+ *		     remote subsystem of new data. This function will
+ *		     return an error if the previous message sent has
+ *		     not been read. Cannot Sleep.
+ * @mdev: qmp_device to send the data to.
+ * @data: Data to be sent to remote processor, should be in the format of
+ *	  a kvec.
+ *
+ * Return: 0 on success or standard Linux error code.
+ */
+static int qmp_send_data(struct qmp_device *mdev, void *data)
+{
+	struct kvec *pkt = (struct kvec *)data;
+	void __iomem *addr;
+	unsigned long flags;
+
+	if (pkt->iov_len > QMP_MAX_PKT_SIZE) {
+		dev_err(mdev->dev, "Unsupported packet size %ld\n", pkt->iov_len);
+		return -EINVAL;
+	}
+
+	if (atomic_read(&mdev->tx_sent))
+		return -EAGAIN;
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
+	atomic_set(&mdev->tx_sent, 1);
+
+	spin_lock_irqsave(&mdev->tx_lock, flags);
+	mdev->mcore.bits.tx = !(mdev->mcore.bits.tx);
+	qmp_send_irq(mdev);
+	spin_unlock_irqrestore(&mdev->tx_lock, flags);
+
+	return 0;
+}
+
+static void qmp_notify_client(struct tmel *tdev, void *message)
+{
+	struct kvec *pkt = NULL;
+
+	if (!message) {
+		dev_err(tdev->dev, "spurious message received\n");
+		goto notify_fail;
+	}
+
+	if (tdev->rx_done) {
+		dev_err(tdev->dev, "tmel response pending\n");
+		goto notify_fail;
+	}
+
+	pkt = (struct kvec *)message;
+	tdev->pkt.iov_len = pkt->iov_len;
+	tdev->pkt.iov_base = pkt->iov_base;
+	tdev->rx_done = true;
+
+notify_fail:
+	wake_up_interruptible(&tdev->waitq);
+}
+
+/**
+ * qmp_recv_data() - received notification that data is available in the
+ *		     mailbox. Copy data from mailbox and pass to client.
+ * @tdev: tmel device that received the notification.
+ * @mbox_of: offset of mailbox after QMP Control data.
+ */
+static void qmp_recv_data(struct tmel *tdev, u32 mbox_of)
+{
+	struct qmp_device *mdev = tdev->mdev;
+	void __iomem *addr;
+	struct kvec *pkt;
+
+	addr = mdev->ucore_desc + mbox_of;
+	pkt = &mdev->rx_pkt;
+	pkt->iov_len = mdev->ucore.bits.frag_size;
+
+	memcpy_fromio(pkt->iov_base, addr, pkt->iov_len);
+	mdev->mcore.bits.tx_ack = mdev->ucore.bits.tx;
+	dev_dbg(mdev->dev, "%s: Send RX data to TMEL Client", __func__);
+	qmp_notify_client(tdev, pkt);
+
+	mdev->mcore.bits.rx_done = !(mdev->mcore.bits.rx_done);
+	qmp_send_irq(mdev);
+}
+
+/**
+ * qmp_clr_mcore_ch_state() - Clear the mcore state of a mailbox.
+ * @mdev: mailbox device to be initialized.
+ */
+static void qmp_clr_mcore_ch_state(struct qmp_device *mdev)
+{
+	/* Clear all fields except link_state */
+	mdev->mcore.bits.ch_state = 0;
+	mdev->mcore.bits.ch_state_ack = 0;
+	mdev->mcore.bits.tx =  0;
+	mdev->mcore.bits.tx_ack =  0;
+	mdev->mcore.bits.rx_done = 0;
+	mdev->mcore.bits.rx_done_ack = 0;
+	mdev->mcore.bits.read_int = 0;
+	mdev->mcore.bits.read_int_ack = 0;
+	mdev->mcore.bits.frag_size = 0;
+	mdev->mcore.bits.rem_frag_count = 0;
+}
+
+/**
+ * qmp_rx() - Handle incoming messages from remote processor.
+ * @tdev: tmel device to send the event to.
+ */
+static void qmp_rx(struct tmel *tdev)
+{
+	struct qmp_device *mdev = tdev->mdev;
+	unsigned long flags;
+
+	/* read remote_desc from mailbox register */
+	mdev->ucore.val = ioread32(mdev->ucore_desc);
+
+	dev_dbg(mdev->dev, "%s: mcore 0x%x ucore 0x%x", __func__,
+		mdev->mcore.val, mdev->ucore.val);
+
+	spin_lock_irqsave(&mdev->tx_lock, flags);
+
+	/* Check if remote link down */
+	if (mdev->local_state >= LINK_CONNECTED &&
+	    !(mdev->ucore.bits.link_state)) {
+		mdev->local_state = LINK_NEGOTIATION;
+		mdev->mcore.bits.link_state_ack = mdev->ucore.bits.link_state;
+		qmp_send_irq(mdev);
+		spin_unlock_irqrestore(&mdev->tx_lock, flags);
+		return;
+	}
+
+	switch (mdev->local_state) {
+	case LINK_NEGOTIATION:
+		if (!(mdev->mcore.bits.link_state) ||
+		    !(mdev->ucore.bits.link_state)) {
+			dev_err(mdev->dev, "rx irq:link down state\n");
+			break;
+		}
+		qmp_clr_mcore_ch_state(mdev);
+		mdev->mcore.bits.link_state_ack = mdev->ucore.bits.link_state;
+		mdev->local_state = LINK_CONNECTED;
+		complete_all(&mdev->link_complete);
+		dev_dbg(mdev->dev, "Set to link connected");
+		break;
+	case LINK_CONNECTED:
+		/* No need to handle until local opens */
+		break;
+	case LOCAL_CONNECTING:
+		/* Ack to remote ch_state change */
+		mdev->mcore.bits.ch_state_ack = mdev->ucore.bits.ch_state;
+		mdev->local_state = CHANNEL_CONNECTED;
+		complete_all(&mdev->ch_complete);
+		dev_dbg(mdev->dev, "Set to channel connected");
+		qmp_send_irq(mdev);
+		break;
+	case CHANNEL_CONNECTED:
+		/* Check for remote channel down */
+		if (!(mdev->ucore.bits.ch_state)) {
+			mdev->local_state = LOCAL_CONNECTING;
+			mdev->mcore.bits.ch_state_ack = mdev->ucore.bits.ch_state;
+			dev_dbg(mdev->dev, "Remote Disconnect");
+			qmp_send_irq(mdev);
+		}
+
+		/* Check TX done */
+		if (atomic_read(&mdev->tx_sent) &&
+		    mdev->ucore.bits.rx_done != mdev->mcore.bits.rx_done_ack) {
+			/* Ack to remote */
+			mdev->mcore.bits.rx_done_ack = mdev->ucore.bits.rx_done;
+			atomic_set(&mdev->tx_sent, 0);
+			dev_dbg(mdev->dev, "TX flag cleared");
+		}
+
+		/* Check if remote is Transmitting */
+		if (!(mdev->ucore.bits.tx != mdev->mcore.bits.tx_ack))
+			break;
+		if (mdev->ucore.bits.frag_size == 0 ||
+		    mdev->ucore.bits.frag_size > QMP_MAX_PKT_SIZE) {
+			dev_err(mdev->dev, "Rx frag size error %d\n",
+				mdev->ucore.bits.frag_size);
+			break;
+		}
+		qmp_recv_data(tdev, QMP_CTRL_DATA_SIZE);
+		break;
+	case LOCAL_DISCONNECTING:
+		if (!(mdev->mcore.bits.ch_state)) {
+			qmp_clr_mcore_ch_state(mdev);
+			mdev->local_state = LINK_CONNECTED;
+			dev_dbg(mdev->dev, "Channel closed");
+			reinit_completion(&mdev->ch_complete);
+		}
+
+		break;
+	default:
+		dev_err(mdev->dev, "Local Channel State corrupted\n");
+	}
+	spin_unlock_irqrestore(&mdev->tx_lock, flags);
+}
+
+static irqreturn_t qmp_irq_handler(int irq, void *priv)
+{
+	struct tmel *tdev = (struct tmel *)priv;
+
+	qmp_rx(tdev);
+
+	return IRQ_HANDLED;
+}
+
+static int tmel_prepare_msg(struct tmel *tdev, u32 msg_uid, void *msg_buf, size_t msg_size)
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
+	dev_dbg(tdev->dev, "uid: %d, msg_size: %zu msg_type:%d, action_id:%d\n",
+		msg_uid, msg_size, msg_hdr->msg_type, msg_hdr->action_id);
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
+		if (ret) {
+			dev_err(tdev->dev, "SRAM DMA mapping error: %d\n", ret);
+			return ret;
+		}
+
+		sram_payload->payload_ptr = tdev->sram_dma_addr;
+		sram_payload->payload_len = msg_size;
+	} else {
+		dev_err(tdev->dev, "Invalid payload length: %zu\n", msg_size);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static void tmel_unprepare_message(struct tmel *tdev, void *msg_buf, size_t msg_size)
+{
+	struct tmel_ipc_pkt *ipc_pkt = (struct tmel_ipc_pkt *)tdev->pkt.iov_base;
+	struct mbox_payload *mbox_payload = &ipc_pkt->payload.mbox_payload;
+
+	if (ipc_pkt->msg_hdr.ipc_type == IPC_MBOX_ONLY) {
+		memcpy(msg_buf, (void *)mbox_payload, msg_size);
+	} else if (ipc_pkt->msg_hdr.ipc_type == IPC_MBOX_SRAM) {
+		dma_unmap_single(tdev->dev, tdev->sram_dma_addr, msg_size, DMA_BIDIRECTIONAL);
+		tdev->sram_dma_addr = 0;
+	}
+}
+
+static bool tmel_rx_done(struct tmel *tdev)
+{
+	return tdev->rx_done;
+}
+
+static int tmel_process_request(struct tmel *tdev, u32 msg_uid,
+				void *msg_buf, size_t msg_size)
+{
+	struct qmp_device *mdev = tdev->mdev;
+	struct tmel_ipc_pkt *resp_ipc_pkt;
+	struct mbox_chan *chan;
+	unsigned long jiffies;
+	long time_left = 0;
+	int ret = 0;
+
+	chan = &tdev->ctrl.chans[0];
+
+	if (!msg_buf || !msg_size) {
+		dev_err(tdev->dev, "Invalid msg_buf or msg_size\n");
+		return -EINVAL;
+	}
+
+	tdev->rx_done = false;
+
+	ret = tmel_prepare_msg(tdev, msg_uid, msg_buf, msg_size);
+	if (ret)
+		return ret;
+
+	tdev->pkt.iov_len = sizeof(struct tmel_ipc_pkt);
+	tdev->pkt.iov_base = (void *)tdev->ipc_pkt;
+
+	qmp_send_data(mdev, &tdev->pkt);
+	jiffies = msecs_to_jiffies(QMP_SEND_TIMEOUT);
+
+	time_left = wait_event_interruptible_timeout(tdev->waitq,
+						     tmel_rx_done(tdev),
+						     jiffies);
+
+	if (!time_left) {
+		dev_err(tdev->dev, "Request timed out\n");
+		atomic_set(&mdev->tx_sent, 0);
+		ret = -ETIMEDOUT;
+		mbox_chan_txdone(chan, ret);
+		goto err_exit;
+	}
+
+	if (tdev->pkt.iov_len != sizeof(struct tmel_ipc_pkt)) {
+		dev_err(tdev->dev, "Invalid pkt.size received size: %ld, expected: %zu\n",
+			tdev->pkt.iov_len, sizeof(struct tmel_ipc_pkt));
+		ret = -EPROTO;
+		goto err_exit;
+	}
+
+	resp_ipc_pkt = (struct tmel_ipc_pkt *)tdev->pkt.iov_base;
+	tmel_unprepare_message(tdev, msg_buf, msg_size);
+	tdev->rx_done = false;
+	ret = resp_ipc_pkt->msg_hdr.response;
+
+err_exit:
+	return ret;
+}
+
+static int tmel_secboot_sec_auth(struct tmel *tdev, u32 sw_id, void *metadata, size_t size)
+{
+	struct tmel_secboot_sec_auth *msg;
+	struct device *dev = tdev->dev;
+	dma_addr_t elf_buf_phys;
+	void *elf_buf;
+	int ret;
+
+	if (!dev || !metadata)
+		return -EINVAL;
+
+	msg = kzalloc(sizeof(*msg), GFP_KERNEL);
+
+	elf_buf = dma_alloc_coherent(dev, size, &elf_buf_phys, GFP_KERNEL);
+	if (!elf_buf) {
+		kfree(msg);
+		return -ENOMEM;
+	}
+
+	memcpy(elf_buf, metadata, size);
+
+	msg->req.sw_id = sw_id;
+	msg->req.elf_buf.buf = (u32)elf_buf_phys;
+	msg->req.elf_buf.buf_len = (u32)size;
+
+	ret = tmel_process_request(tdev, TMEL_MSG_UID_SECBOOT_SEC_AUTH, msg,
+				   sizeof(struct tmel_secboot_sec_auth));
+	if (ret) {
+		dev_err(dev, "Failed to send IPC: %d\n", ret);
+	} else if (msg->resp.status) {
+		dev_err(dev, "Failed with status: %d", msg->resp.status);
+		ret = msg->resp.status;
+	} else if (msg->resp.extended_error) {
+		dev_err(dev, "Failed with error: %d", msg->resp.extended_error);
+		ret = msg->resp.extended_error;
+	}
+
+	kfree(msg);
+	dma_free_coherent(dev, size, elf_buf, elf_buf_phys);
+
+	return ret;
+}
+
+static int tmel_secboot_teardown(struct tmel *tdev, u32 sw_id, u32 secondary_sw_id)
+{
+	struct tmel_secboot_teardown msg = {0};
+	struct device *dev = tdev->dev;
+	int ret;
+
+	if (!dev)
+		return -EINVAL;
+
+	msg.req.sw_id = sw_id;
+	msg.req.secondary_sw_id = secondary_sw_id;
+	msg.resp.status = TMEL_ERROR_GENERIC;
+
+	ret = tmel_process_request(tdev, TMEL_MSG_UID_SECBOOT_SS_TEAR_DOWN,
+				   &msg, sizeof(msg));
+	if (ret) {
+		dev_err(dev, "Failed to send IPC: %d\n", ret);
+	} else if (msg.resp.status) {
+		dev_err(dev, "Failed with status: %d\n", msg.resp.status);
+		ret = msg.resp.status;
+	}
+
+	return ret;
+}
+
+static void tmel_qmp_send_work(struct work_struct *work)
+{
+	struct tmel_work *qwork = container_of(work, struct tmel_work, work);
+	struct tmel *tdev = container_of(qwork, struct tmel, qwork);
+	struct tmel_qmp_msg *tmsg = qwork->data;
+	struct tmel_sec_auth *smsg = tmsg->msg;
+	struct mbox_chan *chan;
+
+	chan = &tdev->ctrl.chans[0];
+
+	switch (tmsg->msg_id) {
+	case TMEL_MSG_UID_SECBOOT_SEC_AUTH:
+		tmel_secboot_sec_auth(tdev, smsg->pas_id, smsg->data, smsg->size);
+		break;
+	case TMEL_MSG_UID_SECBOOT_SS_TEAR_DOWN:
+		tmel_secboot_teardown(tdev, smsg->pas_id, 0);
+		break;
+	}
+
+	mbox_chan_txdone(chan, 0);
+}
+
+/**
+ * tmel_qmp_startup() - Start qmp mailbox channel for communication. Waits for
+ *			remote subsystem to open channel if link is not
+ *			initiated or until timeout.
+ * @chan: mailbox channel that is being opened.
+ *
+ * Return: 0 on success or standard Linux error code.
+ */
+static int tmel_qmp_startup(struct mbox_chan *chan)
+{
+	struct tmel *tdev = chan->con_priv;
+	struct qmp_device *mdev = tdev->mdev;
+	unsigned long flags;
+	int ret;
+
+	/*
+	 * Kick start the SM from the negotiation phase
+	 * Rest of the link changes would follow when remote responds.
+	 */
+	mdev->mcore.bits.link_state = 1;
+	mdev->local_state = LINK_NEGOTIATION;
+	mdev->rx_pkt.iov_base = devm_kcalloc(mdev->dev, 1, QMP_MAX_PKT_SIZE, GFP_KERNEL);
+	if (!mdev->rx_pkt.iov_base)
+		return -ENOMEM;
+
+	qmp_send_irq(mdev);
+
+	ret = wait_for_completion_timeout(&mdev->link_complete, msecs_to_jiffies(QMP_TOUT_MS));
+	if (!ret)
+		return -EAGAIN;
+
+	spin_lock_irqsave(&mdev->tx_lock, flags);
+	if (mdev->local_state == LINK_CONNECTED) {
+		mdev->mcore.bits.ch_state = 1;
+		mdev->local_state = LOCAL_CONNECTING;
+		dev_dbg(mdev->dev, "link complete, local connecting");
+		qmp_send_irq(mdev);
+	}
+	spin_unlock_irqrestore(&mdev->tx_lock, flags);
+
+	ret = wait_for_completion_timeout(&mdev->ch_complete, msecs_to_jiffies(QMP_TOUT_MS));
+	if (!ret)
+		return -ETIME;
+
+	return 0;
+}
+
+/*
+ * tmel_qmp_shutdown() - Disconnect this mailbox channel so the client does not
+ *			 receive anymore data and can reliquish control
+ *			 of the channel.
+ * @chan: mailbox channel to be shutdown.
+ */
+static void tmel_qmp_shutdown(struct mbox_chan *chan)
+{
+	struct qmp_device *mdev = chan->con_priv;
+	unsigned long flags;
+
+	spin_lock_irqsave(&mdev->tx_lock, flags);
+	if (mdev->local_state != LINK_DISCONNECTED) {
+		mdev->local_state = LOCAL_DISCONNECTING;
+		mdev->mcore.bits.ch_state = 0;
+		qmp_send_irq(mdev);
+	}
+	spin_unlock_irqrestore(&mdev->tx_lock, flags);
+}
+
+static int tmel_qmp_send(struct mbox_chan *chan, void *data)
+{
+	struct tmel *tdev = chan->con_priv;
+
+	tdev->qwork.data = data;
+	queue_work(system_wq, &tdev->qwork.work);
+
+	return 0;
+}
+
+static struct mbox_chan_ops tmel_qmp_ops = {
+	.startup = tmel_qmp_startup,
+	.shutdown = tmel_qmp_shutdown,
+	.send_data = tmel_qmp_send,
+};
+
+/**
+ * tmel_qmp_mbox_of_xlate() - Returns a mailbox channel to be used for this mailbox
+ *			      device. Make sure the channel is not already in use.
+ * @mbox: Mailbox device controls the requested channel.
+ * @spec: Device tree arguments to specify which channel is requested.
+ */
+static struct mbox_chan *tmel_qmp_mbox_of_xlate(struct mbox_controller *mbox,
+						const struct of_phandle_args *spec)
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
+	return &mbox->chans[0];
+}
+
+static struct tmel *tmel_init(struct platform_device *pdev)
+{
+	struct tmel *tdev;
+	struct mbox_chan *chans;
+
+	tdev = devm_kcalloc(&pdev->dev, 1, sizeof(*tdev), GFP_KERNEL);
+	if (!tdev)
+		return ERR_PTR(-ENOMEM);
+
+	tdev->ipc_pkt = devm_kcalloc(&pdev->dev, 1, sizeof(struct tmel_ipc_pkt), GFP_KERNEL);
+	if (!tdev->ipc_pkt)
+		return ERR_PTR(-ENOMEM);
+
+	init_waitqueue_head(&tdev->waitq);
+
+	tdev->rx_done = false;
+	tdev->dev = &pdev->dev;
+	platform_set_drvdata(pdev, tdev);
+
+	chans = devm_kcalloc(&pdev->dev, QMP_NUM_CHANS, sizeof(*chans), GFP_KERNEL);
+	if (!chans)
+		return ERR_PTR(-ENOMEM);
+
+	tdev->ctrl.chans = chans;
+	INIT_WORK(&tdev->qwork.work, tmel_qmp_send_work);
+
+	return tdev;
+}
+
+static struct qmp_device *qmp_init(struct platform_device *pdev)
+{
+	struct qmp_device *mdev;
+
+	mdev = devm_kcalloc(&pdev->dev, 1, sizeof(*mdev), GFP_KERNEL);
+	if (!mdev)
+		return ERR_PTR(-ENOMEM);
+
+	mdev->dev = &pdev->dev;
+	mdev->mcore_desc = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(mdev->mcore_desc))
+		return ERR_PTR(-EIO);
+
+	mdev->ucore_desc = mdev->mcore_desc + QMP_UCORE_DESC_OFFSET;
+
+	spin_lock_init(&mdev->tx_lock);
+	mdev->local_state = LINK_DISCONNECTED;
+	init_completion(&mdev->link_complete);
+	init_completion(&mdev->ch_complete);
+
+	return mdev;
+}
+
+static int qmp_mbox_client_init(struct qmp_device *mdev)
+{
+	int ret = 0;
+
+	mdev->mbox_client.dev = mdev->dev;
+	mdev->mbox_client.knows_txdone = false;
+	mdev->mbox_chan = mbox_request_channel(&mdev->mbox_client, 0);
+	if (IS_ERR(mdev->mbox_chan))
+		ret = PTR_ERR(mdev->mbox_chan);
+
+	return ret;
+}
+
+static int tmel_mbox_ctrl_init(struct tmel *tdev)
+{
+	tdev->ctrl.dev = tdev->dev;
+	tdev->ctrl.ops = &tmel_qmp_ops;
+	tdev->ctrl.chans[0].con_priv = tdev;
+	tdev->ctrl.num_chans = QMP_NUM_CHANS;
+	tdev->ctrl.txdone_irq = true;
+	tdev->ctrl.of_xlate = tmel_qmp_mbox_of_xlate;
+
+	return devm_mbox_controller_register(tdev->dev, &tdev->ctrl);
+}
+
+static int tmel_qmp_probe(struct platform_device *pdev)
+{
+	struct device_node *node = pdev->dev.of_node;
+	struct qmp_device *mdev;
+	struct tmel *tdev;
+	int ret = 0;
+
+	tdev = tmel_init(pdev);
+	if (IS_ERR(tdev))
+		return dev_err_probe(tdev->dev, ret, "tmel device init failed\n");
+
+	mdev = qmp_init(pdev);
+	if (IS_ERR(mdev))
+		return dev_err_probe(tdev->dev, ret, "qmp device init failed\n");
+
+	tdev->mdev = mdev;
+	ret = platform_get_irq(pdev, 0);
+	ret = devm_request_threaded_irq(tdev->dev, ret, NULL, qmp_irq_handler,
+					IRQF_TRIGGER_RISING | IRQF_ONESHOT,
+					node->name, (void *)tdev);
+	if (ret < 0)
+		return dev_err_probe(tdev->dev, ret, "request threaded irq failed\n");
+
+	ret = qmp_mbox_client_init(mdev);
+	if (ret)
+		return dev_err_probe(mdev->dev, ret, "IPC chan missing, client init failed");
+
+	ret = tmel_mbox_ctrl_init(tdev);
+	if (ret)
+		return dev_err_probe(tdev->dev, ret, "failed to register mbox controller");
+
+	return ret;
+}
+
+static const struct of_device_id tmel_qmp_dt_match[] = {
+	{ .compatible = "qcom,ipq5424-tmel" },
+	{},
+};
+
+static struct platform_driver tmel_qmp_driver = {
+	.driver = {
+		.name = "tmel_qmp_mbox",
+		.of_match_table = tmel_qmp_dt_match,
+	},
+	.probe = tmel_qmp_probe,
+};
+module_platform_driver(tmel_qmp_driver);
+
+MODULE_DESCRIPTION("QCOM TMEL QMP driver");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/mailbox/tmelcom-qmp.h b/include/linux/mailbox/tmelcom-qmp.h
new file mode 100644
index 000000000000..b4c1d7021a64
--- /dev/null
+++ b/include/linux/mailbox/tmelcom-qmp.h
@@ -0,0 +1,122 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+#ifndef _TMELCOM_H_
+#define _TMELCOM_H_
+
+/*
+ * Macro used to define unique TMEL Message Identifier based on
+ * message type and action identifier.
+ */
+#define TMEL_MSG_UID_CREATE(msg_type, action_id)	\
+	(FIELD_PREP_CONST((0xff << 8), msg_type) | FIELD_PREP_CONST(0xff, action_id))
+
+/** Helper macro to extract the messageType from TMEL_MSG_UID. */
+#define TMEL_MSG_UID_MSG_TYPE(v)	FIELD_GET(GENMASK(15, 8), v)
+
+/** Helper macro to extract the actionID from TMEL_MSG_UID. */
+#define TMEL_MSG_UID_ACTION_ID(v)	FIELD_GET(GENMASK(7, 0), v)
+
+/****************************************************************************
+ *
+ * All definitions of supported messageTypes.
+ *
+ * <Template> : TMEL_MSG_<MSGTYPE_NAME>
+ * **************************************************************************/
+#define TMEL_MSG_SECBOOT		 0x00
+
+/****************************************************************************
+ *
+ * All definitions of action IDs per messageType.
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
+#define TMEL_ACTION_SECBOOT_SS_TEAR_DOWN	     0x0a
+
+/****************************************************************************
+ *
+ * All definitions of TMEL Message UIDs (messageType | actionID).
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
+#define TMEL_ERROR_GENERIC		(0x1u)
+#define TMEL_ERROR_NOT_SUPPORTED	(0x2u)
+#define TMEL_ERROR_BAD_PARAMETER	(0x3u)
+#define TMEL_ERROR_BAD_MESSAGE		(0x4u)
+#define TMEL_ERROR_BAD_ADDRESS		(0x5u)
+#define TMEL_ERROR_TMELCOM_FAILURE	(0x6u)
+#define TMEL_ERROR_TMEL_BUSY		(0x7u)
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
+#endif  /* _TMELCOM_H_ */
-- 
2.34.1


