Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D14AC73B3BA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jun 2023 11:36:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231644AbjFWJgc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Jun 2023 05:36:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231609AbjFWJgS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Jun 2023 05:36:18 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 581041BFC;
        Fri, 23 Jun 2023 02:36:17 -0700 (PDT)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35N9U8n5018099;
        Fri, 23 Jun 2023 09:36:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=RFFW8R5Zw/oqoEdth08RuEqeCok+L97L63dMCmO1dSk=;
 b=hPhrPcTZLxaKKqhodhg6WNU5tIxyzlRl7giFVdkphiJoRqj2aQnlHViclYrH+zXN8TTl
 NEMWyYKznyLCUStAoXMLXV8+599cQh3HW4WXXj9oP3rsRZeB1MRIPsV26P+mbbgzlrim
 zlXo02Fb15in/tJRW4+IvvcaCF4FcA1TzEvUS/TnrW/VmnHM1Gl1wXTuoJ/YKPcvYhXt
 a+OakYlfvo60Bo1PeV5Ps53kMnWul2z2aqyl03inlI47m6esWqCjmusAboyC1vbezsaT
 9HaFg0NkxDaKZRBQdmtjDUZZNBhqb/1uO2gpBu6LlNS0MSIVpqsosL6xhgwAceHAVDR6 nw== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rcurrhdae-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 23 Jun 2023 09:36:11 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
        by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 35N9a9Gp019705
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 23 Jun 2023 09:36:10 GMT
Received: from win-platform-upstream01.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Fri, 23 Jun 2023 02:36:05 -0700
From:   Sricharan Ramabadhran <quic_srichara@quicinc.com>
To:     <agross@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <sboyd@kernel.org>, <mturquette@baylibre.com>, <mani@kernel.org>,
        <lpieralisi@kernel.org>, <bhelgaas@google.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-pci@vger.kernel.org>, <quic_srichara@quicinc.com>
Subject: [PATCH 2/4] dt-bindings: clock: qcom: Add reset for WCSSAON
Date:   Fri, 23 Jun 2023 15:04:43 +0530
Message-ID: <20230623093445.3977772-3-quic_srichara@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230623093445.3977772-1-quic_srichara@quicinc.com>
References: <20230623093445.3977772-1-quic_srichara@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: abPeyWokl9CrXuB9KPaSWCAJ2tFf0skF
X-Proofpoint-ORIG-GUID: abPeyWokl9CrXuB9KPaSWCAJ2tFf0skF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-23_04,2023-06-22_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 malwarescore=0 mlxlogscore=999 suspectscore=0 spamscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306230086
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add binding for WCSSAON reset required for Q6v5 reset on IPQ8074 SoC.

Acked-by: Rob Herring <robh@kernel.org>
Acked-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
---
 Previous post was here
	https://lore.kernel.org/linux-arm-msm/20190724203737.GA27783@bogus/

 include/dt-bindings/clock/qcom,gcc-ipq8074.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/qcom,gcc-ipq8074.h b/include/dt-bindings/clock/qcom,gcc-ipq8074.h
index f9ea55811104..e47cbf7394aa 100644
--- a/include/dt-bindings/clock/qcom,gcc-ipq8074.h
+++ b/include/dt-bindings/clock/qcom,gcc-ipq8074.h
@@ -381,6 +381,7 @@
 #define GCC_NSSPORT4_RESET			143
 #define GCC_NSSPORT5_RESET			144
 #define GCC_NSSPORT6_RESET			145
+#define GCC_WCSSAON_RESET			146
 
 #define USB0_GDSC				0
 #define USB1_GDSC				1
-- 
2.34.1

