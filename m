Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC118600F90
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Oct 2022 14:54:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230148AbiJQMy1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Oct 2022 08:54:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230171AbiJQMyZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Oct 2022 08:54:25 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FA6EBF9;
        Mon, 17 Oct 2022 05:54:23 -0700 (PDT)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29H8TlNU017722;
        Mon, 17 Oct 2022 12:54:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=su8eW7dQTa3Sj237U1VVGbI9mWpWEi1OTDmVogmKI6o=;
 b=MjnZYRnncod/tWFz0TaIPSTvQ6SIAUclBG2GzyoxiclnjnpxPfEWYnFDLeObkMPhjrwX
 RSkjeUTWCO/1QCiN+nLUjaj+8HV1VPc1PcDqdt5BccT9pqkRUNyxeGDzZ9sx0mSumbT2
 UYdTkPbwLhr7f+NAVdb/muO/tObwoRh+EvCSWHFddwt4/tic6Qr47ncQ4WJLrW31ZnEM
 f0KccCzmIlGa/Sigt3PyrG9VlP+FHbbAYJgKg10HmSDqGXcDcE+EG9ghmwOwvefNtsLQ
 mRz9gtLkxPv8m1C+ALgIK02fRAQZsANlcf86ceW27ILmVVNy2JdZV0CdxjZTE06lpIOF Lw== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3k7p5fvwdm-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 17 Oct 2022 12:54:12 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 29HCsCvZ008485
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 17 Oct 2022 12:54:12 GMT
Received: from mpubbise-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Mon, 17 Oct 2022 05:54:09 -0700
From:   Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
To:     <agross@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@somainline.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>
CC:     <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        "Manikanta Pubbisetty" <quic_mpubbise@quicinc.com>
Subject: [PATCH v3 2/2] arm64: dts: qcom: sc7280: Add nodes to support WoW on WCN6750
Date:   Mon, 17 Oct 2022 18:23:46 +0530
Message-ID: <20221017125346.3691-3-quic_mpubbise@quicinc.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221017125346.3691-1-quic_mpubbise@quicinc.com>
References: <20221017125346.3691-1-quic_mpubbise@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 1f2X3QUiyNHEHnoQCDTFeaEGq9is6Xsn
X-Proofpoint-GUID: 1f2X3QUiyNHEHnoQCDTFeaEGq9is6Xsn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-17_10,2022-10-17_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=619
 suspectscore=0 mlxscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210170075
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
-- 
2.38.0

