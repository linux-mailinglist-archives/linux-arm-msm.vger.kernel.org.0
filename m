Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8AA9E5E9890
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Sep 2022 06:58:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230060AbiIZE6M (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Sep 2022 00:58:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229477AbiIZE6L (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Sep 2022 00:58:11 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07832275EC;
        Sun, 25 Sep 2022 21:58:10 -0700 (PDT)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28Q4efGM013425;
        Mon, 26 Sep 2022 04:58:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=RtwR3z5UZ9Suonp0o4kOiRdR+7hLaNuiVFpZxZOdQuw=;
 b=VcGrljgtZLrLuqX8WO5o8YethlqUufCv08VStNIOdkOKzPdtmuT2Wz9Nd2vH7Uh31fbh
 ZFgjr+jAc28YRL1IymrpKcFe1553C508KJ6FpA8tV0xFRxgxJxrOScqs2sA5b85shy0o
 uJC67Vi24YVcq9O9qN85Mom22VyOeNv4SZ0St36EXmhY4Nyk+slTrm2HOMyMkBJ0C99R
 eWM1iG7C7ZD1f6nNqnr2mODbbsfmkrGZ9bND6s45aIOM+vl/2/B0leLaKK9cLFZM8o9b
 w0NjxaCoA7jPjflD1czr3LLQjo7RH0omv0HD7wFowd8PKFhEt5LL5RvNEQ73UODZqq+a lA== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jsqkmb9df-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 26 Sep 2022 04:58:03 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 28Q4w28d011408
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 26 Sep 2022 04:58:02 GMT
Received: from mpubbise-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Sun, 25 Sep 2022 21:57:59 -0700
From:   Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
To:     <agross@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@somainline.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>
CC:     <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        "Manikanta Pubbisetty" <quic_mpubbise@quicinc.com>
Subject: [PATCH v2] arm64: dts: qcom: sc7280: Add nodes to support WoW on WCN6750
Date:   Mon, 26 Sep 2022 10:27:35 +0530
Message-ID: <20220926045735.719-1-quic_mpubbise@quicinc.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: q6bON9M2bUHOAh2Ts-B9neDGO6GxKCNL
X-Proofpoint-GUID: q6bON9M2bUHOAh2Ts-B9neDGO6GxKCNL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-26_03,2022-09-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 mlxlogscore=608 lowpriorityscore=0
 suspectscore=0 adultscore=2 impostorscore=0 mlxscore=0 phishscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209260030
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add DT nodes to support WoW (Wake on Wireless) feature on WCN6750
WiFi hardware on SC7280 SoC.

Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
---
Changes from V1:
- Rebased on ToT

 arch/arm64/boot/dts/qcom/sc7280.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 212580316d3e..3f6a3f575339 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -752,6 +752,17 @@ wpss_smp2p_in: slave-kernel {
 			interrupt-controller;
 			#interrupt-cells = <2>;
 		};
+
+		wlan_smp2p_out: wlan-ap-to-wpss {
+			qcom,entry-name = "wlan";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		wlan_smp2p_in: wlan-wpss-to-ap {
+			qcom,entry-name = "wlan";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
 	};
 
 	pmu {
@@ -2004,6 +2015,8 @@ wifi: wifi@17a10040 {
 			qcom,rproc = <&remoteproc_wpss>;
 			memory-region = <&wlan_fw_mem>, <&wlan_ce_mem>;
 			status = "disabled";
+			qcom,smem-states = <&wlan_smp2p_out 0>;
+			qcom,smem-state-names = "wlan-smp2p-out";
 		};
 
 		pcie1: pci@1c08000 {

base-commit: aaa11ce2ffc84166d11c4d2ac88c3fcf75425fbd
-- 
2.37.1

