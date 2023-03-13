Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9FAF66B77BB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Mar 2023 13:41:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229962AbjCMMlU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Mar 2023 08:41:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229929AbjCMMlT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Mar 2023 08:41:19 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C5CD1CBCC;
        Mon, 13 Mar 2023 05:41:17 -0700 (PDT)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32DBB9hl004997;
        Mon, 13 Mar 2023 12:40:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=qcppdkim1;
 bh=arWtPEA0bcJXqwG62AWlaCRZSxo1cNJCkmPGoarEGKM=;
 b=fgyVn41oDlCBU2wl84LmZ6RUp9ionDxqbxwGvoKVyOc+fbTxxqd2dsVWt0McyFZGCH8T
 qn/reMVYkxOnmnyLu4ZyaATU7aGPz/tyqwe2ybSeO9x52j1AC2D+DAOei7GC3zw11sCA
 0plrcWOgQSuq+mp4/k8eRvn0jfJXjVNmroQe8oJx8xXlffMhpFHhycPt1f+/hHqCegMV
 pYTy+q+8Unuz1OHZPHsWWXfaV/YvtBODMCPwLuQim8OijJffinX4sNHyasnBmMHepPIm
 qfHKxuoDSPHAALb9bMRthL/oLLgfsqBcNzLRDoBEHzS2Sglma0WQ6e44yY0nPTQtstga OQ== 
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3p8gnq4vq2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 13 Mar 2023 12:40:49 +0000
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
        by APBLRPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 32DCek7D022388;
        Mon, 13 Mar 2023 12:40:46 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 3p8jqkna00-1;
        Mon, 13 Mar 2023 12:40:46 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
        by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32DCekvh022378;
        Mon, 13 Mar 2023 12:40:46 GMT
Received: from kbajaj-linux.qualcomm.com (kbajaj-linux.qualcomm.com [10.214.66.129])
        by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 32DCekMO022376;
        Mon, 13 Mar 2023 12:40:46 +0000
Received: from kbajaj-linux.qualcomm.com (localhost [127.0.0.1])
        by kbajaj-linux.qualcomm.com (Postfix) with ESMTP id 3235F2A3;
        Mon, 13 Mar 2023 18:10:45 +0530 (IST)
From:   Komal Bajaj <quic_kbajaj@quicinc.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Abel Vesa <abel.vesa@linaro.org>,
        Rishabh Bhatnagar <rishabhb@codeaurora.org>,
        Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>
Cc:     Komal Bajaj <quic_kbajaj@quicinc.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 1/5] soc: qcom: llcc: Refactor llcc driver to support multiple configuration
Date:   Mon, 13 Mar 2023 18:10:36 +0530
Message-Id: <20230313124040.9463-2-quic_kbajaj@quicinc.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230313124040.9463-1-quic_kbajaj@quicinc.com>
References: <20230313124040.9463-1-quic_kbajaj@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 4AVdA55gPYnlCUldzeJXZ6HWXP5az5de
X-Proofpoint-ORIG-GUID: 4AVdA55gPYnlCUldzeJXZ6HWXP5az5de
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-13_05,2023-03-13_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 mlxlogscore=999 spamscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303130102
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Refactor driver to support multiple configuration for llcc on a target.

Signed-off-by: Komal Bajaj <quic_kbajaj@quicinc.com>
---
 drivers/soc/qcom/llcc-qcom.c | 191 ++++++++++++++++++++---------------
 1 file changed, 112 insertions(+), 79 deletions(-)

diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
index 23ce2f78c4ed..00699a0c047e 100644
--- a/drivers/soc/qcom/llcc-qcom.c
+++ b/drivers/soc/qcom/llcc-qcom.c
@@ -416,92 +416,125 @@ static const u32 llcc_v2_1_reg_offset[] = {
 	[LLCC_COMMON_STATUS0]	= 0x0003400c,
 };
 
-static const struct qcom_llcc_config sc7180_cfg = {
-	.sct_data	= sc7180_data,
-	.size		= ARRAY_SIZE(sc7180_data),
-	.need_llcc_cfg	= true,
-	.reg_offset	= llcc_v1_reg_offset,
-	.edac_reg_offset = &llcc_v1_edac_reg_offset,
+static const struct qcom_llcc_config sc7180_cfg[] = {
+	{
+		.sct_data	= sc7180_data,
+		.size		= ARRAY_SIZE(sc7180_data),
+		.need_llcc_cfg	= true,
+		.reg_offset	= llcc_v1_reg_offset,
+		.edac_reg_offset = &llcc_v1_edac_reg_offset,
+	},
+	{ },
 };
 
-static const struct qcom_llcc_config sc7280_cfg = {
-	.sct_data	= sc7280_data,
-	.size		= ARRAY_SIZE(sc7280_data),
-	.need_llcc_cfg	= true,
-	.reg_offset	= llcc_v1_reg_offset,
-	.edac_reg_offset = &llcc_v1_edac_reg_offset,
+static const struct qcom_llcc_config sc7280_cfg[] = {
+	{
+		.sct_data	= sc7280_data,
+		.size		= ARRAY_SIZE(sc7280_data),
+		.need_llcc_cfg	= true,
+		.reg_offset	= llcc_v1_reg_offset,
+		.edac_reg_offset = &llcc_v1_edac_reg_offset,
+	},
+	{ },
 };
 
-static const struct qcom_llcc_config sc8180x_cfg = {
-	.sct_data	= sc8180x_data,
-	.size		= ARRAY_SIZE(sc8180x_data),
-	.need_llcc_cfg	= true,
-	.reg_offset	= llcc_v1_reg_offset,
-	.edac_reg_offset = &llcc_v1_edac_reg_offset,
+static const struct qcom_llcc_config sc8180x_cfg[] = {
+	{
+		.sct_data	= sc8180x_data,
+		.size		= ARRAY_SIZE(sc8180x_data),
+		.need_llcc_cfg	= true,
+		.reg_offset	= llcc_v1_reg_offset,
+		.edac_reg_offset = &llcc_v1_edac_reg_offset,
+	},
+	{ },
 };
 
-static const struct qcom_llcc_config sc8280xp_cfg = {
-	.sct_data	= sc8280xp_data,
-	.size		= ARRAY_SIZE(sc8280xp_data),
-	.need_llcc_cfg	= true,
-	.reg_offset	= llcc_v1_reg_offset,
-	.edac_reg_offset = &llcc_v1_edac_reg_offset,
+static const struct qcom_llcc_config sc8280xp_cfg[] = {
+	{
+		.sct_data	= sc8280xp_data,
+		.size		= ARRAY_SIZE(sc8280xp_data),
+		.need_llcc_cfg	= true,
+		.reg_offset	= llcc_v1_reg_offset,
+		.edac_reg_offset = &llcc_v1_edac_reg_offset,
+	},
+	{ },
 };
 
-static const struct qcom_llcc_config sdm845_cfg = {
-	.sct_data	= sdm845_data,
-	.size		= ARRAY_SIZE(sdm845_data),
-	.need_llcc_cfg	= false,
-	.reg_offset	= llcc_v1_reg_offset,
-	.edac_reg_offset = &llcc_v1_edac_reg_offset,
+static const struct qcom_llcc_config sdm845_cfg[] = {
+	{
+		.sct_data	= sdm845_data,
+		.size		= ARRAY_SIZE(sdm845_data),
+		.need_llcc_cfg	= false,
+		.reg_offset	= llcc_v1_reg_offset,
+		.edac_reg_offset = &llcc_v1_edac_reg_offset,
+	},
+	{ },
 };
 
-static const struct qcom_llcc_config sm6350_cfg = {
-	.sct_data	= sm6350_data,
-	.size		= ARRAY_SIZE(sm6350_data),
-	.need_llcc_cfg	= true,
-	.reg_offset	= llcc_v1_reg_offset,
-	.edac_reg_offset = &llcc_v1_edac_reg_offset,
+static const struct qcom_llcc_config sm6350_cfg[] = {
+	{
+		.sct_data	= sm6350_data,
+		.size		= ARRAY_SIZE(sm6350_data),
+		.need_llcc_cfg	= true,
+		.reg_offset	= llcc_v1_reg_offset,
+		.edac_reg_offset = &llcc_v1_edac_reg_offset,
+	},
+	{ },
 };
 
-static const struct qcom_llcc_config sm8150_cfg = {
-	.sct_data       = sm8150_data,
-	.size           = ARRAY_SIZE(sm8150_data),
-	.need_llcc_cfg	= true,
-	.reg_offset	= llcc_v1_reg_offset,
-	.edac_reg_offset = &llcc_v1_edac_reg_offset,
+static const struct qcom_llcc_config sm8150_cfg[] = {
+	{
+		.sct_data       = sm8150_data,
+		.size           = ARRAY_SIZE(sm8150_data),
+		.need_llcc_cfg	= true,
+		.reg_offset	= llcc_v1_reg_offset,
+		.edac_reg_offset = &llcc_v1_edac_reg_offset,
+	},
+	{ },
 };
 
-static const struct qcom_llcc_config sm8250_cfg = {
-	.sct_data       = sm8250_data,
-	.size           = ARRAY_SIZE(sm8250_data),
-	.need_llcc_cfg	= true,
-	.reg_offset	= llcc_v1_reg_offset,
-	.edac_reg_offset = &llcc_v1_edac_reg_offset,
+static const struct qcom_llcc_config sm8250_cfg[] = {
+	{
+		.sct_data       = sm8250_data,
+		.size           = ARRAY_SIZE(sm8250_data),
+		.need_llcc_cfg	= true,
+		.reg_offset	= llcc_v1_reg_offset,
+		.edac_reg_offset = &llcc_v1_edac_reg_offset,
+	},
+	{ },
 };
 
-static const struct qcom_llcc_config sm8350_cfg = {
-	.sct_data       = sm8350_data,
-	.size           = ARRAY_SIZE(sm8350_data),
-	.need_llcc_cfg	= true,
-	.reg_offset	= llcc_v1_reg_offset,
-	.edac_reg_offset = &llcc_v1_edac_reg_offset,
+static const struct qcom_llcc_config sm8350_cfg[] = {
+	{
+		.sct_data       = sm8350_data,
+		.size           = ARRAY_SIZE(sm8350_data),
+		.need_llcc_cfg	= true,
+		.reg_offset	= llcc_v1_reg_offset,
+		.edac_reg_offset = &llcc_v1_edac_reg_offset,
+	},
+	{ },
 };
 
-static const struct qcom_llcc_config sm8450_cfg = {
-	.sct_data       = sm8450_data,
-	.size           = ARRAY_SIZE(sm8450_data),
-	.need_llcc_cfg	= true,
-	.reg_offset	= llcc_v2_1_reg_offset,
-	.edac_reg_offset = &llcc_v2_1_edac_reg_offset,
+static const struct qcom_llcc_config sm8450_cfg[] = {
+	{
+		.sct_data       = sm8450_data,
+		.size           = ARRAY_SIZE(sm8450_data),
+		.need_llcc_cfg	= true,
+		.reg_offset	= llcc_v2_1_reg_offset,
+		.edac_reg_offset = &llcc_v2_1_edac_reg_offset,
+	},
+	{ },
 };
 
-static const struct qcom_llcc_config sm8550_cfg = {
-	.sct_data       = sm8550_data,
-	.size           = ARRAY_SIZE(sm8550_data),
-	.need_llcc_cfg	= true,
-	.reg_offset	= llcc_v2_1_reg_offset,
-	.edac_reg_offset = &llcc_v2_1_edac_reg_offset,
+static const struct qcom_llcc_config sm8550_cfg[] = {
+	{
+		.sct_data       = sm8550_data,
+		.size           = ARRAY_SIZE(sm8550_data),
+		.need_llcc_cfg	= true,
+		.reg_offset	= llcc_v2_1_reg_offset,
+		.edac_reg_offset = &llcc_v2_1_edac_reg_offset,
+	},
+	{ },
 };
 
 static struct llcc_drv_data *drv_data = (void *) -EPROBE_DEFER;
@@ -966,8 +999,8 @@ static int qcom_llcc_probe(struct platform_device *pdev)
 	num_banks >>= LLCC_LB_CNT_SHIFT;
 	drv_data->num_banks = num_banks;
 
-	llcc_cfg = cfg->sct_data;
-	sz = cfg->size;
+	llcc_cfg = cfg[0].sct_data;
+	sz = cfg[0].size;
 
 	for (i = 0; i < sz; i++)
 		if (llcc_cfg[i].slice_id > drv_data->max_slices)
@@ -1016,17 +1049,17 @@ static int qcom_llcc_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id qcom_llcc_of_match[] = {
-	{ .compatible = "qcom,sc7180-llcc", .data = &sc7180_cfg },
-	{ .compatible = "qcom,sc7280-llcc", .data = &sc7280_cfg },
-	{ .compatible = "qcom,sc8180x-llcc", .data = &sc8180x_cfg },
-	{ .compatible = "qcom,sc8280xp-llcc", .data = &sc8280xp_cfg },
-	{ .compatible = "qcom,sdm845-llcc", .data = &sdm845_cfg },
-	{ .compatible = "qcom,sm6350-llcc", .data = &sm6350_cfg },
-	{ .compatible = "qcom,sm8150-llcc", .data = &sm8150_cfg },
-	{ .compatible = "qcom,sm8250-llcc", .data = &sm8250_cfg },
-	{ .compatible = "qcom,sm8350-llcc", .data = &sm8350_cfg },
-	{ .compatible = "qcom,sm8450-llcc", .data = &sm8450_cfg },
-	{ .compatible = "qcom,sm8550-llcc", .data = &sm8550_cfg },
+	{ .compatible = "qcom,sc7180-llcc", .data = sc7180_cfg },
+	{ .compatible = "qcom,sc7280-llcc", .data = sc7280_cfg },
+	{ .compatible = "qcom,sc8180x-llcc", .data = sc8180x_cfg },
+	{ .compatible = "qcom,sc8280xp-llcc", .data = sc8280xp_cfg },
+	{ .compatible = "qcom,sdm845-llcc", .data = sdm845_cfg },
+	{ .compatible = "qcom,sm6350-llcc", .data = sm6350_cfg },
+	{ .compatible = "qcom,sm8150-llcc", .data = sm8150_cfg },
+	{ .compatible = "qcom,sm8250-llcc", .data = sm8250_cfg },
+	{ .compatible = "qcom,sm8350-llcc", .data = sm8350_cfg },
+	{ .compatible = "qcom,sm8450-llcc", .data = sm8450_cfg },
+	{ .compatible = "qcom,sm8550-llcc", .data = sm8550_cfg },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, qcom_llcc_of_match);
-- 
2.39.1

