Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8ED8465ED4C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jan 2023 14:39:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233497AbjAENjR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Jan 2023 08:39:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233571AbjAENjB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Jan 2023 08:39:01 -0500
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 480EB37273;
        Thu,  5 Jan 2023 05:38:54 -0800 (PST)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 305CtAWL032660;
        Thu, 5 Jan 2023 13:38:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=o+Gzip8MI1YUsrzvw8xu85Wc4SqiMoRcrC30w+2ptfY=;
 b=R/My7XUSz4IsSCZ+ttIV0CtaBD+Bxj2cvHQEv3F7KNkzAEPShtPVm4/f+067TMTjgHEb
 neaAmzdXATroYVDefcM2RQEKg/W/238J+3PL/PbS3JCvt7AMyNyMaAbIBL7krIGq/xXH
 z5N3wqzl+Lwadsi29SIpG7dtvHErsIslvUNe5qcOSMtgj+5SjEuO7e+v4TomDdY66Oe/
 EDt9Fpyo1rJwbO7pjR4JqfTrh9/+uoSA3F5JiHEvKJbPDpQfgeBdan187pKvoLqdKBZW
 Do0lucNtf2PKZ5sgPCTJmX1JYgfOtxryECYeATGp/H1WSoyBN9yu+jQv+TFDcbY/VnXW 3Q== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mwuuurcue-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 05 Jan 2023 13:38:50 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 305DcnM8015206
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 5 Jan 2023 13:38:49 GMT
Received: from hu-srivasam-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Thu, 5 Jan 2023 05:38:45 -0800
From:   Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
To:     <agross@kernel.org>, <andersson@kernel.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_rohkumar@quicinc.com>,
        <srinivas.kandagatla@linaro.org>, <dianders@chromium.org>,
        <swboyd@chromium.org>, <judyhsiao@chromium.org>,
        <konrad.dybcio@linaro.org>, <mka@chromium.org>
CC:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Subject: [PATCH v2 8/8] arm64: dts: qcom: sc7280: audioreach: Disable legacy path clock nodes
Date:   Thu, 5 Jan 2023 19:07:55 +0530
Message-ID: <1672925875-2107-9-git-send-email-quic_srivasam@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1672925875-2107-1-git-send-email-quic_srivasam@quicinc.com>
References: <1672925875-2107-1-git-send-email-quic_srivasam@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ygNOXtA2FTftNLN4xEjhk4FzEN6jN1Bc
X-Proofpoint-ORIG-GUID: ygNOXtA2FTftNLN4xEjhk4FzEN6jN1Bc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-05_04,2023-01-05_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0
 mlxscore=0 phishscore=0 mlxlogscore=937 malwarescore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301050107
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Disable legacy path clock nodes to avoid conflicts with audioreach
clock node.

Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Tested-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
---
 .../boot/dts/qcom/sc7280-herobrine-audioreach-wcd9385.dtsi   | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-audioreach-wcd9385.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine-audioreach-wcd9385.dtsi
index 175ed9c..a88b305 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-audioreach-wcd9385.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-audioreach-wcd9385.dtsi
@@ -190,3 +190,15 @@
 &swr1 {
 	resets = <&lpasscc LPASS_AUDIO_SWR_TX_CGCR>;
 };
+
+&lpass_aon {
+	status = "disabled";
+};
+
+&lpass_audiocc {
+	status = "disabled";
+};
+
+&lpass_core {
+	status = "disabled";
+};
-- 
2.7.4

