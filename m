Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E746749CA3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jul 2023 14:50:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232225AbjGFMus (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Jul 2023 08:50:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232206AbjGFMur (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Jul 2023 08:50:47 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 350621FC1;
        Thu,  6 Jul 2023 05:50:16 -0700 (PDT)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 366CfEJC019662;
        Thu, 6 Jul 2023 12:50:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=qcppdkim1;
 bh=mrrQfJyScYzURQREC3hWOc6S03ZHdGdpB8wHRMI6UcI=;
 b=eaZv1BYKYJcxXvIir+ojRED96pM6b2bugyHoukP9WWeXiWIz77ucyEtPr0TjLubnxwuw
 8Dx48aFiixXG7QMhCpoUSPSmFs06nUPaB5qdwCGA4T67GR6yjQtZLDk6eLIBxdcNMqS9
 NyLZc1XxyvpezGaRk8y+OfMg5Ky+kGIazvy+29Pyh8boUzT5gHKUeWeEuXcC1S61hO5Z
 WlgVT72STplfeUg+QkAsB5UYMBQsUpJN91FVjFxX070COIg4G7FqATYSgyGjnBL6VOi2
 NBWqkxhJMQgAzmQQDi+vl6/UGYJpK4q/SdyHL68SBs+6SKLfU/3FS65NaG2/swjhh0W3 SA== 
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rntctrdhu-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 06 Jul 2023 12:50:03 +0000
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
        by APBLRPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 366Co0Pr024162;
        Thu, 6 Jul 2023 12:50:00 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 3rjd7kywam-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Thu, 06 Jul 2023 12:50:00 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
        by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 366Co0w9024155;
        Thu, 6 Jul 2023 12:50:00 GMT
Received: from hu-sgudaval-hyd.qualcomm.com (hu-rohiagar-hyd.qualcomm.com [10.213.106.138])
        by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 366CnxVm024148;
        Thu, 06 Jul 2023 12:50:00 +0000
Received: by hu-sgudaval-hyd.qualcomm.com (Postfix, from userid 3970568)
        id 6159F5FF3; Thu,  6 Jul 2023 18:19:59 +0530 (+0530)
From:   Rohit Agarwal <quic_rohiagar@quicinc.com>
To:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Rohit Agarwal <quic_rohiagar@quicinc.com>
Subject: [PATCH 1/3] dt-bindings: power: rpmpd: Add Generic RPM(h) PD indexes
Date:   Thu,  6 Jul 2023 18:19:51 +0530
Message-Id: <1688647793-20950-2-git-send-email-quic_rohiagar@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1688647793-20950-1-git-send-email-quic_rohiagar@quicinc.com>
References: <1688647793-20950-1-git-send-email-quic_rohiagar@quicinc.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 0a-kGI2M2KHcmaznxVo74Gd1carwJWFR
X-Proofpoint-ORIG-GUID: 0a-kGI2M2KHcmaznxVo74Gd1carwJWFR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-06_09,2023-07-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=502 priorityscore=1501 adultscore=0 spamscore=0 phishscore=0
 malwarescore=0 impostorscore=0 mlxscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307060115
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add Generic RPM(h) Power Domain indexes that can be used
for all the Qualcomm SoC henceforth.

Signed-off-by: Rohit Agarwal <quic_rohiagar@quicinc.com>
Suggested-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 include/dt-bindings/power/qcom-rpmpd.h | 49 ++++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/include/dt-bindings/power/qcom-rpmpd.h b/include/dt-bindings/power/qcom-rpmpd.h
index 83be996..6498251 100644
--- a/include/dt-bindings/power/qcom-rpmpd.h
+++ b/include/dt-bindings/power/qcom-rpmpd.h
@@ -4,6 +4,55 @@
 #ifndef _DT_BINDINGS_POWER_QCOM_RPMPD_H
 #define _DT_BINDINGS_POWER_QCOM_RPMPD_H
 
+/* Generic RPMH Power Domain Indexes */
+#define RPMHPD_CX		0
+#define RPMHPD_MX		1
+#define RPMHPD_CX_AO		2
+#define RPMHPD_MX_AO		3
+#define RPMHPD_GFX		4
+#define RPMHPD_MSS		5
+#define RPMHPD_EBI		6
+#define RPMHPD_LCX		7
+#define RPMHPD_LMX		8
+#define RPMHPD_MMCX		9
+#define RPMHPD_MMCX_AO		10
+#define RPMHPD_MXC		11
+#define RPMHPD_MXC_AO		12
+#define RPMHPD_NSP		13
+#define RPMHPD_NSP0		14
+#define RPMHPD_NSP1		15
+#define RPMHPD_QPHY		16
+#define RPMHPD_DDR		17
+#define RPMHPD_XO		18
+
+/* Generic RPM Power Domain Indexes */
+#define RPMPD_VDDCX		0
+#define RPMPD_VDDCX_AO		1
+#define RPMPD_VDDMX		2
+#define RPMPD_VDDMX_AO		3
+#define RPMPD_VDDCX_VFL		4
+#define RPMPD_VDDMX_VFL		5
+#define RPMPD_VDDCX_VFC		6
+#define RPMPD_LPI_CX		7
+#define RPMPD_LPI_MX		8
+#define RPMPD_SSCCX		9
+#define RPMPD_SSCCX_VFL		10
+#define RPMPD_SSCMX		11
+#define RPMPD_SSCMX_VFL		12
+#define RPMPD_VDDSSCX		13
+#define RPMPD_VDDSSCX_VFC	14
+#define RPMPD_VDDGFX		15
+#define RPMPD_VDDGFX_VFC	16
+#define RPMPD_VDDGX		17
+#define RPMPD_VDDGX_AO		18
+#define RPMPD_VDDMDCX		19
+#define RPMPD_VDDMDCX_AO	20
+#define RPMPD_VDDMDCX_VFC	21
+#define RPMPD_VDDMD		22
+#define RPMPD_VDDMD_AO		23
+#define RPMPD_LPICX_VFL		24
+#define RPMPD_LPIMX_VFL		25
+
 /* SA8775P Power Domain Indexes */
 #define SA8775P_CX	0
 #define SA8775P_CX_AO	1
-- 
2.7.4

