Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 85C256CF763
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Mar 2023 01:34:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229950AbjC2Xem (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Mar 2023 19:34:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229867AbjC2Xej (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Mar 2023 19:34:39 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 955AA5272
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Mar 2023 16:34:38 -0700 (PDT)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32THCMGA007781;
        Wed, 29 Mar 2023 23:34:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=HBSdGZl12voC5mT4Z6Mv2tDdHIj4Cq/tM521eMR7/F0=;
 b=QHY6MApN/MIUQlPNp82k+S/9+fIaCznFus5SRX89+OwhL/3MQX1s7e3AE7MN3+KhtZn5
 UEVWb3KnQz9ZiX483UTIiZeQjEQJgPz3mYLM1Xn/BTL1w5b7HQGo5cj6oxFK8wImiNOd
 +Ft91GeWzhgpaP4EZJQsTIxQsiOdMGQ6ug6uYnp+EHsqV5315Y6xVl41G22vF/frTC2c
 9qLs68xYFbRq0NrDjWTlZF/M9duCrJEVkl5jQtOBxn8H+5vGpUcEXrWfmqovxeH+NTC4
 pMV44SGZ7qTgtYPRo9iXwKfBgTgE0aPJEnybQmLxPC8DnwMAsSqvQhVWDPSIFP9x5zP/ eQ== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pmjjd23du-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 29 Mar 2023 23:34:33 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32TNYWSm027498
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 29 Mar 2023 23:34:32 GMT
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Wed, 29 Mar 2023 16:34:31 -0700
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
To:     <linux-arm-msm@vger.kernel.org>
CC:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        <freedreno@lists.freedesktop.org>, <robdclark@gmail.com>,
        <seanpaul@chromium.org>, <swboyd@chromium.org>,
        <dmitry.baryshkov@linaro.org>, <quic_bjorande@quicinc.com>,
        <quic_khsieh@quicinc.com>, <dianders@chromium.org>,
        <agross@kernel.org>, <konrad.dybcio@linaro.org>
Subject: [PATCH] arm64: dts: qcom: sc7280: remove hbr3 support on herobrine boards
Date:   Wed, 29 Mar 2023 16:34:16 -0700
Message-ID: <20230329233416.27152-1-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 3El6C-_IySkwGhFKVwiYI3hUgR83rd9O
X-Proofpoint-ORIG-GUID: 3El6C-_IySkwGhFKVwiYI3hUgR83rd9O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-29_14,2023-03-28_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 impostorscore=0
 priorityscore=1501 phishscore=0 adultscore=0 mlxlogscore=511 bulkscore=0
 lowpriorityscore=0 mlxscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2303290175
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

There are some interop issues seen across a few DP monitors with
HBR3 and herobrine boards where the DP display stays blank with hbr3.
This is still under investigation but in preparation for supporting
higher resolutions, its better to disable HBR3 till the issues are
root-caused as there is really no guarantee which monitors will show
the issue and which would not.

This can be enabled back after successful validation across more DP
sinks.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
index b6137816f2f3..313083ec1f39 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
@@ -464,7 +464,7 @@ &mdss_dp {
 
 &mdss_dp_out {
 	data-lanes = <0 1>;
-	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000>;
 };
 
 &mdss_mdp {
-- 
2.39.2

