Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7818E76E60E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Aug 2023 12:59:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234484AbjHCK7f (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Aug 2023 06:59:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235493AbjHCK7I (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Aug 2023 06:59:08 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75205422A;
        Thu,  3 Aug 2023 03:58:51 -0700 (PDT)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3737HYVh031796;
        Thu, 3 Aug 2023 10:58:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=rvvOiRD45oZV5kvVyafqIbV/XjrZdeWz8n3OYhw6wU4=;
 b=QxpmJSb4VkQaphMwnJhzdKfz8ALmUHJARI3e0/QvF8PUkbK3AjVySPgiZdIJPgUM2SBg
 3f3tvbUSvQSVQoMr/BIjJjqNBQv7/xvUh++x4olkfYKDQe78nuo3uTnwvz0ocF7LvjwL
 /Al2LfGlwVlbNzTzDiOFMbXvDWweRq1d8agAWxixjce1TzacD9s0CFmivbMwQpKUp3ZA
 6tbs3lY1ag6loUSsWJLW0eU/wUQQKAKpK/6HULD6+rPB8CHyeDK8f1exHzZ49d6LYG8B
 kzLylBVT2Rn35A3h1VbTsfGlBdJ4w+zVxrDMuKMwM+lgqB3L+IpQHvUMaQ8pi0uuw9GX TQ== 
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s7n93jn1v-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 03 Aug 2023 10:58:47 +0000
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
        by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 373Awko3010055
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 3 Aug 2023 10:58:47 GMT
Received: from hu-imrashai-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Thu, 3 Aug 2023 03:58:41 -0700
From:   Imran Shaik <quic_imrashai@quicinc.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
CC:     Taniya Das <quic_tdas@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        "Ajit Pandey" <quic_ajipan@quicinc.com>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Subject: [PATCH V5 6/8] clk: qcom: gcc-qdu1000: Add support for GDSCs
Date:   Thu, 3 Aug 2023 16:27:39 +0530
Message-ID: <20230803105741.2292309-7-quic_imrashai@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230803105741.2292309-1-quic_imrashai@quicinc.com>
References: <20230803105741.2292309-1-quic_imrashai@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: LM-akJmkrX8wf9CGPTvziB431ML9Oujf
X-Proofpoint-ORIG-GUID: LM-akJmkrX8wf9CGPTvziB431ML9Oujf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-03_09,2023-08-03_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 bulkscore=0 mlxlogscore=999 spamscore=0 malwarescore=0 suspectscore=0
 mlxscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308030098
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the GDSCs support for QDU1000 and QRU1000 SoCs.

Co-developed-by: Taniya Das <quic_tdas@quicinc.com>
Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
Signed-off-by: Imran Shaik <quic_imrashai@quicinc.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Changes since v4:
 - None
Changes since v3:
 - None
Changes since v2:
 - None
Changes since v1:
 - Newly added

 drivers/clk/qcom/gcc-qdu1000.c | 42 ++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/drivers/clk/qcom/gcc-qdu1000.c b/drivers/clk/qcom/gcc-qdu1000.c
index 5bf62f04cf12..fe1d0e8946a7 100644
--- a/drivers/clk/qcom/gcc-qdu1000.c
+++ b/drivers/clk/qcom/gcc-qdu1000.c
@@ -18,6 +18,7 @@
 #include "clk-regmap-divider.h"
 #include "clk-regmap-mux.h"
 #include "clk-regmap-phy-mux.h"
+#include "gdsc.h"
 #include "reset.h"
 
 enum {
@@ -2410,6 +2411,39 @@ static struct clk_branch gcc_usb3_prim_phy_pipe_clk = {
 	},
 };
 
+static struct gdsc pcie_0_gdsc = {
+	.gdscr = 0x9d004,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
+	.pd = {
+		.name = "gcc_pcie_0_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+};
+
+static struct gdsc pcie_0_phy_gdsc = {
+	.gdscr = 0x7c004,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0x2,
+	.pd = {
+		.name = "gcc_pcie_0_phy_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+};
+
+static struct gdsc usb30_prim_gdsc = {
+	.gdscr = 0x49004,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
+	.pd = {
+		.name = "gcc_usb30_prim_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+};
+
 static struct clk_regmap *gcc_qdu1000_clocks[] = {
 	[GCC_AGGRE_NOC_ECPRI_DMA_CLK] = &gcc_aggre_noc_ecpri_dma_clk.clkr,
 	[GCC_AGGRE_NOC_ECPRI_DMA_CLK_SRC] = &gcc_aggre_noc_ecpri_dma_clk_src.clkr,
@@ -2546,6 +2580,12 @@ static struct clk_regmap *gcc_qdu1000_clocks[] = {
 	[GCC_DDRSS_ECPRI_GSI_CLK] = &gcc_ddrss_ecpri_gsi_clk.clkr,
 };
 
+static struct gdsc *gcc_qdu1000_gdscs[] = {
+	[PCIE_0_GDSC] = &pcie_0_gdsc,
+	[PCIE_0_PHY_GDSC] = &pcie_0_phy_gdsc,
+	[USB30_PRIM_GDSC] = &usb30_prim_gdsc,
+};
+
 static const struct qcom_reset_map gcc_qdu1000_resets[] = {
 	[GCC_ECPRI_CC_BCR] = { 0x3e000 },
 	[GCC_ECPRI_SS_BCR] = { 0x3a000 },
@@ -2607,6 +2647,8 @@ static const struct qcom_cc_desc gcc_qdu1000_desc = {
 	.num_clks = ARRAY_SIZE(gcc_qdu1000_clocks),
 	.resets = gcc_qdu1000_resets,
 	.num_resets = ARRAY_SIZE(gcc_qdu1000_resets),
+	.gdscs = gcc_qdu1000_gdscs,
+	.num_gdscs = ARRAY_SIZE(gcc_qdu1000_gdscs),
 };
 
 static const struct of_device_id gcc_qdu1000_match_table[] = {
-- 
2.25.1

