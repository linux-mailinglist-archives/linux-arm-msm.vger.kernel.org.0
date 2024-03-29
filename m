Return-Path: <linux-arm-msm+bounces-15764-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE0889251B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Mar 2024 21:18:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C2C8D1C20FFD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Mar 2024 20:18:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94B2713BAF9;
	Fri, 29 Mar 2024 20:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="APjr88NV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC9913B5A4;
	Fri, 29 Mar 2024 20:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711743535; cv=none; b=PgXJkDyJwnTpVk3Xgc25StdkJ+oFNrcomcMdOM91hg3ZxCyRFmQSVYdSqafw8GZFLn2Zg8xZ3snp7FiAvuElYfnXwNTYUo1hfkzQn+RqSGjVo8v+wAavAfzhkoWn4BFejUQvwhEQli9w5AByfl2gUTwrEpMqWXQWvfpxuy4KIXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711743535; c=relaxed/simple;
	bh=NOgiinjoqGckGJT1llxmO70Gi4q7y/bgl3srBrniABo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iNtIkQxsw/X6Qb254gc2K3gQEwSI0RJmi8EnsrrXoIHty2XABVtIdteilx+7DpJ5X0/Xs7fNhPWZw72CCUlAoQ6Dv1Dc/551H38Vpu//G+00Z4C3Im1bdeGVGfD/T0RshpleO557n16PRMJDYUO4YCPe4L+BpVg6Z1FtZbEr8Q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=APjr88NV; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-41544aef01aso13360915e9.1;
        Fri, 29 Mar 2024 13:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711743531; x=1712348331; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nmGogVRAYD9c4KSAZLa6u1/WrPKPB9YZqySTXUHg+XQ=;
        b=APjr88NVt5Xxihg0SHNTAYIa5wRrEa8/EuiLUZ2un4AON3Z+DCw2Ri6Aj8/7lxswl5
         WfQqQwBMma8PdjOEBg+WV+2osCRrwSP7mW41c8ZsA0l5lm/flPsjg49WgkWJsKlW18Dd
         CDHV44MY3CRnO6tdMhJF9KIsHCUuoMmZjKmAV8Jh6SXONHOU/bTDMpu4/WUjr6xHcnPI
         NbmEvOKDiMysh6Wy4kvIioc6GIPKUxFyAnM+WbtlNp4VDJSTsTLhGS8uxuvRjSftx4iU
         5mRrCReq0AGqNVK1S9cHW6Ftg0tXUyTJSA3BVWcdU/EIGPEn45nFrqhMCkWTHxVwKCbJ
         VV+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711743531; x=1712348331;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nmGogVRAYD9c4KSAZLa6u1/WrPKPB9YZqySTXUHg+XQ=;
        b=eRRqOoAOfUqc+lzxx/Bx/CwGJ32SB1+WM8PnMk4cB4psUEcUoTmWYKApj/3m7XwA9s
         TfxdJWEnHrkiNKMH/NKAV5YSsCjWBtA2QPrCEk823Pl97a38SUnSU7S7lM7+6KvU/ZID
         XvmsVTh10upyyerW+uiAf03GUGVQuOtWDu367r/nf1L8ddGuXL+BSzCc6ddEFKh88rr7
         8TS5I4iBp9r1BJVMsaSiZx1q1Yxl3CPlcI87cid3lAtZTiu2hiFWTCcf0mE/PwOnr9yg
         tdKqo5EWDajUci+CRCaoyhueWAGNSuXf6eP7yTejnxNOZ9R32xtFgbMIFi0m5oW1531b
         TpRA==
X-Forwarded-Encrypted: i=1; AJvYcCWn+VHVNhwWXrc9zzfttHWoFN1o+wUw+ZxhnOKQ0M8hxcb7MEKhFjNiJkita+0DGDESRcAl18LxYuRKtsHNJcqyG97jgYBrkxWbkowTc4cMvQXIu59tSm+J4qGRygvECzANXXfMoVpz67FBQg==
X-Gm-Message-State: AOJu0YzLgHRERFREgjeZfc3akHqhR9cl2xcq+37wpRTP3kBokhTEcsGA
	P4jpO40XTaN7FZ4Dbl+blWk3AedDTD3Ck6RHqvkTD3uKwM6xrYe8
X-Google-Smtp-Source: AGHT+IH1NTkc1enpUzazWfsSK+GBjkVN523B1PcoeVe/jcowBJGFEhi5Clnk/ZHDhQGZvqosK9hPWQ==
X-Received: by 2002:a05:600c:474c:b0:414:a54:ec04 with SMTP id w12-20020a05600c474c00b004140a54ec04mr2814613wmo.4.1711743530553;
        Fri, 29 Mar 2024 13:18:50 -0700 (PDT)
Received: from xws.fritz.box ([2a02:8071:b783:140:927c:82ba:d32d:99c1])
        by smtp.gmail.com with ESMTPSA id dd12-20020a0560001e8c00b00341b749ab8bsm4877529wrb.69.2024.03.29.13.18.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 13:18:49 -0700 (PDT)
From: Maximilian Luz <luzmaximilian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Maximilian Luz <luzmaximilian@gmail.com>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Johan Hovold <johan+linaro@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Guru Das Srinagesh <quic_gurus@quicinc.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] firmware: qcom: uefisecapp: Fix memory related IO errors and crashes
Date: Fri, 29 Mar 2024 21:18:25 +0100
Message-ID: <20240329201827.3108093-1-luzmaximilian@gmail.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It turns out that while the QSEECOM APP_SEND command has specific fields
for request and response buffers, uefisecapp expects them both to be in
a single memory region. Failure to adhere to this has (so far) resulted
in either no response being written to the response buffer (causing an
EIO to be emitted down the line), the SCM call to fail with EINVAL
(i.e., directly from TZ/firmware), or the device to be hard-reset.

While this issue can be triggered deterministically, in the current form
it seems to happen rather sporadically (which is why it has gone
unnoticed during earlier testing). This is likely due to the two
kzalloc() calls (for request and response) being directly after each
other. Which means that those likely return consecutive regions most of
the time, especially when not much else is going on in the system.

Fix this by allocating a single memory region for both request and
response buffers, properly aligning both structs inside it. This
unfortunately also means that the qcom_scm_qseecom_app_send() interface
needs to be restructured, as it should no longer map the DMA regions
separately. Therefore, move the responsibility of DMA allocation (or
mapping) to the caller.

Fixes: 759e7a2b62eb ("firmware: Add support for Qualcomm UEFI Secure Application")
Signed-off-by: Maximilian Luz <luzmaximilian@gmail.com>
---
 .../firmware/qcom/qcom_qseecom_uefisecapp.c   | 137 ++++++++++++------
 drivers/firmware/qcom/qcom_scm.c              |  41 +-----
 include/linux/firmware/qcom/qcom_qseecom.h    |  63 +++++++-
 include/linux/firmware/qcom/qcom_scm.h        |  10 +-
 4 files changed, 159 insertions(+), 92 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_qseecom_uefisecapp.c b/drivers/firmware/qcom/qcom_qseecom_uefisecapp.c
index 32188f098ef34..a7c8f658eb364 100644
--- a/drivers/firmware/qcom/qcom_qseecom_uefisecapp.c
+++ b/drivers/firmware/qcom/qcom_qseecom_uefisecapp.c
@@ -221,6 +221,19 @@ struct qsee_rsp_uefi_query_variable_info {
  * alignment of 8 bytes (64 bits) for GUIDs. Our definition of efi_guid_t,
  * however, has an alignment of 4 byte (32 bits). So far, this seems to work
  * fine here. See also the comment on the typedef of efi_guid_t.
+ *
+ * Note: It looks like uefisecapp is quite picky about how the memory passed to
+ * it is structured and aligned. In particular the request/response setup used
+ * for QSEE_CMD_UEFI_GET_VARIABLE. While qcom_qseecom_app_send(), in theory,
+ * accepts separate buffers/addresses for the request and response parts, in
+ * practice, however, it seems to expect them to be both part of a larger
+ * contiguous block. We initially allocated separate buffers for the request
+ * and response but this caused the QSEE_CMD_UEFI_GET_VARIABLE command to
+ * either not write any response to the response buffer or outright crash the
+ * device. Therefore, we now allocate a single contiguous block of DMA memory
+ * for both and properly align the data using the macros below. In particular,
+ * request and response structs are aligned at 8 byte (via __reqdata_offs()),
+ * following the driver that this has been reverse-engineered from.
  */
 #define qcuefi_buf_align_fields(fields...)					\
 	({									\
@@ -244,6 +257,12 @@ struct qsee_rsp_uefi_query_variable_info {
 #define __array_offs(type, count, offset)					\
 	__field_impl(sizeof(type) * (count), __alignof__(type), offset)
 
+#define __array_offs_aligned(type, count, align, offset)			\
+	__field_impl(sizeof(type) * (count), align, offset)
+
+#define __reqdata_offs(size, offset)						\
+	__array_offs_aligned(u8, size, 8, offset)
+
 #define __array(type, count)		__array_offs(type, count, NULL)
 #define __field_offs(type, offset)	__array_offs(type, 1, offset)
 #define __field(type)			__array_offs(type, 1, NULL)
@@ -277,10 +296,15 @@ static efi_status_t qsee_uefi_get_variable(struct qcuefi_client *qcuefi, const e
 	unsigned long buffer_size = *data_size;
 	efi_status_t efi_status = EFI_SUCCESS;
 	unsigned long name_length;
+	dma_addr_t cmd_buf_phys;
+	size_t cmd_buf_size;
+	void *cmd_buf_virt;
 	size_t guid_offs;
 	size_t name_offs;
 	size_t req_size;
 	size_t rsp_size;
+	size_t req_offs;
+	size_t rsp_offs;
 	ssize_t status;
 
 	if (!name || !guid)
@@ -304,17 +328,19 @@ static efi_status_t qsee_uefi_get_variable(struct qcuefi_client *qcuefi, const e
 		__array(u8, buffer_size)
 	);
 
-	req_data = kzalloc(req_size, GFP_KERNEL);
-	if (!req_data) {
+	cmd_buf_size = qcuefi_buf_align_fields(
+		__reqdata_offs(req_size, &req_offs)
+		__reqdata_offs(rsp_size, &rsp_offs)
+	);
+
+	cmd_buf_virt = qseecom_dma_alloc(qcuefi->client, cmd_buf_size, &cmd_buf_phys, GFP_KERNEL);
+	if (!cmd_buf_virt) {
 		efi_status = EFI_OUT_OF_RESOURCES;
 		goto out;
 	}
 
-	rsp_data = kzalloc(rsp_size, GFP_KERNEL);
-	if (!rsp_data) {
-		efi_status = EFI_OUT_OF_RESOURCES;
-		goto out_free_req;
-	}
+	req_data = cmd_buf_virt + req_offs;
+	rsp_data = cmd_buf_virt + rsp_offs;
 
 	req_data->command_id = QSEE_CMD_UEFI_GET_VARIABLE;
 	req_data->data_size = buffer_size;
@@ -332,7 +358,9 @@ static efi_status_t qsee_uefi_get_variable(struct qcuefi_client *qcuefi, const e
 
 	memcpy(((void *)req_data) + req_data->guid_offset, guid, req_data->guid_size);
 
-	status = qcom_qseecom_app_send(qcuefi->client, req_data, req_size, rsp_data, rsp_size);
+	status = qcom_qseecom_app_send(qcuefi->client,
+				       cmd_buf_phys + req_offs, req_size,
+				       cmd_buf_phys + rsp_offs, rsp_size);
 	if (status) {
 		efi_status = EFI_DEVICE_ERROR;
 		goto out_free;
@@ -407,9 +435,7 @@ static efi_status_t qsee_uefi_get_variable(struct qcuefi_client *qcuefi, const e
 	memcpy(data, ((void *)rsp_data) + rsp_data->data_offset, rsp_data->data_size);
 
 out_free:
-	kfree(rsp_data);
-out_free_req:
-	kfree(req_data);
+	qseecom_dma_free(qcuefi->client, cmd_buf_size, cmd_buf_virt, cmd_buf_phys);
 out:
 	return efi_status;
 }
@@ -422,10 +448,15 @@ static efi_status_t qsee_uefi_set_variable(struct qcuefi_client *qcuefi, const e
 	struct qsee_rsp_uefi_set_variable *rsp_data;
 	efi_status_t efi_status = EFI_SUCCESS;
 	unsigned long name_length;
+	dma_addr_t cmd_buf_phys;
+	size_t cmd_buf_size;
+	void *cmd_buf_virt;
 	size_t name_offs;
 	size_t guid_offs;
 	size_t data_offs;
 	size_t req_size;
+	size_t req_offs;
+	size_t rsp_offs;
 	ssize_t status;
 
 	if (!name || !guid)
@@ -450,17 +481,19 @@ static efi_status_t qsee_uefi_set_variable(struct qcuefi_client *qcuefi, const e
 		__array_offs(u8, data_size, &data_offs)
 	);
 
-	req_data = kzalloc(req_size, GFP_KERNEL);
-	if (!req_data) {
+	cmd_buf_size = qcuefi_buf_align_fields(
+		__reqdata_offs(req_size, &req_offs)
+		__reqdata_offs(sizeof(*rsp_data), &rsp_offs)
+	);
+
+	cmd_buf_virt = qseecom_dma_alloc(qcuefi->client, cmd_buf_size, &cmd_buf_phys, GFP_KERNEL);
+	if (!cmd_buf_virt) {
 		efi_status = EFI_OUT_OF_RESOURCES;
 		goto out;
 	}
 
-	rsp_data = kzalloc(sizeof(*rsp_data), GFP_KERNEL);
-	if (!rsp_data) {
-		efi_status = EFI_OUT_OF_RESOURCES;
-		goto out_free_req;
-	}
+	req_data = cmd_buf_virt + req_offs;
+	rsp_data = cmd_buf_virt + rsp_offs;
 
 	req_data->command_id = QSEE_CMD_UEFI_SET_VARIABLE;
 	req_data->attributes = attributes;
@@ -483,8 +516,9 @@ static efi_status_t qsee_uefi_set_variable(struct qcuefi_client *qcuefi, const e
 	if (data_size)
 		memcpy(((void *)req_data) + req_data->data_offset, data, req_data->data_size);
 
-	status = qcom_qseecom_app_send(qcuefi->client, req_data, req_size, rsp_data,
-				       sizeof(*rsp_data));
+	status = qcom_qseecom_app_send(qcuefi->client,
+				       cmd_buf_phys + req_offs, req_size,
+				       cmd_buf_phys + rsp_offs, sizeof(*rsp_data));
 	if (status) {
 		efi_status = EFI_DEVICE_ERROR;
 		goto out_free;
@@ -507,9 +541,7 @@ static efi_status_t qsee_uefi_set_variable(struct qcuefi_client *qcuefi, const e
 	}
 
 out_free:
-	kfree(rsp_data);
-out_free_req:
-	kfree(req_data);
+	qseecom_dma_free(qcuefi->client, cmd_buf_size, cmd_buf_virt, cmd_buf_phys);
 out:
 	return efi_status;
 }
@@ -521,10 +553,15 @@ static efi_status_t qsee_uefi_get_next_variable(struct qcuefi_client *qcuefi,
 	struct qsee_req_uefi_get_next_variable *req_data;
 	struct qsee_rsp_uefi_get_next_variable *rsp_data;
 	efi_status_t efi_status = EFI_SUCCESS;
+	dma_addr_t cmd_buf_phys;
+	size_t cmd_buf_size;
+	void *cmd_buf_virt;
 	size_t guid_offs;
 	size_t name_offs;
 	size_t req_size;
 	size_t rsp_size;
+	size_t req_offs;
+	size_t rsp_offs;
 	ssize_t status;
 
 	if (!name_size || !name || !guid)
@@ -545,17 +582,19 @@ static efi_status_t qsee_uefi_get_next_variable(struct qcuefi_client *qcuefi,
 		__array(*name, *name_size / sizeof(*name))
 	);
 
-	req_data = kzalloc(req_size, GFP_KERNEL);
-	if (!req_data) {
+	cmd_buf_size = qcuefi_buf_align_fields(
+		__reqdata_offs(req_size, &req_offs)
+		__reqdata_offs(rsp_size, &rsp_offs)
+	);
+
+	cmd_buf_virt = qseecom_dma_alloc(qcuefi->client, cmd_buf_size, &cmd_buf_phys, GFP_KERNEL);
+	if (!cmd_buf_virt) {
 		efi_status = EFI_OUT_OF_RESOURCES;
 		goto out;
 	}
 
-	rsp_data = kzalloc(rsp_size, GFP_KERNEL);
-	if (!rsp_data) {
-		efi_status = EFI_OUT_OF_RESOURCES;
-		goto out_free_req;
-	}
+	req_data = cmd_buf_virt + req_offs;
+	rsp_data = cmd_buf_virt + rsp_offs;
 
 	req_data->command_id = QSEE_CMD_UEFI_GET_NEXT_VARIABLE;
 	req_data->guid_offset = guid_offs;
@@ -572,7 +611,9 @@ static efi_status_t qsee_uefi_get_next_variable(struct qcuefi_client *qcuefi,
 		goto out_free;
 	}
 
-	status = qcom_qseecom_app_send(qcuefi->client, req_data, req_size, rsp_data, rsp_size);
+	status = qcom_qseecom_app_send(qcuefi->client,
+				       cmd_buf_phys + req_offs, req_size,
+				       cmd_buf_phys + rsp_offs, rsp_size);
 	if (status) {
 		efi_status = EFI_DEVICE_ERROR;
 		goto out_free;
@@ -645,9 +686,7 @@ static efi_status_t qsee_uefi_get_next_variable(struct qcuefi_client *qcuefi,
 	}
 
 out_free:
-	kfree(rsp_data);
-out_free_req:
-	kfree(req_data);
+	qseecom_dma_free(qcuefi->client, cmd_buf_size, cmd_buf_virt, cmd_buf_phys);
 out:
 	return efi_status;
 }
@@ -659,26 +698,34 @@ static efi_status_t qsee_uefi_query_variable_info(struct qcuefi_client *qcuefi,
 	struct qsee_req_uefi_query_variable_info *req_data;
 	struct qsee_rsp_uefi_query_variable_info *rsp_data;
 	efi_status_t efi_status = EFI_SUCCESS;
+	dma_addr_t cmd_buf_phys;
+	size_t cmd_buf_size;
+	void *cmd_buf_virt;
+	size_t req_offs;
+	size_t rsp_offs;
 	int status;
 
-	req_data = kzalloc(sizeof(*req_data), GFP_KERNEL);
-	if (!req_data) {
+	cmd_buf_size = qcuefi_buf_align_fields(
+		__reqdata_offs(sizeof(*req_data), &req_offs)
+		__reqdata_offs(sizeof(*rsp_data), &rsp_offs)
+	);
+
+	cmd_buf_virt = qseecom_dma_alloc(qcuefi->client, cmd_buf_size, &cmd_buf_phys, GFP_KERNEL);
+	if (!cmd_buf_virt) {
 		efi_status = EFI_OUT_OF_RESOURCES;
 		goto out;
 	}
 
-	rsp_data = kzalloc(sizeof(*rsp_data), GFP_KERNEL);
-	if (!rsp_data) {
-		efi_status = EFI_OUT_OF_RESOURCES;
-		goto out_free_req;
-	}
+	req_data = cmd_buf_virt + req_offs;
+	rsp_data = cmd_buf_virt + rsp_offs;
 
 	req_data->command_id = QSEE_CMD_UEFI_QUERY_VARIABLE_INFO;
 	req_data->attributes = attr;
 	req_data->length = sizeof(*req_data);
 
-	status = qcom_qseecom_app_send(qcuefi->client, req_data, sizeof(*req_data), rsp_data,
-				       sizeof(*rsp_data));
+	status = qcom_qseecom_app_send(qcuefi->client,
+				       cmd_buf_phys + req_offs, sizeof(*req_data),
+				       cmd_buf_phys + rsp_offs, sizeof(*rsp_data));
 	if (status) {
 		efi_status = EFI_DEVICE_ERROR;
 		goto out_free;
@@ -711,9 +758,7 @@ static efi_status_t qsee_uefi_query_variable_info(struct qcuefi_client *qcuefi,
 		*max_variable_size = rsp_data->max_variable_size;
 
 out_free:
-	kfree(rsp_data);
-out_free_req:
-	kfree(req_data);
+	qseecom_dma_free(qcuefi->client, cmd_buf_size, cmd_buf_virt, cmd_buf_phys);
 out:
 	return efi_status;
 }
diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 49ddbcab06800..fc59688227f43 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -1579,46 +1579,26 @@ EXPORT_SYMBOL_GPL(qcom_scm_qseecom_app_get_id);
 /**
  * qcom_scm_qseecom_app_send() - Send to and receive data from a given QSEE app.
  * @app_id:   The ID of the target app.
- * @req:      Request buffer sent to the app (must be DMA-mappable).
+ * @req:      Physical address of the request buffer sent to the app.
  * @req_size: Size of the request buffer.
- * @rsp:      Response buffer, written to by the app (must be DMA-mappable).
+ * @rsp:      Physical address of the response buffer, written to by the app.
  * @rsp_size: Size of the response buffer.
  *
  * Sends a request to the QSEE app associated with the given ID and read back
- * its response. The caller must provide two DMA memory regions, one for the
- * request and one for the response, and fill out the @req region with the
+ * its response. The caller must provide two physical memory regions, one for
+ * the request and one for the response, and fill out the @req region with the
  * respective (app-specific) request data. The QSEE app reads this and returns
  * its response in the @rsp region.
  *
  * Return: Zero on success, nonzero on failure.
  */
-int qcom_scm_qseecom_app_send(u32 app_id, void *req, size_t req_size, void *rsp,
-			      size_t rsp_size)
+int qcom_scm_qseecom_app_send(u32 app_id, dma_addr_t req, size_t req_size,
+			      dma_addr_t rsp, size_t rsp_size)
 {
 	struct qcom_scm_qseecom_resp res = {};
 	struct qcom_scm_desc desc = {};
-	dma_addr_t req_phys;
-	dma_addr_t rsp_phys;
 	int status;
 
-	/* Map request buffer */
-	req_phys = dma_map_single(__scm->dev, req, req_size, DMA_TO_DEVICE);
-	status = dma_mapping_error(__scm->dev, req_phys);
-	if (status) {
-		dev_err(__scm->dev, "qseecom: failed to map request buffer\n");
-		return status;
-	}
-
-	/* Map response buffer */
-	rsp_phys = dma_map_single(__scm->dev, rsp, rsp_size, DMA_FROM_DEVICE);
-	status = dma_mapping_error(__scm->dev, rsp_phys);
-	if (status) {
-		dma_unmap_single(__scm->dev, req_phys, req_size, DMA_TO_DEVICE);
-		dev_err(__scm->dev, "qseecom: failed to map response buffer\n");
-		return status;
-	}
-
-	/* Set up SCM call data */
 	desc.owner = QSEECOM_TZ_OWNER_TZ_APPS;
 	desc.svc = QSEECOM_TZ_SVC_APP_ID_PLACEHOLDER;
 	desc.cmd = QSEECOM_TZ_CMD_APP_SEND;
@@ -1626,18 +1606,13 @@ int qcom_scm_qseecom_app_send(u32 app_id, void *req, size_t req_size, void *rsp,
 				     QCOM_SCM_RW, QCOM_SCM_VAL,
 				     QCOM_SCM_RW, QCOM_SCM_VAL);
 	desc.args[0] = app_id;
-	desc.args[1] = req_phys;
+	desc.args[1] = req;
 	desc.args[2] = req_size;
-	desc.args[3] = rsp_phys;
+	desc.args[3] = rsp;
 	desc.args[4] = rsp_size;
 
-	/* Perform call */
 	status = qcom_scm_qseecom_call(&desc, &res);
 
-	/* Unmap buffers */
-	dma_unmap_single(__scm->dev, rsp_phys, rsp_size, DMA_FROM_DEVICE);
-	dma_unmap_single(__scm->dev, req_phys, req_size, DMA_TO_DEVICE);
-
 	if (status)
 		return status;
 
diff --git a/include/linux/firmware/qcom/qcom_qseecom.h b/include/linux/firmware/qcom/qcom_qseecom.h
index 5c28298a98bec..9ee3dd16a1f0e 100644
--- a/include/linux/firmware/qcom/qcom_qseecom.h
+++ b/include/linux/firmware/qcom/qcom_qseecom.h
@@ -10,6 +10,7 @@
 #define __QCOM_QSEECOM_H
 
 #include <linux/auxiliary_bus.h>
+#include <linux/dma-mapping.h>
 #include <linux/types.h>
 
 #include <linux/firmware/qcom/qcom_scm.h>
@@ -24,27 +25,73 @@ struct qseecom_client {
 	u32 app_id;
 };
 
+/**
+ * qseecom_scm_dev() - Get the SCM device associated with the QSEECOM client.
+ * @client: The QSEECOM client device.
+ *
+ * Returns the SCM device under which the provided QSEECOM client device
+ * operates. This function is intended to be used for DMA allocations.
+ */
+static inline struct device *qseecom_scm_dev(struct qseecom_client *client)
+{
+	return client->aux_dev.dev.parent->parent;
+}
+
+/**
+ * qseecom_dma_alloc() - Allocate DMA memory for a QSEECOM client.
+ * @client:     The QSEECOM client to allocate the memory for.
+ * @size:       The number of bytes to allocate.
+ * @dma_handle: Pointer to where the physical address should be stored.
+ * @gfp:        Allocation flags.
+ *
+ * Wrapper function for dma_alloc_coherent(), allocating DMA memory usable for
+ * TZ/QSEECOM communication. Refer to dma_alloc_coherent() for details.
+ */
+static inline void *qseecom_dma_alloc(struct qseecom_client *client, size_t size,
+				      dma_addr_t *dma_handle, gfp_t gfp)
+{
+	return dma_alloc_coherent(qseecom_scm_dev(client), size, dma_handle, gfp);
+}
+
+/**
+ * dma_free_coherent() - Free QSEECOM DMA memory.
+ * @client:     The QSEECOM client for which the memory has been allocated.
+ * @size:       The number of bytes allocated.
+ * @cpu_addr:   Virtual memory address to free.
+ * @dma_handle: Physical memory address to free.
+ *
+ * Wrapper function for dma_free_coherent(), freeing memory previously
+ * allocated with qseecom_dma_alloc(). Refer to dma_free_coherent() for
+ * details.
+ */
+static inline void qseecom_dma_free(struct qseecom_client *client, size_t size,
+				    void *cpu_addr, dma_addr_t dma_handle)
+{
+	return dma_free_coherent(qseecom_scm_dev(client), size, cpu_addr, dma_handle);
+}
+
 /**
  * qcom_qseecom_app_send() - Send to and receive data from a given QSEE app.
  * @client:   The QSEECOM client associated with the target app.
- * @req:      Request buffer sent to the app (must be DMA-mappable).
+ * @req:      Physical address of the request buffer sent to the app.
  * @req_size: Size of the request buffer.
- * @rsp:      Response buffer, written to by the app (must be DMA-mappable).
+ * @rsp:      Physical address of the response buffer, written to by the app.
  * @rsp_size: Size of the response buffer.
  *
  * Sends a request to the QSEE app associated with the given client and read
- * back its response. The caller must provide two DMA memory regions, one for
- * the request and one for the response, and fill out the @req region with the
- * respective (app-specific) request data. The QSEE app reads this and returns
- * its response in the @rsp region.
+ * back its response. The caller must provide two physical memory regions, one
+ * for the request and one for the response, and fill out the @req region with
+ * the respective (app-specific) request data. The QSEE app reads this and
+ * returns its response in the @rsp region.
  *
  * Note: This is a convenience wrapper around qcom_scm_qseecom_app_send().
  * Clients should prefer to use this wrapper.
  *
  * Return: Zero on success, nonzero on failure.
  */
-static inline int qcom_qseecom_app_send(struct qseecom_client *client, void *req, size_t req_size,
-					void *rsp, size_t rsp_size)
+static inline int qcom_qseecom_app_send(struct qseecom_client *client,
+					dma_addr_t req, size_t req_size,
+					dma_addr_t rsp, size_t rsp_size)
 {
 	return qcom_scm_qseecom_app_send(client->app_id, req, req_size, rsp, rsp_size);
 }
diff --git a/include/linux/firmware/qcom/qcom_scm.h b/include/linux/firmware/qcom/qcom_scm.h
index ccaf288460546..aaa19f93ac430 100644
--- a/include/linux/firmware/qcom/qcom_scm.h
+++ b/include/linux/firmware/qcom/qcom_scm.h
@@ -118,8 +118,8 @@ bool qcom_scm_lmh_dcvsh_available(void);
 #ifdef CONFIG_QCOM_QSEECOM
 
 int qcom_scm_qseecom_app_get_id(const char *app_name, u32 *app_id);
-int qcom_scm_qseecom_app_send(u32 app_id, void *req, size_t req_size, void *rsp,
-			      size_t rsp_size);
+int qcom_scm_qseecom_app_send(u32 app_id, dma_addr_t req, size_t req_size,
+			      dma_addr_t rsp, size_t rsp_size);
 
 #else /* CONFIG_QCOM_QSEECOM */
 
@@ -128,9 +128,9 @@ static inline int qcom_scm_qseecom_app_get_id(const char *app_name, u32 *app_id)
 	return -EINVAL;
 }
 
-static inline int qcom_scm_qseecom_app_send(u32 app_id, void *req,
-					    size_t req_size, void *rsp,
-					    size_t rsp_size)
+static inline int qcom_scm_qseecom_app_send(u32 app_id,
+					    dma_addr_t req, size_t req_size,
+					    dma_addr_t rsp, size_t rsp_size)
 {
 	return -EINVAL;
 }
-- 
2.44.0


