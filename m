Return-Path: <linux-arm-msm+bounces-3786-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E85DF809774
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 01:44:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9D72E2821EC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 00:44:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE8A01104;
	Fri,  8 Dec 2023 00:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P9YyjwDb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2128171F
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Dec 2023 16:44:21 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2ca0f21e48cso19047761fa.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Dec 2023 16:44:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701996260; x=1702601060; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DCU40ALOWDsZXoiCOjw9KENnIzzkFJPcQLg2I6Hj5pA=;
        b=P9YyjwDbJEyODNjeCPxjhSrVFbLxAuUQEzWHH7swCWd4dwzVNtQZqLQw968lEFaZqF
         XATLvEcpujN+ZM69WXtSMUb6rthq9uZIz+LYCw6+H5qD3crMuG8762VnUQ8Ctnvjl+du
         UitM4MHY8hZazBkvf1a6qFd3KUF9cXnG7ODC4biiqGg2C+EyT1tHiDvnJdnYDiTbIDJF
         az9S+xMEFjs7V1ROlH3lFufAdwfuLkAxI6/b7gw+CQ8dEZ1ZeEQiGv/mHMvqG6Y6JRiT
         k1PrC85WneMHmmm7/Vukx1DuApo449c2B9nrDcuPcBAUZSdfMaeKfi4JFchdMzZG5ZxG
         i6eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701996260; x=1702601060;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DCU40ALOWDsZXoiCOjw9KENnIzzkFJPcQLg2I6Hj5pA=;
        b=MzJYJjTqamV8kTQ8z07OjvaKc7yMI2W7dbcsFtKJaBtdNtT/sLjWAlq/DKkC46h3RZ
         QC2rCEhSJyzXpDVmwfV7OQwOFuCOGUNb2L7+eqn32DCJaNQa29pVtOgx5zCZe37wM8uu
         W1/Q+L1WqQmaX2NvUZ6NRnToLM5Fv0XgicUThhLQgTXQldEPaIgVUHnBOAm86aqtwrp6
         fu8W4nVFGC6UVluC0TGmGZuqfKSIn2I9KA2s6hsz5LbYb6drTJCPqWc3Nv6ibSdeyxh4
         GR2efaKjSuMGAXFL1+G7hcjVHxpnATaVp0HdGtxMHgHuxEqpzROa5aNuvNQ6xQrgI+QM
         3E1Q==
X-Gm-Message-State: AOJu0YwX3BC7iMgY5skwTsqqlxLzrkSkAjehTs7aVCcHVNTmeMJowXRq
	OcZ5uzqbJ20ghLCKAwmyYD3Fyw==
X-Google-Smtp-Source: AGHT+IE7kfNE2PptHIiNIVO5NOCHpRFgtteK9nvPbLpCJ1u56VIPKSC4IfWQvsg2fedesjnB6xrEIg==
X-Received: by 2002:a2e:9dda:0:b0:2c9:fc6c:f57f with SMTP id x26-20020a2e9dda000000b002c9fc6cf57fmr2453764ljj.44.1701996260154;
        Thu, 07 Dec 2023 16:44:20 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id d1-20020a2eb041000000b002c9f2c7cdecsm82645ljl.22.2023.12.07.16.44.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 16:44:19 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v6 03/11] soc: qcom: spm: remove driver-internal structures from the driver API
Date: Fri,  8 Dec 2023 03:44:09 +0300
Message-Id: <20231208004417.3393299-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231208004417.3393299-1-dmitry.baryshkov@linaro.org>
References: <20231208004417.3393299-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move internal SPM driver structures to the driver itself, removing them
from the public API. The CPUidle driver doesn't use them at all.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/soc/qcom/spm.c | 20 ++++++++++++++++++++
 include/soc/qcom/spm.h | 23 +----------------------
 2 files changed, 21 insertions(+), 22 deletions(-)

diff --git a/drivers/soc/qcom/spm.c b/drivers/soc/qcom/spm.c
index 2f0b1bfe7658..b15435f7cb0d 100644
--- a/drivers/soc/qcom/spm.c
+++ b/drivers/soc/qcom/spm.c
@@ -36,6 +36,26 @@ enum spm_reg {
 	SPM_REG_NR,
 };
 
+#define MAX_PMIC_DATA		2
+#define MAX_SEQ_DATA		64
+
+struct spm_reg_data {
+	const u16 *reg_offset;
+	u32 spm_cfg;
+	u32 spm_dly;
+	u32 pmic_dly;
+	u32 pmic_data[MAX_PMIC_DATA];
+	u32 avs_ctl;
+	u32 avs_limit;
+	u8 seq[MAX_SEQ_DATA];
+	u8 start_index[PM_SLEEP_MODE_NR];
+};
+
+struct spm_driver_data {
+	void __iomem *reg_base;
+	const struct spm_reg_data *reg_data;
+};
+
 static const u16 spm_reg_offset_v4_1[SPM_REG_NR] = {
 	[SPM_REG_AVS_CTL]	= 0x904,
 	[SPM_REG_AVS_LIMIT]	= 0x908,
diff --git a/include/soc/qcom/spm.h b/include/soc/qcom/spm.h
index 4951f9d8b0bd..5b263c685812 100644
--- a/include/soc/qcom/spm.h
+++ b/include/soc/qcom/spm.h
@@ -7,11 +7,6 @@
 #ifndef __SPM_H__
 #define __SPM_H__
 
-#include <linux/cpuidle.h>
-
-#define MAX_PMIC_DATA		2
-#define MAX_SEQ_DATA		64
-
 enum pm_sleep_mode {
 	PM_SLEEP_MODE_STBY,
 	PM_SLEEP_MODE_RET,
@@ -20,23 +15,7 @@ enum pm_sleep_mode {
 	PM_SLEEP_MODE_NR,
 };
 
-struct spm_reg_data {
-	const u16 *reg_offset;
-	u32 spm_cfg;
-	u32 spm_dly;
-	u32 pmic_dly;
-	u32 pmic_data[MAX_PMIC_DATA];
-	u32 avs_ctl;
-	u32 avs_limit;
-	u8 seq[MAX_SEQ_DATA];
-	u8 start_index[PM_SLEEP_MODE_NR];
-};
-
-struct spm_driver_data {
-	void __iomem *reg_base;
-	const struct spm_reg_data *reg_data;
-};
-
+struct spm_driver_data;
 void spm_set_low_power_mode(struct spm_driver_data *drv,
 			    enum pm_sleep_mode mode);
 
-- 
2.39.2


