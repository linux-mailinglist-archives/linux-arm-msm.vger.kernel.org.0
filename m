Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 82F0B673467
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Jan 2023 10:28:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230159AbjASJ2p (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Jan 2023 04:28:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230092AbjASJ2Z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Jan 2023 04:28:25 -0500
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 059426B992;
        Thu, 19 Jan 2023 01:28:11 -0800 (PST)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30J5tRlp021606;
        Thu, 19 Jan 2023 09:28:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=It6HwbxzBzijiUrWxDwnPsxlQeS2oJacAX0qTbCGG8Y=;
 b=dpUOlzY6VnuxnGj423L99/8g34XwEQzwl7wjmJA8pgnPSJFlbBepENwTvmcKxB0ImjYK
 yWoQzFCRJGhNkmqldjuwGFAHAerE8c9RqRrRIBYmPhSf9JwPDtASDtE26G0cbmoMlRE2
 72XjywaqcO7owoBTJJbjoYEbGHqyUVcskaqKwt2lj13KZ6EutXm8Yhi9lhUK6w6cTpYY
 Jw7oGUfoyDDrR8ZLfiVvV/MQbF2DD4f+9RSl2STnNg2/jRFCnxyscsa1mph8IIKLxu9p
 VeyVrzj8EVxYSAID4YEsTTE8/uRa+qnbe3ueMHHtkPVQEdnZEHLAoMUA3Q3MqS51hCOc 9g== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3n6vg010sr-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 19 Jan 2023 09:28:04 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30J9S4dH016255
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 19 Jan 2023 09:28:04 GMT
Received: from hu-srivasam-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Thu, 19 Jan 2023 01:27:59 -0800
From:   Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
To:     <swboyd@chromium.org>, <agross@kernel.org>, <andersson@kernel.org>,
        <robh+dt@kernel.org>, <broonie@kernel.org>,
        <quic_plai@quicinc.com>, <krzysztof.kozlowski+dt@linaro.org>,
        <konrad.dybcio@somainline.org>, <mturquette@baylibre.com>,
        <sboyd@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_rohkumar@quicinc.com>
CC:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Subject: [PATCH v4 4/6] clk: qcom: lpasscorecc-sc7280: Skip lpasscorecc registration
Date:   Thu, 19 Jan 2023 14:57:22 +0530
Message-ID: <1674120444-23706-5-git-send-email-quic_srivasam@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1674120444-23706-1-git-send-email-quic_srivasam@quicinc.com>
References: <1674120444-23706-1-git-send-email-quic_srivasam@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: s5BRqq364hVJx3w0vUwFBTpd-inbrlUR
X-Proofpoint-GUID: s5BRqq364hVJx3w0vUwFBTpd-inbrlUR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-19_07,2023-01-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 impostorscore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301190076
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Skip lpasscorecc clocks registration for ADSP based platforms
as it's causing NOC errors when ADSP based clocks are enabled.

Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Tested-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
---
 drivers/clk/qcom/lpasscorecc-sc7280.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/qcom/lpasscorecc-sc7280.c b/drivers/clk/qcom/lpasscorecc-sc7280.c
index 6ad19b0..3aa16d8 100644
--- a/drivers/clk/qcom/lpasscorecc-sc7280.c
+++ b/drivers/clk/qcom/lpasscorecc-sc7280.c
@@ -395,6 +395,9 @@ static int lpass_core_cc_sc7280_probe(struct platform_device *pdev)
 	const struct qcom_cc_desc *desc;
 	struct regmap *regmap;
 
+	if (of_property_read_bool(pdev->dev.of_node, "qcom,adsp-pil-mode"))
+		return 0;
+
 	lpass_core_cc_sc7280_regmap_config.name = "lpass_core_cc";
 	lpass_core_cc_sc7280_regmap_config.max_register = 0x4f004;
 	desc = &lpass_core_cc_sc7280_desc;
-- 
2.7.4

