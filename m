Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 00C0679FB34
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Sep 2023 07:47:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235234AbjINFr3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Sep 2023 01:47:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235140AbjINFrZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Sep 2023 01:47:25 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49C9A1724;
        Wed, 13 Sep 2023 22:47:17 -0700 (PDT)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38E5XDJN028083;
        Thu, 14 Sep 2023 05:47:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=ZuD+kzTK3GMqMh4cRFD6FbY1OqwfVp6oqKPDZbwG/ng=;
 b=Ib9e8cwOVsckwROJA4+pfrwLIO73guw9xwuVxQDDArvgFDyjIvk64Oqara54pUkafI05
 mZzEXSWD6CiQma7I71nLX6v9IEETQrigIsanGpyMMr/MMLRrQ7LfVa/yI56OcITymuLa
 +nqgmclve/qEpnYl01hp7UDfsTz1tNt5H2iRcP01RIBJyFZ3/POyXgir5jYDVVMoOQyN
 hW3IpInpaXYxX7Mbry8WV7I8Z/fA5rfyjj6kGzGJ2S5pNb8VSagjqJlih9Cdid5rZxIg
 AAekOUHq9nwZmHdUIzH5zTf9ToE/SE9QOxTbT+ZibXPyv7PJqAsK0flE/EC3gmNnBPTV ag== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t3v4h8140-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 14 Sep 2023 05:47:03 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
        by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38E5l22X000468
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 14 Sep 2023 05:47:02 GMT
Received: from akronite-sh-dev02.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Wed, 13 Sep 2023 22:46:58 -0700
From:   Luo Jie <quic_luoj@quicinc.com>
To:     <andersson@kernel.org>, <agross@kernel.org>,
        <konrad.dybcio@linaro.org>, <mturquette@baylibre.com>,
        <sboyd@kernel.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <catalin.marinas@arm.com>, <will@kernel.org>,
        <p.zabel@pengutronix.de>
CC:     <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_srichara@quicinc.com>
Subject: [PATCH v7 1/4] clk: qcom: branch: Add clk_branch2_prepare_ops
Date:   Thu, 14 Sep 2023 13:46:36 +0800
Message-ID: <20230914054639.13075-2-quic_luoj@quicinc.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230914054639.13075-1-quic_luoj@quicinc.com>
References: <20230914054639.13075-1-quic_luoj@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: LatfP-dGLU7l0MIY6NN08IpT-80akOfX
X-Proofpoint-GUID: LatfP-dGLU7l0MIY6NN08IpT-80akOfX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-14_03,2023-09-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 clxscore=1015 spamscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 mlxscore=0 bulkscore=0 mlxlogscore=803 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309140050
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the clk_branch2_prepare_ops for supporting clock controller
where the hardware register is accessed by MDIO bus, and the
spin lock can't be used because of sleep during the MDIO
operation.

The clock is enabled by the .prepare instead of .enable when
the clk_branch2_prepare_ops is used.

Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
Acked-by: Stephen Boyd <sboyd@kernel.org>
---
 drivers/clk/qcom/clk-branch.c | 7 +++++++
 drivers/clk/qcom/clk-branch.h | 1 +
 2 files changed, 8 insertions(+)

diff --git a/drivers/clk/qcom/clk-branch.c b/drivers/clk/qcom/clk-branch.c
index fc4735f74f0f..e22cdcf694f6 100644
--- a/drivers/clk/qcom/clk-branch.c
+++ b/drivers/clk/qcom/clk-branch.c
@@ -153,3 +153,10 @@ const struct clk_ops clk_branch_simple_ops = {
 	.is_enabled = clk_is_enabled_regmap,
 };
 EXPORT_SYMBOL_GPL(clk_branch_simple_ops);
+
+const struct clk_ops clk_branch2_prepare_ops = {
+	.prepare = clk_branch2_enable,
+	.unprepare = clk_branch2_disable,
+	.is_prepared = clk_is_enabled_regmap,
+};
+EXPORT_SYMBOL_GPL(clk_branch2_prepare_ops);
diff --git a/drivers/clk/qcom/clk-branch.h b/drivers/clk/qcom/clk-branch.h
index 0cf800b9d08d..f6f355f28b71 100644
--- a/drivers/clk/qcom/clk-branch.h
+++ b/drivers/clk/qcom/clk-branch.h
@@ -85,6 +85,7 @@ extern const struct clk_ops clk_branch_ops;
 extern const struct clk_ops clk_branch2_ops;
 extern const struct clk_ops clk_branch_simple_ops;
 extern const struct clk_ops clk_branch2_aon_ops;
+extern const struct clk_ops clk_branch2_prepare_ops;
 
 #define to_clk_branch(_hw) \
 	container_of(to_clk_regmap(_hw), struct clk_branch, clkr)
-- 
2.42.0

