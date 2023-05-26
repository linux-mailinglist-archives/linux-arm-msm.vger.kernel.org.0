Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB06E712A57
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 May 2023 18:12:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244260AbjEZQM2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 May 2023 12:12:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243932AbjEZQMU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 May 2023 12:12:20 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7EA6A4;
        Fri, 26 May 2023 09:12:18 -0700 (PDT)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34QFN3ts023316;
        Fri, 26 May 2023 16:12:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=o8TJ67JXzwBVz9/X1KjFSZL6zjd83RmBi6f0dph0xb4=;
 b=iPT4gSYyqlDjUsknd753HMExFNHuDjsvwK3X5WvYfpwVXdN+Jt9ByF4az+zZa294MEyb
 X7E8L7H8gvyzBT3mRgWy5RTg2bgXmEQAVz3sSSmY5D/v94XcpHUK9yIYNSX7G3dFW3jU
 swlA/qP/5xF6oMmKfgT2eCg7hZ+d63AkWrh+r5leIdQpiXHB35iaJXAqyeDH8jaKl3Tu
 QNVjqkuHv6XFpiwS6Oi+4wFY3OBOuwYplY2WNP5pXWLMhfGwd7HOJvGwa2qgWyXu38Qj
 pjWI/njzCq+oX3mSHlUHbiY7VaiMfoDzRswsm+I7Mu0azRI0CC62v5besOG+i0MtD1YQ vg== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qt5ufue34-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 26 May 2023 16:12:10 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34QGC9Z9023037
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 26 May 2023 16:12:09 GMT
Received: from anusha-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Fri, 26 May 2023 09:12:02 -0700
From:   Anusha Rao <quic_anusha@quicinc.com>
To:     <agross@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <thara.gopinath@gmail.com>,
        <herbert@gondor.apana.org.au>, <davem@davemloft.net>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <conor+dt@kernel.org>, <mturquette@baylibre.com>,
        <sboyd@kernel.org>, <p.zabel@pengutronix.de>,
        <bhupesh.sharma@linaro.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-crypto@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>
CC:     <quic_srichara@quicinc.com>, <quic_gokulsri@quicinc.com>,
        <quic_sjaganat@quicinc.com>, <quic_kathirav@quicinc.com>,
        <quic_arajkuma@quicinc.com>, <quic_poovendh@quicinc.com>
Subject: [PATCH V4 2/4] clk: qcom: gcc-ipq9574: Enable crypto clocks
Date:   Fri, 26 May 2023 21:41:27 +0530
Message-ID: <20230526161129.1454-3-quic_anusha@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230526161129.1454-1-quic_anusha@quicinc.com>
References: <20230526161129.1454-1-quic_anusha@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 7qRphQVxbub8UggsThVoWvRfIcgKQ4Dr
X-Proofpoint-GUID: 7qRphQVxbub8UggsThVoWvRfIcgKQ4Dr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-26_06,2023-05-25_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 adultscore=0 priorityscore=1501 mlxlogscore=999 spamscore=0 bulkscore=0
 impostorscore=0 phishscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2304280000
 definitions=main-2305260137
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable the clocks required for crypto operation.

Reviewed-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
Signed-off-by: Anusha Rao <quic_anusha@quicinc.com>
---
 Changes in V4:
	- Added crypto CLK and reset in alphabetical order.
	- Picked up Reviewed-by tag.

 drivers/clk/qcom/gcc-ipq9574.c | 72 ++++++++++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/drivers/clk/qcom/gcc-ipq9574.c b/drivers/clk/qcom/gcc-ipq9574.c
index 7b0505f5c255..6914f962c893 100644
--- a/drivers/clk/qcom/gcc-ipq9574.c
+++ b/drivers/clk/qcom/gcc-ipq9574.c
@@ -728,6 +728,41 @@ static struct clk_rcg2 blsp1_uart6_apps_clk_src = {
 	},
 };
 
+static const struct freq_tbl ftbl_gcc_crypto_clk_src[] = {
+	F(160000000, P_GPLL0, 5, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gcc_crypto_clk_src = {
+	.cmd_rcgr = 0x16004,
+	.freq_tbl = ftbl_gcc_crypto_clk_src,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_gpll0_out_main_div2_map,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_crypto_clk_src",
+		.parent_data = gcc_xo_gpll0_gpll0_out_main_div2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll0_out_main_div2),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_branch gcc_crypto_clk = {
+	.halt_reg = 0x1600c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x0b004,
+		.enable_mask = BIT(14),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_crypto_clk",
+			.parent_hws = (const struct clk_hw *[]) {
+				&gcc_crypto_clk_src.clkr.hw },
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
 static struct clk_branch gcc_apss_ahb_clk = {
 	.halt_reg = 0x24018,
 	.halt_check = BRANCH_HALT_VOTED,
@@ -2071,6 +2106,38 @@ static struct clk_rcg2 pcnoc_bfdcd_clk_src = {
 	},
 };
 
+static struct clk_branch gcc_crypto_axi_clk = {
+	.halt_reg = 0x16010,
+	.clkr = {
+		.enable_reg = 0x16010,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_crypto_axi_clk",
+			.parent_hws = (const struct clk_hw *[]) {
+				&pcnoc_bfdcd_clk_src.clkr.hw },
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_crypto_ahb_clk = {
+	.halt_reg = 0x16014,
+	.clkr = {
+		.enable_reg = 0x16014,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_crypto_ahb_clk",
+			.parent_hws = (const struct clk_hw *[]) {
+				&pcnoc_bfdcd_clk_src.clkr.hw },
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
 static struct clk_branch gcc_nsscfg_clk = {
 	.halt_reg = 0x1702c,
 	.clkr = {
@@ -3880,6 +3947,10 @@ static struct clk_regmap *gcc_ipq9574_clks[] = {
 	[GCC_BLSP1_UART4_APPS_CLK] = &gcc_blsp1_uart4_apps_clk.clkr,
 	[GCC_BLSP1_UART5_APPS_CLK] = &gcc_blsp1_uart5_apps_clk.clkr,
 	[GCC_BLSP1_UART6_APPS_CLK] = &gcc_blsp1_uart6_apps_clk.clkr,
+	[GCC_CRYPTO_AHB_CLK] = &gcc_crypto_ahb_clk.clkr,
+	[GCC_CRYPTO_AXI_CLK] = &gcc_crypto_axi_clk.clkr,
+	[GCC_CRYPTO_CLK] = &gcc_crypto_clk.clkr,
+	[GCC_CRYPTO_CLK_SRC] = &gcc_crypto_clk_src.clkr,
 	[PCIE0_AXI_M_CLK_SRC] = &pcie0_axi_m_clk_src.clkr,
 	[GCC_PCIE0_AXI_M_CLK] = &gcc_pcie0_axi_m_clk.clkr,
 	[PCIE1_AXI_M_CLK_SRC] = &pcie1_axi_m_clk_src.clkr,
@@ -4063,6 +4134,7 @@ static const struct qcom_reset_map gcc_ipq9574_resets[] = {
 	[GCC_CMN_BLK_AHB_ARES] = { 0x3a010, 0 },
 	[GCC_CMN_BLK_SYS_ARES] = { 0x3a010, 1 },
 	[GCC_CMN_BLK_APU_ARES] = { 0x3a010, 2 },
+	[GCC_CRYPTO_BCR] = { 0x16000, 0 },
 	[GCC_DCC_BCR] = { 0x35000, 0 },
 	[GCC_DDRSS_BCR] = { 0x11000, 0 },
 	[GCC_IMEM_BCR] = { 0x0e000, 0 },
-- 
2.17.1

