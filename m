Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BDDFB65B92E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jan 2023 02:59:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236652AbjACB7B (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Jan 2023 20:59:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236625AbjACB67 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Jan 2023 20:58:59 -0500
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com [IPv6:2607:f8b0:4864:20::d2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F654127;
        Mon,  2 Jan 2023 17:58:57 -0800 (PST)
Received: by mail-io1-xd2e.google.com with SMTP id y4so16053059iof.0;
        Mon, 02 Jan 2023 17:58:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pmgbv1qeU2nJRlES0PEbbEpQZ4B2ae15VmocpV/SAfI=;
        b=LmTgRVTKZolSE+an4IhTxsS7IbuXCFGmpcT+Rb6fxZx57jfZPl4IvS6oVMxFRfkjRt
         F1GDwmWvNfN1Foys5uyqS+Wb+yFJG0Z0v5ohXqxAxcV/P5XVom+dktOq1d3aHM1z4IEz
         C2SsGicwWSlv1zASY95js7iiT+bbtkvtJoRQvzuRKvMtMHlwvtQKlEfeZD1kC1zLU5kq
         elc86m4vwzn57QpAjrtxNbFGPChFKKNQy9UAjdueS56oX/Bx53ulanqPBHU+HotSdrxE
         e5ktLja/FqVZDr9YVj3lUA4KXD6Em+dFizOOTyiQIhbUi58cKWnd262o3gzqz/USshQ+
         fu+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pmgbv1qeU2nJRlES0PEbbEpQZ4B2ae15VmocpV/SAfI=;
        b=F2dZ/hnL2nZNlkZkinO1NGwEIce8RQtp7JIYo+7Br7qZOpBRWnvfJxiJQ0afLKEJk3
         E9UYsOfMlAeJqgJJy6oSl4fldf7B0IKKHRtIknAsDi41LFEoSmo1UBKPHNV7PxgqRQyi
         8hNfelYe5+I/1gJL+8fsAmIrL2mjyp19ITrJdwe4BIeRH5So4RbszZiJnLUjB8So5dtV
         kL1pHL1fQS8TFvFQ+eml1gMJ+UOK0OnNiVo7IOfYU5OJ5zzo2JVqpmC5b6zJrWWLQ0km
         tiH9JfjMOzRbxArDVGvgtpOA4rGM1xQxCswUA2j0voPDV5RvQj2Xsk2YMABHBoEqh4wm
         yKvg==
X-Gm-Message-State: AFqh2kroLBnCZoe2nnOG8Kvx7ypdDbgC0mAKI3zVunO+RsXbsx4Rz4Op
        IAL84kmlkMQhBfptXjJNzV2O/JsGzsFTCg==
X-Google-Smtp-Source: AMrXdXt13qpQhwo43OHSq5zM0/hMnOEtEWjeFAfskD0JdM1684KVnOgdDfJR5pWIjE/OL3zpcEuPHg==
X-Received: by 2002:a6b:8b44:0:b0:6ca:d145:9e with SMTP id n65-20020a6b8b44000000b006cad145009emr32531664iod.14.1672711136745;
        Mon, 02 Jan 2023 17:58:56 -0800 (PST)
Received: from localhost ([2607:fea8:a2df:3d00::d097])
        by smtp.gmail.com with ESMTPSA id c7-20020a023307000000b0038a6ae38ceasm9897122jae.26.2023.01.02.17.58.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jan 2023 17:58:56 -0800 (PST)
From:   Richard Acayan <mailingradian@gmail.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     Odelu Kukatla <quic_okukatla@quicinc.com>,
        Luca Weiss <luca@z3ntu.xyz>,
        Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v3 2/4] interconnect: qcom: add sdm670 interconnects
Date:   Mon,  2 Jan 2023 20:58:43 -0500
Message-Id: <20230103015845.314551-3-mailingradian@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230103015845.314551-1-mailingradian@gmail.com>
References: <20230103015845.314551-1-mailingradian@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The interconnects for Snapdragon 670 can be controlled via RPMh. Add
driver support for this.

This driver was generated by the linux-interconnect-driver-generator and
the virtual NoC's were merged with their parents.

Link: https://git.sr.ht/~z3ntu/linux-interconnect-driver-generator
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 drivers/interconnect/qcom/Kconfig  |   9 +
 drivers/interconnect/qcom/Makefile |   2 +
 drivers/interconnect/qcom/sdm670.c | 440 +++++++++++++++++++++++++++++
 drivers/interconnect/qcom/sdm670.h | 128 +++++++++
 4 files changed, 579 insertions(+)
 create mode 100644 drivers/interconnect/qcom/sdm670.c
 create mode 100644 drivers/interconnect/qcom/sdm670.h

diff --git a/drivers/interconnect/qcom/Kconfig b/drivers/interconnect/qcom/Kconfig
index 1a1c941635a2..795b94b90c1a 100644
--- a/drivers/interconnect/qcom/Kconfig
+++ b/drivers/interconnect/qcom/Kconfig
@@ -128,6 +128,15 @@ config INTERCONNECT_QCOM_SDM660
 	  This is a driver for the Qualcomm Network-on-Chip on sdm660-based
 	  platforms.
 
+config INTERCONNECT_QCOM_SDM670
+	tristate "Qualcomm SDM670 interconnect driver"
+	depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
+	select INTERCONNECT_QCOM_RPMH
+	select INTERCONNECT_QCOM_BCM_VOTER
+	help
+	  This is a driver for the Qualcomm Network-on-Chip on sdm670-based
+	  platforms.
+
 config INTERCONNECT_QCOM_SDM845
 	tristate "Qualcomm SDM845 interconnect driver"
 	depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
diff --git a/drivers/interconnect/qcom/Makefile b/drivers/interconnect/qcom/Makefile
index 8e357528185d..d70dcd35a545 100644
--- a/drivers/interconnect/qcom/Makefile
+++ b/drivers/interconnect/qcom/Makefile
@@ -17,6 +17,7 @@ qnoc-sc7280-objs                        := sc7280.o
 qnoc-sc8180x-objs			:= sc8180x.o
 qnoc-sc8280xp-objs			:= sc8280xp.o
 qnoc-sdm660-objs			:= sdm660.o
+qnoc-sdm670-objs			:= sdm670.o
 qnoc-sdm845-objs			:= sdm845.o
 qnoc-sdx55-objs				:= sdx55.o
 qnoc-sdx65-objs				:= sdx65.o
@@ -41,6 +42,7 @@ obj-$(CONFIG_INTERCONNECT_QCOM_SC7280) += qnoc-sc7280.o
 obj-$(CONFIG_INTERCONNECT_QCOM_SC8180X) += qnoc-sc8180x.o
 obj-$(CONFIG_INTERCONNECT_QCOM_SC8280XP) += qnoc-sc8280xp.o
 obj-$(CONFIG_INTERCONNECT_QCOM_SDM660) += qnoc-sdm660.o
+obj-$(CONFIG_INTERCONNECT_QCOM_SDM670) += qnoc-sdm670.o
 obj-$(CONFIG_INTERCONNECT_QCOM_SDM845) += qnoc-sdm845.o
 obj-$(CONFIG_INTERCONNECT_QCOM_SDX55) += qnoc-sdx55.o
 obj-$(CONFIG_INTERCONNECT_QCOM_SDX65) += qnoc-sdx65.o
diff --git a/drivers/interconnect/qcom/sdm670.c b/drivers/interconnect/qcom/sdm670.c
new file mode 100644
index 000000000000..bda955035518
--- /dev/null
+++ b/drivers/interconnect/qcom/sdm670.c
@@ -0,0 +1,440 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2022, The Linux Foundation. All rights reserved.
+ */
+
+#include <linux/device.h>
+#include <linux/interconnect.h>
+#include <linux/interconnect-provider.h>
+#include <linux/module.h>
+#include <linux/of_platform.h>
+#include <dt-bindings/interconnect/qcom,sdm670-rpmh.h>
+
+#include "bcm-voter.h"
+#include "icc-rpmh.h"
+#include "sdm670.h"
+
+DEFINE_QNODE(qhm_a1noc_cfg, SDM670_MASTER_A1NOC_CFG, 1, 4, SDM670_SLAVE_SERVICE_A1NOC);
+DEFINE_QNODE(qhm_qup1, SDM670_MASTER_BLSP_1, 1, 4, SDM670_SLAVE_A1NOC_SNOC);
+DEFINE_QNODE(qhm_tsif, SDM670_MASTER_TSIF, 1, 4, SDM670_SLAVE_A1NOC_SNOC);
+DEFINE_QNODE(xm_emmc, SDM670_MASTER_EMMC, 1, 8, SDM670_SLAVE_A1NOC_SNOC);
+DEFINE_QNODE(xm_sdc2, SDM670_MASTER_SDCC_2, 1, 8, SDM670_SLAVE_A1NOC_SNOC);
+DEFINE_QNODE(xm_sdc4, SDM670_MASTER_SDCC_4, 1, 8, SDM670_SLAVE_A1NOC_SNOC);
+DEFINE_QNODE(xm_ufs_mem, SDM670_MASTER_UFS_MEM, 1, 8, SDM670_SLAVE_A1NOC_SNOC);
+DEFINE_QNODE(qhm_a2noc_cfg, SDM670_MASTER_A2NOC_CFG, 1, 4, SDM670_SLAVE_SERVICE_A2NOC);
+DEFINE_QNODE(qhm_qdss_bam, SDM670_MASTER_QDSS_BAM, 1, 4, SDM670_SLAVE_A2NOC_SNOC);
+DEFINE_QNODE(qhm_qup2, SDM670_MASTER_BLSP_2, 1, 4, SDM670_SLAVE_A2NOC_SNOC);
+DEFINE_QNODE(qnm_cnoc, SDM670_MASTER_CNOC_A2NOC, 1, 8, SDM670_SLAVE_A2NOC_SNOC);
+DEFINE_QNODE(qxm_crypto, SDM670_MASTER_CRYPTO_CORE_0, 1, 8, SDM670_SLAVE_A2NOC_SNOC);
+DEFINE_QNODE(qxm_ipa, SDM670_MASTER_IPA, 1, 8, SDM670_SLAVE_A2NOC_SNOC);
+DEFINE_QNODE(xm_qdss_etr, SDM670_MASTER_QDSS_ETR, 1, 8, SDM670_SLAVE_A2NOC_SNOC);
+DEFINE_QNODE(xm_usb3_0, SDM670_MASTER_USB3, 1, 8, SDM670_SLAVE_A2NOC_SNOC);
+DEFINE_QNODE(qxm_camnoc_hf0_uncomp, SDM670_MASTER_CAMNOC_HF0_UNCOMP, 1, 32, SDM670_SLAVE_CAMNOC_UNCOMP);
+DEFINE_QNODE(qxm_camnoc_hf1_uncomp, SDM670_MASTER_CAMNOC_HF1_UNCOMP, 1, 32, SDM670_SLAVE_CAMNOC_UNCOMP);
+DEFINE_QNODE(qxm_camnoc_sf_uncomp, SDM670_MASTER_CAMNOC_SF_UNCOMP, 1, 32, SDM670_SLAVE_CAMNOC_UNCOMP);
+DEFINE_QNODE(qhm_spdm, SDM670_MASTER_SPDM, 1, 4, SDM670_SLAVE_CNOC_A2NOC);
+DEFINE_QNODE(qnm_snoc, SDM670_MASTER_SNOC_CNOC, 1, 8, SDM670_SLAVE_TLMM_SOUTH, SDM670_SLAVE_CAMERA_CFG, SDM670_SLAVE_SDCC_4, SDM670_SLAVE_SDCC_2, SDM670_SLAVE_CNOC_MNOC_CFG, SDM670_SLAVE_UFS_MEM_CFG, SDM670_SLAVE_GLM, SDM670_SLAVE_PDM, SDM670_SLAVE_A2NOC_CFG, SDM670_SLAVE_QDSS_CFG, SDM670_SLAVE_DISPLAY_CFG, SDM670_SLAVE_TCSR, SDM670_SLAVE_DCC_CFG, SDM670_SLAVE_CNOC_DDRSS, SDM670_SLAVE_SNOC_CFG, SDM670_SLAVE_SOUTH_PHY_CFG, SDM670_SLAVE_GRAPHICS_3D_CFG, SDM670_SLAVE_VENUS_CFG, SDM670_SLAVE_TSIF, SDM670_SLAVE_CDSP_CFG, SDM670_SLAVE_AOP, SDM670_SLAVE_BLSP_2, SDM670_SLAVE_SERVICE_CNOC, SDM670_SLAVE_USB3, SDM670_SLAVE_IPA_CFG, SDM670_SLAVE_RBCPR_CX_CFG, SDM670_SLAVE_A1NOC_CFG, SDM670_SLAVE_AOSS, SDM670_SLAVE_PRNG, SDM670_SLAVE_VSENSE_CTRL_CFG, SDM670_SLAVE_EMMC_CFG, SDM670_SLAVE_BLSP_1, SDM670_SLAVE_SPDM_WRAPPER, SDM670_SLAVE_CRYPTO_0_CFG, SDM670_SLAVE_PIMEM_CFG, SDM670_SLAVE_TLMM_NORTH, SDM670_SLAVE_CLK_CTL, SDM670_SLAVE_IMEM_CFG);
+DEFINE_QNODE(qhm_cnoc, SDM670_MASTER_CNOC_DC_NOC, 1, 4, SDM670_SLAVE_MEM_NOC_CFG, SDM670_SLAVE_LLCC_CFG);
+DEFINE_QNODE(acm_l3, SDM670_MASTER_AMPSS_M0, 1, 16, SDM670_SLAVE_SERVICE_GNOC, SDM670_SLAVE_GNOC_SNOC, SDM670_SLAVE_GNOC_MEM_NOC);
+DEFINE_QNODE(pm_gnoc_cfg, SDM670_MASTER_GNOC_CFG, 1, 4, SDM670_SLAVE_SERVICE_GNOC);
+DEFINE_QNODE(llcc_mc, SDM670_MASTER_LLCC, 2, 4, SDM670_SLAVE_EBI_CH0);
+DEFINE_QNODE(acm_tcu, SDM670_MASTER_TCU_0, 1, 8, SDM670_SLAVE_MEM_NOC_GNOC, SDM670_SLAVE_LLCC, SDM670_SLAVE_MEM_NOC_SNOC);
+DEFINE_QNODE(qhm_memnoc_cfg, SDM670_MASTER_MEM_NOC_CFG, 1, 4, SDM670_SLAVE_SERVICE_MEM_NOC, SDM670_SLAVE_MSS_PROC_MS_MPU_CFG);
+DEFINE_QNODE(qnm_apps, SDM670_MASTER_GNOC_MEM_NOC, 2, 32, SDM670_SLAVE_LLCC);
+DEFINE_QNODE(qnm_mnoc_hf, SDM670_MASTER_MNOC_HF_MEM_NOC, 2, 32, SDM670_SLAVE_LLCC);
+DEFINE_QNODE(qnm_mnoc_sf, SDM670_MASTER_MNOC_SF_MEM_NOC, 1, 32, SDM670_SLAVE_MEM_NOC_GNOC, SDM670_SLAVE_LLCC, SDM670_SLAVE_MEM_NOC_SNOC);
+DEFINE_QNODE(qnm_snoc_gc, SDM670_MASTER_SNOC_GC_MEM_NOC, 1, 8, SDM670_SLAVE_LLCC);
+DEFINE_QNODE(qnm_snoc_sf, SDM670_MASTER_SNOC_SF_MEM_NOC, 1, 16, SDM670_SLAVE_MEM_NOC_GNOC, SDM670_SLAVE_LLCC);
+DEFINE_QNODE(qxm_gpu, SDM670_MASTER_GRAPHICS_3D, 2, 32, SDM670_SLAVE_MEM_NOC_GNOC, SDM670_SLAVE_LLCC, SDM670_SLAVE_MEM_NOC_SNOC);
+DEFINE_QNODE(qhm_mnoc_cfg, SDM670_MASTER_CNOC_MNOC_CFG, 1, 4, SDM670_SLAVE_SERVICE_MNOC);
+DEFINE_QNODE(qxm_camnoc_hf0, SDM670_MASTER_CAMNOC_HF0, 1, 32, SDM670_SLAVE_MNOC_HF_MEM_NOC);
+DEFINE_QNODE(qxm_camnoc_hf1, SDM670_MASTER_CAMNOC_HF1, 1, 32, SDM670_SLAVE_MNOC_HF_MEM_NOC);
+DEFINE_QNODE(qxm_camnoc_sf, SDM670_MASTER_CAMNOC_SF, 1, 32, SDM670_SLAVE_MNOC_SF_MEM_NOC);
+DEFINE_QNODE(qxm_mdp0, SDM670_MASTER_MDP_PORT0, 1, 32, SDM670_SLAVE_MNOC_HF_MEM_NOC);
+DEFINE_QNODE(qxm_mdp1, SDM670_MASTER_MDP_PORT1, 1, 32, SDM670_SLAVE_MNOC_HF_MEM_NOC);
+DEFINE_QNODE(qxm_rot, SDM670_MASTER_ROTATOR, 1, 32, SDM670_SLAVE_MNOC_SF_MEM_NOC);
+DEFINE_QNODE(qxm_venus0, SDM670_MASTER_VIDEO_P0, 1, 32, SDM670_SLAVE_MNOC_SF_MEM_NOC);
+DEFINE_QNODE(qxm_venus1, SDM670_MASTER_VIDEO_P1, 1, 32, SDM670_SLAVE_MNOC_SF_MEM_NOC);
+DEFINE_QNODE(qxm_venus_arm9, SDM670_MASTER_VIDEO_PROC, 1, 8, SDM670_SLAVE_MNOC_SF_MEM_NOC);
+DEFINE_QNODE(qhm_snoc_cfg, SDM670_MASTER_SNOC_CFG, 1, 4, SDM670_SLAVE_SERVICE_SNOC);
+DEFINE_QNODE(qnm_aggre1_noc, SDM670_MASTER_A1NOC_SNOC, 1, 16, SDM670_SLAVE_PIMEM, SDM670_SLAVE_SNOC_MEM_NOC_SF, SDM670_SLAVE_OCIMEM, SDM670_SLAVE_APPSS, SDM670_SLAVE_SNOC_CNOC, SDM670_SLAVE_QDSS_STM);
+DEFINE_QNODE(qnm_aggre2_noc, SDM670_MASTER_A2NOC_SNOC, 1, 16, SDM670_SLAVE_PIMEM, SDM670_SLAVE_SNOC_MEM_NOC_SF, SDM670_SLAVE_OCIMEM, SDM670_SLAVE_APPSS, SDM670_SLAVE_SNOC_CNOC, SDM670_SLAVE_TCU, SDM670_SLAVE_QDSS_STM);
+DEFINE_QNODE(qnm_gladiator_sodv, SDM670_MASTER_GNOC_SNOC, 1, 8, SDM670_SLAVE_PIMEM, SDM670_SLAVE_OCIMEM, SDM670_SLAVE_APPSS, SDM670_SLAVE_SNOC_CNOC, SDM670_SLAVE_TCU, SDM670_SLAVE_QDSS_STM);
+DEFINE_QNODE(qnm_memnoc, SDM670_MASTER_MEM_NOC_SNOC, 1, 8, SDM670_SLAVE_OCIMEM, SDM670_SLAVE_APPSS, SDM670_SLAVE_PIMEM, SDM670_SLAVE_SNOC_CNOC, SDM670_SLAVE_QDSS_STM);
+DEFINE_QNODE(qxm_pimem, SDM670_MASTER_PIMEM, 1, 8, SDM670_SLAVE_OCIMEM, SDM670_SLAVE_SNOC_MEM_NOC_GC);
+DEFINE_QNODE(xm_gic, SDM670_MASTER_GIC, 1, 8, SDM670_SLAVE_OCIMEM, SDM670_SLAVE_SNOC_MEM_NOC_GC);
+DEFINE_QNODE(qns_a1noc_snoc, SDM670_SLAVE_A1NOC_SNOC, 1, 16, SDM670_MASTER_A1NOC_SNOC);
+DEFINE_QNODE(srvc_aggre1_noc, SDM670_SLAVE_SERVICE_A1NOC, 1, 4);
+DEFINE_QNODE(qns_a2noc_snoc, SDM670_SLAVE_A2NOC_SNOC, 1, 16, SDM670_MASTER_A2NOC_SNOC);
+DEFINE_QNODE(srvc_aggre2_noc, SDM670_SLAVE_SERVICE_A2NOC, 1, 4);
+DEFINE_QNODE(qns_camnoc_uncomp, SDM670_SLAVE_CAMNOC_UNCOMP, 1, 32);
+DEFINE_QNODE(qhs_a1_noc_cfg, SDM670_SLAVE_A1NOC_CFG, 1, 4, SDM670_MASTER_A1NOC_CFG);
+DEFINE_QNODE(qhs_a2_noc_cfg, SDM670_SLAVE_A2NOC_CFG, 1, 4, SDM670_MASTER_A2NOC_CFG);
+DEFINE_QNODE(qhs_aop, SDM670_SLAVE_AOP, 1, 4);
+DEFINE_QNODE(qhs_aoss, SDM670_SLAVE_AOSS, 1, 4);
+DEFINE_QNODE(qhs_camera_cfg, SDM670_SLAVE_CAMERA_CFG, 1, 4);
+DEFINE_QNODE(qhs_clk_ctl, SDM670_SLAVE_CLK_CTL, 1, 4);
+DEFINE_QNODE(qhs_compute_dsp_cfg, SDM670_SLAVE_CDSP_CFG, 1, 4);
+DEFINE_QNODE(qhs_cpr_cx, SDM670_SLAVE_RBCPR_CX_CFG, 1, 4);
+DEFINE_QNODE(qhs_crypto0_cfg, SDM670_SLAVE_CRYPTO_0_CFG, 1, 4);
+DEFINE_QNODE(qhs_dcc_cfg, SDM670_SLAVE_DCC_CFG, 1, 4, SDM670_MASTER_CNOC_DC_NOC);
+DEFINE_QNODE(qhs_ddrss_cfg, SDM670_SLAVE_CNOC_DDRSS, 1, 4);
+DEFINE_QNODE(qhs_display_cfg, SDM670_SLAVE_DISPLAY_CFG, 1, 4);
+DEFINE_QNODE(qhs_emmc_cfg, SDM670_SLAVE_EMMC_CFG, 1, 4);
+DEFINE_QNODE(qhs_glm, SDM670_SLAVE_GLM, 1, 4);
+DEFINE_QNODE(qhs_gpuss_cfg, SDM670_SLAVE_GRAPHICS_3D_CFG, 1, 8);
+DEFINE_QNODE(qhs_imem_cfg, SDM670_SLAVE_IMEM_CFG, 1, 4);
+DEFINE_QNODE(qhs_ipa, SDM670_SLAVE_IPA_CFG, 1, 4);
+DEFINE_QNODE(qhs_mnoc_cfg, SDM670_SLAVE_CNOC_MNOC_CFG, 1, 4, SDM670_MASTER_CNOC_MNOC_CFG);
+DEFINE_QNODE(qhs_pdm, SDM670_SLAVE_PDM, 1, 4);
+DEFINE_QNODE(qhs_phy_refgen_south, SDM670_SLAVE_SOUTH_PHY_CFG, 1, 4);
+DEFINE_QNODE(qhs_pimem_cfg, SDM670_SLAVE_PIMEM_CFG, 1, 4);
+DEFINE_QNODE(qhs_prng, SDM670_SLAVE_PRNG, 1, 4);
+DEFINE_QNODE(qhs_qdss_cfg, SDM670_SLAVE_QDSS_CFG, 1, 4);
+DEFINE_QNODE(qhs_qupv3_north, SDM670_SLAVE_BLSP_2, 1, 4);
+DEFINE_QNODE(qhs_qupv3_south, SDM670_SLAVE_BLSP_1, 1, 4);
+DEFINE_QNODE(qhs_sdc2, SDM670_SLAVE_SDCC_2, 1, 4);
+DEFINE_QNODE(qhs_sdc4, SDM670_SLAVE_SDCC_4, 1, 4);
+DEFINE_QNODE(qhs_snoc_cfg, SDM670_SLAVE_SNOC_CFG, 1, 4, SDM670_MASTER_SNOC_CFG);
+DEFINE_QNODE(qhs_spdm, SDM670_SLAVE_SPDM_WRAPPER, 1, 4);
+DEFINE_QNODE(qhs_tcsr, SDM670_SLAVE_TCSR, 1, 4);
+DEFINE_QNODE(qhs_tlmm_north, SDM670_SLAVE_TLMM_NORTH, 1, 4);
+DEFINE_QNODE(qhs_tlmm_south, SDM670_SLAVE_TLMM_SOUTH, 1, 4);
+DEFINE_QNODE(qhs_tsif, SDM670_SLAVE_TSIF, 1, 4);
+DEFINE_QNODE(qhs_ufs_mem_cfg, SDM670_SLAVE_UFS_MEM_CFG, 1, 4);
+DEFINE_QNODE(qhs_usb3_0, SDM670_SLAVE_USB3, 1, 4);
+DEFINE_QNODE(qhs_venus_cfg, SDM670_SLAVE_VENUS_CFG, 1, 4);
+DEFINE_QNODE(qhs_vsense_ctrl_cfg, SDM670_SLAVE_VSENSE_CTRL_CFG, 1, 4);
+DEFINE_QNODE(qns_cnoc_a2noc, SDM670_SLAVE_CNOC_A2NOC, 1, 8, SDM670_MASTER_CNOC_A2NOC);
+DEFINE_QNODE(srvc_cnoc, SDM670_SLAVE_SERVICE_CNOC, 1, 4);
+DEFINE_QNODE(qhs_llcc, SDM670_SLAVE_LLCC_CFG, 1, 4);
+DEFINE_QNODE(qhs_memnoc, SDM670_SLAVE_MEM_NOC_CFG, 1, 4, SDM670_MASTER_MEM_NOC_CFG);
+DEFINE_QNODE(qns_gladiator_sodv, SDM670_SLAVE_GNOC_SNOC, 1, 8, SDM670_MASTER_GNOC_SNOC);
+DEFINE_QNODE(qns_gnoc_memnoc, SDM670_SLAVE_GNOC_MEM_NOC, 2, 32, SDM670_MASTER_GNOC_MEM_NOC);
+DEFINE_QNODE(srvc_gnoc, SDM670_SLAVE_SERVICE_GNOC, 1, 4);
+DEFINE_QNODE(ebi, SDM670_SLAVE_EBI_CH0, 2, 4);
+DEFINE_QNODE(qhs_mdsp_ms_mpu_cfg, SDM670_SLAVE_MSS_PROC_MS_MPU_CFG, 1, 4);
+DEFINE_QNODE(qns_apps_io, SDM670_SLAVE_MEM_NOC_GNOC, 1, 32);
+DEFINE_QNODE(qns_llcc, SDM670_SLAVE_LLCC, 2, 16, SDM670_MASTER_LLCC);
+DEFINE_QNODE(qns_memnoc_snoc, SDM670_SLAVE_MEM_NOC_SNOC, 1, 8, SDM670_MASTER_MEM_NOC_SNOC);
+DEFINE_QNODE(srvc_memnoc, SDM670_SLAVE_SERVICE_MEM_NOC, 1, 4);
+DEFINE_QNODE(qns2_mem_noc, SDM670_SLAVE_MNOC_SF_MEM_NOC, 1, 32, SDM670_MASTER_MNOC_SF_MEM_NOC);
+DEFINE_QNODE(qns_mem_noc_hf, SDM670_SLAVE_MNOC_HF_MEM_NOC, 2, 32, SDM670_MASTER_MNOC_HF_MEM_NOC);
+DEFINE_QNODE(srvc_mnoc, SDM670_SLAVE_SERVICE_MNOC, 1, 4);
+DEFINE_QNODE(qhs_apss, SDM670_SLAVE_APPSS, 1, 8);
+DEFINE_QNODE(qns_cnoc, SDM670_SLAVE_SNOC_CNOC, 1, 8, SDM670_MASTER_SNOC_CNOC);
+DEFINE_QNODE(qns_memnoc_gc, SDM670_SLAVE_SNOC_MEM_NOC_GC, 1, 8, SDM670_MASTER_SNOC_GC_MEM_NOC);
+DEFINE_QNODE(qns_memnoc_sf, SDM670_SLAVE_SNOC_MEM_NOC_SF, 1, 16, SDM670_MASTER_SNOC_SF_MEM_NOC);
+DEFINE_QNODE(qxs_imem, SDM670_SLAVE_OCIMEM, 1, 8);
+DEFINE_QNODE(qxs_pimem, SDM670_SLAVE_PIMEM, 1, 8);
+DEFINE_QNODE(srvc_snoc, SDM670_SLAVE_SERVICE_SNOC, 1, 4);
+DEFINE_QNODE(xs_qdss_stm, SDM670_SLAVE_QDSS_STM, 1, 4);
+DEFINE_QNODE(xs_sys_tcu_cfg, SDM670_SLAVE_TCU, 1, 8);
+
+DEFINE_QBCM(bcm_acv, "ACV", false, &ebi);
+DEFINE_QBCM(bcm_mc0, "MC0", true, &ebi);
+DEFINE_QBCM(bcm_sh0, "SH0", true, &qns_llcc);
+DEFINE_QBCM(bcm_mm0, "MM0", true, &qns_mem_noc_hf);
+DEFINE_QBCM(bcm_sh1, "SH1", false, &qns_apps_io);
+DEFINE_QBCM(bcm_mm1, "MM1", true, &qxm_camnoc_hf0_uncomp, &qxm_camnoc_hf1_uncomp, &qxm_camnoc_sf_uncomp, &qxm_camnoc_hf0, &qxm_camnoc_hf1, &qxm_mdp0, &qxm_mdp1);
+DEFINE_QBCM(bcm_sh2, "SH2", false, &qns_memnoc_snoc);
+DEFINE_QBCM(bcm_mm2, "MM2", false, &qns2_mem_noc);
+DEFINE_QBCM(bcm_sh3, "SH3", false, &acm_tcu);
+DEFINE_QBCM(bcm_mm3, "MM3", false, &qxm_camnoc_sf, &qxm_rot, &qxm_venus0, &qxm_venus1, &qxm_venus_arm9);
+DEFINE_QBCM(bcm_sh5, "SH5", false, &qnm_apps);
+DEFINE_QBCM(bcm_sn0, "SN0", true, &qns_memnoc_sf);
+DEFINE_QBCM(bcm_ce0, "CE0", false, &qxm_crypto);
+DEFINE_QBCM(bcm_cn0, "CN0", true, &qhm_spdm, &qnm_snoc, &qhs_a1_noc_cfg, &qhs_a2_noc_cfg, &qhs_aop, &qhs_aoss, &qhs_camera_cfg, &qhs_clk_ctl, &qhs_compute_dsp_cfg, &qhs_cpr_cx, &qhs_crypto0_cfg, &qhs_dcc_cfg, &qhs_ddrss_cfg, &qhs_display_cfg, &qhs_emmc_cfg, &qhs_glm, &qhs_gpuss_cfg, &qhs_imem_cfg, &qhs_ipa, &qhs_mnoc_cfg, &qhs_pdm, &qhs_phy_refgen_south, &qhs_pimem_cfg, &qhs_prng, &qhs_qdss_cfg, &qhs_qupv3_north, &qhs_qupv3_south, &qhs_sdc2, &qhs_sdc4, &qhs_snoc_cfg, &qhs_spdm, &qhs_tcsr, &qhs_tlmm_north, &qhs_tlmm_south, &qhs_tsif, &qhs_ufs_mem_cfg, &qhs_usb3_0, &qhs_venus_cfg, &qhs_vsense_ctrl_cfg, &qns_cnoc_a2noc, &srvc_cnoc);
+DEFINE_QBCM(bcm_qup0, "QUP0", false, &qhm_qup1, &qhm_qup2);
+DEFINE_QBCM(bcm_sn1, "SN1", false, &qxs_imem);
+DEFINE_QBCM(bcm_sn2, "SN2", false, &qns_memnoc_gc);
+DEFINE_QBCM(bcm_sn3, "SN3", false, &qns_cnoc);
+DEFINE_QBCM(bcm_sn4, "SN4", false, &qxm_pimem, &qxs_pimem);
+DEFINE_QBCM(bcm_sn5, "SN5", false, &xs_qdss_stm);
+DEFINE_QBCM(bcm_sn8, "SN8", false, &qnm_aggre1_noc, &srvc_aggre1_noc);
+DEFINE_QBCM(bcm_sn10, "SN10", false, &qnm_aggre2_noc, &srvc_aggre2_noc);
+DEFINE_QBCM(bcm_sn11, "SN11", false, &qnm_gladiator_sodv, &xm_gic);
+DEFINE_QBCM(bcm_sn13, "SN13", false, &qnm_memnoc);
+
+static struct qcom_icc_bcm * const aggre1_noc_bcms[] = {
+	&bcm_qup0,
+	&bcm_sn8,
+};
+
+static struct qcom_icc_node * const aggre1_noc_nodes[] = {
+	[MASTER_A1NOC_CFG] = &qhm_a1noc_cfg,
+	[MASTER_BLSP_1] = &qhm_qup1,
+	[MASTER_TSIF] = &qhm_tsif,
+	[MASTER_EMMC] = &xm_emmc,
+	[MASTER_SDCC_2] = &xm_sdc2,
+	[MASTER_SDCC_4] = &xm_sdc4,
+	[MASTER_UFS_MEM] = &xm_ufs_mem,
+	[SLAVE_A1NOC_SNOC] = &qns_a1noc_snoc,
+	[SLAVE_SERVICE_A1NOC] = &srvc_aggre1_noc,
+};
+
+static const struct qcom_icc_desc sdm670_aggre1_noc = {
+	.nodes = aggre1_noc_nodes,
+	.num_nodes = ARRAY_SIZE(aggre1_noc_nodes),
+	.bcms = aggre1_noc_bcms,
+	.num_bcms = ARRAY_SIZE(aggre1_noc_bcms),
+};
+
+static struct qcom_icc_bcm * const aggre2_noc_bcms[] = {
+	&bcm_ce0,
+	&bcm_qup0,
+	&bcm_sn10,
+};
+
+static struct qcom_icc_node * const aggre2_noc_nodes[] = {
+	[MASTER_A2NOC_CFG] = &qhm_a2noc_cfg,
+	[MASTER_QDSS_BAM] = &qhm_qdss_bam,
+	[MASTER_BLSP_2] = &qhm_qup2,
+	[MASTER_CNOC_A2NOC] = &qnm_cnoc,
+	[MASTER_CRYPTO_CORE_0] = &qxm_crypto,
+	[MASTER_IPA] = &qxm_ipa,
+	[MASTER_QDSS_ETR] = &xm_qdss_etr,
+	[MASTER_USB3] = &xm_usb3_0,
+	[SLAVE_A2NOC_SNOC] = &qns_a2noc_snoc,
+	[SLAVE_SERVICE_A2NOC] = &srvc_aggre2_noc,
+};
+
+static const struct qcom_icc_desc sdm670_aggre2_noc = {
+	.nodes = aggre2_noc_nodes,
+	.num_nodes = ARRAY_SIZE(aggre2_noc_nodes),
+	.bcms = aggre2_noc_bcms,
+	.num_bcms = ARRAY_SIZE(aggre2_noc_bcms),
+};
+
+static struct qcom_icc_bcm * const config_noc_bcms[] = {
+	&bcm_cn0,
+};
+
+static struct qcom_icc_node * const config_noc_nodes[] = {
+	[MASTER_SPDM] = &qhm_spdm,
+	[MASTER_SNOC_CNOC] = &qnm_snoc,
+	[SLAVE_A1NOC_CFG] = &qhs_a1_noc_cfg,
+	[SLAVE_A2NOC_CFG] = &qhs_a2_noc_cfg,
+	[SLAVE_AOP] = &qhs_aop,
+	[SLAVE_AOSS] = &qhs_aoss,
+	[SLAVE_CAMERA_CFG] = &qhs_camera_cfg,
+	[SLAVE_CLK_CTL] = &qhs_clk_ctl,
+	[SLAVE_CDSP_CFG] = &qhs_compute_dsp_cfg,
+	[SLAVE_RBCPR_CX_CFG] = &qhs_cpr_cx,
+	[SLAVE_CRYPTO_0_CFG] = &qhs_crypto0_cfg,
+	[SLAVE_DCC_CFG] = &qhs_dcc_cfg,
+	[SLAVE_CNOC_DDRSS] = &qhs_ddrss_cfg,
+	[SLAVE_DISPLAY_CFG] = &qhs_display_cfg,
+	[SLAVE_EMMC_CFG] = &qhs_emmc_cfg,
+	[SLAVE_GLM] = &qhs_glm,
+	[SLAVE_GRAPHICS_3D_CFG] = &qhs_gpuss_cfg,
+	[SLAVE_IMEM_CFG] = &qhs_imem_cfg,
+	[SLAVE_IPA_CFG] = &qhs_ipa,
+	[SLAVE_CNOC_MNOC_CFG] = &qhs_mnoc_cfg,
+	[SLAVE_PDM] = &qhs_pdm,
+	[SLAVE_SOUTH_PHY_CFG] = &qhs_phy_refgen_south,
+	[SLAVE_PIMEM_CFG] = &qhs_pimem_cfg,
+	[SLAVE_PRNG] = &qhs_prng,
+	[SLAVE_QDSS_CFG] = &qhs_qdss_cfg,
+	[SLAVE_BLSP_2] = &qhs_qupv3_north,
+	[SLAVE_BLSP_1] = &qhs_qupv3_south,
+	[SLAVE_SDCC_2] = &qhs_sdc2,
+	[SLAVE_SDCC_4] = &qhs_sdc4,
+	[SLAVE_SNOC_CFG] = &qhs_snoc_cfg,
+	[SLAVE_SPDM_WRAPPER] = &qhs_spdm,
+	[SLAVE_TCSR] = &qhs_tcsr,
+	[SLAVE_TLMM_NORTH] = &qhs_tlmm_north,
+	[SLAVE_TLMM_SOUTH] = &qhs_tlmm_south,
+	[SLAVE_TSIF] = &qhs_tsif,
+	[SLAVE_UFS_MEM_CFG] = &qhs_ufs_mem_cfg,
+	[SLAVE_USB3] = &qhs_usb3_0,
+	[SLAVE_VENUS_CFG] = &qhs_venus_cfg,
+	[SLAVE_VSENSE_CTRL_CFG] = &qhs_vsense_ctrl_cfg,
+	[SLAVE_CNOC_A2NOC] = &qns_cnoc_a2noc,
+	[SLAVE_SERVICE_CNOC] = &srvc_cnoc,
+};
+
+static const struct qcom_icc_desc sdm670_config_noc = {
+	.nodes = config_noc_nodes,
+	.num_nodes = ARRAY_SIZE(config_noc_nodes),
+	.bcms = config_noc_bcms,
+	.num_bcms = ARRAY_SIZE(config_noc_bcms),
+};
+
+static struct qcom_icc_bcm * const dc_noc_bcms[] = {
+};
+
+static struct qcom_icc_node * const dc_noc_nodes[] = {
+	[MASTER_CNOC_DC_NOC] = &qhm_cnoc,
+	[SLAVE_LLCC_CFG] = &qhs_llcc,
+	[SLAVE_MEM_NOC_CFG] = &qhs_memnoc,
+};
+
+static const struct qcom_icc_desc sdm670_dc_noc = {
+	.nodes = dc_noc_nodes,
+	.num_nodes = ARRAY_SIZE(dc_noc_nodes),
+	.bcms = dc_noc_bcms,
+	.num_bcms = ARRAY_SIZE(dc_noc_bcms),
+};
+
+static struct qcom_icc_bcm * const gladiator_noc_bcms[] = {
+};
+
+static struct qcom_icc_node * const gladiator_noc_nodes[] = {
+	[MASTER_AMPSS_M0] = &acm_l3,
+	[MASTER_GNOC_CFG] = &pm_gnoc_cfg,
+	[SLAVE_GNOC_SNOC] = &qns_gladiator_sodv,
+	[SLAVE_GNOC_MEM_NOC] = &qns_gnoc_memnoc,
+	[SLAVE_SERVICE_GNOC] = &srvc_gnoc,
+};
+
+static const struct qcom_icc_desc sdm670_gladiator_noc = {
+	.nodes = gladiator_noc_nodes,
+	.num_nodes = ARRAY_SIZE(gladiator_noc_nodes),
+	.bcms = gladiator_noc_bcms,
+	.num_bcms = ARRAY_SIZE(gladiator_noc_bcms),
+};
+
+static struct qcom_icc_bcm * const mem_noc_bcms[] = {
+	&bcm_acv,
+	&bcm_mc0,
+	&bcm_sh0,
+	&bcm_sh1,
+	&bcm_sh2,
+	&bcm_sh3,
+	&bcm_sh5,
+};
+
+static struct qcom_icc_node * const mem_noc_nodes[] = {
+	[MASTER_TCU_0] = &acm_tcu,
+	[MASTER_MEM_NOC_CFG] = &qhm_memnoc_cfg,
+	[MASTER_GNOC_MEM_NOC] = &qnm_apps,
+	[MASTER_MNOC_HF_MEM_NOC] = &qnm_mnoc_hf,
+	[MASTER_MNOC_SF_MEM_NOC] = &qnm_mnoc_sf,
+	[MASTER_SNOC_GC_MEM_NOC] = &qnm_snoc_gc,
+	[MASTER_SNOC_SF_MEM_NOC] = &qnm_snoc_sf,
+	[MASTER_GRAPHICS_3D] = &qxm_gpu,
+	[SLAVE_MSS_PROC_MS_MPU_CFG] = &qhs_mdsp_ms_mpu_cfg,
+	[SLAVE_MEM_NOC_GNOC] = &qns_apps_io,
+	[SLAVE_LLCC] = &qns_llcc,
+	[SLAVE_MEM_NOC_SNOC] = &qns_memnoc_snoc,
+	[SLAVE_SERVICE_MEM_NOC] = &srvc_memnoc,
+	[MASTER_LLCC] = &llcc_mc,
+	[SLAVE_EBI_CH0] = &ebi,
+};
+
+static const struct qcom_icc_desc sdm670_mem_noc = {
+	.nodes = mem_noc_nodes,
+	.num_nodes = ARRAY_SIZE(mem_noc_nodes),
+	.bcms = mem_noc_bcms,
+	.num_bcms = ARRAY_SIZE(mem_noc_bcms),
+};
+
+static struct qcom_icc_bcm * const mmss_noc_bcms[] = {
+	&bcm_mm0,
+	&bcm_mm1,
+	&bcm_mm2,
+	&bcm_mm3,
+};
+
+static struct qcom_icc_node * const mmss_noc_nodes[] = {
+	[MASTER_CNOC_MNOC_CFG] = &qhm_mnoc_cfg,
+	[MASTER_CAMNOC_HF0] = &qxm_camnoc_hf0,
+	[MASTER_CAMNOC_HF1] = &qxm_camnoc_hf1,
+	[MASTER_CAMNOC_SF] = &qxm_camnoc_sf,
+	[MASTER_MDP_PORT0] = &qxm_mdp0,
+	[MASTER_MDP_PORT1] = &qxm_mdp1,
+	[MASTER_ROTATOR] = &qxm_rot,
+	[MASTER_VIDEO_P0] = &qxm_venus0,
+	[MASTER_VIDEO_P1] = &qxm_venus1,
+	[MASTER_VIDEO_PROC] = &qxm_venus_arm9,
+	[SLAVE_MNOC_SF_MEM_NOC] = &qns2_mem_noc,
+	[SLAVE_MNOC_HF_MEM_NOC] = &qns_mem_noc_hf,
+	[SLAVE_SERVICE_MNOC] = &srvc_mnoc,
+};
+
+static const struct qcom_icc_desc sdm670_mmss_noc = {
+	.nodes = mmss_noc_nodes,
+	.num_nodes = ARRAY_SIZE(mmss_noc_nodes),
+	.bcms = mmss_noc_bcms,
+	.num_bcms = ARRAY_SIZE(mmss_noc_bcms),
+};
+
+static struct qcom_icc_bcm * const system_noc_bcms[] = {
+	&bcm_mm1,
+	&bcm_sn0,
+	&bcm_sn1,
+	&bcm_sn10,
+	&bcm_sn11,
+	&bcm_sn13,
+	&bcm_sn2,
+	&bcm_sn3,
+	&bcm_sn4,
+	&bcm_sn5,
+	&bcm_sn8,
+};
+
+static struct qcom_icc_node * const system_noc_nodes[] = {
+	[MASTER_SNOC_CFG] = &qhm_snoc_cfg,
+	[MASTER_A1NOC_SNOC] = &qnm_aggre1_noc,
+	[MASTER_A2NOC_SNOC] = &qnm_aggre2_noc,
+	[MASTER_GNOC_SNOC] = &qnm_gladiator_sodv,
+	[MASTER_MEM_NOC_SNOC] = &qnm_memnoc,
+	[MASTER_PIMEM] = &qxm_pimem,
+	[MASTER_GIC] = &xm_gic,
+	[SLAVE_APPSS] = &qhs_apss,
+	[SLAVE_SNOC_CNOC] = &qns_cnoc,
+	[SLAVE_SNOC_MEM_NOC_GC] = &qns_memnoc_gc,
+	[SLAVE_SNOC_MEM_NOC_SF] = &qns_memnoc_sf,
+	[SLAVE_OCIMEM] = &qxs_imem,
+	[SLAVE_PIMEM] = &qxs_pimem,
+	[SLAVE_SERVICE_SNOC] = &srvc_snoc,
+	[SLAVE_QDSS_STM] = &xs_qdss_stm,
+	[SLAVE_TCU] = &xs_sys_tcu_cfg,
+	[MASTER_CAMNOC_HF0_UNCOMP] = &qxm_camnoc_hf0_uncomp,
+	[MASTER_CAMNOC_HF1_UNCOMP] = &qxm_camnoc_hf1_uncomp,
+	[MASTER_CAMNOC_SF_UNCOMP] = &qxm_camnoc_sf_uncomp,
+	[SLAVE_CAMNOC_UNCOMP] = &qns_camnoc_uncomp,
+};
+
+static const struct qcom_icc_desc sdm670_system_noc = {
+	.nodes = system_noc_nodes,
+	.num_nodes = ARRAY_SIZE(system_noc_nodes),
+	.bcms = system_noc_bcms,
+	.num_bcms = ARRAY_SIZE(system_noc_bcms),
+};
+
+static const struct of_device_id qnoc_of_match[] = {
+	{ .compatible = "qcom,sdm670-aggre1-noc",
+	  .data = &sdm670_aggre1_noc},
+	{ .compatible = "qcom,sdm670-aggre2-noc",
+	  .data = &sdm670_aggre2_noc},
+	{ .compatible = "qcom,sdm670-config-noc",
+	  .data = &sdm670_config_noc},
+	{ .compatible = "qcom,sdm670-dc-noc",
+	  .data = &sdm670_dc_noc},
+	{ .compatible = "qcom,sdm670-gladiator-noc",
+	  .data = &sdm670_gladiator_noc},
+	{ .compatible = "qcom,sdm670-mem-noc",
+	  .data = &sdm670_mem_noc},
+	{ .compatible = "qcom,sdm670-mmss-noc",
+	  .data = &sdm670_mmss_noc},
+	{ .compatible = "qcom,sdm670-system-noc",
+	  .data = &sdm670_system_noc},
+	{ }
+};
+MODULE_DEVICE_TABLE(of, qnoc_of_match);
+
+static struct platform_driver qnoc_driver = {
+	.probe = qcom_icc_rpmh_probe,
+	.remove = qcom_icc_rpmh_remove,
+	.driver = {
+		.name = "qnoc-sdm670",
+		.of_match_table = qnoc_of_match,
+		.sync_state = icc_sync_state,
+	},
+};
+module_platform_driver(qnoc_driver);
+
+MODULE_DESCRIPTION("Qualcomm SDM670 NoC driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/interconnect/qcom/sdm670.h b/drivers/interconnect/qcom/sdm670.h
new file mode 100644
index 000000000000..14155f244c43
--- /dev/null
+++ b/drivers/interconnect/qcom/sdm670.h
@@ -0,0 +1,128 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Qualcomm #define SDM670 interconnect IDs
+ *
+ * Copyright (c) 2020, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef __DRIVERS_INTERCONNECT_QCOM_SDM670_H
+#define __DRIVERS_INTERCONNECT_QCOM_SDM670_H
+
+#define SDM670_MASTER_A1NOC_CFG			0
+#define SDM670_MASTER_A1NOC_SNOC		1
+#define SDM670_MASTER_A2NOC_CFG			2
+#define SDM670_MASTER_A2NOC_SNOC		3
+#define SDM670_MASTER_AMPSS_M0			4
+#define SDM670_MASTER_BLSP_1			5
+#define SDM670_MASTER_BLSP_2			6
+#define SDM670_MASTER_CAMNOC_HF0		7
+#define SDM670_MASTER_CAMNOC_HF0_UNCOMP		8
+#define SDM670_MASTER_CAMNOC_HF1		9
+#define SDM670_MASTER_CAMNOC_HF1_UNCOMP		10
+#define SDM670_MASTER_CAMNOC_SF			11
+#define SDM670_MASTER_CAMNOC_SF_UNCOMP		12
+#define SDM670_MASTER_CNOC_A2NOC		13
+#define SDM670_MASTER_CNOC_DC_NOC		14
+#define SDM670_MASTER_CNOC_MNOC_CFG		15
+#define SDM670_MASTER_CRYPTO_CORE_0		16
+#define SDM670_MASTER_EMMC			17
+#define SDM670_MASTER_GIC			18
+#define SDM670_MASTER_GNOC_CFG			19
+#define SDM670_MASTER_GNOC_MEM_NOC		20
+#define SDM670_MASTER_GNOC_SNOC			21
+#define SDM670_MASTER_GRAPHICS_3D		22
+#define SDM670_MASTER_IPA			23
+#define SDM670_MASTER_LLCC			24
+#define SDM670_MASTER_MDP_PORT0			25
+#define SDM670_MASTER_MDP_PORT1			26
+#define SDM670_MASTER_MEM_NOC_CFG		27
+#define SDM670_MASTER_MEM_NOC_SNOC		28
+#define SDM670_MASTER_MNOC_HF_MEM_NOC		29
+#define SDM670_MASTER_MNOC_SF_MEM_NOC		30
+#define SDM670_MASTER_PIMEM			31
+#define SDM670_MASTER_QDSS_BAM			32
+#define SDM670_MASTER_QDSS_ETR			33
+#define SDM670_MASTER_ROTATOR			34
+#define SDM670_MASTER_SDCC_2			35
+#define SDM670_MASTER_SDCC_4			36
+#define SDM670_MASTER_SNOC_CFG			37
+#define SDM670_MASTER_SNOC_CNOC			38
+#define SDM670_MASTER_SNOC_GC_MEM_NOC		39
+#define SDM670_MASTER_SNOC_SF_MEM_NOC		40
+#define SDM670_MASTER_SPDM			41
+#define SDM670_MASTER_TCU_0			42
+#define SDM670_MASTER_TSIF			43
+#define SDM670_MASTER_UFS_MEM			44
+#define SDM670_MASTER_USB3			45
+#define SDM670_MASTER_VIDEO_P0			46
+#define SDM670_MASTER_VIDEO_P1			47
+#define SDM670_MASTER_VIDEO_PROC		48
+#define SDM670_SLAVE_A1NOC_CFG			49
+#define SDM670_SLAVE_A1NOC_SNOC			50
+#define SDM670_SLAVE_A2NOC_CFG			51
+#define SDM670_SLAVE_A2NOC_SNOC			52
+#define SDM670_SLAVE_AOP			53
+#define SDM670_SLAVE_AOSS			54
+#define SDM670_SLAVE_APPSS			55
+#define SDM670_SLAVE_BLSP_1			56
+#define SDM670_SLAVE_BLSP_2			57
+#define SDM670_SLAVE_CAMERA_CFG			58
+#define SDM670_SLAVE_CAMNOC_UNCOMP		59
+#define SDM670_SLAVE_CDSP_CFG			60
+#define SDM670_SLAVE_CLK_CTL			61
+#define SDM670_SLAVE_CNOC_A2NOC			62
+#define SDM670_SLAVE_CNOC_DDRSS			63
+#define SDM670_SLAVE_CNOC_MNOC_CFG		64
+#define SDM670_SLAVE_CRYPTO_0_CFG		65
+#define SDM670_SLAVE_DCC_CFG			66
+#define SDM670_SLAVE_DISPLAY_CFG		67
+#define SDM670_SLAVE_EBI_CH0			68
+#define SDM670_SLAVE_EMMC_CFG			69
+#define SDM670_SLAVE_GLM			70
+#define SDM670_SLAVE_GNOC_MEM_NOC		71
+#define SDM670_SLAVE_GNOC_SNOC			72
+#define SDM670_SLAVE_GRAPHICS_3D_CFG		73
+#define SDM670_SLAVE_IMEM_CFG			74
+#define SDM670_SLAVE_IPA_CFG			75
+#define SDM670_SLAVE_LLCC			76
+#define SDM670_SLAVE_LLCC_CFG			77
+#define SDM670_SLAVE_MEM_NOC_CFG		78
+#define SDM670_SLAVE_MEM_NOC_GNOC		79
+#define SDM670_SLAVE_MEM_NOC_SNOC		80
+#define SDM670_SLAVE_MNOC_HF_MEM_NOC		81
+#define SDM670_SLAVE_MNOC_SF_MEM_NOC		82
+#define SDM670_SLAVE_MSS_PROC_MS_MPU_CFG	83
+#define SDM670_SLAVE_OCIMEM			84
+#define SDM670_SLAVE_PDM			85
+#define SDM670_SLAVE_PIMEM			86
+#define SDM670_SLAVE_PIMEM_CFG			87
+#define SDM670_SLAVE_PRNG			88
+#define SDM670_SLAVE_QDSS_CFG			89
+#define SDM670_SLAVE_QDSS_STM			90
+#define SDM670_SLAVE_RBCPR_CX_CFG		91
+#define SDM670_SLAVE_SDCC_2			92
+#define SDM670_SLAVE_SDCC_4			93
+#define SDM670_SLAVE_SERVICE_A1NOC		94
+#define SDM670_SLAVE_SERVICE_A2NOC		95
+#define SDM670_SLAVE_SERVICE_CNOC		96
+#define SDM670_SLAVE_SERVICE_GNOC		97
+#define SDM670_SLAVE_SERVICE_MEM_NOC		98
+#define SDM670_SLAVE_SERVICE_MNOC		99
+#define SDM670_SLAVE_SERVICE_SNOC		100
+#define SDM670_SLAVE_SNOC_CFG			101
+#define SDM670_SLAVE_SNOC_CNOC			102
+#define SDM670_SLAVE_SNOC_MEM_NOC_GC		103
+#define SDM670_SLAVE_SNOC_MEM_NOC_SF		104
+#define SDM670_SLAVE_SOUTH_PHY_CFG		105
+#define SDM670_SLAVE_SPDM_WRAPPER		106
+#define SDM670_SLAVE_TCSR			107
+#define SDM670_SLAVE_TCU			108
+#define SDM670_SLAVE_TLMM_NORTH			109
+#define SDM670_SLAVE_TLMM_SOUTH			110
+#define SDM670_SLAVE_TSIF			111
+#define SDM670_SLAVE_UFS_MEM_CFG		112
+#define SDM670_SLAVE_USB3			113
+#define SDM670_SLAVE_VENUS_CFG			114
+#define SDM670_SLAVE_VSENSE_CTRL_CFG		115
+
+#endif
-- 
2.39.0

