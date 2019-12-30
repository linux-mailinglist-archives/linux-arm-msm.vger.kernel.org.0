Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 14EA012CC6C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2019 06:00:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727165AbfL3FAj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Dec 2019 00:00:39 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:36890 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727131AbfL3FAj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Dec 2019 00:00:39 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1577682037; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=MjtWiT6VT+GRhEoSlEfyZHUgFpqajifx93LtSU2c0jc=; b=wnSpg55m/n8zRUkATxsTdPBXUoSNbUQse/UrYWkpgg0vAf2qGmdjSmY4R3d+QSq2wPUh+HK+
 PRhtDTvvPhVSCf7HtCPxgtrbQCmDX5/d7D6GUvWvU5ZaUq4DWstd3haUdG3S0fct7fXCBsb2
 jpCH+NbZL8OnuVtItGSld8qMaBE=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e098471.7fe0150a5f10-smtp-out-n03;
 Mon, 30 Dec 2019 05:00:33 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E707EC447B0; Mon, 30 Dec 2019 05:00:31 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-87.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 52732C447AB;
        Mon, 30 Dec 2019 05:00:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 52732C447AB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     bjorn.andersson@linaro.org, srinivas.kandagatla@linaro.org,
        robh+dt@kernel.org, tsoni@codeaurora.org
Cc:     agross@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v3 1/3] soc: qcom: Introduce Protection Domain Restart helpers
Date:   Mon, 30 Dec 2019 10:30:06 +0530
Message-Id: <20191230050008.8143-2-sibis@codeaurora.org>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20191230050008.8143-1-sibis@codeaurora.org>
References: <20191230050008.8143-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Qualcomm SoCs (starting with MSM8998) allow for multiple protection domains
to run on the same Q6 sub-system. This allows for services like ATH10K WLAN
FW to have their own separate address space and crash/recover without
disrupting the modem and other PDs running on the same sub-system. The PDR
helpers introduces an abstraction that allows for tracking/controlling the
life cycle of protection domains running on various Q6 sub-systems.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 drivers/soc/qcom/Kconfig         |   5 +
 drivers/soc/qcom/Makefile        |   1 +
 drivers/soc/qcom/pdr_interface.c | 709 +++++++++++++++++++++++++++++++
 drivers/soc/qcom/pdr_internal.h  | 375 ++++++++++++++++
 include/linux/soc/qcom/pdr.h     | 109 +++++
 include/linux/soc/qcom/qmi.h     |   1 +
 6 files changed, 1200 insertions(+)
 create mode 100644 drivers/soc/qcom/pdr_interface.c
 create mode 100644 drivers/soc/qcom/pdr_internal.h
 create mode 100644 include/linux/soc/qcom/pdr.h

diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index 79d826553ac82..5c4e76837f59b 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -76,6 +76,11 @@ config QCOM_OCMEM
           requirements. This is typically used by the GPU, camera/video, and
           audio components on some Snapdragon SoCs.
 
+config QCOM_PDR_HELPERS
+	tristate
+	depends on ARCH_QCOM || COMPILE_TEST
+	select QCOM_QMI_HELPERS
+
 config QCOM_PM
 	bool "Qualcomm Power Management"
 	depends on ARCH_QCOM && !ARM64
diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
index 9fb35c8a495e1..5d6b83dc58e82 100644
--- a/drivers/soc/qcom/Makefile
+++ b/drivers/soc/qcom/Makefile
@@ -7,6 +7,7 @@ obj-$(CONFIG_QCOM_GLINK_SSR) +=	glink_ssr.o
 obj-$(CONFIG_QCOM_GSBI)	+=	qcom_gsbi.o
 obj-$(CONFIG_QCOM_MDT_LOADER)	+= mdt_loader.o
 obj-$(CONFIG_QCOM_OCMEM)	+= ocmem.o
+obj-$(CONFIG_QCOM_PDR_HELPERS)	+= pdr_interface.o
 obj-$(CONFIG_QCOM_PM)	+=	spm.o
 obj-$(CONFIG_QCOM_QMI_HELPERS)	+= qmi_helpers.o
 qmi_helpers-y	+= qmi_encdec.o qmi_interface.o
diff --git a/drivers/soc/qcom/pdr_interface.c b/drivers/soc/qcom/pdr_interface.c
new file mode 100644
index 0000000000000..27b74763add05
--- /dev/null
+++ b/drivers/soc/qcom/pdr_interface.c
@@ -0,0 +1,709 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2019 The Linux Foundation. All rights reserved.
+ */
+
+#include <linux/completion.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/qrtr.h>
+#include <linux/string.h>
+#include <linux/workqueue.h>
+
+#include "pdr_internal.h"
+
+struct pdr_list_node {
+	enum servreg_service_state curr_state;
+	u16 transaction_id;
+	struct pdr_service *pds;
+	struct list_head node;
+};
+
+static int servreg_locator_new_server(struct qmi_handle *qmi,
+				      struct qmi_service *svc)
+{
+	struct pdr_handle *pdr = container_of(qmi, struct pdr_handle,
+					      servloc_client);
+	struct pdr_service *pds, *tmp;
+
+	/* Create a Local client port for QMI communication */
+	pdr->servloc_addr.sq_family = AF_QIPCRTR;
+	pdr->servloc_addr.sq_node = svc->node;
+	pdr->servloc_addr.sq_port = svc->port;
+
+	mutex_lock(&pdr->locator_lock);
+	pdr->locator_available = true;
+	mutex_unlock(&pdr->locator_lock);
+
+	/* Service pending lookup requests */
+	mutex_lock(&pdr->list_lock);
+	list_for_each_entry_safe(pds, tmp, &pdr->lookups, node) {
+		if (pds->need_servreg_lookup)
+			schedule_work(&pdr->servloc_work);
+	}
+	mutex_unlock(&pdr->list_lock);
+
+	return 0;
+}
+
+static void servreg_locator_del_server(struct qmi_handle *qmi,
+				       struct qmi_service *svc)
+{
+	struct pdr_handle *pdr = container_of(qmi, struct pdr_handle,
+					      servloc_client);
+
+	mutex_lock(&pdr->locator_lock);
+	pdr->locator_available = false;
+	mutex_unlock(&pdr->locator_lock);
+
+	pdr->servloc_addr.sq_node = 0;
+	pdr->servloc_addr.sq_port = 0;
+}
+
+static struct qmi_ops service_locator_ops = {
+	.new_server = servreg_locator_new_server,
+	.del_server = servreg_locator_del_server,
+};
+
+static int pdr_register_listener(struct pdr_handle *pdr,
+				 struct pdr_service *pds,
+				 bool enable)
+{
+	struct servreg_register_listener_resp resp;
+	struct servreg_register_listener_req req;
+	struct qmi_txn txn;
+	int ret;
+
+	ret = qmi_txn_init(&pdr->servreg_client, &txn,
+			   servreg_register_listener_resp_ei,
+			   &resp);
+	if (ret < 0)
+		return ret;
+
+	req.enable = enable;
+	strcpy(req.service_path, pds->service_path);
+
+	ret = qmi_send_request(&pdr->servreg_client, &pdr->servreg_addr,
+			       &txn, SERVREG_REGISTER_LISTENER_REQ,
+			       SERVREG_REGISTER_LISTENER_REQ_LEN,
+			       servreg_register_listener_req_ei,
+			       &req);
+	if (ret < 0) {
+		qmi_txn_cancel(&txn);
+		return ret;
+	}
+
+	ret = qmi_txn_wait(&txn, 5 * HZ);
+	if (ret < 0) {
+		pr_err("PDR: %s register listener txn wait failed: %d\n",
+		       pds->service_path, ret);
+		return ret;
+	}
+
+	/* Check the response */
+	if (resp.resp.result != QMI_RESULT_SUCCESS_V01) {
+		pr_err("PDR: %s register listener failed: 0x%x\n",
+		       pds->service_path, resp.resp.error);
+		return ret;
+	}
+
+	if ((int)resp.curr_state < INT_MIN || (int)resp.curr_state > INT_MAX)
+		pr_err("PDR: %s notification state invalid: 0x%x\n",
+		       pds->service_path, resp.curr_state);
+
+	pds->state = resp.curr_state;
+
+	return 0;
+}
+
+static void pdr_servreg_work(struct work_struct *work)
+{
+	struct pdr_handle *pdr = container_of(work, struct pdr_handle,
+					      servreg_work);
+	struct pdr_service *pds, *tmp;
+
+	mutex_lock(&pdr->list_lock);
+	list_for_each_entry_safe(pds, tmp, &pdr->lookups, node) {
+		if (pds->service_connected) {
+			if (!pds->need_servreg_register)
+				continue;
+
+			pds->need_servreg_register = false;
+			mutex_unlock(&pdr->list_lock);
+			pdr_register_listener(pdr, pds, true);
+		} else {
+			if (!pds->need_servreg_remove)
+				continue;
+
+			pds->need_servreg_remove = false;
+			mutex_unlock(&pdr->list_lock);
+			pds->state = SERVREG_SERVICE_STATE_DOWN;
+		}
+
+		mutex_lock(&pdr->status_lock);
+		pdr->status(pdr, pds);
+		mutex_unlock(&pdr->status_lock);
+
+		return;
+	}
+	mutex_unlock(&pdr->list_lock);
+}
+
+static int servreg_notifier_new_server(struct qmi_handle *qmi,
+				       struct qmi_service *svc)
+{
+	struct pdr_handle *pdr = container_of(qmi, struct pdr_handle,
+					      servreg_client);
+	struct pdr_service *pds, *tmp;
+
+	/* Create a Local client port for QMI communication */
+	pdr->servreg_addr.sq_family = AF_QIPCRTR;
+	pdr->servreg_addr.sq_node = svc->node;
+	pdr->servreg_addr.sq_port = svc->port;
+
+	mutex_lock(&pdr->list_lock);
+	list_for_each_entry_safe(pds, tmp, &pdr->lookups, node) {
+		if (pds->service == svc->service &&
+		    pds->instance == svc->instance) {
+			pds->service_connected = true;
+			pds->need_servreg_register = true;
+			queue_work(pdr->servreg_wq, &pdr->servreg_work);
+		}
+	}
+	mutex_unlock(&pdr->list_lock);
+
+	return 0;
+}
+
+static void servreg_notifier_del_server(struct qmi_handle *qmi,
+					struct qmi_service *svc)
+{
+	struct pdr_handle *pdr = container_of(qmi, struct pdr_handle,
+					      servreg_client);
+	struct pdr_service *pds, *tmp;
+
+	pdr->servreg_addr.sq_node = 0;
+	pdr->servreg_addr.sq_port = 0;
+
+	mutex_lock(&pdr->list_lock);
+	list_for_each_entry_safe(pds, tmp, &pdr->lookups, node) {
+		if (pds->service == svc->service &&
+		    pds->instance == svc->instance) {
+			pds->service_connected = false;
+			pds->need_servreg_remove = true;
+			queue_work(pdr->servreg_wq, &pdr->servreg_work);
+		}
+	}
+	mutex_unlock(&pdr->list_lock);
+}
+
+static struct qmi_ops service_notifier_ops = {
+	.new_server = servreg_notifier_new_server,
+	.del_server = servreg_notifier_del_server,
+};
+
+static int pdr_send_indack_msg(struct pdr_handle *pdr, struct pdr_service *pds,
+			       u16 tid)
+{
+	struct servreg_set_ack_resp resp;
+	struct servreg_set_ack_req req;
+	struct qmi_txn txn;
+	int ret;
+
+	ret = qmi_txn_init(&pdr->servreg_client, &txn, servreg_set_ack_resp_ei,
+			   &resp);
+	if (ret < 0)
+		return ret;
+
+	req.transaction_id = tid;
+	strcpy(req.service_path, pds->service_path);
+
+	ret = qmi_send_request(&pdr->servreg_client, &pdr->servreg_addr,
+			       &txn, SERVREG_SET_ACK_REQ,
+			       SERVREG_SET_ACK_REQ_LEN,
+			       servreg_set_ack_req_ei,
+			       &req);
+
+	/* Skip waiting for response */
+	qmi_txn_cancel(&txn);
+	return ret;
+}
+
+static void pdr_indack_work(struct work_struct *work)
+{
+	struct pdr_handle *pdr = container_of(work, struct pdr_handle,
+					      indack_work);
+	struct pdr_list_node *ind, *tmp;
+	struct pdr_service *pds;
+
+	list_for_each_entry_safe(ind, tmp, &pdr->indack_list, node) {
+		pds = ind->pds;
+		pdr_send_indack_msg(pdr, pds, ind->transaction_id);
+		mutex_lock(&pdr->status_lock);
+		pds->state = ind->curr_state;
+		pdr->status(pdr, pds);
+		mutex_unlock(&pdr->status_lock);
+		list_del(&ind->node);
+		kfree(ind);
+	}
+}
+
+static void pdr_servreg_ind_cb(struct qmi_handle *qmi,
+			       struct sockaddr_qrtr *sq,
+			       struct qmi_txn *txn, const void *data)
+{
+	struct pdr_handle *pdr = container_of(qmi, struct pdr_handle,
+					      servreg_client);
+	const struct servreg_state_updated_ind *ind_msg = data;
+	struct pdr_list_node *ind;
+	struct pdr_service *pds;
+
+	if (!ind_msg || !ind_msg->service_path[0] ||
+	    strlen(ind_msg->service_path) > SERVREG_NAME_LENGTH)
+		return;
+
+	list_for_each_entry(pds, &pdr->lookups, node) {
+		if (!strcmp(pds->service_path, ind_msg->service_path))
+			goto found;
+	}
+	return;
+
+found:
+	ind = kzalloc(sizeof(*ind), GFP_KERNEL);
+	if (!ind)
+		return;
+
+	pr_info("PDR: Indication received from %s, state: 0x%x, trans-id: %d\n",
+		ind_msg->service_path, ind_msg->curr_state,
+		ind_msg->transaction_id);
+
+	ind->transaction_id = ind_msg->transaction_id;
+	ind->curr_state = ind_msg->curr_state;
+	ind->pds = pds;
+
+	mutex_lock(&pdr->list_lock);
+	list_add_tail(&ind->node, &pdr->indack_list);
+	mutex_unlock(&pdr->list_lock);
+
+	queue_work(pdr->indack_wq, &pdr->indack_work);
+}
+
+static struct qmi_msg_handler qmi_indication_handler[] = {
+	{
+		.type = QMI_INDICATION,
+		.msg_id = SERVREG_STATE_UPDATED_IND_ID,
+		.ei = servreg_state_updated_ind_ei,
+		.decoded_size = sizeof(struct servreg_state_updated_ind),
+		.fn = pdr_servreg_ind_cb,
+	},
+	{}
+};
+
+static int pdr_get_domain_list(struct servreg_get_domain_list_req *req,
+			       struct servreg_get_domain_list_resp *resp,
+			       struct pdr_handle *pdr)
+{
+	struct qmi_txn txn;
+	int ret;
+
+	ret = qmi_txn_init(&pdr->servloc_client, &txn,
+			   servreg_get_domain_list_resp_ei, resp);
+	if (ret < 0)
+		return ret;
+
+	ret = qmi_send_request(&pdr->servloc_client,
+			       &pdr->servloc_addr,
+			       &txn, SERVREG_GET_DOMAIN_LIST_REQ,
+			       SERVREG_GET_DOMAIN_LIST_REQ_MAX_LEN,
+			       servreg_get_domain_list_req_ei,
+			       req);
+	if (ret < 0) {
+		qmi_txn_cancel(&txn);
+		return ret;
+	}
+
+	ret = qmi_txn_wait(&txn, 5 * HZ);
+	if (ret < 0) {
+		pr_err("PDR: %s get domain list txn wait failed: %d\n",
+		       req->service_name, ret);
+		return ret;
+	}
+
+	/* Check the response */
+	if (resp->resp.result != QMI_RESULT_SUCCESS_V01) {
+		pr_err("PDR: %s get domain list failed: 0x%x\n",
+		       req->service_name, resp->resp.error);
+		return -EREMOTEIO;
+	}
+
+	return 0;
+}
+
+static void pdr_servreg_link_create(struct pdr_handle *pdr,
+				    struct pdr_service *pds)
+{
+	struct pdr_service *pds_iter, *tmp;
+	bool link_exists = false;
+
+	/* Check if a QMI link to SERVREG instance already exists */
+	mutex_lock(&pdr->list_lock);
+	list_for_each_entry_safe(pds_iter, tmp, &pdr->lookups, node) {
+		if (pds_iter->instance == pds->instance &&
+		    strcmp(pds_iter->service_path, pds->service_path)) {
+			link_exists = true;
+			pds->service_connected = pds_iter->service_connected;
+			if (pds_iter->service_connected)
+				pds->need_servreg_register = true;
+			else
+				pds->need_servreg_remove = true;
+			queue_work(pdr->servreg_wq, &pdr->servreg_work);
+			break;
+		}
+	}
+	mutex_unlock(&pdr->list_lock);
+
+	if (!link_exists)
+		qmi_add_lookup(&pdr->servreg_client, pds->service, 1,
+			       pds->instance);
+}
+
+static int pdr_locate_service(struct pdr_handle *pdr, struct pdr_service *pds)
+{
+	struct servreg_get_domain_list_resp *resp = NULL;
+	struct servreg_get_domain_list_req req;
+	int db_rev_count = 0, domains_read = 0;
+	struct servreg_location_entry *entry;
+	int ret, i;
+
+	resp = kzalloc(sizeof(*resp), GFP_KERNEL);
+	if (!resp)
+		return -ENOMEM;
+
+	/* Prepare req message */
+	strcpy(req.service_name, pds->service_name);
+	req.domain_offset_valid = true;
+	req.domain_offset = 0;
+
+	do {
+		req.domain_offset = domains_read;
+		ret = pdr_get_domain_list(&req, resp, pdr);
+		if (ret < 0)
+			goto out;
+
+		if (!domains_read)
+			db_rev_count = resp->db_rev_count;
+
+		if (db_rev_count != resp->db_rev_count) {
+			ret = -EAGAIN;
+			goto out;
+		}
+
+		for (i = domains_read; i < resp->domain_list_len; i++) {
+			entry = &resp->domain_list[i];
+
+			if (strnlen(entry->name, sizeof(entry->name)) == sizeof(entry->name))
+				continue;
+
+			if (!strcmp(entry->name, pds->service_path)) {
+				pds->service_data_valid = entry->service_data_valid;
+				pds->service_data = entry->service_data;
+				pds->instance = entry->instance;
+				goto out;
+			}
+		}
+
+		/* Update ret to indicate that the service is not yet found */
+		ret = -ENXIO;
+
+		/* Always read total_domains from the response msg */
+		if (resp->domain_list_len > resp->total_domains)
+			resp->domain_list_len = resp->total_domains;
+
+		domains_read += resp->domain_list_len;
+	} while (domains_read < resp->total_domains);
+out:
+	kfree(resp);
+	return ret;
+}
+
+static void pdr_servloc_work(struct work_struct *work)
+{
+	struct pdr_handle *pdr = container_of(work, struct pdr_handle,
+					      servloc_work);
+	struct pdr_service *pds, *tmp;
+	int ret;
+
+	/* Bail out early if PD Mapper is not up */
+	mutex_lock(&pdr->locator_lock);
+	if (!pdr->locator_available) {
+		mutex_unlock(&pdr->locator_lock);
+		pr_warn("PDR: SERVICE LOCATOR service not available\n");
+		return;
+	}
+	mutex_unlock(&pdr->locator_lock);
+
+	mutex_lock(&pdr->list_lock);
+	list_for_each_entry_safe(pds, tmp, &pdr->lookups, node) {
+		if (!pds->need_servreg_lookup)
+			continue;
+
+		pds->need_servreg_lookup = false;
+		mutex_unlock(&pdr->list_lock);
+
+		ret = pdr_locate_service(pdr, pds);
+		if (ret < 0) {
+			if (ret == -ENXIO)
+				pds->state = SERVREG_LOCATOR_UNKNOWN_SERVICE;
+			else if (ret == -EAGAIN)
+				pds->state = SERVREG_LOCATOR_DB_UPDATED;
+			else
+				pds->state = SERVREG_LOCATOR_ERR;
+
+			pr_err("PDR: service lookup for %s failed: %d\n",
+			       pds->service_name, ret);
+
+			/* Remove from lookup list */
+			mutex_lock(&pdr->list_lock);
+			list_del(&pds->node);
+			mutex_unlock(&pdr->list_lock);
+
+			/* Notify Lookup failed */
+			mutex_lock(&pdr->status_lock);
+			pdr->status(pdr, pds);
+			mutex_unlock(&pdr->status_lock);
+			kfree(pds);
+		} else {
+			pdr_servreg_link_create(pdr, pds);
+		}
+
+		return;
+	}
+	mutex_unlock(&pdr->list_lock);
+}
+
+/**
+ * pdr_add_lookup() - register a tracking request for a PD
+ * @pdr:		PDR client handle
+ * @service_name:	service name of the tracking request
+ * @service_path:	service path of the tracking request
+ *
+ * Registering a pdr lookup allows for tracking the life cycle of the PD.
+ *
+ * Return: 0 on success, negative errno on failure.
+ */
+int pdr_add_lookup(struct pdr_handle *pdr, const char *service_name,
+		   const char *service_path)
+{
+	struct pdr_service *pds, *pds_iter, *tmp;
+	int ret;
+
+	if (!service_name || strlen(service_name) > SERVREG_NAME_LENGTH ||
+	    !service_path || strlen(service_path) > SERVREG_NAME_LENGTH)
+		return -EINVAL;
+
+	pds = kzalloc(sizeof(*pds), GFP_KERNEL);
+	if (!pds)
+		return -ENOMEM;
+
+	pds->service = SERVREG_NOTIFIER_SERVICE;
+	strcpy(pds->service_name, service_name);
+	strcpy(pds->service_path, service_path);
+	pds->need_servreg_lookup = true;
+
+	mutex_lock(&pdr->list_lock);
+	list_for_each_entry_safe(pds_iter, tmp, &pdr->lookups, node) {
+		if (!strcmp(pds_iter->service_path, service_path)) {
+			mutex_unlock(&pdr->list_lock);
+			ret = -EALREADY;
+			goto err;
+		}
+	}
+
+	list_add(&pds->node, &pdr->lookups);
+	mutex_unlock(&pdr->list_lock);
+
+	schedule_work(&pdr->servloc_work);
+
+	return 0;
+err:
+	kfree(pds);
+
+	return ret;
+}
+EXPORT_SYMBOL(pdr_add_lookup);
+
+/**
+ * pdr_restart_pd() - restart PD
+ * @pdr:		PDR client handle
+ * @service_path:	service path of restart request
+ *
+ * Restarts the PD tracked by the PDR client handle for a given service path.
+ *
+ * Return: 0 on success, negative errno on failure.
+ */
+int pdr_restart_pd(struct pdr_handle *pdr, const char *service_path)
+{
+	struct servreg_restart_pd_req req;
+	struct servreg_restart_pd_resp resp;
+	struct pdr_service *pds = NULL, *pds_iter, *tmp;
+	struct qmi_txn txn;
+	int ret;
+
+	if (!service_path || strlen(service_path) > SERVREG_NAME_LENGTH)
+		return -EINVAL;
+
+	mutex_lock(&pdr->list_lock);
+	list_for_each_entry_safe(pds_iter, tmp, &pdr->lookups, node) {
+		if (!pds_iter->service_connected)
+			continue;
+
+		if (!strcmp(pds_iter->service_path, service_path)) {
+			pds = pds_iter;
+			break;
+		}
+	}
+	mutex_unlock(&pdr->list_lock);
+
+	if (!pds)
+		return -EINVAL;
+
+	/* Prepare req message */
+	strcpy(req.service_path, pds->service_path);
+
+	ret = qmi_txn_init(&pdr->servreg_client, &txn,
+			   servreg_restart_pd_resp_ei,
+			   &resp);
+	if (ret < 0)
+		return ret;
+
+	ret = qmi_send_request(&pdr->servreg_client, &pdr->servreg_addr,
+			       &txn, SERVREG_RESTART_PD_REQ,
+			       SERVREG_RESTART_PD_REQ_MAX_LEN,
+			       servreg_restart_pd_req_ei, &req);
+	if (ret < 0) {
+		qmi_txn_cancel(&txn);
+		return ret;
+	}
+
+	ret = qmi_txn_wait(&txn, 5 * HZ);
+	if (ret < 0) {
+		pr_err("PDR: %s PD restart txn wait failed: %d\n",
+		       pds->service_path, ret);
+		return ret;
+	}
+
+	/* Check response if PDR is disabled */
+	if (resp.resp.result == QMI_RESULT_FAILURE_V01 &&
+	    resp.resp.error == QMI_ERR_DISABLED_V01) {
+		pr_err("PDR: %s PD restart is disabled: 0x%x\n",
+		       pds->service_path, resp.resp.error);
+		return -EOPNOTSUPP;
+	}
+
+	/* Check the response for other error case*/
+	if (resp.resp.result != QMI_RESULT_SUCCESS_V01) {
+		pr_err("PDR: %s request for PD restart failed: 0x%x\n",
+		       pds->service_path, resp.resp.error);
+		return -EREMOTEIO;
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL(pdr_restart_pd);
+
+/**
+ * pdr_handle_init() - initialize the PDR client handle
+ * @pdr:	PDR client handle
+ * @status:	function to be called on PD state change
+ *
+ * Initializes the PDR client handle to allow for tracking/restart of PDs.
+ *
+ * Return: 0 on success, negative errno on failure.
+ */
+int pdr_handle_init(struct pdr_handle *pdr,
+		    void (*status)(struct pdr_handle *pdr,
+				   struct pdr_service *pds))
+{
+	int ret;
+
+	if (!status)
+		return -EINVAL;
+
+	pdr->status = *status;
+
+	mutex_init(&pdr->locator_lock);
+	mutex_init(&pdr->list_lock);
+	mutex_init(&pdr->status_lock);
+
+	INIT_LIST_HEAD(&pdr->lookups);
+	INIT_LIST_HEAD(&pdr->indack_list);
+
+	INIT_WORK(&pdr->servloc_work, pdr_servloc_work);
+	INIT_WORK(&pdr->servreg_work, pdr_servreg_work);
+	INIT_WORK(&pdr->indack_work, pdr_indack_work);
+
+	pdr->servreg_wq = create_singlethread_workqueue("pdr_servreg_wq");
+	if (!pdr->servreg_wq)
+		return -ENOMEM;
+
+	pdr->indack_wq = alloc_ordered_workqueue("pdr_indack_wq", WQ_HIGHPRI);
+	if (!pdr->indack_wq) {
+		ret = -ENOMEM;
+		goto destroy_servreg;
+	}
+
+	ret = qmi_handle_init(&pdr->servloc_client,
+			      SERVREG_GET_DOMAIN_LIST_RESP_MAX_LEN,
+			      &service_locator_ops, NULL);
+	if (ret < 0)
+		goto destroy_indack;
+
+	ret = qmi_handle_init(&pdr->servreg_client,
+			      SERVREG_STATE_UPDATED_IND_MAX_LEN,
+			      &service_notifier_ops, qmi_indication_handler);
+	if (ret < 0)
+		goto release_handle;
+
+	qmi_add_lookup(&pdr->servloc_client, SERVREG_LOCATOR_SERVICE, 1, 1);
+
+	return 0;
+
+release_handle:
+	qmi_handle_release(&pdr->servloc_client);
+destroy_indack:
+	destroy_workqueue(pdr->indack_wq);
+destroy_servreg:
+	destroy_workqueue(pdr->servreg_wq);
+
+	return ret;
+}
+EXPORT_SYMBOL(pdr_handle_init);
+
+/**
+ * pdr_handle_release() - release the PDR client handle
+ * @pdr:	PDR client handle
+ *
+ * Cleans up pending tracking requests and releases the underlying qmi handles.
+ */
+void pdr_handle_release(struct pdr_handle *pdr)
+{
+	struct pdr_service *pds, *tmp;
+
+	mutex_lock(&pdr->list_lock);
+	list_for_each_entry_safe(pds, tmp, &pdr->lookups, node) {
+		list_del(&pds->node);
+		kfree(pds);
+	}
+	mutex_unlock(&pdr->list_lock);
+
+	cancel_work_sync(&pdr->servloc_work);
+	cancel_work_sync(&pdr->servreg_work);
+	cancel_work_sync(&pdr->indack_work);
+
+	destroy_workqueue(pdr->servreg_wq);
+	destroy_workqueue(pdr->indack_wq);
+
+	qmi_handle_release(&pdr->servloc_client);
+	qmi_handle_release(&pdr->servreg_client);
+}
+EXPORT_SYMBOL(pdr_handle_release);
diff --git a/drivers/soc/qcom/pdr_internal.h b/drivers/soc/qcom/pdr_internal.h
new file mode 100644
index 0000000000000..adaf85d509507
--- /dev/null
+++ b/drivers/soc/qcom/pdr_internal.h
@@ -0,0 +1,375 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#include <linux/soc/qcom/pdr.h>
+
+#define SERVREG_LOCATOR_SERVICE				0x40
+#define SERVREG_NOTIFIER_SERVICE			0x42
+
+#define SERVREG_REGISTER_LISTENER_REQ			0x20
+#define SERVREG_GET_DOMAIN_LIST_REQ			0x21
+#define SERVREG_STATE_UPDATED_IND_ID			0x22
+#define SERVREG_SET_ACK_REQ				0x23
+#define SERVREG_RESTART_PD_REQ				0x24
+
+#define SERVREG_DOMAIN_LIST_LENGTH			32
+#define SERVREG_RESTART_PD_REQ_MAX_LEN			67
+#define SERVREG_REGISTER_LISTENER_REQ_LEN		71
+#define SERVREG_SET_ACK_REQ_LEN				72
+#define SERVREG_GET_DOMAIN_LIST_REQ_MAX_LEN		74
+#define SERVREG_STATE_UPDATED_IND_MAX_LEN		79
+#define SERVREG_GET_DOMAIN_LIST_RESP_MAX_LEN		2389
+
+struct servreg_location_entry {
+	char name[SERVREG_NAME_LENGTH + 1];
+	u8 service_data_valid;
+	u32 service_data;
+	u32 instance;
+};
+
+struct qmi_elem_info servreg_location_entry_ei[] = {
+	{
+		.data_type      = QMI_STRING,
+		.elem_len       = SERVREG_NAME_LENGTH + 1,
+		.elem_size      = sizeof(char),
+		.array_type	= NO_ARRAY,
+		.tlv_type       = 0,
+		.offset         = offsetof(struct servreg_location_entry,
+					   name),
+	},
+	{
+		.data_type      = QMI_UNSIGNED_4_BYTE,
+		.elem_len       = 1,
+		.elem_size      = sizeof(u32),
+		.array_type	= NO_ARRAY,
+		.tlv_type       = 0,
+		.offset         = offsetof(struct servreg_location_entry,
+					   instance),
+	},
+	{
+		.data_type      = QMI_UNSIGNED_1_BYTE,
+		.elem_len       = 1,
+		.elem_size      = sizeof(u8),
+		.array_type	= NO_ARRAY,
+		.tlv_type       = 0,
+		.offset         = offsetof(struct servreg_location_entry,
+					   service_data_valid),
+	},
+	{
+		.data_type      = QMI_UNSIGNED_4_BYTE,
+		.elem_len       = 1,
+		.elem_size      = sizeof(u32),
+		.array_type	= NO_ARRAY,
+		.tlv_type       = 0,
+		.offset         = offsetof(struct servreg_location_entry,
+					   service_data),
+	},
+	{}
+};
+
+struct servreg_get_domain_list_req {
+	char service_name[SERVREG_NAME_LENGTH + 1];
+	u8 domain_offset_valid;
+	u32 domain_offset;
+};
+
+struct qmi_elem_info servreg_get_domain_list_req_ei[] = {
+	{
+		.data_type      = QMI_STRING,
+		.elem_len       = SERVREG_NAME_LENGTH + 1,
+		.elem_size      = sizeof(char),
+		.array_type	= NO_ARRAY,
+		.tlv_type       = 0x01,
+		.offset         = offsetof(struct servreg_get_domain_list_req,
+					   service_name),
+	},
+	{
+		.data_type      = QMI_OPT_FLAG,
+		.elem_len       = 1,
+		.elem_size      = sizeof(u8),
+		.array_type	= NO_ARRAY,
+		.tlv_type       = 0x10,
+		.offset         = offsetof(struct servreg_get_domain_list_req,
+					   domain_offset_valid),
+	},
+	{
+		.data_type      = QMI_UNSIGNED_4_BYTE,
+		.elem_len       = 1,
+		.elem_size      = sizeof(u32),
+		.array_type	= NO_ARRAY,
+		.tlv_type       = 0x10,
+		.offset         = offsetof(struct servreg_get_domain_list_req,
+					   domain_offset),
+	},
+	{}
+};
+
+struct servreg_get_domain_list_resp {
+	struct qmi_response_type_v01 resp;
+	u8 total_domains_valid;
+	u16 total_domains;
+	u8 db_rev_count_valid;
+	u16 db_rev_count;
+	u8 domain_list_valid;
+	u32 domain_list_len;
+	struct servreg_location_entry domain_list[SERVREG_DOMAIN_LIST_LENGTH];
+};
+
+struct qmi_elem_info servreg_get_domain_list_resp_ei[] = {
+	{
+		.data_type      = QMI_STRUCT,
+		.elem_len       = 1,
+		.elem_size      = sizeof(struct qmi_response_type_v01),
+		.array_type	= NO_ARRAY,
+		.tlv_type       = 0x02,
+		.offset         = offsetof(struct servreg_get_domain_list_resp,
+					   resp),
+		.ei_array      = qmi_response_type_v01_ei,
+	},
+	{
+		.data_type      = QMI_OPT_FLAG,
+		.elem_len       = 1,
+		.elem_size      = sizeof(u8),
+		.array_type	= NO_ARRAY,
+		.tlv_type       = 0x10,
+		.offset         = offsetof(struct servreg_get_domain_list_resp,
+					   total_domains_valid),
+	},
+	{
+		.data_type      = QMI_UNSIGNED_2_BYTE,
+		.elem_len       = 1,
+		.elem_size      = sizeof(u16),
+		.array_type	= NO_ARRAY,
+		.tlv_type       = 0x10,
+		.offset         = offsetof(struct servreg_get_domain_list_resp,
+					   total_domains),
+	},
+	{
+		.data_type      = QMI_OPT_FLAG,
+		.elem_len       = 1,
+		.elem_size      = sizeof(u8),
+		.array_type	= NO_ARRAY,
+		.tlv_type       = 0x11,
+		.offset         = offsetof(struct servreg_get_domain_list_resp,
+					   db_rev_count_valid),
+	},
+	{
+		.data_type      = QMI_UNSIGNED_2_BYTE,
+		.elem_len       = 1,
+		.elem_size      = sizeof(u16),
+		.array_type	= NO_ARRAY,
+		.tlv_type       = 0x11,
+		.offset         = offsetof(struct servreg_get_domain_list_resp,
+					   db_rev_count),
+	},
+	{
+		.data_type      = QMI_OPT_FLAG,
+		.elem_len       = 1,
+		.elem_size      = sizeof(u8),
+		.array_type	= NO_ARRAY,
+		.tlv_type       = 0x12,
+		.offset         = offsetof(struct servreg_get_domain_list_resp,
+					   domain_list_valid),
+	},
+	{
+		.data_type      = QMI_DATA_LEN,
+		.elem_len       = 1,
+		.elem_size      = sizeof(u8),
+		.array_type	= NO_ARRAY,
+		.tlv_type       = 0x12,
+		.offset         = offsetof(struct servreg_get_domain_list_resp,
+					   domain_list_len),
+	},
+	{
+		.data_type      = QMI_STRUCT,
+		.elem_len       = SERVREG_DOMAIN_LIST_LENGTH,
+		.elem_size      = sizeof(struct servreg_location_entry),
+		.array_type	= NO_ARRAY,
+		.tlv_type       = 0x12,
+		.offset         = offsetof(struct servreg_get_domain_list_resp,
+					   domain_list),
+		.ei_array      = servreg_location_entry_ei,
+	},
+	{}
+};
+
+struct servreg_register_listener_req {
+	u8 enable;
+	char service_path[SERVREG_NAME_LENGTH + 1];
+};
+
+struct qmi_elem_info servreg_register_listener_req_ei[] = {
+	{
+		.data_type      = QMI_UNSIGNED_1_BYTE,
+		.elem_len       = 1,
+		.elem_size      = sizeof(u8),
+		.array_type	= NO_ARRAY,
+		.tlv_type       = 0x01,
+		.offset         = offsetof(struct servreg_register_listener_req,
+					   enable),
+	},
+	{
+		.data_type      = QMI_STRING,
+		.elem_len       = SERVREG_NAME_LENGTH + 1,
+		.elem_size      = sizeof(char),
+		.array_type	= NO_ARRAY,
+		.tlv_type       = 0x02,
+		.offset         = offsetof(struct servreg_register_listener_req,
+					   service_path),
+	},
+	{}
+};
+
+struct servreg_register_listener_resp {
+	struct qmi_response_type_v01 resp;
+	u8 curr_state_valid;
+	enum servreg_service_state curr_state;
+};
+
+struct qmi_elem_info servreg_register_listener_resp_ei[] = {
+	{
+		.data_type      = QMI_STRUCT,
+		.elem_len       = 1,
+		.elem_size      = sizeof(struct qmi_response_type_v01),
+		.array_type	= NO_ARRAY,
+		.tlv_type       = 0x02,
+		.offset         = offsetof(struct servreg_register_listener_resp,
+					   resp),
+		.ei_array      = qmi_response_type_v01_ei,
+	},
+	{
+		.data_type      = QMI_OPT_FLAG,
+		.elem_len       = 1,
+		.elem_size      = sizeof(u8),
+		.array_type	= NO_ARRAY,
+		.tlv_type       = 0x10,
+		.offset         = offsetof(struct servreg_register_listener_resp,
+					   curr_state_valid),
+	},
+	{
+		.data_type      = QMI_SIGNED_4_BYTE_ENUM,
+		.elem_len       = 1,
+		.elem_size      = sizeof(enum servreg_service_state),
+		.array_type	= NO_ARRAY,
+		.tlv_type       = 0x10,
+		.offset         = offsetof(struct servreg_register_listener_resp,
+					   curr_state),
+	},
+	{}
+};
+
+struct servreg_restart_pd_req {
+	char service_path[SERVREG_NAME_LENGTH + 1];
+};
+
+struct qmi_elem_info servreg_restart_pd_req_ei[] = {
+	{
+		.data_type      = QMI_STRING,
+		.elem_len       = SERVREG_NAME_LENGTH + 1,
+		.elem_size      = sizeof(char),
+		.array_type	= NO_ARRAY,
+		.tlv_type       = 0x01,
+		.offset         = offsetof(struct servreg_restart_pd_req,
+					   service_path),
+	},
+	{}
+};
+
+struct servreg_restart_pd_resp {
+	struct qmi_response_type_v01 resp;
+};
+
+struct qmi_elem_info servreg_restart_pd_resp_ei[] = {
+	{
+		.data_type      = QMI_STRUCT,
+		.elem_len       = 1,
+		.elem_size      = sizeof(struct qmi_response_type_v01),
+		.array_type	= NO_ARRAY,
+		.tlv_type       = 0x02,
+		.offset         = offsetof(struct servreg_restart_pd_resp,
+					   resp),
+		.ei_array      = qmi_response_type_v01_ei,
+	},
+	{}
+};
+
+struct servreg_state_updated_ind {
+	enum servreg_service_state curr_state;
+	char service_path[SERVREG_NAME_LENGTH + 1];
+	u16 transaction_id;
+};
+
+struct qmi_elem_info servreg_state_updated_ind_ei[] = {
+	{
+		.data_type      = QMI_SIGNED_4_BYTE_ENUM,
+		.elem_len       = 1,
+		.elem_size      = sizeof(u32),
+		.array_type	= NO_ARRAY,
+		.tlv_type       = 0x01,
+		.offset         = offsetof(struct servreg_state_updated_ind,
+					   curr_state),
+	},
+	{
+		.data_type      = QMI_STRING,
+		.elem_len       = SERVREG_NAME_LENGTH + 1,
+		.elem_size      = sizeof(char),
+		.array_type	= NO_ARRAY,
+		.tlv_type       = 0x02,
+		.offset         = offsetof(struct servreg_state_updated_ind,
+					   service_path),
+	},
+	{
+		.data_type      = QMI_UNSIGNED_2_BYTE,
+		.elem_len       = 1,
+		.elem_size      = sizeof(u16),
+		.array_type	= NO_ARRAY,
+		.tlv_type       = 0x03,
+		.offset         = offsetof(struct servreg_state_updated_ind,
+					   transaction_id),
+	},
+	{}
+};
+
+struct servreg_set_ack_req {
+	char service_path[SERVREG_NAME_LENGTH + 1];
+	u16 transaction_id;
+};
+
+struct qmi_elem_info servreg_set_ack_req_ei[] = {
+	{
+		.data_type      = QMI_STRING,
+		.elem_len       = SERVREG_NAME_LENGTH + 1,
+		.elem_size      = sizeof(char),
+		.array_type	= NO_ARRAY,
+		.tlv_type       = 0x01,
+		.offset         = offsetof(struct servreg_set_ack_req,
+					   service_path),
+	},
+	{
+		.data_type      = QMI_UNSIGNED_2_BYTE,
+		.elem_len       = 1,
+		.elem_size      = sizeof(u16),
+		.array_type	= NO_ARRAY,
+		.tlv_type       = 0x02,
+		.offset         = offsetof(struct servreg_set_ack_req,
+					   transaction_id),
+	},
+	{}
+};
+
+struct servreg_set_ack_resp {
+	struct qmi_response_type_v01 resp;
+};
+
+struct qmi_elem_info servreg_set_ack_resp_ei[] = {
+	{
+		.data_type      = QMI_STRUCT,
+		.elem_len       = 1,
+		.elem_size      = sizeof(struct qmi_response_type_v01),
+		.array_type	= NO_ARRAY,
+		.tlv_type       = 0x02,
+		.offset         = offsetof(struct servreg_set_ack_resp,
+					   resp),
+		.ei_array       = qmi_response_type_v01_ei,
+	},
+	{}
+};
diff --git a/include/linux/soc/qcom/pdr.h b/include/linux/soc/qcom/pdr.h
new file mode 100644
index 0000000000000..7d48531705ac3
--- /dev/null
+++ b/include/linux/soc/qcom/pdr.h
@@ -0,0 +1,109 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __QCOM_PDR_HELPER__
+#define __QCOM_PDR_HELPER__
+
+#include <linux/soc/qcom/qmi.h>
+
+#define SERVREG_NAME_LENGTH	64
+
+enum servreg_service_state {
+	SERVREG_LOCATOR_ERR = 0x1,
+	SERVREG_LOCATOR_UNKNOWN_SERVICE = 0x2,
+	SERVREG_LOCATOR_DB_UPDATED = 0x3,
+	SERVREG_SERVICE_STATE_DOWN = 0x0FFFFFFF,
+	SERVREG_SERVICE_STATE_UP = 0x1FFFFFFF,
+	SERVREG_SERVICE_STATE_EARLY_DOWN = 0x2FFFFFFF,
+	SERVREG_SERVICE_STATE_UNINIT = 0x7FFFFFFF,
+};
+
+/**
+ * struct pdr_service - context to track lookups/restarts
+ * @service_name:		name of the service running on the PD
+ * @service_path:		service path of the PD
+ * @service_data_valid:		indicates if service_data field has valid data
+ * @service_data:		service data provided by servreg_locator service
+ * @need_servreg_lookup:	state flag for tracking servreg lookup requests
+ * @need_servreg_register:	state flag for tracking pending servreg register
+ * @need_servreg_remove:	state flag for tracking pending servreg remove
+ * @service_connected:		current state of servreg_notifier qmi service
+ * @state:			current state of PD
+ * @service:			servreg_notifer service type
+ * @instance:			instance id of the @service
+ * @priv:			handle for client's use
+ * @node:			list_head for house keeping
+ */
+struct pdr_service {
+	char service_name[SERVREG_NAME_LENGTH + 1];
+	char service_path[SERVREG_NAME_LENGTH + 1];
+
+	u8 service_data_valid;
+	u32 service_data;
+
+	bool need_servreg_lookup;
+	bool need_servreg_register;
+	bool need_servreg_remove;
+	bool service_connected;
+	int state;
+
+	unsigned int instance;
+	unsigned int service;
+
+	void *priv;
+	struct list_head node;
+};
+
+/**
+ * struct pdr_handle - PDR context
+ * @servloc_client:	servreg_locator qmi handle
+ * @servreg_client:	servreg_notifier qmi handle
+ * @servloc_addr:	socket addr of @servloc_client
+ * @servreg_addr:	socket addr of @servreg_client
+ * @lookups:		list of lookup requests
+ * @indack_list:	list of qmi indications from servreg_notifier services
+ * @list_lock:		lock for modifications of lists
+ * @status_lock:	lock to serialize pd status call back
+ * @locator_lock:	lock for the shared locator state flag
+ * @locator_available:	state flag to track servreg_locator service
+ * @servloc_work:	work for handling lookup requests
+ * @servreg_work:	work for registering with servreg_notifier service
+ * @indack_work:	work for acking the qmi indications
+ * @servreg_wq:		work queue to post @servreg_work and @servdel_work on
+ * @indack_wq:		work queue to post @indack_work on
+ * @status:		callback to inform the client on PD service state change
+ */
+struct pdr_handle {
+	struct qmi_handle servloc_client;
+	struct qmi_handle servreg_client;
+
+	struct sockaddr_qrtr servloc_addr;
+	struct sockaddr_qrtr servreg_addr;
+
+	struct list_head lookups;
+	struct list_head indack_list;
+
+	/* control access to pdr lookup list */
+	struct mutex list_lock;
+
+	/* serialize pd status invocation */
+	struct mutex status_lock;
+
+	/* control access to service locator state */
+	struct mutex locator_lock;
+	bool locator_available;
+
+	struct work_struct servloc_work;
+	struct work_struct servreg_work;
+	struct work_struct indack_work;
+
+	struct workqueue_struct *servreg_wq;
+	struct workqueue_struct *indack_wq;
+
+	void (*status)(struct pdr_handle *pdr, struct pdr_service *pds);
+};
+
+int pdr_handle_init(struct pdr_handle *pdr, void (*status)(struct pdr_handle *pdr, struct pdr_service *pds));
+int pdr_add_lookup(struct pdr_handle *pdr, const char *service_name, const char *service_path);
+int pdr_restart_pd(struct pdr_handle *pdr, const char *service_path);
+void pdr_handle_release(struct pdr_handle *pdr);
+
+#endif
diff --git a/include/linux/soc/qcom/qmi.h b/include/linux/soc/qcom/qmi.h
index 5efa2b67fa557..e712f94b89fcc 100644
--- a/include/linux/soc/qcom/qmi.h
+++ b/include/linux/soc/qcom/qmi.h
@@ -88,6 +88,7 @@ struct qmi_elem_info {
 #define QMI_ERR_CLIENT_IDS_EXHAUSTED_V01	5
 #define QMI_ERR_INVALID_ID_V01			41
 #define QMI_ERR_ENCODING_V01			58
+#define QMI_ERR_DISABLED_V01                    69
 #define QMI_ERR_INCOMPATIBLE_STATE_V01		90
 #define QMI_ERR_NOT_SUPPORTED_V01		94
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
