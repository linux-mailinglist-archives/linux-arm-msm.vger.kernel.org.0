Return-Path: <linux-arm-msm+bounces-6706-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A9008827D31
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jan 2024 04:04:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5285E286341
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jan 2024 03:04:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 162AA5665;
	Tue,  9 Jan 2024 03:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VlwkoiT6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0ECF4699
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jan 2024 03:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2cd46e7ae8fso24498971fa.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jan 2024 19:04:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704769446; x=1705374246; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ts6Z+3/anOzjCG9PyaOIXFjQsNRQWH5IXZQw/Pohzek=;
        b=VlwkoiT6sr687LH0e2EMWpjEZ/9PiIDJwxDx4a6RTykvM+cUrT1O9iyYVVHzusOKlZ
         gQiR6qYhAe4a6UvGV+juGrkjsp97IAIRPj+Ae5AyeyAtRkfHnAuNklFaEJcrI/8rKnUE
         tBBhIXlxSk168Zqy9DU45i9N2TXSSuy7Juwr6qzyfboqZzPnvjnRWCBrgkAKnG1SFhLu
         KOOIm10yQh/1kCAAp5iiTkqz4TA6oHMzNDD2LYd0sC3asoRVl4ckPs9mQiptVKLZqYjd
         o3zj0hLI1Mx9x8YhDl4SBsH2u+aR6cH9s66E2eQeXOO/3dY/RL/EodYcqWcCsY9aWX6C
         XTxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704769446; x=1705374246;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ts6Z+3/anOzjCG9PyaOIXFjQsNRQWH5IXZQw/Pohzek=;
        b=bJigJQDV6pOPDDqo9YF6Rq2uavy6DbYYqZMbh+YqbGyKiqm25pTj81M/4siraBLfm+
         kDspu7M7axek8SbGCxBL0fGIqCWd31fcWFnUP/YCe+7d05Vh+RGgNKLMbiZZbZRI8kk0
         nRKPQO7R2shhsAabN7bXEAguDsBJB0khnXRcoLB4beo4Z/afyIK1xuUO5lsXyRduiXpn
         ebgl558TQdU6KHf7zigYw4D54dWezyYTfTRAhKy9aWjN6oOt+o9c2Bm2h0DdcrAp7goo
         Cm43MznzhAetw7HNSEuJfR37sQY8Jn+Gh6wboGNZMfb8YOWH/ljPqH+H5majSPD6yQbl
         z5mQ==
X-Gm-Message-State: AOJu0YxOWlPybKPAH3azYLum62oazn5VamQsYMK/xBHKpS2ffMWdFSMA
	z4vxb9ZyesWXHulxMt4Uig+4JcKZNa1ZpQ==
X-Google-Smtp-Source: AGHT+IHwzdxEDQHcajDjP2jPl1fHFSpqKxdFEUaA64y/qW/AB+FcITHPl/MhLc7uHccdP7FgiP0HUw==
X-Received: by 2002:a2e:6a19:0:b0:2cc:f5fa:28ae with SMTP id f25-20020a2e6a19000000b002ccf5fa28aemr867981ljc.149.1704769446065;
        Mon, 08 Jan 2024 19:04:06 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id g30-20020a2e391e000000b002cd1ad3b11csm176920lja.42.2024.01.08.19.04.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 19:04:05 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 09 Jan 2024 05:04:03 +0200
Subject: [PATCH 5/8] phy: qcom: qmp: move common bits definitions to common
 header
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240109-phy-qmp-merge-common-v1-5-572899a14318@linaro.org>
References: <20240109-phy-qmp-merge-common-v1-0-572899a14318@linaro.org>
In-Reply-To: <20240109-phy-qmp-merge-common-v1-0-572899a14318@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=8056;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=aetwf3k9aWU9Ah80lPBuYFgoijUVfo0Q8ZkqKmb/pCI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlnLehKr7kPsCDRE35WQGOEyOR3phJlzPXtT2oW
 ZLIoffXXsCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZZy3oQAKCRCLPIo+Aiko
 1cVeB/4pZ1t0oUVHuaZjCVJUweIOVLwGO84bnwklZsBS7wygnSJFpqh9Kga/WF57utPIlK0Iyql
 +GCMr9VVHIVbf7UhBsTSg9O979+5ZF0RjTWz5qL82jrnMXoLitNwPYkY4szhdlrewchZBFqo6Eo
 W5J7/c+9Duwz6QeGifRY2Cl3Y/dGAd6zkDKBG+MDtBjIvHlxvxjy6zjJ5lOY/FHwSbVZMXAa1Qv
 kY6l1aZx7jl+ns1avifyJavWwK1zPvwSQmab556ajF25gdYNWzd/sdcSbJdbIIWyfIUA7tfhdE6
 LE0ZYrv8lFxVIIx/N0bcDyCfatOWFQmHLL47V9xk+RoFD1Ce
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Move bit definitions for the common headers to the common phy-qcom-qmp.h
header.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c        | 21 --------------
 drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c | 10 +------
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c         | 12 --------
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c          |  7 -----
 drivers/phy/qualcomm/phy-qcom-qmp-usb-legacy.c   | 21 --------------
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c          | 35 ------------------------
 drivers/phy/qualcomm/phy-qcom-qmp.h              | 25 +++++++++++++++++
 7 files changed, 26 insertions(+), 105 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 1dae93640479..4555c7af08c6 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -41,16 +41,6 @@
 #include "phy-qcom-qmp-dp-phy-v5.h"
 #include "phy-qcom-qmp-dp-phy-v6.h"
 
-/* QPHY_SW_RESET bit */
-#define SW_RESET				BIT(0)
-/* QPHY_POWER_DOWN_CONTROL */
-#define SW_PWRDN				BIT(0)
-/* QPHY_START_CONTROL bits */
-#define SERDES_START				BIT(0)
-#define PCS_START				BIT(1)
-/* QPHY_PCS_STATUS bit */
-#define PHYSTATUS				BIT(6)
-
 /* QPHY_V3_DP_COM_RESET_OVRD_CTRL register bits */
 /* DP PHY soft reset */
 #define SW_DPPHY_RESET				BIT(0)
@@ -65,17 +55,6 @@
 #define USB3_MODE				BIT(0) /* enables USB3 mode */
 #define DP_MODE					BIT(1) /* enables DP mode */
 
-/* QPHY_PCS_AUTONOMOUS_MODE_CTRL register bits */
-#define ARCVR_DTCT_EN				BIT(0)
-#define ALFPS_DTCT_EN				BIT(1)
-#define ARCVR_DTCT_EVENT_SEL			BIT(4)
-
-/* QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR register bits */
-#define IRQ_CLEAR				BIT(0)
-
-/* QPHY_V3_PCS_MISC_CLAMP_ENABLE register bits */
-#define CLAMP_EN				BIT(0) /* enables i/o clamp_n */
-
 /* QPHY_V3_DP_COM_TYPEC_CTRL register bits */
 #define SW_PORTSELECT_VAL			BIT(0)
 #define SW_PORTSELECT_MUX			BIT(1)
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c
index 07c6f20a49d4..0442b3120563 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c
@@ -23,17 +23,9 @@
 
 #include "phy-qcom-qmp.h"
 
-/* QPHY_SW_RESET bit */
-#define SW_RESET				BIT(0)
-/* QPHY_POWER_DOWN_CONTROL */
-#define SW_PWRDN				BIT(0)
-#define REFCLK_DRV_DSBL				BIT(1)
 /* QPHY_START_CONTROL bits */
-#define SERDES_START				BIT(0)
-#define PCS_START				BIT(1)
 #define PLL_READY_GATE_EN			BIT(3)
-/* QPHY_PCS_STATUS bit */
-#define PHYSTATUS				BIT(6)
+
 /* QPHY_COM_PCS_READY_STATUS bit */
 #define PCS_READY				BIT(0)
 
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index 6be6c554e0b3..ebd6262fac96 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -34,18 +34,6 @@
 #include "phy-qcom-qmp-pcs-pcie-v6_20.h"
 #include "phy-qcom-qmp-pcie-qhp.h"
 
-/* QPHY_SW_RESET bit */
-#define SW_RESET				BIT(0)
-/* QPHY_POWER_DOWN_CONTROL */
-#define SW_PWRDN				BIT(0)
-#define REFCLK_DRV_DSBL				BIT(1)
-/* QPHY_START_CONTROL bits */
-#define SERDES_START				BIT(0)
-#define PCS_START				BIT(1)
-/* QPHY_PCS_STATUS bit */
-#define PHYSTATUS				BIT(6)
-#define PHYSTATUS_4_20				BIT(7)
-
 #define PHY_INIT_COMPLETE_TIMEOUT		10000
 
 /* set of registers with offsets different per-PHY */
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
index ce9c55f7d5f5..d33b7691b71c 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
@@ -32,13 +32,6 @@
 
 #include "phy-qcom-qmp-qserdes-txrx-ufs-v6.h"
 
-/* QPHY_SW_RESET bit */
-#define SW_RESET				BIT(0)
-/* QPHY_POWER_DOWN_CONTROL */
-#define SW_PWRDN				BIT(0)
-/* QPHY_START_CONTROL bits */
-#define SERDES_START				BIT(0)
-#define PCS_START				BIT(1)
 /* QPHY_PCS_READY_STATUS bit */
 #define PCS_READY				BIT(0)
 
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usb-legacy.c b/drivers/phy/qualcomm/phy-qcom-qmp-usb-legacy.c
index ca220878c630..6d0ba39c1943 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usb-legacy.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usb-legacy.c
@@ -27,16 +27,6 @@
 
 #include "phy-qcom-qmp-dp-com-v3.h"
 
-/* QPHY_SW_RESET bit */
-#define SW_RESET				BIT(0)
-/* QPHY_POWER_DOWN_CONTROL */
-#define SW_PWRDN				BIT(0)
-/* QPHY_START_CONTROL bits */
-#define SERDES_START				BIT(0)
-#define PCS_START				BIT(1)
-/* QPHY_PCS_STATUS bit */
-#define PHYSTATUS				BIT(6)
-
 /* QPHY_V3_DP_COM_RESET_OVRD_CTRL register bits */
 /* DP PHY soft reset */
 #define SW_DPPHY_RESET				BIT(0)
@@ -51,17 +41,6 @@
 #define USB3_MODE				BIT(0) /* enables USB3 mode */
 #define DP_MODE					BIT(1) /* enables DP mode */
 
-/* QPHY_PCS_AUTONOMOUS_MODE_CTRL register bits */
-#define ARCVR_DTCT_EN				BIT(0)
-#define ALFPS_DTCT_EN				BIT(1)
-#define ARCVR_DTCT_EVENT_SEL			BIT(4)
-
-/* QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR register bits */
-#define IRQ_CLEAR				BIT(0)
-
-/* QPHY_V3_PCS_MISC_CLAMP_ENABLE register bits */
-#define CLAMP_EN				BIT(0) /* enables i/o clamp_n */
-
 #define PHY_INIT_COMPLETE_TIMEOUT		10000
 
 struct qmp_phy_init_tbl {
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
index e481f76b8ed8..5bce580dcd71 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
@@ -29,41 +29,6 @@
 #include "phy-qcom-qmp-pcs-usb-v6.h"
 #include "phy-qcom-qmp-pcs-usb-v7.h"
 
-/* QPHY_SW_RESET bit */
-#define SW_RESET				BIT(0)
-/* QPHY_POWER_DOWN_CONTROL */
-#define SW_PWRDN				BIT(0)
-/* QPHY_START_CONTROL bits */
-#define SERDES_START				BIT(0)
-#define PCS_START				BIT(1)
-/* QPHY_PCS_STATUS bit */
-#define PHYSTATUS				BIT(6)
-
-/* QPHY_V3_DP_COM_RESET_OVRD_CTRL register bits */
-/* DP PHY soft reset */
-#define SW_DPPHY_RESET				BIT(0)
-/* mux to select DP PHY reset control, 0:HW control, 1: software reset */
-#define SW_DPPHY_RESET_MUX			BIT(1)
-/* USB3 PHY soft reset */
-#define SW_USB3PHY_RESET			BIT(2)
-/* mux to select USB3 PHY reset control, 0:HW control, 1: software reset */
-#define SW_USB3PHY_RESET_MUX			BIT(3)
-
-/* QPHY_V3_DP_COM_PHY_MODE_CTRL register bits */
-#define USB3_MODE				BIT(0) /* enables USB3 mode */
-#define DP_MODE					BIT(1) /* enables DP mode */
-
-/* QPHY_PCS_AUTONOMOUS_MODE_CTRL register bits */
-#define ARCVR_DTCT_EN				BIT(0)
-#define ALFPS_DTCT_EN				BIT(1)
-#define ARCVR_DTCT_EVENT_SEL			BIT(4)
-
-/* QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR register bits */
-#define IRQ_CLEAR				BIT(0)
-
-/* QPHY_V3_PCS_MISC_CLAMP_ENABLE register bits */
-#define CLAMP_EN				BIT(0) /* enables i/o clamp_n */
-
 #define PHY_INIT_COMPLETE_TIMEOUT		10000
 
 /* set of registers with offsets different per-PHY */
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.h b/drivers/phy/qualcomm/phy-qcom-qmp.h
index d6a9c9b5ea12..d10b8f653c4b 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.h
@@ -50,4 +50,29 @@
 
 #include "phy-qcom-qmp-pcs-v7.h"
 
+/* QPHY_SW_RESET bit */
+#define SW_RESET				BIT(0)
+/* QPHY_POWER_DOWN_CONTROL */
+#define SW_PWRDN				BIT(0)
+#define REFCLK_DRV_DSBL				BIT(1) /* PCIe */
+
+/* QPHY_START_CONTROL bits */
+#define SERDES_START				BIT(0)
+#define PCS_START				BIT(1)
+
+/* QPHY_PCS_STATUS bit */
+#define PHYSTATUS				BIT(6)
+#define PHYSTATUS_4_20				BIT(7)
+
+/* QPHY_PCS_AUTONOMOUS_MODE_CTRL register bits */
+#define ARCVR_DTCT_EN				BIT(0)
+#define ALFPS_DTCT_EN				BIT(1)
+#define ARCVR_DTCT_EVENT_SEL			BIT(4)
+
+/* QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR register bits */
+#define IRQ_CLEAR				BIT(0)
+
+/* QPHY_PCS_MISC_CLAMP_ENABLE register bits */
+#define CLAMP_EN				BIT(0) /* enables i/o clamp_n */
+
 #endif

-- 
2.39.2


