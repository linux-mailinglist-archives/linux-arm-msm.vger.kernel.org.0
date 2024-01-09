Return-Path: <linux-arm-msm+bounces-6709-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E960F827D34
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jan 2024 04:04:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2336D1F244B8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jan 2024 03:04:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2DCE6106;
	Tue,  9 Jan 2024 03:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QGeua5k5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F11F5395
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jan 2024 03:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2ccec119587so28396881fa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jan 2024 19:04:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704769447; x=1705374247; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TP6GRjzdQEtuwVNJ22A6QSMTAgb1n7vuBGLyOlDRLe8=;
        b=QGeua5k56sXfFskILdfQYjz7/sZQVyhntQZYqxGN6+WFrHORzJP1AjcHg/IYSQxga2
         1OirWrOFNKNbvdPFsxDnsoMJXbgzBUVi1XfqpG9sUocUo+CO6bR63+cp5Pa7xvy4wjpZ
         k/YJmfID629oA+FGsXW97Yp5fJc0DbwwPl657ZEVPEflMRgn2B5T47sjKCpbThNUdtoY
         ic2z/4E7SwmITgHkKN8te45lLdi7m6ATQRL4UG7qvFDeL2gBMJ7WjtUn1YLYdo57weNV
         8WseY0UInqV4dl/AVcMtI61IF1IrI1+x+zy1pueQ3rpP2IpLrsv6VNaqCrh0cy+Ko3yQ
         jyIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704769447; x=1705374247;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TP6GRjzdQEtuwVNJ22A6QSMTAgb1n7vuBGLyOlDRLe8=;
        b=lr4f0BaWoMCQXCVT7N1KDGqz1bgmf0oB+fBR15yq8v1YQMpnRX2+P64LyPxPB0r9c8
         2Xh+W3HG6GpzGcQ0id9DCx9hRYq1XRlNrEk3gRj6ZRT8KzaQv1hVd8cqRZrsz7w/qWtZ
         oblhFX1sQO1wj2/FXbwMIEUtZdzgreaKX4aC2uGMwzTFHoYy/RmlHip4/w0K3UyPCU+4
         OE6MqKqCZ6vTlWtvlJ9IpkGKtd8b37IIliFH6murFBSM7BKS2MzkLyYIlwopiiZeATbE
         DopvCOJqacehxhANnhrLPvEFRzWAVHOV6nRKw17bWpiIsOqvPDX4eUXyjNqKy5XgTUt2
         /TgQ==
X-Gm-Message-State: AOJu0Ywsjz9lFZNCQryyK9Z1w/dJ28LW8k71E3zhv7HYqEFO2GE/cRJ+
	tzs/e94CfgPU95NzKhlMcDQst/Lxx1teWw==
X-Google-Smtp-Source: AGHT+IE1sTVVo8uE8LihK9ZbIhbtt6Rkz8ckVcVwexXuLeDtay3Gex/huWIqtIH9sZYP7VaavAa0iA==
X-Received: by 2002:a2e:be93:0:b0:2cd:936:8b68 with SMTP id a19-20020a2ebe93000000b002cd09368b68mr2630346ljr.56.1704769447564;
        Mon, 08 Jan 2024 19:04:07 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id g30-20020a2e391e000000b002cd1ad3b11csm176920lja.42.2024.01.08.19.04.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 19:04:07 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 09 Jan 2024 05:04:05 +0200
Subject: [PATCH 7/8] phy: qcom: sgmii-eth: use existing register
 definitions
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240109-phy-qmp-merge-common-v1-7-572899a14318@linaro.org>
References: <20240109-phy-qmp-merge-common-v1-0-572899a14318@linaro.org>
In-Reply-To: <20240109-phy-qmp-merge-common-v1-0-572899a14318@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=25939;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=MNDcGPi3jXRbFhtBDOtCVwUNUCWjxnA1vYQ96GhwJlI=;
 b=owEBbAGT/pANAwAKAYs8ij4CKSjVAcsmYgBlnLehsGmhNkR88GYVPc38StH2fWtyavmkO8Iow
 +GWvdaBxEWJATIEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZZy3oQAKCRCLPIo+Aiko
 1Yx1B/igbsrx78PyddiodJt1Oo2l01yJr7b8eqZ/iYd/wmKjAdMN3eDStx7wxKJjzkkLcyW37wj
 2YpCNZuzKIBYtIkBj6suRvltIWVMsBiDBnWX8TJo4G+oyrFoM5qPo61/UIBN9QOOhFG/R9PUcXl
 czxSiL/BAkzIY191m8feBPUyK2bqA/2a5vQjGy95KFfMuTiwprtpJ0Q3P30VORQIXMgK7tz8NgT
 ScurJUBlPOZ8bwMDAjiidpglysY0+IUU6yRtFLk5ukM/ieBhpLw0FHtWVoC8q7UJhuABn2D5X+V
 iSO7eUleVFlxLq0V3JMi56RfuicDHotVKJb4ypFeKKZtpis=
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The Qualcomm SGMII SerDes PHY is a QMP PHY. As such, it uses standard
registers for QSERDES COM/RX/TX regions. Use register defines from the
existing headers.

Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-sgmii-eth.c | 367 ++++++++++++------------------
 1 file changed, 149 insertions(+), 218 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c b/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c
index 03dc753f0de1..233f9b70c673 100644
--- a/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c
+++ b/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c
@@ -11,83 +11,14 @@
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
-#define QSERDES_QMP_PLL					0x0
-#define QSERDES_COM_BIN_VCOCAL_CMP_CODE1_MODE0		(QSERDES_QMP_PLL + 0x1ac)
-#define QSERDES_COM_BIN_VCOCAL_CMP_CODE2_MODE0		(QSERDES_QMP_PLL + 0x1b0)
-#define QSERDES_COM_BIN_VCOCAL_HSCLK_SEL		(QSERDES_QMP_PLL + 0x1bc)
-#define QSERDES_COM_CORE_CLK_EN				(QSERDES_QMP_PLL + 0x174)
-#define QSERDES_COM_CORECLK_DIV_MODE0			(QSERDES_QMP_PLL + 0x168)
-#define QSERDES_COM_CP_CTRL_MODE0			(QSERDES_QMP_PLL + 0x74)
-#define QSERDES_COM_DEC_START_MODE0			(QSERDES_QMP_PLL + 0xbc)
-#define QSERDES_COM_DIV_FRAC_START1_MODE0		(QSERDES_QMP_PLL + 0xcc)
-#define QSERDES_COM_DIV_FRAC_START2_MODE0		(QSERDES_QMP_PLL + 0xd0)
-#define QSERDES_COM_DIV_FRAC_START3_MODE0		(QSERDES_QMP_PLL + 0xd4)
-#define QSERDES_COM_HSCLK_HS_SWITCH_SEL			(QSERDES_QMP_PLL + 0x15c)
-#define QSERDES_COM_HSCLK_SEL				(QSERDES_QMP_PLL + 0x158)
-#define QSERDES_COM_LOCK_CMP1_MODE0			(QSERDES_QMP_PLL + 0xac)
-#define QSERDES_COM_LOCK_CMP2_MODE0			(QSERDES_QMP_PLL + 0xb0)
-#define QSERDES_COM_PLL_CCTRL_MODE0			(QSERDES_QMP_PLL + 0x84)
-#define QSERDES_COM_PLL_IVCO				(QSERDES_QMP_PLL + 0x58)
-#define QSERDES_COM_PLL_RCTRL_MODE0			(QSERDES_QMP_PLL + 0x7c)
-#define QSERDES_COM_SYSCLK_EN_SEL			(QSERDES_QMP_PLL + 0x94)
-#define QSERDES_COM_VCO_TUNE1_MODE0			(QSERDES_QMP_PLL + 0x110)
-#define QSERDES_COM_VCO_TUNE2_MODE0			(QSERDES_QMP_PLL + 0x114)
-#define QSERDES_COM_VCO_TUNE_INITVAL2			(QSERDES_QMP_PLL + 0x124)
-#define QSERDES_COM_C_READY_STATUS			(QSERDES_QMP_PLL + 0x178)
-#define QSERDES_COM_CMN_STATUS				(QSERDES_QMP_PLL + 0x140)
+#include "phy-qcom-qmp-qserdes-com-v5.h"
+#include "phy-qcom-qmp-qserdes-txrx-v5.h"
 
+#define QSERDES_QMP_PLL					0x0
 #define QSERDES_RX					0x600
-#define QSERDES_RX_UCDR_FO_GAIN				(QSERDES_RX + 0x8)
-#define QSERDES_RX_UCDR_SO_GAIN				(QSERDES_RX + 0x14)
-#define QSERDES_RX_UCDR_FASTLOCK_FO_GAIN		(QSERDES_RX + 0x30)
-#define QSERDES_RX_UCDR_SO_SATURATION_AND_ENABLE	(QSERDES_RX + 0x34)
-#define QSERDES_RX_UCDR_FASTLOCK_COUNT_LOW		(QSERDES_RX + 0x3c)
-#define QSERDES_RX_UCDR_FASTLOCK_COUNT_HIGH		(QSERDES_RX + 0x40)
-#define QSERDES_RX_UCDR_PI_CONTROLS			(QSERDES_RX + 0x44)
-#define QSERDES_RX_UCDR_PI_CTRL2			(QSERDES_RX + 0x48)
-#define QSERDES_RX_RX_TERM_BW				(QSERDES_RX + 0x80)
-#define QSERDES_RX_VGA_CAL_CNTRL2			(QSERDES_RX + 0xd8)
-#define QSERDES_RX_GM_CAL				(QSERDES_RX + 0xdc)
-#define QSERDES_RX_RX_EQU_ADAPTOR_CNTRL1		(QSERDES_RX + 0xe8)
-#define QSERDES_RX_RX_EQU_ADAPTOR_CNTRL2		(QSERDES_RX + 0xec)
-#define QSERDES_RX_RX_EQU_ADAPTOR_CNTRL3		(QSERDES_RX + 0xf0)
-#define QSERDES_RX_RX_EQU_ADAPTOR_CNTRL4		(QSERDES_RX + 0xf4)
-#define QSERDES_RX_RX_IDAC_TSETTLE_LOW			(QSERDES_RX + 0xf8)
-#define QSERDES_RX_RX_IDAC_TSETTLE_HIGH			(QSERDES_RX + 0xfc)
-#define QSERDES_RX_RX_IDAC_MEASURE_TIME			(QSERDES_RX + 0x100)
-#define QSERDES_RX_RX_EQ_OFFSET_ADAPTOR_CNTRL1		(QSERDES_RX + 0x110)
-#define QSERDES_RX_RX_OFFSET_ADAPTOR_CNTRL2		(QSERDES_RX + 0x114)
-#define QSERDES_RX_SIGDET_CNTRL				(QSERDES_RX + 0x11c)
-#define QSERDES_RX_SIGDET_DEGLITCH_CNTRL		(QSERDES_RX + 0x124)
-#define QSERDES_RX_RX_BAND				(QSERDES_RX + 0x128)
-#define QSERDES_RX_RX_MODE_00_LOW			(QSERDES_RX + 0x15c)
-#define QSERDES_RX_RX_MODE_00_HIGH			(QSERDES_RX + 0x160)
-#define QSERDES_RX_RX_MODE_00_HIGH2			(QSERDES_RX + 0x164)
-#define QSERDES_RX_RX_MODE_00_HIGH3			(QSERDES_RX + 0x168)
-#define QSERDES_RX_RX_MODE_00_HIGH4			(QSERDES_RX + 0x16c)
-#define QSERDES_RX_RX_MODE_01_LOW			(QSERDES_RX + 0x170)
-#define QSERDES_RX_RX_MODE_01_HIGH			(QSERDES_RX + 0x174)
-#define QSERDES_RX_RX_MODE_01_HIGH2			(QSERDES_RX + 0x178)
-#define QSERDES_RX_RX_MODE_01_HIGH3			(QSERDES_RX + 0x17c)
-#define QSERDES_RX_RX_MODE_01_HIGH4			(QSERDES_RX + 0x180)
-#define QSERDES_RX_RX_MODE_10_LOW			(QSERDES_RX + 0x184)
-#define QSERDES_RX_RX_MODE_10_HIGH			(QSERDES_RX + 0x188)
-#define QSERDES_RX_RX_MODE_10_HIGH2			(QSERDES_RX + 0x18c)
-#define QSERDES_RX_RX_MODE_10_HIGH3			(QSERDES_RX + 0x190)
-#define QSERDES_RX_RX_MODE_10_HIGH4			(QSERDES_RX + 0x194)
-#define QSERDES_RX_DCC_CTRL1				(QSERDES_RX + 0x1a8)
-
 #define QSERDES_TX					0x400
-#define QSERDES_TX_TX_BAND				(QSERDES_TX + 0x24)
-#define QSERDES_TX_SLEW_CNTL				(QSERDES_TX + 0x28)
-#define QSERDES_TX_RES_CODE_LANE_OFFSET_TX		(QSERDES_TX + 0x3c)
-#define QSERDES_TX_RES_CODE_LANE_OFFSET_RX		(QSERDES_TX + 0x40)
-#define QSERDES_TX_LANE_MODE_1				(QSERDES_TX + 0x84)
-#define QSERDES_TX_LANE_MODE_3				(QSERDES_TX + 0x8c)
-#define QSERDES_TX_RCV_DETECT_LVL_2			(QSERDES_TX + 0xa4)
-#define QSERDES_TX_TRAN_DRVR_EMP_EN			(QSERDES_TX + 0xc0)
-
-#define QSERDES_PCS					0xC00
+#define QSERDES_PCS					0xc00
+
 #define QSERDES_PCS_PHY_START				(QSERDES_PCS + 0x0)
 #define QSERDES_PCS_POWER_DOWN_CONTROL			(QSERDES_PCS + 0x4)
 #define QSERDES_PCS_SW_RESET				(QSERDES_PCS + 0x8)
@@ -115,77 +46,77 @@ static void qcom_dwmac_sgmii_phy_init_1g(struct regmap *regmap)
 	regmap_write(regmap, QSERDES_PCS_SW_RESET, 0x01);
 	regmap_write(regmap, QSERDES_PCS_POWER_DOWN_CONTROL, 0x01);
 
-	regmap_write(regmap, QSERDES_COM_PLL_IVCO, 0x0F);
-	regmap_write(regmap, QSERDES_COM_CP_CTRL_MODE0, 0x06);
-	regmap_write(regmap, QSERDES_COM_PLL_RCTRL_MODE0, 0x16);
-	regmap_write(regmap, QSERDES_COM_PLL_CCTRL_MODE0, 0x36);
-	regmap_write(regmap, QSERDES_COM_SYSCLK_EN_SEL, 0x1A);
-	regmap_write(regmap, QSERDES_COM_LOCK_CMP1_MODE0, 0x0A);
-	regmap_write(regmap, QSERDES_COM_LOCK_CMP2_MODE0, 0x1A);
-	regmap_write(regmap, QSERDES_COM_DEC_START_MODE0, 0x82);
-	regmap_write(regmap, QSERDES_COM_DIV_FRAC_START1_MODE0, 0x55);
-	regmap_write(regmap, QSERDES_COM_DIV_FRAC_START2_MODE0, 0x55);
-	regmap_write(regmap, QSERDES_COM_DIV_FRAC_START3_MODE0, 0x03);
-	regmap_write(regmap, QSERDES_COM_VCO_TUNE1_MODE0, 0x24);
-
-	regmap_write(regmap, QSERDES_COM_VCO_TUNE2_MODE0, 0x02);
-	regmap_write(regmap, QSERDES_COM_VCO_TUNE_INITVAL2, 0x00);
-	regmap_write(regmap, QSERDES_COM_HSCLK_SEL, 0x04);
-	regmap_write(regmap, QSERDES_COM_HSCLK_HS_SWITCH_SEL, 0x00);
-	regmap_write(regmap, QSERDES_COM_CORECLK_DIV_MODE0, 0x0A);
-	regmap_write(regmap, QSERDES_COM_CORE_CLK_EN, 0x00);
-	regmap_write(regmap, QSERDES_COM_BIN_VCOCAL_CMP_CODE1_MODE0, 0xB9);
-	regmap_write(regmap, QSERDES_COM_BIN_VCOCAL_CMP_CODE2_MODE0, 0x1E);
-	regmap_write(regmap, QSERDES_COM_BIN_VCOCAL_HSCLK_SEL, 0x11);
-
-	regmap_write(regmap, QSERDES_TX_TX_BAND, 0x05);
-	regmap_write(regmap, QSERDES_TX_SLEW_CNTL, 0x0A);
-	regmap_write(regmap, QSERDES_TX_RES_CODE_LANE_OFFSET_TX, 0x09);
-	regmap_write(regmap, QSERDES_TX_RES_CODE_LANE_OFFSET_RX, 0x09);
-	regmap_write(regmap, QSERDES_TX_LANE_MODE_1, 0x05);
-	regmap_write(regmap, QSERDES_TX_LANE_MODE_3, 0x00);
-	regmap_write(regmap, QSERDES_TX_RCV_DETECT_LVL_2, 0x12);
-	regmap_write(regmap, QSERDES_TX_TRAN_DRVR_EMP_EN, 0x0C);
-
-	regmap_write(regmap, QSERDES_RX_UCDR_FO_GAIN, 0x0A);
-	regmap_write(regmap, QSERDES_RX_UCDR_SO_GAIN, 0x06);
-	regmap_write(regmap, QSERDES_RX_UCDR_FASTLOCK_FO_GAIN, 0x0A);
-	regmap_write(regmap, QSERDES_RX_UCDR_SO_SATURATION_AND_ENABLE, 0x7F);
-	regmap_write(regmap, QSERDES_RX_UCDR_FASTLOCK_COUNT_LOW, 0x00);
-	regmap_write(regmap, QSERDES_RX_UCDR_FASTLOCK_COUNT_HIGH, 0x01);
-	regmap_write(regmap, QSERDES_RX_UCDR_PI_CONTROLS, 0x81);
-	regmap_write(regmap, QSERDES_RX_UCDR_PI_CTRL2, 0x80);
-	regmap_write(regmap, QSERDES_RX_RX_TERM_BW, 0x04);
-	regmap_write(regmap, QSERDES_RX_VGA_CAL_CNTRL2, 0x08);
-	regmap_write(regmap, QSERDES_RX_GM_CAL, 0x0F);
-	regmap_write(regmap, QSERDES_RX_RX_EQU_ADAPTOR_CNTRL1, 0x04);
-	regmap_write(regmap, QSERDES_RX_RX_EQU_ADAPTOR_CNTRL2, 0x00);
-	regmap_write(regmap, QSERDES_RX_RX_EQU_ADAPTOR_CNTRL3, 0x4A);
-	regmap_write(regmap, QSERDES_RX_RX_EQU_ADAPTOR_CNTRL4, 0x0A);
-	regmap_write(regmap, QSERDES_RX_RX_IDAC_TSETTLE_LOW, 0x80);
-	regmap_write(regmap, QSERDES_RX_RX_IDAC_TSETTLE_HIGH, 0x01);
-	regmap_write(regmap, QSERDES_RX_RX_IDAC_MEASURE_TIME, 0x20);
-	regmap_write(regmap, QSERDES_RX_RX_EQ_OFFSET_ADAPTOR_CNTRL1, 0x17);
-	regmap_write(regmap, QSERDES_RX_RX_OFFSET_ADAPTOR_CNTRL2, 0x00);
-	regmap_write(regmap, QSERDES_RX_SIGDET_CNTRL, 0x0F);
-	regmap_write(regmap, QSERDES_RX_SIGDET_DEGLITCH_CNTRL, 0x1E);
-	regmap_write(regmap, QSERDES_RX_RX_BAND, 0x05);
-	regmap_write(regmap, QSERDES_RX_RX_MODE_00_LOW, 0xE0);
-	regmap_write(regmap, QSERDES_RX_RX_MODE_00_HIGH, 0xC8);
-	regmap_write(regmap, QSERDES_RX_RX_MODE_00_HIGH2, 0xC8);
-	regmap_write(regmap, QSERDES_RX_RX_MODE_00_HIGH3, 0x09);
-	regmap_write(regmap, QSERDES_RX_RX_MODE_00_HIGH4, 0xB1);
-	regmap_write(regmap, QSERDES_RX_RX_MODE_01_LOW, 0xE0);
-	regmap_write(regmap, QSERDES_RX_RX_MODE_01_HIGH, 0xC8);
-	regmap_write(regmap, QSERDES_RX_RX_MODE_01_HIGH2, 0xC8);
-	regmap_write(regmap, QSERDES_RX_RX_MODE_01_HIGH3, 0x09);
-	regmap_write(regmap, QSERDES_RX_RX_MODE_01_HIGH4, 0xB1);
-	regmap_write(regmap, QSERDES_RX_RX_MODE_10_LOW, 0xE0);
-	regmap_write(regmap, QSERDES_RX_RX_MODE_10_HIGH, 0xC8);
-	regmap_write(regmap, QSERDES_RX_RX_MODE_10_HIGH2, 0xC8);
-	regmap_write(regmap, QSERDES_RX_RX_MODE_10_HIGH3, 0x3B);
-	regmap_write(regmap, QSERDES_RX_RX_MODE_10_HIGH4, 0xB7);
-	regmap_write(regmap, QSERDES_RX_DCC_CTRL1, 0x0C);
+	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V5_COM_PLL_IVCO, 0x0F);
+	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V5_COM_CP_CTRL_MODE0, 0x06);
+	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V5_COM_PLL_RCTRL_MODE0, 0x16);
+	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V5_COM_PLL_CCTRL_MODE0, 0x36);
+	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V5_COM_SYSCLK_EN_SEL, 0x1A);
+	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V5_COM_LOCK_CMP1_MODE0, 0x0A);
+	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V5_COM_LOCK_CMP2_MODE0, 0x1A);
+	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V5_COM_DEC_START_MODE0, 0x82);
+	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V5_COM_DIV_FRAC_START1_MODE0, 0x55);
+	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V5_COM_DIV_FRAC_START2_MODE0, 0x55);
+	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V5_COM_DIV_FRAC_START3_MODE0, 0x03);
+	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V5_COM_VCO_TUNE1_MODE0, 0x24);
+
+	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V5_COM_VCO_TUNE2_MODE0, 0x02);
+	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V5_COM_VCO_TUNE_INITVAL2, 0x00);
+	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V5_COM_HSCLK_SEL, 0x04);
+	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V5_COM_HSCLK_HS_SWITCH_SEL, 0x00);
+	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V5_COM_CORECLK_DIV_MODE0, 0x0A);
+	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V5_COM_CORE_CLK_EN, 0x00);
+	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V5_COM_BIN_VCOCAL_CMP_CODE1_MODE0, 0xB9);
+	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V5_COM_BIN_VCOCAL_CMP_CODE2_MODE0, 0x1E);
+	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V5_COM_BIN_VCOCAL_HSCLK_SEL, 0x11);
+
+	regmap_write(regmap, QSERDES_TX + QSERDES_V5_TX_TX_BAND, 0x05);
+	regmap_write(regmap, QSERDES_TX + QSERDES_V5_TX_SLEW_CNTL, 0x0A);
+	regmap_write(regmap, QSERDES_TX + QSERDES_V5_TX_RES_CODE_LANE_OFFSET_TX, 0x09);
+	regmap_write(regmap, QSERDES_TX + QSERDES_V5_TX_RES_CODE_LANE_OFFSET_RX, 0x09);
+	regmap_write(regmap, QSERDES_TX + QSERDES_V5_TX_LANE_MODE_1, 0x05);
+	regmap_write(regmap, QSERDES_TX + QSERDES_V5_TX_LANE_MODE_3, 0x00);
+	regmap_write(regmap, QSERDES_TX + QSERDES_V5_TX_RCV_DETECT_LVL_2, 0x12);
+	regmap_write(regmap, QSERDES_TX + QSERDES_V5_TX_TRAN_DRVR_EMP_EN, 0x0C);
+
+	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_UCDR_FO_GAIN, 0x0A);
+	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_UCDR_SO_GAIN, 0x06);
+	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_UCDR_FASTLOCK_FO_GAIN, 0x0A);
+	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_UCDR_SO_SATURATION_AND_ENABLE, 0x7F);
+	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_UCDR_FASTLOCK_COUNT_LOW, 0x00);
+	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_UCDR_FASTLOCK_COUNT_HIGH, 0x01);
+	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_UCDR_PI_CONTROLS, 0x81);
+	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_UCDR_PI_CTRL2, 0x80);
+	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_RX_TERM_BW, 0x04);
+	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_VGA_CAL_CNTRL2, 0x08);
+	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_GM_CAL, 0x0F);
+	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_RX_EQU_ADAPTOR_CNTRL1, 0x04);
+	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_RX_EQU_ADAPTOR_CNTRL2, 0x00);
+	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_RX_EQU_ADAPTOR_CNTRL3, 0x4A);
+	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_RX_EQU_ADAPTOR_CNTRL4, 0x0A);
+	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_RX_IDAC_TSETTLE_LOW, 0x80);
+	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_RX_IDAC_TSETTLE_HIGH, 0x01);
+	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_RX_IDAC_MEASURE_TIME, 0x20);
+	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_RX_EQ_OFFSET_ADAPTOR_CNTRL1, 0x17);
+	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_RX_OFFSET_ADAPTOR_CNTRL2, 0x00);
+	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_SIGDET_CNTRL, 0x0F);
+	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_SIGDET_DEGLITCH_CNTRL, 0x1E);
+	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_RX_BAND, 0x05);
+	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_RX_MODE_00_LOW, 0xE0);
+	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_RX_MODE_00_HIGH, 0xC8);
+	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_RX_MODE_00_HIGH2, 0xC8);
+	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_RX_MODE_00_HIGH3, 0x09);
+	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_RX_MODE_00_HIGH4, 0xB1);
+	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_RX_MODE_01_LOW, 0xE0);
+	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_RX_MODE_01_HIGH, 0xC8);
+	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_RX_MODE_01_HIGH2, 0xC8);
+	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_RX_MODE_01_HIGH3, 0x09);
+	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_RX_MODE_01_HIGH4, 0xB1);
+	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_RX_MODE_10_LOW, 0xE0);
+	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_RX_MODE_10_HIGH, 0xC8);
+	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_RX_MODE_10_HIGH2, 0xC8);
+	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_RX_MODE_10_HIGH3, 0x3B);
+	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_RX_MODE_10_HIGH4, 0xB7);
+	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_DCC_CTRL1, 0x0C);
 
 	regmap_write(regmap, QSERDES_PCS_LINE_RESET_TIME, 0x0C);
 	regmap_write(regmap, QSERDES_PCS_TX_LARGE_AMP_DRV_LVL, 0x1F);
@@ -203,77 +134,77 @@ static void qcom_dwmac_sgmii_phy_init_2p5g(struct regmap *regmap)
 	regmap_write(regmap, QSERDES_PCS_SW_RESET, 0x01);
 	regmap_write(regmap, QSERDES_PCS_POWER_DOWN_CONTROL, 0x01);
 
-	regmap_write(regmap, QSERDES_COM_PLL_IVCO, 0x0F);
-	regmap_write(regmap, QSERDES_COM_CP_CTRL_MODE0, 0x06);
-	regmap_write(regmap, QSERDES_COM_PLL_RCTRL_MODE0, 0x16);
-	regmap_write(regmap, QSERDES_COM_PLL_CCTRL_MODE0, 0x36);
-	regmap_write(regmap, QSERDES_COM_SYSCLK_EN_SEL, 0x1A);
-	regmap_write(regmap, QSERDES_COM_LOCK_CMP1_MODE0, 0x1A);
-	regmap_write(regmap, QSERDES_COM_LOCK_CMP2_MODE0, 0x41);
-	regmap_write(regmap, QSERDES_COM_DEC_START_MODE0, 0x7A);
-	regmap_write(regmap, QSERDES_COM_DIV_FRAC_START1_MODE0, 0x00);
-	regmap_write(regmap, QSERDES_COM_DIV_FRAC_START2_MODE0, 0x20);
-	regmap_write(regmap, QSERDES_COM_DIV_FRAC_START3_MODE0, 0x01);
-	regmap_write(regmap, QSERDES_COM_VCO_TUNE1_MODE0, 0xA1);
-
-	regmap_write(regmap, QSERDES_COM_VCO_TUNE2_MODE0, 0x02);
-	regmap_write(regmap, QSERDES_COM_VCO_TUNE_INITVAL2, 0x00);
-	regmap_write(regmap, QSERDES_COM_HSCLK_SEL, 0x03);
-	regmap_write(regmap, QSERDES_COM_HSCLK_HS_SWITCH_SEL, 0x00);
-	regmap_write(regmap, QSERDES_COM_CORECLK_DIV_MODE0, 0x05);
-	regmap_write(regmap, QSERDES_COM_CORE_CLK_EN, 0x00);
-	regmap_write(regmap, QSERDES_COM_BIN_VCOCAL_CMP_CODE1_MODE0, 0xCD);
-	regmap_write(regmap, QSERDES_COM_BIN_VCOCAL_CMP_CODE2_MODE0, 0x1C);
-	regmap_write(regmap, QSERDES_COM_BIN_VCOCAL_HSCLK_SEL, 0x11);
-
-	regmap_write(regmap, QSERDES_TX_TX_BAND, 0x04);
-	regmap_write(regmap, QSERDES_TX_SLEW_CNTL, 0x0A);
-	regmap_write(regmap, QSERDES_TX_RES_CODE_LANE_OFFSET_TX, 0x09);
-	regmap_write(regmap, QSERDES_TX_RES_CODE_LANE_OFFSET_RX, 0x02);
-	regmap_write(regmap, QSERDES_TX_LANE_MODE_1, 0x05);
-	regmap_write(regmap, QSERDES_TX_LANE_MODE_3, 0x00);
-	regmap_write(regmap, QSERDES_TX_RCV_DETECT_LVL_2, 0x12);
-	regmap_write(regmap, QSERDES_TX_TRAN_DRVR_EMP_EN, 0x0C);
-
-	regmap_write(regmap, QSERDES_RX_UCDR_FO_GAIN, 0x0A);
-	regmap_write(regmap, QSERDES_RX_UCDR_SO_GAIN, 0x06);
-	regmap_write(regmap, QSERDES_RX_UCDR_FASTLOCK_FO_GAIN, 0x0A);
-	regmap_write(regmap, QSERDES_RX_UCDR_SO_SATURATION_AND_ENABLE, 0x7F);
-	regmap_write(regmap, QSERDES_RX_UCDR_FASTLOCK_COUNT_LOW, 0x00);
-	regmap_write(regmap, QSERDES_RX_UCDR_FASTLOCK_COUNT_HIGH, 0x01);
-	regmap_write(regmap, QSERDES_RX_UCDR_PI_CONTROLS, 0x81);
-	regmap_write(regmap, QSERDES_RX_UCDR_PI_CTRL2, 0x80);
-	regmap_write(regmap, QSERDES_RX_RX_TERM_BW, 0x00);
-	regmap_write(regmap, QSERDES_RX_VGA_CAL_CNTRL2, 0x08);
-	regmap_write(regmap, QSERDES_RX_GM_CAL, 0x0F);
-	regmap_write(regmap, QSERDES_RX_RX_EQU_ADAPTOR_CNTRL1, 0x04);
-	regmap_write(regmap, QSERDES_RX_RX_EQU_ADAPTOR_CNTRL2, 0x00);
-	regmap_write(regmap, QSERDES_RX_RX_EQU_ADAPTOR_CNTRL3, 0x4A);
-	regmap_write(regmap, QSERDES_RX_RX_EQU_ADAPTOR_CNTRL4, 0x0A);
-	regmap_write(regmap, QSERDES_RX_RX_IDAC_TSETTLE_LOW, 0x80);
-	regmap_write(regmap, QSERDES_RX_RX_IDAC_TSETTLE_HIGH, 0x01);
-	regmap_write(regmap, QSERDES_RX_RX_IDAC_MEASURE_TIME, 0x20);
-	regmap_write(regmap, QSERDES_RX_RX_EQ_OFFSET_ADAPTOR_CNTRL1, 0x17);
-	regmap_write(regmap, QSERDES_RX_RX_OFFSET_ADAPTOR_CNTRL2, 0x00);
-	regmap_write(regmap, QSERDES_RX_SIGDET_CNTRL, 0x0F);
-	regmap_write(regmap, QSERDES_RX_SIGDET_DEGLITCH_CNTRL, 0x1E);
-	regmap_write(regmap, QSERDES_RX_RX_BAND, 0x18);
-	regmap_write(regmap, QSERDES_RX_RX_MODE_00_LOW, 0x18);
-	regmap_write(regmap, QSERDES_RX_RX_MODE_00_HIGH, 0xC8);
-	regmap_write(regmap, QSERDES_RX_RX_MODE_00_HIGH2, 0xC8);
-	regmap_write(regmap, QSERDES_RX_RX_MODE_00_HIGH3, 0x0C);
-	regmap_write(regmap, QSERDES_RX_RX_MODE_00_HIGH4, 0xB8);
-	regmap_write(regmap, QSERDES_RX_RX_MODE_01_LOW, 0xE0);
-	regmap_write(regmap, QSERDES_RX_RX_MODE_01_HIGH, 0xC8);
-	regmap_write(regmap, QSERDES_RX_RX_MODE_01_HIGH2, 0xC8);
-	regmap_write(regmap, QSERDES_RX_RX_MODE_01_HIGH3, 0x09);
-	regmap_write(regmap, QSERDES_RX_RX_MODE_01_HIGH4, 0xB1);
-	regmap_write(regmap, QSERDES_RX_RX_MODE_10_LOW, 0xE0);
-	regmap_write(regmap, QSERDES_RX_RX_MODE_10_HIGH, 0xC8);
-	regmap_write(regmap, QSERDES_RX_RX_MODE_10_HIGH2, 0xC8);
-	regmap_write(regmap, QSERDES_RX_RX_MODE_10_HIGH3, 0x3B);
-	regmap_write(regmap, QSERDES_RX_RX_MODE_10_HIGH4, 0xB7);
-	regmap_write(regmap, QSERDES_RX_DCC_CTRL1, 0x0C);
+	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V5_COM_PLL_IVCO, 0x0F);
+	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V5_COM_CP_CTRL_MODE0, 0x06);
+	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V5_COM_PLL_RCTRL_MODE0, 0x16);
+	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V5_COM_PLL_CCTRL_MODE0, 0x36);
+	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V5_COM_SYSCLK_EN_SEL, 0x1A);
+	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V5_COM_LOCK_CMP1_MODE0, 0x1A);
+	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V5_COM_LOCK_CMP2_MODE0, 0x41);
+	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V5_COM_DEC_START_MODE0, 0x7A);
+	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V5_COM_DIV_FRAC_START1_MODE0, 0x00);
+	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V5_COM_DIV_FRAC_START2_MODE0, 0x20);
+	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V5_COM_DIV_FRAC_START3_MODE0, 0x01);
+	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V5_COM_VCO_TUNE1_MODE0, 0xA1);
+
+	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V5_COM_VCO_TUNE2_MODE0, 0x02);
+	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V5_COM_VCO_TUNE_INITVAL2, 0x00);
+	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V5_COM_HSCLK_SEL, 0x03);
+	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V5_COM_HSCLK_HS_SWITCH_SEL, 0x00);
+	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V5_COM_CORECLK_DIV_MODE0, 0x05);
+	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V5_COM_CORE_CLK_EN, 0x00);
+	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V5_COM_BIN_VCOCAL_CMP_CODE1_MODE0, 0xCD);
+	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V5_COM_BIN_VCOCAL_CMP_CODE2_MODE0, 0x1C);
+	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V5_COM_BIN_VCOCAL_HSCLK_SEL, 0x11);
+
+	regmap_write(regmap, QSERDES_TX + QSERDES_V5_TX_TX_BAND, 0x04);
+	regmap_write(regmap, QSERDES_TX + QSERDES_V5_TX_SLEW_CNTL, 0x0A);
+	regmap_write(regmap, QSERDES_TX + QSERDES_V5_TX_RES_CODE_LANE_OFFSET_TX, 0x09);
+	regmap_write(regmap, QSERDES_TX + QSERDES_V5_TX_RES_CODE_LANE_OFFSET_RX, 0x02);
+	regmap_write(regmap, QSERDES_TX + QSERDES_V5_TX_LANE_MODE_1, 0x05);
+	regmap_write(regmap, QSERDES_TX + QSERDES_V5_TX_LANE_MODE_3, 0x00);
+	regmap_write(regmap, QSERDES_TX + QSERDES_V5_TX_RCV_DETECT_LVL_2, 0x12);
+	regmap_write(regmap, QSERDES_TX + QSERDES_V5_TX_TRAN_DRVR_EMP_EN, 0x0C);
+
+	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_UCDR_FO_GAIN, 0x0A);
+	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_UCDR_SO_GAIN, 0x06);
+	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_UCDR_FASTLOCK_FO_GAIN, 0x0A);
+	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_UCDR_SO_SATURATION_AND_ENABLE, 0x7F);
+	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_UCDR_FASTLOCK_COUNT_LOW, 0x00);
+	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_UCDR_FASTLOCK_COUNT_HIGH, 0x01);
+	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_UCDR_PI_CONTROLS, 0x81);
+	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_UCDR_PI_CTRL2, 0x80);
+	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_RX_TERM_BW, 0x00);
+	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_VGA_CAL_CNTRL2, 0x08);
+	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_GM_CAL, 0x0F);
+	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_RX_EQU_ADAPTOR_CNTRL1, 0x04);
+	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_RX_EQU_ADAPTOR_CNTRL2, 0x00);
+	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_RX_EQU_ADAPTOR_CNTRL3, 0x4A);
+	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_RX_EQU_ADAPTOR_CNTRL4, 0x0A);
+	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_RX_IDAC_TSETTLE_LOW, 0x80);
+	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_RX_IDAC_TSETTLE_HIGH, 0x01);
+	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_RX_IDAC_MEASURE_TIME, 0x20);
+	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_RX_EQ_OFFSET_ADAPTOR_CNTRL1, 0x17);
+	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_RX_OFFSET_ADAPTOR_CNTRL2, 0x00);
+	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_SIGDET_CNTRL, 0x0F);
+	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_SIGDET_DEGLITCH_CNTRL, 0x1E);
+	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_RX_BAND, 0x18);
+	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_RX_MODE_00_LOW, 0x18);
+	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_RX_MODE_00_HIGH, 0xC8);
+	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_RX_MODE_00_HIGH2, 0xC8);
+	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_RX_MODE_00_HIGH3, 0x0C);
+	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_RX_MODE_00_HIGH4, 0xB8);
+	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_RX_MODE_01_LOW, 0xE0);
+	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_RX_MODE_01_HIGH, 0xC8);
+	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_RX_MODE_01_HIGH2, 0xC8);
+	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_RX_MODE_01_HIGH3, 0x09);
+	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_RX_MODE_01_HIGH4, 0xB1);
+	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_RX_MODE_10_LOW, 0xE0);
+	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_RX_MODE_10_HIGH, 0xC8);
+	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_RX_MODE_10_HIGH2, 0xC8);
+	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_RX_MODE_10_HIGH3, 0x3B);
+	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_RX_MODE_10_HIGH4, 0xB7);
+	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_DCC_CTRL1, 0x0C);
 
 	regmap_write(regmap, QSERDES_PCS_LINE_RESET_TIME, 0x0C);
 	regmap_write(regmap, QSERDES_PCS_TX_LARGE_AMP_DRV_LVL, 0x1F);
@@ -313,7 +244,7 @@ static int qcom_dwmac_sgmii_phy_calibrate(struct phy *phy)
 	}
 
 	if (qcom_dwmac_sgmii_phy_poll_status(data->regmap,
-					     QSERDES_COM_C_READY_STATUS,
+					     QSERDES_QMP_PLL + QSERDES_V5_COM_C_READY_STATUS,
 					     QSERDES_COM_C_READY)) {
 		dev_err(dev, "QSERDES_COM_C_READY_STATUS timed-out");
 		return -ETIMEDOUT;
@@ -334,7 +265,7 @@ static int qcom_dwmac_sgmii_phy_calibrate(struct phy *phy)
 	}
 
 	if (qcom_dwmac_sgmii_phy_poll_status(data->regmap,
-					     QSERDES_COM_CMN_STATUS,
+					     QSERDES_QMP_PLL + QSERDES_V5_COM_CMN_STATUS,
 					     QSERDES_COM_C_PLL_LOCKED)) {
 		dev_err(dev, "PLL Lock Status timed-out");
 		return -ETIMEDOUT;

-- 
2.39.2


