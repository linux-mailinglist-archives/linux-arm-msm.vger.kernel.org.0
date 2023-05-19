Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45FC3709886
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 May 2023 15:39:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231929AbjESNjg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 May 2023 09:39:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231948AbjESNje (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 May 2023 09:39:34 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAF9C107;
        Fri, 19 May 2023 06:39:24 -0700 (PDT)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34JBfF5w029249;
        Fri, 19 May 2023 13:39:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=xYPUJ3QZMSzoXLVdRqa5hhTxfoiuntDYroF82cbFCU4=;
 b=bp22I6/Utxy2Wgs+sEN18lE+6bVDHBJfi64fiIsM5m1DnfaQcmAh6lkyz3FLVpHz+AI5
 e19M0OFiTM7QwoA3ry15aw/9X5w6EfPrVfxkjyJ6gCOvvGJsrNoSvV/rgkQ5wQ749tAL
 0qlXsejUdfsdZANp/BcqlXNQbtkx3oRZtrh5wBLaeqobpQP7UKcns4dvall4y+BQ17CU
 9318jj8HQdg3rgQ/k3RhI1B0C/p42am9IJ+kkX8vNg2ekmV7J2ivMKYgMeR3Xk7UKYYK
 wzk40kicans8i0mEjhoDnvvvEXntxCLhUkQGQ7fUeBvrKviCzHYeue8WSkkjwA1dUP+2 jQ== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qncbhus46-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 19 May 2023 13:39:21 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34JDdJ2x010104
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 19 May 2023 13:39:19 GMT
Received: from kathirav-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Fri, 19 May 2023 06:39:02 -0700
From:   Kathiravan T <quic_kathirav@quicinc.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC:     Kathiravan T <quic_kathirav@quicinc.com>
Subject: [PATCH V3 1/3] arm64: dts: qcom: ipq5332: rename mi01.2 dts to rdp441
Date:   Fri, 19 May 2023 19:08:42 +0530
Message-ID: <20230519133844.23512-2-quic_kathirav@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230519133844.23512-1-quic_kathirav@quicinc.com>
References: <20230519133844.23512-1-quic_kathirav@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: SKMaJASiRy8wF7qCromAUaM7KeLXydQg
X-Proofpoint-ORIG-GUID: SKMaJASiRy8wF7qCromAUaM7KeLXydQg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-19_09,2023-05-17_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 impostorscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=992 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2304280000 definitions=main-2305190114
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

To align with ipq5332-rdp468.dts, lets rename the mi01.2 dts as well to
ipq5332-rdp441.dts.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Kathiravan T <quic_kathirav@quicinc.com>
---
Changes in V3:
	- No changes
Changes in V2:
	- Pick up R-b tag

 arch/arm64/boot/dts/qcom/Makefile                               | 2 +-
 .../boot/dts/qcom/{ipq5332-mi01.2.dts => ipq5332-rdp441.dts}    | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename arch/arm64/boot/dts/qcom/{ipq5332-mi01.2.dts => ipq5332-rdp441.dts} (100%)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index e311ba675f35..bd09e2029df7 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -3,7 +3,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= apq8016-sbc.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8094-sony-xperia-kitakami-karin_windy.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-db820c.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-ifc6640.dtb
-dtb-$(CONFIG_ARCH_QCOM)	+= ipq5332-mi01.2.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= ipq5332-rdp441.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5332-rdp468.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq6018-cp01-c1.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq8074-hk01.dtb
diff --git a/arch/arm64/boot/dts/qcom/ipq5332-mi01.2.dts b/arch/arm64/boot/dts/qcom/ipq5332-rdp441.dts
similarity index 100%
rename from arch/arm64/boot/dts/qcom/ipq5332-mi01.2.dts
rename to arch/arm64/boot/dts/qcom/ipq5332-rdp441.dts
-- 
2.17.1

