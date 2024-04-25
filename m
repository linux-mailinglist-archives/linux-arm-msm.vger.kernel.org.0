Return-Path: <linux-arm-msm+bounces-18580-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3E28B24CC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Apr 2024 17:13:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6C4A228CCDC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Apr 2024 15:13:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5DFE14A61B;
	Thu, 25 Apr 2024 15:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WjvTEbU0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27E0F5B1F8
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Apr 2024 15:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714058033; cv=none; b=uAUVsXwSjUajPqd47Pvx2yx3c4kXsBFQenn6hftkpB7fKcVvcN4a8UNHiZOG4qhEwNMlXNx9EzymGuvUthz6HJVpSlgkgL5RH2BwimefIcvD7C7RXwmTmW6JurCfaVl8Dezkmo5uEH82F7lE9c7CouG+SwKS8PYqbj56FcGzmhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714058033; c=relaxed/simple;
	bh=XUzRs0wXBmoO+YZhtSTXqxFtPZp+CajmtQ3Vq2OGRfs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hTEGG3q5mMCxWE5/He8XGGSUCVHddHzYw2nkz0vqeNHZYrwS6lHX8rFYjuV+oZTgvzIrjoHqgm+npGxFP4tedRFmmHPzaYvEtHTU1K+l0XJXgMRcR7SI4UOr2k3SEXF8gguo2tPwFm/WzUDZhydRgDzc6Hou/+6MZ3mfybqis+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WjvTEbU0; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-41af670185fso8648455e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Apr 2024 08:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714058030; x=1714662830; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6DmU29abcyY7CYTw3DnjonwAFGdqYAvt0U0EAWoXp+E=;
        b=WjvTEbU0TpJXl32ZoiIoJgdwz1XvunmjcZNRYwruBi8R0CwHmPf6wVcdOhdtSzh9aa
         dbVzEQ0iFVUPxn/w6NJ1gwGOIVgD03uIWQE4a1ePDp0XUqUJZNJK38fcxRtHCqHP9Z+H
         blIfi0HRBdX8A8km2fEs90K2rPp9610WeM1nWjXWvjJiRznJgEuNTTVJm6hmuMgE+Sim
         P9jrwZQR6TQbkmihHqm9Ey89GswhP0/beWVp3xla9MAvfzs58Av3utCvqGWSxchHL0Yy
         vioD21/ykmUBI1yHoSyzbvE4o3TOsbq2T1UTHp/O5fBhrlEwCpikRp5VRF8POazyZQk0
         NVkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714058030; x=1714662830;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6DmU29abcyY7CYTw3DnjonwAFGdqYAvt0U0EAWoXp+E=;
        b=AwZLJoWuQCe5Otr2VbFB5dy/x6NnUMpA4I4zGZ0RGhFmELB0uZ8tk5crkgPkBBDcuu
         qRvs1Zb+XLxPSO9Dto1CUvmXAmJZ3/26NSxdQGXb1DPJsdg/68rW5f/POk/+TFZS5Ks0
         aoJeEOyPZB/qTlQ7eYZt99lbjVrn4/qyIn3DNzEYoCv/DnbKX6eQ3iU7adJb0zEFWM5D
         SpB8aBlru4Af0Z9+5Z+h4TscJ77tRgiyGYsBBKq8IydxT81Ui/28l3uKJAYIWC6BFbDA
         jm9ODXZWK7J/7N3eSy/9ko9cD6/+k/Xeof+/yvZKMO3ngrDTm1IvqbFOCOHIKfO9RU3n
         7taA==
X-Forwarded-Encrypted: i=1; AJvYcCU23czHMRdt6bJaY+cOH+pAaa++WD5a1AwsvOlPadeXQU610TXGscJdSdRzT9SqUmji/fwQeP1eDG2QD6DNsFKVFY/ikUZNOb4XMLz3qg==
X-Gm-Message-State: AOJu0YybM68v5oBRGDoxHBSMugtBtYfZTTrg4XOlaggpzIaZUtm4lPde
	WEu/ApeXFMJELrLqo2CqeyqK07nb2sT1ygwnqaEVSLg93987s9qN
X-Google-Smtp-Source: AGHT+IFFXYfdQYsPsqfNEjPFCn+04/lZ21MmuP1wB4vqmfruN/lavADhs3HDmd9y9onracT/rTsdAg==
X-Received: by 2002:a05:600c:1f91:b0:41a:821b:37f7 with SMTP id je17-20020a05600c1f9100b0041a821b37f7mr4048108wmb.27.1714058030156;
        Thu, 25 Apr 2024 08:13:50 -0700 (PDT)
Received: from lucy.. (cpc115152-dals23-2-0-cust532.20-2.cable.virginm.net. [86.12.82.21])
        by smtp.gmail.com with ESMTPSA id z9-20020a05600c0a0900b00418916f5848sm27405136wmp.43.2024.04.25.08.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Apr 2024 08:13:49 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-arm-msm@vger.kernel.org
Cc: Connor Abbott <cwabbott0@gmail.com>
Subject: [PATCH 2/6] firmware: qcom_scm: Add gpu_init_regs call
Date: Thu, 25 Apr 2024 16:13:46 +0100
Message-Id: <20240425151346.1258971-1-cwabbott0@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20240425134354.1233862-1-cwabbott0@gmail.com>
References: <20240425134354.1233862-1-cwabbott0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This will used by drm/msm.

Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
---
 drivers/firmware/qcom/qcom_scm.c       | 14 ++++++++++++++
 drivers/firmware/qcom/qcom_scm.h       |  3 +++
 include/linux/firmware/qcom/qcom_scm.h | 23 +++++++++++++++++++++++
 3 files changed, 40 insertions(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 06e46267161b..f8623ad0987c 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -1394,6 +1394,20 @@ int qcom_scm_lmh_dcvsh(u32 payload_fn, u32 payload_reg, u32 payload_val,
 }
 EXPORT_SYMBOL_GPL(qcom_scm_lmh_dcvsh);
 
+int qcom_scm_gpu_init_regs(u32 gpu_req)
+{
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_GPU,
+		.cmd = QCOM_SCM_SVC_GPU_INIT_REGS,
+		.arginfo = QCOM_SCM_ARGS(1),
+		.args[0] = gpu_req,
+		.owner = ARM_SMCCC_OWNER_SIP,
+	};
+
+	return qcom_scm_call(__scm->dev, &desc, NULL);
+}
+EXPORT_SYMBOL_GPL(qcom_scm_gpu_init_regs);
+
 static int qcom_scm_find_dload_address(struct device *dev, u64 *addr)
 {
 	struct device_node *tcsr;
diff --git a/drivers/firmware/qcom/qcom_scm.h b/drivers/firmware/qcom/qcom_scm.h
index 4532907e8489..484e030bcac9 100644
--- a/drivers/firmware/qcom/qcom_scm.h
+++ b/drivers/firmware/qcom/qcom_scm.h
@@ -138,6 +138,9 @@ int scm_legacy_call(struct device *dev, const struct qcom_scm_desc *desc,
 #define QCOM_SCM_WAITQ_RESUME			0x02
 #define QCOM_SCM_WAITQ_GET_WQ_CTX		0x03
 
+#define QCOM_SCM_SVC_GPU			0x28
+#define QCOM_SCM_SVC_GPU_INIT_REGS		0x01
+
 /* common error codes */
 #define QCOM_SCM_V2_EBUSY	-12
 #define QCOM_SCM_ENOMEM		-5
diff --git a/include/linux/firmware/qcom/qcom_scm.h b/include/linux/firmware/qcom/qcom_scm.h
index aaa19f93ac43..2c444c98682e 100644
--- a/include/linux/firmware/qcom/qcom_scm.h
+++ b/include/linux/firmware/qcom/qcom_scm.h
@@ -115,6 +115,29 @@ int qcom_scm_lmh_dcvsh(u32 payload_fn, u32 payload_reg, u32 payload_val,
 int qcom_scm_lmh_profile_change(u32 profile_id);
 bool qcom_scm_lmh_dcvsh_available(void);
 
+/**
+ * Request TZ to program set of access controlled registers necessary
+ * irrespective of any features
+ */
+#define QCOM_SCM_GPU_ALWAYS_EN_REQ BIT(0)
+/**
+ * Request TZ to program BCL id to access controlled register when BCL is
+ * enabled
+ */
+#define QCOM_SCM_GPU_BCL_EN_REQ BIT(1)
+/**
+ * Request TZ to program set of access controlled register for CLX feature
+ * when enabled
+ */
+#define QCOM_SCM_GPU_CLX_EN_REQ BIT(2)
+/**
+ * Request TZ to program tsense ids to access controlled registers for reading
+ * gpu temperature sensors
+ */
+#define QCOM_SCM_GPU_TSENSE_EN_REQ BIT(3)
+
+int qcom_scm_gpu_init_regs(u32 gpu_req);
+
 #ifdef CONFIG_QCOM_QSEECOM
 
 int qcom_scm_qseecom_app_get_id(const char *app_name, u32 *app_id);
-- 
2.31.1


