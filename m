Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 07FDA71A41
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2019 16:23:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388171AbfGWOXz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Jul 2019 10:23:55 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:44735 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388176AbfGWOXy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Jul 2019 10:23:54 -0400
Received: by mail-lj1-f196.google.com with SMTP id k18so41228011ljc.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jul 2019 07:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xn5cpt3n9KGonYt8+qRdgt93HCUMfsrT1u/nUy89zA8=;
        b=h+PzNn0obU7L16kTL/M08wk8qUTp5/zFXcOZfFCdi0OjPreysYw4YYvsxGS3q7R2Jk
         csJn/Loq8p/8oJhTu3vtVVxPCPtoLqGQJG51tVY+JrwDYDc/8o2mk2gc64546+5cnBpN
         x+w7akib/6DBC6KpS6D5rcYA5UhtgWJ3roOAlijhXJPSNALiCVien7XDmTOM7NQiE+Ha
         f0ToB6SbaCKTp/aF3v0TflUb3fY+I8leNtKRWPOZuUPdbKe+ZWoqMPDWAde5ZP4WjsCy
         D9mWnJTXkM2YC9j9yf34TrEnWJ/sw/ECls2TLyvSe/3RkS+c3vkzslAKjJYsndbO/6Ty
         fk0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xn5cpt3n9KGonYt8+qRdgt93HCUMfsrT1u/nUy89zA8=;
        b=ksChe8nBcBXzIs7WrxOzJS45qEX6sK0ZGfXHQz5Z9HIiuKgnYqslzMBry+qE7fSuh+
         2s3pYguRN+Mi65hpIS/BX1OOZiamxFpMdUEkgtxWC6wBPu1/8jwQr4bJabrTF9oWOZ11
         HWLOpJYcUpLLB8UYcgZBzOMEk4Wnm5Zcrft5GDxSwQLuWkIM06JQZy/0G0O+QuKQjLjM
         dsGc8v9yBfBZV7UVbxd0FYuKMzfo99I9WPa8jyL653mDONum/XZNGAuz4igILIvVylzv
         aNC7mpHOLwqcuOf9MTWP9CR8T+3vFuDKLbNXAWSJ0Ire943uw+IHr2j6AlOprQKIGtH5
         GkNg==
X-Gm-Message-State: APjAAAUK9oKF1rbvY/1m17g2jix4hVNcp9ZL/ztfgm5s6/6VrN6zIa/f
        ZfEdne0973xAwAJ15UHjbSwmJg==
X-Google-Smtp-Source: APXvYqzVbwBS9FanUHvzhjwBOqQ7ApxNQHtOinwiXZVW2b0odKqm+SXVmz8/6myOc4rvX2TFekOHhQ==
X-Received: by 2002:a2e:8181:: with SMTP id e1mr22768331ljg.226.1563891830498;
        Tue, 23 Jul 2019 07:23:50 -0700 (PDT)
Received: from localhost.localdomain ([212.45.67.2])
        by smtp.googlemail.com with ESMTPSA id z17sm8048519ljc.37.2019.07.23.07.23.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 23 Jul 2019 07:23:49 -0700 (PDT)
From:   Georgi Djakov <georgi.djakov@linaro.org>
To:     robh+dt@kernel.org, bjorn.andersson@linaro.org, agross@kernel.org,
        georgi.djakov@linaro.org
Cc:     vkoul@kernel.org, evgreen@chromium.org, daidavid1@codeaurora.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v5 4/5] interconnect: qcom: Add QCS404 interconnect provider driver
Date:   Tue, 23 Jul 2019 17:23:38 +0300
Message-Id: <20190723142339.27772-5-georgi.djakov@linaro.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190723142339.27772-1-georgi.djakov@linaro.org>
References: <20190723142339.27772-1-georgi.djakov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bjorn Andersson <bjorn.andersson@linaro.org>

Add driver for the interconnect buses found in Qualcomm QCS404-based
platforms. The topology consists of three NoCs that are controlled by
a remote processor. This remote processor collects the aggregated
bandwidth for each master-slave pairs.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
---

v5:
- Remove the _clk suffix from the clock names.

v4:
- Select INTERCONNECT_QCOM_SMD_RPM from this driver.
- Move the DT header to the dt-bindings patch.
- Move this patch later in the series.

v3:
- Convert the #defines into enum. (Bjorn)
- Move the rpm-smd part into a separate interconnect proxy driver.

v2:
- Use the clk_bulk API. (Bjorn)
- Move the port IDs into the provider file. (Bjorn)
- Use ARRAY_SIZE in the macro to automagically count the num_links. (Bjorn)
- Improve code readability. (Bjorn)

 drivers/interconnect/qcom/Kconfig  |   9 +
 drivers/interconnect/qcom/Makefile |   2 +
 drivers/interconnect/qcom/qcs404.c | 539 +++++++++++++++++++++++++++++
 3 files changed, 550 insertions(+)
 create mode 100644 drivers/interconnect/qcom/qcs404.c

diff --git a/drivers/interconnect/qcom/Kconfig b/drivers/interconnect/qcom/Kconfig
index 03fd67173494..339e8f10d4f3 100644
--- a/drivers/interconnect/qcom/Kconfig
+++ b/drivers/interconnect/qcom/Kconfig
@@ -5,6 +5,15 @@ config INTERCONNECT_QCOM
 	help
 	  Support for Qualcomm's Network-on-Chip interconnect hardware.
 
+config INTERCONNECT_QCOM_QCS404
+	tristate "Qualcomm QCS404 interconnect driver"
+	depends on INTERCONNECT_QCOM
+	depends on QCOM_SMD_RPM || COMPILE_TEST
+	select INTERCONNECT_QCOM_SMD_RPM
+	help
+	  This is a driver for the Qualcomm Network-on-Chip on qcs404-based
+	  platforms.
+
 config INTERCONNECT_QCOM_SDM845
 	tristate "Qualcomm SDM845 interconnect driver"
 	depends on INTERCONNECT_QCOM
diff --git a/drivers/interconnect/qcom/Makefile b/drivers/interconnect/qcom/Makefile
index a600cf6cc272..67dafb783dec 100644
--- a/drivers/interconnect/qcom/Makefile
+++ b/drivers/interconnect/qcom/Makefile
@@ -1,7 +1,9 @@
 # SPDX-License-Identifier: GPL-2.0
 
+qnoc-qcs404-objs			:= qcs404.o
 qnoc-sdm845-objs			:= sdm845.o
 icc-smd-rpm-objs			:= smd-rpm.o
 
+obj-$(CONFIG_INTERCONNECT_QCOM_QCS404) += qnoc-qcs404.o
 obj-$(CONFIG_INTERCONNECT_QCOM_SDM845) += qnoc-sdm845.o
 obj-$(CONFIG_INTERCONNECT_QCOM_SMD_RPM) += icc-smd-rpm.o
diff --git a/drivers/interconnect/qcom/qcs404.c b/drivers/interconnect/qcom/qcs404.c
new file mode 100644
index 000000000000..089a6f88a621
--- /dev/null
+++ b/drivers/interconnect/qcom/qcs404.c
@@ -0,0 +1,539 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2019 Linaro Ltd
+ */
+
+#include <dt-bindings/interconnect/qcom,qcs404.h>
+#include <linux/clk.h>
+#include <linux/device.h>
+#include <linux/interconnect-provider.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+
+#include "smd-rpm.h"
+
+#define RPM_BUS_MASTER_REQ	0x73616d62
+#define RPM_BUS_SLAVE_REQ	0x766c7362
+
+enum {
+	QCS404_MASTER_AMPSS_M0 = 1,
+	QCS404_MASTER_GRAPHICS_3D,
+	QCS404_MASTER_MDP_PORT0,
+	QCS404_SNOC_BIMC_1_MAS,
+	QCS404_MASTER_TCU_0,
+	QCS404_MASTER_SPDM,
+	QCS404_MASTER_BLSP_1,
+	QCS404_MASTER_BLSP_2,
+	QCS404_MASTER_XM_USB_HS1,
+	QCS404_MASTER_CRYPTO_CORE0,
+	QCS404_MASTER_SDCC_1,
+	QCS404_MASTER_SDCC_2,
+	QCS404_SNOC_PNOC_MAS,
+	QCS404_MASTER_QPIC,
+	QCS404_MASTER_QDSS_BAM,
+	QCS404_BIMC_SNOC_MAS,
+	QCS404_PNOC_SNOC_MAS,
+	QCS404_MASTER_QDSS_ETR,
+	QCS404_MASTER_EMAC,
+	QCS404_MASTER_PCIE,
+	QCS404_MASTER_USB3,
+	QCS404_PNOC_INT_0,
+	QCS404_PNOC_INT_2,
+	QCS404_PNOC_INT_3,
+	QCS404_PNOC_SLV_0,
+	QCS404_PNOC_SLV_1,
+	QCS404_PNOC_SLV_2,
+	QCS404_PNOC_SLV_3,
+	QCS404_PNOC_SLV_4,
+	QCS404_PNOC_SLV_6,
+	QCS404_PNOC_SLV_7,
+	QCS404_PNOC_SLV_8,
+	QCS404_PNOC_SLV_9,
+	QCS404_PNOC_SLV_10,
+	QCS404_PNOC_SLV_11,
+	QCS404_SNOC_QDSS_INT,
+	QCS404_SNOC_INT_0,
+	QCS404_SNOC_INT_1,
+	QCS404_SNOC_INT_2,
+	QCS404_SLAVE_EBI_CH0,
+	QCS404_BIMC_SNOC_SLV,
+	QCS404_SLAVE_SPDM_WRAPPER,
+	QCS404_SLAVE_PDM,
+	QCS404_SLAVE_PRNG,
+	QCS404_SLAVE_TCSR,
+	QCS404_SLAVE_SNOC_CFG,
+	QCS404_SLAVE_MESSAGE_RAM,
+	QCS404_SLAVE_DISPLAY_CFG,
+	QCS404_SLAVE_GRAPHICS_3D_CFG,
+	QCS404_SLAVE_BLSP_1,
+	QCS404_SLAVE_TLMM_NORTH,
+	QCS404_SLAVE_PCIE_1,
+	QCS404_SLAVE_EMAC_CFG,
+	QCS404_SLAVE_BLSP_2,
+	QCS404_SLAVE_TLMM_EAST,
+	QCS404_SLAVE_TCU,
+	QCS404_SLAVE_PMIC_ARB,
+	QCS404_SLAVE_SDCC_1,
+	QCS404_SLAVE_SDCC_2,
+	QCS404_SLAVE_TLMM_SOUTH,
+	QCS404_SLAVE_USB_HS,
+	QCS404_SLAVE_USB3,
+	QCS404_SLAVE_CRYPTO_0_CFG,
+	QCS404_PNOC_SNOC_SLV,
+	QCS404_SLAVE_APPSS,
+	QCS404_SLAVE_WCSS,
+	QCS404_SNOC_BIMC_1_SLV,
+	QCS404_SLAVE_OCIMEM,
+	QCS404_SNOC_PNOC_SLV,
+	QCS404_SLAVE_QDSS_STM,
+	QCS404_SLAVE_CATS_128,
+	QCS404_SLAVE_OCMEM_64,
+	QCS404_SLAVE_LPASS,
+};
+
+#define to_qcom_provider(_provider) \
+	container_of(_provider, struct qcom_icc_provider, provider)
+
+static const struct clk_bulk_data bus_clocks[] = {
+	{ .id = "bus" },
+	{ .id = "bus_a" },
+};
+
+/**
+ * struct qcom_icc_provider - Qualcomm specific interconnect provider
+ * @provider: generic interconnect provider
+ * @bus_clks: the clk_bulk_data table of bus clocks
+ * @num_clks: the total number of clk_bulk_data entries
+ */
+struct qcom_icc_provider {
+	struct icc_provider provider;
+	struct clk_bulk_data *bus_clks;
+	int num_clks;
+};
+
+#define QCS404_MAX_LINKS	12
+
+/**
+ * struct qcom_icc_node - Qualcomm specific interconnect nodes
+ * @name: the node name used in debugfs
+ * @id: a unique node identifier
+ * @links: an array of nodes where we can go next while traversing
+ * @num_links: the total number of @links
+ * @buswidth: width of the interconnect between a node and the bus (bytes)
+ * @mas_rpm_id:	RPM id for devices that are bus masters
+ * @slv_rpm_id:	RPM id for devices that are bus slaves
+ * @rate: current bus clock rate in Hz
+ */
+struct qcom_icc_node {
+	unsigned char *name;
+	u16 id;
+	u16 links[QCS404_MAX_LINKS];
+	u16 num_links;
+	u16 buswidth;
+	int mas_rpm_id;
+	int slv_rpm_id;
+	u64 rate;
+};
+
+struct qcom_icc_desc {
+	struct qcom_icc_node **nodes;
+	size_t num_nodes;
+};
+
+#define DEFINE_QNODE(_name, _id, _buswidth, _mas_rpm_id, _slv_rpm_id,	\
+		     ...)						\
+		static struct qcom_icc_node _name = {			\
+		.name = #_name,						\
+		.id = _id,						\
+		.buswidth = _buswidth,					\
+		.mas_rpm_id = _mas_rpm_id,				\
+		.slv_rpm_id = _slv_rpm_id,				\
+		.num_links = ARRAY_SIZE(((int[]){ __VA_ARGS__ })),	\
+		.links = { __VA_ARGS__ },				\
+	}
+
+DEFINE_QNODE(mas_apps_proc, QCS404_MASTER_AMPSS_M0, 8, 0, -1, QCS404_SLAVE_EBI_CH0, QCS404_BIMC_SNOC_SLV);
+DEFINE_QNODE(mas_oxili, QCS404_MASTER_GRAPHICS_3D, 8, 6, -1, QCS404_SLAVE_EBI_CH0, QCS404_BIMC_SNOC_SLV);
+DEFINE_QNODE(mas_mdp, QCS404_MASTER_MDP_PORT0, 8, 8, -1, QCS404_SLAVE_EBI_CH0, QCS404_BIMC_SNOC_SLV);
+DEFINE_QNODE(mas_snoc_bimc_1, QCS404_SNOC_BIMC_1_MAS, 8, 76, -1, QCS404_SLAVE_EBI_CH0);
+DEFINE_QNODE(mas_tcu_0, QCS404_MASTER_TCU_0, 8, -1, -1, QCS404_SLAVE_EBI_CH0, QCS404_BIMC_SNOC_SLV);
+DEFINE_QNODE(mas_spdm, QCS404_MASTER_SPDM, 4, -1, -1, QCS404_PNOC_INT_3);
+DEFINE_QNODE(mas_blsp_1, QCS404_MASTER_BLSP_1, 4, 41, -1, QCS404_PNOC_INT_3);
+DEFINE_QNODE(mas_blsp_2, QCS404_MASTER_BLSP_2, 4, 39, -1, QCS404_PNOC_INT_3);
+DEFINE_QNODE(mas_xi_usb_hs1, QCS404_MASTER_XM_USB_HS1, 8, 138, -1, QCS404_PNOC_INT_0);
+DEFINE_QNODE(mas_crypto, QCS404_MASTER_CRYPTO_CORE0, 8, 23, -1, QCS404_PNOC_SNOC_SLV, QCS404_PNOC_INT_2);
+DEFINE_QNODE(mas_sdcc_1, QCS404_MASTER_SDCC_1, 8, 33, -1, QCS404_PNOC_INT_0);
+DEFINE_QNODE(mas_sdcc_2, QCS404_MASTER_SDCC_2, 8, 35, -1, QCS404_PNOC_INT_0);
+DEFINE_QNODE(mas_snoc_pcnoc, QCS404_SNOC_PNOC_MAS, 8, 77, -1, QCS404_PNOC_INT_2);
+DEFINE_QNODE(mas_qpic, QCS404_MASTER_QPIC, 4, -1, -1, QCS404_PNOC_INT_0);
+DEFINE_QNODE(mas_qdss_bam, QCS404_MASTER_QDSS_BAM, 4, -1, -1, QCS404_SNOC_QDSS_INT);
+DEFINE_QNODE(mas_bimc_snoc, QCS404_BIMC_SNOC_MAS, 8, 21, -1, QCS404_SLAVE_OCMEM_64, QCS404_SLAVE_CATS_128, QCS404_SNOC_INT_0, QCS404_SNOC_INT_1);
+DEFINE_QNODE(mas_pcnoc_snoc, QCS404_PNOC_SNOC_MAS, 8, 29, -1, QCS404_SNOC_BIMC_1_SLV, QCS404_SNOC_INT_2, QCS404_SNOC_INT_0);
+DEFINE_QNODE(mas_qdss_etr, QCS404_MASTER_QDSS_ETR, 8, -1, -1, QCS404_SNOC_QDSS_INT);
+DEFINE_QNODE(mas_emac, QCS404_MASTER_EMAC, 8, -1, -1, QCS404_SNOC_BIMC_1_SLV, QCS404_SNOC_INT_1);
+DEFINE_QNODE(mas_pcie, QCS404_MASTER_PCIE, 8, -1, -1, QCS404_SNOC_BIMC_1_SLV, QCS404_SNOC_INT_1);
+DEFINE_QNODE(mas_usb3, QCS404_MASTER_USB3, 8, -1, -1, QCS404_SNOC_BIMC_1_SLV, QCS404_SNOC_INT_1);
+DEFINE_QNODE(pcnoc_int_0, QCS404_PNOC_INT_0, 8, 85, 114, QCS404_PNOC_SNOC_SLV, QCS404_PNOC_INT_2);
+DEFINE_QNODE(pcnoc_int_2, QCS404_PNOC_INT_2, 8, 124, 184, QCS404_PNOC_SLV_10, QCS404_SLAVE_TCU, QCS404_PNOC_SLV_11, QCS404_PNOC_SLV_2, QCS404_PNOC_SLV_3, QCS404_PNOC_SLV_0, QCS404_PNOC_SLV_1, QCS404_PNOC_SLV_6, QCS404_PNOC_SLV_7, QCS404_PNOC_SLV_4, QCS404_PNOC_SLV_8, QCS404_PNOC_SLV_9);
+DEFINE_QNODE(pcnoc_int_3, QCS404_PNOC_INT_3, 8, 125, 185, QCS404_PNOC_SNOC_SLV);
+DEFINE_QNODE(pcnoc_s_0, QCS404_PNOC_SLV_0, 4, 89, 118, QCS404_SLAVE_PRNG, QCS404_SLAVE_SPDM_WRAPPER, QCS404_SLAVE_PDM);
+DEFINE_QNODE(pcnoc_s_1, QCS404_PNOC_SLV_1, 4, 90, 119, QCS404_SLAVE_TCSR);
+DEFINE_QNODE(pcnoc_s_2, QCS404_PNOC_SLV_2, 4, -1, -1, QCS404_SLAVE_GRAPHICS_3D_CFG);
+DEFINE_QNODE(pcnoc_s_3, QCS404_PNOC_SLV_3, 4, 92, 121, QCS404_SLAVE_MESSAGE_RAM);
+DEFINE_QNODE(pcnoc_s_4, QCS404_PNOC_SLV_4, 4, 93, 122, QCS404_SLAVE_SNOC_CFG);
+DEFINE_QNODE(pcnoc_s_6, QCS404_PNOC_SLV_6, 4, 94, 123, QCS404_SLAVE_BLSP_1, QCS404_SLAVE_TLMM_NORTH, QCS404_SLAVE_EMAC_CFG);
+DEFINE_QNODE(pcnoc_s_7, QCS404_PNOC_SLV_7, 4, 95, 124, QCS404_SLAVE_TLMM_SOUTH, QCS404_SLAVE_DISPLAY_CFG, QCS404_SLAVE_SDCC_1, QCS404_SLAVE_PCIE_1, QCS404_SLAVE_SDCC_2);
+DEFINE_QNODE(pcnoc_s_8, QCS404_PNOC_SLV_8, 4, 96, 125, QCS404_SLAVE_CRYPTO_0_CFG);
+DEFINE_QNODE(pcnoc_s_9, QCS404_PNOC_SLV_9, 4, 97, 126, QCS404_SLAVE_BLSP_2, QCS404_SLAVE_TLMM_EAST, QCS404_SLAVE_PMIC_ARB);
+DEFINE_QNODE(pcnoc_s_10, QCS404_PNOC_SLV_10, 4, 157, -1, QCS404_SLAVE_USB_HS);
+DEFINE_QNODE(pcnoc_s_11, QCS404_PNOC_SLV_11, 4, 158, 246, QCS404_SLAVE_USB3);
+DEFINE_QNODE(qdss_int, QCS404_SNOC_QDSS_INT, 8, -1, -1, QCS404_SNOC_BIMC_1_SLV, QCS404_SNOC_INT_1);
+DEFINE_QNODE(snoc_int_0, QCS404_SNOC_INT_0, 8, 99, 130, QCS404_SLAVE_LPASS, QCS404_SLAVE_APPSS, QCS404_SLAVE_WCSS);
+DEFINE_QNODE(snoc_int_1, QCS404_SNOC_INT_1, 8, 100, 131, QCS404_SNOC_PNOC_SLV, QCS404_SNOC_INT_2);
+DEFINE_QNODE(snoc_int_2, QCS404_SNOC_INT_2, 8, 134, 197, QCS404_SLAVE_QDSS_STM, QCS404_SLAVE_OCIMEM);
+DEFINE_QNODE(slv_ebi, QCS404_SLAVE_EBI_CH0, 8, -1, 0, 0);
+DEFINE_QNODE(slv_bimc_snoc, QCS404_BIMC_SNOC_SLV, 8, -1, 2, QCS404_BIMC_SNOC_MAS);
+DEFINE_QNODE(slv_spdm, QCS404_SLAVE_SPDM_WRAPPER, 4, -1, -1, 0);
+DEFINE_QNODE(slv_pdm, QCS404_SLAVE_PDM, 4, -1, 41, 0);
+DEFINE_QNODE(slv_prng, QCS404_SLAVE_PRNG, 4, -1, 44, 0);
+DEFINE_QNODE(slv_tcsr, QCS404_SLAVE_TCSR, 4, -1, 50, 0);
+DEFINE_QNODE(slv_snoc_cfg, QCS404_SLAVE_SNOC_CFG, 4, -1, 70, 0);
+DEFINE_QNODE(slv_message_ram, QCS404_SLAVE_MESSAGE_RAM, 4, -1, 55, 0);
+DEFINE_QNODE(slv_disp_ss_cfg, QCS404_SLAVE_DISPLAY_CFG, 4, -1, -1, 0);
+DEFINE_QNODE(slv_gpu_cfg, QCS404_SLAVE_GRAPHICS_3D_CFG, 4, -1, -1, 0);
+DEFINE_QNODE(slv_blsp_1, QCS404_SLAVE_BLSP_1, 4, -1, 39, 0);
+DEFINE_QNODE(slv_tlmm_north, QCS404_SLAVE_TLMM_NORTH, 4, -1, 214, 0);
+DEFINE_QNODE(slv_pcie, QCS404_SLAVE_PCIE_1, 4, -1, -1, 0);
+DEFINE_QNODE(slv_ethernet, QCS404_SLAVE_EMAC_CFG, 4, -1, -1, 0);
+DEFINE_QNODE(slv_blsp_2, QCS404_SLAVE_BLSP_2, 4, -1, 37, 0);
+DEFINE_QNODE(slv_tlmm_east, QCS404_SLAVE_TLMM_EAST, 4, -1, 213, 0);
+DEFINE_QNODE(slv_tcu, QCS404_SLAVE_TCU, 8, -1, -1, 0);
+DEFINE_QNODE(slv_pmic_arb, QCS404_SLAVE_PMIC_ARB, 4, -1, 59, 0);
+DEFINE_QNODE(slv_sdcc_1, QCS404_SLAVE_SDCC_1, 4, -1, 31, 0);
+DEFINE_QNODE(slv_sdcc_2, QCS404_SLAVE_SDCC_2, 4, -1, 33, 0);
+DEFINE_QNODE(slv_tlmm_south, QCS404_SLAVE_TLMM_SOUTH, 4, -1, -1, 0);
+DEFINE_QNODE(slv_usb_hs, QCS404_SLAVE_USB_HS, 4, -1, 40, 0);
+DEFINE_QNODE(slv_usb3, QCS404_SLAVE_USB3, 4, -1, 22, 0);
+DEFINE_QNODE(slv_crypto_0_cfg, QCS404_SLAVE_CRYPTO_0_CFG, 4, -1, 52, 0);
+DEFINE_QNODE(slv_pcnoc_snoc, QCS404_PNOC_SNOC_SLV, 8, -1, 45, QCS404_PNOC_SNOC_MAS);
+DEFINE_QNODE(slv_kpss_ahb, QCS404_SLAVE_APPSS, 4, -1, -1, 0);
+DEFINE_QNODE(slv_wcss, QCS404_SLAVE_WCSS, 4, -1, 23, 0);
+DEFINE_QNODE(slv_snoc_bimc_1, QCS404_SNOC_BIMC_1_SLV, 8, -1, 104, QCS404_SNOC_BIMC_1_MAS);
+DEFINE_QNODE(slv_imem, QCS404_SLAVE_OCIMEM, 8, -1, 26, 0);
+DEFINE_QNODE(slv_snoc_pcnoc, QCS404_SNOC_PNOC_SLV, 8, -1, 28, QCS404_SNOC_PNOC_MAS);
+DEFINE_QNODE(slv_qdss_stm, QCS404_SLAVE_QDSS_STM, 4, -1, 30, 0);
+DEFINE_QNODE(slv_cats_0, QCS404_SLAVE_CATS_128, 16, -1, -1, 0);
+DEFINE_QNODE(slv_cats_1, QCS404_SLAVE_OCMEM_64, 8, -1, -1, 0);
+DEFINE_QNODE(slv_lpass, QCS404_SLAVE_LPASS, 4, -1, -1, 0);
+
+static struct qcom_icc_node *qcs404_bimc_nodes[] = {
+	[MASTER_AMPSS_M0] = &mas_apps_proc,
+	[MASTER_OXILI] = &mas_oxili,
+	[MASTER_MDP_PORT0] = &mas_mdp,
+	[MASTER_SNOC_BIMC_1] = &mas_snoc_bimc_1,
+	[MASTER_TCU_0] = &mas_tcu_0,
+	[SLAVE_EBI_CH0] = &slv_ebi,
+	[SLAVE_BIMC_SNOC] = &slv_bimc_snoc,
+};
+
+static struct qcom_icc_desc qcs404_bimc = {
+	.nodes = qcs404_bimc_nodes,
+	.num_nodes = ARRAY_SIZE(qcs404_bimc_nodes),
+};
+
+static struct qcom_icc_node *qcs404_pcnoc_nodes[] = {
+	[MASTER_SPDM] = &mas_spdm,
+	[MASTER_BLSP_1] = &mas_blsp_1,
+	[MASTER_BLSP_2] = &mas_blsp_2,
+	[MASTER_XI_USB_HS1] = &mas_xi_usb_hs1,
+	[MASTER_CRYPT0] = &mas_crypto,
+	[MASTER_SDCC_1] = &mas_sdcc_1,
+	[MASTER_SDCC_2] = &mas_sdcc_2,
+	[MASTER_SNOC_PCNOC] = &mas_snoc_pcnoc,
+	[MASTER_QPIC] = &mas_qpic,
+	[PCNOC_INT_0] = &pcnoc_int_0,
+	[PCNOC_INT_2] = &pcnoc_int_2,
+	[PCNOC_INT_3] = &pcnoc_int_3,
+	[PCNOC_S_0] = &pcnoc_s_0,
+	[PCNOC_S_1] = &pcnoc_s_1,
+	[PCNOC_S_2] = &pcnoc_s_2,
+	[PCNOC_S_3] = &pcnoc_s_3,
+	[PCNOC_S_4] = &pcnoc_s_4,
+	[PCNOC_S_6] = &pcnoc_s_6,
+	[PCNOC_S_7] = &pcnoc_s_7,
+	[PCNOC_S_8] = &pcnoc_s_8,
+	[PCNOC_S_9] = &pcnoc_s_9,
+	[PCNOC_S_10] = &pcnoc_s_10,
+	[PCNOC_S_11] = &pcnoc_s_11,
+	[SLAVE_SPDM] = &slv_spdm,
+	[SLAVE_PDM] = &slv_pdm,
+	[SLAVE_PRNG] = &slv_prng,
+	[SLAVE_TCSR] = &slv_tcsr,
+	[SLAVE_SNOC_CFG] = &slv_snoc_cfg,
+	[SLAVE_MESSAGE_RAM] = &slv_message_ram,
+	[SLAVE_DISP_SS_CFG] = &slv_disp_ss_cfg,
+	[SLAVE_GPU_CFG] = &slv_gpu_cfg,
+	[SLAVE_BLSP_1] = &slv_blsp_1,
+	[SLAVE_BLSP_2] = &slv_blsp_2,
+	[SLAVE_TLMM_NORTH] = &slv_tlmm_north,
+	[SLAVE_PCIE] = &slv_pcie,
+	[SLAVE_ETHERNET] = &slv_ethernet,
+	[SLAVE_TLMM_EAST] = &slv_tlmm_east,
+	[SLAVE_TCU] = &slv_tcu,
+	[SLAVE_PMIC_ARB] = &slv_pmic_arb,
+	[SLAVE_SDCC_1] = &slv_sdcc_1,
+	[SLAVE_SDCC_2] = &slv_sdcc_2,
+	[SLAVE_TLMM_SOUTH] = &slv_tlmm_south,
+	[SLAVE_USB_HS] = &slv_usb_hs,
+	[SLAVE_USB3] = &slv_usb3,
+	[SLAVE_CRYPTO_0_CFG] = &slv_crypto_0_cfg,
+	[SLAVE_PCNOC_SNOC] = &slv_pcnoc_snoc,
+};
+
+static struct qcom_icc_desc qcs404_pcnoc = {
+	.nodes = qcs404_pcnoc_nodes,
+	.num_nodes = ARRAY_SIZE(qcs404_pcnoc_nodes),
+};
+
+static struct qcom_icc_node *qcs404_snoc_nodes[] = {
+	[MASTER_QDSS_BAM] = &mas_qdss_bam,
+	[MASTER_BIMC_SNOC] = &mas_bimc_snoc,
+	[MASTER_PCNOC_SNOC] = &mas_pcnoc_snoc,
+	[MASTER_QDSS_ETR] = &mas_qdss_etr,
+	[MASTER_EMAC] = &mas_emac,
+	[MASTER_PCIE] = &mas_pcie,
+	[MASTER_USB3] = &mas_usb3,
+	[QDSS_INT] = &qdss_int,
+	[SNOC_INT_0] = &snoc_int_0,
+	[SNOC_INT_1] = &snoc_int_1,
+	[SNOC_INT_2] = &snoc_int_2,
+	[SLAVE_KPSS_AHB] = &slv_kpss_ahb,
+	[SLAVE_WCSS] = &slv_wcss,
+	[SLAVE_SNOC_BIMC_1] = &slv_snoc_bimc_1,
+	[SLAVE_IMEM] = &slv_imem,
+	[SLAVE_SNOC_PCNOC] = &slv_snoc_pcnoc,
+	[SLAVE_QDSS_STM] = &slv_qdss_stm,
+	[SLAVE_CATS_0] = &slv_cats_0,
+	[SLAVE_CATS_1] = &slv_cats_1,
+	[SLAVE_LPASS] = &slv_lpass,
+};
+
+static struct qcom_icc_desc qcs404_snoc = {
+	.nodes = qcs404_snoc_nodes,
+	.num_nodes = ARRAY_SIZE(qcs404_snoc_nodes),
+};
+
+static int qcom_icc_aggregate(struct icc_node *node, u32 avg_bw, u32 peak_bw,
+			      u32 *agg_avg, u32 *agg_peak)
+{
+	*agg_avg += avg_bw;
+	*agg_peak = max(*agg_peak, peak_bw);
+
+	return 0;
+}
+
+static int qcom_icc_set(struct icc_node *src, struct icc_node *dst)
+{
+	struct qcom_icc_provider *qp;
+	struct qcom_icc_node *qn;
+	struct icc_provider *provider;
+	struct icc_node *n;
+	u64 sum_bw;
+	u64 max_peak_bw;
+	u64 rate;
+	u32 agg_avg = 0;
+	u32 agg_peak = 0;
+	int ret, i;
+
+	qn = src->data;
+	provider = src->provider;
+	qp = to_qcom_provider(provider);
+
+	list_for_each_entry(n, &provider->nodes, node_list)
+		qcom_icc_aggregate(n, n->avg_bw, n->peak_bw,
+				   &agg_avg, &agg_peak);
+
+	sum_bw = icc_units_to_bps(agg_avg);
+	max_peak_bw = icc_units_to_bps(agg_peak);
+
+	/* send bandwidth request message to the RPM processor */
+	if (qn->mas_rpm_id != -1) {
+		ret = qcom_icc_rpm_smd_send(QCOM_SMD_RPM_ACTIVE_STATE,
+					    RPM_BUS_MASTER_REQ,
+					    qn->mas_rpm_id,
+					    sum_bw);
+		if (ret) {
+			pr_err("qcom_icc_rpm_smd_send mas %d error %d\n",
+			       qn->mas_rpm_id, ret);
+			return ret;
+		}
+	}
+
+	if (qn->slv_rpm_id != -1) {
+		ret = qcom_icc_rpm_smd_send(QCOM_SMD_RPM_ACTIVE_STATE,
+					    RPM_BUS_SLAVE_REQ,
+					    qn->slv_rpm_id,
+					    sum_bw);
+		if (ret) {
+			pr_err("qcom_icc_rpm_smd_send slv error %d\n",
+			       ret);
+			return ret;
+		}
+	}
+
+	rate = max(sum_bw, max_peak_bw);
+
+	do_div(rate, qn->buswidth);
+
+	if (qn->rate == rate)
+		return 0;
+
+	for (i = 0; i < qp->num_clks; i++) {
+		ret = clk_set_rate(qp->bus_clks[i].clk, rate);
+		if (ret) {
+			pr_err("%s clk_set_rate error: %d\n",
+			       qp->bus_clks[i].id, ret);
+			return ret;
+		}
+	}
+
+	qn->rate = rate;
+
+	return 0;
+}
+
+static int qnoc_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	const struct qcom_icc_desc *desc;
+	struct icc_onecell_data *data;
+	struct icc_provider *provider;
+	struct qcom_icc_node **qnodes;
+	struct qcom_icc_provider *qp;
+	struct icc_node *node;
+	size_t num_nodes, i;
+	int ret;
+
+	/* wait for the RPM proxy */
+	if (!qcom_icc_rpm_smd_available())
+		return -EPROBE_DEFER;
+
+	desc = of_device_get_match_data(dev);
+	if (!desc)
+		return -EINVAL;
+
+	qnodes = desc->nodes;
+	num_nodes = desc->num_nodes;
+
+	qp = devm_kzalloc(dev, sizeof(*qp), GFP_KERNEL);
+	if (!qp)
+		return -ENOMEM;
+
+	data = devm_kcalloc(dev, num_nodes, sizeof(*node), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	qp->bus_clks = devm_kmemdup(dev, bus_clocks, sizeof(bus_clocks),
+				    GFP_KERNEL);
+	if (!qp->bus_clks)
+		return -ENOMEM;
+
+	qp->num_clks = ARRAY_SIZE(bus_clocks);
+	ret = devm_clk_bulk_get(dev, qp->num_clks, qp->bus_clks);
+	if (ret)
+		return ret;
+
+	ret = clk_bulk_prepare_enable(qp->num_clks, qp->bus_clks);
+	if (ret)
+		return ret;
+
+	provider = &qp->provider;
+	INIT_LIST_HEAD(&provider->nodes);
+	provider->dev = dev;
+	provider->set = qcom_icc_set;
+	provider->aggregate = qcom_icc_aggregate;
+	provider->xlate = of_icc_xlate_onecell;
+	provider->data = data;
+
+	ret = icc_provider_add(provider);
+	if (ret) {
+		dev_err(dev, "error adding interconnect provider: %d\n", ret);
+		clk_bulk_disable_unprepare(qp->num_clks, qp->bus_clks);
+		return ret;
+	}
+
+	for (i = 0; i < num_nodes; i++) {
+		size_t j;
+
+		node = icc_node_create(qnodes[i]->id);
+		if (IS_ERR(node)) {
+			ret = PTR_ERR(node);
+			goto err;
+		}
+
+		node->name = qnodes[i]->name;
+		node->data = qnodes[i];
+		icc_node_add(node, provider);
+
+		dev_dbg(dev, "registered node %s\n", node->name);
+
+		/* populate links */
+		for (j = 0; j < qnodes[i]->num_links; j++)
+			icc_link_create(node, qnodes[i]->links[j]);
+
+		data->nodes[i] = node;
+	}
+	data->num_nodes = num_nodes;
+
+	platform_set_drvdata(pdev, qp);
+
+	return 0;
+err:
+	list_for_each_entry(node, &provider->nodes, node_list) {
+		icc_node_del(node);
+		icc_node_destroy(node->id);
+	}
+	clk_bulk_disable_unprepare(qp->num_clks, qp->bus_clks);
+	icc_provider_del(provider);
+
+	return ret;
+}
+
+static int qnoc_remove(struct platform_device *pdev)
+{
+	struct qcom_icc_provider *qp = platform_get_drvdata(pdev);
+	struct icc_provider *provider = &qp->provider;
+	struct icc_node *n;
+
+	list_for_each_entry(n, &provider->nodes, node_list) {
+		icc_node_del(n);
+		icc_node_destroy(n->id);
+	}
+	clk_bulk_disable_unprepare(qp->num_clks, qp->bus_clks);
+
+	return icc_provider_del(provider);
+}
+
+static const struct of_device_id qcs404_noc_of_match[] = {
+	{ .compatible = "qcom,qcs404-bimc", .data = &qcs404_bimc },
+	{ .compatible = "qcom,qcs404-pcnoc", .data = &qcs404_pcnoc },
+	{ .compatible = "qcom,qcs404-snoc", .data = &qcs404_snoc },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, qcs404_noc_of_match);
+
+static struct platform_driver qcs404_noc_driver = {
+	.probe = qnoc_probe,
+	.remove = qnoc_remove,
+	.driver = {
+		.name = "qnoc-qcs404",
+		.of_match_table = qcs404_noc_of_match,
+	},
+};
+module_platform_driver(qcs404_noc_driver);
+MODULE_DESCRIPTION("Qualcomm QCS404 NoC driver");
+MODULE_LICENSE("GPL v2");
