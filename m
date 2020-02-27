Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7811B17156F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2020 11:57:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728924AbgB0K5L (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Feb 2020 05:57:11 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:26749 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728897AbgB0K5K (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Feb 2020 05:57:10 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1582801029; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=omZC7DiNsaT1afZqvoRn1/oXnO2bPazwbX9RKy0OMso=; b=pVo0nxDfx68Iw49ujvwl2aASMcbHpjTEUwAxH1sEpUcSkkQlVWqlLv86Ra/ChgjSI7FlacK2
 JqH9Tzr8D2gyXyvHxv8J4J0do6ZDBE2PDnMqjM3uBqpclscTBff14EM0WzrMpz4msQCbdIWk
 TH3Ul8Y6B7WHxUBmTp4kpVQsWTY=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e57a074.7f5dc307cdc0-smtp-out-n02;
 Thu, 27 Feb 2020 10:56:52 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id EE756C4479D; Thu, 27 Feb 2020 10:56:50 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        UPPERCASE_50_75,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-87.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 8CFC6C447A2;
        Thu, 27 Feb 2020 10:56:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 8CFC6C447A2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     robh+dt@kernel.org, georgi.djakov@linaro.org, evgreen@chromium.org
Cc:     bjorn.andersson@linaro.org, agross@kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mark.rutland@arm.com,
        saravanak@google.com, viresh.kumar@linaro.org,
        okukatla@codeaurora.org, Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v5 1/7] interconnect: qcom: Allow icc node to be used across icc providers
Date:   Thu, 27 Feb 2020 16:26:25 +0530
Message-Id: <20200227105632.15041-2-sibis@codeaurora.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200227105632.15041-1-sibis@codeaurora.org>
References: <20200227105632.15041-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Move the icc node ids to a common header, this will allow for
referencing/linking of icc nodes to multiple icc providers on
SDM845 SoCs.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 drivers/interconnect/qcom/sdm845.c | 134 +--------------------------
 drivers/interconnect/qcom/sdm845.h | 140 +++++++++++++++++++++++++++++
 2 files changed, 141 insertions(+), 133 deletions(-)
 create mode 100644 drivers/interconnect/qcom/sdm845.h

diff --git a/drivers/interconnect/qcom/sdm845.c b/drivers/interconnect/qcom/sdm845.c
index ab968afeee594..b013b80caa452 100644
--- a/drivers/interconnect/qcom/sdm845.c
+++ b/drivers/interconnect/qcom/sdm845.c
@@ -13,139 +13,7 @@
 
 #include "bcm-voter.h"
 #include "icc-rpmh.h"
-
-enum {
-	SDM845_MASTER_A1NOC_CFG = 1,
-	SDM845_MASTER_BLSP_1,
-	SDM845_MASTER_TSIF,
-	SDM845_MASTER_SDCC_2,
-	SDM845_MASTER_SDCC_4,
-	SDM845_MASTER_UFS_CARD,
-	SDM845_MASTER_UFS_MEM,
-	SDM845_MASTER_PCIE_0,
-	SDM845_MASTER_A2NOC_CFG,
-	SDM845_MASTER_QDSS_BAM,
-	SDM845_MASTER_BLSP_2,
-	SDM845_MASTER_CNOC_A2NOC,
-	SDM845_MASTER_CRYPTO,
-	SDM845_MASTER_IPA,
-	SDM845_MASTER_PCIE_1,
-	SDM845_MASTER_QDSS_ETR,
-	SDM845_MASTER_USB3_0,
-	SDM845_MASTER_USB3_1,
-	SDM845_MASTER_CAMNOC_HF0_UNCOMP,
-	SDM845_MASTER_CAMNOC_HF1_UNCOMP,
-	SDM845_MASTER_CAMNOC_SF_UNCOMP,
-	SDM845_MASTER_SPDM,
-	SDM845_MASTER_TIC,
-	SDM845_MASTER_SNOC_CNOC,
-	SDM845_MASTER_QDSS_DAP,
-	SDM845_MASTER_CNOC_DC_NOC,
-	SDM845_MASTER_APPSS_PROC,
-	SDM845_MASTER_GNOC_CFG,
-	SDM845_MASTER_LLCC,
-	SDM845_MASTER_TCU_0,
-	SDM845_MASTER_MEM_NOC_CFG,
-	SDM845_MASTER_GNOC_MEM_NOC,
-	SDM845_MASTER_MNOC_HF_MEM_NOC,
-	SDM845_MASTER_MNOC_SF_MEM_NOC,
-	SDM845_MASTER_SNOC_GC_MEM_NOC,
-	SDM845_MASTER_SNOC_SF_MEM_NOC,
-	SDM845_MASTER_GFX3D,
-	SDM845_MASTER_CNOC_MNOC_CFG,
-	SDM845_MASTER_CAMNOC_HF0,
-	SDM845_MASTER_CAMNOC_HF1,
-	SDM845_MASTER_CAMNOC_SF,
-	SDM845_MASTER_MDP0,
-	SDM845_MASTER_MDP1,
-	SDM845_MASTER_ROTATOR,
-	SDM845_MASTER_VIDEO_P0,
-	SDM845_MASTER_VIDEO_P1,
-	SDM845_MASTER_VIDEO_PROC,
-	SDM845_MASTER_SNOC_CFG,
-	SDM845_MASTER_A1NOC_SNOC,
-	SDM845_MASTER_A2NOC_SNOC,
-	SDM845_MASTER_GNOC_SNOC,
-	SDM845_MASTER_MEM_NOC_SNOC,
-	SDM845_MASTER_ANOC_PCIE_SNOC,
-	SDM845_MASTER_PIMEM,
-	SDM845_MASTER_GIC,
-	SDM845_SLAVE_A1NOC_SNOC,
-	SDM845_SLAVE_SERVICE_A1NOC,
-	SDM845_SLAVE_ANOC_PCIE_A1NOC_SNOC,
-	SDM845_SLAVE_A2NOC_SNOC,
-	SDM845_SLAVE_ANOC_PCIE_SNOC,
-	SDM845_SLAVE_SERVICE_A2NOC,
-	SDM845_SLAVE_CAMNOC_UNCOMP,
-	SDM845_SLAVE_A1NOC_CFG,
-	SDM845_SLAVE_A2NOC_CFG,
-	SDM845_SLAVE_AOP,
-	SDM845_SLAVE_AOSS,
-	SDM845_SLAVE_CAMERA_CFG,
-	SDM845_SLAVE_CLK_CTL,
-	SDM845_SLAVE_CDSP_CFG,
-	SDM845_SLAVE_RBCPR_CX_CFG,
-	SDM845_SLAVE_CRYPTO_0_CFG,
-	SDM845_SLAVE_DCC_CFG,
-	SDM845_SLAVE_CNOC_DDRSS,
-	SDM845_SLAVE_DISPLAY_CFG,
-	SDM845_SLAVE_GLM,
-	SDM845_SLAVE_GFX3D_CFG,
-	SDM845_SLAVE_IMEM_CFG,
-	SDM845_SLAVE_IPA_CFG,
-	SDM845_SLAVE_CNOC_MNOC_CFG,
-	SDM845_SLAVE_PCIE_0_CFG,
-	SDM845_SLAVE_PCIE_1_CFG,
-	SDM845_SLAVE_PDM,
-	SDM845_SLAVE_SOUTH_PHY_CFG,
-	SDM845_SLAVE_PIMEM_CFG,
-	SDM845_SLAVE_PRNG,
-	SDM845_SLAVE_QDSS_CFG,
-	SDM845_SLAVE_BLSP_2,
-	SDM845_SLAVE_BLSP_1,
-	SDM845_SLAVE_SDCC_2,
-	SDM845_SLAVE_SDCC_4,
-	SDM845_SLAVE_SNOC_CFG,
-	SDM845_SLAVE_SPDM_WRAPPER,
-	SDM845_SLAVE_SPSS_CFG,
-	SDM845_SLAVE_TCSR,
-	SDM845_SLAVE_TLMM_NORTH,
-	SDM845_SLAVE_TLMM_SOUTH,
-	SDM845_SLAVE_TSIF,
-	SDM845_SLAVE_UFS_CARD_CFG,
-	SDM845_SLAVE_UFS_MEM_CFG,
-	SDM845_SLAVE_USB3_0,
-	SDM845_SLAVE_USB3_1,
-	SDM845_SLAVE_VENUS_CFG,
-	SDM845_SLAVE_VSENSE_CTRL_CFG,
-	SDM845_SLAVE_CNOC_A2NOC,
-	SDM845_SLAVE_SERVICE_CNOC,
-	SDM845_SLAVE_LLCC_CFG,
-	SDM845_SLAVE_MEM_NOC_CFG,
-	SDM845_SLAVE_GNOC_SNOC,
-	SDM845_SLAVE_GNOC_MEM_NOC,
-	SDM845_SLAVE_SERVICE_GNOC,
-	SDM845_SLAVE_EBI1,
-	SDM845_SLAVE_MSS_PROC_MS_MPU_CFG,
-	SDM845_SLAVE_MEM_NOC_GNOC,
-	SDM845_SLAVE_LLCC,
-	SDM845_SLAVE_MEM_NOC_SNOC,
-	SDM845_SLAVE_SERVICE_MEM_NOC,
-	SDM845_SLAVE_MNOC_SF_MEM_NOC,
-	SDM845_SLAVE_MNOC_HF_MEM_NOC,
-	SDM845_SLAVE_SERVICE_MNOC,
-	SDM845_SLAVE_APPSS,
-	SDM845_SLAVE_SNOC_CNOC,
-	SDM845_SLAVE_SNOC_MEM_NOC_GC,
-	SDM845_SLAVE_SNOC_MEM_NOC_SF,
-	SDM845_SLAVE_IMEM,
-	SDM845_SLAVE_PCIE_0,
-	SDM845_SLAVE_PCIE_1,
-	SDM845_SLAVE_PIMEM,
-	SDM845_SLAVE_SERVICE_SNOC,
-	SDM845_SLAVE_QDSS_STM,
-	SDM845_SLAVE_TCU
-};
+#include "sdm845.h"
 
 DEFINE_QNODE(qhm_a1noc_cfg, SDM845_MASTER_A1NOC_CFG, 1, 4, SDM845_SLAVE_SERVICE_A1NOC);
 DEFINE_QNODE(qhm_qup1, SDM845_MASTER_BLSP_1, 1, 4, SDM845_SLAVE_A1NOC_SNOC);
diff --git a/drivers/interconnect/qcom/sdm845.h b/drivers/interconnect/qcom/sdm845.h
new file mode 100644
index 0000000000000..bc7e425ce9852
--- /dev/null
+++ b/drivers/interconnect/qcom/sdm845.h
@@ -0,0 +1,140 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2020, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef __DRIVERS_INTERCONNECT_QCOM_SDM845_H__
+#define __DRIVERS_INTERCONNECT_QCOM_SDM845_H__
+
+#define SDM845_MASTER_A1NOC_CFG				1
+#define SDM845_MASTER_BLSP_1				2
+#define SDM845_MASTER_TSIF				3
+#define SDM845_MASTER_SDCC_2				4
+#define SDM845_MASTER_SDCC_4				5
+#define SDM845_MASTER_UFS_CARD				6
+#define SDM845_MASTER_UFS_MEM				7
+#define SDM845_MASTER_PCIE_0				8
+#define SDM845_MASTER_A2NOC_CFG				9
+#define SDM845_MASTER_QDSS_BAM				10
+#define SDM845_MASTER_BLSP_2				11
+#define SDM845_MASTER_CNOC_A2NOC			12
+#define SDM845_MASTER_CRYPTO				13
+#define SDM845_MASTER_IPA				14
+#define SDM845_MASTER_PCIE_1				15
+#define SDM845_MASTER_QDSS_ETR				16
+#define SDM845_MASTER_USB3_0				17
+#define SDM845_MASTER_USB3_1				18
+#define SDM845_MASTER_CAMNOC_HF0_UNCOMP			19
+#define SDM845_MASTER_CAMNOC_HF1_UNCOMP			20
+#define SDM845_MASTER_CAMNOC_SF_UNCOMP			21
+#define SDM845_MASTER_SPDM				22
+#define SDM845_MASTER_TIC				23
+#define SDM845_MASTER_SNOC_CNOC				24
+#define SDM845_MASTER_QDSS_DAP				25
+#define SDM845_MASTER_CNOC_DC_NOC			26
+#define SDM845_MASTER_APPSS_PROC			27
+#define SDM845_MASTER_GNOC_CFG				28
+#define SDM845_MASTER_LLCC				29
+#define SDM845_MASTER_TCU_0				30
+#define SDM845_MASTER_MEM_NOC_CFG			31
+#define SDM845_MASTER_GNOC_MEM_NOC			32
+#define SDM845_MASTER_MNOC_HF_MEM_NOC			33
+#define SDM845_MASTER_MNOC_SF_MEM_NOC			34
+#define SDM845_MASTER_SNOC_GC_MEM_NOC			35
+#define SDM845_MASTER_SNOC_SF_MEM_NOC			36
+#define SDM845_MASTER_GFX3D				37
+#define SDM845_MASTER_CNOC_MNOC_CFG			38
+#define SDM845_MASTER_CAMNOC_HF0			39
+#define SDM845_MASTER_CAMNOC_HF1			40
+#define SDM845_MASTER_CAMNOC_SF				41
+#define SDM845_MASTER_MDP0				42
+#define SDM845_MASTER_MDP1				43
+#define SDM845_MASTER_ROTATOR				44
+#define SDM845_MASTER_VIDEO_P0				45
+#define SDM845_MASTER_VIDEO_P1				46
+#define SDM845_MASTER_VIDEO_PROC			47
+#define SDM845_MASTER_SNOC_CFG				48
+#define SDM845_MASTER_A1NOC_SNOC			49
+#define SDM845_MASTER_A2NOC_SNOC			50
+#define SDM845_MASTER_GNOC_SNOC				51
+#define SDM845_MASTER_MEM_NOC_SNOC			52
+#define SDM845_MASTER_ANOC_PCIE_SNOC			53
+#define SDM845_MASTER_PIMEM				54
+#define SDM845_MASTER_GIC				55
+#define SDM845_SLAVE_A1NOC_SNOC				56
+#define SDM845_SLAVE_SERVICE_A1NOC			57
+#define SDM845_SLAVE_ANOC_PCIE_A1NOC_SNOC		58
+#define SDM845_SLAVE_A2NOC_SNOC				59
+#define SDM845_SLAVE_ANOC_PCIE_SNOC			60
+#define SDM845_SLAVE_SERVICE_A2NOC			61
+#define SDM845_SLAVE_CAMNOC_UNCOMP			62
+#define SDM845_SLAVE_A1NOC_CFG				63
+#define SDM845_SLAVE_A2NOC_CFG				64
+#define SDM845_SLAVE_AOP				65
+#define SDM845_SLAVE_AOSS				66
+#define SDM845_SLAVE_CAMERA_CFG				67
+#define SDM845_SLAVE_CLK_CTL				68
+#define SDM845_SLAVE_CDSP_CFG				69
+#define SDM845_SLAVE_RBCPR_CX_CFG			70
+#define SDM845_SLAVE_CRYPTO_0_CFG			71
+#define SDM845_SLAVE_DCC_CFG				72
+#define SDM845_SLAVE_CNOC_DDRSS				73
+#define SDM845_SLAVE_DISPLAY_CFG			74
+#define SDM845_SLAVE_GLM				75
+#define SDM845_SLAVE_GFX3D_CFG				76
+#define SDM845_SLAVE_IMEM_CFG				77
+#define SDM845_SLAVE_IPA_CFG				78
+#define SDM845_SLAVE_CNOC_MNOC_CFG			79
+#define SDM845_SLAVE_PCIE_0_CFG				80
+#define SDM845_SLAVE_PCIE_1_CFG				81
+#define SDM845_SLAVE_PDM				82
+#define SDM845_SLAVE_SOUTH_PHY_CFG			83
+#define SDM845_SLAVE_PIMEM_CFG				84
+#define SDM845_SLAVE_PRNG				85
+#define SDM845_SLAVE_QDSS_CFG				86
+#define SDM845_SLAVE_BLSP_2				87
+#define SDM845_SLAVE_BLSP_1				88
+#define SDM845_SLAVE_SDCC_2				89
+#define SDM845_SLAVE_SDCC_4				90
+#define SDM845_SLAVE_SNOC_CFG				91
+#define SDM845_SLAVE_SPDM_WRAPPER			92
+#define SDM845_SLAVE_SPSS_CFG				93
+#define SDM845_SLAVE_TCSR				94
+#define SDM845_SLAVE_TLMM_NORTH				95
+#define SDM845_SLAVE_TLMM_SOUTH				96
+#define SDM845_SLAVE_TSIF				97
+#define SDM845_SLAVE_UFS_CARD_CFG			98
+#define SDM845_SLAVE_UFS_MEM_CFG			99
+#define SDM845_SLAVE_USB3_0				100
+#define SDM845_SLAVE_USB3_1				101
+#define SDM845_SLAVE_VENUS_CFG				102
+#define SDM845_SLAVE_VSENSE_CTRL_CFG			103
+#define SDM845_SLAVE_CNOC_A2NOC				104
+#define SDM845_SLAVE_SERVICE_CNOC			105
+#define SDM845_SLAVE_LLCC_CFG				106
+#define SDM845_SLAVE_MEM_NOC_CFG			107
+#define SDM845_SLAVE_GNOC_SNOC				108
+#define SDM845_SLAVE_GNOC_MEM_NOC			109
+#define SDM845_SLAVE_SERVICE_GNOC			110
+#define SDM845_SLAVE_EBI1				111
+#define SDM845_SLAVE_MSS_PROC_MS_MPU_CFG		112
+#define SDM845_SLAVE_MEM_NOC_GNOC			113
+#define SDM845_SLAVE_LLCC				114
+#define SDM845_SLAVE_MEM_NOC_SNOC			115
+#define SDM845_SLAVE_SERVICE_MEM_NOC			116
+#define SDM845_SLAVE_MNOC_SF_MEM_NOC			117
+#define SDM845_SLAVE_MNOC_HF_MEM_NOC			118
+#define SDM845_SLAVE_SERVICE_MNOC			119
+#define SDM845_SLAVE_APPSS				120
+#define SDM845_SLAVE_SNOC_CNOC				121
+#define SDM845_SLAVE_SNOC_MEM_NOC_GC			122
+#define SDM845_SLAVE_SNOC_MEM_NOC_SF			123
+#define SDM845_SLAVE_IMEM				124
+#define SDM845_SLAVE_PCIE_0				125
+#define SDM845_SLAVE_PCIE_1				126
+#define SDM845_SLAVE_PIMEM				127
+#define SDM845_SLAVE_SERVICE_SNOC			128
+#define SDM845_SLAVE_QDSS_STM				129
+#define SDM845_SLAVE_TCU				130
+
+#endif /* __DRIVERS_INTERCONNECT_QCOM_SDM845_H__ */
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
