Return-Path: <linux-arm-msm+bounces-27203-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1001093F1FA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 11:58:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 63500B247D8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 09:58:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63CF8143759;
	Mon, 29 Jul 2024 09:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FVTxLPwG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36CB5143757;
	Mon, 29 Jul 2024 09:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722247034; cv=none; b=hAbu8fVKmuxUa1rhF+qLYpag21CvDcWa45bnaTALTDgghq0qVXhADNBjHZ6y74X8tO8Yon5xOL+dM4GLyYvyU9WcxD/4BC58zv45w2OuCOFX2skTVLxCGsdPIhV8IsdZlMSbC0hwJzSP4w2ux9hoG4lsU/GGOSpJhcj4vk8XVF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722247034; c=relaxed/simple;
	bh=49Ii3Da3Me0eZbs1n+nB2h0ORvxp03/nSNutD2z7xbA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HyISHe9mGWdvhWDex2Rz10kJ93Pz3062k7jcESGAivi0IsFDhIjQNFG4nNN7t8FuV1sHe7FF9hLXC34mRb96Sc2UWYpiM32INJ0yu7ckqbKY5roqnecAy18M4YWrbBot74Gj2KkTUkkt/pGTiJa71YoYUNeO2tGy1x4qMSLbu38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FVTxLPwG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 505A8C32786;
	Mon, 29 Jul 2024 09:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722247033;
	bh=49Ii3Da3Me0eZbs1n+nB2h0ORvxp03/nSNutD2z7xbA=;
	h=From:To:Cc:Subject:Date:From;
	b=FVTxLPwGwjT+j2nZAkG20aay4kgJzWvw9qXfP+NE49jg21PPcMYvGtZGnSQdcDw0q
	 nBkEUL1OWqMcLkCEMP7HfXvr/gJwoeE9V+PYbOGmJ21FYdoJfawxFuPXj876Ni0iFS
	 loO3rmz29ZEO8m26+omKgWoIMsvCDQpixXfEg/+HZDEako+q1WpZuf+yhNAVQ8svgx
	 plNYUJa9KPvH9YAYYYMXMAYJwctd3SDWV6ILTrgSwdsaX7cAajaIy6up95jx8oZBgP
	 lR08SBxZrEtwnzdfM7Kc8uW1wzc7RzmTXklbpwXgWSj39j6m8KbpsHUH4xCziOQoRY
	 aLyucWNIYGuwg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1sYN80-000000005Vi-3ikV;
	Mon, 29 Jul 2024 11:57:17 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Maximilian Luz <luzmaximilian@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Amirreza Zarrabi <quic_azarrabi@quicinc.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Elliot Berman <quic_eberman@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>,
	regressions@lists.linux.dev
Subject: [PATCH] Revert "firmware: qcom: qseecom: convert to using the TZ allocator"
Date: Mon, 29 Jul 2024 11:55:42 +0200
Message-ID: <20240729095542.21097-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.44.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reverts commit 6612103ec35af6058bb85ab24dae28e119b3c055.

Using the "TZ allocator" for qcseecom breaks efivars on machines like
the Lenovo ThinkPad X13s and x1e80100 CRD:

	qcom_scm firmware:scm: qseecom: scm call failed with error -22

Reverting to the 6.10 state makes qseecom work again.

Fixes: 6612103ec35a ("firmware: qcom: qseecom: convert to using the TZ allocator")
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
Cc: regressions@lists.linux.dev

#regzbot introduced: 6612103ec35a


It's a little frustrating to find that no-one tested this properly or
even noticed the regression for the past month that this has been
sitting in linux-next.

Looks like Maximilian may have hit this with v9 too:

	https://lore.kernel.org/lkml/CAMRc=Mf_pvrh2VMfTVE-ZTypyO010p=to-cd8Q745DzSDXLGFw@mail.gmail.com/

even if there were further issues with that revision.

Johan


 .../firmware/qcom/qcom_qseecom_uefisecapp.c   | 256 +++++++++++-------
 drivers/firmware/qcom/qcom_scm.c              |  17 +-
 include/linux/firmware/qcom/qcom_qseecom.h    |   8 +-
 include/linux/firmware/qcom/qcom_scm.h        |   8 +-
 4 files changed, 172 insertions(+), 117 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_qseecom_uefisecapp.c b/drivers/firmware/qcom/qcom_qseecom_uefisecapp.c
index 6fefa4fe80e8..bc550ad0dbe0 100644
--- a/drivers/firmware/qcom/qcom_qseecom_uefisecapp.c
+++ b/drivers/firmware/qcom/qcom_qseecom_uefisecapp.c
@@ -13,14 +13,11 @@
 #include <linux/mutex.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
-#include <linux/sizes.h>
 #include <linux/slab.h>
 #include <linux/types.h>
 #include <linux/ucs2_string.h>
 
 #include <linux/firmware/qcom/qcom_qseecom.h>
-#include <linux/firmware/qcom/qcom_scm.h>
-#include <linux/firmware/qcom/qcom_tzmem.h>
 
 /* -- Qualcomm "uefisecapp" interface definitions. -------------------------- */
 
@@ -275,7 +272,6 @@ struct qsee_rsp_uefi_query_variable_info {
 struct qcuefi_client {
 	struct qseecom_client *client;
 	struct efivars efivars;
-	struct qcom_tzmem_pool *mempool;
 };
 
 static struct device *qcuefi_dev(struct qcuefi_client *qcuefi)
@@ -297,11 +293,12 @@ static efi_status_t qsee_uefi_get_variable(struct qcuefi_client *qcuefi, const e
 {
 	struct qsee_req_uefi_get_variable *req_data;
 	struct qsee_rsp_uefi_get_variable *rsp_data;
-	void *cmd_buf __free(qcom_tzmem) = NULL;
 	unsigned long buffer_size = *data_size;
+	efi_status_t efi_status = EFI_SUCCESS;
 	unsigned long name_length;
-	efi_status_t efi_status;
+	dma_addr_t cmd_buf_dma;
 	size_t cmd_buf_size;
+	void *cmd_buf;
 	size_t guid_offs;
 	size_t name_offs;
 	size_t req_size;
@@ -336,9 +333,11 @@ static efi_status_t qsee_uefi_get_variable(struct qcuefi_client *qcuefi, const e
 		__reqdata_offs(rsp_size, &rsp_offs)
 	);
 
-	cmd_buf = qcom_tzmem_alloc(qcuefi->mempool, cmd_buf_size, GFP_KERNEL);
-	if (!cmd_buf)
-		return EFI_OUT_OF_RESOURCES;
+	cmd_buf = qseecom_dma_alloc(qcuefi->client, cmd_buf_size, &cmd_buf_dma, GFP_KERNEL);
+	if (!cmd_buf) {
+		efi_status = EFI_OUT_OF_RESOURCES;
+		goto out;
+	}
 
 	req_data = cmd_buf + req_offs;
 	rsp_data = cmd_buf + rsp_offs;
@@ -352,22 +351,30 @@ static efi_status_t qsee_uefi_get_variable(struct qcuefi_client *qcuefi, const e
 	req_data->length = req_size;
 
 	status = ucs2_strscpy(((void *)req_data) + req_data->name_offset, name, name_length);
-	if (status < 0)
-		return EFI_INVALID_PARAMETER;
+	if (status < 0) {
+		efi_status = EFI_INVALID_PARAMETER;
+		goto out_free;
+	}
 
 	memcpy(((void *)req_data) + req_data->guid_offset, guid, req_data->guid_size);
 
 	status = qcom_qseecom_app_send(qcuefi->client,
-				       cmd_buf + req_offs, req_size,
-				       cmd_buf + rsp_offs, rsp_size);
-	if (status)
-		return EFI_DEVICE_ERROR;
+				       cmd_buf_dma + req_offs, req_size,
+				       cmd_buf_dma + rsp_offs, rsp_size);
+	if (status) {
+		efi_status = EFI_DEVICE_ERROR;
+		goto out_free;
+	}
 
-	if (rsp_data->command_id != QSEE_CMD_UEFI_GET_VARIABLE)
-		return EFI_DEVICE_ERROR;
+	if (rsp_data->command_id != QSEE_CMD_UEFI_GET_VARIABLE) {
+		efi_status = EFI_DEVICE_ERROR;
+		goto out_free;
+	}
 
-	if (rsp_data->length < sizeof(*rsp_data))
-		return EFI_DEVICE_ERROR;
+	if (rsp_data->length < sizeof(*rsp_data)) {
+		efi_status = EFI_DEVICE_ERROR;
+		goto out_free;
+	}
 
 	if (rsp_data->status) {
 		dev_dbg(qcuefi_dev(qcuefi), "%s: uefisecapp error: 0x%x\n",
@@ -381,14 +388,18 @@ static efi_status_t qsee_uefi_get_variable(struct qcuefi_client *qcuefi, const e
 				*attributes = rsp_data->attributes;
 		}
 
-		return qsee_uefi_status_to_efi(rsp_data->status);
+		goto out_free;
 	}
 
-	if (rsp_data->length > rsp_size)
-		return EFI_DEVICE_ERROR;
+	if (rsp_data->length > rsp_size) {
+		efi_status = EFI_DEVICE_ERROR;
+		goto out_free;
+	}
 
-	if (rsp_data->data_offset + rsp_data->data_size > rsp_data->length)
-		return EFI_DEVICE_ERROR;
+	if (rsp_data->data_offset + rsp_data->data_size > rsp_data->length) {
+		efi_status = EFI_DEVICE_ERROR;
+		goto out_free;
+	}
 
 	/*
 	 * Note: We need to set attributes and data size even if the buffer is
@@ -411,15 +422,22 @@ static efi_status_t qsee_uefi_get_variable(struct qcuefi_client *qcuefi, const e
 	if (attributes)
 		*attributes = rsp_data->attributes;
 
-	if (buffer_size == 0 && !data)
-		return EFI_SUCCESS;
+	if (buffer_size == 0 && !data) {
+		efi_status = EFI_SUCCESS;
+		goto out_free;
+	}
 
-	if (buffer_size < rsp_data->data_size)
-		return EFI_BUFFER_TOO_SMALL;
+	if (buffer_size < rsp_data->data_size) {
+		efi_status = EFI_BUFFER_TOO_SMALL;
+		goto out_free;
+	}
 
 	memcpy(data, ((void *)rsp_data) + rsp_data->data_offset, rsp_data->data_size);
 
-	return EFI_SUCCESS;
+out_free:
+	qseecom_dma_free(qcuefi->client, cmd_buf_size, cmd_buf, cmd_buf_dma);
+out:
+	return efi_status;
 }
 
 static efi_status_t qsee_uefi_set_variable(struct qcuefi_client *qcuefi, const efi_char16_t *name,
@@ -428,9 +446,11 @@ static efi_status_t qsee_uefi_set_variable(struct qcuefi_client *qcuefi, const e
 {
 	struct qsee_req_uefi_set_variable *req_data;
 	struct qsee_rsp_uefi_set_variable *rsp_data;
-	void *cmd_buf __free(qcom_tzmem) = NULL;
+	efi_status_t efi_status = EFI_SUCCESS;
 	unsigned long name_length;
+	dma_addr_t cmd_buf_dma;
 	size_t cmd_buf_size;
+	void *cmd_buf;
 	size_t name_offs;
 	size_t guid_offs;
 	size_t data_offs;
@@ -466,9 +486,11 @@ static efi_status_t qsee_uefi_set_variable(struct qcuefi_client *qcuefi, const e
 		__reqdata_offs(sizeof(*rsp_data), &rsp_offs)
 	);
 
-	cmd_buf = qcom_tzmem_alloc(qcuefi->mempool, cmd_buf_size, GFP_KERNEL);
-	if (!cmd_buf)
-		return EFI_OUT_OF_RESOURCES;
+	cmd_buf = qseecom_dma_alloc(qcuefi->client, cmd_buf_size, &cmd_buf_dma, GFP_KERNEL);
+	if (!cmd_buf) {
+		efi_status = EFI_OUT_OF_RESOURCES;
+		goto out;
+	}
 
 	req_data = cmd_buf + req_offs;
 	rsp_data = cmd_buf + rsp_offs;
@@ -484,8 +506,10 @@ static efi_status_t qsee_uefi_set_variable(struct qcuefi_client *qcuefi, const e
 	req_data->length = req_size;
 
 	status = ucs2_strscpy(((void *)req_data) + req_data->name_offset, name, name_length);
-	if (status < 0)
-		return EFI_INVALID_PARAMETER;
+	if (status < 0) {
+		efi_status = EFI_INVALID_PARAMETER;
+		goto out_free;
+	}
 
 	memcpy(((void *)req_data) + req_data->guid_offset, guid, req_data->guid_size);
 
@@ -493,24 +517,33 @@ static efi_status_t qsee_uefi_set_variable(struct qcuefi_client *qcuefi, const e
 		memcpy(((void *)req_data) + req_data->data_offset, data, req_data->data_size);
 
 	status = qcom_qseecom_app_send(qcuefi->client,
-				       cmd_buf + req_offs, req_size,
-				       cmd_buf + rsp_offs, sizeof(*rsp_data));
-	if (status)
-		return EFI_DEVICE_ERROR;
+				       cmd_buf_dma + req_offs, req_size,
+				       cmd_buf_dma + rsp_offs, sizeof(*rsp_data));
+	if (status) {
+		efi_status = EFI_DEVICE_ERROR;
+		goto out_free;
+	}
 
-	if (rsp_data->command_id != QSEE_CMD_UEFI_SET_VARIABLE)
-		return EFI_DEVICE_ERROR;
+	if (rsp_data->command_id != QSEE_CMD_UEFI_SET_VARIABLE) {
+		efi_status = EFI_DEVICE_ERROR;
+		goto out_free;
+	}
 
-	if (rsp_data->length != sizeof(*rsp_data))
-		return EFI_DEVICE_ERROR;
+	if (rsp_data->length != sizeof(*rsp_data)) {
+		efi_status = EFI_DEVICE_ERROR;
+		goto out_free;
+	}
 
 	if (rsp_data->status) {
 		dev_dbg(qcuefi_dev(qcuefi), "%s: uefisecapp error: 0x%x\n",
 			__func__, rsp_data->status);
-		return qsee_uefi_status_to_efi(rsp_data->status);
+		efi_status = qsee_uefi_status_to_efi(rsp_data->status);
 	}
 
-	return EFI_SUCCESS;
+out_free:
+	qseecom_dma_free(qcuefi->client, cmd_buf_size, cmd_buf, cmd_buf_dma);
+out:
+	return efi_status;
 }
 
 static efi_status_t qsee_uefi_get_next_variable(struct qcuefi_client *qcuefi,
@@ -519,9 +552,10 @@ static efi_status_t qsee_uefi_get_next_variable(struct qcuefi_client *qcuefi,
 {
 	struct qsee_req_uefi_get_next_variable *req_data;
 	struct qsee_rsp_uefi_get_next_variable *rsp_data;
-	void *cmd_buf __free(qcom_tzmem) = NULL;
-	efi_status_t efi_status;
+	efi_status_t efi_status = EFI_SUCCESS;
+	dma_addr_t cmd_buf_dma;
 	size_t cmd_buf_size;
+	void *cmd_buf;
 	size_t guid_offs;
 	size_t name_offs;
 	size_t req_size;
@@ -553,9 +587,11 @@ static efi_status_t qsee_uefi_get_next_variable(struct qcuefi_client *qcuefi,
 		__reqdata_offs(rsp_size, &rsp_offs)
 	);
 
-	cmd_buf = qcom_tzmem_alloc(qcuefi->mempool, cmd_buf_size, GFP_KERNEL);
-	if (!cmd_buf)
-		return EFI_OUT_OF_RESOURCES;
+	cmd_buf = qseecom_dma_alloc(qcuefi->client, cmd_buf_size, &cmd_buf_dma, GFP_KERNEL);
+	if (!cmd_buf) {
+		efi_status = EFI_OUT_OF_RESOURCES;
+		goto out;
+	}
 
 	req_data = cmd_buf + req_offs;
 	rsp_data = cmd_buf + rsp_offs;
@@ -570,20 +606,28 @@ static efi_status_t qsee_uefi_get_next_variable(struct qcuefi_client *qcuefi,
 	memcpy(((void *)req_data) + req_data->guid_offset, guid, req_data->guid_size);
 	status = ucs2_strscpy(((void *)req_data) + req_data->name_offset, name,
 			      *name_size / sizeof(*name));
-	if (status < 0)
-		return EFI_INVALID_PARAMETER;
+	if (status < 0) {
+		efi_status = EFI_INVALID_PARAMETER;
+		goto out_free;
+	}
 
 	status = qcom_qseecom_app_send(qcuefi->client,
-				       cmd_buf + req_offs, req_size,
-				       cmd_buf + rsp_offs, rsp_size);
-	if (status)
-		return EFI_DEVICE_ERROR;
+				       cmd_buf_dma + req_offs, req_size,
+				       cmd_buf_dma + rsp_offs, rsp_size);
+	if (status) {
+		efi_status = EFI_DEVICE_ERROR;
+		goto out_free;
+	}
 
-	if (rsp_data->command_id != QSEE_CMD_UEFI_GET_NEXT_VARIABLE)
-		return EFI_DEVICE_ERROR;
+	if (rsp_data->command_id != QSEE_CMD_UEFI_GET_NEXT_VARIABLE) {
+		efi_status = EFI_DEVICE_ERROR;
+		goto out_free;
+	}
 
-	if (rsp_data->length < sizeof(*rsp_data))
-		return EFI_DEVICE_ERROR;
+	if (rsp_data->length < sizeof(*rsp_data)) {
+		efi_status = EFI_DEVICE_ERROR;
+		goto out_free;
+	}
 
 	if (rsp_data->status) {
 		dev_dbg(qcuefi_dev(qcuefi), "%s: uefisecapp error: 0x%x\n",
@@ -598,40 +642,53 @@ static efi_status_t qsee_uefi_get_next_variable(struct qcuefi_client *qcuefi,
 		if (efi_status == EFI_BUFFER_TOO_SMALL)
 			*name_size = rsp_data->name_size;
 
-		return efi_status;
+		goto out_free;
 	}
 
-	if (rsp_data->length > rsp_size)
-		return EFI_DEVICE_ERROR;
+	if (rsp_data->length > rsp_size) {
+		efi_status = EFI_DEVICE_ERROR;
+		goto out_free;
+	}
 
-	if (rsp_data->name_offset + rsp_data->name_size > rsp_data->length)
-		return EFI_DEVICE_ERROR;
+	if (rsp_data->name_offset + rsp_data->name_size > rsp_data->length) {
+		efi_status = EFI_DEVICE_ERROR;
+		goto out_free;
+	}
 
-	if (rsp_data->guid_offset + rsp_data->guid_size > rsp_data->length)
-		return EFI_DEVICE_ERROR;
+	if (rsp_data->guid_offset + rsp_data->guid_size > rsp_data->length) {
+		efi_status = EFI_DEVICE_ERROR;
+		goto out_free;
+	}
 
 	if (rsp_data->name_size > *name_size) {
 		*name_size = rsp_data->name_size;
-		return EFI_BUFFER_TOO_SMALL;
+		efi_status = EFI_BUFFER_TOO_SMALL;
+		goto out_free;
 	}
 
-	if (rsp_data->guid_size != sizeof(*guid))
-		return EFI_DEVICE_ERROR;
+	if (rsp_data->guid_size != sizeof(*guid)) {
+		efi_status = EFI_DEVICE_ERROR;
+		goto out_free;
+	}
 
 	memcpy(guid, ((void *)rsp_data) + rsp_data->guid_offset, rsp_data->guid_size);
 	status = ucs2_strscpy(name, ((void *)rsp_data) + rsp_data->name_offset,
 			      rsp_data->name_size / sizeof(*name));
 	*name_size = rsp_data->name_size;
 
-	if (status < 0)
+	if (status < 0) {
 		/*
 		 * Return EFI_DEVICE_ERROR here because the buffer size should
 		 * have already been validated above, causing this function to
 		 * bail with EFI_BUFFER_TOO_SMALL.
 		 */
-		return EFI_DEVICE_ERROR;
+		efi_status = EFI_DEVICE_ERROR;
+	}
 
-	return EFI_SUCCESS;
+out_free:
+	qseecom_dma_free(qcuefi->client, cmd_buf_size, cmd_buf, cmd_buf_dma);
+out:
+	return efi_status;
 }
 
 static efi_status_t qsee_uefi_query_variable_info(struct qcuefi_client *qcuefi, u32 attr,
@@ -640,8 +697,10 @@ static efi_status_t qsee_uefi_query_variable_info(struct qcuefi_client *qcuefi,
 {
 	struct qsee_req_uefi_query_variable_info *req_data;
 	struct qsee_rsp_uefi_query_variable_info *rsp_data;
-	void *cmd_buf __free(qcom_tzmem) = NULL;
+	efi_status_t efi_status = EFI_SUCCESS;
+	dma_addr_t cmd_buf_dma;
 	size_t cmd_buf_size;
+	void *cmd_buf;
 	size_t req_offs;
 	size_t rsp_offs;
 	int status;
@@ -651,9 +710,11 @@ static efi_status_t qsee_uefi_query_variable_info(struct qcuefi_client *qcuefi,
 		__reqdata_offs(sizeof(*rsp_data), &rsp_offs)
 	);
 
-	cmd_buf = qcom_tzmem_alloc(qcuefi->mempool, cmd_buf_size, GFP_KERNEL);
-	if (!cmd_buf)
-		return EFI_OUT_OF_RESOURCES;
+	cmd_buf = qseecom_dma_alloc(qcuefi->client, cmd_buf_size, &cmd_buf_dma, GFP_KERNEL);
+	if (!cmd_buf) {
+		efi_status = EFI_OUT_OF_RESOURCES;
+		goto out;
+	}
 
 	req_data = cmd_buf + req_offs;
 	rsp_data = cmd_buf + rsp_offs;
@@ -663,21 +724,28 @@ static efi_status_t qsee_uefi_query_variable_info(struct qcuefi_client *qcuefi,
 	req_data->length = sizeof(*req_data);
 
 	status = qcom_qseecom_app_send(qcuefi->client,
-				       cmd_buf + req_offs, sizeof(*req_data),
-				       cmd_buf + rsp_offs, sizeof(*rsp_data));
-	if (status)
-		return EFI_DEVICE_ERROR;
+				       cmd_buf_dma + req_offs, sizeof(*req_data),
+				       cmd_buf_dma + rsp_offs, sizeof(*rsp_data));
+	if (status) {
+		efi_status = EFI_DEVICE_ERROR;
+		goto out_free;
+	}
 
-	if (rsp_data->command_id != QSEE_CMD_UEFI_QUERY_VARIABLE_INFO)
-		return EFI_DEVICE_ERROR;
+	if (rsp_data->command_id != QSEE_CMD_UEFI_QUERY_VARIABLE_INFO) {
+		efi_status = EFI_DEVICE_ERROR;
+		goto out_free;
+	}
 
-	if (rsp_data->length != sizeof(*rsp_data))
-		return EFI_DEVICE_ERROR;
+	if (rsp_data->length != sizeof(*rsp_data)) {
+		efi_status = EFI_DEVICE_ERROR;
+		goto out_free;
+	}
 
 	if (rsp_data->status) {
 		dev_dbg(qcuefi_dev(qcuefi), "%s: uefisecapp error: 0x%x\n",
 			__func__, rsp_data->status);
-		return qsee_uefi_status_to_efi(rsp_data->status);
+		efi_status = qsee_uefi_status_to_efi(rsp_data->status);
+		goto out_free;
 	}
 
 	if (storage_space)
@@ -689,7 +757,10 @@ static efi_status_t qsee_uefi_query_variable_info(struct qcuefi_client *qcuefi,
 	if (max_variable_size)
 		*max_variable_size = rsp_data->max_variable_size;
 
-	return EFI_SUCCESS;
+out_free:
+	qseecom_dma_free(qcuefi->client, cmd_buf_size, cmd_buf, cmd_buf_dma);
+out:
+	return efi_status;
 }
 
 /* -- Global efivar interface. ---------------------------------------------- */
@@ -800,7 +871,6 @@ static const struct efivar_operations qcom_efivar_ops = {
 static int qcom_uefisecapp_probe(struct auxiliary_device *aux_dev,
 				 const struct auxiliary_device_id *aux_dev_id)
 {
-	struct qcom_tzmem_pool_config pool_config;
 	struct qcuefi_client *qcuefi;
 	int status;
 
@@ -819,16 +889,6 @@ static int qcom_uefisecapp_probe(struct auxiliary_device *aux_dev,
 	if (status)
 		qcuefi_set_reference(NULL);
 
-	memset(&pool_config, 0, sizeof(pool_config));
-	pool_config.initial_size = SZ_4K;
-	pool_config.policy = QCOM_TZMEM_POLICY_MULTIPLIER;
-	pool_config.increment = 2;
-	pool_config.max_size = SZ_256K;
-
-	qcuefi->mempool = devm_qcom_tzmem_pool_new(&aux_dev->dev, &pool_config);
-	if (IS_ERR(qcuefi->mempool))
-		return PTR_ERR(qcuefi->mempool);
-
 	return status;
 }
 
diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index e60bef68401c..4d4ec000fe1e 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -1669,9 +1669,9 @@ EXPORT_SYMBOL_GPL(qcom_scm_qseecom_app_get_id);
 /**
  * qcom_scm_qseecom_app_send() - Send to and receive data from a given QSEE app.
  * @app_id:   The ID of the target app.
- * @req:      Request buffer sent to the app (must be TZ memory)
+ * @req:      DMA address of the request buffer sent to the app.
  * @req_size: Size of the request buffer.
- * @rsp:      Response buffer, written to by the app (must be TZ memory)
+ * @rsp:      DMA address of the response buffer, written to by the app.
  * @rsp_size: Size of the response buffer.
  *
  * Sends a request to the QSEE app associated with the given ID and read back
@@ -1682,18 +1682,13 @@ EXPORT_SYMBOL_GPL(qcom_scm_qseecom_app_get_id);
  *
  * Return: Zero on success, nonzero on failure.
  */
-int qcom_scm_qseecom_app_send(u32 app_id, void *req, size_t req_size,
-			      void *rsp, size_t rsp_size)
+int qcom_scm_qseecom_app_send(u32 app_id, dma_addr_t req, size_t req_size,
+			      dma_addr_t rsp, size_t rsp_size)
 {
 	struct qcom_scm_qseecom_resp res = {};
 	struct qcom_scm_desc desc = {};
-	phys_addr_t req_phys;
-	phys_addr_t rsp_phys;
 	int status;
 
-	req_phys = qcom_tzmem_to_phys(req);
-	rsp_phys = qcom_tzmem_to_phys(rsp);
-
 	desc.owner = QSEECOM_TZ_OWNER_TZ_APPS;
 	desc.svc = QSEECOM_TZ_SVC_APP_ID_PLACEHOLDER;
 	desc.cmd = QSEECOM_TZ_CMD_APP_SEND;
@@ -1701,9 +1696,9 @@ int qcom_scm_qseecom_app_send(u32 app_id, void *req, size_t req_size,
 				     QCOM_SCM_RW, QCOM_SCM_VAL,
 				     QCOM_SCM_RW, QCOM_SCM_VAL);
 	desc.args[0] = app_id;
-	desc.args[1] = req_phys;
+	desc.args[1] = req;
 	desc.args[2] = req_size;
-	desc.args[3] = rsp_phys;
+	desc.args[3] = rsp;
 	desc.args[4] = rsp_size;
 
 	status = qcom_scm_qseecom_call(&desc, &res);
diff --git a/include/linux/firmware/qcom/qcom_qseecom.h b/include/linux/firmware/qcom/qcom_qseecom.h
index 1dc5b3b50aa9..366243ee9609 100644
--- a/include/linux/firmware/qcom/qcom_qseecom.h
+++ b/include/linux/firmware/qcom/qcom_qseecom.h
@@ -73,9 +73,9 @@ static inline void qseecom_dma_free(struct qseecom_client *client, size_t size,
 /**
  * qcom_qseecom_app_send() - Send to and receive data from a given QSEE app.
  * @client:   The QSEECOM client associated with the target app.
- * @req:      Request buffer sent to the app (must be TZ memory).
+ * @req:      DMA address of the request buffer sent to the app.
  * @req_size: Size of the request buffer.
- * @rsp:      Response buffer, written to by the app (must be TZ memory).
+ * @rsp:      DMA address of the response buffer, written to by the app.
  * @rsp_size: Size of the response buffer.
  *
  * Sends a request to the QSEE app associated with the given client and read
@@ -90,8 +90,8 @@ static inline void qseecom_dma_free(struct qseecom_client *client, size_t size,
  * Return: Zero on success, nonzero on failure.
  */
 static inline int qcom_qseecom_app_send(struct qseecom_client *client,
-					void *req, size_t req_size,
-					void *rsp, size_t rsp_size)
+					dma_addr_t req, size_t req_size,
+					dma_addr_t rsp, size_t rsp_size)
 {
 	return qcom_scm_qseecom_app_send(client->app_id, req, req_size, rsp, rsp_size);
 }
diff --git a/include/linux/firmware/qcom/qcom_scm.h b/include/linux/firmware/qcom/qcom_scm.h
index 9f14976399ab..39354b5b71e2 100644
--- a/include/linux/firmware/qcom/qcom_scm.h
+++ b/include/linux/firmware/qcom/qcom_scm.h
@@ -147,8 +147,8 @@ int qcom_scm_shm_bridge_delete(struct device *dev, u64 handle);
 #ifdef CONFIG_QCOM_QSEECOM
 
 int qcom_scm_qseecom_app_get_id(const char *app_name, u32 *app_id);
-int qcom_scm_qseecom_app_send(u32 app_id, void *req, size_t req_size,
-			      void *rsp, size_t rsp_size);
+int qcom_scm_qseecom_app_send(u32 app_id, dma_addr_t req, size_t req_size,
+			      dma_addr_t rsp, size_t rsp_size);
 
 #else /* CONFIG_QCOM_QSEECOM */
 
@@ -158,8 +158,8 @@ static inline int qcom_scm_qseecom_app_get_id(const char *app_name, u32 *app_id)
 }
 
 static inline int qcom_scm_qseecom_app_send(u32 app_id,
-					    void *req, size_t req_size,
-					    void *rsp, size_t rsp_size)
+					    dma_addr_t req, size_t req_size,
+					    dma_addr_t rsp, size_t rsp_size)
 {
 	return -EINVAL;
 }
-- 
2.44.2


