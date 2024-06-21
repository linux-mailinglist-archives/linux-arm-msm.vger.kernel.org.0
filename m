Return-Path: <linux-arm-msm+bounces-23669-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D223912FFD
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Jun 2024 00:04:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 11A572873D8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 22:04:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7921317CA0E;
	Fri, 21 Jun 2024 22:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ERR5JDo+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A1017C7B6
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Jun 2024 22:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719007429; cv=none; b=UX3pZhovb/cl3JRN83sazG54uVqdeeIm6UrLqAUCSQlpLPbe8GXaHMB1zr/+1yIGVd9hYdtScYjVHVfcs6Lt07uBWPCE4DWnFDpURhp6mI1UP8v4D1qdNBrc0SmIdR5BpHu5fcGdYubi6V+0XYJ0RrKVDw1lNqWg/OwGWq85dSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719007429; c=relaxed/simple;
	bh=FAWCvGKdD+U3DbHCP4WGqc47R53begCu/k8g+cWtmEU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GEh6gw7is9w3394066dAbKSeckMFWYu3qZiskkYZC+JSoVtmTVlf55slQwULmveTUo5VMHTLeOmDylY1WbbqXW+/nEf2oxX2HMgOwGOTpd7wMRX/uN3op//mHPDJNcUylAdn9AgCXc2zfKYEsqtOitAYS/cme/ra0+ETHkNxf9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ERR5JDo+; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-52c82101407so4237421e87.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Jun 2024 15:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719007425; x=1719612225; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4uHVRlne/ukoOlsKfZ2wund46pf2D+lQCHoi1hlHZ7o=;
        b=ERR5JDo+of4w9Jzxj4+AVuJnNEcQ+JP72I8AV5VHOghrAp2L8JdvxHar1oFKFnwXqv
         WrHk8uX6d6AN6lzfhYNxWd/lN68G9TR7khgLKgiy2saC4xzKydvGih8ElOkGrZEc6Hyh
         XT85z8C7sTdpYlFfoQWL8wkxw+5xM9JnRtKgrhW7/4yT76G9AoxQUuKQb1/GAAMRVLIZ
         vPzgETOYCS3kC5HxFNbJ5Y57MxwbN2XD+7a3adjC8mixFMiPsLtkesVDVxCvk2hhTGdf
         lNC1av6V40z0Z4dCczRmQrob0GRty44MvxFmkQz0Z+sggOBm6xOWceQsdKcfID2u4TDw
         wpkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719007425; x=1719612225;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4uHVRlne/ukoOlsKfZ2wund46pf2D+lQCHoi1hlHZ7o=;
        b=WUFF6KsGwwZjQ/ly2kMOeG3yIzAZEQbrp5a+R21ew9gvc6zycH4tfttkQ3X3q6XsSO
         Gpd9QkscZ2mVIXMCxGVhA7TgTX/1D0KrG6nWAdYt+xxcJDJHM+FmdTlZE8nj278QwndA
         FGVmdJf2ieqm83I1OhvH64sB/9f/Uzth7SXAmjXu3eSIHKEDdk2g4UCzt6ItgXcVy41l
         /3Bnym+QiXC59UbHSJEK1QwIsdHwYqyjdXpfuBMzg9zuyfATJF9/pHex6NK8FYgsvgpS
         zHj7Kr/XF4mVRu7geZoI4LHfmQoY/SBNn2fLp/OjZ+88HIK8dzXMi3pXQ/8jy5lFVzZG
         7tQA==
X-Gm-Message-State: AOJu0Yx5mOlvvAxtFpEPRx1997icoKhJvEAkhy8E9mxx+id/zBuxrIrz
	rn0Q2fqzFZnKtOF3Lr4Fo8tdGlsqTDasx1Uigzf0P558ZlDFv+JUgmdzSbWLYrg=
X-Google-Smtp-Source: AGHT+IGTy2eNSWUHC5Cw26iADWwmXdOtEosstM3rfUndJQGnGPQCHapq8kzM0Lyqa9287oQzsvGBBw==
X-Received: by 2002:a05:6512:4ca:b0:52c:d5e4:9a99 with SMTP id 2adb3069b0e04-52cd5e49ccfmr2502522e87.17.1719007424648;
        Fri, 21 Jun 2024 15:03:44 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52cd6431fcdsm318293e87.210.2024.06.21.15.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 15:03:43 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 22 Jun 2024 01:03:43 +0300
Subject: [PATCH v9 4/5] soc: qcom: add pd-mapper implementation
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240622-qcom-pd-mapper-v9-4-a84ee3591c8e@linaro.org>
References: <20240622-qcom-pd-mapper-v9-0-a84ee3591c8e@linaro.org>
In-Reply-To: <20240622-qcom-pd-mapper-v9-0-a84ee3591c8e@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Sibi Sankar <quic_sibis@quicinc.com>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-remoteproc@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>, 
 Xilin Wu <wuxilin123@gmail.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Steev Klimaszewski <steev@kali.org>, 
 Alexey Minnekhanov <alexeymin@postmarketos.org>, 
 Chris Lew <quic_clew@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=22603;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=FAWCvGKdD+U3DbHCP4WGqc47R53begCu/k8g+cWtmEU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmdfi8LJ5pgSKIN0dd3rXQ/rZK/ed3E7MAfmCyo
 7J84tE1Q8KJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZnX4vAAKCRCLPIo+Aiko
 1aToCACIexI/ySIiRIFzWNpuCDQAbWUu1CYvPJe0mDPyEOXfavN/BzGHQLEghhwDEqq6fmbZeZA
 PzhY9A/LJBUnOiIecar4aI708b0L7msLanm8JC5lKKhJPFFhZBojFZwM+Tgn8jukavOlXIkgMtH
 POpi91IkeFm3Yadh7K+Tld3JcTGpHBQa8Pk9kI9BeheVbP9T4TtkOEfuh+yEzpUSYZ5tDi7B+d9
 bvG7fqZYO2TNFAV2kqBhYwYhRWyCJSaStTOp4nAo5vCU+usaurWRDNb+vj1Qix/dUiUtuAgPhed
 QjFy4wYMW1ZKbFwz40V7J/DJe5JidI/rhTtfF7IHwthx+615
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

This module is loaded automatically by the remoteproc drivers when
necessary via the symbol dependency. It uses a root node to match a
protection domains map for a particular board. It is not possible to
implement it as a 'driver' as there is no corresponding device.

Tested-by: Steev Klimaszewski <steev@kali.org>
Tested-by: Alexey Minnekhanov <alexeymin@postmarketos.org>
Reviewed-by: Chris Lew <quic_clew@quicinc.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/soc/qcom/Kconfig          |  11 +
 drivers/soc/qcom/Makefile         |   1 +
 drivers/soc/qcom/pdr_internal.h   |  14 +
 drivers/soc/qcom/qcom_pd_mapper.c | 676 ++++++++++++++++++++++++++++++++++++++
 drivers/soc/qcom/qcom_pdr_msg.c   |  34 ++
 5 files changed, 736 insertions(+)

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
index 000000000000..ecb64f06527f
--- /dev/null
+++ b/drivers/soc/qcom/qcom_pd_mapper.c
@@ -0,0 +1,676 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Qualcomm Protection Domain mapper
+ *
+ * Copyright (c) 2023 Linaro Ltd.
+ */
+
+#include <linux/auxiliary_bus.h>
+#include <linux/kernel.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/refcount.h>
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
+struct qcom_pdm_data {
+	refcount_t refcnt;
+	struct qmi_handle handle;
+	struct list_head services;
+};
+
+static DEFINE_MUTEX(qcom_pdm_mutex); /* protects __qcom_pdm_data */
+static struct qcom_pdm_data *__qcom_pdm_data;
+
+static struct qcom_pdm_service *qcom_pdm_find(struct qcom_pdm_data *data,
+					      const char *name)
+{
+	struct qcom_pdm_service *service;
+
+	list_for_each_entry(service, &data->services, list) {
+		if (!strcmp(service->name, name))
+			return service;
+	}
+
+	return NULL;
+}
+
+static int qcom_pdm_add_service_domain(struct qcom_pdm_data *data,
+				       const char *service_name,
+				       const char *domain_name,
+				       u32 instance_id)
+{
+	struct qcom_pdm_service *service;
+	struct qcom_pdm_domain *domain;
+
+	service = qcom_pdm_find(data, service_name);
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
+		list_add_tail(&service->list, &data->services);
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
+static int qcom_pdm_add_domain(struct qcom_pdm_data *data,
+			       const struct qcom_pdm_domain_data *domain)
+{
+	int ret;
+	int i;
+
+	ret = qcom_pdm_add_service_domain(data,
+					  TMS_SERVREG_SERVICE,
+					  domain->domain,
+					  domain->instance_id);
+	if (ret)
+		return ret;
+
+	for (i = 0; domain->services[i]; i++) {
+		ret = qcom_pdm_add_service_domain(data,
+						  domain->services[i],
+						  domain->domain,
+						  domain->instance_id);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+
+}
+
+static void qcom_pdm_free_domains(struct qcom_pdm_data *data)
+{
+	struct qcom_pdm_service *service, *tservice;
+	struct qcom_pdm_domain *domain, *tdomain;
+
+	list_for_each_entry_safe(service, tservice, &data->services, list) {
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
+	struct qcom_pdm_data *data = container_of(qmi, struct qcom_pdm_data, handle);
+	const struct servreg_get_domain_list_req *req = decoded;
+	struct servreg_get_domain_list_resp *rsp;
+	struct qcom_pdm_service *service;
+	u32 offset;
+	int ret;
+
+	rsp = kzalloc(sizeof(*rsp), GFP_KERNEL);
+	if (!rsp)
+		return;
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
+	service = qcom_pdm_find(data, req->service_name);
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
+	&adsp_sensor_pd,
+	&cdsp_root_pd,
+	&mpss_root_pd,
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
+	{ .compatible = "qcom,apq8064", .data = NULL, },
+	{ .compatible = "qcom,apq8074", .data = NULL, },
+	{ .compatible = "qcom,apq8084", .data = NULL, },
+	{ .compatible = "qcom,apq8096", .data = msm8996_domains, },
+	{ .compatible = "qcom,msm8226", .data = NULL, },
+	{ .compatible = "qcom,msm8974", .data = NULL, },
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
+	{ .compatible = "qcom,sm4250", .data = sm6115_domains, },
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
+static void qcom_pdm_stop(struct qcom_pdm_data *data)
+{
+	qcom_pdm_free_domains(data);
+
+	/* The server is removed automatically */
+	qmi_handle_release(&data->handle);
+
+	kfree(data);
+}
+
+static struct qcom_pdm_data *qcom_pdm_start(void)
+{
+	const struct qcom_pdm_domain_data * const *domains;
+	const struct of_device_id *match;
+	struct qcom_pdm_data *data;
+	struct device_node *root;
+	int ret, i;
+
+	root = of_find_node_by_path("/");
+	if (!root)
+		return ERR_PTR(-ENODEV);
+
+	match = of_match_node(qcom_pdm_domains, root);
+	of_node_put(root);
+	if (!match) {
+		pr_notice("PDM: no support for the platform, userspace daemon might be required.\n");
+		return ERR_PTR(-ENODEV);
+	}
+
+	domains = match->data;
+	if (!domains) {
+		pr_debug("PDM: no domains\n");
+		return ERR_PTR(-ENODEV);
+	}
+
+	data = kzalloc(sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return ERR_PTR(-ENOMEM);
+
+	INIT_LIST_HEAD(&data->services);
+
+	ret = qmi_handle_init(&data->handle, SERVREG_GET_DOMAIN_LIST_REQ_MAX_LEN,
+			      NULL, qcom_pdm_msg_handlers);
+	if (ret) {
+		kfree(data);
+		return ERR_PTR(ret);
+	}
+
+	refcount_set(&data->refcnt, 1);
+
+	for (i = 0; domains[i]; i++) {
+		ret = qcom_pdm_add_domain(data, domains[i]);
+		if (ret)
+			goto err_stop;
+	}
+
+	ret = qmi_add_server(&data->handle, SERVREG_LOCATOR_SERVICE,
+			     SERVREG_QMI_VERSION, SERVREG_QMI_INSTANCE);
+	if (ret) {
+		pr_err("PDM: error adding server %d\n", ret);
+		goto err_stop;
+	}
+
+	return data;
+
+err_stop:
+	qcom_pdm_stop(data);
+
+	return ERR_PTR(ret);
+}
+
+static int qcom_pdm_probe(struct auxiliary_device *auxdev,
+			  const struct auxiliary_device_id *id)
+
+{
+	struct qcom_pdm_data *data;
+	int ret = 0;
+
+	mutex_lock(&qcom_pdm_mutex);
+
+	if (!__qcom_pdm_data) {
+		data = qcom_pdm_start();
+
+		if (IS_ERR(data))
+			ret = PTR_ERR(data);
+		else
+			__qcom_pdm_data = data;
+	}
+
+	auxiliary_set_drvdata(auxdev, __qcom_pdm_data);
+
+	mutex_unlock(&qcom_pdm_mutex);
+
+	return ret;
+}
+
+static void qcom_pdm_remove(struct auxiliary_device *auxdev)
+{
+	struct qcom_pdm_data *data;
+
+	data = auxiliary_get_drvdata(auxdev);
+	if (!data)
+		return;
+
+	if (refcount_dec_and_mutex_lock(&data->refcnt, &qcom_pdm_mutex)) {
+		__qcom_pdm_data = NULL;
+		qcom_pdm_stop(data);
+		mutex_unlock(&qcom_pdm_mutex);
+	}
+}
+
+static const struct auxiliary_device_id qcom_pdm_table[] = {
+	{ .name = "qcom_common.pd-mapper" },
+	{},
+};
+MODULE_DEVICE_TABLE(auxiliary, qcom_pdm_table);
+
+static struct auxiliary_driver qcom_pdm_drv = {
+	.name = "qcom-pdm-mapper",
+	.id_table = qcom_pdm_table,
+	.probe = qcom_pdm_probe,
+	.remove = qcom_pdm_remove,
+};
+module_auxiliary_driver(qcom_pdm_drv);
+
+MODULE_DESCRIPTION("Qualcomm Protection Domain Mapper");
+MODULE_LICENSE("GPL");
diff --git a/drivers/soc/qcom/qcom_pdr_msg.c b/drivers/soc/qcom/qcom_pdr_msg.c
index 9b46f42aa146..bf3e4a47165e 100644
--- a/drivers/soc/qcom/qcom_pdr_msg.c
+++ b/drivers/soc/qcom/qcom_pdr_msg.c
@@ -315,5 +315,39 @@ const struct qmi_elem_info servreg_set_ack_resp_ei[] = {
 };
 EXPORT_SYMBOL_GPL(servreg_set_ack_resp_ei);
 
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
+
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Qualcomm Protection Domain messages data");

-- 
2.39.2


