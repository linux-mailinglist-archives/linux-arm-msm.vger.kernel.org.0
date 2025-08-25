Return-Path: <linux-arm-msm+bounces-70608-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA105B33C6D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 12:19:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B31B416669C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 10:19:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18DAE29D270;
	Mon, 25 Aug 2025 10:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SkccrLn6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 319E02C0F89
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 10:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756117185; cv=none; b=HhEvTjkoQCerYQ7cQ+pmUEONG6O0xzXL7gvw/v789cXkT36HAv0+2Nie3W+vkQ8Z/QLqVIcGDN9UgAIxfW4v1aWDfZY1lSOpU5NScsyprl26MMnoQqiLA2iiwDuGRSLjTWKz9axebWLsUSjO9p5wr5pjj7/9zOmH7AwDLruUiUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756117185; c=relaxed/simple;
	bh=Tqkvu9KhCljO3bhlfysoTwZizRD0UqDqMVDh+E9DLfg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NcO/Q38m4ZEL3GINLMK6/fHIVBPB5j/fd0osTBi1q9jZR9HR4RTh0J3IE8VDThNtT5PdQOLgCBIJVlaolbpiilHdGQAdJ4iBoVR40Ec6NQthnsia+0x++regkgSY84A9ya/tAgBvhBQZ56r7ZB/zxd6UC1qCfVto93ket4C3vko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SkccrLn6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P8e12J014221
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 10:19:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/s0QdipUNtA
	fdGM8rV4kB38kKcALROv1VaEfQbv2I60=; b=SkccrLn6lcs1PCiKXHkuA0otJOt
	6FMcuXSrBTd2l1p3Gcla9KiilDTePsqbQZE7p6v5gYSbPGmdWkCdSfQ8WjkA148r
	kPmRTQRNFXTJBPlhDhwwyik+H4RWUBEBqx5mbNvLUlZAynocvTLA9OAUfyaEZRg/
	Zl/B++zIYAELJst+lwnvaVuJYKMOitWOa2YR3PkhwJONBhxYq32okKGGL81JuZV5
	ash9UYAQeJJ6IxzqSeGN6XIaZBiO6MlhSS3N491jhF1846QmENzXmrAVWW2YZFXf
	rx8hzBUbZzwwupShNZOUpoXU7968ISliVZMf2MGkWV79tP6YjUah1HmpCvQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5y5cmy5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 10:19:42 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-246266f9ae1so30410595ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 03:19:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756117181; x=1756721981;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/s0QdipUNtAfdGM8rV4kB38kKcALROv1VaEfQbv2I60=;
        b=mAwQp5iti9rm9/fNkazgptV6qFy/CoNmjF86b1ps14eQEMPDbL/x98KqyPzX1W34FC
         ExMqaOLX7sBRVMj8dPzy+UqBtiyM+HsXxtkQ5+Prj4D7do8eFNgAcJx+K9TVY8rKQjhP
         XnTTEJlHWjMtC5l3y5JS+TXXZ81XUvuM0ar49Dqh2zllTeCMnZt6zscRKNxyRt4WMS7W
         xo1Zip8aDFFIc7FmguBirZqZ7evhDzLwhnHvZD8CNl5W6ltsIC0aBLlGKpAoOvKdZzkk
         rL7KReAQH1BA85Fly2uuwU+NmOLM38sT3jktyFaXN/PsRzvaxrxGXRi3jqx1YdGX+ISv
         +jpA==
X-Forwarded-Encrypted: i=1; AJvYcCVtrXg+62XZ1hfn2sHsbsfOe8+oLwlAnZZrdjWFWS9ty7+B4LTZHnxXxEtuHszItPWiDKfr9ioEaXItwp69@vger.kernel.org
X-Gm-Message-State: AOJu0YzZ0buZKH/4Ry7dQ3NdLVMRk9H8lyLB1Tu9s4praSvGcg1xkY2s
	yeqMcVKFZYytFuqkQ1PMYqSDFNFz4nwYCZqnVSPkptxBjrqVD+/U5tu2SM/ojzbL4Ihz8+9N5Wj
	s5IbhkqZOfXQiT3g1YTwSIW3d5WCUjb7yL/EMWtZSQCPcWGrkiqrWrc2MUALVFgrSiHUW
X-Gm-Gg: ASbGncutSXkdgC4q2IlNvPDV/bsJWqHhURgHxlLFL8OiBlm/DXqHYeFPfhCDOtvqDMi
	14UmdsLUtrZT04183Lneb+L7PTmllLCs0IDQYUpHuw80HG3CNTMJ71wRZjyo8wMNCo77EBRCDz/
	OJhJzJXYUe0vv3JxFYjm8XI51EY2nPfwdtGeGcBmmH6yCrTZ5b7AktmNf6povrfaBLMCMk5aBtP
	HFQI4+kQ/BOQ4ABb3wdE0yn/0+cuO4vvuUXYRQsF9Nx+TZypLD+nIBeLj7utA8+K2KSsAYYFywS
	/6Mi3Z7lIZZNd1lD2kyEZLgKbwiF0xlahqR0pwwFxCizNrb4VE3JsORjioofuy21ztYxog==
X-Received: by 2002:a17:903:28f:b0:246:43a5:1ffb with SMTP id d9443c01a7336-24643a521f7mr126381225ad.4.1756117180489;
        Mon, 25 Aug 2025 03:19:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEjmTyKUkoEWzOUYcwb79AAOhhEPe3kvu8pI4WTiQNPhR8/CAFSQXj1UmJpuVN5zjQTQxJ/Ew==
X-Received: by 2002:a17:903:28f:b0:246:43a5:1ffb with SMTP id d9443c01a7336-24643a521f7mr126380935ad.4.1756117179887;
        Mon, 25 Aug 2025 03:19:39 -0700 (PDT)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-246687cedb2sm64540585ad.68.2025.08.25.03.19.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 03:19:39 -0700 (PDT)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
To: jeff.hugo@oss.qualcomm.com, bjorn.andersson@oss.qualcomm.com,
        konradybcio@kernel.org, konrad.dybcio@oss.qualcomm.com
Cc: andersson@kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v1 03/12] drivers: accel: qaic: Support for registration of image tables in Sahara.
Date: Mon, 25 Aug 2025 15:49:17 +0530
Message-Id: <20250825101926.2160554-4-kishore.batta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250825101926.2160554-1-kishore.batta@oss.qualcomm.com>
References: <20250825101926.2160554-1-kishore.batta@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX3p75ePyIHV38
 mxL671lFBNTkdBCzkQLyJKrajT91Nk6SnvYxurl1ukGIaVzzpe+CRer4ZqzghoJq1Cfc9POk2Bz
 8rKS1jdcsDHQCMPTkyD6MmD5FJy18UgnK93ZBCdtvT/TadsVVDRSc/z70nW6jxCESKObAfx4Wfg
 O7a79CH/XQEoFzxfUtvz49PdENYB+ai/hIdzev+y9ySPPf0dA0Nvy09ugZk7A+qNHjFEPm4jpGu
 UdCEs1QrMAdygpGriyzUX9KrgDgd3Ii5Cg2Bhii2LVsQIlImIqSncg7HEXgrTVYskUssa2baadw
 gdkr/lhUTTuaS/IXgHOjf7EIXfm5Ro2IOFTc7gG9OSjgUdymPPKaMHYH8+aELV2M1NepKL5dV/N
 MDM3Du4P
X-Authority-Analysis: v=2.4 cv=Lco86ifi c=1 sm=1 tr=0 ts=68ac38be cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=mQgoY6ctkFyh_drqFPoA:9
 a=3gCYNP70tfVVfRLa:21 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: 5aJoWYfBwL3_wIODerKwF4Oxl4zFyBNN
X-Proofpoint-ORIG-GUID: 5aJoWYfBwL3_wIODerKwF4Oxl4zFyBNN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_05,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 malwarescore=0 spamscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033

Support the registration of image tables in the Sahara driver. Each
Qualcomm device can define its own image table, and client drivers can
register their image tables with the Sahara protocol. The Sahara protocol
driver now exposes the necessary APIs to facilitate image table
registration and de-registration. These image tables are used by Sahara
to transfer images from the host filesystem to the device.

Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
---
 drivers/accel/qaic/Makefile                 |   3 +-
 drivers/accel/qaic/sahara_image_table.c     | 173 ++++++++++++++++++++
 drivers/accel/qaic/sahara_image_table_ops.h | 102 ++++++++++++
 3 files changed, 277 insertions(+), 1 deletion(-)
 create mode 100644 drivers/accel/qaic/sahara_image_table.c
 create mode 100644 drivers/accel/qaic/sahara_image_table_ops.h

diff --git a/drivers/accel/qaic/Makefile b/drivers/accel/qaic/Makefile
index 1106b876f737..586a6877e568 100644
--- a/drivers/accel/qaic/Makefile
+++ b/drivers/accel/qaic/Makefile
@@ -12,6 +12,7 @@ qaic-y := \
 	qaic_drv.o \
 	qaic_ras.o \
 	qaic_timesync.o \
-	sahara.o
+	sahara.o \
+	sahara_image_table.o
 
 qaic-$(CONFIG_DEBUG_FS) += qaic_debugfs.o
diff --git a/drivers/accel/qaic/sahara_image_table.c b/drivers/accel/qaic/sahara_image_table.c
new file mode 100644
index 000000000000..dd0793a33727
--- /dev/null
+++ b/drivers/accel/qaic/sahara_image_table.c
@@ -0,0 +1,173 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/* Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries. */
+
+#include <linux/device.h>
+#include <linux/list.h>
+#include <linux/mutex.h>
+
+#include "sahara_image_table_ops.h"
+
+struct sahara_image_table_context {
+	struct list_head provider_list;
+	/* Protects access to provider_list and related operations */
+	struct mutex provider_mutex;
+};
+
+static struct sahara_image_table_context sahara_img_ctx = {
+	.provider_list = LIST_HEAD_INIT(sahara_img_ctx.provider_list),
+	.provider_mutex = __MUTEX_INITIALIZER(sahara_img_ctx.provider_mutex),
+};
+
+/**
+ * sahara_register_image_table_provider - Register an image table provider.
+ * @provider: Pointer to the sahara_image_table_provider structure to be
+ *		registered.
+ *
+ * This function validates the provided sahara_image_table_provider structure
+ * and adds it to the global list of image table providers. The list is
+ * protected by a mutex to ensure thread-safe operations.
+ *
+ * Return: 0 on success, -EINVAL if the provider or its required fields are
+ *		invalid.
+ */
+int sahara_register_image_table_provider(struct sahara_image_table_provider
+					  *provider)
+{
+	/* Validate the provider and its required fields */
+	if (!provider || !provider->image_table || !provider->dev_name)
+		return -EINVAL;
+
+	/* Acquire the mutex before modifying the list */
+	mutex_lock(&sahara_img_ctx.provider_mutex);
+
+	/* Add the provider to the list */
+	list_add(&provider->list, &sahara_img_ctx.provider_list);
+
+	/* Release the mutex after modification */
+	mutex_unlock(&sahara_img_ctx.provider_mutex);
+
+	return 0;
+}
+
+/**
+ * sahara_get_image_table - Get the image table for a given device name
+ * @dev_name: The name of the device for which the image table is requested.
+ *
+ * This function iterates through the list of registered image table providers
+ * and returns the image table for the provider matching the given device name.
+ *
+ * Return: A pointer to the image table if found, or NULL if no matching
+ *		provider is found.
+ */
+const char * const *sahara_get_image_table(const char *dev_name)
+{
+	struct sahara_image_table_provider *provider;
+
+	/* Validate the device name */
+	if (!dev_name) {
+		pr_debug("sahara: Invalid argument %s\n", dev_name);
+		return NULL;
+	}
+
+	/* Iterate through the list to find the matching provider */
+	list_for_each_entry(provider, &sahara_img_ctx.provider_list, list) {
+		if (strcmp(provider->dev_name, dev_name) == 0)
+			return provider->image_table;
+	}
+
+	return NULL;
+}
+
+/**
+ * sahara_get_image_table_size - Get the size of the image table for a given
+ *				device name.
+ * @dev_name: The name of the device for which the image table size is requested
+ *
+ * This function iterates through the list of registered image table providers
+ * and returns the size of the image table for the provider matching the given
+ * device name.
+ *
+ * Return: The size of the image table if found, or 0 if no matching provider
+ *         is found or if the device name is invalid.
+ */
+size_t sahara_get_image_table_size(const char *dev_name)
+{
+	struct sahara_image_table_provider *provider;
+
+	/* Validate the dev name */
+	if (!dev_name) {
+		pr_debug("sahara: Invalid argument %s\n", dev_name);
+		return 0;
+	}
+
+	/* Iterate through the list to find the matching provider */
+	list_for_each_entry(provider, &sahara_img_ctx.provider_list, list) {
+		if (strcmp(provider->dev_name, dev_name) == 0)
+			return provider->image_table_size;
+	}
+
+	return 0;
+}
+
+/**
+ * sahara_unregister_image_table_provider - Unregister an image table provider.
+ * @provider: Pointer to the sahara_image_table_provider structure to be
+ *		unregistered
+ *
+ * This function validates the provided sahara_image_table_provider structure
+ * and removes it from the global list of image table providers. The list is
+ * protected by a mutex to ensure thread-safe operations.
+ *
+ * Return: 0 on success, -EINVAL if the provider is invalid.
+ */
+int sahara_unregister_image_table_provider(struct sahara_image_table_provider
+						*provider)
+{
+	/* Validate the provider */
+	if (!provider)
+		return -EINVAL;
+
+	/* Acquire the mutex before modifying the list */
+	mutex_lock(&sahara_img_ctx.provider_mutex);
+
+	/* Remove the provider from the list */
+	list_del(&provider->list);
+
+	/* Release the mutex after modification */
+	mutex_unlock(&sahara_img_ctx.provider_mutex);
+
+	return 0;
+}
+
+/**
+ * sahara_get_fw_folder_name - Retrieve the firmware folder name for a given
+ *				device
+ * @dev_name: Name of the device for which the firmware folder name is requested
+ *
+ * This function searches through the list of Sahara image table providers to
+ * find the provider matching the given device name. If a matching provider is
+ * found, the firmware folder name associated with that provider is returned.
+ * If the device name is invalid or no matching provider is found, the function
+ * returns NULL.
+ *
+ * Return: Firmware folder name if found, otherwise NULL.
+ */
+char *sahara_get_fw_folder_name(const char *dev_name)
+{
+	struct sahara_image_table_provider *provider;
+
+	/* Validate the device name */
+	if (!dev_name) {
+		pr_debug("sahara: Invalid argument %s\n", dev_name);
+		return NULL;
+	}
+
+	/* Iterate through the list to find the matching provider */
+	list_for_each_entry(provider, &sahara_img_ctx.provider_list, list) {
+		if (strcmp(provider->dev_name, dev_name) == 0)
+			return provider->fw_folder_name;
+	}
+
+	return NULL;
+}
diff --git a/drivers/accel/qaic/sahara_image_table_ops.h b/drivers/accel/qaic/sahara_image_table_ops.h
new file mode 100644
index 000000000000..f8496bd1aa35
--- /dev/null
+++ b/drivers/accel/qaic/sahara_image_table_ops.h
@@ -0,0 +1,102 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+/* Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries. */
+
+#ifndef __SAHARA_IMAGE_TABLE_OPS_H__
+#define __SAHARA_IMAGE_TABLE_OPS_H__
+
+#include <linux/list.h>
+
+/**
+ * struct sahara_image_table_provider - Structure representing an image table
+ *					provider.
+ * @image_table: Pointer to the image table
+ * @image_table_size: Size of the image table
+ * @dev_name: Device name to identify the provider
+ * @fw_folder_name: Name of the folder where the image binaries exist.
+ * @list: List head for linking providers in a list
+ *
+ * This structure is used to represent an image table provider in the Sahara
+ * driver. It contains a pointer to the image table, the size of the image
+ * table, the device name for identifying the provider, and a list head for
+ * linking providers in a linked list.
+ */
+struct sahara_image_table_provider {
+	const char * const *image_table;
+	size_t image_table_size;
+	const char *dev_name;
+	char *fw_folder_name;
+	struct list_head list;
+};
+
+/**
+ * sahara_register_image_table_provider - Register an image table provider.
+ * @provider: Pointer to the sahara_image_table_provider structure to be
+ *            registered.
+ *
+ * This function validates the provided sahara_image_table_provider structure
+ * and adds it to the global list of image table providers. The list is
+ * protected by a mutex to ensure thread-safe operations.
+ *
+ * Return: 0 on success, -EINVAL if the provider or its required fields are
+ *         invalid.
+ */
+int sahara_register_image_table_provider(struct sahara_image_table_provider
+					  *provider);
+
+/**
+ * sahara_get_image_table - Get the image table for a given device name
+ * @dev_name: The name of the device for which the image table is requested.
+ *
+ * This function iterates through the list of registered image table providers
+ * and returns the image table for the provider matching the given device name.
+ *
+ * Return: A pointer to the image table if found, or NULL if no matching
+ *         provider is found.
+ */
+const char * const *sahara_get_image_table(const char *dev_name);
+
+/**
+ * sahara_get_image_table_size - Get the size of the image table for a given
+ *                               device name.
+ * @dev_name: The name of the device for which the image table size is requested
+ *
+ * This function iterates through the list of registered image table providers
+ * and returns the size of the image table for the provider matching the given
+ * device name.
+ *
+ * Return: The size of the image table if found, or 0 if no matching provider
+ *         is found or if the device name is invalid.
+ */
+size_t sahara_get_image_table_size(const char *dev_name);
+
+/**
+ * sahara_unregister_image_table_provider - Unregister an image table provider.
+ * @provider: Pointer to the sahara_image_table_provider structure to be
+ *            unregistered
+ *
+ * This function validates the provided sahara_image_table_provider structure
+ * and removes it from the global list of image table providers. The list is
+ * protected by a mutex to ensure thread-safe operations.
+ *
+ * Return: 0 on success, -EINVAL if the provider is invalid.
+ */
+int sahara_unregister_image_table_provider(struct sahara_image_table_provider
+						*provider);
+
+/**
+ * sahara_get_fw_folder_name - Retrieve the firmware folder name for a given
+ *                             device
+ * @dev_name: Name of the device for which the firmware folder name is requested
+ *
+ * This function searches through the list of Sahara image table providers to
+ * find the provider matching the given device name. If a matching provider is
+ * found, the firmware folder name associated with that provider is returned.
+ * If the device name is invalid or no matching provider is found, the function
+ * returns NULL.
+ *
+ * Return: Firmware folder name if found, otherwise NULL.
+ */
+char *sahara_get_fw_folder_name(const char *dev_name);
+
+#endif // __SAHARA_IMAGE_TABLE_OPS_H__
-- 
2.34.1


