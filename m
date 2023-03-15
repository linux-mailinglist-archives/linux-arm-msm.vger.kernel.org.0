Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5AEA06BA838
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Mar 2023 07:45:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230356AbjCOGpB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Mar 2023 02:45:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231204AbjCOGoh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Mar 2023 02:44:37 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F022422A1E
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 23:44:05 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id e15-20020a17090ac20f00b0023d1b009f52so842813pjt.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 23:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678862640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rQx6P2mfh2qDcHF7hB2MhMZ3flZiY/yvDBCNUwZGTWw=;
        b=rjD1zy/F5hXJTiuuiIQFngXWyQ5K2q6XbeqK4/QWvR3muGAGZiKHPmRq2va7TYy5TF
         lVIflj2GN5OQyCOjW/sPHNzu/XTecZFM8WlJC6Tv6mqrHPsVdetKjzftZeI299HhhUs2
         SODVf9uXNJpVTRWGzpA8kJ4dQergz6TQvjIePNcsUtBKKtxVjZm1baunlkl4Fe7kApnp
         9auWfQOU5D4eY0aY+EnfVK8iSAw1te2w5RxmpPs4ilW/MdsKfKx2Oked/yIXIxok7HPa
         oySlie5HHTjzFhdWh7u8vYssDbt0c9fJQN2pQEkb0npYDk8LrpbDloT/w8OgX/tRTkHS
         IK8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678862640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rQx6P2mfh2qDcHF7hB2MhMZ3flZiY/yvDBCNUwZGTWw=;
        b=MLPnEPWbXKVgIfHbO6PkMLdXxsjsw8O6VdD5R88Dngv+0zL7Ocen0MqNiAynGOTz46
         7VywhGKl6p2oXLZgA5w2SsT1Zk1JbYLUpSVPHGr5ApV4YjsuY1wg7qdLb1PKau757SXd
         YaBSN2qhXd52Hn3upEISHPUs6LLYshXdCPkpYZHT+koWlQWDPIQ49ZESJWSFASWaSi3H
         L8ZglDBbkPH3y+9vI9Pt3UVq+wOC1KcSJOVU6Ax79N7wjC8vpl3aB0aORxHFDBrBdMk5
         A4neBiG77ZWWwPmn+psRJboKCuB+EAzz5RGsdPRa0YZSNJGMXHmrJpkvgR4RBaAkiiua
         yWpw==
X-Gm-Message-State: AO0yUKVLmYYVISfD5PcYQ3SK85jhI01gk98NxYeobsPl2h4dt4lwuVQz
        qM3f9J6Qfy4WxUQLv887YfAQ
X-Google-Smtp-Source: AK7set89pwSckHBA6X0mvuFRK86wOtioV9O69BOlzyKpMn6yWtysatSdVFzJhAzfCzfhMB/bpcpc2Q==
X-Received: by 2002:a17:90b:4b4b:b0:233:a6b7:3770 with SMTP id mi11-20020a17090b4b4b00b00233a6b73770mr41430916pjb.14.1678862640195;
        Tue, 14 Mar 2023 23:44:00 -0700 (PDT)
Received: from localhost.localdomain ([117.217.182.35])
        by smtp.gmail.com with ESMTPSA id u4-20020a17090a6a8400b002367325203fsm550747pjj.50.2023.03.14.23.43.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 23:43:59 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org, lpieralisi@kernel.org, kw@linux.com,
        krzysztof.kozlowski+dt@linaro.org, robh@kernel.org
Cc:     konrad.dybcio@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_srichara@quicinc.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v4 13/18] PCI: qcom: Rename qcom_pcie_config_sid_sm8250() to reflect IP version
Date:   Wed, 15 Mar 2023 12:12:50 +0530
Message-Id: <20230315064255.15591-14-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230315064255.15591-1-manivannan.sadhasivam@linaro.org>
References: <20230315064255.15591-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

qcom_pcie_config_sid_sm8250() function no longer applies only to SM8250.
So let's rename it to reflect the actual IP version and also move its
definition to keep it sorted as per IP revisions.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 143 ++++++++++++-------------
 1 file changed, 71 insertions(+), 72 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index e1180c84f0fa..e47fdae3918c 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -963,6 +963,76 @@ static void qcom_pcie_deinit_2_7_0(struct qcom_pcie *pcie)
 	regulator_bulk_disable(ARRAY_SIZE(res->supplies), res->supplies);
 }
 
+static int qcom_pcie_config_sid_1_9_0(struct qcom_pcie *pcie)
+{
+	/* iommu map structure */
+	struct {
+		u32 bdf;
+		u32 phandle;
+		u32 smmu_sid;
+		u32 smmu_sid_len;
+	} *map;
+	void __iomem *bdf_to_sid_base = pcie->parf + PARF_BDF_TO_SID_TABLE_N;
+	struct device *dev = pcie->pci->dev;
+	u8 qcom_pcie_crc8_table[CRC8_TABLE_SIZE];
+	int i, nr_map, size = 0;
+	u32 smmu_sid_base;
+
+	of_get_property(dev->of_node, "iommu-map", &size);
+	if (!size)
+		return 0;
+
+	map = kzalloc(size, GFP_KERNEL);
+	if (!map)
+		return -ENOMEM;
+
+	of_property_read_u32_array(dev->of_node, "iommu-map", (u32 *)map,
+				   size / sizeof(u32));
+
+	nr_map = size / (sizeof(*map));
+
+	crc8_populate_msb(qcom_pcie_crc8_table, QCOM_PCIE_CRC8_POLYNOMIAL);
+
+	/* Registers need to be zero out first */
+	memset_io(bdf_to_sid_base, 0, CRC8_TABLE_SIZE * sizeof(u32));
+
+	/* Extract the SMMU SID base from the first entry of iommu-map */
+	smmu_sid_base = map[0].smmu_sid;
+
+	/* Look for an available entry to hold the mapping */
+	for (i = 0; i < nr_map; i++) {
+		__be16 bdf_be = cpu_to_be16(map[i].bdf);
+		u32 val;
+		u8 hash;
+
+		hash = crc8(qcom_pcie_crc8_table, (u8 *)&bdf_be, sizeof(bdf_be), 0);
+
+		val = readl(bdf_to_sid_base + hash * sizeof(u32));
+
+		/* If the register is already populated, look for next available entry */
+		while (val) {
+			u8 current_hash = hash++;
+			u8 next_mask = 0xff;
+
+			/* If NEXT field is NULL then update it with next hash */
+			if (!(val & next_mask)) {
+				val |= (u32)hash;
+				writel(val, bdf_to_sid_base + current_hash * sizeof(u32));
+			}
+
+			val = readl(bdf_to_sid_base + hash * sizeof(u32));
+		}
+
+		/* BDF [31:16] | SID [15:8] | NEXT [7:0] */
+		val = map[i].bdf << 16 | (map[i].smmu_sid - smmu_sid_base) << 8 | 0;
+		writel(val, bdf_to_sid_base + hash * sizeof(u32));
+	}
+
+	kfree(map);
+
+	return 0;
+}
+
 static int qcom_pcie_get_resources_2_9_0(struct qcom_pcie *pcie)
 {
 	struct qcom_pcie_resources_2_9_0 *res = &pcie->res.v2_9_0;
@@ -1077,77 +1147,6 @@ static int qcom_pcie_link_up(struct dw_pcie *pci)
 	return !!(val & PCI_EXP_LNKSTA_DLLLA);
 }
 
-static int qcom_pcie_config_sid_sm8250(struct qcom_pcie *pcie)
-{
-	/* iommu map structure */
-	struct {
-		u32 bdf;
-		u32 phandle;
-		u32 smmu_sid;
-		u32 smmu_sid_len;
-	} *map;
-	void __iomem *bdf_to_sid_base = pcie->parf + PARF_BDF_TO_SID_TABLE_N;
-	struct device *dev = pcie->pci->dev;
-	u8 qcom_pcie_crc8_table[CRC8_TABLE_SIZE];
-	int i, nr_map, size = 0;
-	u32 smmu_sid_base;
-
-	of_get_property(dev->of_node, "iommu-map", &size);
-	if (!size)
-		return 0;
-
-	map = kzalloc(size, GFP_KERNEL);
-	if (!map)
-		return -ENOMEM;
-
-	of_property_read_u32_array(dev->of_node,
-		"iommu-map", (u32 *)map, size / sizeof(u32));
-
-	nr_map = size / (sizeof(*map));
-
-	crc8_populate_msb(qcom_pcie_crc8_table, QCOM_PCIE_CRC8_POLYNOMIAL);
-
-	/* Registers need to be zero out first */
-	memset_io(bdf_to_sid_base, 0, CRC8_TABLE_SIZE * sizeof(u32));
-
-	/* Extract the SMMU SID base from the first entry of iommu-map */
-	smmu_sid_base = map[0].smmu_sid;
-
-	/* Look for an available entry to hold the mapping */
-	for (i = 0; i < nr_map; i++) {
-		__be16 bdf_be = cpu_to_be16(map[i].bdf);
-		u32 val;
-		u8 hash;
-
-		hash = crc8(qcom_pcie_crc8_table, (u8 *)&bdf_be, sizeof(bdf_be),
-			0);
-
-		val = readl(bdf_to_sid_base + hash * sizeof(u32));
-
-		/* If the register is already populated, look for next available entry */
-		while (val) {
-			u8 current_hash = hash++;
-			u8 next_mask = 0xff;
-
-			/* If NEXT field is NULL then update it with next hash */
-			if (!(val & next_mask)) {
-				val |= (u32)hash;
-				writel(val, bdf_to_sid_base + current_hash * sizeof(u32));
-			}
-
-			val = readl(bdf_to_sid_base + hash * sizeof(u32));
-		}
-
-		/* BDF [31:16] | SID [15:8] | NEXT [7:0] */
-		val = map[i].bdf << 16 | (map[i].smmu_sid - smmu_sid_base) << 8 | 0;
-		writel(val, bdf_to_sid_base + hash * sizeof(u32));
-	}
-
-	kfree(map);
-
-	return 0;
-}
-
 static int qcom_pcie_host_init(struct dw_pcie_rp *pp)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
@@ -1268,7 +1267,7 @@ static const struct qcom_pcie_ops ops_1_9_0 = {
 	.init = qcom_pcie_init_2_7_0,
 	.deinit = qcom_pcie_deinit_2_7_0,
 	.ltssm_enable = qcom_pcie_2_3_2_ltssm_enable,
-	.config_sid = qcom_pcie_config_sid_sm8250,
+	.config_sid = qcom_pcie_config_sid_1_9_0,
 };
 
 /* Qcom IP rev.: 2.9.0  Synopsys IP rev.: 5.00a */
-- 
2.25.1

