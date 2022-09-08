Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 777635B178B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Sep 2022 10:47:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231738AbiIHIrX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Sep 2022 04:47:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231668AbiIHIq6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Sep 2022 04:46:58 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A46B611CD7D;
        Thu,  8 Sep 2022 01:46:32 -0700 (PDT)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28887FZn027212;
        Thu, 8 Sep 2022 08:46:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=qcppdkim1;
 bh=OQgOSeY0bwmQojKCP5hBVuycM88QfDaHASZwcrP+L3o=;
 b=PzpFCyRygTH0mg93HZVNiwhbMGXt2zpShCeQI8MdA2JXx8AwPp1fKm6X/7DefscmGmZa
 8KJeUJBmD9XaZFxncvVNgtZQmPX8SgTwx2Hiv4l0ihb9ENXL7VnWIJjoEPSwPTXdj9uc
 uftn6sL9cAfVIwflG33Jw7M+Grqnc4/0bb91ZzCbyAyLf+v0SWO5+b7p1pcMcg6XA25l
 MQoHYO2tSOWd7IPxCPF3+LiMsFuUpzHUEIqwyFKEcVBlpYR/fYZ9R8HK1suFUXYpClHz
 XXY2YWHcjWv1WWYU03fJM1GEUkCyoDfoWFesTEaa/WQIeP86+c6PtbJ7jcLEg4X2d+NX ig== 
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jfaa5gcv8-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 08 Sep 2022 08:46:23 +0000
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
        by APBLRPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 2888kJIL014067;
        Thu, 8 Sep 2022 08:46:19 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 3jc00m3e11-1;
        Thu, 08 Sep 2022 08:46:19 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
        by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2888kJ6u014060;
        Thu, 8 Sep 2022 08:46:19 GMT
Received: from hu-sgudaval-hyd.qualcomm.com (hu-krichai-hyd.qualcomm.com [10.213.110.37])
        by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 2888kJmV014055;
        Thu, 08 Sep 2022 08:46:19 +0000
Received: by hu-sgudaval-hyd.qualcomm.com (Postfix, from userid 4058933)
        id B08FF449F; Thu,  8 Sep 2022 14:16:18 +0530 (+0530)
From:   Krishna chaitanya chundru <quic_krichai@quicinc.com>
To:     helgaas@kernel.org
Cc:     linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, mka@chromium.org,
        quic_vbadigan@quicinc.com, quic_hemantk@quicinc.com,
        quic_nitegupt@quicinc.com, quic_skananth@quicinc.com,
        quic_ramkri@quicinc.com, manivannan.sadhasivam@linaro.org,
        swboyd@chromium.org, dmitry.baryshkov@linaro.org,
        Krishna chaitanya chundru <quic_krichai@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS)
Subject: [PATCH v4 1/2] arm64: dts: qcom: sc7280: Add missing aggre0, aggre1 clocks
Date:   Thu,  8 Sep 2022 14:16:15 +0530
Message-Id: <1662626776-19636-2-git-send-email-quic_krichai@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1662626776-19636-1-git-send-email-quic_krichai@quicinc.com>
References: <1662626776-19636-1-git-send-email-quic_krichai@quicinc.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: UVkVqUQhMcBGj6WgROVbmeA_xtE7bD-5
X-Proofpoint-ORIG-GUID: UVkVqUQhMcBGj6WgROVbmeA_xtE7bD-5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-08_06,2022-09-07_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 mlxlogscore=991 lowpriorityscore=0 phishscore=0 adultscore=0
 suspectscore=0 priorityscore=1501 clxscore=1011 malwarescore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209080031
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add missing aggre0, aggre1 clocks.

Signed-off-by: Krishna chaitanya chundru <quic_krichai@quicinc.com>
---
changes since v3:
	- Changed the order of the clocks added.
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index ad04025..357eae1 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -2043,7 +2043,9 @@
 				 <&gcc GCC_PCIE_1_SLV_AXI_CLK>,
 				 <&gcc GCC_PCIE_1_SLV_Q2A_AXI_CLK>,
 				 <&gcc GCC_AGGRE_NOC_PCIE_TBU_CLK>,
-				 <&gcc GCC_DDRSS_PCIE_SF_CLK>;
+				 <&gcc GCC_DDRSS_PCIE_SF_CLK>,
+				 <&gcc GCC_AGGRE_NOC_PCIE_CENTER_SF_AXI_CLK>,
+				 <&gcc GCC_AGGRE_NOC_PCIE_1_AXI_CLK>;
 
 			clock-names = "pipe",
 				      "pipe_mux",
@@ -2055,7 +2057,9 @@
 				      "bus_slave",
 				      "slave_q2a",
 				      "tbu",
-				      "ddrss_sf_tbu";
+				      "ddrss_sf_tbu",
+				      "aggre0",
+				      "aggre1";
 
 			assigned-clocks = <&gcc GCC_PCIE_1_AUX_CLK>;
 			assigned-clock-rates = <19200000>;
-- 
2.7.4

