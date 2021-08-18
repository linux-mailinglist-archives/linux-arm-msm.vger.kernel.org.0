Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 960C53EF7C3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Aug 2021 03:57:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236080AbhHRB6P (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Aug 2021 21:58:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236121AbhHRB6O (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Aug 2021 21:58:14 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABB17C0613A3
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Aug 2021 18:57:39 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id y6so2136634lje.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Aug 2021 18:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hyuS5cM+oS2D4iIFxbCcLrvi4PV7C/ZWM3vAMDfggqs=;
        b=fw3Pv/8hwoCJb3C2ZkrikqkHidQ7HYp7ty1BaZDF6MUj0v7JIgN69LA8wyjnMNdnD0
         BlubyNBKMyQ/+jvPNGdRqxxRYqXjQ35dFVHYeQdY2eQCoyuseSaES9B5rvf0KLXCdkaX
         pCcGr9j/Ldyb8xUQB2FN7XE5VAixVbzCigw82DtrCgUdxcF+6OFJo6oL3DFogqMfvpjK
         eew+l1Y6lY0q6NfRDXLGMvyCn1k35dRfsxnzRDE6kugo+27OF1L5mzRhb6pucDdcySXF
         nFHk0dcuExPwvvRSmrKGWznHvHlbgODsaVYxeivgl8ta+nsWZNJv5aaBbB+ENft2xfEk
         s1zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hyuS5cM+oS2D4iIFxbCcLrvi4PV7C/ZWM3vAMDfggqs=;
        b=fKqS/5wHqTuYQPNQlj/CGnjTIUB8hIMnxKlYCJKEusxV9BCtSIy0J423NCSPKO9S3m
         r8Opw2xkfgK9y3FVz2WSsuqWEF6HPgwj1Wtyyr5uuE4AVkomddpX8HOOg0uIIdWr+FLY
         znSTwydmdY+/nz2TCFHfBlBcSy4osc2ZvxoOQ2auIwH4YTVoExf/CSzj+OMvL6dnEv4s
         UWsUjn0/8MAZzBDFZBjwNn8g8+IGrU2KhqL0Ma8oPiqLyCYjnAWkN0/WWD719wHV5JRR
         ukQzEA0UVXV0dCboMdAe48/ba87Qj+G5T9EqDjPOkmUbTvzTblJDh6S+wkfG9PFJWVBQ
         MdoQ==
X-Gm-Message-State: AOAM531GQZfJl5GY6505RPK9oCJG3ZniuSd25IUfiUzcXW7mhsaXOWXv
        7NrOGUIkW1K7MRFvq1neVIaAzQ==
X-Google-Smtp-Source: ABdhPJzz/5K9HFWsPi/+QBKP8arQpae2ngvrP4N9KgFD9IBuNUFpQoREvhzbYQLycCA3UNUlDHKB9g==
X-Received: by 2002:a05:651c:2de:: with SMTP id f30mr5598687ljo.79.1629251858052;
        Tue, 17 Aug 2021 18:57:38 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id y8sm349500lfh.249.2021.08.17.18.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Aug 2021 18:57:37 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Georgi Djakov <djakov@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org
Subject: [PATCH 5/5] interconnect: msm8939: add support for AP-owned nodes
Date:   Wed, 18 Aug 2021 04:57:32 +0300
Message-Id: <20210818015732.1717810-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210818015732.1717810-1-dmitry.baryshkov@linaro.org>
References: <20210818015732.1717810-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Port support for AP-owned nodes from the downstream device tree.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/interconnect/qcom/msm8939.c | 82 ++++++++++++++++++++++-------
 1 file changed, 62 insertions(+), 20 deletions(-)

diff --git a/drivers/interconnect/qcom/msm8939.c b/drivers/interconnect/qcom/msm8939.c
index 4a5a2ec64960..55c33a9044c5 100644
--- a/drivers/interconnect/qcom/msm8939.c
+++ b/drivers/interconnect/qcom/msm8939.c
@@ -11,6 +11,7 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/regmap.h>
 #include <linux/of_device.h>
 
 #include <dt-bindings/interconnect/qcom,msm8939.h>
@@ -110,32 +111,32 @@ enum {
 	MSM8939_SNOC_PNOC_SLV,
 };
 
-DEFINE_QNODE(bimc_snoc_mas, MSM8939_BIMC_SNOC_MAS, 8, -1, -1, MSM8939_BIMC_SNOC_SLV);
+DEFINE_QNODE_AP(bimc_snoc_mas, MSM8939_BIMC_SNOC_MAS, 8, -1, -1, -1, 0, -1, MSM8939_BIMC_SNOC_SLV);
 DEFINE_QNODE(bimc_snoc_slv, MSM8939_BIMC_SNOC_SLV, 16, -1, 2, MSM8939_SNOC_INT_0, MSM8939_SNOC_INT_1);
-DEFINE_QNODE(mas_apss, MSM8939_MASTER_AMPSS_M0, 16, -1, -1, MSM8939_SLAVE_EBI_CH0, MSM8939_BIMC_SNOC_MAS, MSM8939_SLAVE_AMPSS_L2);
+DEFINE_QNODE_AP(mas_apss, MSM8939_MASTER_AMPSS_M0, 16, -1, -1, NOC_QOS_MODE_FIXED, 0, 0, MSM8939_SLAVE_EBI_CH0, MSM8939_BIMC_SNOC_MAS, MSM8939_SLAVE_AMPSS_L2);
 DEFINE_QNODE(mas_audio, MSM8939_MASTER_LPASS, 4, -1, -1, MSM8939_PNOC_MAS_0);
 DEFINE_QNODE(mas_blsp_1, MSM8939_MASTER_BLSP_1, 4, -1, -1, MSM8939_PNOC_MAS_1);
 DEFINE_QNODE(mas_dehr, MSM8939_MASTER_DEHR, 4, -1, -1, MSM8939_PNOC_MAS_0);
-DEFINE_QNODE(mas_gfx, MSM8939_MASTER_GRAPHICS_3D, 16, -1, -1, MSM8939_SLAVE_EBI_CH0, MSM8939_BIMC_SNOC_MAS, MSM8939_SLAVE_AMPSS_L2);
-DEFINE_QNODE(mas_jpeg, MSM8939_MASTER_JPEG, 16, -1, -1, MSM8939_SNOC_MM_INT_0, MSM8939_SNOC_MM_INT_2);
-DEFINE_QNODE(mas_mdp0, MSM8939_MASTER_MDP_PORT0, 16, -1, -1, MSM8939_SNOC_MM_INT_1, MSM8939_SNOC_MM_INT_2);
-DEFINE_QNODE(mas_mdp1, MSM8939_MASTER_MDP_PORT1, 16, -1, -1, MSM8939_SNOC_MM_INT_0, MSM8939_SNOC_MM_INT_2);
-DEFINE_QNODE(mas_cpp, MSM8939_MASTER_CPP, 16, -1, -1, MSM8939_SNOC_MM_INT_0, MSM8939_SNOC_MM_INT_2);
+DEFINE_QNODE_AP(mas_gfx, MSM8939_MASTER_GRAPHICS_3D, 16, -1, -1, NOC_QOS_MODE_FIXED, 0, 2, MSM8939_SLAVE_EBI_CH0, MSM8939_BIMC_SNOC_MAS, MSM8939_SLAVE_AMPSS_L2);
+DEFINE_QNODE_AP(mas_jpeg, MSM8939_MASTER_JPEG, 16, -1, -1, NOC_QOS_MODE_BYPASS, 0, 6, MSM8939_SNOC_MM_INT_0, MSM8939_SNOC_MM_INT_2);
+DEFINE_QNODE_AP(mas_mdp0, MSM8939_MASTER_MDP_PORT0, 16, -1, -1, NOC_QOS_MODE_BYPASS, 0, 7, MSM8939_SNOC_MM_INT_1, MSM8939_SNOC_MM_INT_2);
+DEFINE_QNODE_AP(mas_mdp1, MSM8939_MASTER_MDP_PORT1, 16, -1, -1, NOC_QOS_MODE_BYPASS, 0, 13, MSM8939_SNOC_MM_INT_0, MSM8939_SNOC_MM_INT_2);
+DEFINE_QNODE_AP(mas_cpp, MSM8939_MASTER_CPP, 16, -1, -1, NOC_QOS_MODE_BYPASS, 0, 12, MSM8939_SNOC_MM_INT_0, MSM8939_SNOC_MM_INT_2);
 DEFINE_QNODE(mas_pcnoc_crypto_0, MSM8939_MASTER_CRYPTO_CORE0, 8, -1, -1, MSM8939_PNOC_INT_1);
 DEFINE_QNODE(mas_pcnoc_sdcc_1, MSM8939_MASTER_SDCC_1, 8, -1, -1, MSM8939_PNOC_INT_1);
 DEFINE_QNODE(mas_pcnoc_sdcc_2, MSM8939_MASTER_SDCC_2, 8, -1, -1, MSM8939_PNOC_INT_1);
-DEFINE_QNODE(mas_qdss_bam, MSM8939_MASTER_QDSS_BAM, 8, -1, -1, MSM8939_SNOC_QDSS_INT);
-DEFINE_QNODE(mas_qdss_etr, MSM8939_MASTER_QDSS_ETR, 8, -1, -1, MSM8939_SNOC_QDSS_INT);
+DEFINE_QNODE_AP(mas_qdss_bam, MSM8939_MASTER_QDSS_BAM, 8, -1, -1, NOC_QOS_MODE_FIXED, 1, 11, MSM8939_SNOC_QDSS_INT);
+DEFINE_QNODE_AP(mas_qdss_etr, MSM8939_MASTER_QDSS_ETR, 8, -1, -1, NOC_QOS_MODE_FIXED, 1, 10, MSM8939_SNOC_QDSS_INT);
 DEFINE_QNODE(mas_snoc_cfg, MSM8939_MASTER_SNOC_CFG, 4, -1, -1, MSM8939_SLAVE_SRVC_SNOC);
 DEFINE_QNODE(mas_spdm, MSM8939_MASTER_SPDM, 4, -1, -1, MSM8939_PNOC_MAS_0);
-DEFINE_QNODE(mas_tcu0, MSM8939_MASTER_TCU0, 16, -1, -1, MSM8939_SLAVE_EBI_CH0, MSM8939_BIMC_SNOC_MAS, MSM8939_SLAVE_AMPSS_L2);
+DEFINE_QNODE_AP(mas_tcu0, MSM8939_MASTER_TCU0, 16, -1, -1, NOC_QOS_MODE_FIXED, 2, 6, MSM8939_SLAVE_EBI_CH0, MSM8939_BIMC_SNOC_MAS, MSM8939_SLAVE_AMPSS_L2);
 DEFINE_QNODE(mas_usb_hs1, MSM8939_MASTER_USB_HS1, 4, -1, -1, MSM8939_PNOC_MAS_1);
 DEFINE_QNODE(mas_usb_hs2, MSM8939_MASTER_USB_HS2, 4, -1, -1, MSM8939_PNOC_MAS_1);
-DEFINE_QNODE(mas_vfe, MSM8939_MASTER_VFE, 16, -1, -1, MSM8939_SNOC_MM_INT_1, MSM8939_SNOC_MM_INT_2);
-DEFINE_QNODE(mas_video, MSM8939_MASTER_VIDEO_P0, 16, -1, -1, MSM8939_SNOC_MM_INT_0, MSM8939_SNOC_MM_INT_2);
-DEFINE_QNODE(mm_int_0, MSM8939_SNOC_MM_INT_0, 16, -1, -1, MSM8939_SNOC_BIMC_2_MAS);
-DEFINE_QNODE(mm_int_1, MSM8939_SNOC_MM_INT_1, 16, -1, -1, MSM8939_SNOC_BIMC_1_MAS);
-DEFINE_QNODE(mm_int_2, MSM8939_SNOC_MM_INT_2, 16, -1, -1, MSM8939_SNOC_INT_0);
+DEFINE_QNODE_AP(mas_vfe, MSM8939_MASTER_VFE, 16, -1, -1, NOC_QOS_MODE_BYPASS, 0, 9, MSM8939_SNOC_MM_INT_1, MSM8939_SNOC_MM_INT_2);
+DEFINE_QNODE_AP(mas_video, MSM8939_MASTER_VIDEO_P0, 16, -1, -1, NOC_QOS_MODE_BYPASS, 0, 8, MSM8939_SNOC_MM_INT_0, MSM8939_SNOC_MM_INT_2);
+DEFINE_QNODE_AP(mm_int_0, MSM8939_SNOC_MM_INT_0, 16, -1, -1, -1, 0, -1, MSM8939_SNOC_BIMC_2_MAS);
+DEFINE_QNODE_AP(mm_int_1, MSM8939_SNOC_MM_INT_1, 16, -1, -1, -1, 0, -1, MSM8939_SNOC_BIMC_1_MAS);
+DEFINE_QNODE_AP(mm_int_2, MSM8939_SNOC_MM_INT_2, 16, -1, -1, -1, 0, -1, MSM8939_SNOC_INT_0);
 DEFINE_QNODE(pcnoc_int_0, MSM8939_PNOC_INT_0, 8, -1, -1, MSM8939_PNOC_SNOC_MAS, MSM8939_PNOC_SLV_0, MSM8939_PNOC_SLV_1, MSM8939_PNOC_SLV_2, MSM8939_PNOC_SLV_3, MSM8939_PNOC_SLV_4, MSM8939_PNOC_SLV_8, MSM8939_PNOC_SLV_9);
 DEFINE_QNODE(pcnoc_int_1, MSM8939_PNOC_INT_1, 8, -1, -1, MSM8939_PNOC_SNOC_MAS);
 DEFINE_QNODE(pcnoc_m_0, MSM8939_PNOC_MAS_0, 8, -1, -1, MSM8939_PNOC_INT_0);
@@ -149,7 +150,7 @@ DEFINE_QNODE(pcnoc_s_8, MSM8939_PNOC_SLV_8, 4, -1, -1, MSM8939_SLAVE_USB_HS1, MS
 DEFINE_QNODE(pcnoc_s_9, MSM8939_PNOC_SLV_9, 4, -1, -1, MSM8939_SLAVE_SDCC_2, MSM8939_SLAVE_LPASS, MSM8939_SLAVE_USB_HS2);
 DEFINE_QNODE(pcnoc_snoc_mas, MSM8939_PNOC_SNOC_MAS, 8, 29, -1, MSM8939_PNOC_SNOC_SLV);
 DEFINE_QNODE(pcnoc_snoc_slv, MSM8939_PNOC_SNOC_SLV, 8, -1, 45, MSM8939_SNOC_INT_0, MSM8939_SNOC_INT_BIMC, MSM8939_SNOC_INT_1);
-DEFINE_QNODE(qdss_int, MSM8939_SNOC_QDSS_INT, 8, -1, -1, MSM8939_SNOC_INT_0, MSM8939_SNOC_INT_BIMC);
+DEFINE_QNODE_AP(qdss_int, MSM8939_SNOC_QDSS_INT, 8, -1, -1, -1, 0, -1, MSM8939_SNOC_INT_0, MSM8939_SNOC_INT_BIMC);
 DEFINE_QNODE(slv_apps_l2, MSM8939_SLAVE_AMPSS_L2, 16, -1, -1, 0);
 DEFINE_QNODE(slv_apss, MSM8939_SLAVE_APSS, 4, -1, -1, 0);
 DEFINE_QNODE(slv_audio, MSM8939_SLAVE_LPASS, 4, -1, -1, 0);
@@ -188,12 +189,12 @@ DEFINE_QNODE(slv_tlmm, MSM8939_SLAVE_TLMM, 4, -1, -1, 0);
 DEFINE_QNODE(slv_usb_hs1, MSM8939_SLAVE_USB_HS1, 4, -1, -1, 0);
 DEFINE_QNODE(slv_usb_hs2, MSM8939_SLAVE_USB_HS2, 4, -1, -1, 0);
 DEFINE_QNODE(slv_venus_cfg, MSM8939_SLAVE_VENUS_CFG, 4, -1, -1, 0);
-DEFINE_QNODE(snoc_bimc_0_mas, MSM8939_SNOC_BIMC_0_MAS, 16, -1, -1, MSM8939_SNOC_BIMC_0_SLV);
-DEFINE_QNODE(snoc_bimc_0_slv, MSM8939_SNOC_BIMC_0_SLV, 16, -1, -1, MSM8939_SLAVE_EBI_CH0);
+DEFINE_QNODE_AP(snoc_bimc_0_mas, MSM8939_SNOC_BIMC_0_MAS, 16, -1, -1, -1, 0, -1, MSM8939_SNOC_BIMC_0_SLV);
+DEFINE_QNODE_AP(snoc_bimc_0_slv, MSM8939_SNOC_BIMC_0_SLV, 16, -1, -1, -1, 0, -1, MSM8939_SLAVE_EBI_CH0);
 DEFINE_QNODE(snoc_bimc_1_mas, MSM8939_SNOC_BIMC_1_MAS, 16, 76, -1, MSM8939_SNOC_BIMC_1_SLV);
 DEFINE_QNODE(snoc_bimc_1_slv, MSM8939_SNOC_BIMC_1_SLV, 16, -1, 104, MSM8939_SLAVE_EBI_CH0);
-DEFINE_QNODE(snoc_bimc_2_mas, MSM8939_SNOC_BIMC_2_MAS, 16, -1, -1, MSM8939_SNOC_BIMC_2_SLV);
-DEFINE_QNODE(snoc_bimc_2_slv, MSM8939_SNOC_BIMC_2_SLV, 16, -1, -1, MSM8939_SLAVE_EBI_CH0);
+DEFINE_QNODE_AP(snoc_bimc_2_mas, MSM8939_SNOC_BIMC_2_MAS, 16, -1, -1, -1, 0, -1, MSM8939_SNOC_BIMC_2_SLV);
+DEFINE_QNODE_AP(snoc_bimc_2_slv, MSM8939_SNOC_BIMC_2_SLV, 16, -1, -1, -1, 0, -1, MSM8939_SLAVE_EBI_CH0);
 DEFINE_QNODE(snoc_int_0, MSM8939_SNOC_INT_0, 8, 99, 130, MSM8939_SLAVE_QDSS_STM, MSM8939_SLAVE_IMEM, MSM8939_SNOC_PNOC_MAS);
 DEFINE_QNODE(snoc_int_1, MSM8939_SNOC_INT_1, 8, -1, -1, MSM8939_SLAVE_APSS, MSM8939_SLAVE_CATS_128, MSM8939_SLAVE_OCMEM_64);
 DEFINE_QNODE(snoc_int_bimc, MSM8939_SNOC_INT_BIMC, 8, 101, 132, MSM8939_SNOC_BIMC_1_MAS);
@@ -222,9 +223,19 @@ static struct qcom_icc_node *msm8939_snoc_nodes[] = {
 	[SNOC_QDSS_INT] = &qdss_int,
 };
 
+static const struct regmap_config msm8939_snoc_regmap_config = {
+	.reg_bits	= 32,
+	.reg_stride	= 4,
+	.val_bits	= 32,
+	.max_register	= 0x14080,
+	.fast_io	= true,
+};
+
 static struct qcom_icc_desc msm8939_snoc = {
 	.nodes = msm8939_snoc_nodes,
 	.num_nodes = ARRAY_SIZE(msm8939_snoc_nodes),
+	.regmap_cfg = &msm8939_snoc_regmap_config,
+	.qos_offset = 0x7000,
 };
 
 static struct qcom_icc_node *msm8939_snoc_mm_nodes[] = {
@@ -239,9 +250,19 @@ static struct qcom_icc_node *msm8939_snoc_mm_nodes[] = {
 	[SNOC_MM_INT_2] = &mm_int_2,
 };
 
+static const struct regmap_config msm8939_snoc_mm_regmap_config = {
+	.reg_bits	= 32,
+	.reg_stride	= 4,
+	.val_bits	= 32,
+	.max_register	= 0x14080,
+	.fast_io	= true,
+};
+
 static struct qcom_icc_desc msm8939_snoc_mm = {
 	.nodes = msm8939_snoc_mm_nodes,
 	.num_nodes = ARRAY_SIZE(msm8939_snoc_mm_nodes),
+	.regmap_cfg = &msm8939_snoc_mm_regmap_config,
+	.qos_offset = 0x7000,
 };
 
 static struct qcom_icc_node *msm8939_bimc_nodes[] = {
@@ -256,9 +277,20 @@ static struct qcom_icc_node *msm8939_bimc_nodes[] = {
 	[SNOC_BIMC_2_SLV] = &snoc_bimc_2_slv,
 };
 
+static const struct regmap_config msm8939_bimc_regmap_config = {
+	.reg_bits	= 32,
+	.reg_stride	= 4,
+	.val_bits	= 32,
+	.max_register	= 0x62000,
+	.fast_io	= true,
+};
+
 static struct qcom_icc_desc msm8939_bimc = {
 	.nodes = msm8939_bimc_nodes,
 	.num_nodes = ARRAY_SIZE(msm8939_bimc_nodes),
+	.is_bimc_node = true,
+	.regmap_cfg = &msm8939_bimc_regmap_config,
+	.qos_offset = 0x8000,
 };
 
 static struct qcom_icc_node *msm8939_pcnoc_nodes[] = {
@@ -316,9 +348,19 @@ static struct qcom_icc_node *msm8939_pcnoc_nodes[] = {
 	[SNOC_PCNOC_SLV] = &snoc_pcnoc_slv,
 };
 
+static const struct regmap_config msm8939_pcnoc_regmap_config = {
+	.reg_bits	= 32,
+	.reg_stride	= 4,
+	.val_bits	= 32,
+	.max_register	= 0x11000,
+	.fast_io	= true,
+};
+
 static struct qcom_icc_desc msm8939_pcnoc = {
 	.nodes = msm8939_pcnoc_nodes,
 	.num_nodes = ARRAY_SIZE(msm8939_pcnoc_nodes),
+	.regmap_cfg = &msm8939_pcnoc_regmap_config,
+	.qos_offset = 0x7000,
 };
 
 static const struct of_device_id msm8939_noc_of_match[] = {
-- 
2.32.0

