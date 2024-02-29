Return-Path: <linux-arm-msm+bounces-13038-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F7886D73A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Mar 2024 00:03:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 03D461C20E19
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Feb 2024 23:00:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62AC84F1EA;
	Thu, 29 Feb 2024 23:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wvCHKGA3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B9355E76
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Feb 2024 23:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709247638; cv=none; b=H5UjVq49gUgLD5oVAOf+uigIAIm2Iqc4tuGjob0Y7qzZUCH9kJqVfK3kFKd2+gbcRHSpjjMaCv+p66tIjF1zxY7lADRBZz0Fo5DNbtbuAc8iqyjdaGWxH9zd/yoCtvQTFZ10HG1AFRweLQcRGHr7KY6tzCHlxQrbG6nuZwKc6e0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709247638; c=relaxed/simple;
	bh=K9GqjLgfHTc/8Gz1gmevD5qMTp6Gdlgrodn4O4bzT2M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nqECtRZnLrQr3VY3GUItJHZ5ui6Y/KPzHp7sQYKpNiHvhYe024coBhPQF0lu/mo33Mk/X5A5u6LFecQgnhQVw9etyU0Vwb7IMwWsYM5tb87U4UwPQQfOK80ZRNOYn/d5l6YFAdmGFBUtushUQCbo653MxjnO7i8TgLJ3lQEalL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wvCHKGA3; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5132010e5d1so1614176e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Feb 2024 15:00:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709247633; x=1709852433; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OLlLOWtKYCQ8vFCgCtt04gVg5nVyM6OXeIhWsb/9Kd8=;
        b=wvCHKGA3FDGDvZ0fGNm6uHluwlOdtqG7MPWludIBUvrX5NJdXVs3MDET3OufWKZdsM
         sqKVs+bp454a2vBqvUhtTGbuPdlmi7vW7JLCR05HM8NgPsAvRi4M+MgzpJg8DSVeglQ1
         xSQ22n9LaW9NZJRDsROrKYBIcMmiSeJlTXWXTdnnE89fndZgjROHCiSg7XQcAArvnrxd
         4P0g/poyHXM48mcXJWLw3cMl5ViDf3dcx5UJtkmmeadOhVePCo39fXofXdUdIVBmZPtk
         Re5TxzNl1o2XZI4TdRZK0c3NJWiZEnZNusvQloNYPI1ZoDGTIqvpcTAj4HDboQlGk/G0
         N7rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709247633; x=1709852433;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OLlLOWtKYCQ8vFCgCtt04gVg5nVyM6OXeIhWsb/9Kd8=;
        b=svAjc1Q6Xkbv0DmeAy0gDJ7PyOIa0KDR9O8KIwxIzp6Y0WcKfZCb/3ljkXbtYkOrSj
         a9wmSr5KBu0uHWJI6AF/G4QsBIAnveEeN4fT0x0e/bj7YF1egaEpXPmRaDFoVvhDsNVy
         xBSRUvf84yCzuV+fPfHWFDASOG++Yzn4wMbxsyHG7MrdvP3Lf5L2DFp7f1Egp3CY8d6N
         GSqJ/WuneoLu3zt9DJfxCPSVvAfVTF1LR8XtaV0sw2fhOe7s8GgkvQwJscUAgK0cpY85
         K3bUeTSevDNClMd5RneMw0vln2FGFvjryMaJW12R+T+Lk7S+1AMozWOLfrriG3vgAMJ8
         Se1Q==
X-Gm-Message-State: AOJu0Yzf8EpXsHjaO3Bl8M17IgW8G8vaAuafjmcwzZ2PIHydd2kFmmDm
	cjVUcbs8paydkDzutcJRMihDeNzkLlOixx04e8Og3jROXxESITyMPOD3wLmaLAU9uOSKDNH494j
	Go/c=
X-Google-Smtp-Source: AGHT+IFFZqwnAbXWxgkC3HNTWGD+k9a1uuPOBlm/JlAi58dcEcDQRlnFJKceG6Jq1dbZc/qf3jHsNw==
X-Received: by 2002:a05:6512:716:b0:513:1385:c943 with SMTP id b22-20020a056512071600b005131385c943mr8178lfs.40.1709247633018;
        Thu, 29 Feb 2024 15:00:33 -0800 (PST)
Received: from umbar.lan (dzyjmhybhls-s--zn36gy-3.rev.dnainternet.fi. [2001:14ba:a00e:a300:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id s26-20020a19771a000000b00512ed2cf297sm408455lfc.151.2024.02.29.15.00.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Feb 2024 15:00:32 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 01 Mar 2024 01:00:27 +0200
Subject: [PATCH RFC v2 1/5] soc: qcom: add pd-mapper implementation
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240301-qcom-pd-mapper-v2-1-5d12a081d9d1@linaro.org>
References: <20240301-qcom-pd-mapper-v2-0-5d12a081d9d1@linaro.org>
In-Reply-To: <20240301-qcom-pd-mapper-v2-0-5d12a081d9d1@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=18092;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=K9GqjLgfHTc/8Gz1gmevD5qMTp6Gdlgrodn4O4bzT2M=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ+pDnj7vefUG/74vE8+ZEdgZa3LOKqH1i9A1pk7RRTF+m
 /WZKl07GY1ZGBi5GGTFFFl8ClqmxmxKDvuwY2o9zCBWJpApDFycAjCRthr2f6Zs1gc7v/I7/ndT
 CFk+j7/3zyz5+O6NNlmXviyt4bBLSq3bVsb+8P0f68tbtrHLKcs9FLhb39g6uVnIyOBWZqF8Q8/
 SSDZRnubX26140h6J/Kkyzq9QSmxTF3sqvWB5TGVRfNKbeuf2mdzvZbe4vRQ6w1mZIcQuseJygU
 O/wxO2hKiydM8JG7hmqx+fJqHa7VM9z1T6ScqvKe9Dbv//3MOt1vlllSuDaJSZS4NqdcapFTI1z
 sZbZu56U9t0fYXpBYbbt+acWnHKZnV8HP+O0oQ/W7genV5qX3lW4pbr3P9yJfdv3+9zOmgbqSL+
 Mu60uPVcz4408+lSLz8u7p3hO1O49VQyz2LG1P0PjkoDAA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Existing userspace protection domain mapper implementation has several
issue. It doesn't play well with CONFIG_EXTRA_FIRMWARE, it doesn't
reread JSON files if firmware location is changed (or if firmware was
not available at the time pd-mapper was started but the corresponding
directory is mounted later), etc.

Provide in-kernel service implementing protection domain mapping
required to work with several services, which are provided by the DSP
firmware.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/soc/qcom/Kconfig           |  10 ++
 drivers/soc/qcom/Makefile          |   2 +
 drivers/soc/qcom/qcom_pdm.c        | 300 +++++++++++++++++++++++++++++++++++++
 drivers/soc/qcom/qcom_pdm_msg.c    | 188 +++++++++++++++++++++++
 drivers/soc/qcom/qcom_pdm_msg.h    |  66 ++++++++
 include/linux/soc/qcom/pd_mapper.h |  35 +++++
 6 files changed, 601 insertions(+)

diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index 5af33b0e3470..f236ce376c1b 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -72,6 +72,16 @@ config QCOM_OCMEM
 	  requirements. This is typically used by the GPU, camera/video, and
 	  audio components on some Snapdragon SoCs.
 
+config QCOM_PD_MAPPER
+	tristate "Qualcomm Protection Domain Mapper"
+	select QCOM_QMI_HELPERS
+	depends on NET && QRTR
+	help
+	  The Protection Domain Mapper maps registered services to the domains
+	  and instances handled by the remote DSPs. This is a kernel-space
+	  implementation of the service. It is a simpler alternative to the
+	  userspace daemon.
+
 config QCOM_PDR_HELPERS
 	tristate
 	select QCOM_QMI_HELPERS
diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
index ca0bece0dfff..65e33b5a2231 100644
--- a/drivers/soc/qcom/Makefile
+++ b/drivers/soc/qcom/Makefile
@@ -7,6 +7,8 @@ obj-$(CONFIG_QCOM_COMMAND_DB) += cmd-db.o
 obj-$(CONFIG_QCOM_GSBI)	+=	qcom_gsbi.o
 obj-$(CONFIG_QCOM_MDT_LOADER)	+= mdt_loader.o
 obj-$(CONFIG_QCOM_OCMEM)	+= ocmem.o
+obj-$(CONFIG_QCOM_PD_MAPPER)	+= qcom_pd_mapper.o
+qcom_pd_mapper-y += qcom_pdm.o qcom_pdm_msg.o
 obj-$(CONFIG_QCOM_PDR_HELPERS)	+= pdr_interface.o
 obj-$(CONFIG_QCOM_PMIC_GLINK)	+= pmic_glink.o
 obj-$(CONFIG_QCOM_PMIC_GLINK)	+= pmic_glink_altmode.o
diff --git a/drivers/soc/qcom/qcom_pdm.c b/drivers/soc/qcom/qcom_pdm.c
new file mode 100644
index 000000000000..93c625364a1e
--- /dev/null
+++ b/drivers/soc/qcom/qcom_pdm.c
@@ -0,0 +1,300 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Qualcomm Protection Domain mapper
+ *
+ * Copyright (c) 2023 Linaro Ltd.
+ */
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/soc/qcom/pd_mapper.h>
+#include <linux/soc/qcom/qmi.h>
+
+#include "qcom_pdm_msg.h"
+
+#define TMS_SERVREG_SERVICE "tms/servreg"
+
+struct qcom_pdm_domain {
+	struct list_head list;
+	const char *name;
+	u32 instance_id;
+};
+
+struct qcom_pdm_service {
+	struct list_head list;
+	struct list_head domains;
+	const char *name;
+};
+
+static LIST_HEAD(qcom_pdm_services);
+static DEFINE_MUTEX(qcom_pdm_mutex);
+static bool qcom_pdm_server_added;
+static struct qmi_handle qcom_pdm_handle;
+
+static struct qcom_pdm_service *qcom_pdm_find_locked(const char *name)
+{
+	struct qcom_pdm_service *service;
+
+	list_for_each_entry(service, &qcom_pdm_services, list) {
+		if (!strcmp(service->name, name))
+			return service;
+	}
+
+	return NULL;
+}
+
+static void qcom_pdm_del_service_domain_locked(const char *service_name, const char *domain_name)
+{
+	struct qcom_pdm_service *service;
+	struct qcom_pdm_domain *domain, *temp;
+
+	service = qcom_pdm_find_locked(service_name);
+	if (WARN_ON(!service))
+		return;
+
+	list_for_each_entry_safe(domain, temp, &service->domains, list) {
+		if (!strcmp(domain->name, domain_name)) {
+			list_del(&domain->list);
+			kfree(domain);
+
+			if (list_empty(&service->domains)) {
+				list_del(&service->list);
+				kfree(service->name);
+				kfree(service);
+			}
+
+			return;
+		}
+	}
+
+	WARN(1, "domain not found");
+}
+
+static int qcom_pdm_add_service_domain_locked(const char *service_name,
+					      const char *domain_name,
+					      u32 instance_id)
+{
+	struct qcom_pdm_service *service;
+	struct qcom_pdm_domain *domain;
+
+	service = qcom_pdm_find_locked(service_name);
+	if (service) {
+		list_for_each_entry(domain, &service->domains, list) {
+			if (!strcmp(domain->name, domain_name))
+				return -EBUSY;
+		}
+	} else {
+		service = kzalloc(sizeof(*service), GFP_KERNEL);
+		if (!service)
+			return -ENOMEM;
+
+		INIT_LIST_HEAD(&service->domains);
+		service->name = kstrdup(service_name, GFP_KERNEL);
+
+		list_add_tail(&service->list, &qcom_pdm_services);
+	}
+
+	domain = kzalloc(sizeof(*domain), GFP_KERNEL);
+	if (!domain) {
+		if (list_empty(&service->domains)) {
+			list_del(&service->list);
+			kfree(service->name);
+			kfree(service);
+		}
+
+		return -ENOMEM;
+	}
+
+	/*
+	 * service name can outlive calling module and so it should be strdup'ed.
+	 * domain name can not outlive the module, so there is no need to strdup it.
+	 */
+	domain->name = domain_name;
+	domain->instance_id = instance_id;
+	list_add_tail(&domain->list, &service->domains);
+
+	return 0;
+}
+
+int qcom_pdm_add_domain(const struct qcom_pdm_domain_data *data)
+{
+	int ret;
+	int i;
+
+	mutex_lock(&qcom_pdm_mutex);
+
+	ret = qcom_pdm_add_service_domain_locked(TMS_SERVREG_SERVICE,
+						 data->domain,
+						 data->instance_id);
+
+	for (i = 0; data->services[i]; i++) {
+		ret = qcom_pdm_add_service_domain_locked(data->services[i],
+							 data->domain,
+							 data->instance_id);
+		if (ret)
+			goto err;
+	}
+
+	/*
+	 * Notify only after registering first domain.
+	 */
+	if (!qcom_pdm_server_added) {
+		ret = qmi_add_server(&qcom_pdm_handle, SERVREG_QMI_SERVICE,
+			     SERVREG_QMI_VERSION, SERVREG_QMI_INSTANCE);
+		if (ret)
+			goto err;
+
+		qcom_pdm_server_added = true;
+	}
+
+	mutex_unlock(&qcom_pdm_mutex);
+
+	return ret;
+
+err:
+	while (--i >= 0)
+		qcom_pdm_del_service_domain_locked(data->services[i], data->domain);
+
+	qcom_pdm_del_service_domain_locked(TMS_SERVREG_SERVICE, data->domain);
+
+	mutex_unlock(&qcom_pdm_mutex);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(qcom_pdm_add_domain);
+
+void qcom_pdm_del_domain(const struct qcom_pdm_domain_data *data)
+{
+	int i;
+
+	mutex_lock(&qcom_pdm_mutex);
+
+	for (i = 0; data->services[i]; i++)
+		qcom_pdm_del_service_domain_locked(data->services[i], data->domain);
+
+	qcom_pdm_del_service_domain_locked(TMS_SERVREG_SERVICE, data->domain);
+
+	mutex_unlock(&qcom_pdm_mutex);
+}
+EXPORT_SYMBOL_GPL(qcom_pdm_del_domain);
+
+static void qcom_pdm_get_domain_list(struct qmi_handle *qmi,
+				     struct sockaddr_qrtr *sq,
+				     struct qmi_txn *txn,
+				     const void *decoded)
+{
+	const struct servreg_loc_get_domain_list_req *req = decoded;
+	struct servreg_loc_get_domain_list_resp *rsp = kzalloc(sizeof(*rsp), GFP_KERNEL);
+	struct qcom_pdm_service *service;
+	u32 offset;
+	int ret;
+
+	pr_info("PDM: service '%s' offset %d\n", req->name, req->offset_valid ? req->offset : -1);
+
+	offset = req->offset_valid ? req->offset : 0;
+
+	rsp->rsp.result = QMI_RESULT_SUCCESS_V01;
+	rsp->rsp.error = QMI_ERR_NONE_V01;
+
+	rsp->db_revision_valid = true;
+	rsp->db_revision = 1;
+
+	rsp->total_domains_valid = true;
+	rsp->total_domains = 0;
+
+	mutex_lock(&qcom_pdm_mutex);
+
+	service = qcom_pdm_find_locked(req->name);
+	if (service) {
+		struct qcom_pdm_domain *domain;
+
+		rsp->domain_list_valid = true;
+		rsp->domain_list_len = 0;
+
+		list_for_each_entry(domain, &service->domains, list) {
+			u32 i = rsp->total_domains++;
+
+			if (i >= offset && i < SERVREG_LOC_MAX_DOMAINS) {
+				u32 j = rsp->domain_list_len++;
+
+				strscpy(rsp->domain_list[j].name, domain->name,
+					sizeof(rsp->domain_list[i].name));
+				rsp->domain_list[j].instance_id = domain->instance_id;
+
+				pr_info("PDM: returning %s / %d\n", domain->name,
+					domain->instance_id);
+			}
+		}
+
+	}
+
+	mutex_unlock(&qcom_pdm_mutex);
+
+	pr_info("PDM: service '%s' %d domains (of %d)\n", req->name, rsp->domain_list_len, rsp->total_domains);
+
+	ret = qmi_send_response(qmi, sq, txn, SERVREG_LOC_GET_DOMAIN_LIST,
+				2658,
+				servreg_loc_get_domain_list_resp_ei, rsp);
+	if (ret)
+		pr_err("Error sending servreg response: %d\n", ret);
+
+	kfree(rsp);
+}
+
+static void qcom_pdm_pfr(struct qmi_handle *qmi,
+			 struct sockaddr_qrtr *sq,
+			 struct qmi_txn *txn,
+			 const void *decoded)
+{
+	const struct servreg_loc_pfr_req *req = decoded;
+	struct servreg_loc_pfr_resp rsp = {};
+	int ret;
+
+	pr_warn_ratelimited("PDM: service '%s' crash: '%s'\n", req->service, req->reason);
+
+	rsp.rsp.result = QMI_RESULT_SUCCESS_V01;
+	rsp.rsp.error = QMI_ERR_NONE_V01;
+
+	ret = qmi_send_response(qmi, sq, txn, SERVREG_LOC_PFR,
+				SERVREG_LOC_PFR_RESP_MSG_SIZE,
+				servreg_loc_pfr_resp_ei, &rsp);
+	if (ret)
+		pr_err("Error sending servreg response: %d\n", ret);
+}
+
+static const struct qmi_msg_handler qcom_pdm_msg_handlers[] = {
+	{
+		.type = QMI_REQUEST,
+		.msg_id = SERVREG_LOC_GET_DOMAIN_LIST,
+		.ei = servreg_loc_get_domain_list_req_ei,
+		.decoded_size = sizeof(struct servreg_loc_get_domain_list_req),
+		.fn = qcom_pdm_get_domain_list,
+	},
+	{
+		.type = QMI_REQUEST,
+		.msg_id = SERVREG_LOC_PFR,
+		.ei = servreg_loc_pfr_req_ei,
+		.decoded_size = sizeof(struct servreg_loc_pfr_req),
+		.fn = qcom_pdm_pfr,
+	},
+	{ },
+};
+
+static int qcom_pdm_init(void)
+{
+	return qmi_handle_init(&qcom_pdm_handle, 1024,
+			       NULL, qcom_pdm_msg_handlers);
+}
+
+static void qcom_pdm_exit(void)
+{
+	qmi_handle_release(&qcom_pdm_handle);
+
+	WARN_ON(!list_empty(&qcom_pdm_services));
+}
+
+module_init(qcom_pdm_init);
+module_exit(qcom_pdm_exit);
+
+MODULE_DESCRIPTION("Qualcomm Protection Domain Mapper");
+MODULE_LICENSE("GPL");
diff --git a/drivers/soc/qcom/qcom_pdm_msg.c b/drivers/soc/qcom/qcom_pdm_msg.c
new file mode 100644
index 000000000000..6f858df8f3dc
--- /dev/null
+++ b/drivers/soc/qcom/qcom_pdm_msg.c
@@ -0,0 +1,188 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2018, Linaro Ltd.
+ * Copyright (c) 2016, Bjorn Andersson
+ */
+
+#include "qcom_pdm_msg.h"
+
+struct qmi_elem_info servreg_loc_domain_list_entry_ei[] = {
+	{
+		.data_type = QMI_STRING,
+		.elem_len = 65,
+		.elem_size = sizeof(char),
+		.offset = offsetof(struct servreg_loc_domain_list_entry, name)
+	},
+	{
+		.data_type = QMI_UNSIGNED_4_BYTE,
+		.elem_len = 1,
+		.elem_size = sizeof(u32),
+		.offset = offsetof(struct servreg_loc_domain_list_entry, instance_id),
+	},
+	{
+		.data_type = QMI_UNSIGNED_1_BYTE,
+		.elem_len = 1,
+		.elem_size = sizeof(uint8_t),
+		.offset = offsetof(struct servreg_loc_domain_list_entry, service_data_valid),
+	},
+	{
+		.data_type = QMI_UNSIGNED_4_BYTE,
+		.elem_len = 1,
+		.elem_size = sizeof(u32),
+		.offset = offsetof(struct servreg_loc_domain_list_entry, service_data),
+	},
+	{}
+};
+
+struct qmi_elem_info servreg_loc_get_domain_list_req_ei[] = {
+	{
+		.data_type = QMI_STRING,
+		.elem_len = 65,
+		.elem_size = sizeof(char),
+		.array_type = VAR_LEN_ARRAY,
+		.tlv_type = 1,
+		.offset = offsetof(struct servreg_loc_get_domain_list_req, name)
+	},
+	{
+		.data_type = QMI_OPT_FLAG,
+		.elem_len = 1,
+		.elem_size = sizeof(u8),
+		.tlv_type = 16,
+		.offset = offsetof(struct servreg_loc_get_domain_list_req, offset_valid),
+	},
+	{
+		.data_type = QMI_UNSIGNED_4_BYTE,
+		.elem_len = 1,
+		.elem_size = sizeof(u32),
+		.tlv_type = 16,
+		.offset = offsetof(struct servreg_loc_get_domain_list_req, offset),
+	},
+	{
+		.data_type	= QMI_EOTI,
+		.elem_len	= 0,
+		.elem_size	= 0,
+		.array_type	= NO_ARRAY,
+		.tlv_type	= QMI_COMMON_TLV_TYPE,
+		.offset		= 0,
+		.ei_array	= NULL,
+	}
+};
+
+struct qmi_elem_info servreg_loc_get_domain_list_resp_ei[] = {
+	{
+		.data_type = QMI_STRUCT,
+		.elem_len = 1,
+		.elem_size = sizeof_field(struct servreg_loc_get_domain_list_resp, rsp),
+		.tlv_type = 2,
+		.offset = offsetof(struct servreg_loc_get_domain_list_resp, rsp),
+		.ei_array = qmi_response_type_v01_ei,
+	},
+	{
+		.data_type = QMI_OPT_FLAG,
+		.elem_len = 1,
+		.elem_size = sizeof(u8),
+		.tlv_type = 16,
+		.offset = offsetof(struct servreg_loc_get_domain_list_resp, total_domains_valid),
+	},
+	{
+		.data_type = QMI_UNSIGNED_2_BYTE,
+		.elem_len = 1,
+		.elem_size = sizeof(u16),
+		.tlv_type = 16,
+		.offset = offsetof(struct servreg_loc_get_domain_list_resp, total_domains),
+	},
+	{
+		.data_type = QMI_OPT_FLAG,
+		.elem_len = 1,
+		.elem_size = sizeof(u8),
+		.tlv_type = 17,
+		.offset = offsetof(struct servreg_loc_get_domain_list_resp, db_revision_valid),
+	},
+	{
+		.data_type = QMI_UNSIGNED_2_BYTE,
+		.elem_len = 1,
+		.elem_size = sizeof(u16),
+		.tlv_type = 17,
+		.offset = offsetof(struct servreg_loc_get_domain_list_resp, db_revision),
+	},
+	{
+		.data_type = QMI_OPT_FLAG,
+		.elem_len = 1,
+		.elem_size = sizeof(u8),
+		.tlv_type = 18,
+		.offset = offsetof(struct servreg_loc_get_domain_list_resp, domain_list_valid),
+	},
+	{
+		.data_type = QMI_DATA_LEN,
+		.elem_len = 1,
+		.elem_size = sizeof(uint8_t),
+		.tlv_type = 18,
+		.offset = offsetof(struct servreg_loc_get_domain_list_resp, domain_list_len),
+	},
+	{
+		.data_type = QMI_STRUCT,
+		.elem_len = 32,
+		.elem_size = sizeof(struct servreg_loc_domain_list_entry),
+		.array_type = VAR_LEN_ARRAY,
+		.tlv_type = 18,
+		.offset = offsetof(struct servreg_loc_get_domain_list_resp, domain_list),
+		.ei_array = servreg_loc_domain_list_entry_ei,
+	},
+	{
+		.data_type	= QMI_EOTI,
+		.elem_len	= 0,
+		.elem_size	= 0,
+		.array_type	= NO_ARRAY,
+		.tlv_type	= QMI_COMMON_TLV_TYPE,
+		.offset		= 0,
+		.ei_array	= NULL,
+	}
+};
+
+struct qmi_elem_info servreg_loc_pfr_req_ei[] = {
+	{
+		.data_type = QMI_STRING,
+		.elem_len = 65,
+		.elem_size = sizeof(char),
+		.array_type = VAR_LEN_ARRAY,
+		.tlv_type = 1,
+		.offset = offsetof(struct servreg_loc_pfr_req, service)
+	},
+	{
+		.data_type = QMI_STRING,
+		.elem_len = 65,
+		.elem_size = sizeof(char),
+		.array_type = VAR_LEN_ARRAY,
+		.tlv_type = 2,
+		.offset = offsetof(struct servreg_loc_pfr_req, reason)
+	},
+	{
+		.data_type	= QMI_EOTI,
+		.elem_len	= 0,
+		.elem_size	= 0,
+		.array_type	= NO_ARRAY,
+		.tlv_type	= QMI_COMMON_TLV_TYPE,
+		.offset		= 0,
+		.ei_array	= NULL,
+	}
+};
+
+struct qmi_elem_info servreg_loc_pfr_resp_ei[] = {
+	{
+		.data_type = QMI_STRUCT,
+		.elem_len = 1,
+		.elem_size = sizeof_field(struct servreg_loc_pfr_resp, rsp),
+		.tlv_type = 2,
+		.offset = offsetof(struct servreg_loc_pfr_resp, rsp),
+		.ei_array = qmi_response_type_v01_ei,
+	},
+	{
+		.data_type	= QMI_EOTI,
+		.elem_len	= 0,
+		.elem_size	= 0,
+		.array_type	= NO_ARRAY,
+		.tlv_type	= QMI_COMMON_TLV_TYPE,
+		.offset		= 0,
+		.ei_array	= NULL,
+	}
+};
diff --git a/drivers/soc/qcom/qcom_pdm_msg.h b/drivers/soc/qcom/qcom_pdm_msg.h
new file mode 100644
index 000000000000..e576b87c67c0
--- /dev/null
+++ b/drivers/soc/qcom/qcom_pdm_msg.h
@@ -0,0 +1,66 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2018, Linaro Ltd.
+ * Copyright (c) 2016, Bjorn Andersson
+ */
+
+#ifndef __QMI_SERVREG_LOC_H__
+#define __QMI_SERVREG_LOC_H__
+
+#include <linux/types.h>
+#include <linux/soc/qcom/qmi.h>
+
+#define SERVREG_QMI_SERVICE 64
+#define SERVREG_QMI_VERSION 257
+#define SERVREG_QMI_INSTANCE 0
+#define QMI_RESULT_SUCCESS 0
+#define QMI_RESULT_FAILURE 1
+#define QMI_ERR_NONE 0
+#define QMI_ERR_INTERNAL 1
+#define QMI_ERR_MALFORMED_MSG 2
+#define SERVREG_LOC_GET_DOMAIN_LIST 33
+#define SERVREG_LOC_PFR 36
+
+struct servreg_loc_domain_list_entry {
+	char name[65];
+	u32 instance_id;
+	u8 service_data_valid;
+	u32 service_data;
+};
+
+struct servreg_loc_get_domain_list_req {
+	char name[65];
+	u8 offset_valid;
+	u32 offset;
+};
+
+#define SERVREG_LOC_MAX_DOMAINS 32
+
+struct servreg_loc_get_domain_list_resp {
+	struct qmi_response_type_v01 rsp;
+	u8 total_domains_valid;
+	u16 total_domains;
+	u8 db_revision_valid;
+	u16 db_revision;
+	u8 domain_list_valid;
+	u32 domain_list_len;
+	struct servreg_loc_domain_list_entry domain_list[SERVREG_LOC_MAX_DOMAINS];
+};
+
+struct servreg_loc_pfr_req {
+	char service[65];
+	char reason[257];
+};
+
+struct servreg_loc_pfr_resp {
+	struct qmi_response_type_v01 rsp;
+};
+
+#define SERVREG_LOC_PFR_RESP_MSG_SIZE 10
+
+extern struct qmi_elem_info servreg_loc_get_domain_list_req_ei[];
+extern struct qmi_elem_info servreg_loc_get_domain_list_resp_ei[];
+extern struct qmi_elem_info servreg_loc_pfr_req_ei[];
+extern struct qmi_elem_info servreg_loc_pfr_resp_ei[];
+
+#endif
diff --git a/include/linux/soc/qcom/pd_mapper.h b/include/linux/soc/qcom/pd_mapper.h
new file mode 100644
index 000000000000..9b50a7643d8f
--- /dev/null
+++ b/include/linux/soc/qcom/pd_mapper.h
@@ -0,0 +1,35 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Qualcomm Protection Domain mapper
+ *
+ * Copyright (c) 2023 Linaro Ltd.
+ */
+#ifndef __QCOM_PD_MAPPER__
+#define __QCOM_PD_MAPPER__
+
+struct qcom_pdm_domain_data {
+	const char *domain;
+	u32 instance_id;
+	/* NULL-terminated array */
+	const char * services[];
+};
+
+#if IS_ENABLED(CONFIG_QCOM_PD_MAPPER)
+
+int qcom_pdm_add_domain(const struct qcom_pdm_domain_data *data);
+void qcom_pdm_del_domain(const struct qcom_pdm_domain_data *data);
+
+#else
+
+static inline int qcom_pdm_add_domain(const struct qcom_pdm_domain_data *data)
+{
+	return 0;
+}
+
+static inline void qcom_pdm_del_domain(const struct qcom_pdm_domain_data *data)
+{
+}
+
+#endif
+
+#endif

-- 
2.39.2


