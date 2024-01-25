Return-Path: <linux-arm-msm+bounces-8375-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EA9A683D09B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jan 2024 00:23:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 640BFB2508D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 23:23:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26ED612E5C;
	Thu, 25 Jan 2024 23:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VRqk6B1p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0275612E75
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 23:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706224985; cv=none; b=A5hozKuHCAGLcXFOKSyKQayGsEL4dcREAkZMlmn5j/FnGeoVWNe31vpvu9IFuxDe00GkRJgYJUL2G2izRcUVaz65oLKzfpIBVgHxiec/9KWjnfHapCkFn5rYGG/vOJSDnsyxBn5XG5n74JlUr8/r7b/at48DSoRQnl4fBD2R8pI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706224985; c=relaxed/simple;
	bh=wzZm1Snfn+S6vji4L2JQdN0+CBVcVBvtUE7gaG12uiY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qHM12PZcnHlQITHN7RDaEiUG61QLUWZLkn/hEdMoD2n7a+iGJxPK0Dvr+9XnGtxPe6KkMo9wJRc9vXSqXLYVQ3A7MOr31QDQUzMJC52a9Dkov4U5nQWpid8lqJqckFosHvMsGFs+lw9Ki/9ebo1ePQVH0CmSzSEl/VC2YGpfCY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VRqk6B1p; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-51020e061b5so985484e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 15:23:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706224981; x=1706829781; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rv0q5k3NRshGB6WXnPMvW65Ufa6bV3x6w2h5kW9SRqs=;
        b=VRqk6B1pUwCKfY0LKZR6o2B9lV6jwyl4Gfe2Y8fOde/XDQgDgfNp02v0meSm8kFLKx
         Za7udJ5+sLlgZJnpOIx5djWTVal3VRqYpVgehR/OUGKK3yJzx2XrqEzPFQwes1XIP0//
         j4f3V3Jr6Be8aVIEdKpj2BK6K9pVR3Sg3Ic9+pmE8umLCF5TBSoa4RQNLJ4J16HeEc4y
         i0GoefBluOXk7WrBApgfA1byh53P+ODdam3dWP8hFyUpBVxCGIAkZS+Fi9WA8oi/PW3r
         FX/nJcQLde1oYVrIhwGzhhtmpZmq6Src69drtsaIWekpsqEXDLAJ/EERH0CeTK/x40+Z
         tQ9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706224981; x=1706829781;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rv0q5k3NRshGB6WXnPMvW65Ufa6bV3x6w2h5kW9SRqs=;
        b=cmBUfqgGE2ySMwuMAmkX/59u+wvDkskI+GsWoZuuj7tEHfXj6GyBu2ItSt28CaUjZB
         +zrHJg5UdgQ2iFK98aqT1uRzuydgd6qppd6/hNNO1aE7afNTa/yxe9h7Xh/yTdL/ekst
         gnSvDiHqb2IUEIlpNO5LMecfk1N4e4Q/SWi1DK3s7MVeQ18wvvmVZBYTFl7b8pj7X651
         CZUyEAg0j22DcPXgXyMr4yb2sQlDu9OQI6Gm2M9orEhK3frgc+kM6av6HgxVMp+dUMKS
         vmUwCNu1lyfa9eX9bMTiEn609VMprjv4AyFLRNSJoG/26rMt3VjfCqkIPi+xq95RfSSK
         XA0A==
X-Gm-Message-State: AOJu0YzVIAoKZAjuAZTo3AGhX8QEaq5OFxk7Q+VHr9NysFYYZIi0VCMl
	T5wEXALsV6GZnh3XXbv6i5aiFW6tLMgXHNc8Q6/ZWuYnpEZo9HxgrSRCAGLZuBXZ8Hjk3abiVDj
	k
X-Google-Smtp-Source: AGHT+IG3kOrudBbF+VGJ1GLM5SD+5/5GLoEux1XiZW52SKchndgwbEzti2cRK3j/+v3HNHwEsTrWXA==
X-Received: by 2002:a05:6512:370b:b0:50e:93fa:336 with SMTP id z11-20020a056512370b00b0050e93fa0336mr232707lfr.95.1706224980770;
        Thu, 25 Jan 2024 15:23:00 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id k3-20020a05651210c300b0050e6df07728sm3920lfg.180.2024.01.25.15.23.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jan 2024 15:23:00 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 26 Jan 2024 01:22:39 +0200
Subject: [PATCH v2 5/8] phy: qcom: qmp: move common bits definitions to
 common header
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240126-phy-qmp-merge-common-v2-5-a463d0b57836@linaro.org>
References: <20240126-phy-qmp-merge-common-v2-0-a463d0b57836@linaro.org>
In-Reply-To: <20240126-phy-qmp-merge-common-v2-0-a463d0b57836@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=9656;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=wzZm1Snfn+S6vji4L2JQdN0+CBVcVBvtUE7gaG12uiY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlsu1Qy5GdMJvZB0kHAKuGe3tl7KsVMd94Elmp/
 KIKkCQoWACJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZbLtUAAKCRCLPIo+Aiko
 1WW1B/sFpiL6n+OO50TBfApS1gFuJqOG+cKiFn+VuWlEQ1Wb1R9q2R/9E5uvbXCFwxH3SN2TPLz
 Q6iRqAeA97mE0zib94YSnRFg7nKsVkrgGVjK8Mmn/QU2Wc2CJ2Biogh0sLx7FPBie3EjRXbO/u2
 YOCHvkRKr7OAyPewchTy4zaSAR0AMAF2+jKeCfPRv5qE4JHnjppnOU0oUo+DrteossfcABDjoHk
 bQuqktXObQa7MdJ+qaUXVvl53opbp9cYrVNhQ/RC7bWjGRS/Hsfm9igArwKNvaPOeVFdJ25E//X
 Z5/ToMilJ6tQkZojAUaLMt+1Rx4U4gPqIUWX4MYCJocNpukE
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
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c         | 32 ----------------------
 drivers/phy/qualcomm/phy-qcom-qmp.h              | 25 +++++++++++++++++
 8 files changed, 26 insertions(+), 137 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index bb961094e41a..b6908a03da58 100644
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
index 6119950e455e..5985d019252c 100644
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
index 01a96c60c913..38c4a4cc670a 100644
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
index 02d90850baf2..80071f688671 100644
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
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
index 2de440f0bf02..d316a541f628 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
@@ -28,38 +28,6 @@
 #include "phy-qcom-qmp.h"
 #include "phy-qcom-qmp-pcs-misc-v3.h"
 
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


