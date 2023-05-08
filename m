Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 212E76FB3B7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 May 2023 17:26:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234511AbjEHP02 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 May 2023 11:26:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234500AbjEHP0P (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 May 2023 11:26:15 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47D1486B5;
        Mon,  8 May 2023 08:26:14 -0700 (PDT)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 348EbCnO002036;
        Mon, 8 May 2023 15:26:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=lh+BIRLaESsRal0lrbpPZMO3xptdBsUFbfqxHhcptc8=;
 b=SahD0KuH8ubfIHKpAOpWebyKCKKjLxx3hkPRoZhLWHxAAK2m5S38aVG0zGMRLrC9MYFq
 nRaj6rtlmgMQATHo+csVF/4S9bFv55JW0wfRNRJOXymwDl5XPw/0sek80m/ZOVTp66+W
 XeQ06z54O6sQoQinGeg3MboyCJ4c4F375KOtAgJV89cENXDtIwZR6dGIBSXJ3mzmP0m5
 aFRVbE6+0zhX9QA5D6lINUbbvH5qDqimHNcXTxTB0a3a7WFg6n82fQrOqHxtzO4/DpVI
 9E5iz/w2/brvUuv2SSWYZ4e6FrKcH3SPiMme0dNDA48oxr0LAoGkaBagohOn8qhMPCHl Cg== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qf30j856g-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 08 May 2023 15:26:11 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 348FQAbL005614
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 8 May 2023 15:26:10 GMT
Received: from kathirav-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Mon, 8 May 2023 08:26:07 -0700
From:   Kathiravan T <quic_kathirav@quicinc.com>
To:     <agross@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
CC:     Kathiravan T <quic_kathirav@quicinc.com>
Subject: [PATCH 2/2] soc: qcom: socinfo: Add Soc ID for IPQ5312 and IPQ5302
Date:   Mon, 8 May 2023 20:55:43 +0530
Message-ID: <20230508152543.14969-3-quic_kathirav@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230508152543.14969-1-quic_kathirav@quicinc.com>
References: <20230508152543.14969-1-quic_kathirav@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Yxu-3QVuZV8ufm-Hg28dOEfbbeE-zkMo
X-Proofpoint-GUID: Yxu-3QVuZV8ufm-Hg28dOEfbbeE-zkMo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-08_11,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 suspectscore=0
 bulkscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 mlxscore=0
 mlxlogscore=855 impostorscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2305080102
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the SoC ID for IPQ5312 and IPQ5302, which are belongs to the family
of IPQ5332 SoC.

Signed-off-by: Kathiravan T <quic_kathirav@quicinc.com>
---
 drivers/soc/qcom/socinfo.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index c2e4a57dd666..608c4f57c6c7 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -466,6 +466,8 @@ static const struct soc_id soc_id[] = {
 	{ qcom_board_id(QRU1062) },
 	{ qcom_board_id(IPQ5332) },
 	{ qcom_board_id(IPQ5322) },
+	{ qcom_board_id(IPQ5312) },
+	{ qcom_board_id(IPQ5302) },
 };
 
 static const char *socinfo_machine(struct device *dev, unsigned int id)
-- 
2.17.1

