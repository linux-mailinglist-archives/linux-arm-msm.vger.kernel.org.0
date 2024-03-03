Return-Path: <linux-arm-msm+bounces-13176-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B1186F5AD
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Mar 2024 16:03:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D47F1B23B73
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Mar 2024 15:03:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DED667A1E;
	Sun,  3 Mar 2024 15:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="N+wNNDXN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DDBC6A011
	for <linux-arm-msm@vger.kernel.org>; Sun,  3 Mar 2024 15:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709478095; cv=none; b=ICBTZlDy489pn6wbhvT6tbG2GZ02TrbwatURWhIAvBrTmIGNWPWYgsfUuSAqtbi9djiU5qPzHN2FzerouEZTf8d36hL5FSiq1Q4sOQyJ2J3JA2l+GSveqeud+BI7pGK1eZjRY8t2Y8g4lmjeFC8B6H+P8RGi8Paba9dOVMdNUiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709478095; c=relaxed/simple;
	bh=0briAiyPRiJEP600+6nIXKr7LZ+aMokwPT/ZNkPZr+k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AVui+1SEr7Eq5aHlzP1TiwHOP5o2kTkv9WnaDJvS7pBzFpZMn4F//Xz99+VmwBG2210kvYf3Pg4sCT7Ab9QdsZ8JGaB89Qm8k5I+pn6yqJb2o7e5hDFHVZlzrzY7n9uThJjyvaDokd1//2EFvDHSlh+uyynMq0hpUTm6eKVhPxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=N+wNNDXN; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a2f22bfb4e6so609642066b.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 03 Mar 2024 07:01:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1709478092; x=1710082892; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PV6Bccvs+nkQVtMy0HS2mdVNnOrY1QHK087YP1JZNRc=;
        b=N+wNNDXNQNLZxlkuUNzkfWU+HuJiujOH7F+qUC+NuROmEYMifzKi0YLDC58h+5HQFv
         TKpi2bFwbs4oiaybDKPpYuUeMzXFIcb2wKwoHQHrewaBYVAkBUNE9sYxhjcQ/jBGCd03
         yGmKW86mXa17XHkZntEM0zUzBPb6jmVuBqkiaf1aXP1IVckpF7QSTVEjfKmkcQaNtOXx
         lqi+m3LGEqCsFnA4GSQGJE0QteqCNHo7dhEzJWYaHTA2YyKzHGB0yZZlJxzUeCULy4dX
         cDpDAo/LO+/4Rt4UH+SOzU4QMhgNE3gJ275g0n7NkbF33ZU9g/4kBzobQbmIuP3XSEF3
         z1sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709478092; x=1710082892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PV6Bccvs+nkQVtMy0HS2mdVNnOrY1QHK087YP1JZNRc=;
        b=o1PUxDq04z7Abyzcgll7EW6Ov8g8B5ZKy6xXaqYSTCNufUSsSUYlvc39JEqlIny4zy
         nTmAWbzd/oDsaHHcQpGo0N6OxkyR1xawDTOLIV1lx31xk4NdEbhQ7H0TsHZWrkGqrICE
         bAUPw1/EqEH+my8iGXhN7BVDDwnbMgnhjt2FDF/0uvf6jvketiacPIqy0LqFYtHlxibo
         9n9d2RcAGLlyHPyzBdVEH5/UA3l+psKBi5jkwpSKvqtumHsUMxbOvQ745JUV3XJh5KYZ
         WpY/cbwbHrlIDKbAOZ9Iw2XnRqCF/9FfVbu0myVPvS7q7p8jFB1NZ6WeqXsmrvvw//Rt
         761A==
X-Gm-Message-State: AOJu0Yy3zFCsq2n7k9MOEJodBal6YMWTx8tD75iVu4xdQobao8XrCk5/
	MTZPvaMEGhgonpiCTceG2bcNV7hsJXUDcZLzDY0Ybc8rMO8z3TQRF7pdmAlX0KA=
X-Google-Smtp-Source: AGHT+IFHVsfYNMZvuV5f2VQ5QM1pkpcOCZ7nI/fNzFRDcQqQ24G2/1AZ4ClktJYSkad6jGqZvMhN9g==
X-Received: by 2002:a17:906:c289:b0:a44:bd2:c4a with SMTP id r9-20020a170906c28900b00a440bd20c4amr4217136ejz.51.1709478092094;
        Sun, 03 Mar 2024 07:01:32 -0800 (PST)
Received: from brgl-uxlite.. ([77.241.232.10])
        by smtp.gmail.com with ESMTPSA id ch14-20020a170906c2ce00b00a42ea946917sm3740293ejb.130.2024.03.03.07.01.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Mar 2024 07:01:31 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Elliot Berman <quic_eberman@quicinc.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Guru Das Srinagesh <quic_gurus@quicinc.com>,
	Andrew Halaney <ahalaney@redhat.com>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	Alex Elder <elder@linaro.org>,
	Srini Kandagatla <srinivas.kandagatla@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@quicinc.com,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Deepti Jaggi <quic_djaggi@quicinc.com>
Subject: [PATCH v8 09/12] firmware: qcom: scm: add support for SHM bridge operations
Date: Sun,  3 Mar 2024 16:01:12 +0100
Message-Id: <20240303150115.133633-10-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240303150115.133633-1-brgl@bgdev.pl>
References: <20240303150115.133633-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

SHM Bridge is a safety mechanism allowing to limit the amount of memory
shared between the kernel and the TrustZone to regions explicitly marked
as such.

Add low-level primitives for enabling SHM bridge support as well as
creating and destroying SHM bridges to qcom-scm.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Acked-by: Andrew Halaney <ahalaney@redhat.com>
Tested-by: Andrew Halaney <ahalaney@redhat.com> # sc8280xp-lenovo-thinkpad-x13s
Tested-by: Deepti Jaggi <quic_djaggi@quicinc.com> #sa8775p-ride
Reviewed-by: Elliot Berman <quic_eberman@quicinc.com>
---
 drivers/firmware/qcom/qcom_scm.c       | 60 ++++++++++++++++++++++++++
 drivers/firmware/qcom/qcom_scm.h       |  3 ++
 include/linux/firmware/qcom/qcom_scm.h |  6 +++
 3 files changed, 69 insertions(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 6578fe9c8d62..811f93edac7f 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -1323,6 +1323,66 @@ bool qcom_scm_lmh_dcvsh_available(void)
 }
 EXPORT_SYMBOL_GPL(qcom_scm_lmh_dcvsh_available);
 
+int qcom_scm_shm_bridge_enable(void)
+{
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_MP,
+		.cmd = QCOM_SCM_MP_SHM_BRIDGE_ENABLE,
+		.owner = ARM_SMCCC_OWNER_SIP
+	};
+
+	struct qcom_scm_res res;
+
+	if (!__qcom_scm_is_call_available(__scm->dev, QCOM_SCM_SVC_MP,
+					  QCOM_SCM_MP_SHM_BRIDGE_ENABLE))
+		return -EOPNOTSUPP;
+
+	return qcom_scm_call(__scm->dev, &desc, &res) ?: res.result[0];
+}
+EXPORT_SYMBOL_GPL(qcom_scm_shm_bridge_enable);
+
+int qcom_scm_shm_bridge_create(struct device *dev, u64 pfn_and_ns_perm_flags,
+			       u64 ipfn_and_s_perm_flags, u64 size_and_flags,
+			       u64 ns_vmids, u64 *handle)
+{
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_MP,
+		.cmd = QCOM_SCM_MP_SHM_BRIDGE_CREATE,
+		.owner = ARM_SMCCC_OWNER_SIP,
+		.args[0] = pfn_and_ns_perm_flags,
+		.args[1] = ipfn_and_s_perm_flags,
+		.args[2] = size_and_flags,
+		.args[3] = ns_vmids,
+		.arginfo = QCOM_SCM_ARGS(4, QCOM_SCM_VAL, QCOM_SCM_VAL,
+					 QCOM_SCM_VAL, QCOM_SCM_VAL),
+	};
+
+	struct qcom_scm_res res;
+	int ret;
+
+	ret = qcom_scm_call(__scm->dev, &desc, &res);
+
+	if (handle && !ret)
+		*handle = res.result[1];
+
+	return ret ?: res.result[0];
+}
+EXPORT_SYMBOL_GPL(qcom_scm_shm_bridge_create);
+
+int qcom_scm_shm_bridge_delete(struct device *dev, u64 handle)
+{
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_MP,
+		.cmd = QCOM_SCM_MP_SHM_BRIDGE_DELETE,
+		.owner = ARM_SMCCC_OWNER_SIP,
+		.args[0] = handle,
+		.arginfo = QCOM_SCM_ARGS(1, QCOM_SCM_VAL),
+	};
+
+	return qcom_scm_call(__scm->dev, &desc, NULL);
+}
+EXPORT_SYMBOL_GPL(qcom_scm_shm_bridge_delete);
+
 int qcom_scm_lmh_profile_change(u32 profile_id)
 {
 	struct qcom_scm_desc desc = {
diff --git a/drivers/firmware/qcom/qcom_scm.h b/drivers/firmware/qcom/qcom_scm.h
index aa7d06939f8e..cb7273aa0a5e 100644
--- a/drivers/firmware/qcom/qcom_scm.h
+++ b/drivers/firmware/qcom/qcom_scm.h
@@ -116,6 +116,9 @@ struct qcom_tzmem_pool *qcom_scm_get_tzmem_pool(void);
 #define QCOM_SCM_MP_IOMMU_SET_CP_POOL_SIZE	0x05
 #define QCOM_SCM_MP_VIDEO_VAR			0x08
 #define QCOM_SCM_MP_ASSIGN			0x16
+#define QCOM_SCM_MP_SHM_BRIDGE_ENABLE		0x1c
+#define QCOM_SCM_MP_SHM_BRIDGE_DELETE		0x1d
+#define QCOM_SCM_MP_SHM_BRIDGE_CREATE		0x1e
 
 #define QCOM_SCM_SVC_OCMEM		0x0f
 #define QCOM_SCM_OCMEM_LOCK_CMD		0x01
diff --git a/include/linux/firmware/qcom/qcom_scm.h b/include/linux/firmware/qcom/qcom_scm.h
index ccaf28846054..9b6054813f59 100644
--- a/include/linux/firmware/qcom/qcom_scm.h
+++ b/include/linux/firmware/qcom/qcom_scm.h
@@ -115,6 +115,12 @@ int qcom_scm_lmh_dcvsh(u32 payload_fn, u32 payload_reg, u32 payload_val,
 int qcom_scm_lmh_profile_change(u32 profile_id);
 bool qcom_scm_lmh_dcvsh_available(void);
 
+int qcom_scm_shm_bridge_enable(void);
+int qcom_scm_shm_bridge_create(struct device *dev, u64 pfn_and_ns_perm_flags,
+			       u64 ipfn_and_s_perm_flags, u64 size_and_flags,
+			       u64 ns_vmids, u64 *handle);
+int qcom_scm_shm_bridge_delete(struct device *dev, u64 handle);
+
 #ifdef CONFIG_QCOM_QSEECOM
 
 int qcom_scm_qseecom_app_get_id(const char *app_name, u32 *app_id);
-- 
2.40.1


