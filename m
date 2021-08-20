Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E28D23F3543
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Aug 2021 22:31:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239847AbhHTUcC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Aug 2021 16:32:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240076AbhHTUb7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Aug 2021 16:31:59 -0400
Received: from relay05.th.seeweb.it (relay05.th.seeweb.it [IPv6:2001:4b7a:2000:18::166])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A459AC06175F
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Aug 2021 13:31:21 -0700 (PDT)
Received: from localhost.localdomain (83.6.167.97.neoplus.adsl.tpnet.pl [83.6.167.97])
        by m-r2.th.seeweb.it (Postfix) with ESMTPA id 35A3F3F319;
        Fri, 20 Aug 2021 22:31:19 +0200 (CEST)
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
To:     ~postmarketos/upstreaming@lists.sr.ht
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 5/6] soc: qcom: llcc: Add configuration data for SM6350
Date:   Fri, 20 Aug 2021 22:31:04 +0200
Message-Id: <20210820203105.229764-6-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210820203105.229764-1-konrad.dybcio@somainline.org>
References: <20210820203105.229764-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add LLCC configuration data for SM6350 SoC.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 drivers/soc/qcom/llcc-qcom.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
index 15a36dcab990..fb471cc4066b 100644
--- a/drivers/soc/qcom/llcc-qcom.c
+++ b/drivers/soc/qcom/llcc-qcom.c
@@ -142,6 +142,16 @@ static const struct llcc_slice_config sdm845_data[] =  {
 	{ LLCC_AUDHW,    22, 1024, 1, 1, 0xffc, 0x2,   0, 0, 1, 1, 0 },
 };
 
+static const struct llcc_slice_config sm6350_data[] =  {
+	{ LLCC_CPUSS,    1,  768, 1, 0, 0xFFF, 0x0, 0, 0, 0, 0, 1, 1 },
+	{ LLCC_MDM,      8,  512, 2, 0, 0xFFF, 0x0, 0, 0, 0, 0, 1, 0 },
+	{ LLCC_GPUHTW,   11, 256, 1, 0, 0xFFF, 0x0, 0, 0, 0, 0, 1, 0 },
+	{ LLCC_GPU,      12, 512, 1, 0, 0xFFF, 0x0, 0, 0, 0, 0, 1, 0 },
+	{ LLCC_MDMPNG,   21, 768, 0, 1, 0xFFF, 0x0, 0, 0, 0, 0, 1, 0 },
+	{ LLCC_NPU,      23, 768, 1, 0, 0xFFF, 0x0, 0, 0, 0, 0, 1, 0 },
+	{ LLCC_MODPE,    29,  64, 1, 1, 0xFFF, 0x0, 0, 0, 0, 0, 1, 0 },
+};
+
 static const struct llcc_slice_config sm8150_data[] =  {
 	{  LLCC_CPUSS,    1, 3072, 1, 1, 0xFFF, 0x0,   0, 0, 0, 1, 1 },
 	{  LLCC_VIDSC0,   2, 512,  2, 1, 0xFFF, 0x0,   0, 0, 0, 1, 0 },
@@ -203,6 +213,11 @@ static const struct qcom_llcc_config sdm845_cfg = {
 	.need_llcc_cfg	= false,
 };
 
+static const struct qcom_llcc_config sm6350_cfg = {
+	.sct_data	= sm6350_data,
+	.size		= ARRAY_SIZE(sm6350_data),
+};
+
 static const struct qcom_llcc_config sm8150_cfg = {
 	.sct_data       = sm8150_data,
 	.size           = ARRAY_SIZE(sm8150_data),
@@ -626,6 +641,7 @@ static const struct of_device_id qcom_llcc_of_match[] = {
 	{ .compatible = "qcom,sc7180-llcc", .data = &sc7180_cfg },
 	{ .compatible = "qcom,sc7280-llcc", .data = &sc7280_cfg },
 	{ .compatible = "qcom,sdm845-llcc", .data = &sdm845_cfg },
+	{ .compatible = "qcom,sm6350-llcc", .data = &sm6350_cfg },
 	{ .compatible = "qcom,sm8150-llcc", .data = &sm8150_cfg },
 	{ .compatible = "qcom,sm8250-llcc", .data = &sm8250_cfg },
 	{ }
-- 
2.33.0

