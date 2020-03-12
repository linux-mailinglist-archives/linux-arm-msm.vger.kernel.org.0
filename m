Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92167182FF0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2020 13:09:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727192AbgCLMJY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Mar 2020 08:09:24 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:12782 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726044AbgCLMJY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Mar 2020 08:09:24 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1584014962; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=8NxxgT/TbD7uFmaL2zHm5Ht/bOXWcRgQHCbWqIbAq1I=; b=BMlZnR+oJ/gF/QarYRyETStd174i8bTSSzR/LG1bmYExEgn6xDSHO/i0eb8NVERyTLGysnDF
 wk+1rPfDPgiytIRcKquVo3uNB2lqTYwTwBBP0s7B6jN0G4l9qkIz4nxPOcqbdqkEjZdwReGr
 XqimjRqZoM8QNYCIf/2k0OTNDTo=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e6a265f.7f675e39fb90-smtp-out-n02;
 Thu, 12 Mar 2020 12:09:03 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C70C0C432C2; Thu, 12 Mar 2020 12:09:02 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-87.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 86116C43636;
        Thu, 12 Mar 2020 12:08:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 86116C43636
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     bjorn.andersson@linaro.org, srinivas.kandagatla@linaro.org
Cc:     agross@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        tsoni@codeaurora.org, vnkgutta@codeaurora.org,
        Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v7 1/3] soc: qcom: Introduce Protection Domain Restart helpers
Date:   Thu, 12 Mar 2020 17:38:40 +0530
Message-Id: <20200312120842.21991-2-sibis@codeaurora.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200312120842.21991-1-sibis@codeaurora.org>
References: <20200312120842.21991-1-sibis@codeaurora.org>
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

V7:
 * Address Bjorn's comments on exiting early in pdr_locator_work 
 * SERVREG_LOCATOR_UNKNOWN_SERVICE is no longer propagated to
   clients allowing for lookups to recover on restarting pd-mapper
   with the proper database.
 * Non-recoverable SERVREG_LOCATOR_ERR errors are still communicated
   to the clients.

V6:
 * Fix minor compilation error introduceed in v5
   while propagating error from pdr_register_listener

 drivers/soc/qcom/Kconfig         |   4 +
 drivers/soc/qcom/Makefile        |   1 +
 drivers/soc/qcom/pdr_interface.c | 757 +++++++++++++++++++++++++++++++
 drivers/soc/qcom/pdr_internal.h  | 379 ++++++++++++++++
 include/linux/soc/qcom/pdr.h     |  29 ++
 include/linux/soc/qcom/qmi.h     |   1 +
 6 files changed, 1171 insertions(+)
 create mode 100644 drivers/soc/qcom/pdr_interface.c
 create mode 100644 drivers/soc/qcom/pdr_internal.h
 create mode 100644 include/linux/soc/qcom/pdr.h

diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index 80aa8b6c56e0d..48501f0245b0a 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -76,6 +76,10 @@ config QCOM_OCMEM
 	  requirements. This is typically used by the GPU, camera/video, and
 	  audio components on some Snapdragon SoCs.
 
+config QCOM_PDR_HELPERS
+	tristate
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
index 0000000000000..7ee088b9cc7cd
--- /dev/null
+++ b/drivers/soc/qcom/pdr_interface.c
@@ -0,0 +1,757 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2020 The Linux Foundation. All rights reserved.
+ */
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/string.h>
+#include <linux/workqueue.h>
+
+#include "pdr_internal.h"
+
+struct pdr_service {
+	char service_name[SERVREG_NAME_LENGTH + 1];
+	char service_path[SERVREG_NAME_LENGTH + 1];
+
+	struct sockaddr_qrtr addr;
+
+	unsigned int instance;
+	unsigned int service;
+	u8 service_data_valid;
+	u32 service_data;
+	int state;
+
+	bool need_notifier_register;
+	bool need_notifier_remove;
+	bool need_locator_lookup;
+	bool service_connected;
+
+	struct list_head node;
+};
+
+struct pdr_handle {
+	struct qmi_handle locator_hdl;
+	struct qmi_handle notifier_hdl;
+
+	struct sockaddr_qrtr locator_addr;
+
+	struct list_head lookups;
+	struct list_head indack_list;
+
+	/* control access to pdr lookup/indack lists */
+	struct mutex list_lock;
+
+	/* serialize pd status invocation */
+	struct mutex status_lock;
+
+	/* control access to the locator state */
+	struct mutex lock;
+
+	bool locator_init_complete;
+
+	struct work_struct locator_work;
+	struct work_struct notifier_work;
+	struct work_struct indack_work;
+
+	struct workqueue_struct *notifier_wq;
+	struct workqueue_struct *indack_wq;
+
+	void (*status)(int state, char *service_path, void *priv);
+	void *priv;
+};
+
+struct pdr_list_node {
+	enum servreg_service_state curr_state;
+	u16 transaction_id;
+	struct pdr_service *pds;
+	struct list_head node;
+};
+
+static int pdr_locator_new_server(struct qmi_handle *qmi,
+				  struct qmi_service *svc)
+{
+	struct pdr_handle *pdr = container_of(qmi, struct pdr_handle,
+					      locator_hdl);
+	struct pdr_service *pds;
+
+	/* Create a local client port for QMI communication */
+	pdr->locator_addr.sq_family = AF_QIPCRTR;
+	pdr->locator_addr.sq_node = svc->node;
+	pdr->locator_addr.sq_port = svc->port;
+
+	mutex_lock(&pdr->lock);
+	pdr->locator_init_complete = true;
+	mutex_unlock(&pdr->lock);
+
+	/* Service pending lookup requests */
+	mutex_lock(&pdr->list_lock);
+	list_for_each_entry(pds, &pdr->lookups, node) {
+		if (pds->need_locator_lookup)
+			schedule_work(&pdr->locator_work);
+	}
+	mutex_unlock(&pdr->list_lock);
+
+	return 0;
+}
+
+static void pdr_locator_del_server(struct qmi_handle *qmi,
+				   struct qmi_service *svc)
+{
+	struct pdr_handle *pdr = container_of(qmi, struct pdr_handle,
+					      locator_hdl);
+
+	mutex_lock(&pdr->lock);
+	pdr->locator_init_complete = false;
+	mutex_unlock(&pdr->lock);
+
+	pdr->locator_addr.sq_node = 0;
+	pdr->locator_addr.sq_port = 0;
+}
+
+static struct qmi_ops pdr_locator_ops = {
+	.new_server = pdr_locator_new_server,
+	.del_server = pdr_locator_del_server,
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
+	ret = qmi_txn_init(&pdr->notifier_hdl, &txn,
+			   servreg_register_listener_resp_ei,
+			   &resp);
+	if (ret < 0)
+		return ret;
+
+	req.enable = enable;
+	strcpy(req.service_path, pds->service_path);
+
+	ret = qmi_send_request(&pdr->notifier_hdl, &pds->addr,
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
+static void pdr_notifier_work(struct work_struct *work)
+{
+	struct pdr_handle *pdr = container_of(work, struct pdr_handle,
+					      notifier_work);
+	struct pdr_service *pds;
+	int ret;
+
+	mutex_lock(&pdr->list_lock);
+	list_for_each_entry(pds, &pdr->lookups, node) {
+		if (pds->service_connected) {
+			if (!pds->need_notifier_register)
+				continue;
+
+			pds->need_notifier_register = false;
+			ret = pdr_register_listener(pdr, pds, true);
+			if (ret < 0)
+				pds->state = SERVREG_SERVICE_STATE_DOWN;
+		} else {
+			if (!pds->need_notifier_remove)
+				continue;
+
+			pds->need_notifier_remove = false;
+			pds->state = SERVREG_SERVICE_STATE_DOWN;
+		}
+
+		mutex_lock(&pdr->status_lock);
+		pdr->status(pds->state, pds->service_path, pdr->priv);
+		mutex_unlock(&pdr->status_lock);
+	}
+	mutex_unlock(&pdr->list_lock);
+}
+
+static int pdr_notifier_new_server(struct qmi_handle *qmi,
+				   struct qmi_service *svc)
+{
+	struct pdr_handle *pdr = container_of(qmi, struct pdr_handle,
+					      notifier_hdl);
+	struct pdr_service *pds;
+
+	mutex_lock(&pdr->list_lock);
+	list_for_each_entry(pds, &pdr->lookups, node) {
+		if (pds->service == svc->service &&
+		    pds->instance == svc->instance) {
+			pds->service_connected = true;
+			pds->need_notifier_register = true;
+			pds->addr.sq_family = AF_QIPCRTR;
+			pds->addr.sq_node = svc->node;
+			pds->addr.sq_port = svc->port;
+			queue_work(pdr->notifier_wq, &pdr->notifier_work);
+		}
+	}
+	mutex_unlock(&pdr->list_lock);
+
+	return 0;
+}
+
+static void pdr_notifier_del_server(struct qmi_handle *qmi,
+				    struct qmi_service *svc)
+{
+	struct pdr_handle *pdr = container_of(qmi, struct pdr_handle,
+					      notifier_hdl);
+	struct pdr_service *pds;
+
+	mutex_lock(&pdr->list_lock);
+	list_for_each_entry(pds, &pdr->lookups, node) {
+		if (pds->service == svc->service &&
+		    pds->instance == svc->instance) {
+			pds->service_connected = false;
+			pds->need_notifier_remove = true;
+			pds->addr.sq_node = 0;
+			pds->addr.sq_port = 0;
+			queue_work(pdr->notifier_wq, &pdr->notifier_work);
+		}
+	}
+	mutex_unlock(&pdr->list_lock);
+}
+
+static struct qmi_ops pdr_notifier_ops = {
+	.new_server = pdr_notifier_new_server,
+	.del_server = pdr_notifier_del_server,
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
+	ret = qmi_txn_init(&pdr->notifier_hdl, &txn, servreg_set_ack_resp_ei,
+			   &resp);
+	if (ret < 0)
+		return ret;
+
+	req.transaction_id = tid;
+	strcpy(req.service_path, pds->service_path);
+
+	ret = qmi_send_request(&pdr->notifier_hdl, &pds->addr,
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
+
+		mutex_lock(&pdr->status_lock);
+		pds->state = ind->curr_state;
+		pdr->status(pds->state, pds->service_path, pdr->priv);
+		mutex_unlock(&pdr->status_lock);
+
+		mutex_lock(&pdr->list_lock);
+		list_del(&ind->node);
+		mutex_unlock(&pdr->list_lock);
+
+		kfree(ind);
+	}
+}
+
+static void pdr_indication_cb(struct qmi_handle *qmi,
+			      struct sockaddr_qrtr *sq,
+			      struct qmi_txn *txn, const void *data)
+{
+	struct pdr_handle *pdr = container_of(qmi, struct pdr_handle,
+					      notifier_hdl);
+	const struct servreg_state_updated_ind *ind_msg = data;
+	struct pdr_list_node *ind;
+	struct pdr_service *pds;
+	bool found;
+
+	if (!ind_msg || !ind_msg->service_path[0] ||
+	    strlen(ind_msg->service_path) > SERVREG_NAME_LENGTH)
+		return;
+
+	mutex_lock(&pdr->list_lock);
+	list_for_each_entry(pds, &pdr->lookups, node) {
+		if (strcmp(pds->service_path, ind_msg->service_path))
+			continue;
+
+		found = true;
+		break;
+	}
+	mutex_unlock(&pdr->list_lock);
+
+	if (!found)
+		return;
+
+	pr_info("PDR: Indication received from %s, state: 0x%x, trans-id: %d\n",
+		ind_msg->service_path, ind_msg->curr_state,
+		ind_msg->transaction_id);
+
+	ind = kzalloc(sizeof(*ind), GFP_KERNEL);
+	if (!ind)
+		return;
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
+		.fn = pdr_indication_cb,
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
+	ret = qmi_txn_init(&pdr->locator_hdl, &txn,
+			   servreg_get_domain_list_resp_ei, resp);
+	if (ret < 0)
+		return ret;
+
+	ret = qmi_send_request(&pdr->locator_hdl,
+			       &pdr->locator_addr,
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
+	if (resp->resp.result != QMI_RESULT_SUCCESS_V01) {
+		pr_err("PDR: %s get domain list failed: 0x%x\n",
+		       req->service_name, resp->resp.error);
+		return -EREMOTEIO;
+	}
+
+	return 0;
+}
+
+static int pdr_locate_service(struct pdr_handle *pdr, struct pdr_service *pds)
+{
+	struct servreg_get_domain_list_resp *resp;
+	struct servreg_get_domain_list_req req;
+	struct servreg_location_entry *entry;
+	int domains_read = 0;
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
+static void pdr_notify_lookup_failure(struct pdr_handle *pdr,
+				      struct pdr_service *pds,
+				      int err)
+{
+	pr_err("PDR: service lookup for %s failed: %d\n",
+	       pds->service_name, err);
+
+	if (err == -ENXIO)
+		return;
+
+	list_del(&pds->node);
+	pds->state = SERVREG_LOCATOR_ERR;
+	mutex_lock(&pdr->status_lock);
+	pdr->status(pds->state, pds->service_path, pdr->priv);
+	mutex_unlock(&pdr->status_lock);
+	kfree(pds);
+}
+
+static void pdr_locator_work(struct work_struct *work)
+{
+	struct pdr_handle *pdr = container_of(work, struct pdr_handle,
+					      locator_work);
+	struct pdr_service *pds, *tmp;
+	int ret = 0;
+
+	/* Bail out early if the SERVREG LOCATOR QMI service is not up */
+	mutex_lock(&pdr->lock);
+	if (!pdr->locator_init_complete) {
+		mutex_unlock(&pdr->lock);
+		pr_debug("PDR: SERVICE LOCATOR service not available\n");
+		return;
+	}
+	mutex_unlock(&pdr->lock);
+
+	mutex_lock(&pdr->list_lock);
+	list_for_each_entry_safe(pds, tmp, &pdr->lookups, node) {
+		if (!pds->need_locator_lookup)
+			continue;
+
+		ret = pdr_locate_service(pdr, pds);
+		if (ret < 0) {
+			pdr_notify_lookup_failure(pdr, pds, ret);
+			continue;
+		}
+
+		ret = qmi_add_lookup(&pdr->notifier_hdl, pds->service, 1,
+				     pds->instance);
+		if (ret < 0) {
+			pdr_notify_lookup_failure(pdr, pds, ret);
+			continue;
+		}
+
+		pds->need_locator_lookup = false;
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
+ * Return: pdr_service object on success, ERR_PTR on failure. -EALREADY is
+ * returned if a lookup is already in progress for the given service path.
+ */
+struct pdr_service *pdr_add_lookup(struct pdr_handle *pdr,
+				   const char *service_name,
+				   const char *service_path)
+{
+	struct pdr_service *pds, *tmp;
+	int ret;
+
+	if (IS_ERR_OR_NULL(pdr))
+		return ERR_PTR(-EINVAL);
+
+	if (!service_name || strlen(service_name) > SERVREG_NAME_LENGTH ||
+	    !service_path || strlen(service_path) > SERVREG_NAME_LENGTH)
+		return ERR_PTR(-EINVAL);
+
+	pds = kzalloc(sizeof(*pds), GFP_KERNEL);
+	if (!pds)
+		return ERR_PTR(-ENOMEM);
+
+	pds->service = SERVREG_NOTIFIER_SERVICE;
+	strcpy(pds->service_name, service_name);
+	strcpy(pds->service_path, service_path);
+	pds->need_locator_lookup = true;
+
+	mutex_lock(&pdr->list_lock);
+	list_for_each_entry(tmp, &pdr->lookups, node) {
+		if (strcmp(tmp->service_path, service_path))
+			continue;
+
+		mutex_unlock(&pdr->list_lock);
+		ret = -EALREADY;
+		goto err;
+	}
+
+	list_add(&pds->node, &pdr->lookups);
+	mutex_unlock(&pdr->list_lock);
+
+	schedule_work(&pdr->locator_work);
+
+	return pds;
+err:
+	kfree(pds);
+	return ERR_PTR(ret);
+}
+EXPORT_SYMBOL(pdr_add_lookup);
+
+/**
+ * pdr_restart_pd() - restart PD
+ * @pdr:	PDR client handle
+ * @pds:	PD service handle
+ *
+ * Restarts the PD tracked by the PDR client handle for a given service path.
+ *
+ * Return: 0 on success, negative errno on failure.
+ */
+int pdr_restart_pd(struct pdr_handle *pdr, struct pdr_service *pds)
+{
+	struct servreg_restart_pd_resp resp;
+	struct servreg_restart_pd_req req;
+	struct sockaddr_qrtr addr;
+	struct pdr_service *tmp;
+	struct qmi_txn txn;
+	int ret;
+
+	if (IS_ERR_OR_NULL(pdr) || IS_ERR_OR_NULL(pds))
+		return -EINVAL;
+
+	mutex_lock(&pdr->list_lock);
+	list_for_each_entry(tmp, &pdr->lookups, node) {
+		if (tmp != pds)
+			continue;
+
+		if (!pds->service_connected)
+			break;
+
+		/* Prepare req message */
+		strcpy(req.service_path, pds->service_path);
+		addr = pds->addr;
+		break;
+	}
+	mutex_unlock(&pdr->list_lock);
+
+	if (!req.service_path[0])
+		return -EINVAL;
+
+	ret = qmi_txn_init(&pdr->notifier_hdl, &txn,
+			   servreg_restart_pd_resp_ei,
+			   &resp);
+	if (ret < 0)
+		return ret;
+
+	ret = qmi_send_request(&pdr->notifier_hdl, &addr,
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
+		       req.service_path, ret);
+		return ret;
+	}
+
+	/* Check response if PDR is disabled */
+	if (resp.resp.result == QMI_RESULT_FAILURE_V01 &&
+	    resp.resp.error == QMI_ERR_DISABLED_V01) {
+		pr_err("PDR: %s PD restart is disabled: 0x%x\n",
+		       req.service_path, resp.resp.error);
+		return -EOPNOTSUPP;
+	}
+
+	/* Check the response for other error case*/
+	if (resp.resp.result != QMI_RESULT_SUCCESS_V01) {
+		pr_err("PDR: %s request for PD restart failed: 0x%x\n",
+		       req.service_path, resp.resp.error);
+		return -EREMOTEIO;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(pdr_restart_pd);
+
+/**
+ * pdr_handle_alloc() - initialize the PDR client handle
+ * @status:	function to be called on PD state change
+ * @priv:	handle for client's use
+ *
+ * Initializes the PDR client handle to allow for tracking/restart of PDs.
+ *
+ * Return: pdr_handle object on success, ERR_PTR on failure.
+ */
+struct pdr_handle *pdr_handle_alloc(void (*status)(int state,
+						   char *service_path,
+						   void *priv), void *priv)
+{
+	struct pdr_handle *pdr;
+	int ret;
+
+	if (!status)
+		return ERR_PTR(-EINVAL);
+
+	pdr = kzalloc(sizeof(*pdr), GFP_KERNEL);
+	if (!pdr)
+		return ERR_PTR(-ENOMEM);
+
+	pdr->status = status;
+	pdr->priv = priv;
+
+	mutex_init(&pdr->status_lock);
+	mutex_init(&pdr->list_lock);
+	mutex_init(&pdr->lock);
+
+	INIT_LIST_HEAD(&pdr->lookups);
+	INIT_LIST_HEAD(&pdr->indack_list);
+
+	INIT_WORK(&pdr->locator_work, pdr_locator_work);
+	INIT_WORK(&pdr->notifier_work, pdr_notifier_work);
+	INIT_WORK(&pdr->indack_work, pdr_indack_work);
+
+	pdr->notifier_wq = create_singlethread_workqueue("pdr_notifier_wq");
+	if (!pdr->notifier_wq) {
+		ret = -ENOMEM;
+		goto free_pdr_handle;
+	}
+
+	pdr->indack_wq = alloc_ordered_workqueue("pdr_indack_wq", WQ_HIGHPRI);
+	if (!pdr->indack_wq) {
+		ret = -ENOMEM;
+		goto destroy_notifier;
+	}
+
+	ret = qmi_handle_init(&pdr->locator_hdl,
+			      SERVREG_GET_DOMAIN_LIST_RESP_MAX_LEN,
+			      &pdr_locator_ops, NULL);
+	if (ret < 0)
+		goto destroy_indack;
+
+	ret = qmi_add_lookup(&pdr->locator_hdl, SERVREG_LOCATOR_SERVICE, 1, 1);
+	if (ret < 0)
+		goto release_qmi_handle;
+
+	ret = qmi_handle_init(&pdr->notifier_hdl,
+			      SERVREG_STATE_UPDATED_IND_MAX_LEN,
+			      &pdr_notifier_ops,
+			      qmi_indication_handler);
+	if (ret < 0)
+		goto release_qmi_handle;
+
+	return pdr;
+
+release_qmi_handle:
+	qmi_handle_release(&pdr->locator_hdl);
+destroy_indack:
+	destroy_workqueue(pdr->indack_wq);
+destroy_notifier:
+	destroy_workqueue(pdr->notifier_wq);
+free_pdr_handle:
+	kfree(pdr);
+
+	return ERR_PTR(ret);
+}
+EXPORT_SYMBOL(pdr_handle_alloc);
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
+	if (IS_ERR_OR_NULL(pdr))
+		return;
+
+	mutex_lock(&pdr->list_lock);
+	list_for_each_entry_safe(pds, tmp, &pdr->lookups, node) {
+		list_del(&pds->node);
+		kfree(pds);
+	}
+	mutex_unlock(&pdr->list_lock);
+
+	cancel_work_sync(&pdr->locator_work);
+	cancel_work_sync(&pdr->notifier_work);
+	cancel_work_sync(&pdr->indack_work);
+
+	destroy_workqueue(pdr->notifier_wq);
+	destroy_workqueue(pdr->indack_wq);
+
+	qmi_handle_release(&pdr->locator_hdl);
+	qmi_handle_release(&pdr->notifier_hdl);
+
+	kfree(pdr);
+}
+EXPORT_SYMBOL(pdr_handle_release);
+
+MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("Qualcomm Protection Domain Restart helpers");
diff --git a/drivers/soc/qcom/pdr_internal.h b/drivers/soc/qcom/pdr_internal.h
new file mode 100644
index 0000000000000..15b5002e4127b
--- /dev/null
+++ b/drivers/soc/qcom/pdr_internal.h
@@ -0,0 +1,379 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __QCOM_PDR_HELPER_INTERNAL__
+#define __QCOM_PDR_HELPER_INTERNAL__
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
+
+#endif
diff --git a/include/linux/soc/qcom/pdr.h b/include/linux/soc/qcom/pdr.h
new file mode 100644
index 0000000000000..83a8ea612e69a
--- /dev/null
+++ b/include/linux/soc/qcom/pdr.h
@@ -0,0 +1,29 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __QCOM_PDR_HELPER__
+#define __QCOM_PDR_HELPER__
+
+#include <linux/soc/qcom/qmi.h>
+
+#define SERVREG_NAME_LENGTH	64
+
+struct pdr_service;
+struct pdr_handle;
+
+enum servreg_service_state {
+	SERVREG_LOCATOR_ERR = 0x1,
+	SERVREG_SERVICE_STATE_DOWN = 0x0FFFFFFF,
+	SERVREG_SERVICE_STATE_UP = 0x1FFFFFFF,
+	SERVREG_SERVICE_STATE_EARLY_DOWN = 0x2FFFFFFF,
+	SERVREG_SERVICE_STATE_UNINIT = 0x7FFFFFFF,
+};
+
+struct pdr_handle *pdr_handle_alloc(void (*status)(int state,
+						   char *service_path,
+						   void *priv), void *priv);
+struct pdr_service *pdr_add_lookup(struct pdr_handle *pdr,
+				   const char *service_name,
+				   const char *service_path);
+int pdr_restart_pd(struct pdr_handle *pdr, struct pdr_service *pds);
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
