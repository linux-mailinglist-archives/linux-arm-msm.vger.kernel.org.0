Return-Path: <linux-arm-msm+bounces-2638-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A87C87FE735
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Nov 2023 03:41:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 495BAB21036
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Nov 2023 02:41:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B08D111AB;
	Thu, 30 Nov 2023 02:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="aX+sBUso"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4261E10F0;
	Wed, 29 Nov 2023 18:41:30 -0800 (PST)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AU2U8Dc028445;
	Thu, 30 Nov 2023 02:41:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=j238Yxooc4qTG9PLIHMfDLq47mg7/fDUNDBTLUxSb3g=;
 b=aX+sBUsoWs0X67I/fROjha3iT95FSaQb2p4LWrmKE6lgwUlqNKstlDcZHrXoxbmt/Pow
 z4tBy0BvXfR1fsXb3yhJ2N5jFhIYZy4XOgaR1OHn82oS3a80sTe/czblNByRNmFSDMzO
 nlTPkOdmyXVYJ34kc7SP67rKzW4Ew/sqWjrhO2onh+OKfkskyc8BJzb0hbogTMfobQ2s
 WaMaxwvZ63ZSyRzyby8XmEGtJzmuNsnD95tklT8wY/e8iNQ/J5HKMSwjhjfeZ2J1S7LO
 Vo5HJPg1fbibzkpAq2WzSwxssiSC31FxkpOUyE07s25Vol0QR5GUm+ktkLVvF9DL8xca 2Q== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3upbu58pu1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Nov 2023 02:41:27 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AU2fQTp028779
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Nov 2023 02:41:26 GMT
Received: from tengfan2-gv.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 29 Nov 2023 18:41:21 -0800
From: Tengfei Fan <quic_tengfan@quicinc.com>
To: <andersson@kernel.org>, <agross@kernel.org>, <konrad.dybcio@linaro.org>,
        <linus.walleij@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>,
        Tengfei Fan
	<quic_tengfan@quicinc.com>
Subject: [PATCH v5 4/4] pinctrl: qcom: sm4450: correct incorrect address offset
Date: Thu, 30 Nov 2023 10:40:46 +0800
Message-ID: <20231130024046.25938-5-quic_tengfan@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231130024046.25938-1-quic_tengfan@quicinc.com>
References: <20231130024046.25938-1-quic_tengfan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 3u7teUg1RMyEZPP3yz-L_OuC5EpW8tA9
X-Proofpoint-GUID: 3u7teUg1RMyEZPP3yz-L_OuC5EpW8tA9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-29_21,2023-11-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015 impostorscore=0
 mlxscore=0 priorityscore=1501 phishscore=0 adultscore=0 mlxlogscore=889
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311300018

The address offset of 0x100000 is already provided in SM4450 DTSI, so
subtract 0x100000 from the offset which used by ufs and sdc.

Suggested-by: Can Guo <quic_cang@quicinc.com>
Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
---
 drivers/pinctrl/qcom/pinctrl-sm4450.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-sm4450.c b/drivers/pinctrl/qcom/pinctrl-sm4450.c
index 49e2e3a7a9cb..5496f955ed2a 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm4450.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm4450.c
@@ -936,14 +936,14 @@ static const struct msm_pingroup sm4450_groups[] = {
 	[133] = PINGROUP(133, _, phase_flag, _, _, _, _, _, _, _),
 	[134] = PINGROUP(134, tsense_pwm1_out, tsense_pwm2_out, _, _, _, _, _, _, _),
 	[135] = PINGROUP(135, _, phase_flag, _, _, _, _, _, _, _),
-	[136] = UFS_RESET(ufs_reset, 0x197000),
-	[137] = SDC_QDSD_PINGROUP(sdc1_rclk, 0x18c004, 0, 0),
-	[138] = SDC_QDSD_PINGROUP(sdc1_clk, 0x18c000, 13, 6),
-	[139] = SDC_QDSD_PINGROUP(sdc1_cmd, 0x18c000, 11, 3),
-	[140] = SDC_QDSD_PINGROUP(sdc1_data, 0x18c000, 9, 0),
-	[141] = SDC_QDSD_PINGROUP(sdc2_clk, 0x18f000, 14, 6),
-	[142] = SDC_QDSD_PINGROUP(sdc2_cmd, 0x18f000, 11, 3),
-	[143] = SDC_QDSD_PINGROUP(sdc2_data, 0x18f000, 9, 0),
+	[136] = UFS_RESET(ufs_reset, 0x97000),
+	[137] = SDC_QDSD_PINGROUP(sdc1_rclk, 0x8c004, 0, 0),
+	[138] = SDC_QDSD_PINGROUP(sdc1_clk, 0x8c000, 13, 6),
+	[139] = SDC_QDSD_PINGROUP(sdc1_cmd, 0x8c000, 11, 3),
+	[140] = SDC_QDSD_PINGROUP(sdc1_data, 0x8c000, 9, 0),
+	[141] = SDC_QDSD_PINGROUP(sdc2_clk, 0x8f000, 14, 6),
+	[142] = SDC_QDSD_PINGROUP(sdc2_cmd, 0x8f000, 11, 3),
+	[143] = SDC_QDSD_PINGROUP(sdc2_data, 0x8f000, 9, 0),
 };
 
 static const struct msm_gpio_wakeirq_map sm4450_pdc_map[] = {
-- 
2.17.1


