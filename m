Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B37AA590836
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Aug 2022 23:42:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230422AbiHKVmT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Aug 2022 17:42:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234075AbiHKVmR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Aug 2022 17:42:17 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E869B9F0F0;
        Thu, 11 Aug 2022 14:42:15 -0700 (PDT)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27BLFZ1h013925;
        Thu, 11 Aug 2022 21:42:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=NC33KSDXeB0LL2tYGcYNxEW9CS++jQkTREdYC0ffEL0=;
 b=fSgdBBzUBzsn5L6/FpA8T10erwEGg/Ayh6QlYcn1RnQvIIVoyt06BDugVt02D5aEShNK
 TNMdVJnI8o+7qLbaH8T6vcaWTKqj9PWXoPqVLYHbfiesZnlDJWJbpYjDVPNxWKSpJylV
 q4UGr3sM6auh//vSiWz7vhKCYRMut32XmjgYvaPPcM7XzsP/IyuzEQWoMJ1TUJ4sfU6C
 RCiodTAsbKyuDJp1CbB56RJ6CntI7AaD5WuyNxnHmUEVhg+rPAWyVG2bYyCmUJrzWnUO
 Ke0O3bOGc/dAiAMRhdYzJNVV7a22IbwGanMsU6mGrldwPYwrvnvAQRol4nWKY/I+pBvI lA== 
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3hw89x06bd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 11 Aug 2022 21:42:00 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
        by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 27BLfxFJ022590
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 11 Aug 2022 21:41:59 GMT
Received: from hu-eberman-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 11 Aug 2022 14:41:58 -0700
From:   Elliot Berman <quic_eberman@quicinc.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
CC:     Elliot Berman <quic_eberman@quicinc.com>,
        Murali Nalajala <quic_mnalajal@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        "Srivatsa Vaddagiri" <quic_svaddagi@quicinc.com>,
        Carl van Schaik <quic_cvanscha@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        <linux-arm-kernel@lists.infradead.org>,
        "Mark Rutland" <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        "Marc Zyngier" <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        <devicetree@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>
Subject: [PATCH v3 07/12] gunyah: msgq: Add Gunyah message queues
Date:   Thu, 11 Aug 2022 14:41:02 -0700
Message-ID: <20220811214107.1074343-8-quic_eberman@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220811214107.1074343-1-quic_eberman@quicinc.com>
References: <20220811214107.1074343-1-quic_eberman@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: dvf0Z2EvkNI-qO9eH5r2peMTnSVRPqBl
X-Proofpoint-ORIG-GUID: dvf0Z2EvkNI-qO9eH5r2peMTnSVRPqBl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-11_13,2022-08-11_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 mlxlogscore=999 lowpriorityscore=0 phishscore=0 clxscore=1015 spamscore=0
 suspectscore=0 impostorscore=0 priorityscore=1501 mlxscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2208110065
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Gunyah message queues are unidirectional pipelines to communicate
between 2 virtual machines, but are typically paired to allow
bidirectional communication. The intended use case is for small control
messages between 2 VMs, as they support a maximum of 1024 bytes.

Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
---
 MAINTAINERS                   |   1 +
 arch/arm64/gunyah/hypercall.c |  33 ++++++
 drivers/virt/gunyah/Makefile  |   2 +-
 drivers/virt/gunyah/msgq.c    | 192 ++++++++++++++++++++++++++++++++++
 include/asm-generic/gunyah.h  |   5 +
 include/linux/gunyah.h        |  71 +++++++++++++
 6 files changed, 303 insertions(+), 1 deletion(-)
 create mode 100644 drivers/virt/gunyah/msgq.c
 create mode 100644 include/linux/gunyah.h

diff --git a/MAINTAINERS b/MAINTAINERS
index c774bbcdb348..444891e02546 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8745,6 +8745,7 @@ F:	Documentation/virt/gunyah/
 F:	arch/arm64/gunyah/
 F:	drivers/virt/gunyah/
 F:	include/asm-generic/gunyah.h
+F:	include/linux/gunyah.h
 
 HABANALABS PCI DRIVER
 M:	Oded Gabbay <ogabbay@kernel.org>
diff --git a/arch/arm64/gunyah/hypercall.c b/arch/arm64/gunyah/hypercall.c
index 5b08c9d80de0..042cca31879e 100644
--- a/arch/arm64/gunyah/hypercall.c
+++ b/arch/arm64/gunyah/hypercall.c
@@ -26,6 +26,8 @@
 							| ((fn) & GH_CALL_FUNCTION_NUM_MASK))
 
 #define GH_HYPERCALL_HYP_IDENTIFY		GH_HYPERCALL(0x0000)
+#define GH_HYPERCALL_MSGQ_SEND			GH_HYPERCALL(0x001B)
+#define GH_HYPERCALL_MSGQ_RECV			GH_HYPERCALL(0x001C)
 
 /**
  * gh_hypercall_get_uid() - Returns a UID when running under a Gunyah hypervisor.
@@ -67,5 +69,36 @@ void gh_hypercall_hyp_identify(struct gh_hypercall_hyp_identify_resp *hyp_identi
 }
 EXPORT_SYMBOL_GPL(gh_hypercall_hyp_identify);
 
+int gh_hypercall_msgq_send(u64 capid, size_t size, uintptr_t buff, int tx_flags, bool *ready)
+{
+	struct arm_smccc_res res;
+
+	arm_smccc_1_1_hvc(GH_HYPERCALL_MSGQ_SEND, capid, size, buff, tx_flags, 0, &res);
+
+	if (res.a0)
+		return res.a0;
+
+	*ready = res.a1;
+
+	return res.a0;
+}
+EXPORT_SYMBOL_GPL(gh_hypercall_msgq_send);
+
+int gh_hypercall_msgq_recv(u64 capid, uintptr_t buff, size_t size, size_t *recv_size, bool *ready)
+{
+	struct arm_smccc_res res;
+
+	arm_smccc_1_1_hvc(GH_HYPERCALL_MSGQ_RECV, capid, buff, size, 0, &res);
+
+	if (res.a0)
+		return res.a0;
+
+	*recv_size = res.a1;
+	*ready = res.a2;
+
+	return res.a0;
+}
+EXPORT_SYMBOL_GPL(gh_hypercall_msgq_recv);
+
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Gunyah Hypervisor Hypercalls");
diff --git a/drivers/virt/gunyah/Makefile b/drivers/virt/gunyah/Makefile
index e15f16c17142..3c7efd2220c1 100644
--- a/drivers/virt/gunyah/Makefile
+++ b/drivers/virt/gunyah/Makefile
@@ -1,2 +1,2 @@
-gunyah-y += sysfs.o
+gunyah-y += sysfs.o msgq.o
 obj-$(CONFIG_GUNYAH) += gunyah.o
diff --git a/drivers/virt/gunyah/msgq.c b/drivers/virt/gunyah/msgq.c
new file mode 100644
index 000000000000..05c3d90ac1ed
--- /dev/null
+++ b/drivers/virt/gunyah/msgq.c
@@ -0,0 +1,192 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <linux/interrupt.h>
+#include <linux/gunyah.h>
+#include <linux/printk.h>
+#include <linux/init.h>
+#include <linux/slab.h>
+#include <linux/wait.h>
+
+static irqreturn_t gh_msgq_irq_handler(int irq, void *data)
+{
+	struct gunyah_msgq *msgq = data;
+	void (*on_ready)(struct gunyah_msgq *msgq);
+
+	spin_lock(&msgq->lock);
+	msgq->ready = true;
+	on_ready = msgq->on_ready;
+	spin_unlock(&msgq->lock);
+
+	if (on_ready)
+		on_ready(msgq);
+
+	wake_up_interruptible_all(&msgq->wq);
+
+	return IRQ_HANDLED;
+}
+
+static int __gh_msgq_send(struct gunyah_msgq *msgq, void *buff, size_t size, u64 tx_flags)
+{
+	unsigned long flags, gh_err;
+	ssize_t ret;
+	bool ready;
+
+	spin_lock_irqsave(&msgq->lock, flags);
+	gh_err = gh_hypercall_msgq_send(msgq->ghdev.capid, size, (uintptr_t)buff, tx_flags, &ready);
+	switch (gh_err) {
+	case GH_ERROR_OK:
+		ret = 0;
+		msgq->ready = ready;
+		break;
+	case GH_ERROR_MSGQUEUE_FULL:
+		ret = -EAGAIN;
+		msgq->ready = false;
+		break;
+	default:
+		ret = gh_remap_error(gh_err);
+		break;
+	}
+	spin_unlock_irqrestore(&msgq->lock, flags);
+
+	return ret;
+}
+
+/**
+ * gh_msgq_send() - Send a message to the client running on a different VM
+ * @client: The client descriptor that was obtained via gh_msgq_register()
+ * @buff: Pointer to the buffer where the received data must be placed
+ * @buff_size: The size of the buffer space available
+ * @flags: Optional flags to pass to receive the data. For the list of flags,
+ *         see linux/gunyah/gh_msgq.h
+ *
+ * Returns: The number of bytes copied to buff. <0 if there was an error.
+ *
+ * Note: this function may sleep and should not be called from interrupt context
+ */
+ssize_t gh_msgq_send(struct gunyah_msgq *msgq, void *buff, size_t size, const unsigned long flags)
+{
+	ssize_t ret;
+	u64 tx_flags = 0;
+
+	if (unlikely(msgq->ghdev.type != GUNYAH_DEVICE_TYPE_MSGQ_TX))
+		return -EINVAL;
+
+	if (flags & GH_MSGQ_TX_PUSH)
+		tx_flags |= GH_HYPERCALL_MSGQ_TX_FLAGS_PUSH;
+
+	do {
+		ret = __gh_msgq_send(msgq, buff, size, tx_flags);
+
+		if (ret == -EAGAIN) {
+			if (flags & GH_MSGQ_NONBLOCK)
+				goto out;
+			if (wait_event_interruptible(msgq->wq, msgq->ready))
+				ret = -ERESTARTSYS;
+		}
+	} while (ret == -EAGAIN);
+
+out:
+	return ret;
+}
+EXPORT_SYMBOL_GPL(gh_msgq_send);
+
+static ssize_t __gh_msgq_recv(struct gunyah_msgq *msgq, void *buff, size_t size)
+{
+	unsigned long flags, gh_err;
+	size_t recv_size;
+	ssize_t ret;
+	bool ready;
+
+	spin_lock_irqsave(&msgq->lock, flags);
+
+	gh_err = gh_hypercall_msgq_recv(msgq->ghdev.capid, (uintptr_t)buff, size,
+					&recv_size, &ready);
+	switch (gh_err) {
+	case GH_ERROR_OK:
+		ret = recv_size;
+		msgq->ready = ready;
+		break;
+	case GH_ERROR_MSGQUEUE_EMPTY:
+		ret = -EAGAIN;
+		msgq->ready = false;
+		break;
+	default:
+		ret = gh_remap_error(gh_err);
+		break;
+	}
+	spin_unlock_irqrestore(&msgq->lock, flags);
+
+	return ret;
+}
+
+/**
+ * gh_msgq_recv() - Receive a message from the client running on a different VM
+ * @client: The client descriptor that was obtained via gh_msgq_register()
+ * @buff: Pointer to the buffer where the received data must be placed
+ * @buff_size: The size of the buffer space available
+ * @flags: Optional flags to pass to receive the data. For the list of flags,
+ *         see linux/gunyah/gh_msgq.h
+ *
+ * Returns: The number of bytes copied to buff. <0 if there was an error.
+ *
+ * Note: this function may sleep and should not be called from interrupt context
+ */
+ssize_t gh_msgq_recv(struct gunyah_msgq *msgq, void *buff, size_t size, const unsigned long flags)
+{
+	ssize_t ret;
+
+	if (unlikely(msgq->ghdev.type != GUNYAH_DEVICE_TYPE_MSGQ_RX))
+		return -EINVAL;
+
+	do {
+		ret = __gh_msgq_recv(msgq, buff, size);
+
+		if (ret == -EAGAIN) {
+			if (flags & GH_MSGQ_NONBLOCK)
+				goto out;
+			if (wait_event_interruptible(msgq->wq, msgq->ready))
+				ret = -ERESTARTSYS;
+		}
+	} while (ret == -EAGAIN);
+
+out:
+	return ret;
+}
+EXPORT_SYMBOL_GPL(gh_msgq_recv);
+
+struct gunyah_msgq *__gunyah_msgq_alloc(enum gunyah_device_type type, u64 capid, int irq)
+{
+	struct gunyah_msgq *msgq;
+	int ret;
+
+	msgq = kzalloc(sizeof(*msgq), GFP_KERNEL);
+	if (!msgq)
+		return NULL;
+
+	msgq->ghdev.type = type;
+	msgq->ghdev.capid = capid;
+	msgq->ghdev.irq = irq;
+
+	msgq->ready = true; /* Assume we can use the message queue right away */
+	init_waitqueue_head(&msgq->wq);
+	spin_lock_init(&msgq->lock);
+
+	ret = request_irq(msgq->ghdev.irq, gh_msgq_irq_handler, 0, "gh_msgq", msgq);
+	if (WARN(ret, "Failed to request message queue irq %d: %d\n", irq, ret)) {
+		kfree(msgq);
+		return NULL;
+	}
+
+	return msgq;
+}
+EXPORT_SYMBOL_GPL(__gunyah_msgq_alloc);
+
+void gunyah_msgq_free(struct gunyah_msgq *msgq)
+{
+	free_irq(msgq->ghdev.irq, msgq);
+	kfree(msgq);
+}
+EXPORT_SYMBOL_GPL(gunyah_msgq_free);
diff --git a/include/asm-generic/gunyah.h b/include/asm-generic/gunyah.h
index 86eb59e203ef..43915faea704 100644
--- a/include/asm-generic/gunyah.h
+++ b/include/asm-generic/gunyah.h
@@ -107,4 +107,9 @@ struct gh_hypercall_hyp_identify_resp {
 void gh_hypercall_get_uid(u32 *uid);
 void gh_hypercall_hyp_identify(struct gh_hypercall_hyp_identify_resp *hyp_identity);
 
+#define GH_HYPERCALL_MSGQ_TX_FLAGS_PUSH		BIT(0)
+
+int gh_hypercall_msgq_send(u64 capid, size_t size, uintptr_t buff, int tx_flags, bool *ready);
+int gh_hypercall_msgq_recv(u64 capid, uintptr_t buff, size_t size, size_t *recv_size, bool *ready);
+
 #endif
diff --git a/include/linux/gunyah.h b/include/linux/gunyah.h
new file mode 100644
index 000000000000..57e83b0d78cf
--- /dev/null
+++ b/include/linux/gunyah.h
@@ -0,0 +1,71 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _GUNYAH_H
+#define _GUNYAH_H
+
+#include <asm-generic/gunyah.h>
+
+/* Follows resource manager's resource types for VM_GET_HYP_RESOURCES */
+enum gunyah_device_type {
+	GUNYAH_DEVICE_TYPE_BELL_TX	= 0,
+	GUNYAH_DEVICE_TYPE_BELL_RX	= 1,
+	GUNYAH_DEVICE_TYPE_MSGQ_TX	= 2,
+	GUNYAH_DEVICE_TYPE_MSGQ_RX	= 3,
+	GUNYAH_DEVICE_TYPE_VCPU		= 4,
+};
+
+struct gunyah_device {
+	enum gunyah_device_type type;
+	u64 capid;
+	int irq;
+};
+
+/**
+ * Gunyah Message Queues
+ */
+
+struct gunyah_msgq {
+	struct gunyah_device ghdev;
+
+	/* Set by the message queue client */
+	void (*on_ready)(struct gunyah_msgq *msgq);
+	void *data;
+
+	/* msgq private */
+	bool ready;
+	wait_queue_head_t wq;
+	spinlock_t lock;
+};
+
+#define GH_MSGQ_MAX_MSG_SIZE	1024
+
+/* Possible flags to pass for Tx or Rx */
+#define GH_MSGQ_TX_PUSH		BIT(0)
+#define GH_MSGQ_NONBLOCK	BIT(32)
+
+static inline struct gunyah_msgq * __must_check to_gunyah_msgq(struct gunyah_device *ghdev)
+{
+	if (ghdev->type != GUNYAH_DEVICE_TYPE_BELL_TX && ghdev->type != GUNYAH_DEVICE_TYPE_BELL_RX)
+		return NULL;
+	return container_of(ghdev, struct gunyah_msgq, ghdev);
+}
+
+ssize_t gh_msgq_send(struct gunyah_msgq *msgq, void *buff, size_t size, const unsigned long flags);
+ssize_t gh_msgq_recv(struct gunyah_msgq *msgq, void *buff, size_t size, const unsigned long flags);
+struct gunyah_msgq *__gunyah_msgq_alloc(enum gunyah_device_type type, u64 capid, int irq);
+void gunyah_msgq_free(struct gunyah_msgq *msgq);
+
+static inline struct gunyah_msgq *gunyah_msgq_tx_alloc(u64 capid, int irq)
+{
+	return __gunyah_msgq_alloc(GUNYAH_DEVICE_TYPE_BELL_TX, capid, irq);
+}
+
+static inline struct gunyah_msgq *gunyah_msgq_rx_alloc(u64 capid, int irq)
+{
+	return __gunyah_msgq_alloc(GUNYAH_DEVICE_TYPE_BELL_RX, capid, irq);
+}
+
+#endif
-- 
2.25.1

