Return-Path: <linux-arm-msm+bounces-18156-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6758ACA59
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Apr 2024 12:11:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 60A3C2833F3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Apr 2024 10:11:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A8D413E033;
	Mon, 22 Apr 2024 10:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lnTIu7vm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C9E13E037
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Apr 2024 10:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713780692; cv=none; b=hRVYGiaCJJE840UhMXXKk9ve1SdQqY3xY/StJAMxNuTGP8PjmQbn/dRbgLr1YVg/5gct583gZdeknTkQlpHH9ZVgiuPmc+Jnvy/rqMSROtliWDuiqOru5YeVV5XvBTSBOat0x/OEEQMO51HpWFDGFyrEY3QGO6LErDZWhGHJ5Ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713780692; c=relaxed/simple;
	bh=aCnuMGHwtwT2K+CSo03/xbalWT3YlOv7Z9E5LRcWlHU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JIWTyLugp1FKm8o9+mFIrZBaiWbzBNxQl3zoJ9w0Y2KsDjTPTN8S4Q3rqPQL8Vtz+dZ9KpwmdXUHm/VlK5wwPuxOTGVlrloU0abKp308yNrPnwSxEXCXrlimChXPXcPQtMiq1NSGezsYd3YPFNVBPKD9sq9y5IyV9XgWtm7yFsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lnTIu7vm; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a51a7d4466bso446052966b.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Apr 2024 03:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713780688; x=1714385488; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yDFoHeUGfgBeYMVCFu1h9dn60SoyI3S2sNpMJgqC9sY=;
        b=lnTIu7vmw4jEboeYkA7Fcva3DFt06T5mI7TZS2lRdoWh8MDiYFASplbbQPACnxquCA
         JZKHlSKQ00ZjBd136PM/RbyiTpXjQKzfrVLOLIae2HRwDHSiw6Rxp0qmNDUvIgDY9M1O
         7+lNaFcW335DvIqZwB2i27UygujRctgo/QCo1VrreJa4LfZOv7WewbvmjVQgeeQ5roGn
         /8c9X5o6LucLUALV+shpmFei+QaX70zz72lszP6PWlfJ3rWE1BAsMcVwvNXDUZm2z1lh
         qCEUY+vq2mB+OOPR4PKikyofBxpaDrpZiwjOUA4eRwdtbm44Nly6twRu852AU0fPXge5
         I9yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713780688; x=1714385488;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yDFoHeUGfgBeYMVCFu1h9dn60SoyI3S2sNpMJgqC9sY=;
        b=LHUjVzZRyDyptCXDQGu2msB7G/2z4zTDeFlg489uDur88Z95WJuLpDnUbHf1r7BXTO
         7If12sKZh2k6nt6qvwsXivGBtZfH5iTTpdGXnSK0BjqSc3UReElzg/sTJFyf874SBkJr
         1H3MDgxPTayjzh22krBrlR7kCUq2szWeVKDJuz167UJ0LU24Iyq886/r0VLcivL5sQmF
         ZDEAOhRIIgR/U7LJQfCgUarHpfN1YZ4dbh4oD/8u8YAK4YDdzk5q0vyaWMhd8rupKVAq
         HFlaEyGWCosIIh4vs3uEZ3R5OU5KznuRcHkZ1Pbi/whTgTQil4pajmj5NrUAvvlbuEIg
         vTGA==
X-Gm-Message-State: AOJu0Yxp6+rnMk2OW/Rv8M/HucBWO9sNRyVWmv2jws8pqAIt6hs4ogK4
	ygtVPK8bOI9vQCqA4o+e0J/8zOdeUSsKtf/OgFJbhfNPjNX+tVtl//VIyXsKyw0=
X-Google-Smtp-Source: AGHT+IFcvreBl6lv0uzYja3/U4kJ1Nf0EUcFjuMdyt5U/g1jGpMki8T2sepX01Mc/PZITxY2P42Elg==
X-Received: by 2002:a17:906:6a0c:b0:a55:a5a0:da2d with SMTP id qw12-20020a1709066a0c00b00a55a5a0da2dmr3673800ejc.31.1713780688207;
        Mon, 22 Apr 2024 03:11:28 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id k14-20020a170906128e00b00a525609ae30sm5576339ejb.169.2024.04.22.03.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Apr 2024 03:11:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 22 Apr 2024 13:11:20 +0300
Subject: [PATCH v6 5/6] soc: qcom: add pd-mapper implementation
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240422-qcom-pd-mapper-v6-5-f96957d01207@linaro.org>
References: <20240422-qcom-pd-mapper-v6-0-f96957d01207@linaro.org>
In-Reply-To: <20240422-qcom-pd-mapper-v6-0-f96957d01207@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Sibi Sankar <quic_sibis@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 Johan Hovold <johan+linaro@kernel.org>, Xilin Wu <wuxilin123@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=22517;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=aCnuMGHwtwT2K+CSo03/xbalWT3YlOv7Z9E5LRcWlHU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmJjfKqXIS8rZH0R1uKn+aaXcgS69QAFs4Xfjpa
 H6i9oCjJV+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZiY3ygAKCRCLPIo+Aiko
 1XqfB/9EW6E2qUh8LlV+rqm6OAp4K3RCwh+4Cp8WMz3svKedqXIb6xgmSl/1fXsY6QtjFHH8hQG
 uJ8zrRkh2wJkDF74w29el8iA+g8vnsMC30UkTuG49fpMkofgRBTPmE8ulFNQ9VNOM7SM2RQNlsy
 glIfHvH51TZfzaImCpY6xopCFsp286UEduvFX7+nsDDcMflCVeAQfIsuD8vob3ebOSF6u1Flt9l
 fdkTNcznUa6MQSDxV/45O8T/WB7bWiWlK8LXzvHPMfhCJ5xRBphXEDRxl+fwowoZ3oQF68EsnQU
 hEgHyBXgdZfZs7F15L+/dCG627SlWoEjoeaGqgehr2q7Rz8J
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

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/soc/qcom/Kconfig           |  10 +
 drivers/soc/qcom/Makefile          |   1 +
 drivers/soc/qcom/pdr_internal.h    |  14 +
 drivers/soc/qcom/qcom_pd_mapper.c  | 656 +++++++++++++++++++++++++++++++++++++
 drivers/soc/qcom/qcom_pdr_msg.c    |  34 ++
 include/linux/soc/qcom/pd_mapper.h |  28 ++
 6 files changed, 743 insertions(+)

diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index 95973c6b828f..f666366841b8 100644
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
index 000000000000..ba5440506c95
--- /dev/null
+++ b/drivers/soc/qcom/qcom_pd_mapper.c
@@ -0,0 +1,656 @@
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
+static DEFINE_MUTEX(qcom_pdm_count_mutex); /* guards count */
+/*
+ * It is not possible to use refcount_t here. The service needs to go to 0 and
+ * back without warnings.
+ */
+static unsigned int qcom_pdm_count;
+
+static DEFINE_MUTEX(qcom_pdm_mutex);
+static struct qmi_handle qcom_pdm_handle;
+static LIST_HEAD(qcom_pdm_services);
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
+	root = of_find_node_by_path("/");
+	if (!root)
+		return -ENODEV;
+
+	match = of_match_node(qcom_pdm_domains, root);
+	of_node_put(root);
+	if (!match) {
+		pr_notice("PDM: no support for the platform, userspace daemon might be required.\n");
+		return -ENODEV;
+	}
+
+	domains = match->data;
+	if (!domains) {
+		pr_debug("PDM: no domains\n");
+		return -ENODEV;
+	}
+
+	mutex_lock(&qcom_pdm_mutex);
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
+	mutex_unlock(&qcom_pdm_mutex);
+
+	return 0;
+
+release_handle:
+	qmi_handle_release(&qcom_pdm_handle);
+
+free_domains:
+	qcom_pdm_free_domains();
+	mutex_unlock(&qcom_pdm_mutex);
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
+}
+
+/**
+ * qcom_pdm_get() - ensure that PD mapper is up and running
+ *
+ * Start the in-kernel Qualcomm DSP protection domain mapper service if it was
+ * not running.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int qcom_pdm_get(void)
+{
+	int ret = 0;
+
+	mutex_lock(&qcom_pdm_count_mutex);
+
+	if (!qcom_pdm_count)
+		ret = qcom_pdm_start();
+	if (!ret)
+		++qcom_pdm_count;
+
+	mutex_unlock(&qcom_pdm_count_mutex);
+
+	/*
+	 * If it is -ENODEV, the plaform is not supported by the in-kernel
+	 * mapper. Still return 0 to rproc driver, userspace daemon will be
+	 * used instead of the kernel server.
+	 */
+	if (ret == -ENODEV)
+		return 0;
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(qcom_pdm_get);
+
+/**
+ * qcom_pdm_release() - possibly stop PD mapper service
+ *
+ * Decreases refcount, stopping the server when the last user was removed.
+ */
+void qcom_pdm_release(void)
+{
+	mutex_lock(&qcom_pdm_count_mutex);
+
+	if (qcom_pdm_count == 1)
+		qcom_pdm_stop();
+
+	if (qcom_pdm_count >= 1)
+		--qcom_pdm_count;
+
+	mutex_unlock(&qcom_pdm_count_mutex);
+}
+EXPORT_SYMBOL_GPL(qcom_pdm_release);
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


