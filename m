Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 446821D7ADF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2020 16:17:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727944AbgERORJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 May 2020 10:17:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726998AbgERORJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 May 2020 10:17:09 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 703DEC061A0C
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2020 07:17:09 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id f4so4847050pgi.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2020 07:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=W3AJP+K6AJWkLLQOo9n4PqYM8LSyyANs3tFVvvOywL0=;
        b=RGQGUk/tfqqGuNXaGCxWTAJNAvEYjiPagQiljTFsC+DRC//qRlcq2CWGWMvHiXJihY
         9uxXBWzoPBe6/fy7ptegsd0TVwq2SL2047RWsMNmixmgsDCE6Nu8PWqddaBuxacnLzq1
         BApJwnG7ysiu3yG4rkBPROgngJtLEhJCGnY1PTcdYMcD/2uNrL59mmwmMcB6pqD/28kv
         7ou+8yie54wvh8+oBAVgWAI1RsEILuVQDtIwbY89Eo8MM2R2DLKTr+pI/rKTFDwf+thB
         hUXJZ5MAhsYufcndvkOLf0IBzdTpuhN3Q7SnhKQ3wZoug1lziVjcDnVeA/fHAbAtCCuV
         7ofg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=W3AJP+K6AJWkLLQOo9n4PqYM8LSyyANs3tFVvvOywL0=;
        b=kN5ftk5T2YMMM7AiJ9ewyUPkvfGASFL842yZ9ZV5A/EBD+qnd0w5n8x5+79E2NCXD+
         AtdxskmF3EYOxe4Lv1IqSyBi34JaCzNs5IWfenoXK3KNfWccM3S2+q9TEbiZN2w0PYEO
         BYuVQDcJ1PCqzAWIThuqkWG3iWVKRXWqMdST/M0MURB7hfzRcahFqoYqbRcwdm8PkZYd
         jcubqRhhTNdlO5eOzmTFqUKucTrLKFWhmTF71KbOU45U2x+PqOasSf3PuUacMSQaGcb8
         E2QPYguFDjkU3WbnTcIKLCZchn+k1pLkcC5Pqg9oG1BQBmlsohstLu2uGrBEpgNYQ2Sk
         URAw==
X-Gm-Message-State: AOAM530rJvvTMTcDQA7V4R78fHr2C7cqHckHm6q01TwFpQKA8+te4LUH
        c4IffzlKACjRrMEzUDSXG3ftVw==
X-Google-Smtp-Source: ABdhPJyB3kYEFH6mVDkfhufF/BWyyWJtV7hYZRoT5slsf4JckFiNnVBK34o/hvILNZSnTXLimy+Xkw==
X-Received: by 2002:a65:4c41:: with SMTP id l1mr15489284pgr.43.1589811428911;
        Mon, 18 May 2020 07:17:08 -0700 (PDT)
Received: from localhost.localdomain ([80.251.214.228])
        by smtp.gmail.com with ESMTPSA id d184sm8730925pfc.130.2020.05.18.07.17.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 07:17:08 -0700 (PDT)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Joerg Roedel <joro@8bytes.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Konrad Dybcio <konradybcio@gmail.com>,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux-foundation.org,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH v2] iommu/qcom: add optional 'tbu' clock for TLB invalidate
Date:   Mon, 18 May 2020 22:16:56 +0800
Message-Id: <20200518141656.26284-1-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On some SoCs like MSM8939 with A405 adreno, there is a gfx_tbu clock
needs to be on while doing TLB invalidate. Otherwise, TLBSYNC status
will not be correctly reflected, causing the system to go into a bad
state.  Add it as an optional clock, so that platforms that have this
clock can pass it over DT.

While adding the third clock, let's switch to bulk clk API to simplify
the enable/disable calls.  clk_bulk_get() cannot used because the
existing two clocks are required while the new one is optional.

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
Changes for v2:
 - Use devm_clk_get_optional() to simplify code and improve readability.
 - Rename the new clock from 'tlb' to 'tbu'.
 - qcom_iommu: use bulk clk API to simplfy enable/disable.

 drivers/iommu/qcom_iommu.c | 62 ++++++++++++++++----------------------
 1 file changed, 26 insertions(+), 36 deletions(-)

diff --git a/drivers/iommu/qcom_iommu.c b/drivers/iommu/qcom_iommu.c
index 0e2a96467767..116d8188f87f 100644
--- a/drivers/iommu/qcom_iommu.c
+++ b/drivers/iommu/qcom_iommu.c
@@ -37,14 +37,20 @@
 
 #define SMMU_INTR_SEL_NS     0x2000
 
+enum qcom_iommu_clk {
+	CLK_IFACE,
+	CLK_BUS,
+	CLK_TBU,
+	CLK_NUM,
+};
+
 struct qcom_iommu_ctx;
 
 struct qcom_iommu_dev {
 	/* IOMMU core code handle */
 	struct iommu_device	 iommu;
 	struct device		*dev;
-	struct clk		*iface_clk;
-	struct clk		*bus_clk;
+	struct clk_bulk_data clks[CLK_NUM];
 	void __iomem		*local_base;
 	u32			 sec_id;
 	u8			 num_ctxs;
@@ -626,32 +632,6 @@ static const struct iommu_ops qcom_iommu_ops = {
 	.pgsize_bitmap	= SZ_4K | SZ_64K | SZ_1M | SZ_16M,
 };
 
-static int qcom_iommu_enable_clocks(struct qcom_iommu_dev *qcom_iommu)
-{
-	int ret;
-
-	ret = clk_prepare_enable(qcom_iommu->iface_clk);
-	if (ret) {
-		dev_err(qcom_iommu->dev, "Couldn't enable iface_clk\n");
-		return ret;
-	}
-
-	ret = clk_prepare_enable(qcom_iommu->bus_clk);
-	if (ret) {
-		dev_err(qcom_iommu->dev, "Couldn't enable bus_clk\n");
-		clk_disable_unprepare(qcom_iommu->iface_clk);
-		return ret;
-	}
-
-	return 0;
-}
-
-static void qcom_iommu_disable_clocks(struct qcom_iommu_dev *qcom_iommu)
-{
-	clk_disable_unprepare(qcom_iommu->bus_clk);
-	clk_disable_unprepare(qcom_iommu->iface_clk);
-}
-
 static int qcom_iommu_sec_ptbl_init(struct device *dev)
 {
 	size_t psize = 0;
@@ -808,6 +788,7 @@ static int qcom_iommu_device_probe(struct platform_device *pdev)
 	struct qcom_iommu_dev *qcom_iommu;
 	struct device *dev = &pdev->dev;
 	struct resource *res;
+	struct clk *clk;
 	int ret, max_asid = 0;
 
 	/* find the max asid (which is 1:1 to ctx bank idx), so we know how
@@ -827,17 +808,26 @@ static int qcom_iommu_device_probe(struct platform_device *pdev)
 	if (res)
 		qcom_iommu->local_base = devm_ioremap_resource(dev, res);
 
-	qcom_iommu->iface_clk = devm_clk_get(dev, "iface");
-	if (IS_ERR(qcom_iommu->iface_clk)) {
+	clk = devm_clk_get(dev, "iface");
+	if (IS_ERR(clk)) {
 		dev_err(dev, "failed to get iface clock\n");
-		return PTR_ERR(qcom_iommu->iface_clk);
+		return PTR_ERR(clk);
 	}
+	qcom_iommu->clks[CLK_IFACE].clk = clk;
 
-	qcom_iommu->bus_clk = devm_clk_get(dev, "bus");
-	if (IS_ERR(qcom_iommu->bus_clk)) {
+	clk = devm_clk_get(dev, "bus");
+	if (IS_ERR(clk)) {
 		dev_err(dev, "failed to get bus clock\n");
-		return PTR_ERR(qcom_iommu->bus_clk);
+		return PTR_ERR(clk);
+	}
+	qcom_iommu->clks[CLK_BUS].clk = clk;
+
+	clk = devm_clk_get_optional(dev, "tbu");
+	if (IS_ERR(clk)) {
+		dev_err(dev, "failed to get tbu clock\n");
+		return PTR_ERR(clk);
 	}
+	qcom_iommu->clks[CLK_TBU].clk = clk;
 
 	if (of_property_read_u32(dev->of_node, "qcom,iommu-secure-id",
 				 &qcom_iommu->sec_id)) {
@@ -909,14 +899,14 @@ static int __maybe_unused qcom_iommu_resume(struct device *dev)
 {
 	struct qcom_iommu_dev *qcom_iommu = dev_get_drvdata(dev);
 
-	return qcom_iommu_enable_clocks(qcom_iommu);
+	return clk_bulk_prepare_enable(CLK_NUM, qcom_iommu->clks);
 }
 
 static int __maybe_unused qcom_iommu_suspend(struct device *dev)
 {
 	struct qcom_iommu_dev *qcom_iommu = dev_get_drvdata(dev);
 
-	qcom_iommu_disable_clocks(qcom_iommu);
+	clk_bulk_disable_unprepare(CLK_NUM, qcom_iommu->clks);
 
 	return 0;
 }
-- 
2.17.1

