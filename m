Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA2C06D7903
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Apr 2023 11:55:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237622AbjDEJzl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Apr 2023 05:55:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237148AbjDEJzk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Apr 2023 05:55:40 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 494675FCA;
        Wed,  5 Apr 2023 02:55:18 -0700 (PDT)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3359c6T7022401;
        Wed, 5 Apr 2023 09:55:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=XZx9UJLoz0MpotphWSon+tYSj8fjQWPtH8A99zmkScY=;
 b=BAP+e6tVvCVwBQ8z3zuHgMQJwziJcKxQr9Iw3yZKcZ76LI6I3ea9mSjO//Paqri7mocA
 unNRpbbO26QaNjAqcxo0cvQiCKcbpLq3VPnLtYsQbC3WALF9g7NnduwvzvfX7xhzFezq
 PDMaDZeogaPQR7uPh0y//1YmZcmn5VnVp8eNEEtOHTvIoYBz8FvJ9Dhvh9BSljL15eNJ
 nxKM6g5IODFA/Dd4q7bI4qY0IjkGRO2t+jdksYtcMB9fOgOaNSWL+gMVA7c3BRNAGd2R
 E9VA56J1lwfyx7DVbCPaZ4smT9MhLXaqzvQo2euKXkPs5Uoo9kp4GWgDveuEsoEs/Zje uA== 
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3prg9bkc7j-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 05 Apr 2023 09:55:11 +0000
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
        by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3359t90o002849
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 5 Apr 2023 09:55:09 GMT
Received: from varda-linux.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Wed, 5 Apr 2023 02:55:04 -0700
From:   Varadarajan Narayanan <quic_varada@quicinc.com>
To:     <agross@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <vkoul@kernel.org>,
        <kishon@kernel.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <gregkh@linuxfoundation.org>,
        <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <quic_wcheng@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-clk@vger.kernel.org>
CC:     Varadarajan Narayanan <quic_varada@quicinc.com>
Subject: [PATCH v7 4/8] clk: qcom: gcc-ipq9574: Add USB related clocks
Date:   Wed, 5 Apr 2023 15:24:01 +0530
Message-ID: <51ec9bf44ce5427779c520eecb5caf9189286c54.1680688209.git.quic_varada@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1680688209.git.quic_varada@quicinc.com>
References: <cover.1680688209.git.quic_varada@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: f50T8Ica9YkGrOAhJtqUwAJlZdoaokkM
X-Proofpoint-ORIG-GUID: f50T8Ica9YkGrOAhJtqUwAJlZdoaokkM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-05_05,2023-04-04_05,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 mlxlogscore=999 priorityscore=1501 impostorscore=0
 bulkscore=0 mlxscore=0 malwarescore=0 spamscore=0 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304050090
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the clocks needed for enabling USB in IPQ9574

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Acked-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
---
 Changes in v2:
	- Fixed coding style issues
---
 drivers/clk/qcom/gcc-ipq9574.c               | 37 ++++++++++++++++++++++++++++
 include/dt-bindings/clock/qcom,ipq9574-gcc.h |  2 ++
 2 files changed, 39 insertions(+)

diff --git a/drivers/clk/qcom/gcc-ipq9574.c b/drivers/clk/qcom/gcc-ipq9574.c
index c855954..f19e9cb 100644
--- a/drivers/clk/qcom/gcc-ipq9574.c
+++ b/drivers/clk/qcom/gcc-ipq9574.c
@@ -2041,6 +2041,41 @@ static struct clk_regmap_mux usb0_pipe_clk_src = {
 	},
 };
 
+static struct clk_branch gcc_usb0_pipe_clk = {
+	.halt_reg = 0x2c054,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x2c054,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_usb0_pipe_clk",
+			.parent_hws = (const struct clk_hw *[]) {
+				&usb0_pipe_clk_src.clkr.hw
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_usb0_sleep_clk = {
+	.halt_reg = 0x2c058,
+	.clkr = {
+		.enable_reg = 0x2c058,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_usb0_sleep_clk",
+			.parent_hws = (const struct clk_hw *[]) {
+				&gcc_sleep_clk_src.clkr.hw
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
 static const struct freq_tbl ftbl_sdcc_apps_clk_src[] = {
 	F(144000, P_XO, 16, 12, 125),
 	F(400000, P_XO, 12, 1, 5),
@@ -4008,6 +4043,8 @@ static struct clk_regmap *gcc_ipq9574_clks[] = {
 	[GCC_USB0_MOCK_UTMI_CLK] = &gcc_usb0_mock_utmi_clk.clkr,
 	[USB0_PIPE_CLK_SRC] = &usb0_pipe_clk_src.clkr,
 	[GCC_USB0_PHY_CFG_AHB_CLK] = &gcc_usb0_phy_cfg_ahb_clk.clkr,
+	[GCC_USB0_PIPE_CLK] = &gcc_usb0_pipe_clk.clkr,
+	[GCC_USB0_SLEEP_CLK] = &gcc_usb0_sleep_clk.clkr,
 	[SDCC1_APPS_CLK_SRC] = &sdcc1_apps_clk_src.clkr,
 	[GCC_SDCC1_APPS_CLK] = &gcc_sdcc1_apps_clk.clkr,
 	[SDCC1_ICE_CORE_CLK_SRC] = &sdcc1_ice_core_clk_src.clkr,
diff --git a/include/dt-bindings/clock/qcom,ipq9574-gcc.h b/include/dt-bindings/clock/qcom,ipq9574-gcc.h
index 2d7b460..2cb02f7 100644
--- a/include/dt-bindings/clock/qcom,ipq9574-gcc.h
+++ b/include/dt-bindings/clock/qcom,ipq9574-gcc.h
@@ -214,4 +214,6 @@
 #define GCC_PCIE1_PIPE_CLK				205
 #define GCC_PCIE2_PIPE_CLK				206
 #define GCC_PCIE3_PIPE_CLK				207
+#define GCC_USB0_PIPE_CLK				208
+#define GCC_USB0_SLEEP_CLK				209
 #endif
-- 
2.7.4

