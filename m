Return-Path: <linux-arm-msm+bounces-18689-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E458B3F68
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Apr 2024 20:35:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8D1251C23741
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Apr 2024 18:35:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E34222B9CF;
	Fri, 26 Apr 2024 18:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gGBOPg/w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC28B653;
	Fri, 26 Apr 2024 18:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714156460; cv=none; b=DUsueanbqCcFvfTGX4BgshYG5SF920BnEBzYTrqL10c7ntty6x17lgVYcfjBmbDKD4H/l+iJtgG+UZPM4FICehCIsSQuQLCoZEh0poxFniKsHBBL6Wl6jK37b9LylA/3TObjtOrKhOQg5jU0Ox7xMRHmlFf+RkLwswEEDvmyiYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714156460; c=relaxed/simple;
	bh=N/n5sG6Oj7TiRA/tmfItyZc/ajS5lCwpGG8c+dowMcE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SdjkP9U976fvOaLVxzBG+OkQP94vzRCu7U7O5UcFkMAl2+fMT8SJ76C+F9r8TjVjEqMoJPsuDz6aWutMRYk6K0gcfA1EABwq9BEjRTdlRMzcwvzSFBpgT58CGwPrFVEVLmJTPJ68tUWT8T88uwN/dOYDTfUPd4zxozzQKvGxcGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gGBOPg/w; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-41ba1ba55e8so5416785e9.1;
        Fri, 26 Apr 2024 11:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714156457; x=1714761257; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wPGsofIHgWBL1F+g9TnTaPw7aEN5jGWIc3fWppeCwfk=;
        b=gGBOPg/wk4qwLGBWvlQLmhObtycQ6W5FBq2GG8q+U14r2TsWGn7vBH/usdFDzWGqD+
         dZEenK3DQoYrlwuuCCff2io9kaAsXJoLeedskof8uVboj8k8GHx+9W6+tWBOlECKdfCP
         Hv9nID15vq9CCEcmKOunA6rPVT2N135A93Wh1XhPe6Jzo3datVaVxD5+0aJ85ZD/mUSy
         2qZDg6DtG6efVGV/e0BiIEbzkitp4705K0RcUWBXlQVt+ZBanVLRXR8nVhBCkd+Ecb/L
         rEc5u6QIPIoIa6yZviDFTHaZaW33sXYXg1XRRTCeNxFo8GSl7N0D+8z3aRMTv++jLW33
         3pGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714156457; x=1714761257;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wPGsofIHgWBL1F+g9TnTaPw7aEN5jGWIc3fWppeCwfk=;
        b=UFQcumMoLe01BstbEIVCeu/0uoOfFdNZdW6j/lvJOgWW1i43JynoCOKfFXNPddyl2M
         n1RIaLl2+eSX7arudPGG4hQm2BsUY2tCcIg66EcGgINp4FKG2B/A+jZ4A0ZJDOuFFtzW
         On5nzvfo8EgggZqX5xyuoGB9o0n4xbL4qXDOUvPJrH7an7N7Lqs7W4vmYOcauQyEapKS
         aj6a56rkyWV4gEyOrd2Mz8/+NMGeqZ7SEHeRarEYDSY+hjlNO4JnfunREBBFmzeA5cW6
         XrgR5NSx5TgSrKe4slkk7mKGFLeGEqrJfS7PAGLrc+pzIzbkrUuuH9bETrY1iz7BN/tK
         asDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXnfTEdeeGLxmcnT5m5h/6gGHUtu3Cz2nDMUBH0SaMuYDHJmHEF6b66p2ywMZZEjl3U5VMvC5dWoudclwZDISxOojouphIxBuGiXA==
X-Gm-Message-State: AOJu0YzZjpO2YRdPDqaB1wPY4hRE2OGnm7n7IMCQCuL8fHJT7gkMpEq2
	kEgMCSkks8QJZaV/V6wKVqtpx55UaH+OpQy6wfXQxS5xSI35VwUE
X-Google-Smtp-Source: AGHT+IGNEQRnCcWAaBVV+a1LMH8fijRxR5qN8l+QUkTdo2Pldhb4ntfED6KMOYAccZjPbrSxV2rI7w==
X-Received: by 2002:adf:a395:0:b0:348:1ee3:48fa with SMTP id l21-20020adfa395000000b003481ee348famr2512595wrb.47.1714156457381;
        Fri, 26 Apr 2024 11:34:17 -0700 (PDT)
Received: from [192.168.0.20] (cpc115152-dals23-2-0-cust532.20-2.cable.virginm.net. [86.12.82.21])
        by smtp.gmail.com with ESMTPSA id b8-20020adfe308000000b003436a3cae6dsm22982701wrj.98.2024.04.26.11.34.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 11:34:16 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Fri, 26 Apr 2024 19:34:00 +0100
Subject: [PATCH v2 2/6] firmware: qcom_scm: Add gpu_init_regs call
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240426-a750-raytracing-v2-2-562ac9866d63@gmail.com>
References: <20240426-a750-raytracing-v2-0-562ac9866d63@gmail.com>
In-Reply-To: <20240426-a750-raytracing-v2-0-562ac9866d63@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Jun Nie <jun.nie@linaro.org>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 freedreno@lists.freedesktop.org, Connor Abbott <cwabbott0@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714156453; l=2862;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=N/n5sG6Oj7TiRA/tmfItyZc/ajS5lCwpGG8c+dowMcE=;
 b=gLPELZvLs8tfrH5ezqYstN9qVHFJGVLeX5AmdHQ73mgpmNEylkjAZnQ5jYadP+J34x8mcvY9U
 AL/1y0h7fhWArvEBu4hMsqFMt4qoiWHliAHXC83G2wiXChjNMtTBRmz
X-Developer-Key: i=cwabbott0@gmail.com; a=ed25519;
 pk=dkpOeRSXLzVgqhy0Idr3nsBr4ranyERLMnoAgR4cHmY=

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


