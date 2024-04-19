Return-Path: <linux-arm-msm+bounces-17954-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6AFD8AAFF5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Apr 2024 16:00:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EA0691C213C3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Apr 2024 14:00:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10AFA85C62;
	Fri, 19 Apr 2024 14:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="O9dfaM++"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A77C12D759
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Apr 2024 14:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713535249; cv=none; b=jnKopvHnFue97ldfLzznqc+s9rDSsx5T/Oih4XRpf7MkryxN5if4frj1w7lt5FbbbSE6Ze+BLlaTzyfhaviwYkTC8UVpg+HvHN4+rWhZJc3NvKsb3dIASxqyQjWWK9m0GwyGRsy/wDtygFRkYyJHpSdtjSHIBjZw25TLCJCxJuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713535249; c=relaxed/simple;
	bh=AYpzW+XVGpoMsYeJyRC3Fkd188sgOyxi1P7G4aDH0R4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rlZMJHwWFg8Skp7z9vN2PnkT96sFuidQFylLS9ALo9RJoRe7bqU0bzYBaLsK/FJWdC+0/BCuBazwKbOXYwXqVm5Lmh0l0ZZ/5jJdtPN5+fbcY/Mb/dPP8DZxM1EDy16qNjuNHtpXxbcdes9ePxu2Cam5kO4mLxjSysacsbWDfN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=O9dfaM++; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a519e1b0e2dso227227366b.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Apr 2024 07:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713535244; x=1714140044; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lISmXDIryp/LfDcYeFb/+T7GoinbLodgM7sZVPRHDnU=;
        b=O9dfaM++rJIpnzYddpPFyNBSqc0R1cY+g8xJQ/y6eIgYWqQW/aOcxmxgQaF9X8JTWk
         r3UncamdFM6O4avsTOPB/+iA8Tt6RrnDA3Zc5Nbxhz3q3Wh+lJOPoEYLMCDw2KrAnaDT
         UlAznTdDAu90niwCxBNtsldDLd5EVAXX+INeLs0hxEB9L4hpS5RbZoyI7vTCLbDew6ZS
         drDUewsIYASmlxdOo/JETZGx91idQ9zGLtqufwbmVtGJRyACjDK9nbHVcMVYvkvf4laU
         JUI5uzwdkRrszv/8cKSvZSuhrB4uHZtquw6PJ5tFc2OzmXlIvJqvEGQef9uAdKL9Msfx
         i1bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713535244; x=1714140044;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lISmXDIryp/LfDcYeFb/+T7GoinbLodgM7sZVPRHDnU=;
        b=wwZ7tYUYLihsrHVw1ELdDRXggPHGzrbPteDTiHbSAUJTXVcC4JnHDjpWmWNy38DUZb
         KkAH3IYQCo0Brb+Fsipy5aGFaAtdQSXJ+h0yZWQq8FlNGQyGKr9QPAlhIwx3GaUS9om+
         BuMW8vxhwOP72AvUgkaR/Y7jfDFj319y7fP3wVkW0TSTx9BBwWdIkpUnNEMyMZ5TuPgX
         LvyyAM9Cs3WiySIeaepLg3bqznXBi6GFfa/pYu4JgqeCDUDSNJ6Br98tI+1cnmW4FSEv
         WQvITUT7tGq4X5iynZGbNXaUGrT3pm/L8PUo1Ky1mYlmUl94byI0BwZuaGDRqEHFrgX5
         sIqA==
X-Gm-Message-State: AOJu0YyExmvFBj09UROKDuFE9eFtEjvvzmsY6zTr6lNEkMCtB5/w2rIo
	WWcT3QJarcifPFRr0HuwlVYi5Ip/cBuVP4mj4OiN99DdGF5DIs+LUOP+Qm9AlUS3xDrAqyWBO6v
	R
X-Google-Smtp-Source: AGHT+IHoxn/jrySb7xWl7r3eIak2FdVGU6m9BnFXxBoxY+PhGELomWq7T2jpVcC1khilBKow9sME5g==
X-Received: by 2002:a17:906:23e1:b0:a46:da57:6ee4 with SMTP id j1-20020a17090623e100b00a46da576ee4mr1657224ejg.73.1713535244475;
        Fri, 19 Apr 2024 07:00:44 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id qy1-20020a170907688100b00a558be8bc03sm532390ejc.150.2024.04.19.07.00.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 07:00:44 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 19 Apr 2024 17:00:33 +0300
Subject: [PATCH v5 5/6] soc: qcom: add pd-mapper implementation
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240419-qcom-pd-mapper-v5-5-e35b6f847e99@linaro.org>
References: <20240419-qcom-pd-mapper-v5-0-e35b6f847e99@linaro.org>
In-Reply-To: <20240419-qcom-pd-mapper-v5-0-e35b6f847e99@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Sibi Sankar <quic_sibis@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 Johan Hovold <johan+linaro@kernel.org>, Xilin Wu <wuxilin123@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=21257;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=AYpzW+XVGpoMsYeJyRC3Fkd188sgOyxi1P7G4aDH0R4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmInkFZROG5hm32EVOvieLOfD+yK8+spcx7xGb1
 2ookYo6Q7iJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZiJ5BQAKCRCLPIo+Aiko
 1QilB/9WTgXeuzm+AUaSOHKoaxanBo5CeRf4rrxee0/75p/ief3O29KHQALZTORhvK2fyldR959
 Oxm05QgC+aANtAK8IfC9G5niHmx9nVzgfFfwtupi8hxg8La+gNHiO3Rkto5MrcomuWAcaFW5bLc
 9nnq4ix1n+xPgTRpN5A/WBvn0ItXQJByqp6qrRHsWN0Hk/BgXHd4/mj8lVtdbSzvDL257AajbeP
 qBtKRy2FOWS0FF2ZGtEMmz8AaWhiLYZMtlw0CvdnqHVerI6BhvU5aq6+x3kuyzcb+np2lqBfPLa
 YpqRnIrQFoWOHXtkxWwVz791JVTHV0l/dD9IYzor932PcaQC
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
 drivers/soc/qcom/Kconfig           |  11 +
 drivers/soc/qcom/Makefile          |   1 +
 drivers/soc/qcom/pdr_internal.h    |  14 +
 drivers/soc/qcom/qcom_pd_mapper.c  | 632 +++++++++++++++++++++++++++++++++++++
 drivers/soc/qcom/qcom_pdr_msg.c    |  34 ++
 include/linux/soc/qcom/pd_mapper.h |  28 ++
 6 files changed, 720 insertions(+)

diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index 95973c6b828f..0a2f2bfd7863 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -72,6 +72,17 @@ config QCOM_OCMEM
 	  requirements. This is typically used by the GPU, camera/video, and
 	  audio components on some Snapdragon SoCs.
 
+config QCOM_PD_MAPPER
+	tristate "Qualcomm Protection Domain Mapper"
+	select QCOM_QMI_HELPERS
+	depends on NET && QRTR
+	default QCOM_RPROC_COMMON
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
index 3110ac3288bc..d3560f861085 100644
--- a/drivers/soc/qcom/Makefile
+++ b/drivers/soc/qcom/Makefile
@@ -7,6 +7,7 @@ obj-$(CONFIG_QCOM_COMMAND_DB) += cmd-db.o
 obj-$(CONFIG_QCOM_GSBI)	+=	qcom_gsbi.o
 obj-$(CONFIG_QCOM_MDT_LOADER)	+= mdt_loader.o
 obj-$(CONFIG_QCOM_OCMEM)	+= ocmem.o
+obj-$(CONFIG_QCOM_PD_MAPPER)	+= qcom_pd_mapper.o
 obj-$(CONFIG_QCOM_PDR_HELPERS)	+= pdr_interface.o
 obj-$(CONFIG_QCOM_PDR_MSG)	+= qcom_pdr_msg.o
 obj-$(CONFIG_QCOM_PMIC_GLINK)	+= pmic_glink.o
diff --git a/drivers/soc/qcom/pdr_internal.h b/drivers/soc/qcom/pdr_internal.h
index 7e5bb5a95275..8d17f7fb79e7 100644
--- a/drivers/soc/qcom/pdr_internal.h
+++ b/drivers/soc/qcom/pdr_internal.h
@@ -13,6 +13,8 @@
 #define SERVREG_SET_ACK_REQ				0x23
 #define SERVREG_RESTART_PD_REQ				0x24
 
+#define SERVREG_LOC_PFR_REQ				0x24
+
 #define SERVREG_DOMAIN_LIST_LENGTH			32
 #define SERVREG_RESTART_PD_REQ_MAX_LEN			67
 #define SERVREG_REGISTER_LISTENER_REQ_LEN		71
@@ -20,6 +22,7 @@
 #define SERVREG_GET_DOMAIN_LIST_REQ_MAX_LEN		74
 #define SERVREG_STATE_UPDATED_IND_MAX_LEN		79
 #define SERVREG_GET_DOMAIN_LIST_RESP_MAX_LEN		2389
+#define SERVREG_LOC_PFR_RESP_MAX_LEN			10
 
 struct servreg_location_entry {
 	char name[SERVREG_NAME_LENGTH + 1];
@@ -79,6 +82,15 @@ struct servreg_set_ack_resp {
 	struct qmi_response_type_v01 resp;
 };
 
+struct servreg_loc_pfr_req {
+	char service[SERVREG_NAME_LENGTH + 1];
+	char reason[257];
+};
+
+struct servreg_loc_pfr_resp {
+	struct qmi_response_type_v01 rsp;
+};
+
 extern const struct qmi_elem_info servreg_location_entry_ei[];
 extern const struct qmi_elem_info servreg_get_domain_list_req_ei[];
 extern const struct qmi_elem_info servreg_get_domain_list_resp_ei[];
@@ -89,5 +101,7 @@ extern const struct qmi_elem_info servreg_restart_pd_resp_ei[];
 extern const struct qmi_elem_info servreg_state_updated_ind_ei[];
 extern const struct qmi_elem_info servreg_set_ack_req_ei[];
 extern const struct qmi_elem_info servreg_set_ack_resp_ei[];
+extern const struct qmi_elem_info servreg_loc_pfr_req_ei[];
+extern const struct qmi_elem_info servreg_loc_pfr_resp_ei[];
 
 #endif
diff --git a/drivers/soc/qcom/qcom_pd_mapper.c b/drivers/soc/qcom/qcom_pd_mapper.c
new file mode 100644
index 000000000000..b2a8b1f41964
--- /dev/null
+++ b/drivers/soc/qcom/qcom_pd_mapper.c
@@ -0,0 +1,632 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Qualcomm Protection Domain mapper
+ *
+ * Copyright (c) 2023 Linaro Ltd.
+ */
+
+#include <linux/kernel.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/soc/qcom/pd_mapper.h>
+#include <linux/soc/qcom/qmi.h>
+
+#include "pdr_internal.h"
+
+#define SERVREG_QMI_VERSION 0x101
+#define SERVREG_QMI_INSTANCE 0
+
+#define TMS_SERVREG_SERVICE "tms/servreg"
+
+struct qcom_pdm_domain_data {
+	const char *domain;
+	u32 instance_id;
+	/* NULL-terminated array */
+	const char * services[];
+};
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
+static DEFINE_MUTEX(qcom_pdm_mutex);
+static LIST_HEAD(qcom_pdm_services);
+static int qcom_pdm_count;
+static struct qmi_handle qcom_pdm_handle;
+
+static struct qcom_pdm_service *qcom_pdm_find(const char *name)
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
+static int qcom_pdm_add_service_domain(const char *service_name,
+				       const char *domain_name,
+				       u32 instance_id)
+{
+	struct qcom_pdm_service *service;
+	struct qcom_pdm_domain *domain;
+
+	service = qcom_pdm_find(service_name);
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
+		service->name = service_name;
+
+		list_add_tail(&service->list, &qcom_pdm_services);
+	}
+
+	domain = kzalloc(sizeof(*domain), GFP_KERNEL);
+	if (!domain) {
+		if (list_empty(&service->domains)) {
+			list_del(&service->list);
+			kfree(service);
+		}
+
+		return -ENOMEM;
+	}
+
+	domain->name = domain_name;
+	domain->instance_id = instance_id;
+	list_add_tail(&domain->list, &service->domains);
+
+	return 0;
+}
+
+static int qcom_pdm_add_domain(const struct qcom_pdm_domain_data *data)
+{
+	int ret;
+	int i;
+
+	ret = qcom_pdm_add_service_domain(TMS_SERVREG_SERVICE,
+					  data->domain,
+					  data->instance_id);
+	if (ret)
+		return ret;
+
+	for (i = 0; data->services[i]; i++) {
+		ret = qcom_pdm_add_service_domain(data->services[i],
+						  data->domain,
+						  data->instance_id);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+
+}
+
+static void qcom_pdm_free_domains(void)
+{
+	struct qcom_pdm_service *service, *tservice;
+	struct qcom_pdm_domain *domain, *tdomain;
+
+	list_for_each_entry_safe(service, tservice, &qcom_pdm_services, list) {
+		list_for_each_entry_safe(domain, tdomain, &service->domains, list) {
+			list_del(&domain->list);
+			kfree(domain);
+		}
+
+		list_del(&service->list);
+		kfree(service);
+	}
+}
+
+static void qcom_pdm_get_domain_list(struct qmi_handle *qmi,
+				     struct sockaddr_qrtr *sq,
+				     struct qmi_txn *txn,
+				     const void *decoded)
+{
+	const struct servreg_get_domain_list_req *req = decoded;
+	struct servreg_get_domain_list_resp *rsp = kzalloc(sizeof(*rsp), GFP_KERNEL);
+	struct qcom_pdm_service *service;
+	u32 offset;
+	int ret;
+
+	offset = req->domain_offset_valid ? req->domain_offset : 0;
+
+	rsp->resp.result = QMI_RESULT_SUCCESS_V01;
+	rsp->resp.error = QMI_ERR_NONE_V01;
+
+	rsp->db_rev_count_valid = true;
+	rsp->db_rev_count = 1;
+
+	rsp->total_domains_valid = true;
+	rsp->total_domains = 0;
+
+	mutex_lock(&qcom_pdm_mutex);
+
+	service = qcom_pdm_find(req->service_name);
+	if (service) {
+		struct qcom_pdm_domain *domain;
+
+		rsp->domain_list_valid = true;
+		rsp->domain_list_len = 0;
+
+		list_for_each_entry(domain, &service->domains, list) {
+			u32 i = rsp->total_domains++;
+
+			if (i >= offset && i < SERVREG_DOMAIN_LIST_LENGTH) {
+				u32 j = rsp->domain_list_len++;
+
+				strscpy(rsp->domain_list[j].name, domain->name,
+					sizeof(rsp->domain_list[i].name));
+				rsp->domain_list[j].instance = domain->instance_id;
+
+				pr_debug("PDM: found %s / %d\n", domain->name,
+					 domain->instance_id);
+			}
+		}
+	}
+
+	pr_debug("PDM: service '%s' offset %d returning %d domains (of %d)\n", req->service_name,
+		 req->domain_offset_valid ? req->domain_offset : -1, rsp->domain_list_len, rsp->total_domains);
+
+	ret = qmi_send_response(qmi, sq, txn, SERVREG_GET_DOMAIN_LIST_REQ,
+				SERVREG_GET_DOMAIN_LIST_RESP_MAX_LEN,
+				servreg_get_domain_list_resp_ei, rsp);
+	if (ret)
+		pr_err("Error sending servreg response: %d\n", ret);
+
+	mutex_unlock(&qcom_pdm_mutex);
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
+	ret = qmi_send_response(qmi, sq, txn, SERVREG_LOC_PFR_REQ,
+				SERVREG_LOC_PFR_RESP_MAX_LEN,
+				servreg_loc_pfr_resp_ei, &rsp);
+	if (ret)
+		pr_err("Error sending servreg response: %d\n", ret);
+}
+
+static const struct qmi_msg_handler qcom_pdm_msg_handlers[] = {
+	{
+		.type = QMI_REQUEST,
+		.msg_id = SERVREG_GET_DOMAIN_LIST_REQ,
+		.ei = servreg_get_domain_list_req_ei,
+		.decoded_size = sizeof(struct servreg_get_domain_list_req),
+		.fn = qcom_pdm_get_domain_list,
+	},
+	{
+		.type = QMI_REQUEST,
+		.msg_id = SERVREG_LOC_PFR_REQ,
+		.ei = servreg_loc_pfr_req_ei,
+		.decoded_size = sizeof(struct servreg_loc_pfr_req),
+		.fn = qcom_pdm_pfr,
+	},
+	{ },
+};
+
+static const struct qcom_pdm_domain_data adsp_audio_pd = {
+	.domain = "msm/adsp/audio_pd",
+	.instance_id = 74,
+	.services = {
+		"avs/audio",
+		NULL,
+	},
+};
+
+static const struct qcom_pdm_domain_data adsp_charger_pd = {
+	.domain = "msm/adsp/charger_pd",
+	.instance_id = 74,
+	.services = { NULL },
+};
+
+static const struct qcom_pdm_domain_data adsp_root_pd = {
+	.domain = "msm/adsp/root_pd",
+	.instance_id = 74,
+	.services = { NULL },
+};
+
+static const struct qcom_pdm_domain_data adsp_root_pd_pdr = {
+	.domain = "msm/adsp/root_pd",
+	.instance_id = 74,
+	.services = {
+		"tms/pdr_enabled",
+		NULL,
+	},
+};
+
+static const struct qcom_pdm_domain_data adsp_sensor_pd = {
+	.domain = "msm/adsp/sensor_pd",
+	.instance_id = 74,
+	.services = { NULL },
+};
+
+static const struct qcom_pdm_domain_data msm8996_adsp_audio_pd = {
+	.domain = "msm/adsp/audio_pd",
+	.instance_id = 4,
+	.services = { NULL },
+};
+
+static const struct qcom_pdm_domain_data msm8996_adsp_root_pd = {
+	.domain = "msm/adsp/root_pd",
+	.instance_id = 4,
+	.services = { NULL },
+};
+
+static const struct qcom_pdm_domain_data cdsp_root_pd = {
+	.domain = "msm/cdsp/root_pd",
+	.instance_id = 76,
+	.services = { NULL },
+};
+
+static const struct qcom_pdm_domain_data slpi_root_pd = {
+	.domain = "msm/slpi/root_pd",
+	.instance_id = 90,
+	.services = { NULL },
+};
+
+static const struct qcom_pdm_domain_data slpi_sensor_pd = {
+	.domain = "msm/slpi/sensor_pd",
+	.instance_id = 90,
+	.services = { NULL },
+};
+
+static const struct qcom_pdm_domain_data mpss_root_pd = {
+	.domain = "msm/modem/root_pd",
+	.instance_id = 180,
+	.services = {
+		NULL,
+	},
+};
+
+static const struct qcom_pdm_domain_data mpss_root_pd_gps = {
+	.domain = "msm/modem/root_pd",
+	.instance_id = 180,
+	.services = {
+		"gps/gps_service",
+		NULL,
+	},
+};
+
+static const struct qcom_pdm_domain_data mpss_root_pd_gps_pdr = {
+	.domain = "msm/modem/root_pd",
+	.instance_id = 180,
+	.services = {
+		"gps/gps_service",
+		"tms/pdr_enabled",
+		NULL,
+	},
+};
+
+static const struct qcom_pdm_domain_data msm8996_mpss_root_pd = {
+	.domain = "msm/modem/root_pd",
+	.instance_id = 100,
+	.services = { NULL },
+};
+
+static const struct qcom_pdm_domain_data mpss_wlan_pd = {
+	.domain = "msm/modem/wlan_pd",
+	.instance_id = 180,
+	.services = {
+		"kernel/elf_loader",
+		"wlan/fw",
+		NULL,
+	},
+};
+
+static const struct qcom_pdm_domain_data *msm8996_domains[] = {
+	&msm8996_adsp_audio_pd,
+	&msm8996_adsp_root_pd,
+	&msm8996_mpss_root_pd,
+	NULL,
+};
+
+static const struct qcom_pdm_domain_data *msm8998_domains[] = {
+	&mpss_root_pd,
+	&mpss_wlan_pd,
+	NULL,
+};
+
+static const struct qcom_pdm_domain_data *qcm2290_domains[] = {
+	&adsp_audio_pd,
+	&adsp_root_pd,
+	&adsp_sensor_pd,
+	&mpss_root_pd_gps,
+	&mpss_wlan_pd,
+	NULL,
+};
+
+static const struct qcom_pdm_domain_data *qcs404_domains[] = {
+	&adsp_audio_pd,
+	&adsp_root_pd,
+	&adsp_sensor_pd,
+	&cdsp_root_pd,
+	&mpss_root_pd,
+	&mpss_wlan_pd,
+	NULL,
+};
+
+static const struct qcom_pdm_domain_data *sc7180_domains[] = {
+	&adsp_audio_pd,
+	&adsp_root_pd_pdr,
+	&adsp_sensor_pd,
+	&mpss_root_pd_gps_pdr,
+	&mpss_wlan_pd,
+	NULL,
+};
+
+static const struct qcom_pdm_domain_data *sc7280_domains[] = {
+	&adsp_audio_pd,
+	&adsp_root_pd_pdr,
+	&adsp_charger_pd,
+	&adsp_sensor_pd,
+	&cdsp_root_pd,
+	&mpss_root_pd_gps_pdr,
+	NULL,
+};
+
+static const struct qcom_pdm_domain_data *sc8180x_domains[] = {
+	&adsp_audio_pd,
+	&adsp_root_pd,
+	&adsp_charger_pd,
+	&cdsp_root_pd,
+	&mpss_root_pd_gps,
+	&mpss_wlan_pd,
+	NULL,
+};
+
+static const struct qcom_pdm_domain_data *sc8280xp_domains[] = {
+	&adsp_audio_pd,
+	&adsp_root_pd_pdr,
+	&adsp_charger_pd,
+	&cdsp_root_pd,
+	NULL,
+};
+
+static const struct qcom_pdm_domain_data *sdm660_domains[] = {
+	&adsp_audio_pd,
+	&adsp_root_pd,
+	&mpss_wlan_pd,
+	NULL,
+};
+
+static const struct qcom_pdm_domain_data *sdm670_domains[] = {
+	&adsp_audio_pd,
+	&adsp_root_pd,
+	&cdsp_root_pd,
+	&mpss_root_pd,
+	&mpss_wlan_pd,
+	NULL,
+};
+
+static const struct qcom_pdm_domain_data *sdm845_domains[] = {
+	&adsp_audio_pd,
+	&adsp_root_pd,
+	&cdsp_root_pd,
+	&mpss_root_pd,
+	&mpss_wlan_pd,
+	&slpi_root_pd,
+	&slpi_sensor_pd,
+	NULL,
+};
+
+static const struct qcom_pdm_domain_data *sm6115_domains[] = {
+	&adsp_audio_pd,
+	&adsp_root_pd,
+	&adsp_sensor_pd,
+	&cdsp_root_pd,
+	&mpss_root_pd_gps,
+	&mpss_wlan_pd,
+	NULL,
+};
+
+static const struct qcom_pdm_domain_data *sm6350_domains[] = {
+	&adsp_audio_pd,
+	&adsp_root_pd,
+	&adsp_sensor_pd,
+	&cdsp_root_pd,
+	&mpss_wlan_pd,
+	NULL,
+};
+
+static const struct qcom_pdm_domain_data *sm8150_domains[] = {
+	&adsp_audio_pd,
+	&adsp_root_pd,
+	&cdsp_root_pd,
+	&mpss_root_pd_gps,
+	&mpss_wlan_pd,
+	NULL,
+};
+
+static const struct qcom_pdm_domain_data *sm8250_domains[] = {
+	&adsp_audio_pd,
+	&adsp_root_pd,
+	&cdsp_root_pd,
+	&slpi_root_pd,
+	&slpi_sensor_pd,
+	NULL,
+};
+
+static const struct qcom_pdm_domain_data *sm8350_domains[] = {
+	&adsp_audio_pd,
+	&adsp_root_pd_pdr,
+	&adsp_charger_pd,
+	&cdsp_root_pd,
+	&mpss_root_pd_gps,
+	&slpi_root_pd,
+	&slpi_sensor_pd,
+	NULL,
+};
+
+static const struct qcom_pdm_domain_data *sm8550_domains[] = {
+	&adsp_audio_pd,
+	&adsp_root_pd,
+	&adsp_charger_pd,
+	&adsp_sensor_pd,
+	&cdsp_root_pd,
+	&mpss_root_pd_gps,
+	NULL,
+};
+
+static const struct of_device_id qcom_pdm_domains[] = {
+	{ .compatible = "qcom,apq8096", .data = msm8996_domains, },
+	{ .compatible = "qcom,msm8996", .data = msm8996_domains, },
+	{ .compatible = "qcom,msm8998", .data = msm8998_domains, },
+	{ .compatible = "qcom,qcm2290", .data = qcm2290_domains, },
+	{ .compatible = "qcom,qcs404", .data = qcs404_domains, },
+	{ .compatible = "qcom,sc7180", .data = sc7180_domains, },
+	{ .compatible = "qcom,sc7280", .data = sc7280_domains, },
+	{ .compatible = "qcom,sc8180x", .data = sc8180x_domains, },
+	{ .compatible = "qcom,sc8280xp", .data = sc8280xp_domains, },
+	{ .compatible = "qcom,sda660", .data = sdm660_domains, },
+	{ .compatible = "qcom,sdm660", .data = sdm660_domains, },
+	{ .compatible = "qcom,sdm670", .data = sdm670_domains, },
+	{ .compatible = "qcom,sdm845", .data = sdm845_domains, },
+	{ .compatible = "qcom,sm6115", .data = sm6115_domains, },
+	{ .compatible = "qcom,sm6350", .data = sm6350_domains, },
+	{ .compatible = "qcom,sm8150", .data = sm8150_domains, },
+	{ .compatible = "qcom,sm8250", .data = sm8250_domains, },
+	{ .compatible = "qcom,sm8350", .data = sm8350_domains, },
+	{ .compatible = "qcom,sm8450", .data = sm8350_domains, },
+	{ .compatible = "qcom,sm8550", .data = sm8550_domains, },
+	{ .compatible = "qcom,sm8650", .data = sm8550_domains, },
+	{},
+};
+
+static int qcom_pdm_start(void)
+{
+	const struct of_device_id *match;
+	const struct qcom_pdm_domain_data * const *domains;
+	struct device_node *root;
+	int ret, i;
+
+	pr_debug("PDM: starting service\n");
+
+	root = of_find_node_by_path("/");
+	if (!root)
+		return -ENODEV;
+
+	match = of_match_node(qcom_pdm_domains, root);
+	of_node_put(root);
+	if (!match) {
+		pr_notice("PDM: no support for the platform, userspace daemon might be required.\n");
+		return 0;
+	}
+
+	domains = match->data;
+	if (!domains) {
+		pr_debug("PDM: no domains\n");
+		return 0;
+	}
+
+	for (i = 0; domains[i]; i++) {
+		ret = qcom_pdm_add_domain(domains[i]);
+		if (ret)
+			goto free_domains;
+	}
+
+	ret = qmi_handle_init(&qcom_pdm_handle, 1024,
+			      NULL, qcom_pdm_msg_handlers);
+	if (ret)
+		goto free_domains;
+
+	ret = qmi_add_server(&qcom_pdm_handle, SERVREG_LOCATOR_SERVICE,
+			     SERVREG_QMI_VERSION, SERVREG_QMI_INSTANCE);
+	if (ret) {
+		pr_err("PDM: error adding server %d\n", ret);
+		goto release_handle;
+	}
+
+	return 0;
+
+release_handle:
+	qmi_handle_release(&qcom_pdm_handle);
+
+free_domains:
+	qcom_pdm_free_domains();
+
+	return ret;
+}
+
+static void qcom_pdm_stop(void)
+{
+	qmi_del_server(&qcom_pdm_handle, SERVREG_LOCATOR_SERVICE,
+		       SERVREG_QMI_VERSION, SERVREG_QMI_INSTANCE);
+
+	qmi_handle_release(&qcom_pdm_handle);
+
+	qcom_pdm_free_domains();
+
+	WARN_ON(!list_empty(&qcom_pdm_services));
+
+	pr_debug("PDM: stopped service\n");
+}
+
+/**
+ * qcom_pdm_get() - ensure that PD mapper is up and running
+ */
+int qcom_pdm_get(void)
+{
+	int ret = 0;
+
+	mutex_lock(&qcom_pdm_mutex);
+
+	if (!qcom_pdm_count)
+		ret = qcom_pdm_start();
+
+	if (!ret)
+		++qcom_pdm_count;
+
+	mutex_unlock(&qcom_pdm_mutex);
+
+	return ret;
+}
+
+/**
+ * qcom_pdm_release() - possibly stop PD mapper service
+ */
+void qcom_pdm_release(void)
+{
+	mutex_lock(&qcom_pdm_mutex);
+
+	if (qcom_pdm_count == 1)
+		qcom_pdm_stop();
+
+	if (qcom_pdm_count >= 1)
+		--qcom_pdm_count;
+
+	mutex_unlock(&qcom_pdm_mutex);
+}
+
+MODULE_DESCRIPTION("Qualcomm Protection Domain Mapper");
+MODULE_LICENSE("GPL");
diff --git a/drivers/soc/qcom/qcom_pdr_msg.c b/drivers/soc/qcom/qcom_pdr_msg.c
index a8867e8b1319..bdebbe929468 100644
--- a/drivers/soc/qcom/qcom_pdr_msg.c
+++ b/drivers/soc/qcom/qcom_pdr_msg.c
@@ -313,3 +313,37 @@ const struct qmi_elem_info servreg_set_ack_resp_ei[] = {
 	{}
 };
 EXPORT_SYMBOL_GPL(servreg_set_ack_resp_ei);
+
+const struct qmi_elem_info servreg_loc_pfr_req_ei[] = {
+	{
+		.data_type = QMI_STRING,
+		.elem_len = SERVREG_NAME_LENGTH + 1,
+		.elem_size = sizeof(char),
+		.array_type = VAR_LEN_ARRAY,
+		.tlv_type = 0x01,
+		.offset = offsetof(struct servreg_loc_pfr_req, service)
+	},
+	{
+		.data_type = QMI_STRING,
+		.elem_len = SERVREG_NAME_LENGTH + 1,
+		.elem_size = sizeof(char),
+		.array_type = VAR_LEN_ARRAY,
+		.tlv_type = 0x02,
+		.offset = offsetof(struct servreg_loc_pfr_req, reason)
+	},
+	{}
+};
+EXPORT_SYMBOL_GPL(servreg_loc_pfr_req_ei);
+
+const struct qmi_elem_info servreg_loc_pfr_resp_ei[] = {
+	{
+		.data_type = QMI_STRUCT,
+		.elem_len = 1,
+		.elem_size = sizeof_field(struct servreg_loc_pfr_resp, rsp),
+		.tlv_type = 0x02,
+		.offset = offsetof(struct servreg_loc_pfr_resp, rsp),
+		.ei_array = qmi_response_type_v01_ei,
+	},
+	{}
+};
+EXPORT_SYMBOL_GPL(servreg_loc_pfr_resp_ei);
diff --git a/include/linux/soc/qcom/pd_mapper.h b/include/linux/soc/qcom/pd_mapper.h
new file mode 100644
index 000000000000..d0dd3dfc8fea
--- /dev/null
+++ b/include/linux/soc/qcom/pd_mapper.h
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Qualcomm Protection Domain mapper
+ *
+ * Copyright (c) 2023 Linaro Ltd.
+ */
+#ifndef __QCOM_PD_MAPPER__
+#define __QCOM_PD_MAPPER__
+
+#if IS_ENABLED(CONFIG_QCOM_PD_MAPPER)
+
+int qcom_pdm_get(void);
+void qcom_pdm_release(void);
+
+#else
+
+static inline int qcom_pdm_get(void)
+{
+	return 0;
+}
+
+static inline void qcom_pdm_release(void)
+{
+}
+
+#endif
+
+#endif

-- 
2.39.2


