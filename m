Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA05D1A724B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2020 06:10:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405114AbgDNEJ7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Apr 2020 00:09:59 -0400
Received: from m17618.mail.qiye.163.com ([59.111.176.18]:10729 "EHLO
        m17618.mail.qiye.163.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405082AbgDNEJ7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Apr 2020 00:09:59 -0400
X-Greylist: delayed 560 seconds by postgrey-1.27 at vger.kernel.org; Tue, 14 Apr 2020 00:09:54 EDT
Received: from ubuntu.localdomain (unknown [58.251.74.227])
        by m17618.mail.qiye.163.com (Hmail) with ESMTPA id A27DC4E2094;
        Tue, 14 Apr 2020 12:00:29 +0800 (CST)
From:   Wang Wenhu <wenhu.wang@vivo.com>
To:     gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org
Cc:     rdunlap@infradead.org, kernel@vivo.com, agross@kernel.org,
        bjorn.andersson@linaro.org, ohad@wizery.com,
        linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Wang Wenhu <wenhu.wang@vivo.com>
Subject: [PATCH v3,2/3] driver: rpmon: qmi message version 01
Date:   Mon, 13 Apr 2020 20:59:48 -0700
Message-Id: <20200414035949.107225-3-wenhu.wang@vivo.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200414035949.107225-1-wenhu.wang@vivo.com>
References: <20200412112405.24116-1-wenhu.wang@vivo.com>
 <20200414035949.107225-1-wenhu.wang@vivo.com>
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZSVVCTEhCQkJCTExKSkpDSVlXWShZQU
        hPN1dZLVlBSVdZCQ4XHghZQVk1NCk2OjckKS43PlkG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Nww6SDo4Cjg6Dgo6LT0yPk0J
        NRNPCwxVSlVKTkNNQ0hNQ0hISkNDVTMWGhIXVQweFRMOVQwaFRw7DRINFFUYFBZFWVdZEgtZQVlO
        Q1VJTkpVTE9VSUlMWVdZCAFZQUpITUlNNwY+
X-HM-Tid: 0a7176d877399376kuwsa27dc4e2094
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Implements a RPMON_QMI message set for connection checking service.
RPMON_QMI defines its message types modularly. Each rpmon service
binds to a message set and introduced as a module. This version 1.0
message set could be used for connection checking of remote processors.

RPMON_QMI messages depend on QCOM_QMI_HELPERS and should be updated
together with QMI related modules, and if so, RPMON_QMI_MAG_V2 would
be introduced as a new module, in parallel with RPMON_QMI_MAG_V1.

Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>
Cc: linux-remoteproc@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org
Signed-off-by: Wang Wenhu <wenhu.wang@vivo.com>
---
Changes since v1:
 - Addressed review comments from Randy
Changes since v2:
 - Use micros for tlv_type fields, and another patch would be helpful:
   * [PATCH] soc: qmi: move tlv-micros to header file
   * Link: https://lore.kernel.org/linux-arm-msm/20200413035758.60238-1-wenhu.wang@vivo.com/
 - Added Cc list
---
 drivers/rpmon/Kconfig            |  13 ++
 drivers/rpmon/Makefile           |   1 +
 drivers/rpmon/rpmon_qmi.h        |  76 +++++++++
 drivers/rpmon/rpmon_qmi_msg_v1.c | 258 +++++++++++++++++++++++++++++++
 4 files changed, 348 insertions(+)
 create mode 100644 drivers/rpmon/rpmon_qmi.h
 create mode 100644 drivers/rpmon/rpmon_qmi_msg_v1.c

diff --git a/drivers/rpmon/Kconfig b/drivers/rpmon/Kconfig
index ad0e6d6561ca..0b80236ad186 100644
--- a/drivers/rpmon/Kconfig
+++ b/drivers/rpmon/Kconfig
@@ -23,4 +23,17 @@ config RPMON
 	  Currently RPMON_QMI is available which uses QMI infrastructures
 	  on Qualcomm SoC Platforms.
 
+config RPMON_QMI_MSG_V1
+	tristate "RPMON QMI Message Version 1.0"
+	depends on RPMON
+	depends on QCOM_QMI_HELPERS
+	help
+	  Implements a RPMON_QMI message set for a certain rpmon service.
+	  RPMON_QMI defines its message types modularly. Each rpmon service
+	  binds to a message set and introduced as a module. This version 1.0
+	  message set could be used for connection checking of remote processors.
+
+	  RPMON_QMI messages depend on QCOM_QMI_HELPERS and should be updated
+	  together with QMI related modules.
+
 endmenu
diff --git a/drivers/rpmon/Makefile b/drivers/rpmon/Makefile
index b0f0ec4ecc30..25f468a73a20 100644
--- a/drivers/rpmon/Makefile
+++ b/drivers/rpmon/Makefile
@@ -1 +1,2 @@
 obj-$(CONFIG_RPMON) += rpmon.o
+obj-$(CONFIG_RPMON_QMI_MSG_V1)	+= rpmon_qmi_msg_v1.o
diff --git a/drivers/rpmon/rpmon_qmi.h b/drivers/rpmon/rpmon_qmi.h
new file mode 100644
index 000000000000..191405140a5c
--- /dev/null
+++ b/drivers/rpmon/rpmon_qmi.h
@@ -0,0 +1,76 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2020 Vivo Communication Technology Co. Ltd.
+ * Copyright (C) 2020 Wang Wenhu <wenhu.wang@vivo.com>
+ * All rights reserved.
+ */
+
+#ifndef RPMON_QMI_INTERFACE_H
+#define RPMON_QMI_INTERFACE_H
+
+#define RP_NAME_LEN 255
+#define RPQMI_BUF_SIZE	4096
+
+enum rpmon_exec_result {
+	RPMON_EXEC_SUCCESS = 0,
+	RPMON_EXEC_FAILURE = 1,
+};
+
+struct rpmon_register_req {
+	uint8_t name_valid;
+	char name[RP_NAME_LEN + 1];
+	uint8_t timeout_valid;
+	u32 timeout;
+};
+
+struct rpmon_conn_indication {
+	char placeholder;
+};
+
+struct rpmon_conn_check_resp {
+	uint8_t result_valid;
+	struct qmi_response_type_v01 result;
+};
+
+struct rpmon_response {
+	struct qmi_response_type_v01 resp;
+};
+
+struct rpmon_qmi_device {
+	struct list_head	list;
+	struct sockaddr_qrtr	addr;
+	u32			timeout;
+	u32			flag;
+	struct ratelimit_state	ratelimit;
+
+	atomic_t		checks;
+	atomic_t		reports;
+
+	struct rpmon_info *info;
+	struct rpmon_qmi  *rqmi;
+};
+
+struct rpmon_qmi {
+	struct rpmon_info		*info;
+	struct qmi_handle		qmi;
+	struct qmi_service		*svc;
+	struct qmi_ops			*ops;
+	struct qmi_msg_handler		*handlers;
+	int (*sendmsg)(const struct rpmon_qmi_device *rdev,
+			const void *data,
+			u32 len);
+};
+
+/* rpqmi message types currently supported. */
+enum rpmon_qmi_msg_type {
+	RPQMI_MSG_REGISTER = 0,
+	RPQMI_MSG_CONNCHK_RESP,
+	RPQMI_MSG_MAX,
+};
+
+int rpmon_qmi_handle_init(struct rpmon_qmi *rqmi,
+		void (*cb)(enum rpmon_qmi_msg_type type,
+			struct sockaddr_qrtr *sq,
+			const void *msg));
+
+#endif /* RPMON_QMI_INTERFACE_H */
diff --git a/drivers/rpmon/rpmon_qmi_msg_v1.c b/drivers/rpmon/rpmon_qmi_msg_v1.c
new file mode 100644
index 000000000000..7e786d0c245a
--- /dev/null
+++ b/drivers/rpmon/rpmon_qmi_msg_v1.c
@@ -0,0 +1,258 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2020 Vivo Communication Technology Co. Ltd.
+ * Copyright (C) 2020 Wang Wenhu <wenhu.wang@vivo.com>
+ * All rights reserved.
+ *
+ * RPMON: An implementation of remote processor monitor framework
+ * for modern SoCs that typically have heterogeneous remote processor
+ * devices in asymmetric multiprocessing configurations. It is
+ * implemented with chardev and sysfs class, which act as interfaces
+ * to communicate with user level. It supports different communication
+ * interfaces added modularly to communicate with remote processors.
+ * Currently QMI implementation, named RPMON_QMI, is available.
+ *
+ * RPMON could be used to detect the stabilities of remote processors,
+ * collect any kinds of information you are interested in, take
+ * actions like connection status check, and so on. Enhancements
+ * can be made upon current implementation.
+ *
+ * RPMON_QMI_MSG_V1 is specifically implemented as a set of messages
+ * for RPMON_QMI to support connection checking of remote processors.
+ */
+
+#include <linux/soc/qcom/qmi.h>
+#include <linux/rpmon.h>
+#include "rpmon_qmi.h"
+
+#define RPMON_SVC_ID_V01	0x3c
+#define RPMON_SVC_VER_V01	0x01
+#define RPMON_SVC_INS_V01	0x00
+
+#define RPMON_CONN_REQ_MSG_ID_VO1		0x20
+#define RPMON_CONN_RESP_MSG_ID_VO1		0x20
+#define RPMON_CONN_IND_MSG_ID_V01		0x21
+#define RPMON_EXEC_COMP_REQ_MSG_ID_V01		0x22
+#define RPMON_EXEC_COMP_RESP_MSG_ID_V01		0x22
+
+#define QMI_COMMON_TLV_TYPE_1ST		(QMI_COMMON_TLV_TYPE + 1)
+
+#define QMI_OPTIONAL_TLV_TYPE_START	0x10
+#define QMI_OPTIONAL_TLV_TYPE_1ST	QMI_OPTIONAL_TLV_TYPE_START
+#define QMI_OPTIONAL_TLV_TYPE_2ND	(QMI_OPTIONAL_TLV_TYPE_START + 0x01)
+#define QMI_OPTIONAL_TLV_TYPE_END	QMI_OPTIONAL_TLV_TYPE_2ND
+
+#define TLV_TYPE_REG_REQ_NAME		QMI_OPTIONAL_TLV_TYPE_1ST
+#define TLV_TYPE_REG_REQ_TIMEOUT	QMI_OPTIONAL_TLV_TYPE_2ND
+
+#define TLV_TYPE_CONN_CHK_RESP_RESULT	QMI_OPTIONAL_TLV_TYPE_1ST
+
+#define QMI_TLV_LEN_SIZE sizeof(u16)
+#define QMI_TLV_TYPE_SIZE sizeof(u8)
+#define QMI_TLV_TL_SIZE (QMI_TLV_LEN_SIZE + QMI_TLV_TYPE_SIZE)
+
+static struct qmi_elem_info register_req_v01_ei[] = {
+	{
+		.data_type      = QMI_OPT_FLAG,
+		.elem_len       = 1,
+		.elem_size      = sizeof(uint8_t),
+		.array_type     = NO_ARRAY,
+		.tlv_type       = 0x10,
+		.offset         = offsetof(struct rpmon_register_req,
+					   name_valid),
+	},
+	{
+		.data_type      = QMI_STRING,
+		.elem_len       = RP_NAME_LEN,
+		.elem_size      = sizeof(char),
+		.array_type     = NO_ARRAY,
+		.tlv_type       = TLV_TYPE_REG_REQ_NAME,
+		.offset         = offsetof(struct rpmon_register_req,
+					   name),
+	},
+	{
+		.data_type      = QMI_OPT_FLAG,
+		.elem_len       = 1,
+		.elem_size      = sizeof(uint8_t),
+		.array_type     = NO_ARRAY,
+		.tlv_type       = TLV_TYPE_REG_REQ_TIMEOUT,
+		.offset         = offsetof(struct rpmon_register_req,
+					   timeout_valid),
+	},
+	{
+		.data_type      = QMI_UNSIGNED_4_BYTE,
+		.elem_len       = 1,
+		.elem_size      = sizeof(u32),
+		.array_type     = NO_ARRAY,
+		.tlv_type       = TLV_TYPE_REG_REQ_TIMEOUT,
+		.offset         = offsetof(struct rpmon_register_req,
+					   timeout),
+	},
+	{
+		.data_type      = QMI_EOTI,
+		.array_type     = NO_ARRAY,
+		.tlv_type       = QMI_COMMON_TLV_TYPE,
+	},
+};
+
+static struct qmi_elem_info conn_check_resp_v01_ei[] = {
+	{
+		.data_type      = QMI_OPT_FLAG,
+		.elem_len       = 1,
+		.elem_size      = sizeof(uint8_t),
+		.array_type     = NO_ARRAY,
+		.tlv_type       = TLV_TYPE_CONN_CHK_RESP_RESULT,
+		.offset         = offsetof(struct rpmon_conn_check_resp,
+					   result_valid),
+	},
+	{
+		.data_type      = QMI_SIGNED_4_BYTE_ENUM,
+		.elem_len       = 1,
+		.elem_size      = sizeof(enum rpmon_exec_result),
+		.array_type     = NO_ARRAY,
+		.tlv_type       = TLV_TYPE_CONN_CHK_RESP_RESULT,
+		.offset         = offsetof(struct rpmon_conn_check_resp,
+					   result),
+	},
+	{
+		.data_type      = QMI_EOTI,
+		.array_type     = NO_ARRAY,
+		.tlv_type       = QMI_COMMON_TLV_TYPE,
+	},
+};
+
+static struct qmi_elem_info conn_indication_v01_ei[] = {
+	{
+		.data_type      = QMI_EOTI,
+		.array_type     = NO_ARRAY,
+		.tlv_type       = QMI_COMMON_TLV_TYPE,
+	},
+};
+
+static struct qmi_elem_info response_v01_ei[] = {
+	{
+		.data_type      = QMI_STRUCT,
+		.elem_len       = 1,
+		.elem_size      = sizeof(struct qmi_response_type_v01),
+		.array_type     = NO_ARRAY,
+		.tlv_type       = QMI_COMMON_TLV_TYPE_1ST,
+		.offset         = offsetof(struct rpmon_response, resp),
+		.ei_array       = qmi_response_type_v01_ei,
+	},
+	{
+		.data_type      = QMI_EOTI,
+		.array_type     = NO_ARRAY,
+		.tlv_type       = QMI_COMMON_TLV_TYPE,
+	},
+};
+
+static void (*msg_callback)(enum rpmon_qmi_msg_type type,
+			    struct sockaddr_qrtr *sq,
+			    const void *msg);
+
+static int rpmon_qmi_sendmsg_v1(const struct rpmon_qmi_device *rdev,
+				const void *data,
+				u32 len)
+{
+	int ret;
+	struct sockaddr_qrtr sq;
+
+	memcpy(&sq, &rdev->addr, sizeof(sq));
+
+	ret = qmi_send_indication(&rdev->rqmi->qmi, &sq,
+				  RPMON_CONN_IND_MSG_ID_V01,
+				  QMI_TLV_TL_SIZE,
+				  conn_indication_v01_ei, NULL);
+	if (ret < 0)
+		pr_err("Error %d send indication failed", ret);
+
+	return ret;
+}
+
+static void rpmon_qmi_recv_register_req_v1(struct qmi_handle *qmi,
+			struct sockaddr_qrtr *sq,
+			struct qmi_txn *txn,
+			const void *msg)
+{
+	struct rpmon_response resp;
+	int ret;
+
+	resp.resp.result = QMI_RESULT_SUCCESS_V01;
+	resp.resp.error = QMI_ERR_NONE_V01;
+	ret = qmi_send_response(qmi, sq, txn,
+				RPMON_CONN_RESP_MSG_ID_VO1,
+				sizeof(resp.resp) + QMI_TLV_TL_SIZE * 2,
+				response_v01_ei,
+				&resp.resp);
+	if (ret < 0)
+		pr_err("Error %d send response failed", ret);
+
+	if (msg_callback)
+		msg_callback(RPQMI_MSG_REGISTER, sq, msg);
+}
+
+void rpmon_qmi_recv_conn_check_resp_v1(struct qmi_handle *qmi,
+	struct sockaddr_qrtr *sq,
+	struct qmi_txn *txn,
+	const void *msg)
+{
+	struct rpmon_response resp;
+	int ret;
+
+	resp.resp.result = QMI_RESULT_SUCCESS_V01;
+	resp.resp.error = QMI_ERR_NONE_V01;
+	ret = qmi_send_response(qmi, sq, txn,
+				RPMON_EXEC_COMP_REQ_MSG_ID_V01,
+				sizeof(resp.resp) + QMI_TLV_TL_SIZE * 2,
+				response_v01_ei,
+				&resp.resp);
+	if (ret < 0)
+		pr_err("Error %d send response failed", ret);
+
+	if (msg_callback)
+		msg_callback(RPQMI_MSG_CONNCHK_RESP, sq, msg);
+}
+
+static struct qmi_msg_handler rpmon_qmi_msg_handlers_v01[] = {
+	{
+		.type = QMI_REQUEST,
+		.msg_id = RPMON_CONN_REQ_MSG_ID_VO1,
+		.ei = register_req_v01_ei,
+		.decoded_size = sizeof(struct rpmon_register_req),
+		.fn = rpmon_qmi_recv_register_req_v1,
+	},
+	{
+		.type = QMI_REQUEST,
+		.msg_id = RPMON_EXEC_COMP_REQ_MSG_ID_V01,
+		.ei = conn_check_resp_v01_ei,
+		.decoded_size = sizeof(struct rpmon_conn_check_resp),
+		.fn = rpmon_qmi_recv_conn_check_resp_v1,
+	},
+};
+
+static struct qmi_service rpmon_qmi_svc = {
+	.service = RPMON_SVC_ID_V01,
+	.version = RPMON_SVC_VER_V01,
+	.instance = RPMON_SVC_INS_V01,
+};
+
+int rpmon_qmi_handle_init(struct rpmon_qmi *rqmi,
+		void (*cb)(enum rpmon_qmi_msg_type type,
+			   struct sockaddr_qrtr *sq,
+			   const void *msg))
+{
+	rqmi->svc = &rpmon_qmi_svc;
+	rqmi->handlers = rpmon_qmi_msg_handlers_v01;
+	rqmi->sendmsg = rpmon_qmi_sendmsg_v1;
+
+	if (cb)
+		msg_callback = cb;
+	else
+		return -EINVAL;
+
+	return 0;
+}
+EXPORT_SYMBOL(rpmon_qmi_handle_init);
+
+MODULE_AUTHOR("Wang Wenhu <wenhu.wang@vivo.com>");
+MODULE_LICENSE("GPL v2");
-- 
2.17.1

