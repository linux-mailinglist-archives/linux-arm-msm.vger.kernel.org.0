Return-Path: <linux-arm-msm+bounces-40005-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 94AB79E1260
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 05:22:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C1637B250FE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 04:22:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC8E71DAC9B;
	Tue,  3 Dec 2024 04:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BfO/PHFI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7CD818FC80;
	Tue,  3 Dec 2024 04:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733199631; cv=none; b=XwX5d4klxATG+c3tBwnYExLLPONYXwMTv7yG8o/S+AzFYN093qYL8xscQyYZ9VHSSdM6EXdLmhrvFKSs+FnzHv2iVeBiAK2WbW7t/039PpYfdQT/YsVSSJrv19ZI8QRj9K/zQg3HSJfZ2IX4wzMn//A85t0fHuCfXYNAMPDiBY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733199631; c=relaxed/simple;
	bh=8Jh/aSX0JJL0rIc/IRSdMgo0eHFG8jKGrP5w5BL14gI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Hw2S05AsISjBCYhnKyijnJHtXJHBl6kCEIsIswvJBCnre6nQTB7Z8k5Ez9v8Ds4/COuIS4XMJtwkif5AGsrUZRF6vMt8+rLjC4iezd8YhqfjZOXjJNZyZD9OtK2nI/N2EEvlmKW9WaU/GOPn+u7ZjeIhtzTX06JrXc7t01JhJIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=BfO/PHFI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B2JkpZ1020570;
	Tue, 3 Dec 2024 04:20:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LoAge/Z1b8cRAGZHXk69+Y73mAmVDaNtF/gHLP4ydGk=; b=BfO/PHFIPYvA40xS
	AzzzMerxdXCmV6+i31lUI5j5VaJKvjPQRIWMeUrYvAob60VWzD4Ou+Vdv/i7ZCNc
	Gl8oMCISVD4yAsEIL9vO7TbsLqXW+vCkTEeagGo6X9pGiYbsg4W+Sl1iNaHfB73W
	NiVVP1pfYvRR1Ebv4tkF3f2yc7LG1daWKRh4TtP2DLE4qc/ZX0hdB468U6V8EPms
	lz5CDXdiujpsLJgBwKoXXM3NO7f7boja5MMZhp+RUlcXG4Q2oLMy/HH2oyMLrraK
	DT5c9pOVrcbwyZ6XjNKCsSz214Tuz0ND2VTDn0d8FUYl3V1Ur2+ZoJYu9ZLJB6eP
	oVhM/A==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 437uvjxmq6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Dec 2024 04:20:07 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B34K67b031210
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 3 Dec 2024 04:20:07 GMT
Received: from hu-azarrabi-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 2 Dec 2024 20:20:06 -0800
From: Amirreza Zarrabi <quic_azarrabi@quicinc.com>
Date: Mon, 2 Dec 2024 20:19:21 -0800
Subject: [PATCH 05/10] qcomtee: implement object invoke support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241202-qcom-tee-using-tee-ss-without-mem-obj-v1-5-f502ef01e016@quicinc.com>
References: <20241202-qcom-tee-using-tee-ss-without-mem-obj-v1-0-f502ef01e016@quicinc.com>
In-Reply-To: <20241202-qcom-tee-using-tee-ss-without-mem-obj-v1-0-f502ef01e016@quicinc.com>
To: Jens Wiklander <jens.wiklander@linaro.org>,
        Sumit Garg
	<sumit.garg@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad
 Dybcio" <konradybcio@kernel.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Bartosz
 Golaszewski" <bartosz.golaszewski@linaro.org>,
        Srinivas Kandagatla
	<srinivas.kandagatla@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <op-tee@lists.trustedfirmware.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-doc@vger.kernel.org>,
        Amirreza Zarrabi <quic_azarrabi@quicinc.com>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: h7Zz9DlfSQnRnHUTrqwNvazoXYwXy5hv
X-Proofpoint-ORIG-GUID: h7Zz9DlfSQnRnHUTrqwNvazoXYwXy5hv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=999 impostorscore=0 adultscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 clxscore=1011 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412030034

Introduce qcom_tee_object, which represents an object in both QTEE and
the kernel. QTEE clients can invoke an instance of qcom_tee_object to
access QTEE services. If this invocation produces a new object in QTEE,
an instance of qcom_tee_object will be returned.

Similarly, QTEE can request services from the kernel by issuing a callback
request, which invokes an instance of qcom_tee_object in the kernel.
Any subsystem that exposes a service to QTEE should allocate and initialize
an instance of qcom_tee_object with a dispatcher callback that is called
when the object is invoked.

Signed-off-by: Amirreza Zarrabi <quic_azarrabi@quicinc.com>
---
 drivers/tee/Kconfig                    |   1 +
 drivers/tee/Makefile                   |   1 +
 drivers/tee/qcomtee/Kconfig            |  10 +
 drivers/tee/qcomtee/Makefile           |   6 +
 drivers/tee/qcomtee/async.c            | 153 ++++++
 drivers/tee/qcomtee/core.c             | 928 +++++++++++++++++++++++++++++++++
 drivers/tee/qcomtee/qcom_scm.c         |  36 ++
 drivers/tee/qcomtee/qcomtee_msg.h      | 217 ++++++++
 drivers/tee/qcomtee/qcomtee_private.h  |  47 ++
 drivers/tee/qcomtee/release.c          |  66 +++
 include/linux/firmware/qcom/qcom_tee.h | 284 ++++++++++
 11 files changed, 1749 insertions(+)

diff --git a/drivers/tee/Kconfig b/drivers/tee/Kconfig
index 61b507c18780..3a995d7f0d74 100644
--- a/drivers/tee/Kconfig
+++ b/drivers/tee/Kconfig
@@ -16,5 +16,6 @@ if TEE
 source "drivers/tee/optee/Kconfig"
 source "drivers/tee/amdtee/Kconfig"
 source "drivers/tee/tstee/Kconfig"
+source "drivers/tee/qcomtee/Kconfig"
 
 endif
diff --git a/drivers/tee/Makefile b/drivers/tee/Makefile
index 5488cba30bd2..74e987f8f7ea 100644
--- a/drivers/tee/Makefile
+++ b/drivers/tee/Makefile
@@ -6,3 +6,4 @@ tee-objs += tee_shm_pool.o
 obj-$(CONFIG_OPTEE) += optee/
 obj-$(CONFIG_AMDTEE) += amdtee/
 obj-$(CONFIG_ARM_TSTEE) += tstee/
+obj-$(CONFIG_QCOMTEE) += qcomtee/
diff --git a/drivers/tee/qcomtee/Kconfig b/drivers/tee/qcomtee/Kconfig
new file mode 100644
index 000000000000..d180a6d07d33
--- /dev/null
+++ b/drivers/tee/qcomtee/Kconfig
@@ -0,0 +1,10 @@
+# SPDX-License-Identifier: GPL-2.0-only
+# Qualcomm Trusted Execution Environment Configuration
+config QCOMTEE
+	tristate "Qualcomm TEE Support"
+	select QCOM_SCM
+	help
+	  This option enables the Qualcomm Trusted Execution Environment (QTEE)
+	  driver. It provides an API to access services offered by QTEE and any
+	  loaded Trusted Applications (TAs), as well as exporting kernel
+	  services to QTEE.
diff --git a/drivers/tee/qcomtee/Makefile b/drivers/tee/qcomtee/Makefile
new file mode 100644
index 000000000000..7dc5e6373042
--- /dev/null
+++ b/drivers/tee/qcomtee/Makefile
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0-only
+obj-$(CONFIG_QCOMTEE) += qcomtee.o
+qcomtee-objs += async.o
+qcomtee-objs += core.o
+qcomtee-objs += qcom_scm.o
+qcomtee-objs += release.o
diff --git a/drivers/tee/qcomtee/async.c b/drivers/tee/qcomtee/async.c
new file mode 100644
index 000000000000..218ec0209722
--- /dev/null
+++ b/drivers/tee/qcomtee/async.c
@@ -0,0 +1,153 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <linux/mutex.h>
+#include <linux/slab.h>
+
+#include "qcomtee_private.h"
+#include "qcomtee_msg.h"
+
+#define QCOM_TEE_ASYNC_VERSION_1_0 0x00010000U	/* Major: 0x0001, Minor: 0x0000. */
+#define QCOM_TEE_ASYNC_VERSION_1_1 0x00010001U	/* Major: 0x0001, Minor: 0x0001. */
+#define QCOM_TEE_ASYNC_VERSION_1_2 0x00010002U	/* Major: 0x0001, Minor: 0x0002. */
+#define QCOM_TEE_ASYNC_VERSION QCOM_TEE_ASYNC_VERSION_1_2 /* Current Version. */
+
+#define QCOM_TEE_ASYNC_VERSION_MAJOR(n) upper_16_bits(n)
+#define QCOM_TEE_ASYNC_VERSION_MINOR(n) lower_16_bits(n)
+
+/**
+ * struct qcom_tee_async_msg_hdr - Asynchronous message header format.
+ * @version: current async protocol version of remote endpoint
+ * @op: async operation
+ *
+ * @version specifies the endpoints (QTEE or driver) supported async protocol, e.g.
+ * if QTEE set @version to %QCOM_TEE_ASYNC_VERSION_1_1, QTEE handles operations
+ * supported in %QCOM_TEE_ASYNC_VERSION_1_1 or %QCOM_TEE_ASYNC_VERSION_1_0.
+ * @op determins the message format.
+ */
+struct qcom_tee_async_msg_hdr {
+	u32 version;
+	u32 op;
+};
+
+/**
+ * struct qcom_tee_async_release_msg - Release asynchronous message.
+ * @hdr: message header as &struct qcom_tee_async_msg_hdr
+ * @counts: number of objects in @object_ids
+ * @object_ids: array of object ids should be released
+ *
+ * Available in Major = 0x0001, Minor >= 0x0000.
+ */
+struct qcom_tee_async_release_msg {
+	struct qcom_tee_async_msg_hdr hdr;
+	u32 counts;
+	u32 object_ids[] __counted_by(counts);
+};
+
+/**
+ * qcom_tee_get_async_buffer() - Get start of the asynchronous message in outbound buffer.
+ * @oic: context used for current invocation
+ * @async_buffer: return buffer to extract from or fill in async messages
+ *
+ * If @oic is used for direct object invocation, whole outbound buffer is available for
+ * async message. If @oic is used for callback request, the tail of outbound buffer (after
+ * the callback request message) is available for async message.
+ */
+static void qcom_tee_get_async_buffer(struct qcom_tee_object_invoke_ctx *oic,
+				      struct qcom_tee_buffer *async_buffer)
+{
+	struct qcom_tee_msg_callback *msg;
+	unsigned int offset;
+	int i;
+
+	if (!(oic->flags & QCOM_TEE_OIC_FLAG_BUSY)) {
+		/* The outbound buffer is empty. Using the whole buffer. */
+		offset = 0;
+	} else {
+		msg = (struct qcom_tee_msg_callback *)oic->out_msg.addr;
+
+		/* Start offset in a message for buffer arguments. */
+		offset = qcom_tee_msg_buffer_args(struct qcom_tee_msg_callback,
+						  qcom_tee_msg_args(msg));
+
+		/* Add size of IB arguments. */
+		qcom_tee_msg_for_each_input_buffer(i, msg)
+			offset += qcom_tee_msg_offset_align(msg->args[i].b.size);
+
+		/* Add size of OB arguments. */
+		qcom_tee_msg_for_each_output_buffer(i, msg)
+			offset += qcom_tee_msg_offset_align(msg->args[i].b.size);
+	}
+
+	async_buffer->addr = oic->out_msg.addr + offset;
+	async_buffer->size = oic->out_msg.size - offset;
+}
+
+/**
+ * qcom_tee_async_release_handler() - Process QTEE async requests for releasing objects.
+ * @oic: context used for current invocation
+ * @msg: async message for object release
+ * @size: size of the async buffer available
+ *
+ * Return: Size of outbound buffer used when processing @msg.
+ */
+static size_t qcom_tee_async_release_handler(struct qcom_tee_object_invoke_ctx *oic,
+					     struct qcom_tee_async_msg_hdr *async_msg, size_t size)
+{
+	struct qcom_tee_async_release_msg *msg = (struct qcom_tee_async_release_msg *)async_msg;
+	struct qcom_tee_object *object;
+	int i;
+
+	for (i = 0; i < msg->counts; i++) {
+		object = qcom_tee_idx_erase(msg->object_ids[i]);
+		qcom_tee_object_put(object);
+	}
+
+	return struct_size_t(struct qcom_tee_async_release_msg, object_ids, i);
+}
+
+/**
+ * qcom_tee_fetch_async_reqs() - Fetch and process asynchronous messages.
+ * @oic: context used for current invocation
+ *
+ * It looks for handler to process the requested operations in the async message.
+ * Currently, only support async release requests.
+ */
+void qcom_tee_fetch_async_reqs(struct qcom_tee_object_invoke_ctx *oic)
+{
+	struct qcom_tee_async_msg_hdr *async_msg;
+	struct qcom_tee_buffer async_buffer;
+	size_t consumed, used = 0;
+
+	qcom_tee_get_async_buffer(oic, &async_buffer);
+
+	while (async_buffer.size - used > sizeof(struct qcom_tee_async_msg_hdr)) {
+		async_msg = (struct qcom_tee_async_msg_hdr *)(async_buffer.addr + used);
+
+		if (QCOM_TEE_ASYNC_VERSION_MAJOR(async_msg->version) !=
+		    QCOM_TEE_ASYNC_VERSION_MAJOR(QCOM_TEE_ASYNC_VERSION))
+			goto out;
+
+		switch (async_msg->op) {
+		case QCOM_TEE_MSG_OBJECT_OP_RELEASE:
+			consumed = qcom_tee_async_release_handler(oic, async_msg,
+								  async_buffer.size - used);
+			break;
+		default:
+			/* Unsupported operations. */
+			goto out;
+		}
+
+		/* Supported operation but unable to parse the message. */
+		if (!consumed)
+			goto out;
+
+		used += qcom_tee_msg_offset_align(consumed);
+	}
+
+ out:
+	/* Reset the async messages buffer so async requests do not loopback to QTEE. */
+	memzero_explicit(async_buffer.addr, async_buffer.size);
+}
diff --git a/drivers/tee/qcomtee/core.c b/drivers/tee/qcomtee/core.c
new file mode 100644
index 000000000000..a949ef4cceee
--- /dev/null
+++ b/drivers/tee/qcomtee/core.c
@@ -0,0 +1,928 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/firmware/qcom/qcom_tzmem.h>
+#include <linux/init.h>
+#include <linux/kobject.h>
+#include <linux/mm.h>
+#include <linux/module.h>
+#include <linux/sysfs.h>
+#include <linux/slab.h>
+#include <linux/xarray.h>
+
+#include "qcomtee_msg.h"
+#include "qcomtee_private.h"
+
+/* Static instance of object represents QTEE root object. */
+struct qcom_tee_object qcom_tee_object_root = {
+	.name = "root",
+	.object_type = QCOM_TEE_OBJECT_TYPE_ROOT,
+	.info.qtee_id = QCOM_TEE_MSG_OBJECT_ROOT,
+};
+EXPORT_SYMBOL_GPL(qcom_tee_object_root);
+
+/* Next argument of type @type after index @i. */
+int qcom_tee_next_arg_type(struct qcom_tee_arg *u, int i, enum qcom_tee_arg_type type)
+{
+	while (u[i].type != QCOM_TEE_ARG_TYPE_INV && u[i].type != type)
+		i++;
+	return i;
+}
+
+/* QTEE expects IDs with QCOM_TEE_MSG_OBJECT_NS_BIT set for object of
+ * QCOM_TEE_OBJECT_TYPE_CB_OBJECT type.
+ */
+#define QCOM_TEE_OBJECT_ID_START	(QCOM_TEE_MSG_OBJECT_NS_BIT + 1)
+#define QCOM_TEE_OBJECT_ID_END		(UINT_MAX)
+
+#define QCOM_TEE_OBJECT_SET(p, type, ...) __QCOM_TEE_OBJECT_SET(p, type, ##__VA_ARGS__, 0UL)
+#define __QCOM_TEE_OBJECT_SET(p, type, optr, ...) do { \
+		(p)->object_type = (type); \
+		(p)->info.qtee_id = (unsigned long)(optr); \
+	} while (0)
+
+static struct qcom_tee_object *qcom_tee_object_alloc(void)
+{
+	struct qcom_tee_object *object;
+
+	object = kzalloc(sizeof(*object), GFP_KERNEL);
+	if (object) {
+		QCOM_TEE_OBJECT_SET(object, QCOM_TEE_OBJECT_TYPE_NULL);
+		kref_init(&object->refcount);
+	}
+
+	return object;
+}
+
+void qcom_tee_object_free(struct qcom_tee_object *object)
+{
+	kfree(object->name);
+	kfree(object);
+}
+
+static void qcom_tee_object_release(struct kref *refcount)
+{
+	struct qcom_tee_object *object;
+	struct module *owner;
+	const char *name;
+
+	object = container_of(refcount, struct qcom_tee_object, refcount);
+
+	synchronize_rcu();
+
+	switch (typeof_qcom_tee_object(object)) {
+	case QCOM_TEE_OBJECT_TYPE_TEE:
+		qcom_tee_release_tee_object(object);
+
+		break;
+	case QCOM_TEE_OBJECT_TYPE_CB_OBJECT:
+		/* Copy, as after release we should not access object. */
+		name = object->name;
+		owner = object->owner;
+
+		if (object->ops->release)
+			object->ops->release(object);
+
+		module_put(owner);
+		kfree_const(name);
+
+		break;
+	case QCOM_TEE_OBJECT_TYPE_ROOT:
+	case QCOM_TEE_OBJECT_TYPE_NULL:
+	default:
+		break;
+	}
+}
+
+/**
+ * qcom_tee_object_get() - Increase object's refcount.
+ * @object: object to increase the refcount
+ */
+int qcom_tee_object_get(struct qcom_tee_object *object)
+{
+	if (object != NULL_QCOM_TEE_OBJECT &&
+	    object != ROOT_QCOM_TEE_OBJECT)
+		return kref_get_unless_zero(&object->refcount);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(qcom_tee_object_get);
+
+/**
+ * qcom_tee_object_put() - Decrease object's refcount
+ * @object: object to decrease the refcount
+ */
+void qcom_tee_object_put(struct qcom_tee_object *object)
+{
+	if (object != NULL_QCOM_TEE_OBJECT &&
+	    object != ROOT_QCOM_TEE_OBJECT)
+		kref_put(&object->refcount, qcom_tee_object_release);
+}
+EXPORT_SYMBOL_GPL(qcom_tee_object_put);
+
+/* ''Local Object Table''. */
+/* Object from kernel that are exported to QTEE are assigned an id and stored in
+ * xa_qcom_local_objects (kernel object table). QTEE uses this id to reference the
+ * object using qcom_tee_local_object_get.
+ */
+static DEFINE_XARRAY_ALLOC(xa_qcom_local_objects);
+
+static int qcom_tee_idx_alloc(u32 *idx, struct qcom_tee_object *object)
+{
+	static u32 xa_last_id = QCOM_TEE_OBJECT_ID_START;
+
+	/* Every id allocated here, has QCOM_TEE_MSG_OBJECT_NS_BIT set. */
+	return xa_alloc_cyclic(&xa_qcom_local_objects, idx, object,
+		XA_LIMIT(QCOM_TEE_OBJECT_ID_START, QCOM_TEE_OBJECT_ID_END),
+			&xa_last_id, GFP_KERNEL);
+}
+
+struct qcom_tee_object *qcom_tee_idx_erase(u32 idx)
+{
+	if (idx < QCOM_TEE_OBJECT_ID_START || idx > QCOM_TEE_OBJECT_ID_END)
+		return NULL_QCOM_TEE_OBJECT;
+
+	return xa_erase(&xa_qcom_local_objects, idx);
+}
+
+/**
+ * qcom_tee_object_id_get() - Get an id for an object to sent to QTEE.
+ * @object: object to get its id.
+ * @object_id: object id.
+ *
+ * For object hosted in REE, they are added to object table, and the idx in the
+ * object table is used as id. For object hosted in QTEE, use the QTEE id stored in
+ * @object. This is called on a path to QTEE to construct a message, see
+ * qcom_tee_prepare_msg() and qcom_tee_update_msg().
+ *
+ * Return: On success return 0 or <0 on failure.
+ */
+static int qcom_tee_object_id_get(struct qcom_tee_object *object, unsigned int *object_id)
+{
+	u32 idx;
+
+	switch (typeof_qcom_tee_object(object)) {
+	case QCOM_TEE_OBJECT_TYPE_CB_OBJECT:
+		if (qcom_tee_idx_alloc(&idx, object) < 0)
+			return -ENOSPC;
+
+		*object_id = idx;
+
+		break;
+	case QCOM_TEE_OBJECT_TYPE_ROOT:
+	case QCOM_TEE_OBJECT_TYPE_TEE:
+		*object_id = object->info.qtee_id;
+
+		break;
+	case QCOM_TEE_OBJECT_TYPE_NULL:
+		*object_id = QCOM_TEE_MSG_OBJECT_NULL;
+
+		break;
+	}
+
+	return 0;
+}
+
+/* Release object id assigned in qcom_tee_object_id_get. */
+static void qcom_tee_object_id_put(unsigned int object_id)
+{
+	qcom_tee_idx_erase(object_id);
+}
+
+/**
+ * qcom_tee_local_object_get() - Get an object in REE referenced by the id.
+ * @object_id: object id.
+ *
+ * It is called on behalf of QTEE to obtain instance of object for an id. It is
+ * called on a path from QTEE to construct an argument of &struct qcom_tee_arg,
+ * see qcom_tee_update_args() and qcom_tee_prepare_args().
+ *
+ * It increases the object's refcount on success.
+ *
+ * Return: On error returns %NULL_QCOM_TEE_OBJECT. On success, the object.
+ */
+static struct qcom_tee_object *qcom_tee_local_object_get(unsigned int object_id)
+{
+	struct qcom_tee_object *object;
+
+	/* We trust QTEE does not mess the refcounts.
+	 * It does not issue RELEASE request and qcom_tee_object_get(), simultaneously.
+	 */
+
+	object = xa_load(&xa_qcom_local_objects, object_id);
+
+	qcom_tee_object_get(object);
+
+	return object;
+}
+
+/**
+ * __qcom_tee_object_user_init() - Initialize an object for user.
+ * @object: object to initialize.
+ * @ot: type of object as &enum qcom_tee_object_type.
+ * @ops: instance of callbacks.
+ * @fmt: name assigned to the object.
+ *
+ * Return: On success return 0 or <0 on failure.
+ */
+int __qcom_tee_object_user_init(struct qcom_tee_object *object, enum qcom_tee_object_type ot,
+				struct qcom_tee_object_operations *ops, struct module *owner,
+				const char *fmt, ...)
+{
+	va_list ap;
+	int ret;
+
+	kref_init(&object->refcount);
+	QCOM_TEE_OBJECT_SET(object, QCOM_TEE_OBJECT_TYPE_NULL);
+
+	va_start(ap, fmt);
+	switch (ot) {
+	case QCOM_TEE_OBJECT_TYPE_NULL:
+		ret = 0;
+
+		break;
+	case QCOM_TEE_OBJECT_TYPE_CB_OBJECT:
+		object->ops = ops;
+		if (!object->ops->dispatch)
+			return -EINVAL;
+
+		object->owner = owner;
+		if (!try_module_get(object->owner))
+			return -EINVAL;
+
+		/* If failed, "no-name"; it is not really a reason to fail here. */
+		object->name = kvasprintf_const(GFP_KERNEL, fmt, ap);
+		QCOM_TEE_OBJECT_SET(object, QCOM_TEE_OBJECT_TYPE_CB_OBJECT);
+
+		ret = 0;
+		break;
+	case QCOM_TEE_OBJECT_TYPE_ROOT:
+	case QCOM_TEE_OBJECT_TYPE_TEE:
+	default:
+		ret = -EINVAL;
+	}
+	va_end(ap);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(__qcom_tee_object_user_init);
+
+/**
+ * qcom_tee_object_type() - Returns type of object represented by an object id.
+ * @object_id: object id for the object.
+ *
+ * This is similar to typeof_qcom_tee_object() but instead of receiving object
+ * as argument it receives object id. It is used internally on return path
+ * from QTEE.
+ *
+ * Return: Returns type of object referenced by @object_id.
+ */
+static enum qcom_tee_object_type qcom_tee_object_type(unsigned int object_id)
+{
+	if (object_id == QCOM_TEE_MSG_OBJECT_NULL)
+		return QCOM_TEE_OBJECT_TYPE_NULL;
+
+	if (object_id & QCOM_TEE_MSG_OBJECT_NS_BIT)
+		return QCOM_TEE_OBJECT_TYPE_CB_OBJECT;
+
+	return QCOM_TEE_OBJECT_TYPE_TEE;
+}
+
+/**
+ * qcom_tee_object_init() - Initialize an object for QTEE.
+ * @object: return object
+ * @object_id: object id received form QTEE
+ *
+ * Return: On success return 0 or <0 on failure.
+ */
+static int qcom_tee_object_init(struct qcom_tee_object **object, unsigned int object_id)
+{
+	struct qcom_tee_object *qto;
+	int ret = 0;
+
+	switch (qcom_tee_object_type(object_id)) {
+	case QCOM_TEE_OBJECT_TYPE_NULL:
+		*object = NULL_QCOM_TEE_OBJECT;
+
+		break;
+	case QCOM_TEE_OBJECT_TYPE_CB_OBJECT:
+		qto = qcom_tee_local_object_get(object_id);
+		if (qto != NULL_QCOM_TEE_OBJECT)
+			*object = qto;
+		else
+			ret = -EINVAL;
+
+		break;
+	case QCOM_TEE_OBJECT_TYPE_TEE:
+		qto = qcom_tee_object_alloc();
+		if (qto) {
+			/* If failed, "no-name"; it is not really a reason to fail here. */
+			qto->name = kasprintf(GFP_KERNEL, "qcom_tee-%u", object_id);
+			QCOM_TEE_OBJECT_SET(qto, QCOM_TEE_OBJECT_TYPE_TEE, object_id);
+
+			*object = qto;
+		} else {
+			ret = -ENOMEM;
+		}
+
+		break;
+	default:
+
+		break;
+	}
+
+	if (ret)
+		*object = NULL_QCOM_TEE_OBJECT;
+
+	return ret;
+}
+
+/* Marshaling API. */
+/* qcom_tee_prepare_msg  - Prepares inbound buffer for sending to QTEE
+ * qcom_tee_update_args  - Parses QTEE response in inbound buffer
+ * qcom_tee_prepare_args - Parses QTEE request from outbound buffer
+ * qcom_tee_update_msg   - Updates outbound buffer with response for QTEE request
+ */
+
+static int qcom_tee_prepare_msg(struct qcom_tee_object_invoke_ctx *oic,
+				struct qcom_tee_object *object, u32 op,	struct qcom_tee_arg *u)
+{
+	struct qcom_tee_msg_object_invoke *msg;
+	unsigned int object_id;
+	int ib, ob, io, oo;
+	size_t off;
+	int i;
+
+	/* Use input message buffer in 'oic'. */
+	msg = (struct qcom_tee_msg_object_invoke *)oic->in_msg.addr;
+
+	/* Start offset in a message for buffer arguments. */
+	off = qcom_tee_msg_buffer_args(struct qcom_tee_msg_object_invoke, qcom_tee_args_len(u));
+
+	/* Get id of object being invoked. */
+	if (qcom_tee_object_id_get(object, &object_id))
+		return -ENOSPC;
+
+	ib = 0;
+	qcom_tee_arg_for_each_input_buffer(i, u) {
+		void *ptr;
+
+		/* qcom_tee_msg_buffers_alloc() already checked overflow in message! */
+		msg->args[ib].b.offset = off;
+		msg->args[ib].b.size = u[i].b.size;
+
+		ptr = qcom_tee_msg_offset_to_ptr(msg, off);
+		if (!(u[i].flags & QCOM_TEE_ARG_FLAGS_UADDR))
+			memcpy(ptr, u[i].b.addr, u[i].b.size);
+		else if (copy_from_user(ptr, u[i].b.uaddr, u[i].b.size))
+			return -EINVAL;
+
+		off += qcom_tee_msg_offset_align(u[i].b.size);
+		ib++;
+	}
+
+	ob = ib;
+	qcom_tee_arg_for_each_output_buffer(i, u) {
+		/* qcom_tee_msg_buffers_alloc() already checked overflow in message! */
+		msg->args[ob].b.offset = off;
+		msg->args[ob].b.size = u[i].b.size;
+
+		off += qcom_tee_msg_offset_align(u[i].b.size);
+		ob++;
+	}
+
+	io = ob;
+	qcom_tee_arg_for_each_input_object(i, u) {
+		if (qcom_tee_object_id_get(u[i].o, &msg->args[io].o)) {
+			/* Unable to qcom_tee_object_id_get; put whatever we got. */
+			qcom_tee_object_id_put(object_id);
+			for (--io; io >= ob; io--)
+				qcom_tee_object_id_put(msg->args[io].o);
+
+			return -ENOSPC;
+		}
+
+		io++;
+	}
+
+	oo = io;
+	qcom_tee_arg_for_each_output_object(i, u)
+		oo++;
+
+	/* Set object, operation, and argument counts. */
+	qcom_tee_msg_init(msg, object_id, op, ib, ob, io, oo);
+
+	return 0;
+}
+
+static int qcom_tee_update_args(struct qcom_tee_arg *u, struct qcom_tee_object_invoke_ctx *oic)
+{
+	struct qcom_tee_msg_object_invoke *msg;
+	int ib, ob, io, oo;
+	int i, ret = 0;
+
+	/* Use input message buffer in 'oic'. */
+	msg = (struct qcom_tee_msg_object_invoke *)oic->in_msg.addr;
+
+	ib = 0;
+	qcom_tee_arg_for_each_input_buffer(i, u)
+		ib++;
+
+	ob = ib;
+	qcom_tee_arg_for_each_output_buffer(i, u) {
+		void *ptr = qcom_tee_msg_offset_to_ptr(msg, msg->args[ob].b.offset);
+
+		if (!(u[i].flags & QCOM_TEE_ARG_FLAGS_UADDR)) {
+			memcpy(u[i].b.addr, ptr, msg->args[ob].b.size);
+		} else if (copy_to_user(u[i].b.uaddr, ptr, msg->args[ob].b.size)) {
+			/* On ERROR, continue to process arguments to get to output object. */
+			ret = -EINVAL;
+		}
+
+		u[i].b.size = msg->args[ob].b.size;
+		ob++;
+	}
+
+	io = ob;
+	qcom_tee_arg_for_each_input_object(i, u)
+		io++;
+
+	oo = io;
+	qcom_tee_arg_for_each_output_object(i, u) {
+		int err;
+
+		/* On ERROR, continue to process arguments so that we can issue the RELEASE. */
+		err = qcom_tee_object_init(&u[i].o, msg->args[oo].o);
+		if (err)
+			ret = err;
+
+		oo++;
+	}
+
+	return ret;
+}
+
+static int qcom_tee_prepare_args(struct qcom_tee_object_invoke_ctx *oic)
+{
+	int i, ret = 0;
+
+	/* Use output message buffer in 'oic'. */
+	struct qcom_tee_msg_callback *msg = (struct qcom_tee_msg_callback *)oic->out_msg.addr;
+
+	qcom_tee_msg_for_each_input_buffer(i, msg) {
+		oic->u[i].b.addr = qcom_tee_msg_offset_to_ptr(msg, msg->args[i].b.offset);
+		oic->u[i].b.size = msg->args[i].b.size;
+		oic->u[i].type = QCOM_TEE_ARG_TYPE_IB;
+	}
+
+	qcom_tee_msg_for_each_output_buffer(i, msg) {
+		oic->u[i].b.addr = qcom_tee_msg_offset_to_ptr(msg, msg->args[i].b.offset);
+		oic->u[i].b.size = msg->args[i].b.size;
+		oic->u[i].type = QCOM_TEE_ARG_TYPE_OB;
+	}
+
+	qcom_tee_msg_for_each_input_object(i, msg) {
+		int err;
+
+		/* On ERROR, continue to process arguments so that we can issue the RELEASE. */
+		err = qcom_tee_object_init(&oic->u[i].o, msg->args[i].o);
+		if (err)
+			ret = err;
+
+		oic->u[i].type = QCOM_TEE_ARG_TYPE_IO;
+	}
+
+	qcom_tee_msg_for_each_output_object(i, msg)
+		oic->u[i].type = QCOM_TEE_ARG_TYPE_OO;
+
+	/* End of Arguments. */
+	oic->u[i].type = QCOM_TEE_ARG_TYPE_INV;
+
+	return ret;
+}
+
+static int qcom_tee_update_msg(struct qcom_tee_object_invoke_ctx *oic)
+{
+	int ib, ob, io, oo;
+	int i;
+
+	/* Use output message buffer in 'oic'. */
+	struct qcom_tee_msg_callback *msg = (struct qcom_tee_msg_callback *)oic->out_msg.addr;
+
+	ib = 0;
+	qcom_tee_arg_for_each_input_buffer(i, oic->u)
+		ib++;
+
+	ob = ib;
+	qcom_tee_arg_for_each_output_buffer(i, oic->u) {
+		/* Only reduce size; never increase it. */
+		if (msg->args[ob].b.size < oic->u[i].b.size)
+			return -EINVAL;
+
+		msg->args[ob].b.size = oic->u[i].b.size;
+		ob++;
+	}
+
+	io = ob;
+	qcom_tee_arg_for_each_input_object(i, oic->u)
+		io++;
+
+	oo = io;
+	qcom_tee_arg_for_each_output_object(i, oic->u) {
+		if (qcom_tee_object_id_get(oic->u[i].o, &msg->args[oo].o)) {
+			/* Unable to qcom_tee_object_id_get; put whatever we got. */
+			for (--oo; oo >= io; --oo)
+				qcom_tee_object_id_put(msg->args[oo].o);
+
+			return -ENOSPC;
+		}
+
+		oo++;
+	}
+
+	return 0;
+}
+
+/**
+ * define MAX_BUFFER_SIZE - Maximum size of inbound and outbound buffers.
+ *
+ * QTEE transport does not impose any restriction on these buffers. However, if size of
+ * buffers are larger then %MAX_BUFFER_SIZE, user should probably use some other
+ * form of shared memory with QTEE.
+ */
+#define MAX_BUFFER_SIZE SZ_8K
+
+/* Pool to allocate inbound and outbound buffers. */
+static struct qcom_tzmem_pool *tzmem_msg_pool;
+
+static int qcom_tee_msg_buffers_alloc(struct qcom_tee_object_invoke_ctx *oic,
+				      struct qcom_tee_arg *u)
+{
+	size_t size;
+	int i;
+
+	/* Start offset in a message for buffer arguments. */
+	size = qcom_tee_msg_buffer_args(struct qcom_tee_msg_object_invoke, qcom_tee_args_len(u));
+	if (size > MAX_BUFFER_SIZE)
+		return -EINVAL;
+
+	/* Add size of IB arguments. */
+	qcom_tee_arg_for_each_input_buffer(i, u) {
+		size = size_add(size, qcom_tee_msg_offset_align(u[i].b.size));
+		if (size > MAX_BUFFER_SIZE)
+			return -EINVAL;
+	}
+
+	/* Add size of OB arguments. */
+	qcom_tee_arg_for_each_output_buffer(i, u) {
+		size = size_add(size, qcom_tee_msg_offset_align(u[i].b.size));
+		if (size > MAX_BUFFER_SIZE)
+			return -EINVAL;
+	}
+
+	/* QTEE requires inbound buffer size to be page aligned. */
+	size = PAGE_ALIGN(size);
+
+	/* Do allocations. */
+	oic->in_msg.size = size;
+	oic->in_msg.addr = qcom_tzmem_alloc(tzmem_msg_pool, size, GFP_KERNEL);
+	if (!oic->in_msg.addr)
+		return -EINVAL;
+
+	oic->out_msg.size = MAX_BUFFER_SIZE;
+	oic->out_msg.addr = qcom_tzmem_alloc(tzmem_msg_pool, MAX_BUFFER_SIZE, GFP_KERNEL);
+	if (!oic->out_msg.addr) {
+		qcom_tzmem_free(oic->in_msg.addr);
+
+		return -EINVAL;
+	}
+
+	oic->in_msg_paddr = qcom_tzmem_to_phys(oic->in_msg.addr);
+	oic->out_msg_paddr = qcom_tzmem_to_phys(oic->out_msg.addr);
+
+	/* QTEE assume unused buffers are zeroed; Do it now! */
+	memzero_explicit(oic->in_msg.addr, oic->in_msg.size);
+	memzero_explicit(oic->out_msg.addr, oic->out_msg.size);
+
+	return 0;
+}
+
+static void qcom_tee_msg_buffers_free(struct qcom_tee_object_invoke_ctx *oic)
+{
+	qcom_tzmem_free(oic->in_msg.addr);
+	qcom_tzmem_free(oic->out_msg.addr);
+}
+
+static int qcom_tee_msg_buffers_init(void)
+{
+	struct qcom_tzmem_pool_config config = {
+		.policy = QCOM_TZMEM_POLICY_ON_DEMAND,
+		/* 4M seems enough, it is used for QTEE meg header and qcom_tee_msg_arg array. */
+		.max_size = SZ_4M
+	};
+
+	tzmem_msg_pool = qcom_tzmem_pool_new(&config);
+	if (IS_ERR(tzmem_msg_pool))
+		return PTR_ERR(tzmem_msg_pool);
+
+	return 0;
+}
+
+static void qcom_tee_msg_buffers_destroy(void)
+{
+	qcom_tzmem_pool_free(tzmem_msg_pool);
+}
+
+/* Invoke a REE object. */
+static void qcom_tee_object_invoke(struct qcom_tee_object_invoke_ctx *oic,
+				   struct qcom_tee_msg_callback *msg)
+{
+	int i, errno;
+	u32 op;
+
+	/* Get object being invoked. */
+	unsigned int object_id = msg->cxt;
+	struct qcom_tee_object *object;
+
+	/* QTEE can not invoke NULL object or objects it hosts. */
+	if (qcom_tee_object_type(object_id) == QCOM_TEE_OBJECT_TYPE_NULL ||
+	    qcom_tee_object_type(object_id) == QCOM_TEE_OBJECT_TYPE_TEE) {
+		errno = -EINVAL;
+		goto out;
+	}
+
+	object = qcom_tee_local_object_get(object_id);
+	if (object == NULL_QCOM_TEE_OBJECT) {
+		errno = -EINVAL;
+		goto out;
+	}
+
+	oic->object = object;
+
+	/* Filter bits used by transport. */
+	op = msg->op & QCOM_TEE_MSG_OBJECT_OP_MASK;
+
+	switch (op) {
+	case QCOM_TEE_MSG_OBJECT_OP_RELEASE:
+		qcom_tee_object_id_put(object_id);
+		qcom_tee_object_put(object);
+		errno = 0;
+
+		break;
+	case QCOM_TEE_MSG_OBJECT_OP_RETAIN:
+		qcom_tee_object_get(object);
+		errno = 0;
+
+		break;
+	default:
+		errno = qcom_tee_prepare_args(oic);
+		if (errno) {
+			/* Unable to parse the message. Release any object arrived as input. */
+			qcom_tee_arg_for_each_input_buffer(i, oic->u)
+				qcom_tee_object_put(oic->u[i].o);
+
+			break;
+		}
+
+		errno = object->ops->dispatch(oic, object, op, oic->u);
+		if (!errno) {
+			/* On SUCCESS, notify object at appropriate time. */
+			oic->flags |= QCOM_TEE_OIC_FLAG_NOTIFY;
+		}
+	}
+
+out:
+
+	oic->errno = errno;
+}
+
+/**
+ * __qcom_tee_object_do_invoke() - Submit an invocation for an object.
+ * @oic: context to use for current invocation.
+ * @object: object being invoked.
+ * @op: requested operation on object.
+ * @u: array of argument for the current invocation.
+ * @result: result returned from QTEE.
+ *
+ * The caller is responsible to keep track of the refcount for each object,
+ * including @object. On return, the caller loses the ownership of all input
+ * object of type %QCOM_TEE_OBJECT_TYPE_CB_OBJECT.
+ *
+ * Return: On success return 0. On error returns -EINVAL and -ENOSPC if unable to initiate
+ * the invocation, -EAGAIN if invocation failed and user may retry the invocation.
+ * Otherwise, -ENODEV on fatal failure.
+ */
+int __qcom_tee_object_do_invoke(struct qcom_tee_object_invoke_ctx *oic,
+				struct qcom_tee_object *object, u32 op,	struct qcom_tee_arg *u,
+				int *result)
+{
+	struct qcom_tee_msg_callback *cb_msg;
+	u64 response_type;
+	int i, ret, errno;
+
+	ret = qcom_tee_msg_buffers_alloc(oic, u);
+	if (ret)
+		return ret;
+
+	ret = qcom_tee_prepare_msg(oic, object, op, u);
+	if (ret)
+		goto out;
+
+	cb_msg = (struct qcom_tee_msg_callback *)oic->out_msg.addr;
+
+	while (1) {
+		if (oic->flags & QCOM_TEE_OIC_FLAG_BUSY) {
+			errno = oic->errno;
+			/* Update output buffer only if result is SUCCESS. */
+			if (!errno)
+				errno = qcom_tee_update_msg(oic);
+
+			qcom_tee_msg_translate_err(cb_msg, errno);
+		}
+
+		/* Invoke remote object. */
+		ret = qcom_tee_object_invoke_ctx_invoke(oic, result, &response_type);
+
+		if (oic->flags & QCOM_TEE_OIC_FLAG_BUSY) {
+			struct qcom_tee_object *qto = oic->object;
+
+			if (qto) {
+				if (oic->flags & QCOM_TEE_OIC_FLAG_NOTIFY) {
+					if (qto->ops->notify)
+						qto->ops->notify(oic, qto, errno || ret);
+				}
+
+				/* Matching get is in qcom_tee_object_invoke. */
+				qcom_tee_object_put(qto);
+			}
+
+			oic->object = NULL_QCOM_TEE_OBJECT;
+			oic->flags &= ~(QCOM_TEE_OIC_FLAG_BUSY | QCOM_TEE_OIC_FLAG_NOTIFY);
+		}
+
+		if (ret) {
+			if (!(oic->flags & QCOM_TEE_OIC_FLAG_SHARED)) {
+				/* Release QCOM_TEE_OBJECT_TYPE_CB_OBJECT input objects. */
+				qcom_tee_arg_for_each_input_object(i, u)
+					if (typeof_qcom_tee_object(u[i].o) ==
+						QCOM_TEE_OBJECT_TYPE_CB_OBJECT)
+						qcom_tee_object_put(u[i].o);
+
+				ret = -EAGAIN;
+			} else {
+				/* On error, there is no clean way to exit. */
+				/* For some reason we can not communicate with QTEE, so we can not
+				 * notify QTEE about the failure and do further cleanup.
+				 */
+				ret = -ENODEV;
+			}
+
+			goto out;
+
+		} else {
+			/* QTEE obtained the ownership of QCOM_TEE_OBJECT_TYPE_CB_OBJECT
+			 * input objects in 'u'. On further failure, QTEE is responsible
+			 * to release them.
+			 */
+			oic->flags |= QCOM_TEE_OIC_FLAG_SHARED;
+		}
+
+		/* Is it a callback request? */
+#define QCOM_TEE_RESULT_INBOUND_REQ_NEEDED 3
+		if (response_type != QCOM_TEE_RESULT_INBOUND_REQ_NEEDED) {
+			if (!*result) {
+				ret = qcom_tee_update_args(u, oic);
+				if (ret) {
+					qcom_tee_arg_for_each_output_object(i, u)
+						qcom_tee_object_put(u[i].o);
+
+					ret = -EAGAIN;
+				}
+			}
+
+			break;
+
+		} else {
+			oic->flags |= QCOM_TEE_OIC_FLAG_BUSY;
+			/* Before dispatching the request, handle any pending async requests. */
+			qcom_tee_fetch_async_reqs(oic);
+			qcom_tee_object_invoke(oic, cb_msg);
+		}
+	}
+
+	qcom_tee_fetch_async_reqs(oic);
+
+out:
+	qcom_tee_msg_buffers_free(oic);
+
+	return ret;
+}
+
+int qcom_tee_object_do_invoke(struct qcom_tee_object_invoke_ctx *oic,
+			      struct qcom_tee_object *object, u32 op, struct qcom_tee_arg *u,
+			      int *result)
+{
+	/* User can not set bits used by transport. */
+	if (op & ~QCOM_TEE_MSG_OBJECT_OP_MASK)
+		return -EINVAL;
+
+	/* User can only invoke QTEE hosted objects. */
+	if (typeof_qcom_tee_object(object) != QCOM_TEE_OBJECT_TYPE_TEE &&
+	    typeof_qcom_tee_object(object) != QCOM_TEE_OBJECT_TYPE_ROOT)
+		return -EINVAL;
+
+	/* User can not issue reserved operations to QTEE. */
+	if (op == QCOM_TEE_MSG_OBJECT_OP_RELEASE || op == QCOM_TEE_MSG_OBJECT_OP_RETAIN)
+		return -EINVAL;
+
+	return  __qcom_tee_object_do_invoke(oic, object, op, u, result);
+}
+EXPORT_SYMBOL_GPL(qcom_tee_object_do_invoke);
+
+/* Dump object table. */
+static ssize_t qcom_tee_object_table_show(struct kobject *kobj,
+					  struct kobj_attribute *attr, char *buf)
+{
+	struct qcom_tee_object *object;
+	unsigned long idx;
+	size_t len = 0;
+
+	xa_for_each_start(&xa_qcom_local_objects, idx, object, QCOM_TEE_OBJECT_ID_START) {
+		len += sysfs_emit_at(buf, len, "%4lx %4d %s\n", idx,
+				     kref_read(&object->refcount),
+				     qcom_tee_object_name(object));
+	}
+
+	return len;
+}
+
+static struct kobj_attribute object_table = __ATTR_RO(qcom_tee_object_table);
+static struct kobj_attribute release = __ATTR_RO(qcom_tee_release_wq);
+static struct attribute *attrs[] = {
+	&object_table.attr,
+	&release.attr,
+	NULL
+};
+
+static struct attribute_group attr_group = {
+	.attrs = attrs,
+};
+
+static struct kobject *qcom_tee_object_invoke_kobj;
+static int __init qcom_tee_object_invoke_init(void)
+{
+	int ret;
+
+	ret = qcom_tee_release_init();
+	if (ret)
+		return ret;
+
+	ret = qcom_tee_msg_buffers_init();
+	if (ret)
+		goto err_release_destroy;
+
+	/* Create '/sys/firmware/qcom_tee'. */
+	qcom_tee_object_invoke_kobj = kobject_create_and_add("qcom_tee", firmware_kobj);
+	if (!qcom_tee_object_invoke_kobj) {
+		ret = -ENOMEM;
+
+		goto err_msg_buffers_destroy;
+	}
+
+	/* Create 'qcom_tee_object_table' and 'qcom_tee_release_wq'. */
+	ret = sysfs_create_group(qcom_tee_object_invoke_kobj, &attr_group);
+	if (ret)
+		goto err_kobject_put;
+
+	return 0;
+
+err_kobject_put:
+	/* Remove '/sys/firmware/qcom_tee'. */
+	kobject_put(qcom_tee_object_invoke_kobj);
+err_msg_buffers_destroy:
+	qcom_tee_msg_buffers_destroy();
+err_release_destroy:
+	qcom_tee_release_destroy();
+
+	return ret;
+}
+module_init(qcom_tee_object_invoke_init);
+
+static void __exit qcom_tee_object_invoke_deinit(void)
+{
+	/* Wait for RELEASE operations for QTEE objects. */
+	qcom_tee_release_destroy();
+	qcom_tee_msg_buffers_destroy();
+	sysfs_remove_group(qcom_tee_object_invoke_kobj, &attr_group);
+	kobject_put(qcom_tee_object_invoke_kobj);
+}
+module_exit(qcom_tee_object_invoke_deinit);
+
+MODULE_AUTHOR("Qualcomm");
+MODULE_DESCRIPTION("QTEE driver");
+MODULE_VERSION("1.0");
+MODULE_LICENSE("GPL");
diff --git a/drivers/tee/qcomtee/qcom_scm.c b/drivers/tee/qcomtee/qcom_scm.c
new file mode 100644
index 000000000000..230faf249095
--- /dev/null
+++ b/drivers/tee/qcomtee/qcom_scm.c
@@ -0,0 +1,36 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <linux/firmware/qcom/qcom_scm.h>
+
+#include "qcomtee_private.h"
+
+int qcom_tee_object_invoke_ctx_invoke(struct qcom_tee_object_invoke_ctx *oic,
+				      int *result, u64 *response_type)
+{
+	int ret;
+	u64 res;
+
+	if (!(oic->flags & QCOM_TEE_OIC_FLAG_BUSY)) {
+		/* Direct QTEE object invocation. */
+		ret = qcom_scm_qtee_invoke_smc(oic->in_msg_paddr,
+					       oic->in_msg.size,
+					       oic->out_msg_paddr,
+					       oic->out_msg.size,
+					       &res, response_type, NULL);
+	} else {
+		/* Submit callback response. */
+		ret = qcom_scm_qtee_callback_response(oic->out_msg_paddr,
+						      oic->out_msg.size,
+						      &res, response_type, NULL);
+	}
+
+	if (ret)
+		pr_err("QTEE returned with %d.\n", ret);
+	else
+		*result = (int)res;
+
+	return ret;
+}
diff --git a/drivers/tee/qcomtee/qcomtee_msg.h b/drivers/tee/qcomtee/qcomtee_msg.h
new file mode 100644
index 000000000000..7c968834ec9d
--- /dev/null
+++ b/drivers/tee/qcomtee/qcomtee_msg.h
@@ -0,0 +1,217 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef QCOMTEE_MSG_H
+#define QCOMTEE_MSG_H
+
+#include <linux/firmware/qcom/qcom_tee.h>
+
+/**
+ * DOC: ''Qualcomm TEE'' (QTEE) Transport Message
+ *
+ * There are two buffers shared with QTEE, inbound and outbound buffers.
+ * The inbound buffer is used for direct object invocation and the outbound buffer is
+ * used to make a request from QTEE to kernel, i.e. callback request.
+ *
+ * The unused tail of the outbound buffer is also used for sending and receiving
+ * asynchronous messages. An asynchronous message is independent from the current
+ * object invocation (i.e. contents of the inbound buffer) or callback request
+ * (i.e. the head of the outbound buffer), see qcom_tee_get_async_buffer(). It is
+ * used by endpoints (QTEE or kernel) as an optimization to reduce number of context
+ * switches between secure and non-secure world.
+ *
+ * For instance, QTEE never sends an explicit callback request to release an object in
+ * kernel. Instead, it sends asynchronous release messages in outbound buffer when QTEE
+ * returns from previous direct object invocation, or append asynchronous release
+ * messages after the current callback request.
+ *
+ * QTEE supports two types of arguments in a message: buffer and object arguments.
+ * Depending on the direction of data flow, they could be input buffer (IO) to QTEE,
+ * output buffer (OB) from QTEE, input object (IO) to QTEE, or output object (OO) from
+ * QTEE. Object arguments hold object ids. Buffer arguments hold (offset, size) pairs
+ * into the inbound or outbound buffers.
+ *
+ * QTEE holds an object table for objects, it hosts and exposes to kernel. An object id
+ * is an index to the object table in QTEE.
+ *
+ * For direct object invocation message format in inbound buffer see
+ * &struct qcom_tee_msg_object_invoke. For callback request message format in outbound
+ * buffer see &struct qcom_tee_msg_callback. For the message format for asynchronous message
+ * in outbound buffer see &struct qcom_tee_async_msg_hdr.
+ */
+
+/**
+ * define QCOM_TEE_MSG_OBJECT_NS_BIT - Non-secure bit
+ *
+ * Object id is a globally unique 32-bit number. Ids referencing objects in kernel should
+ * have %QCOM_TEE_MSG_OBJECT_NS_BIT set.
+ */
+#define QCOM_TEE_MSG_OBJECT_NS_BIT BIT(31)
+
+/* Static object ids recognized by QTEE. */
+#define QCOM_TEE_MSG_OBJECT_NULL (0U)
+#define QCOM_TEE_MSG_OBJECT_ROOT (1U)
+
+/* Definitions from QTEE as part of the transport protocol. */
+
+/* qcom_tee_msg_arg is argument as recognized by QTEE. */
+union qcom_tee_msg_arg {
+	struct {
+		u32 offset;
+		u32 size;
+	} b;
+	u32 o;
+};
+
+/* BI and BO payloads in a QTEE messages should be at 64-bit boundaries. */
+#define qcom_tee_msg_offset_align(o) ALIGN((o), sizeof(u64))
+
+/* Operation for objects is 32-bit. Transport uses upper 16-bits internally. */
+#define QCOM_TEE_MSG_OBJECT_OP_MASK 0x0000FFFFU
+
+/* Reserved Operation IDs sent to QTEE: */
+/* QCOM_TEE_MSG_OBJECT_OP_RELEASE - Reduces the refcount and releases the object.
+ * QCOM_TEE_MSG_OBJECT_OP_RETAIN  - Increases the refcount.
+ *
+ * These operation id are valid for all objects. They are not available outside of this
+ * driver. Developers should use qcom_tee_object_get() and qcom_tee_object_put(), to
+ * achieve the same.
+ */
+
+#define QCOM_TEE_MSG_OBJECT_OP_RELEASE	(QCOM_TEE_MSG_OBJECT_OP_MASK - 0)
+#define QCOM_TEE_MSG_OBJECT_OP_RETAIN	(QCOM_TEE_MSG_OBJECT_OP_MASK - 1)
+
+/**
+ * struct qcom_tee_msg_object_invoke - Direct object invocation message
+ * @ctx: object id hosted in QTEE
+ * @op: operation for the object
+ * @counts: number of different type of arguments in @args
+ * @args: array of arguments
+ *
+ * @counts consists of 4 * 4-bits felids. Bits 0 - 3, is number of input buffers,
+ * bits 4 - 7, is number of output buffers, bits 8 - 11, is number of input objects,
+ * and bits 12 - 15, is number of output objects. Remaining bits should be zero.
+ *
+ * Maximum number of arguments of each type is defined by %QCOM_TEE_ARGS_PER_TYPE.
+ */
+struct qcom_tee_msg_object_invoke {
+	u32 cxt;
+	u32 op;
+	u32 counts;
+	union qcom_tee_msg_arg args[];
+};
+
+/**
+ * struct qcom_tee_msg_callback - Callback request message
+ * @result: result of operation @op on object referenced by @cxt
+ * @cxt: object id hosted in kernel
+ * @op: operation for the object
+ * @counts: number of different type of arguments in @args
+ * @args: array of arguments
+ *
+ * For details of @counts, see &qcom_tee_msg_object_invoke.counts.
+ */
+struct qcom_tee_msg_callback {
+	u32 result;
+	u32 cxt;
+	u32 op;
+	u32 counts;
+	union qcom_tee_msg_arg args[];
+};
+
+/* Offset in the message for the beginning of buffer argument's contents. */
+#define qcom_tee_msg_buffer_args(t, n) \
+	qcom_tee_msg_offset_align(struct_size_t(t, args, n))
+/* Pointer to the beginning of a buffer argument's content at an offset in a message. */
+#define qcom_tee_msg_offset_to_ptr(m, off) ((void *)&((char *)(m))[(off)])
+
+/* Some helpers to manage msg.counts. */
+
+#define QCOM_TEE_MSG_NUM_IB(x) ((x) & 0xfU)
+#define QCOM_TEE_MSG_NUM_OB(x) (((x) >> 4) & 0xfU)
+#define QCOM_TEE_MSG_NUM_IO(x) (((x) >> 8) & 0xfU)
+#define QCOM_TEE_MSG_NUM_OO(x) (((x) >> 12) & 0xfU)
+
+#define QCOM_TEE_MSG_IDX_IB(x) (0U)
+#define QCOM_TEE_MSG_IDX_OB(x) (QCOM_TEE_MSG_IDX_IB(x) + QCOM_TEE_MSG_NUM_IB(x))
+#define QCOM_TEE_MSG_IDX_IO(x) (QCOM_TEE_MSG_IDX_OB(x) + QCOM_TEE_MSG_NUM_OB(x))
+#define QCOM_TEE_MSG_IDX_OO(x) (QCOM_TEE_MSG_IDX_IO(x) + QCOM_TEE_MSG_NUM_IO(x))
+
+#define qcom_tee_msg_for_each(i, c, type)	\
+	for (i = QCOM_TEE_MSG_IDX_##type(c);	\
+	     i < (QCOM_TEE_MSG_IDX_##type(c) + QCOM_TEE_MSG_NUM_##type(c)); \
+	     i++)
+
+#define qcom_tee_msg_for_each_input_buffer(i, m)  qcom_tee_msg_for_each(i, (m)->counts, IB)
+#define qcom_tee_msg_for_each_output_buffer(i, m) qcom_tee_msg_for_each(i, (m)->counts, OB)
+#define qcom_tee_msg_for_each_input_object(i, m)  qcom_tee_msg_for_each(i, (m)->counts, IO)
+#define qcom_tee_msg_for_each_output_object(i, m) qcom_tee_msg_for_each(i, (m)->counts, OO)
+
+/* Sum of arguments in a message. */
+#define qcom_tee_msg_args(m) (QCOM_TEE_MSG_IDX_OO((m)->counts) + QCOM_TEE_MSG_NUM_OO((m)->counts))
+
+static inline void qcom_tee_msg_init(struct qcom_tee_msg_object_invoke *msg, u32 cxt, u32 op,
+				     int in_buffer, int out_buffer, int in_object, int out_object)
+{
+	msg->counts |= (in_buffer & 0xfU);
+	msg->counts |= ((out_buffer - in_buffer) & 0xfU) << 4;
+	msg->counts |= ((in_object - out_buffer) & 0xfU) << 8;
+	msg->counts |= ((out_object - in_object) & 0xfU) << 12;
+	msg->cxt = cxt;
+	msg->op = op;
+}
+
+/* Generic error codes. */
+#define QCOM_TEE_MSG_OK			0	/* non-specific success code. */
+#define QCOM_TEE_MSG_ERROR		1	/* non-specific error. */
+#define QCOM_TEE_MSG_ERROR_INVALID	2	/* unsupported/unrecognized request. */
+#define QCOM_TEE_MSG_ERROR_SIZE_IN	3	/* supplied buffer/string too large. */
+#define QCOM_TEE_MSG_ERROR_SIZE_OUT	4	/* supplied output buffer too small. */
+#define QCOM_TEE_MSG_ERROR_USERBASE	10	/* start of user-defined error range. */
+
+/* Transport layer error codes. */
+#define QCOM_TEE_MSG_ERROR_DEFUNCT	-90	/* object no longer exists. */
+#define QCOM_TEE_MSG_ERROR_ABORT	-91	/* calling thread must exit. */
+#define QCOM_TEE_MSG_ERROR_BADOBJ	-92	/* invalid object context. */
+#define QCOM_TEE_MSG_ERROR_NOSLOTS	-93	/* caller's object table full. */
+#define QCOM_TEE_MSG_ERROR_MAXARGS	-94	/* too many args. */
+#define QCOM_TEE_MSG_ERROR_MAXDATA	-95	/* buffers too large. */
+#define QCOM_TEE_MSG_ERROR_UNAVAIL	-96	/* the request could not be processed. */
+#define QCOM_TEE_MSG_ERROR_KMEM		-97	/* kernel out of memory. */
+#define QCOM_TEE_MSG_ERROR_REMOTE	-98	/* local method sent to remote object. */
+#define QCOM_TEE_MSG_ERROR_BUSY		-99	/* Object is busy. */
+#define QCOM_TEE_MSG_ERROR_TIMEOUT	-103	/* Call Back Object invocation timed out. */
+
+static inline void qcom_tee_msg_translate_err(struct qcom_tee_msg_callback *cb_msg, int err)
+{
+	if (!err) {
+		cb_msg->result = QCOM_TEE_MSG_OK;
+	} else if (err < 0) {
+		/* If err < 0, then it is a transport error. */
+		switch (err) {
+		case -ENOMEM:
+			cb_msg->result = QCOM_TEE_MSG_ERROR_KMEM;
+			break;
+		case -ENODEV:
+			cb_msg->result = QCOM_TEE_MSG_ERROR_DEFUNCT;
+			break;
+		case -ENOSPC:
+		case -EBUSY:
+			cb_msg->result = QCOM_TEE_MSG_ERROR_BUSY;
+			break;
+		case -EBADF:
+		case -EINVAL:
+			cb_msg->result = QCOM_TEE_MSG_ERROR_UNAVAIL;
+			break;
+		default:
+			cb_msg->result =  QCOM_TEE_MSG_ERROR;
+		}
+	} else {
+		/* If err > 0, then it is user defined error, pass it as is. */
+		cb_msg->result = err;
+	}
+}
+
+#endif /* QCOMTEE_MSG_H */
diff --git a/drivers/tee/qcomtee/qcomtee_private.h b/drivers/tee/qcomtee/qcomtee_private.h
new file mode 100644
index 000000000000..e3e4ef51c0b2
--- /dev/null
+++ b/drivers/tee/qcomtee/qcomtee_private.h
@@ -0,0 +1,47 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef QCOM_TEE_PRIVATE_H
+#define QCOM_TEE_PRIVATE_H
+
+#include <linux/firmware/qcom/qcom_tee.h>
+#include <linux/kobject.h>
+#include <linux/tee_core.h>
+
+struct qcom_tee_object *qcom_tee_idx_erase(u32 idx);
+void qcom_tee_object_free(struct qcom_tee_object *object);
+
+/* Process async messages form QTEE. */
+void qcom_tee_fetch_async_reqs(struct qcom_tee_object_invoke_ctx *oic);
+
+int qcom_tee_release_init(void);
+void qcom_tee_release_destroy(void);
+void qcom_tee_release_tee_object(struct qcom_tee_object *object);
+ssize_t qcom_tee_release_wq_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf);
+
+/* SCM call. */
+int qcom_tee_object_invoke_ctx_invoke(struct qcom_tee_object_invoke_ctx *oic,
+				      int *result, u64 *response_type);
+
+/**
+ * __qcom_tee_object_do_invoke() - Submit an invocation for an object.
+ * @oic: context to use for current invocation.
+ * @object: object being invoked.
+ * @op: requested operation on object.
+ * @u: array of argument for the current invocation.
+ * @result: result returned from QTEE.
+ *
+ * Same as qcom_tee_object_do_invoke() without @object and @op is 32-bit,
+ * upper 16-bits are for internal use.
+ *
+ * Return: On success return 0. On error returns -EINVAL and -ENOSPC if unable to initiate
+ * the invocation, -EAGAIN if invocation failed and user can retry the invocation.
+ * Otherwise, -ENODEV on fatal failure.
+ */
+int __qcom_tee_object_do_invoke(struct qcom_tee_object_invoke_ctx *oic,
+				struct qcom_tee_object *object, u32 op,	struct qcom_tee_arg *u,
+				int *result);
+
+#endif /* QCOM_TEE_PRIVATE_H */
diff --git a/drivers/tee/qcomtee/release.c b/drivers/tee/qcomtee/release.c
new file mode 100644
index 000000000000..f2e048418e23
--- /dev/null
+++ b/drivers/tee/qcomtee/release.c
@@ -0,0 +1,66 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include "qcomtee_private.h"
+#include "qcomtee_msg.h"
+
+static struct workqueue_struct *qcom_tee_release_wq;
+
+/* Number of all release requests pending for processing. */
+static atomic_t qcom_tee_pending_releases = ATOMIC_INIT(0);
+
+/* qcom_tee_object_do_release makes direct object invocation to release an object. */
+static void qcom_tee_destroy_user_object(struct work_struct *work)
+{
+	static struct qcom_tee_object_invoke_ctx oic;
+	static struct qcom_tee_arg args[1] = { 0 };
+	struct qcom_tee_object *object;
+	int ret, result;
+
+	object = container_of(work, struct qcom_tee_object, work);
+
+	ret = __qcom_tee_object_do_invoke(&oic, object, QCOM_TEE_MSG_OBJECT_OP_RELEASE, args,
+					  &result);
+
+	/* Is it safe to retry the release? */
+	if (ret == -EAGAIN) {
+		queue_work(qcom_tee_release_wq, &object->work);
+	} else {
+		if (ret || result)
+			pr_err("%s: %s release failed, ret = %d (%x).\n",
+			       __func__, qcom_tee_object_name(object), ret, result);
+
+		atomic_dec(&qcom_tee_pending_releases);
+		qcom_tee_object_free(object);
+	}
+}
+
+/* qcom_tee_release_tee_object puts object in release work queue. */
+void qcom_tee_release_tee_object(struct qcom_tee_object *object)
+{
+	INIT_WORK(&object->work, qcom_tee_destroy_user_object);
+	atomic_inc(&qcom_tee_pending_releases);
+	queue_work(qcom_tee_release_wq, &object->work);
+}
+
+ssize_t qcom_tee_release_wq_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "%d\n", atomic_read(&qcom_tee_pending_releases));
+}
+
+int qcom_tee_release_init(void)
+{
+	qcom_tee_release_wq = alloc_ordered_workqueue("qcom_tee_release_wq", 0);
+	if (!qcom_tee_release_wq)
+		return -ENOMEM;
+
+	return 0;
+}
+
+void qcom_tee_release_destroy(void)
+{
+	/* It drains the wq. */
+	destroy_workqueue(qcom_tee_release_wq);
+}
diff --git a/include/linux/firmware/qcom/qcom_tee.h b/include/linux/firmware/qcom/qcom_tee.h
new file mode 100644
index 000000000000..90e5e10a0e62
--- /dev/null
+++ b/include/linux/firmware/qcom/qcom_tee.h
@@ -0,0 +1,284 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/* Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef __QCOM_TEE_H
+#define __QCOM_TEE_H
+
+#include <linux/kref.h>
+#include <linux/completion.h>
+#include <linux/workqueue.h>
+
+struct qcom_tee_object;
+
+/**
+ * DOC: Overview
+ *
+ * qcom_tee_object provides object ref-counting, id allocation for objects hosted in
+ * REE, and necessary message marshaling for Qualcomm TEE (QTEE).
+ *
+ * To invoke an object in QTEE, user calls qcom_tee_object_do_invoke() while passing
+ * an instance of &struct qcom_tee_object and the requested operation + arguments.
+ *
+ * After the boot, QTEE provides a static object %ROOT_QCOM_TEE_OBJECT (type of
+ * %QCOM_TEE_OBJECT_TYPE_ROOT). The root object is invoked to pass user's credentials and
+ * obtain other instances of &struct qcom_tee_object (type of %QCOM_TEE_OBJECT_TYPE_TEE)
+ * that represents services and TAs in QTEE, see &enum qcom_tee_object_type.
+ *
+ * The object received from QTEE are refcounted. So the owner of these objects can
+ * issue qcom_tee_object_get(), to increase the refcount, and pass objects to other
+ * clients, or issue qcom_tee_object_put() to decrease the refcount, and releasing
+ * the resources in QTEE.
+ *
+ * REE can host services accessible to QTEE. A driver should embed an instance of
+ * &struct qcom_tee_object in the struct it wants to export to QTEE (it is called
+ * callback object). It issues qcom_tee_object_user_init() to set the dispatch()
+ * operation for the callback object and set its type to %QCOM_TEE_OBJECT_TYPE_CB_OBJECT.
+ *
+ * core.c holds an object table for callback objects. An object id is assigned
+ * to each callback object which is an index to the object table. QTEE uses these ids
+ * to reference or invoke callback objects.
+ *
+ * If QTEE invoke a callback object in REE, the dispatch() operation is called in the
+ * context of thread that called qcom_tee_object_do_invoke(), originally.
+ */
+
+/**
+ * enum qcom_tee_object_typ - Object types.
+ * @QCOM_TEE_OBJECT_TYPE_TEE: object hosted on QTEE.
+ * @QCOM_TEE_OBJECT_TYPE_CB_OBJECT: object hosted on REE.
+ * @QCOM_TEE_OBJECT_TYPE_ROOT: 'primordial' object.
+ * @QCOM_TEE_OBJECT_TYPE_NULL: NULL object.
+ *
+ * Primordial object is used for bootstrapping the IPC connection between a REE
+ * and QTEE. It is invoked by REE when it wants to get a 'client env'.
+ */
+enum qcom_tee_object_type {
+	QCOM_TEE_OBJECT_TYPE_TEE,
+	QCOM_TEE_OBJECT_TYPE_CB_OBJECT,
+	QCOM_TEE_OBJECT_TYPE_ROOT,
+	QCOM_TEE_OBJECT_TYPE_NULL,
+};
+
+/**
+ * enum qcom_tee_arg_type - Type of QTEE argument.
+ * @QCOM_TEE_ARG_TYPE_INV: invalid type.
+ * @QCOM_TEE_ARG_TYPE_IB: input buffer (IO).
+ * @QCOM_TEE_ARG_TYPE_OO: output object (OO).
+ * @QCOM_TEE_ARG_TYPE_OB: output buffer (OB).
+ * @QCOM_TEE_ARG_TYPE_IO: input object (IO).
+ *
+ * Use invalid type to specify end of argument array.
+ */
+enum qcom_tee_arg_type {
+	QCOM_TEE_ARG_TYPE_INV = 0,
+	QCOM_TEE_ARG_TYPE_OB,
+	QCOM_TEE_ARG_TYPE_OO,
+	QCOM_TEE_ARG_TYPE_IB,
+	QCOM_TEE_ARG_TYPE_IO,
+	QCOM_TEE_ARG_TYPE_NR,
+};
+
+/**
+ * define QCOM_TEE_ARGS_PER_TYPE - Maximum arguments of specific type.
+ *
+ * QTEE transport protocol limits maximum number of argument of specific type
+ * (i.e. IB, OB, IO, and OO).
+ */
+#define QCOM_TEE_ARGS_PER_TYPE 16
+
+/* Maximum arguments that can fit in a QTEE message, ignoring the type. */
+#define QCOM_TEE_ARGS_MAX (QCOM_TEE_ARGS_PER_TYPE * (QCOM_TEE_ARG_TYPE_NR - 1))
+
+struct qcom_tee_buffer {
+	union {
+		void *addr;
+		void __user *uaddr;
+	};
+	size_t size;
+};
+
+/**
+ * struct qcom_tee_arg - Argument for QTEE object invocation.
+ * @type: type of argument as &enum qcom_tee_arg_type.
+ * @flags: extra flags.
+ * @b: address and size if type of argument is buffer.
+ * @o: object instance if type of argument is object.
+ *
+ * &qcom_tee_arg.flags only accept %QCOM_TEE_ARG_FLAGS_UADDR for now which states
+ * that &qcom_tee_arg.b contains userspace address in uaddr.
+ */
+struct qcom_tee_arg {
+	enum qcom_tee_arg_type type;
+/* 'b.uaddr' holds a __user address. */
+#define QCOM_TEE_ARG_FLAGS_UADDR 1
+	unsigned int flags;
+	union {
+		struct qcom_tee_buffer b;
+		struct qcom_tee_object *o;
+	};
+};
+
+static inline int qcom_tee_args_len(struct qcom_tee_arg *args)
+{
+	int i = 0;
+
+	while (args[i].type != QCOM_TEE_ARG_TYPE_INV)
+		i++;
+	return i;
+}
+
+#define QCOM_TEE_OIC_FLAG_BUSY		BIT(1)	/* Context is busy (callback is in progress). */
+#define QCOM_TEE_OIC_FLAG_NOTIFY	BIT(2)	/* Context needs to notify the current object. */
+#define QCOM_TEE_OIC_FLAG_SHARED	BIT(3)	/* Context has shared state with QTEE. */
+
+struct qcom_tee_object_invoke_ctx {
+	unsigned long flags;
+	int errno;
+
+	/* Current object invoked in this callback context. */
+	struct qcom_tee_object *object;
+
+	/* Arguments passed to dispatch callback (+1 for ending QCOM_TEE_ARG_TYPE_INV). */
+	struct qcom_tee_arg u[QCOM_TEE_ARGS_MAX + 1];
+
+	/* Inbound and Outbound buffers shared with QTEE. */
+	struct qcom_tee_buffer in_msg;		/* Inbound Buffer.  */
+	phys_addr_t in_msg_paddr;		/* Physical address of inbound buffer. */
+	struct qcom_tee_buffer out_msg;		/* Outbound Buffer. */
+	phys_addr_t out_msg_paddr;		/* Physical address of outbound buffer. */
+
+	/* Extra data attached to this context. */
+	void *data;
+};
+
+/**
+ * qcom_tee_object_do_invoke() - Submit an invocation for an object.
+ * @oic: context to use for current invocation.
+ * @object: object being invoked.
+ * @op: requested operation on object.
+ * @u: array of argument for the current invocation.
+ * @result: result returned from QTEE.
+ *
+ * The caller is responsible to keep track of the refcount for each object,
+ * including @object. On return, the caller loses the ownership of all input object of
+ * type %QCOM_TEE_OBJECT_TYPE_CB_OBJECT.
+ *
+ * @object can be of %QCOM_TEE_OBJECT_TYPE_ROOT or %QCOM_TEE_OBJECT_TYPE_TEE types.
+ *
+ * Return: On success return 0. On error returns -EINVAL and -ENOSPC if unable to initiate
+ * the invocation, -EAGAIN if invocation failed and user may retry the invocation.
+ * Otherwise, -ENODEV on fatal failure.
+ */
+int qcom_tee_object_do_invoke(struct qcom_tee_object_invoke_ctx *oic,
+			      struct qcom_tee_object *object, u32 op, struct qcom_tee_arg *u,
+			      int *result);
+
+/**
+ * struct qcom_tee_object_operations - Callback object operations.
+ * @release: release object if QTEE is not using it.
+ * @dispatch: dispatch the operation requested by QTEE.
+ * @notify: report status of any pending response submitted by @dispatch.
+ *
+ * Transport may fail (e.g. object table is full) even after @dispatch successfully submitted
+ * the response. @notify is called to do the necessary cleanup.
+ */
+struct qcom_tee_object_operations {
+	void (*release)(struct qcom_tee_object *object);
+	int  (*dispatch)(struct qcom_tee_object_invoke_ctx *oic,
+			 struct qcom_tee_object *object, u32 op, struct qcom_tee_arg *args);
+	void (*notify)(struct qcom_tee_object_invoke_ctx *oic,
+		       struct qcom_tee_object *object, int err);
+};
+
+/**
+ * struct qcom_tee_object - QTEE or REE object.
+ * @name: object name.
+ * @refcount: reference counter.
+ * @object_type: object type as &enum qcom_tee_object_type.
+ * @info: extra information for object.
+ * @owner: owning module/driver.
+ * @ops: callback operations for object of type %QCOM_TEE_OBJECT_TYPE_CB_OBJECT.
+ * @work: work for async operation on object.
+ *
+ * @work is currently only used for release object of %QCOM_TEE_OBJECT_TYPE_TEE type.
+ */
+struct qcom_tee_object {
+	const char *name;
+	struct kref refcount;
+
+	enum qcom_tee_object_type object_type;
+	union object_info {
+		/* QTEE object id if object_type is %QCOM_TEE_OBJECT_TYPE_TEE. */
+		unsigned long qtee_id;
+	} info;
+
+	struct module *owner;
+	struct qcom_tee_object_operations *ops;
+	struct work_struct work;
+};
+
+/* Static instances of qcom_tee_object objects. */
+#define NULL_QCOM_TEE_OBJECT ((struct qcom_tee_object *)(0))
+extern struct qcom_tee_object qcom_tee_object_root;
+#define ROOT_QCOM_TEE_OBJECT (&qcom_tee_object_root)
+
+static inline enum qcom_tee_object_type typeof_qcom_tee_object(struct qcom_tee_object *object)
+{
+	if (object == NULL_QCOM_TEE_OBJECT)
+		return QCOM_TEE_OBJECT_TYPE_NULL;
+	return object->object_type;
+}
+
+static inline const char *qcom_tee_object_name(struct qcom_tee_object *object)
+{
+	if (object == NULL_QCOM_TEE_OBJECT)
+		return "null";
+
+	if (!object->name)
+		return "no-name";
+	return object->name;
+}
+
+/**
+ * __qcom_tee_object_user_init() - Initialize an object for user.
+ * @object: object to initialize.
+ * @object_type: type of object as &enum qcom_tee_object_type.
+ * @ops: instance of callbacks.
+ * @owner: owning module/driver.
+ * @fmt: name assigned to the object.
+ *
+ * Return: On success return 0 or <0 on failure.
+ */
+int __qcom_tee_object_user_init(struct qcom_tee_object *object, enum qcom_tee_object_type ot,
+				struct qcom_tee_object_operations *ops, struct module *owner,
+				const char *fmt, ...);
+#define qcom_tee_object_user_init(obj, ot, ops, fmt, ...) \
+	__qcom_tee_object_user_init((obj), (ot), (ops), THIS_MODULE, (fmt), __VA_ARGS__)
+
+/* Object release is RCU protected. */
+int qcom_tee_object_get(struct qcom_tee_object *object);
+void qcom_tee_object_put(struct qcom_tee_object *object);
+
+#define qcom_tee_arg_for_each(i, args) \
+	for (i = 0; args[i].type != QCOM_TEE_ARG_TYPE_INV; i++)
+
+/* Next argument of type @type after index @i. */
+int qcom_tee_next_arg_type(struct qcom_tee_arg *u, int i, enum qcom_tee_arg_type type);
+
+/* Iterate over argument of given type. */
+#define qcom_tee_arg_for_each_type(i, args, at)			\
+	for (i = 0, i = qcom_tee_next_arg_type(args, i, at);	\
+		args[i].type != QCOM_TEE_ARG_TYPE_INV;		\
+		i++, i = qcom_tee_next_arg_type(args, i, at))
+
+#define qcom_tee_arg_for_each_input_buffer(i, args)  \
+	qcom_tee_arg_for_each_type(i, args, QCOM_TEE_ARG_TYPE_IB)
+#define qcom_tee_arg_for_each_output_buffer(i, args) \
+	qcom_tee_arg_for_each_type(i, args, QCOM_TEE_ARG_TYPE_OB)
+#define qcom_tee_arg_for_each_input_object(i, args)  \
+	qcom_tee_arg_for_each_type(i, args, QCOM_TEE_ARG_TYPE_IO)
+#define qcom_tee_arg_for_each_output_object(i, args) \
+	qcom_tee_arg_for_each_type(i, args, QCOM_TEE_ARG_TYPE_OO)
+
+#endif /* __QCOM_TEE_H */

-- 
2.34.1


