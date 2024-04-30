Return-Path: <linux-arm-msm+bounces-18927-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C1E8B7045
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Apr 2024 12:45:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 19FA0285C7C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Apr 2024 10:45:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D1AF12D20E;
	Tue, 30 Apr 2024 10:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JrN59H0Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABBB912D1F6;
	Tue, 30 Apr 2024 10:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714473857; cv=none; b=YQmh2IvAVSadQAmI9qy+hl7bH1tU54dcFUBC64SfkfLQ1PSkxo/87ciQJPMyPOyuFeg3dSPrsyojOuvfTBv0K89y8ylGrCdoEx966aiZ6fqfeKGQaFu2y/ekEPzMc9aRKwmzjJ1ktmwBNmd0Uwa98sIZEDl0dB+Kz+RWlmY/wjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714473857; c=relaxed/simple;
	bh=TKn/26YnezLy20U/najOcBKpivRdMFdNQbNQd8UXKNg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W8ar65lqoe9HfxfPE8WBrZIk2hPMBX8Ik1EEM6ZaUch+zRfuxqHI+0oUBzcqEzuMV1+fKDXpajsbyQvI7q4sDk45C5/7RLRbIFX/qJ9IFu6PxjNQsemAToxNjLmlhq0k+RYWq1wEiD7wDf1DEpWt6PsumwEyvRalbKcmZaQ+w6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JrN59H0Z; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-343c891bca5so4174893f8f.2;
        Tue, 30 Apr 2024 03:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714473854; x=1715078654; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qmr8dTXmjB4R2TIC3iha2y597f6KErUdWQLGHd0Q118=;
        b=JrN59H0Z09rSyeNZw11YcPu4dh5xptbrIvJ0NDP/pplxAlqfdOrZF65KM+jndQi38f
         i641A6FXRVV6D9+2Qzjb0o4+SAOtEQC11JuRAMkokSG/Z0ZicB4qFEcXa8lY1sSAmd01
         6AcUJoB/MejLK3AiYG/PvKpgQjtYm98wY70/xD6vShqY8WtE04JsuhC6wE1wDVW5w5of
         7PYR326fJvd2Tk32+J4rLuE6gW3Dx3ErSjLo7yZyyajmKPqSlUuRyOy2qRMYq4ZAxiCk
         gwYymECyYOSbr/5o2TgGh+k2WnUCgUUoz23RDV03skoggW3sAIh+wMdrGHtME0fs9GvT
         SqsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714473854; x=1715078654;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qmr8dTXmjB4R2TIC3iha2y597f6KErUdWQLGHd0Q118=;
        b=llymP/Kmw99jzKgQfuiP9R8OnSlanbdqj1NVxsV5b99RcdqNeQ0ZW+nUtofKx6H1wM
         BUbMxMzVBxzyQXnqstHxL2RMNQud/Ys1rkAE9LSrQHfX9J+AGvwAcwceSu5WYIk5Aw95
         p7xiOXT0e1Zi8FnOX3jzfrB8URnzDVix91KKeYGAYaLaUr2pGlthv3PvAHcWhRWiT2Yg
         14zowfFPLw/8v9XNr8O3U2VTyUNNRIxOGiznD6Mkl2SBlUnFTtRf3UZoh3weXWZECIQv
         Ah1ZDSeSr1FBxhZjVGdl38DXh6hzzct2zDPhonWUJjHeL5K4B+xUfjvfSX/mHXTB+ZSG
         eTyg==
X-Forwarded-Encrypted: i=1; AJvYcCU2v8a5+WVe1Rf0A9KwV0Wl4IWer+P+/JFJTceD7CMqJk40PoIVHNgTdzEf0VRAyFugMibi7UHdnbdXd+gdG88ssoSuzN9NDBwMXw==
X-Gm-Message-State: AOJu0Yyp7Lh+33yqgA4f/AGRvv5z8qblErZbkaWALqYSjEMaVvC6nzmY
	c+pWjhW5PHYp9GHN+pFKyTzjMyxHKqyKYKxwXENUkhN5eBwfadYm
X-Google-Smtp-Source: AGHT+IEUFFGWrUGe08CoaGquY4VjJG9mPVI5jXUW4owBwPoZnD3wgvmo/zcbryoI/p0af2SnsBFKHA==
X-Received: by 2002:adf:f3ce:0:b0:34c:5e02:7875 with SMTP id g14-20020adff3ce000000b0034c5e027875mr10581370wrp.7.1714473853973;
        Tue, 30 Apr 2024 03:44:13 -0700 (PDT)
Received: from [192.168.0.20] (cpc115152-dals23-2-0-cust532.20-2.cable.virginm.net. [86.12.82.21])
        by smtp.gmail.com with ESMTPSA id p8-20020a5d48c8000000b0034af40b2efdsm23595951wrs.108.2024.04.30.03.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 03:44:13 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Tue, 30 Apr 2024 11:43:16 +0100
Subject: [PATCH v3 2/6] firmware: qcom_scm: Add gpu_init_regs call
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240430-a750-raytracing-v3-2-7f57c5ac082d@gmail.com>
References: <20240430-a750-raytracing-v3-0-7f57c5ac082d@gmail.com>
In-Reply-To: <20240430-a750-raytracing-v3-0-7f57c5ac082d@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714473850; l=3010;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=TKn/26YnezLy20U/najOcBKpivRdMFdNQbNQd8UXKNg=;
 b=nPXAL5pTBU3gEo3QipQ3oHu24CwT1kTMGwXQ2e1evASNv9IS9+ltjYA0BdCb76JBdN8yEVw7I
 brgVzcZN8QFATIQo6+2IgaBmyMiijI59GWahL+u1IZxT2C359DGv9QZ
X-Developer-Key: i=cwabbott0@gmail.com; a=ed25519;
 pk=dkpOeRSXLzVgqhy0Idr3nsBr4ranyERLMnoAgR4cHmY=

This will used by drm/msm to initialize GPU registers that Qualcomm's
firmware doesn't make writeable to the kernel.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
index aaa19f93ac43..a221a643dc12 100644
--- a/include/linux/firmware/qcom/qcom_scm.h
+++ b/include/linux/firmware/qcom/qcom_scm.h
@@ -115,6 +115,29 @@ int qcom_scm_lmh_dcvsh(u32 payload_fn, u32 payload_reg, u32 payload_val,
 int qcom_scm_lmh_profile_change(u32 profile_id);
 bool qcom_scm_lmh_dcvsh_available(void);
 
+/*
+ * Request TZ to program set of access controlled registers necessary
+ * irrespective of any features
+ */
+#define QCOM_SCM_GPU_ALWAYS_EN_REQ BIT(0)
+/*
+ * Request TZ to program BCL id to access controlled register when BCL is
+ * enabled
+ */
+#define QCOM_SCM_GPU_BCL_EN_REQ BIT(1)
+/*
+ * Request TZ to program set of access controlled register for CLX feature
+ * when enabled
+ */
+#define QCOM_SCM_GPU_CLX_EN_REQ BIT(2)
+/*
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


