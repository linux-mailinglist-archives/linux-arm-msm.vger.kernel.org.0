Return-Path: <linux-arm-msm+bounces-14976-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4583588A3E2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Mar 2024 15:14:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EEC3A2C17AD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Mar 2024 14:14:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01766180B9B;
	Mon, 25 Mar 2024 10:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="F6F4BGRf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 854851966A6
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Mar 2024 10:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711361061; cv=none; b=fO2sDLCoFCus5EN96Fh6kLgXAQ6SuX6HH3WASq+vfLojkBipayEB3BajLgsMbYQwkY1knpuHgq3BfFHHn8a5wiFyp+Vm7cHPRGzS0EcO7u0A1fRCtjIE138TwbmQFIgSzkR2FTuMf+9m5ZfPqatHEY9saj5veBVcDVB7aMvYF64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711361061; c=relaxed/simple;
	bh=lSgjcgnvH6aUwQLw5EoB/MQVa1YpVl7Vq0vuihO2tqo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aMLpM2dwW5RvaaT30XuiSWWvlzvyVhfZQFxGEWHCg6EOja/+7uKp28Xme47FxSoWQz4IUBtypiv98tMKX1N55m0MqauYS2mzSzeLEbSYOEwLfMRRZbNP/c2riKzqsR9IUb5rDe8gMH5bS/w5QvN1ZQa+R1QlEjydQs9KYo5naOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=F6F4BGRf; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3417a3151c4so3787342f8f.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Mar 2024 03:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1711361057; x=1711965857; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+4+dJf6arGYhNMNbnDj3J5bx1sPusy2X6VNsV11mqig=;
        b=F6F4BGRflLydi5oF0hw0lB9gXq8sZGByqAQO7PgZHIICm1QJroPUN3uCktzlvkDM6Z
         gp29seOQvuucQeVIYx9oCSEMtMXzmW3KmmOfRZC1yYnsFarp0JSFg8J2gJ8AUXAEXsad
         s7XyYcnLER3t1UMyQVvQBQQLz8fGPR4s9ACTpL6jiXZTV1LsGwUbdAC40b7WjPavZULV
         BQJpczIxJiSaeYS6q6gI+Gbi2JAYXJ8xXS7xZiVKU0p9V4LeETEJ5pV23+PKxOz1dd4t
         2XhYqsBubP7fXjopGKPkG+j1SOL4FjszQ5t/vLST+FUDe/TOkhrNAdPBcPvqSag44oUm
         F2tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711361057; x=1711965857;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+4+dJf6arGYhNMNbnDj3J5bx1sPusy2X6VNsV11mqig=;
        b=Yf9vBnw3GfTfdi6QjCVuyhNDyN+nMN2KZvXu6+pVTgrYakf7Q4jPZV9DCbdN89SkWX
         Be+CdjC2S6xT1vEXzIJovfDjghIiTjImSTbrGLd0zHnXCgocUQXKh+lpL3fNAGZRBsfx
         tl6XYlvM7QN0vx1VfE2d2Y7ZBC8fJn93HgRHxxlBcZie/0GiMfuSkokr3W93xFW/DWKH
         OaB7jljgJVbIzlJ/pHf3gKJgvVqNG4k+l9leLaJFlpknDKtw6jrItrNxCGPtxTKamIIJ
         qhGCDqmsUAXAlhfqT7hlSa1G0UCzngJg4rltb3jjqyVh/14VAIVeyScI2uGkaGVA+Jjz
         obfg==
X-Gm-Message-State: AOJu0YyVIpzxG1l7L03942jAAkNnoABXTmMp1ArkQbHfbOk9lKeq1z0i
	u23uA04tUYycYY2laB3G5GVWtt/TsKbG5wMC9QK3f1BsT/BxNDi3w/tAcM3W5nY=
X-Google-Smtp-Source: AGHT+IEkkZsBnp0pP6MAMwtPkvyKZCO/XD4p9hpMGTvLyBcd5Wa7WEDbnL4tGVoZ/jFZI8OhjLph3Q==
X-Received: by 2002:adf:cd0b:0:b0:33e:72f4:2ae with SMTP id w11-20020adfcd0b000000b0033e72f402aemr5064875wrm.68.1711361056958;
        Mon, 25 Mar 2024 03:04:16 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:75a:e000:861d:8b72:a859:4ce9])
        by smtp.gmail.com with ESMTPSA id dv13-20020a0560000d8d00b0033e25c39ac3sm9086874wrb.80.2024.03.25.03.04.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 03:04:16 -0700 (PDT)
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
Subject: [PATCH v9 10/13] firmware: qcom: scm: add support for SHM bridge operations
Date: Mon, 25 Mar 2024 11:03:56 +0100
Message-Id: <20240325100359.17001-11-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240325100359.17001-1-brgl@bgdev.pl>
References: <20240325100359.17001-1-brgl@bgdev.pl>
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
index f871af4af829..7a8d67c7b71c 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -1326,6 +1326,66 @@ bool qcom_scm_lmh_dcvsh_available(void)
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


