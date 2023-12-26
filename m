Return-Path: <linux-arm-msm+bounces-5965-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5650B81E42F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Dec 2023 01:50:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C1CC02812B6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Dec 2023 00:50:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CCA7EDD;
	Tue, 26 Dec 2023 00:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nS/faNcl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D100AA29
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Dec 2023 00:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2ccbded5aa4so10657991fa.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Dec 2023 16:34:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703550889; x=1704155689; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9sZH8qAvN7fUHwzV8tFEQL3PlFU9ZY4f992rQeokEr0=;
        b=nS/faNclVrlgjpmk/mxsTP47tY39Bnc3pLWvMi1yWvpr8h7N7o0GNoQaYxI/WOG0H2
         ywnYrGJahoZr/Y/plNtzZMs+94PoOUuq0EvKVkVz82FFkCSLonxrkAxkSgY7ToAs2EeO
         OMHjwAVxxWEhiGiP8Cg9wKapI2mkb5r5saoi6VwzX6baQn5UjM1pu2dR8Vmbi5kmYMDE
         Z5tAB4W/0mQIyjiEnPyyUEpmY9N9LKiAXL2RSQ8kLavhSN3cRS029zuo9dZbNxgkmJVX
         rrW/6vPIF9L1MSe31fm7sXOo+ZzpDnM1pbqIwBJWCTkrji+FeuMNS5je9UaVpfsLKhyP
         hm1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703550889; x=1704155689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9sZH8qAvN7fUHwzV8tFEQL3PlFU9ZY4f992rQeokEr0=;
        b=uCAXG2HNVAkaUA4TYlRUIigWXBXjDUlim2fU6O2oOQrMGsGF1P9OjrFvEDOrnh9bll
         j1wTWu7oRUAgtsTQzyCLkqHcp11PVEKMm6moGIUB/s3thSWIPi4c6r/fnJ+HHWC2D0Vw
         sVZ/DGJGCT1BQWrqCM/GOKsXCMA05rKN6ConXu+kMMFrrepDfVXhJldU/FeMaGuyT8Za
         aqdVVT5EEGASuVOlOd4l9W5TCQJoJrd0ccpez80VF09G6ORXCZYRRbjPr7x0q59oXeJ1
         1rVp3PehoKsD4pQnA6ImOn4N2kRMbuEWFGyTWvPtbMs8JhmzUizGD1TkqlHUJcvIa6Pq
         Zxuw==
X-Gm-Message-State: AOJu0YxNia5kPfPxiWelPzGx+ooXqCzJGX6cRjjbJufaSkUOUnm2Svcx
	y3rV5b/bBPbmKxumSrAKJV2d/VbLnYIY/g==
X-Google-Smtp-Source: AGHT+IEYQNyL9NJUALswrOwE1Jr/L4WJSko78MY5GpN1pyBJm74ukPTZ589lDVg4YGvrmzvkO0pC7g==
X-Received: by 2002:a2e:9915:0:b0:2cc:5ab2:7f49 with SMTP id v21-20020a2e9915000000b002cc5ab27f49mr2585035lji.34.1703550888916;
        Mon, 25 Dec 2023 16:34:48 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id d1-20020a05651c088100b002ccb1301d53sm1368810ljq.48.2023.12.25.16.34.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Dec 2023 16:34:48 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Subject: [RFC PATCH 1/5] soc: qcom: add pd-mapper implementation
Date: Tue, 26 Dec 2023 02:34:43 +0200
Message-Id: <20231226003447.3044365-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231226003447.3044365-1-dmitry.baryshkov@linaro.org>
References: <20231226003447.3044365-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The existing userspace protection domain mapper implementation has
several issue. It doesn't play well with CONFIG_EXTRA_FIRMWARE, it
doesn't reread the JSON files if the firmware location is changed (or if
the firmware was not available at the time pd-mapper was started but the
corresponding directory is mounted later), etc.

Provide in-kernel service implementing protection domain mapping
required to work with several services, which are provided by the DSP
firmware.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/soc/qcom/Kconfig           |  10 +
 drivers/soc/qcom/Makefile          |   2 +
 drivers/soc/qcom/qcom_pdm.c        | 302 +++++++++++++++++++++++++++++
 drivers/soc/qcom/qcom_pdm_msg.c    | 189 ++++++++++++++++++
 drivers/soc/qcom/qcom_pdm_msg.h    |  66 +++++++
 include/linux/soc/qcom/pd_mapper.h |  35 ++++
 6 files changed, 604 insertions(+)
 create mode 100644 drivers/soc/qcom/qcom_pdm.c
 create mode 100644 drivers/soc/qcom/qcom_pdm_msg.c
 create mode 100644 drivers/soc/qcom/qcom_pdm_msg.h
 create mode 100644 include/linux/soc/qcom/pd_mapper.h

diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index c6ca4de42586..baaf355004ab 100644
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
index 05b3d54e8dc9..47303d7f826d 100644
--- a/drivers/soc/qcom/Makefile
+++ b/drivers/soc/qcom/Makefile
@@ -6,6 +6,8 @@ obj-$(CONFIG_QCOM_COMMAND_DB) += cmd-db.o
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
index 000000000000..6dd1c2bed6d7
--- /dev/null
+++ b/drivers/soc/qcom/qcom_pdm.c
@@ -0,0 +1,302 @@
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
+	list_add(&domain->list, &service->domains);
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
+	mutex_unlock(&qcom_pdm_mutex);
+
+	return 0;
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
+	rsp->total_domains_valid = 1;
+	rsp->total_domains = 0;
+
+	mutex_lock(&qcom_pdm_mutex);
+
+	service = qcom_pdm_find_locked(req->name);
+	if (service) {
+		struct qcom_pdm_domain *domain;
+
+		rsp->domain_list_valid = 1;
+		rsp->domain_list_len = 0;
+
+		list_for_each_entry(domain, &service->domains, list) {
+			u32 i = rsp->total_domains++;
+
+			if (i >= offset && i < SERVREG_LOC_MAX_DOMAINS) {
+				u32 j = rsp->domain_list_len++;
+
+				strlcpy(rsp->domain_list[j].name, domain->name,
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
+static struct qmi_handle qcom_pdm_handle;
+
+static int qcom_pdm_init(void)
+{
+	int ret;
+
+	ret = qmi_handle_init(&qcom_pdm_handle, 1024,
+			      NULL, qcom_pdm_msg_handlers);
+	if (ret)
+		return ret;
+
+	ret = qmi_add_server(&qcom_pdm_handle, SERVREG_QMI_SERVICE,
+			     SERVREG_QMI_VERSION, SERVREG_QMI_INSTANCE);
+	if (ret) {
+		qmi_handle_release(&qcom_pdm_handle);
+		memset(&qcom_pdm_handle, 0, sizeof(qcom_pdm_handle));
+	}
+
+	return ret;
+}
+
+static void qcom_pdm_exit(void)
+{
+	qmi_handle_release(&qcom_pdm_handle);
+	memset(&qcom_pdm_handle, 0, sizeof(qcom_pdm_handle));
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
index 000000000000..ba660f68a629
--- /dev/null
+++ b/drivers/soc/qcom/qcom_pdm_msg.c
@@ -0,0 +1,189 @@
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
+
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


