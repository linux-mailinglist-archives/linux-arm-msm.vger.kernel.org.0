Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E41B76E47DA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Apr 2023 14:34:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230251AbjDQMe6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Apr 2023 08:34:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229784AbjDQMe5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Apr 2023 08:34:57 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4C02C3;
        Mon, 17 Apr 2023 05:34:55 -0700 (PDT)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33H8xKJS014309;
        Mon, 17 Apr 2023 10:52:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=kC0CibSpWa+1cOrD/+TCskbaGKiLhIhR/udUirvN9VI=;
 b=pD9QslcpYJ1P8VMIxPJkii6OibWR44/MVqkOKsslzRsJtrW8gOaNxxtgahf5am31eW6v
 mnJkaO+ckVMOhYU/7jsdUPdv2lgyPAClvOuz3Rs8EDjspNiAZ/V6gl7HSYVjm2Ue9rH9
 rRcNbNkxjYALBaNb1FFkx5i1/Ss5u/1lnjyJeHRADpYi51xAFNxlm6KtXaq/fKcj7OgJ
 LZtI4bnyNcYiwXfNFR362uYQLJY5WVNKr+7XXMKtzTbSnUdyF7TycsK4UdR3cuut5ndc
 spLOGGAaSsLzU4xzhn4RC2LBSEPcNRBqU/Kmy/lDc/mm+c/vltN6b7Nv67mc+X65OI5G RQ== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pymuu38gn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 17 Apr 2023 10:52:46 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33HAqjts028961
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 17 Apr 2023 10:52:45 GMT
Received: from kathirav-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Mon, 17 Apr 2023 03:52:41 -0700
From:   Kathiravan T <quic_kathirav@quicinc.com>
To:     <andersson@kernel.org>, <agross@kernel.org>,
        <konrad.dybcio@linaro.org>, <mturquette@baylibre.com>,
        <sboyd@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     Kathiravan T <quic_kathirav@quicinc.com>
Subject: [PATCH] clk: qcom: ipq5332: fix the order of SLEEP_CLK and XO clock
Date:   Mon, 17 Apr 2023 16:22:26 +0530
Message-ID: <20230417105226.3169-1-quic_kathirav@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: yMuRW1jW99ROMZCxg-G5aCeyk601bh2G
X-Proofpoint-ORIG-GUID: yMuRW1jW99ROMZCxg-G5aCeyk601bh2G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-17_06,2023-04-17_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 mlxscore=0 mlxlogscore=893 impostorscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 spamscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304170097
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The order of DT_SLEEP_CLK and DT_XO are swapped and it is incorrect.
Due to which the clocks for which the parent should be XO is having parent
as SLEEP_CLK and vice versa. So fix the same by re-ordering the entries.

Signed-off-by: Kathiravan T <quic_kathirav@quicinc.com>
---
 drivers/clk/qcom/gcc-ipq5332.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-ipq5332.c b/drivers/clk/qcom/gcc-ipq5332.c
index 8cacbfb10c72..14096887d436 100644
--- a/drivers/clk/qcom/gcc-ipq5332.c
+++ b/drivers/clk/qcom/gcc-ipq5332.c
@@ -20,8 +20,8 @@
 #include "reset.h"
 
 enum {
-	DT_SLEEP_CLK,
 	DT_XO,
+	DT_SLEEP_CLK,
 	DT_PCIE_2LANE_PHY_PIPE_CLK,
 	DT_PCIE_2LANE_PHY_PIPE_CLK_X1,
 	DT_USB_PCIE_WRAPPER_PIPE_CLK,
-- 
2.17.1

