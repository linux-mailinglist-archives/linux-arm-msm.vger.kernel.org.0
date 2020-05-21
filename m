Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D61B1DC88A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2020 10:30:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728629AbgEUIaA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 May 2020 04:30:00 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:35125 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728613AbgEUIaA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 May 2020 04:30:00 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1590049799; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=U1CUtvdi3fwl78KDpp7X1exapewuahOBLvW8LlFhpH0=; b=s16TYQJ99Fzv6qm1GBf8ltGzqFxw/uSHSq+ULoUh8A5eEz1kOtfDYPU+T/MCbmf17Ga1Dkv6
 dkcQwOu381Tf5Iy+OyqGMj0ho0ZpnftxrE0qsmonjn0A7hIdkPrgBGcINxEL5wqA77oQwZ9z
 aeuS+FJ907eEYl0jNNTppwBigIM=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ec63c06.7fad27ea72d0-smtp-out-n03;
 Thu, 21 May 2020 08:29:58 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 29AA9C433C6; Thu, 21 May 2020 08:29:58 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from akashast-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id ABCBBC43387;
        Thu, 21 May 2020 08:29:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org ABCBBC43387
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=akashast@codeaurora.org
From:   Akash Asthana <akashast@codeaurora.org>
To:     gregkh@linuxfoundation.org, agross@kernel.org,
        bjorn.andersson@linaro.org, wsa@the-dreams.de, broonie@kernel.org,
        mark.rutland@arm.com, robh+dt@kernel.org
Cc:     linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, swboyd@chromium.org,
        mgautam@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, mka@chromium.org,
        dianders@chromium.org, msavaliy@codeaurora.org,
        evgreen@chromium.org, Akash Asthana <akashast@codeaurora.org>
Subject: [PATCH V6 1/7] soc: qcom: geni: Support for ICC voting
Date:   Thu, 21 May 2020 13:59:18 +0530
Message-Id: <1590049764-20912-2-git-send-email-akashast@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1590049764-20912-1-git-send-email-akashast@codeaurora.org>
References: <1590049764-20912-1-git-send-email-akashast@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add necessary macros and structure variables to support ICC BW
voting from individual SE drivers.

Signed-off-by: Akash Asthana <akashast@codeaurora.org>
Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
---
Changes in V2:
 - As per Bjorn's comment dropped enums for ICC paths, given the three
   paths individual members

Changes in V3:
 - Add geni_icc_get, geni_icc_vote_on and geni_icc_vote_off as helper API.
 - Add geni_icc_path structure in common header

Changes in V4:
 - As per Bjorn's comment print error message in geni_icc_get if return
   value is not -EPROBE_DEFER.
 - As per Bjorn's comment remove NULL on path before calling icc_set_bw
   API.
 - As per Bjorn's comment drop __func__ print.
 - As per Matthias's comment, make ICC path a array instead of individual
   member entry in geni_se struct.

Changes in V5:
 - As per Matthias's comment defined enums for ICC paths.
 - Integrate icc_enable/disable with power on/off call for driver.
 - As per Matthias's comment added icc_path_names array to print icc path name
   in failure case.
 - As per Georgi's suggestion assume peak_bw = avg_bw if not mentioned.

Changes in V6:
 - Addressed nitpicks from Matthias.

Note: I have ignored below check patch suggestion because it was throwing
      compilation error as 'icc_ddr' is not compile time comstant.

WARNING: char * array declaration might be better as static const
 - FILE: drivers/soc/qcom/qcom-geni-se.c:726:
 - const char *icc_names[] = {"qup-core", "qup-config", icc_ddr};

 drivers/soc/qcom/qcom-geni-se.c | 92 +++++++++++++++++++++++++++++++++++++++++
 include/linux/qcom-geni-se.h    | 42 +++++++++++++++++++
 2 files changed, 134 insertions(+)

diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
index 7d622ea..0b2526d 100644
--- a/drivers/soc/qcom/qcom-geni-se.c
+++ b/drivers/soc/qcom/qcom-geni-se.c
@@ -92,6 +92,9 @@ struct geni_wrapper {
 	struct clk_bulk_data ahb_clks[NUM_AHB_CLKS];
 };
 
+static const char * const icc_path_names[] = {"qup-core", "qup-config",
+						"qup-memory"};
+
 #define QUP_HW_VER_REG			0x4
 
 /* Common SE registers */
@@ -720,6 +723,95 @@ void geni_se_rx_dma_unprep(struct geni_se *se, dma_addr_t iova, size_t len)
 }
 EXPORT_SYMBOL(geni_se_rx_dma_unprep);
 
+int geni_icc_get(struct geni_se *se, const char *icc_ddr)
+{
+	int i, err;
+	const char *icc_names[] = {"qup-core", "qup-config", icc_ddr};
+
+	for (i = 0; i < ARRAY_SIZE(se->icc_paths); i++) {
+		if (!icc_names[i])
+			continue;
+
+		se->icc_paths[i].path = devm_of_icc_get(se->dev, icc_names[i]);
+		if (IS_ERR(se->icc_paths[i].path))
+			goto err;
+	}
+
+	return 0;
+
+err:
+	err = PTR_ERR(se->icc_paths[i].path);
+	if (err != -EPROBE_DEFER)
+		dev_err_ratelimited(se->dev, "Failed to get ICC path:%s :%d\n",
+					icc_names[i], err);
+	return err;
+
+}
+EXPORT_SYMBOL(geni_icc_get);
+
+void geni_icc_bw_init(struct geni_icc_path *icc_paths, unsigned int avg_bw,
+			unsigned int peak_bw)
+{
+	if (!peak_bw)
+		peak_bw = avg_bw;
+	icc_paths->avg_bw = avg_bw;
+	icc_paths->peak_bw = peak_bw;
+}
+EXPORT_SYMBOL(geni_icc_bw_init);
+
+int geni_icc_set_bw(struct geni_se *se)
+{
+	int i, ret;
+
+	for (i = 0; i < ARRAY_SIZE(se->icc_paths); i++) {
+		ret = icc_set_bw(se->icc_paths[i].path,
+			se->icc_paths[i].avg_bw, se->icc_paths[i].peak_bw);
+		if (ret) {
+			dev_err_ratelimited(se->dev, "ICC BW voting failed on path:%s :%d\n",
+					icc_path_names[i], ret);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(geni_icc_set_bw);
+
+/* To do: Replace this by icc_bulk_enable once it's implemented in ICC core */
+int geni_icc_enable(struct geni_se *se)
+{
+	int i, ret;
+
+	for (i = 0; i < ARRAY_SIZE(se->icc_paths); i++) {
+		ret = icc_enable(se->icc_paths[i].path);
+		if (ret) {
+			dev_err_ratelimited(se->dev, "ICC enable failed on path:%s :%d\n",
+					icc_path_names[i], ret);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(geni_icc_enable);
+
+int geni_icc_disable(struct geni_se *se)
+{
+	int i, ret;
+
+	for (i = 0; i < ARRAY_SIZE(se->icc_paths); i++) {
+		ret = icc_disable(se->icc_paths[i].path);
+		if (ret) {
+			dev_err_ratelimited(se->dev, "ICC disable failed on path:%s :%d\n",
+					icc_path_names[i], ret);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(geni_icc_disable);
+
 static int geni_se_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
diff --git a/include/linux/qcom-geni-se.h b/include/linux/qcom-geni-se.h
index dd46494..7afa08d 100644
--- a/include/linux/qcom-geni-se.h
+++ b/include/linux/qcom-geni-se.h
@@ -6,6 +6,8 @@
 #ifndef _LINUX_QCOM_GENI_SE
 #define _LINUX_QCOM_GENI_SE
 
+#include <linux/interconnect.h>
+
 /* Transfer mode supported by GENI Serial Engines */
 enum geni_se_xfer_mode {
 	GENI_SE_INVALID,
@@ -25,6 +27,18 @@ enum geni_se_protocol_type {
 struct geni_wrapper;
 struct clk;
 
+enum geni_icc_path_index {
+	GENI_TO_CORE,
+	CPU_TO_GENI,
+	GENI_TO_DDR
+};
+
+struct geni_icc_path {
+	struct icc_path *path;
+	unsigned int avg_bw;
+	unsigned int peak_bw;
+};
+
 /**
  * struct geni_se - GENI Serial Engine
  * @base:		Base Address of the Serial Engine's register block
@@ -33,6 +47,7 @@ struct clk;
  * @clk:		Handle to the core serial engine clock
  * @num_clk_levels:	Number of valid clock levels in clk_perf_tbl
  * @clk_perf_tbl:	Table of clock frequency input to serial engine clock
+ * @icc_paths:		Array of ICC paths for SE
  */
 struct geni_se {
 	void __iomem *base;
@@ -41,6 +56,7 @@ struct geni_se {
 	struct clk *clk;
 	unsigned int num_clk_levels;
 	unsigned long *clk_perf_tbl;
+	struct geni_icc_path icc_paths[3];
 };
 
 /* Common SE registers */
@@ -229,6 +245,21 @@ struct geni_se {
 #define GENI_SE_VERSION_MINOR(ver) ((ver & HW_VER_MINOR_MASK) >> HW_VER_MINOR_SHFT)
 #define GENI_SE_VERSION_STEP(ver) (ver & HW_VER_STEP_MASK)
 
+/*
+ * Define bandwidth thresholds that cause the underlying Core 2X interconnect
+ * clock to run at the named frequency. These baseline values are recommended
+ * by the hardware team, and are not dynamically scaled with GENI bandwidth
+ * beyond basic on/off.
+ */
+#define CORE_2X_19_2_MHZ		960
+#define CORE_2X_50_MHZ			2500
+#define CORE_2X_100_MHZ			5000
+#define CORE_2X_150_MHZ			7500
+#define CORE_2X_200_MHZ			10000
+#define CORE_2X_236_MHZ			16383
+
+#define GENI_DEFAULT_BW			Bps_to_icc(1000)
+
 #if IS_ENABLED(CONFIG_QCOM_GENI_SE)
 
 u32 geni_se_get_qup_hw_version(struct geni_se *se);
@@ -416,5 +447,16 @@ int geni_se_rx_dma_prep(struct geni_se *se, void *buf, size_t len,
 void geni_se_tx_dma_unprep(struct geni_se *se, dma_addr_t iova, size_t len);
 
 void geni_se_rx_dma_unprep(struct geni_se *se, dma_addr_t iova, size_t len);
+
+int geni_icc_get(struct geni_se *se, const char *icc_ddr);
+
+int geni_icc_set_bw(struct geni_se *se);
+
+void geni_icc_bw_init(struct geni_icc_path *icc_paths, unsigned int avg_bw,
+			unsigned int peak_bw);
+
+int geni_icc_enable(struct geni_se *se);
+
+int geni_icc_disable(struct geni_se *se);
 #endif
 #endif
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project
