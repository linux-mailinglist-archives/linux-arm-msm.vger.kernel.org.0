Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C26F545814F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Nov 2021 01:21:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236607AbhKUAYH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 20 Nov 2021 19:24:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236552AbhKUAYF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 20 Nov 2021 19:24:05 -0500
Received: from relay01.th.seeweb.it (relay01.th.seeweb.it [IPv6:2001:4b7a:2000:18::162])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40DD8C06173E;
        Sat, 20 Nov 2021 16:21:00 -0800 (PST)
Received: from localhost.localdomain (83.6.168.18.neoplus.adsl.tpnet.pl [83.6.168.18])
        by m-r1.th.seeweb.it (Postfix) with ESMTPA id 4CD7C1F8D0;
        Sun, 21 Nov 2021 01:20:57 +0100 (CET)
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
To:     ~postmarketos/upstreaming@lists.sr.ht
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] soc: qcom: llcc: Add configuration data for SM8350
Date:   Sun, 21 Nov 2021 01:20:46 +0100
Message-Id: <20211121002050.36977-2-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211121002050.36977-1-konrad.dybcio@somainline.org>
References: <20211121002050.36977-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add LLCC configuration data for SM8350 SoC.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
Changes since v1:
- Move the .h defines here

 drivers/soc/qcom/llcc-qcom.c       | 28 ++++++++++++++++++++++++++++
 include/linux/soc/qcom/llcc-qcom.h |  4 ++++
 2 files changed, 32 insertions(+)

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
 
diff --git a/include/linux/soc/qcom/llcc-qcom.h b/include/linux/soc/qcom/llcc-qcom.h
index 437c9df13229..bf8b749b44e1 100644
--- a/include/linux/soc/qcom/llcc-qcom.h
+++ b/include/linux/soc/qcom/llcc-qcom.h
@@ -33,6 +33,10 @@
 #define LLCC_MODPE       29
 #define LLCC_APTCM       30
 #define LLCC_WRCACHE     31
+#define LLCC_CVPFW       32
+#define LLCC_CPUSS1      33
+#define LLCC_CPUHWT      36
+
 
 /**
  * struct llcc_slice_desc - Cache slice descriptor
-- 
2.33.1

