Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C01BF34232B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Mar 2021 18:25:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229990AbhCSRYx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 Mar 2021 13:24:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229949AbhCSRY1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 Mar 2021 13:24:27 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0207CC06175F;
        Fri, 19 Mar 2021 10:24:27 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id y1so12889085ljm.10;
        Fri, 19 Mar 2021 10:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=knT3sgBKpC8m3bSjdXMf/0yGj3b2IDwpY4JDOcyh67o=;
        b=AI0ZWp/c2lO3DVMWzejxsRC0nWr9fXwc6jmbf82Hw0pqtDjogdY35rTWLhIlOT9Yfp
         o/yeSeFgh3YJJUsolhyLmAhmJ/EZuBaAEFKccYJdayiszA3KCL8az6TRRXzLAIGOS86k
         tL8tceyc712s/DcESU291ehP1lzZIW6UNnevjyneF4Ubu5lt8aDhwZkyBTIXqxzP7sF6
         Ow7Tb6A6oDKGiCqM8GeKn/A+wSZWMYDZJcbWLk3PZuS7pdO5VYAJPH97R2utM5cO6qhJ
         r/Dol/qgWQrRMnHjWPV1fiXUcRxTlwJglYW8H6qfGmU3AZoQFOlA0f7N9UU5jxAHpHPk
         /w5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=knT3sgBKpC8m3bSjdXMf/0yGj3b2IDwpY4JDOcyh67o=;
        b=aNm/nt12XmVqcvXHJnC0OB22oFzi1GXHWnGyj+QlasjzDIj1lUWiN33Oi8O2GFGGew
         n+A0tV9FNIPwp1WsLfzqDJ2RnVrBBs3EnhxKzrcvZlX46m3Qvb1CRVye2LfQZ5Nw/FR3
         kRd02KwdITysvcJkRJXOOaeLJ0IWTGLYzJgD8r/DeoPKecSj8CMAlufDwCWk+d1Rj6SW
         uhFECdAZssqpgY3qbSsJAgI1B5zW8Gt0f4vaX2r54OSy/Kc+cupvN45SVtM0pAjqTio2
         8bU5c2ryp5vQdZKpN/S2MVAuAabPQZhuP/2V7SlEJxE/8nU49QqyxiRhBc+0c1nkLK3n
         Ce/Q==
X-Gm-Message-State: AOAM531HjJmGwPlWSVIVShyPL0rHP5BiYYFI/Wza6Gqm+gPT6NJJ2NGG
        lIFAksPOUSXJbJBDgLI7Gow=
X-Google-Smtp-Source: ABdhPJwNI/sEqAQIyYLgMiRaYvGqqcO038O/hSR66sKnpxUBSEeg6FDFyLS5ZucdoW1O6AIajbCkGA==
X-Received: by 2002:a2e:144c:: with SMTP id 12mr1524905lju.113.1616174665265;
        Fri, 19 Mar 2021 10:24:25 -0700 (PDT)
Received: from localhost.localdomain ([2a01:540:2421:e100:198e:5123:d77b:1e2e])
        by smtp.gmail.com with ESMTPSA id y17sm693237lfb.132.2021.03.19.10.24.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Mar 2021 10:24:24 -0700 (PDT)
From:   nikitos.tr@gmail.com
To:     agross@kernel.org, bjorn.andersson@linaro.org
Cc:     robh+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nikita Travkin <nikitos.tr@gmail.com>
Subject: [PATCH 2/2] soc: qcom: Add Qualcomm Memshare QMI service
Date:   Fri, 19 Mar 2021 22:23:21 +0500
Message-Id: <20210319172321.22248-3-nikitos.tr@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210319172321.22248-1-nikitos.tr@gmail.com>
References: <20210319172321.22248-1-nikitos.tr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Nikita Travkin <nikitos.tr@gmail.com>

This QMI service provides memory region for remote processors (like
modem) on request. It is known to be used in GPS service in modem
firmware for some (most) of msm8916 devices.

This commit implements "guaranteed allocation" of memory using
reserved-memory regions because gps service crashes on some devices
unless specific address was provided.

Signed-off-by: Nikita Travkin <nikitos.tr@gmail.com>
---
 drivers/soc/qcom/Kconfig            |   8 +
 drivers/soc/qcom/Makefile           |   2 +
 drivers/soc/qcom/memshare.c         | 501 ++++++++++++++++++++++++++++
 drivers/soc/qcom/memshare_qmi_msg.c | 370 ++++++++++++++++++++
 drivers/soc/qcom/memshare_qmi_msg.h | 228 +++++++++++++
 5 files changed, 1109 insertions(+)
 create mode 100644 drivers/soc/qcom/memshare.c
 create mode 100644 drivers/soc/qcom/memshare_qmi_msg.c
 create mode 100644 drivers/soc/qcom/memshare_qmi_msg.h

diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index 79b568f82a1c..8575cd6fe0ef 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -209,4 +209,12 @@ config QCOM_APR
 	  application processor and QDSP6. APR is
 	  used by audio driver to configure QDSP6
 	  ASM, ADM and AFE modules.
+
+config QCOM_MEMSHARE_QMI_SERVICE
+       select QCOM_QMI_HELPERS
+       tristate "Qualcomm QMI Shared Memory Service (MEMSHARE)"
+       help
+	  This service provides additional memory regions on request from
+	  remote processors. On some platforms it is used for GPS by
+	  the location service in the modem subsystem.
 endmenu
diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
index ad675a6593d0..5a986c2e1770 100644
--- a/drivers/soc/qcom/Makefile
+++ b/drivers/soc/qcom/Makefile
@@ -26,3 +26,5 @@ obj-$(CONFIG_QCOM_LLCC) += llcc-qcom.o
 obj-$(CONFIG_QCOM_RPMHPD) += rpmhpd.o
 obj-$(CONFIG_QCOM_RPMPD) += rpmpd.o
 obj-$(CONFIG_QCOM_KRYO_L2_ACCESSORS) +=	kryo-l2-accessors.o
+obj-$(CONFIG_QCOM_MEMSHARE_QMI_SERVICE) += qcom_memshare.o
+qcom_memshare-y := memshare.o memshare_qmi_msg.o
diff --git a/drivers/soc/qcom/memshare.c b/drivers/soc/qcom/memshare.c
new file mode 100644
index 000000000000..a19858b91276
--- /dev/null
+++ b/drivers/soc/qcom/memshare.c
@@ -0,0 +1,501 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/kernel.h>
+#include <linux/types.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/device.h>
+#include <linux/platform_device.h>
+#include <linux/net.h>
+#include <linux/soc/qcom/qmi.h>
+
+#include "memshare_qmi_msg.h"
+
+#define MEMSHARE_MAX_CLIENTS 10
+
+struct memshare_client {
+	u32 id;
+	u32 proc_id;
+	u32 qrtr_node;
+	u32 size;
+	phys_addr_t phy_addr;
+};
+
+struct memshare {
+	struct device *dev;
+	struct qmi_handle qmi;
+	unsigned int client_cnt;
+	struct memshare_client *legacy_client;
+	struct memshare_client *clients[MEMSHARE_MAX_CLIENTS];
+};
+
+static struct memshare_client *memshare_get_client(struct memshare *share, u32 id, u32 proc_id)
+{
+	int i;
+
+	for (i = 0; i < share->client_cnt; i++)
+		if (share->clients[i]->id == id && share->clients[i]->proc_id == proc_id)
+			return share->clients[i];
+
+	return NULL;
+}
+
+static void memshare_alloc_req_handler(struct qmi_handle *qmi, struct sockaddr_qrtr *sq,
+				       struct qmi_txn *txn, const void *data)
+{
+	struct memshare *share = container_of(qmi, struct memshare, qmi);
+	const struct mem_alloc_req_msg_v01 *req = data;
+	struct mem_alloc_resp_msg_v01 resp = { .resp = QMI_RESULT_FAILURE_V01 };
+	struct memshare_client *client = share->legacy_client;
+	int ret;
+
+	dev_dbg(share->dev,
+		"alloc_req: num_bytes=%d, block_alignment_valid=%d, block_alignment=%d, node=%d\n",
+		req->num_bytes,
+		req->block_alignment_valid,
+		req->block_alignment,
+		sq->sq_node
+	);
+
+	if (!client) {
+		dev_err(share->dev, "Unknown request from legacy client (size=%d, node=%d)\n",
+			req->num_bytes, sq->sq_node);
+		goto send_response;
+	}
+
+	if (sq->sq_node != client->qrtr_node) {
+		dev_err(share->dev, "Request from node %d but %d expected\n",
+			sq->sq_node, client->qrtr_node);
+		goto send_response;
+	}
+
+	if (client->size && client->size != req->num_bytes) {
+		dev_err(share->dev, "Got a request with wrong size (size=%d)\n",
+			req->num_bytes);
+		goto send_response;
+	}
+
+	if (req->block_alignment_valid)
+		if (client->phy_addr % MEM_BLOCK_ALIGN_TO_BYTES(req->block_alignment) != 0)
+			dev_warn(share->dev, "Memory region is not aligned by %d bytes\n",
+				 MEM_BLOCK_ALIGN_TO_BYTES(req->block_alignment));
+
+	if (!client->phy_addr) {
+		dev_info(share->dev,
+			 "Client sent a request but no memory is configured (size=%d, node=%d)\n",
+			 req->num_bytes, sq->sq_node);
+		goto send_response;
+	}
+
+	resp.resp = QMI_RESULT_SUCCESS_V01;
+	resp.handle_valid = true;
+	resp.handle = client->phy_addr;
+	resp.num_bytes_valid = true;
+	resp.num_bytes = client->size;
+
+send_response:
+	ret = qmi_send_response(qmi, sq, txn, MEM_ALLOC_MSG_V01, MEM_MAX_MSG_LEN_V01,
+				mem_alloc_resp_msg_data_v01_ei, &resp);
+	if (ret < 0)
+		dev_err(share->dev, "Failed to send response: %d\n", ret);
+}
+
+static void memshare_free_req_handler(struct qmi_handle *qmi, struct sockaddr_qrtr *sq,
+				      struct qmi_txn *txn, const void *data)
+{
+	struct memshare *share = container_of(qmi, struct memshare, qmi);
+	const struct mem_free_req_msg_v01 *req = data;
+	struct mem_free_resp_msg_v01 resp = { .resp = QMI_RESULT_FAILURE_V01 };
+	struct memshare_client *client = share->legacy_client;
+	int ret;
+
+	dev_dbg(share->dev, "free_req: node=%d\n", sq->sq_node);
+
+	if (!client) {
+		dev_err(share->dev, "Unknown request from legacy client\n");
+		goto send_response;
+	}
+
+	if (sq->sq_node != client->qrtr_node) {
+		dev_err(share->dev, "Request from node %d but %d expected\n",
+			sq->sq_node, client->qrtr_node);
+		goto send_response;
+	}
+
+	if (client->phy_addr != req->handle) {
+		dev_err(share->dev, "Got a request with wrong address\n");
+		goto send_response;
+	}
+
+	resp.resp = QMI_RESULT_SUCCESS_V01;
+
+send_response:
+	ret = qmi_send_response(qmi, sq, txn, MEM_FREE_MSG_V01, MEM_MAX_MSG_LEN_V01,
+				mem_free_resp_msg_data_v01_ei, &resp);
+	if (ret < 0)
+		dev_err(share->dev, "Failed to send response: %d\n", ret);
+}
+
+static void memshare_alloc_generic_req_handler(struct qmi_handle *qmi, struct sockaddr_qrtr *sq,
+					       struct qmi_txn *txn, const void *data)
+{
+	struct memshare *share = container_of(qmi, struct memshare, qmi);
+	const struct mem_alloc_generic_req_msg_v01 *req = data;
+	struct mem_alloc_generic_resp_msg_v01 *resp;
+	struct memshare_client *client;
+	int ret;
+
+	resp = kzalloc(sizeof(*resp), GFP_KERNEL);
+	if (!resp)
+		return;
+
+	resp->resp.result = QMI_RESULT_FAILURE_V01;
+	resp->resp.error = QMI_ERR_INTERNAL_V01;
+
+	dev_dbg(share->dev,
+		"alloc_generic_req: num_bytes=%d, client_id=%d, proc_id=%d, sequence_id=%d, "
+		"alloc_contiguous_valid=%d, alloc_contiguous=%d, block_alignment_valid=%d, "
+		"block_alignment=%d, node=%d\n",
+		req->num_bytes,
+		req->client_id,
+		req->proc_id,
+		req->sequence_id,
+		req->alloc_contiguous_valid,
+		req->alloc_contiguous,
+		req->block_alignment_valid,
+		req->block_alignment,
+		sq->sq_node
+	);
+
+	client = memshare_get_client(share, req->client_id, req->proc_id);
+	if (!client) {
+		dev_err(share->dev,
+			"Got a request from unknown client (id=%d, proc=%d, size=%d, node=%d)\n",
+			req->client_id, req->proc_id, req->num_bytes, sq->sq_node);
+		goto send_response;
+	}
+
+	if (sq->sq_node != client->qrtr_node) {
+		dev_err(share->dev, "Request from node %d but %d expected\n",
+			sq->sq_node, client->qrtr_node);
+		goto send_response;
+	}
+
+	if (!client->phy_addr) {
+		dev_info(share->dev,
+			 "Client sent a request but no memory is configured "
+			 "(id=%d, proc=%d, size=%d, node=%d)\n",
+			 req->client_id, req->proc_id, req->num_bytes, sq->sq_node);
+		goto send_response;
+	}
+
+	if (client->size != req->num_bytes) {
+		dev_err(share->dev,
+			"Got a request with wrong size (id=%d, proc=%d, size=%d)\n",
+			req->client_id, req->proc_id, req->num_bytes);
+		goto send_response;
+	}
+
+	if (req->block_alignment_valid)
+		if (client->phy_addr % MEM_BLOCK_ALIGN_TO_BYTES(req->block_alignment) != 0)
+			dev_warn(share->dev, "Memory region is not aligned by %d bytes\n",
+				 MEM_BLOCK_ALIGN_TO_BYTES(req->block_alignment));
+
+	resp->resp.result = QMI_RESULT_SUCCESS_V01;
+	resp->resp.error = QMI_ERR_NONE_V01;
+	resp->sequence_id_valid = true;
+	resp->sequence_id = req->sequence_id;
+	resp->dhms_mem_alloc_addr_info_valid = true;
+	resp->dhms_mem_alloc_addr_info_len = 1;
+	resp->dhms_mem_alloc_addr_info[0].phy_addr = client->phy_addr;
+	resp->dhms_mem_alloc_addr_info[0].num_bytes = client->size;
+
+send_response:
+	ret = qmi_send_response(qmi, sq, txn, MEM_ALLOC_GENERIC_MSG_V01, MEM_MAX_MSG_LEN_V01,
+				mem_alloc_generic_resp_msg_data_v01_ei, resp);
+	if (ret < 0)
+		dev_err(share->dev, "Failed to send response: %d\n", ret);
+
+	kfree(resp);
+}
+
+static void memshare_free_generic_req_handler(struct qmi_handle *qmi, struct sockaddr_qrtr *sq,
+					      struct qmi_txn *txn, const void *data)
+{
+	struct memshare *share = container_of(qmi, struct memshare, qmi);
+	const struct mem_free_generic_req_msg_v01 *req = data;
+	struct mem_free_generic_resp_msg_v01 resp = {
+		.resp.result = QMI_RESULT_FAILURE_V01,
+		.resp.error = QMI_ERR_INTERNAL_V01,
+	};
+	struct memshare_client *client;
+	int ret;
+
+	dev_dbg(share->dev,
+		"free_generic_req: dhms_mem_alloc_addr_info_len=%d, client_id_valid=%d, "
+		"client_id=%d, proc_id_valid=%d, proc_id=%d, node=%d\n",
+		req->dhms_mem_alloc_addr_info_len,
+		req->client_id_valid,
+		req->client_id,
+		req->proc_id_valid,
+		req->proc_id,
+		sq->sq_node
+	);
+
+	if (req->dhms_mem_alloc_addr_info_len != 1) {
+		dev_err(share->dev, "addr_info_len = %d is unexpected\n",
+			req->dhms_mem_alloc_addr_info_len);
+		goto send_response;
+	}
+
+	if (!req->client_id_valid || !req->proc_id_valid) {
+		dev_err(share->dev, "Got a request from unknown client\n");
+		goto send_response;
+	}
+
+	client = memshare_get_client(share, req->client_id, req->proc_id);
+	if (!client) {
+		dev_err(share->dev, "Got a request from unknown client (id=%d, proc=%d)\n",
+			req->client_id, req->proc_id);
+		goto send_response;
+	}
+
+	if (req->dhms_mem_alloc_addr_info[0].phy_addr != client->phy_addr) {
+		dev_err(share->dev, "Client sent invalid handle\n");
+		goto send_response;
+	}
+
+	if (sq->sq_node != client->qrtr_node) {
+		dev_err(share->dev, "Request from node %d but %d expected\n",
+			sq->sq_node, client->qrtr_node);
+		goto send_response;
+	}
+
+	resp.resp.result = QMI_RESULT_SUCCESS_V01;
+	resp.resp.error = QMI_ERR_NONE_V01;
+
+send_response:
+	ret = qmi_send_response(qmi, sq, txn, MEM_FREE_GENERIC_MSG_V01, MEM_MAX_MSG_LEN_V01,
+				mem_free_generic_resp_msg_data_v01_ei, &resp);
+	if (ret < 0)
+		dev_err(share->dev, "Failed to send response: %d\n", ret);
+}
+
+static void memshare_query_size_req_handler(struct qmi_handle *qmi, struct sockaddr_qrtr *sq,
+					    struct qmi_txn *txn, const void *data)
+{
+	struct memshare *share = container_of(qmi, struct memshare, qmi);
+	const struct mem_query_size_req_msg_v01 *req = data;
+	struct mem_query_size_rsp_msg_v01 resp = {
+		.resp.result = QMI_RESULT_FAILURE_V01,
+		.resp.error = QMI_ERR_INTERNAL_V01,
+	};
+	struct memshare_client *client;
+	int ret;
+
+	dev_dbg(share->dev,
+		"query_size_req: client_id=%d, proc_id_valid=%d, proc_id=%d, node=%d\n",
+		req->client_id,
+		req->proc_id_valid,
+		req->proc_id,
+		sq->sq_node
+	);
+
+	client = memshare_get_client(share, req->client_id, req->proc_id);
+	if (!client) {
+		dev_err(share->dev, "Got a request from unknown client (id=%d, proc=%d)\n",
+			req->client_id, req->proc_id);
+		goto send_response;
+	}
+
+	if (sq->sq_node != client->qrtr_node) {
+		dev_err(share->dev, "Request from node %d but %d expected\n",
+			sq->sq_node, client->qrtr_node);
+		goto send_response;
+	}
+
+	if (!client->phy_addr)
+		goto send_response;
+
+	resp.resp.result = QMI_RESULT_SUCCESS_V01;
+	resp.resp.error = QMI_ERR_NONE_V01;
+	resp.size_valid = true;
+	resp.size = client->size;
+
+send_response:
+	ret = qmi_send_response(qmi, sq, txn, MEM_QUERY_SIZE_MSG_V01, MEM_MAX_MSG_LEN_V01,
+				mem_query_size_resp_msg_data_v01_ei, &resp);
+	if (ret < 0)
+		dev_err(share->dev, "Failed to send response: %d\n", ret);
+}
+
+static struct qmi_msg_handler memshare_handlers[] = {
+	{
+		.type = QMI_REQUEST,
+		.msg_id = MEM_ALLOC_MSG_V01,
+		.ei = mem_alloc_req_msg_data_v01_ei,
+		.decoded_size = sizeof(struct mem_alloc_req_msg_v01),
+		.fn = memshare_alloc_req_handler,
+	},
+	{
+		.type = QMI_REQUEST,
+		.msg_id = MEM_FREE_MSG_V01,
+		.ei = mem_free_req_msg_data_v01_ei,
+		.decoded_size = sizeof(struct mem_free_req_msg_v01),
+		.fn = memshare_free_req_handler,
+	},
+	{
+		.type = QMI_REQUEST,
+		.msg_id = MEM_ALLOC_GENERIC_MSG_V01,
+		.ei = mem_alloc_generic_req_msg_data_v01_ei,
+		.decoded_size = sizeof(struct mem_alloc_generic_req_msg_v01),
+		.fn = memshare_alloc_generic_req_handler,
+	},
+	{
+		.type = QMI_REQUEST,
+		.msg_id = MEM_FREE_GENERIC_MSG_V01,
+		.ei = mem_free_generic_req_msg_data_v01_ei,
+		.decoded_size = sizeof(struct mem_free_generic_req_msg_v01),
+		.fn = memshare_free_generic_req_handler,
+	},
+	{
+		.type = QMI_REQUEST,
+		.msg_id = MEM_QUERY_SIZE_MSG_V01,
+		.ei = mem_query_size_req_msg_data_v01_ei,
+		.decoded_size = sizeof(struct mem_query_size_req_msg_v01),
+		.fn = memshare_query_size_req_handler,
+	},
+	{ /* sentinel */ }
+};
+
+static int memshare_probe_dt(struct memshare *share)
+{
+	struct device_node *np = share->dev->of_node;
+	struct device_node *proc_node = NULL, *client_node = NULL, *mem_node = NULL;
+	int ret = 0;
+	u32 proc_id, qrtr_node;
+	struct memshare_client *client;
+	phandle legacy_client = 0;
+	struct resource reserved_memory;
+
+	ret = of_property_read_u32(np, "qcom,legacy-client", &legacy_client);
+	if (ret && ret != -EINVAL)
+		return ret;
+
+	for_each_available_child_of_node(np, proc_node) {
+		ret = of_property_read_u32(proc_node, "reg", &proc_id);
+		if (ret)
+			goto error;
+
+		ret = of_property_read_u32(proc_node, "qcom,qrtr-node", &qrtr_node);
+		if (ret)
+			goto error;
+
+		for_each_available_child_of_node(proc_node, client_node) {
+			if (share->client_cnt >= MEMSHARE_MAX_CLIENTS) {
+				ret = -EINVAL;
+				goto error;
+			}
+
+			client = devm_kzalloc(share->dev, sizeof(*client), GFP_KERNEL);
+			if (!client) {
+				ret = -ENOMEM;
+				goto error;
+			}
+
+			ret = of_property_read_u32(client_node, "reg", &client->id);
+			if (ret)
+				goto error;
+
+			client->proc_id = proc_id;
+			client->qrtr_node = qrtr_node;
+
+			mem_node = of_parse_phandle(client_node, "memory-region", 0);
+			if (mem_node) {
+				ret = of_address_to_resource(mem_node, 0, &reserved_memory);
+				of_node_put(mem_node);
+				if (ret)
+					goto error;
+
+				client->phy_addr = reserved_memory.start;
+				client->size = resource_size(&reserved_memory);
+			}
+
+			if (client_node->phandle == legacy_client)
+				share->legacy_client = client;
+
+			share->clients[share->client_cnt] = client;
+			share->client_cnt++;
+		}
+	}
+
+	return 0;
+
+error:
+	of_node_put(client_node);
+	of_node_put(proc_node);
+	return ret;
+}
+
+static int memshare_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct memshare *share;
+	int ret;
+
+	share = devm_kzalloc(&pdev->dev, sizeof(*share), GFP_KERNEL);
+	if (!share)
+		return -ENOMEM;
+
+	share->dev = dev;
+	dev_set_drvdata(&pdev->dev, share);
+
+	ret = qmi_handle_init(&share->qmi, MEM_MAX_MSG_LEN_V01, NULL, memshare_handlers);
+	if (ret < 0)
+		return ret;
+
+	ret = memshare_probe_dt(share);
+	if (ret < 0)
+		goto error;
+
+	ret = qmi_add_server(&share->qmi, MEM_SERVICE_SVC_ID,
+			     MEM_SERVICE_VER, MEM_SERVICE_INS_ID);
+	if (ret < 0)
+		goto error;
+
+	return 0;
+
+error:
+	qmi_handle_release(&share->qmi);
+	return ret;
+}
+
+static int memshare_remove(struct platform_device *pdev)
+{
+	struct memshare *share = dev_get_drvdata(&pdev->dev);
+
+	qmi_handle_release(&share->qmi);
+
+	return 0;
+}
+
+static const struct of_device_id memshare_of_match[] = {
+	{ .compatible = "qcom,memshare", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, memshare_of_match);
+
+static struct platform_driver memshare_driver = {
+	.probe = memshare_probe,
+	.remove = memshare_remove,
+	.driver = {
+		.name = "qcom-memshare",
+		.of_match_table = of_match_ptr(memshare_of_match),
+	},
+};
+module_platform_driver(memshare_driver);
+
+MODULE_DESCRIPTION("Qualcomm Memory Share Service");
+MODULE_AUTHOR("Nikita Travkin <nikitos.tr@gmail.com>");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/soc/qcom/memshare_qmi_msg.c b/drivers/soc/qcom/memshare_qmi_msg.c
new file mode 100644
index 000000000000..0cbccaaa7994
--- /dev/null
+++ b/drivers/soc/qcom/memshare_qmi_msg.c
@@ -0,0 +1,370 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2013-2015, 2017-2018, The Linux Foundation. All rights reserved.
+
+#include <linux/stddef.h>
+#include <linux/soc/qcom/qmi.h>
+
+#include "memshare_qmi_msg.h"
+
+struct qmi_elem_info mem_alloc_req_msg_data_v01_ei[] = {
+	{
+		.data_type      = QMI_UNSIGNED_4_BYTE,
+		.elem_len       = 1,
+		.elem_size      = sizeof_field(struct mem_alloc_req_msg_v01, num_bytes),
+		.tlv_type       = 0x01,
+		.offset         = offsetof(struct mem_alloc_req_msg_v01, num_bytes),
+	},
+	{
+		.data_type      = QMI_OPT_FLAG,
+		.elem_len       = 1,
+		.elem_size      = sizeof_field(struct mem_alloc_req_msg_v01, block_alignment_valid),
+		.tlv_type       = 0x10,
+		.offset         = offsetof(struct mem_alloc_req_msg_v01, block_alignment_valid),
+	},
+	{
+		.data_type      = QMI_UNSIGNED_4_BYTE,
+		.elem_len       = 1,
+		.elem_size      = sizeof_field(struct mem_alloc_req_msg_v01, block_alignment),
+		.tlv_type       = 0x10,
+		.offset         = offsetof(struct mem_alloc_req_msg_v01, block_alignment),
+	},
+	{
+		.data_type      = QMI_EOTI,
+	},
+};
+
+struct qmi_elem_info mem_alloc_resp_msg_data_v01_ei[] = {
+	{
+		.data_type      = QMI_SIGNED_2_BYTE_ENUM,
+		.elem_len       = 1,
+		.elem_size      = sizeof_field(struct mem_alloc_resp_msg_v01, resp),
+		.tlv_type       = 0x01,
+		.offset         = offsetof(struct mem_alloc_resp_msg_v01, resp),
+	},
+	{
+		.data_type      = QMI_OPT_FLAG,
+		.elem_len       = 1,
+		.elem_size      = sizeof_field(struct mem_alloc_resp_msg_v01, handle_valid),
+		.tlv_type       = 0x10,
+		.offset         = offsetof(struct mem_alloc_resp_msg_v01, handle_valid),
+	},
+	{
+		.data_type      = QMI_UNSIGNED_8_BYTE,
+		.elem_len       = 1,
+		.elem_size      = sizeof_field(struct mem_alloc_resp_msg_v01, handle),
+		.tlv_type       = 0x10,
+		.offset         = offsetof(struct mem_alloc_resp_msg_v01, handle),
+	},
+	{
+		.data_type      = QMI_OPT_FLAG,
+		.elem_len       = 1,
+		.elem_size      = sizeof_field(struct mem_alloc_resp_msg_v01, num_bytes_valid),
+		.tlv_type       = 0x11,
+		.offset         = offsetof(struct mem_alloc_resp_msg_v01, num_bytes_valid),
+	},
+	{
+		.data_type      = QMI_UNSIGNED_4_BYTE,
+		.elem_len       = 1,
+		.elem_size      = sizeof_field(struct mem_alloc_resp_msg_v01, num_bytes),
+		.tlv_type       = 0x11,
+		.offset         = offsetof(struct mem_alloc_resp_msg_v01, num_bytes),
+	},
+	{
+		.data_type      = QMI_EOTI,
+	},
+};
+
+struct qmi_elem_info mem_free_req_msg_data_v01_ei[] = {
+	{
+		.data_type      = QMI_UNSIGNED_8_BYTE,
+		.elem_len       = 1,
+		.elem_size      = sizeof_field(struct mem_free_req_msg_v01, handle),
+		.tlv_type       = 0x01,
+		.offset         = offsetof(struct mem_free_req_msg_v01, handle),
+	},
+	{
+		.data_type      = QMI_EOTI,
+	},
+};
+
+struct qmi_elem_info mem_free_resp_msg_data_v01_ei[] = {
+	{
+		.data_type      = QMI_SIGNED_2_BYTE_ENUM,
+		.elem_len       = 1,
+		.elem_size      = sizeof_field(struct mem_free_resp_msg_v01, resp),
+		.tlv_type       = 0x01,
+		.offset         = offsetof(struct mem_free_resp_msg_v01, resp),
+	},
+	{
+		.data_type      = QMI_EOTI,
+	},
+};
+
+struct qmi_elem_info dhms_mem_alloc_addr_info_type_v01_ei[] = {
+	{
+		.data_type      = QMI_UNSIGNED_8_BYTE,
+		.elem_len       = 1,
+		.elem_size      = sizeof_field(struct dhms_mem_alloc_addr_info_type_v01, phy_addr),
+		.tlv_type       = QMI_COMMON_TLV_TYPE,
+		.offset         = offsetof(struct dhms_mem_alloc_addr_info_type_v01, phy_addr),
+	},
+	{
+		.data_type      = QMI_UNSIGNED_4_BYTE,
+		.elem_len       = 1,
+		.elem_size      = sizeof_field(struct dhms_mem_alloc_addr_info_type_v01, num_bytes),
+		.tlv_type       = QMI_COMMON_TLV_TYPE,
+		.offset         = offsetof(struct dhms_mem_alloc_addr_info_type_v01, num_bytes),
+	},
+	{
+		.data_type      = QMI_EOTI,
+	},
+};
+
+struct qmi_elem_info mem_alloc_generic_req_msg_data_v01_ei[] = {
+	{
+		.data_type      = QMI_UNSIGNED_4_BYTE,
+		.elem_len       = 1,
+		.elem_size      = sizeof_field(struct mem_alloc_generic_req_msg_v01, num_bytes),
+		.tlv_type       = 0x01,
+		.offset         = offsetof(struct mem_alloc_generic_req_msg_v01, num_bytes),
+	},
+	{
+		.data_type      = QMI_UNSIGNED_4_BYTE,
+		.elem_len       = 1,
+		.elem_size      = sizeof_field(struct mem_alloc_generic_req_msg_v01, client_id),
+		.tlv_type       = 0x02,
+		.offset         = offsetof(struct mem_alloc_generic_req_msg_v01, client_id),
+	},
+	{
+		.data_type      = QMI_UNSIGNED_4_BYTE,
+		.elem_len       = 1,
+		.elem_size      = sizeof_field(struct mem_alloc_generic_req_msg_v01, proc_id),
+		.tlv_type       = 0x03,
+		.offset         = offsetof(struct mem_alloc_generic_req_msg_v01, proc_id),
+	},
+	{
+		.data_type      = QMI_UNSIGNED_4_BYTE,
+		.elem_len       = 1,
+		.elem_size      = sizeof_field(struct mem_alloc_generic_req_msg_v01, sequence_id),
+		.tlv_type       = 0x04,
+		.offset         = offsetof(struct mem_alloc_generic_req_msg_v01, sequence_id),
+	},
+	{
+		.data_type      = QMI_OPT_FLAG,
+		.elem_len       = 1,
+		.elem_size      = sizeof_field(struct mem_alloc_generic_req_msg_v01,
+					       alloc_contiguous_valid),
+		.tlv_type       = 0x10,
+		.offset         = offsetof(struct mem_alloc_generic_req_msg_v01,
+					   alloc_contiguous_valid),
+	},
+	{
+		.data_type      = QMI_UNSIGNED_1_BYTE,
+		.elem_len       = 1,
+		.elem_size      = sizeof_field(struct mem_alloc_generic_req_msg_v01,
+					       alloc_contiguous),
+		.tlv_type       = 0x10,
+		.offset         = offsetof(struct mem_alloc_generic_req_msg_v01, alloc_contiguous),
+	},
+	{
+		.data_type      = QMI_OPT_FLAG,
+		.elem_len       = 1,
+		.elem_size      = sizeof_field(struct mem_alloc_generic_req_msg_v01,
+					       block_alignment_valid),
+		.tlv_type       = 0x11,
+		.offset         = offsetof(struct mem_alloc_generic_req_msg_v01,
+					   block_alignment_valid),
+	},
+	{
+		.data_type      = QMI_UNSIGNED_4_BYTE,
+		.elem_len       = 1,
+		.elem_size      = sizeof_field(struct mem_alloc_generic_req_msg_v01,
+					       block_alignment),
+		.tlv_type       = 0x11,
+		.offset         = offsetof(struct mem_alloc_generic_req_msg_v01, block_alignment),
+	},
+	{
+		.data_type      = QMI_EOTI,
+	},
+};
+
+struct qmi_elem_info mem_alloc_generic_resp_msg_data_v01_ei[] = {
+	{
+		.data_type      = QMI_STRUCT,
+		.elem_len       = 1,
+		.elem_size      = sizeof_field(struct mem_alloc_generic_resp_msg_v01, resp),
+		.tlv_type       = 0x02,
+		.offset         = offsetof(struct mem_alloc_generic_resp_msg_v01, resp),
+		.ei_array	= qmi_response_type_v01_ei,
+	},
+	{
+		.data_type      = QMI_OPT_FLAG,
+		.elem_len       = 1,
+		.elem_size      = sizeof_field(struct mem_alloc_generic_resp_msg_v01,
+					       sequence_id_valid),
+		.tlv_type       = 0x10,
+		.offset         = offsetof(struct mem_alloc_generic_resp_msg_v01, sequence_id_valid),
+	},
+	{
+		.data_type      = QMI_UNSIGNED_4_BYTE,
+		.elem_len       = 1,
+		.elem_size      = sizeof_field(struct mem_alloc_generic_resp_msg_v01, sequence_id),
+		.tlv_type       = 0x10,
+		.offset         = offsetof(struct mem_alloc_generic_resp_msg_v01, sequence_id),
+	},
+	{
+		.data_type      = QMI_OPT_FLAG,
+		.elem_len       = 1,
+		.elem_size      = sizeof_field(struct mem_alloc_generic_resp_msg_v01,
+					       dhms_mem_alloc_addr_info_valid),
+		.tlv_type       = 0x11,
+		.offset         = offsetof(struct mem_alloc_generic_resp_msg_v01,
+					   dhms_mem_alloc_addr_info_valid),
+	},
+	{
+		.data_type	= QMI_DATA_LEN,
+		.elem_len       = 1,
+		.elem_size      = sizeof_field(struct mem_alloc_generic_resp_msg_v01,
+					       dhms_mem_alloc_addr_info_len),
+		.tlv_type       = 0x11,
+		.offset         = offsetof(struct mem_alloc_generic_resp_msg_v01,
+					   dhms_mem_alloc_addr_info_len),
+	},
+	{
+		.data_type      = QMI_STRUCT,
+		.elem_len       = MAX_ARR_CNT_V01,
+		.elem_size      = sizeof_field(struct mem_alloc_generic_resp_msg_v01,
+					       dhms_mem_alloc_addr_info),
+		.array_type     = VAR_LEN_ARRAY,
+		.tlv_type       = 0x11,
+		.offset         = offsetof(struct mem_alloc_generic_resp_msg_v01,
+					   dhms_mem_alloc_addr_info),
+		.ei_array       = dhms_mem_alloc_addr_info_type_v01_ei,
+	},
+	{
+		.data_type      = QMI_EOTI,
+	},
+};
+
+struct qmi_elem_info mem_free_generic_req_msg_data_v01_ei[] = {
+	{
+		.data_type      = QMI_DATA_LEN,
+		.elem_len       = 1,
+		.elem_size      = sizeof_field(struct mem_free_generic_req_msg_v01,
+					       dhms_mem_alloc_addr_info_len),
+		.tlv_type       = 0x01,
+		.offset         = offsetof(struct mem_free_generic_req_msg_v01,
+					   dhms_mem_alloc_addr_info_len),
+	},
+	{
+		.data_type      = QMI_STRUCT,
+		.elem_len       = MAX_ARR_CNT_V01,
+		.elem_size      = sizeof_field(struct mem_free_generic_req_msg_v01,
+					       dhms_mem_alloc_addr_info),
+		.array_type     = VAR_LEN_ARRAY,
+		.tlv_type       = 0x01,
+		.offset         = offsetof(struct mem_free_generic_req_msg_v01,
+					   dhms_mem_alloc_addr_info),
+		.ei_array	= dhms_mem_alloc_addr_info_type_v01_ei,
+	},
+	{
+		.data_type      = QMI_OPT_FLAG,
+		.elem_len       = 1,
+		.elem_size      = sizeof_field(struct mem_free_generic_req_msg_v01, client_id_valid),
+		.tlv_type       = 0x10,
+		.offset         = offsetof(struct mem_free_generic_req_msg_v01, client_id_valid),
+	},
+	{
+		.data_type      = QMI_UNSIGNED_4_BYTE,
+		.elem_len       = 1,
+		.elem_size      = sizeof_field(struct mem_free_generic_req_msg_v01, client_id),
+		.tlv_type       = 0x10,
+		.offset         = offsetof(struct mem_free_generic_req_msg_v01, client_id),
+	},
+	{
+		.data_type      = QMI_OPT_FLAG,
+		.elem_len       = 1,
+		.elem_size      = sizeof_field(struct mem_free_generic_req_msg_v01, proc_id_valid),
+		.tlv_type       = 0x11,
+		.offset         = offsetof(struct mem_free_generic_req_msg_v01, proc_id_valid),
+	},
+	{
+		.data_type      = QMI_UNSIGNED_4_BYTE,
+		.elem_len       = 1,
+		.elem_size      = sizeof_field(struct mem_free_generic_req_msg_v01, proc_id),
+		.tlv_type       = 0x11,
+		.offset         = offsetof(struct mem_free_generic_req_msg_v01, proc_id),
+	},
+	{
+		.data_type      = QMI_EOTI,
+	},
+};
+
+struct qmi_elem_info mem_free_generic_resp_msg_data_v01_ei[] = {
+	{
+		.data_type      = QMI_STRUCT,
+		.elem_len       = 1,
+		.elem_size      = sizeof_field(struct mem_free_generic_resp_msg_v01, resp),
+		.tlv_type       = 0x02,
+		.offset         = offsetof(struct mem_free_generic_resp_msg_v01, resp),
+		.ei_array	= qmi_response_type_v01_ei,
+	},
+	{
+		.data_type      = QMI_EOTI,
+	},
+};
+
+struct qmi_elem_info mem_query_size_req_msg_data_v01_ei[] = {
+	{
+		.data_type      = QMI_UNSIGNED_4_BYTE,
+		.elem_len       = 1,
+		.elem_size      = sizeof_field(struct mem_query_size_req_msg_v01, client_id),
+		.tlv_type       = 0x01,
+		.offset         = offsetof(struct mem_query_size_req_msg_v01, client_id),
+	},
+	{
+		.data_type      = QMI_OPT_FLAG,
+		.elem_len       = 1,
+		.elem_size      = sizeof_field(struct mem_query_size_req_msg_v01, proc_id_valid),
+		.tlv_type       = 0x10,
+		.offset         = offsetof(struct mem_query_size_req_msg_v01, proc_id_valid),
+	},
+	{
+		.data_type      = QMI_UNSIGNED_4_BYTE,
+		.elem_len       = 1,
+		.elem_size      = sizeof_field(struct mem_query_size_req_msg_v01, proc_id),
+		.tlv_type       = 0x10,
+		.offset         = offsetof(struct mem_query_size_req_msg_v01, proc_id),
+	},
+	{
+		.data_type      = QMI_EOTI,
+	},
+};
+
+struct qmi_elem_info mem_query_size_resp_msg_data_v01_ei[] = {
+	{
+		.data_type      = QMI_STRUCT,
+		.elem_len       = 1,
+		.elem_size      = sizeof_field(struct mem_query_size_rsp_msg_v01, resp),
+		.tlv_type       = 0x02,
+		.offset         = offsetof(struct mem_query_size_rsp_msg_v01, resp),
+		.ei_array	= qmi_response_type_v01_ei,
+	},
+	{
+		.data_type      = QMI_OPT_FLAG,
+		.elem_len       = 1,
+		.elem_size      = sizeof_field(struct mem_query_size_rsp_msg_v01, size_valid),
+		.tlv_type       = 0x10,
+		.offset         = offsetof(struct mem_query_size_rsp_msg_v01, size_valid),
+	},
+	{
+		.data_type      = QMI_UNSIGNED_4_BYTE,
+		.elem_len       = 1,
+		.elem_size      = sizeof_field(struct mem_query_size_rsp_msg_v01, size),
+		.tlv_type       = 0x10,
+		.offset         = offsetof(struct mem_query_size_rsp_msg_v01, size),
+	},
+	{
+		.data_type      = QMI_EOTI,
+	},
+};
diff --git a/drivers/soc/qcom/memshare_qmi_msg.h b/drivers/soc/qcom/memshare_qmi_msg.h
new file mode 100644
index 000000000000..c436330a0713
--- /dev/null
+++ b/drivers/soc/qcom/memshare_qmi_msg.h
@@ -0,0 +1,228 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright (c) 2013-2015, 2017-2018, The Linux Foundation. All rights reserved. */
+
+#ifndef HEAP_MEM_EXT_SERVICE_01_H
+#define HEAP_MEM_EXT_SERVICE_01_H
+
+#include <linux/types.h>
+#include <linux/soc/qcom/qmi.h>
+
+#define MEM_SERVICE_SVC_ID 0x00000034
+#define MEM_SERVICE_INS_ID 1
+#define MEM_SERVICE_VER 1
+
+/* Service Message Definition */
+#define MEM_ALLOC_MSG_V01 0x0020
+#define MEM_FREE_MSG_V01 0x0021
+#define MEM_ALLOC_GENERIC_MSG_V01 0x0022
+#define MEM_FREE_GENERIC_MSG_V01 0x0023
+#define MEM_QUERY_SIZE_MSG_V01 0x0024
+
+#define MEM_MAX_MSG_LEN_V01 255
+#define MAX_ARR_CNT_V01 64
+
+#define MEM_BLOCK_ALIGN_TO_BYTES(x) (2 << (x)) /* 0..11 */
+
+/**
+ * Unless stated otherwise, any property X that is paired with X_valid
+ * property is an optional property. Other properties are mandatory.
+ */
+
+/**
+ * struct dhms_mem_alloc_addr_info_type_v01 - Element of memory block array.
+ * @phy_addr: Physical address of memory block.
+ * @num_bytes: Size of memory block.
+ */
+struct dhms_mem_alloc_addr_info_type_v01 {
+	u64 phy_addr;
+	u32 num_bytes;
+};
+
+/**
+ * struct mem_alloc_req_msg_v01 - Legacy memory allocation request.
+ * @num_bytes: Requested size.
+ * @block_alignment_valid: Must be set to true if block_alignment is being passed.
+ * @block_alignment: The block alignment for the memory block to be allocated.
+ *
+ * Request Message.
+ * This command is used for getting the multiple physically contiguous memory
+ * blocks from the server memory subsystem.
+ */
+struct mem_alloc_req_msg_v01 {
+	u32 num_bytes;
+	u8 block_alignment_valid;
+	u32 block_alignment;
+};
+
+/**
+ * struct mem_alloc_resp_msg_v01 - Response for legacy allocation memory request.
+ * @resp: Result Code. The result of the requested memory operation.
+ * @handle_valid: Must be set to true if handle is being passed.
+ * @handle: Memory Block Handle. The physical address of the memory allocated on the HLOS.
+ * @num_bytes_valid: Must be set to true if num_bytes is being passed.
+ * @num_bytes: Memory block size. The number of bytes actually allocated for the request.
+ *             This value can be smaller than the size requested in QMI_DHMS_MEM_ALLOC_REQ_MSG.
+ *
+ * Response Message.
+ * This command is used for getting the multiple physically contiguous memory
+ * blocks from the server memory subsystem
+ */
+struct mem_alloc_resp_msg_v01 {
+	u16 resp;
+	u8 handle_valid;
+	u64 handle;
+	u8 num_bytes_valid;
+	u32 num_bytes;
+};
+
+/**
+ * struct mem_free_req_msg_v01 - Legacy memory free request.
+ * @handle: Physical address of memory to be freed.
+ *
+ * Request Message.
+ * This command is used for releasing the multiple physically contiguous memory
+ * blocks to the server memory subsystem.
+ */
+struct mem_free_req_msg_v01 {
+	u64 handle;
+};
+
+/**
+ * struct mem_free_resp_msg_v01 - Response for legacy memory free request.
+ * @resp: Result of the requested memory operation.
+ *
+ * Response Message.
+ * This command is used for releasing the multiple physically contiguous memory
+ * blocks to the server memory subsystem.
+ */
+struct mem_free_resp_msg_v01 {
+	u16 resp;
+};
+
+/**
+ * struct mem_alloc_generic_req_msg_v01 - Memory allocation request.
+ * @num_bytes: Requested size.
+ * @client_id: Client ID.
+ * @proc_id: Peripheral ID.
+ * @sequence_id: Sequence ID.
+ * @alloc_contiguous_valid: Must be set to true if alloc_contiguous is being passed.
+ * @alloc_contiguous: alloc_contiguous is used to identify that clients are requesting
+ *                    for contiguous or non contiguous memory, default is contiguous.
+ *                    0 = non contiguous else contiguous.
+ * @block_alignment_valid: Must be set to true if block_alignment is being passed.
+ * @block_alignment: The block alignment for the memory block to be allocated.
+ *
+ * Request Message.
+ * This command is used for getting the multiple physically contiguous memory
+ * blocks from the server memory subsystem
+ */
+struct mem_alloc_generic_req_msg_v01 {
+	u32 num_bytes;
+	u32 client_id;
+	u32 proc_id;
+	u32 sequence_id;
+	u8 alloc_contiguous_valid;
+	u8 alloc_contiguous;
+	u8 block_alignment_valid;
+	u32 block_alignment;
+};
+
+/**
+ * struct mem_alloc_generic_resp_msg_v01 - Response for memory allocation request.
+ * @resp: Result Code. The result of the requested memory operation.
+ * @sequence_id_valid: Must be set to true if sequence_id is being passed.
+ * @sequence_id: Sequence ID. This property is marked as mandatory.
+ * @dhms_mem_alloc_addr_info_valid: Must be set to true if handle is being passed.
+ * @dhms_mem_alloc_addr_info_len: Handle Size.
+ * @dhms_mem_alloc_addr_info: Memory Block Handle. The physical address of the
+ *                            memory allocated on the HLOS.
+ *
+ * Response Message.
+ * This command is used for getting the multiple physically contiguous memory
+ * blocks from the server memory subsystem
+ */
+struct mem_alloc_generic_resp_msg_v01 {
+	struct qmi_response_type_v01 resp;
+	u8 sequence_id_valid;
+	u32 sequence_id;
+	u8 dhms_mem_alloc_addr_info_valid;
+	u8 dhms_mem_alloc_addr_info_len;
+	struct dhms_mem_alloc_addr_info_type_v01 dhms_mem_alloc_addr_info[MAX_ARR_CNT_V01];
+};
+
+/**
+ * struct mem_free_generic_req_msg_v01 - Memory free request.
+ * @dhms_mem_alloc_addr_info_len: Must be set to # of elments in array.
+ * @dhms_mem_alloc_addr_info: Physical address and size of the memory allocated
+ *                            on the HLOS to be freed.
+ * @client_id_valid: Must be set to true if client_id is being passed.
+ * @client_id: Client ID.
+ * @proc_id_valid: Must be set to true if proc_id is being passed.
+ * @proc_id: Peripheral ID.
+ *
+ * Request Message.
+ * This command is used for releasing the multiple physically contiguous memory
+ * blocks to the server memory subsystem
+ */
+struct mem_free_generic_req_msg_v01 {
+	u8 dhms_mem_alloc_addr_info_len;
+	struct dhms_mem_alloc_addr_info_type_v01 dhms_mem_alloc_addr_info[MAX_ARR_CNT_V01];
+	u8 client_id_valid;
+	u32 client_id;
+	u8 proc_id_valid;
+	u32 proc_id;
+};
+
+/**
+ * struct mem_free_generic_resp_msg_v01 - Response for memory free request.
+ * @resp: Result of the requested memory operation.
+ *
+ * Response Message.
+ * This command is used for releasing the multiple physically contiguous memory
+ * blocks to the server memory subsystem
+ */
+struct mem_free_generic_resp_msg_v01 {
+	struct qmi_response_type_v01 resp;
+};
+
+/**
+ * struct mem_query_size_req_msg_v01 - Size query request.
+ * @client_id: Client ID.
+ * @proc_id_valid: proc_id_valid must be set to true if proc_id is being passed.
+ * @proc_id: Proc ID.
+ *
+ * Request Message.
+ */
+struct mem_query_size_req_msg_v01 {
+	u32 client_id;
+	u8 proc_id_valid;
+	u32 proc_id;
+};
+
+/**
+ * struct mem_query_size_rsp_msg_v01 - Response for Size query request.
+ * @resp: Result Code.
+ * @size_valid: size_valid must be set to true if size is being passed.
+ * @size: Size.
+ *
+ * Response Message.
+ */
+struct mem_query_size_rsp_msg_v01 {
+	struct qmi_response_type_v01 resp;
+	u8 size_valid;
+	u32 size;
+};
+
+/* Message structure definitions defined in "memshare_qmi_msg.c" */
+extern struct qmi_elem_info mem_alloc_req_msg_data_v01_ei[];
+extern struct qmi_elem_info mem_alloc_resp_msg_data_v01_ei[];
+extern struct qmi_elem_info mem_free_req_msg_data_v01_ei[];
+extern struct qmi_elem_info mem_free_resp_msg_data_v01_ei[];
+extern struct qmi_elem_info mem_alloc_generic_req_msg_data_v01_ei[];
+extern struct qmi_elem_info mem_alloc_generic_resp_msg_data_v01_ei[];
+extern struct qmi_elem_info mem_free_generic_req_msg_data_v01_ei[];
+extern struct qmi_elem_info mem_free_generic_resp_msg_data_v01_ei[];
+extern struct qmi_elem_info mem_query_size_req_msg_data_v01_ei[];
+extern struct qmi_elem_info mem_query_size_resp_msg_data_v01_ei[];
+
+#endif
-- 
2.27.0

