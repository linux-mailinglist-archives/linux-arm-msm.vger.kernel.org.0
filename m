Return-Path: <linux-arm-msm+bounces-7238-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6740982D1C4
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Jan 2024 18:43:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 78057281F2D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Jan 2024 17:43:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35F0EF4E0;
	Sun, 14 Jan 2024 17:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iM9qAgUl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 294F312E6C
	for <linux-arm-msm@vger.kernel.org>; Sun, 14 Jan 2024 17:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-50e835800adso8602177e87.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 14 Jan 2024 09:42:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705254159; x=1705858959; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YPqw68EDCMHEyrshc6spQG1dJwMptjHnsqqB1Uzk+hc=;
        b=iM9qAgUlss9ceIvCfhfRA6w+WD1Qg/eVjpLPtjAouAysakTsoc3uUlYMLETNKVB+db
         2mSR2DAX8FVtI6JJW/SzOj68x8Xq4QWsstzpy++7iKkSwna5NI8bVRULVUdEPKm7vRpI
         T6BtvGfI1hsyUGwqzc4QIEQuaJhEBwJAY030EVuL9W/TBZ6J3yNEHtab4fnnV1EReX0I
         zc7Ccqu3KsU+OVWY8Q27jw78eVcGud+V9OJ0igZGor3EQamHunjFAI3dkcqduVErJ4hf
         odp+75zqv+eRYizqCYBK/IEgfqgwMSWzdb7R+uQT1qVECvCMotFXyt6GFDQYUE3/4x7i
         VOaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705254159; x=1705858959;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YPqw68EDCMHEyrshc6spQG1dJwMptjHnsqqB1Uzk+hc=;
        b=JU7xsiH7zI8ZULvozAn4DSY2TMwkoU1CL/pMASVfvENmZWAoWOb1csEIBu02lITEbO
         rMhzRyGkGSwcFJwEJGJOSgpJnBVMoX6ydQqo49iigOaswfIZZLfXoI4fFy1gGAPRcmEP
         oNkQjK1ESZtaxQ6fy+zNsVUPsNk09MaZTgMKDx7rYV4WJFYrx2GxhSR8Hx23wUZtfcoj
         rszzd0zFJXCPMZW7d0mG2IgsjmffEsmxNAtnr/P1gNCTzUtV6sqjIljCyyxPtXlusyap
         rp255lvokHIuT8M07B0jEQOggaAkkHze4YoFJWEhmBJfhKCo1VsEEb71OGiMvIrOQ3TG
         cfAg==
X-Gm-Message-State: AOJu0YzlxfvIcsW+7hEINKuBdESSWHtryPYUJvWzO/OUqoE7KP/rRTeH
	qq6ke7wAS5lZ5WcWiXYpA8EWqjz4f/kXxg==
X-Google-Smtp-Source: AGHT+IFlJmmXetFBXpVyqGBAMgMF45i/OsRez5UrJnO7yKZcCNxaOdqFR+P83eYEGtynky6zAlFPsw==
X-Received: by 2002:a05:6512:4805:b0:50e:8e87:82f3 with SMTP id eo5-20020a056512480500b0050e8e8782f3mr1062808lfb.78.1705254159397;
        Sun, 14 Jan 2024 09:42:39 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id g12-20020a19ee0c000000b0050e7f5c8a1esm1189886lfb.206.2024.01.14.09.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jan 2024 09:42:39 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 14 Jan 2024 19:42:36 +0200
Subject: [PATCH 1/2] soc: qcom: socinfo: rename PM2250 to PM4125
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240114-pm2250-pm4125-rename-v1-1-71a0a103c3d5@linaro.org>
References: <20240114-pm2250-pm4125-rename-v1-0-71a0a103c3d5@linaro.org>
In-Reply-To: <20240114-pm2250-pm4125-rename-v1-0-71a0a103c3d5@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1355;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=FsZ/44uxdiTqpMhCNp46Vh8AqQOXBfo1eRYyPbibSS4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlpB0Nm3FgZ0qV+IKJWbijT0+YOPlhyR5FG8Wq2
 5MV2YY17CGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZaQdDQAKCRCLPIo+Aiko
 1VwZB/4zVcHnzk3CbopOClhYfmk/FDVEXeYH/zAHD+RSDne+VRJKeKaBTB78FiYXrkCkVjvH7rH
 2eb161fvLxb2gjLyHGr8OEEKrzC3AP/DclXRc9PunFm1aLxNQpvKnepBxsMCQbccftOw9Klzwi+
 UFeQKAPN0m/JJz+Hy79eIxqoqmpn/HcBLxIf0X87uNbBdHxK0i0G9eu2HyqTIsWp+uwGgPZCwew
 Ia3Zx4uJfINzjC8W3SyHdD4VvFyLvGHpVjDl+gOUcnTmT2ixhkQbVAIF4nCnZZMJ0luuS1yLqi2
 p7SUsy4atUzN60sUSktVqmQa4t75bNO1u856oPXeDk8H8Hy1
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

According to all the documentation there is no such thing as PM2250, it
has been replaced with PM4125. Use correct name for the PMIC.

Fixes: 082f9bc60f33 ("soc: qcom: spmi-pmic: add more PMIC SUBTYPE IDs")
Fixes: 112d96fd2927 ("soc: qcom: socinfo: Add some PMICs")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/soc/qcom/socinfo.c        | 2 +-
 include/soc/qcom/qcom-spmi-pmic.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 6349a0debeb5..a980020ab854 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -124,7 +124,7 @@ static const char *const pmic_models[] = {
 	[50] = "PM8350B",
 	[51] = "PMR735A",
 	[52] = "PMR735B",
-	[55] = "PM2250",
+	[55] = "PM4125",
 	[58] = "PM8450",
 	[65] = "PM8010",
 	[69] = "PM8550VS",
diff --git a/include/soc/qcom/qcom-spmi-pmic.h b/include/soc/qcom/qcom-spmi-pmic.h
index 17a0a8c3d656..a62d500a6fda 100644
--- a/include/soc/qcom/qcom-spmi-pmic.h
+++ b/include/soc/qcom/qcom-spmi-pmic.h
@@ -49,7 +49,7 @@
 #define PMK8350_SUBTYPE		0x2f
 #define PMR735B_SUBTYPE		0x34
 #define PM6350_SUBTYPE		0x36
-#define PM2250_SUBTYPE		0x37
+#define PM4125_SUBTYPE		0x37
 
 #define PMI8998_FAB_ID_SMIC	0x11
 #define PMI8998_FAB_ID_GF	0x30

-- 
2.39.2


