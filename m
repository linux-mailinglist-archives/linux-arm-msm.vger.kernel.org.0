Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86A2A44F623
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Nov 2021 02:30:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231720AbhKNBcx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 13 Nov 2021 20:32:53 -0500
Received: from relay08.th.seeweb.it ([5.144.164.169]:49085 "EHLO
        relay08.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233544AbhKNBcw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 13 Nov 2021 20:32:52 -0500
Received: from localhost.localdomain (83.6.165.118.neoplus.adsl.tpnet.pl [83.6.165.118])
        by m-r2.th.seeweb.it (Postfix) with ESMTPA id 9D8E33EBC6;
        Sun, 14 Nov 2021 02:29:57 +0100 (CET)
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
To:     ~postmarketos/upstreaming@lists.sr.ht
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] soc: qcom: llcc: Add configuration data for SM8350
Date:   Sun, 14 Nov 2021 02:29:39 +0100
Message-Id: <20211114012940.112864-2-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211114012940.112864-1-konrad.dybcio@somainline.org>
References: <20211114012940.112864-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add LLCC configuration data for SM8350 SoC.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 drivers/soc/qcom/llcc-qcom.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
index 6bf2f1d1f2c5..ec52f29c8867 100644
--- a/drivers/soc/qcom/llcc-qcom.c
+++ b/drivers/soc/qcom/llcc-qcom.c
@@ -195,6 +195,28 @@ static const struct llcc_slice_config sm8250_data[] =  {
 	{ LLCC_WRCACHE, 31, 256,  1, 1, 0xfff, 0x0, 0, 0, 0, 0, 1, 0 },
 };
 
+static const struct llcc_slice_config sm8350_data[] =  {
+	{ LLCC_CPUSS,    1, 3072,  1, 1, 0xfff, 0x0, 0, 0, 0, 0, 1, 1 },
+	{ LLCC_VIDSC0,   2, 512,   3, 1, 0xfff, 0x0, 0, 0, 0, 0, 1, 0 },
+	{ LLCC_AUDIO,    6, 1024,  1, 1, 0xfff, 0x0, 0, 0, 0, 0, 0, 0 },
+	{ LLCC_MDMHPGRW, 7, 1024,  3, 0, 0xfff, 0x0, 0, 0, 0, 0, 1, 0 },
+	{ LLCC_MODHW,    9, 1024,  1, 1, 0xfff, 0x0, 0, 0, 0, 0, 1, 0 },
+	{ LLCC_CMPT,     10, 3072, 1, 1, 0xfff, 0x0, 0, 0, 0, 0, 1, 0 },
+	{ LLCC_GPUHTW,   11, 1024, 1, 1, 0xfff, 0x0, 0, 0, 0, 0, 1, 0 },
+	{ LLCC_GPU,      12, 1024, 1, 0, 0xfff, 0x0, 0, 0, 0, 1, 1, 0 },
+	{ LLCC_MMUHWT,   13, 1024, 1, 1, 0xfff, 0x0, 0, 0, 0, 0, 0, 1 },
+	{ LLCC_DISP,     16, 3072, 2, 1, 0xfff, 0x0, 0, 0, 0, 0, 1, 0 },
+	{ LLCC_MDMPNG,   21, 1024, 0, 1, 0xf,   0x0, 0, 0, 0, 0, 1, 0 },
+	{ LLCC_AUDHW,    22, 1024, 1, 1, 0xfff, 0x0, 0, 0, 0, 0, 1, 0 },
+	{ LLCC_CVP,      28, 512,  3, 1, 0xfff, 0x0, 0, 0, 0, 0, 1, 0 },
+	{ LLCC_MODPE,    29, 256,  1, 1, 0xf,   0x0, 0, 0, 0, 0, 1, 0 },
+	{ LLCC_APTCM,    30, 1024, 3, 1, 0x0,   0x1, 1, 0, 0, 0, 1, 0 },
+	{ LLCC_WRCACHE,  31, 512,  1, 1, 0xfff, 0x0, 0, 0, 0, 0, 0, 1 },
+	{ LLCC_CVPFW,    17, 512,  1, 0, 0xfff, 0x0, 0, 0, 0, 0, 1, 0 },
+	{ LLCC_CPUSS1,   3, 1024,  1, 1, 0xfff, 0x0, 0, 0, 0, 0, 1, 0 },
+	{ LLCC_CPUHWT,   5, 512,   1, 1, 0xfff, 0x0, 0, 0, 0, 0, 0, 1 },
+};
+
 static const struct qcom_llcc_config sc7180_cfg = {
 	.sct_data	= sc7180_data,
 	.size		= ARRAY_SIZE(sc7180_data),
@@ -228,6 +250,11 @@ static const struct qcom_llcc_config sm8250_cfg = {
 	.size           = ARRAY_SIZE(sm8250_data),
 };
 
+static const struct qcom_llcc_config sm8350_cfg = {
+	.sct_data       = sm8350_data,
+	.size           = ARRAY_SIZE(sm8350_data),
+};
+
 static struct llcc_drv_data *drv_data = (void *) -EPROBE_DEFER;
 
 /**
@@ -644,6 +671,7 @@ static const struct of_device_id qcom_llcc_of_match[] = {
 	{ .compatible = "qcom,sm6350-llcc", .data = &sm6350_cfg },
 	{ .compatible = "qcom,sm8150-llcc", .data = &sm8150_cfg },
 	{ .compatible = "qcom,sm8250-llcc", .data = &sm8250_cfg },
+	{ .compatible = "qcom,sm8350-llcc", .data = &sm8350_cfg },
 	{ }
 };
 
-- 
2.33.1

