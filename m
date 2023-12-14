Return-Path: <linux-arm-msm+bounces-4730-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C065812D38
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 11:41:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B53951C2098D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 10:41:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60CA33BB5F;
	Thu, 14 Dec 2023 10:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mgGhoHQX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5450E3;
	Thu, 14 Dec 2023 02:41:38 -0800 (PST)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BE2aLdQ023225;
	Thu, 14 Dec 2023 10:41:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=qcppdkim1; bh=VHVrSPE
	x7yMYOapnlmrO0EMsqodHECDF4yBhBZxHFkA=; b=mgGhoHQXtUY5buFzNBWWdqe
	0f8bxtHeOanP9rRvyjBOYpc3fa+EGJPhuXSxumsjqhbCuBEu+r9xDWJXBVE2on8F
	JorqqXwO4bo9Fj6nZ60a3ROwdRv0BS4Nj6Gz+rQOVNGqwrC6EdL6oVvNPBoOAw86
	JcPH9Pp1CkHJa+5SpFHM5GITcBDQ7ARmmc4qgl4rl0W38fNpGJSsShrJ3pQ5r8IJ
	Lv/klCChFg1xR15aimuCTiRAC8TAj4H0s2/yANJ/o8cmvfFMW650WNBCPiPysiLv
	CnIdI5k39jLfr7DcPQCSykEDUC47kN6riNKWU88zdL0TsRmWrlL+DpCIhRO0LKg=
	=
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uyqd512qj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Dec 2023 10:41:34 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3BEAfXj7004154
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Dec 2023 10:41:33 GMT
Received: from hu-varada-blr.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 14 Dec 2023 02:41:30 -0800
From: Varadarajan Narayanan <quic_varada@quicinc.com>
To: <agross@kernel.org>, <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
        <lgirdwood@gmail.com>, <broonie@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <stable@vger.kernel.org>, Varadarajan Narayanan <quic_varada@quicinc.com>
Subject: [PATCH] regulator: qcom_smd: Add LDO5 MP5496 regulator
Date: Thu, 14 Dec 2023 16:10:52 +0530
Message-ID: <20231214104052.3267039-1-quic_varada@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: tLRtoh7logdbI6pqJzVZmROlrpw5qusD
X-Proofpoint-ORIG-GUID: tLRtoh7logdbI6pqJzVZmROlrpw5qusD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxscore=0
 adultscore=0 clxscore=1011 suspectscore=0 phishscore=0 bulkscore=0
 malwarescore=0 mlxlogscore=772 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312140071

Add support for LDO5 regulator. This is used by IPQ9574 USB.

Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
---
 drivers/regulator/qcom_smd-regulator.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/regulator/qcom_smd-regulator.c b/drivers/regulator/qcom_smd-regulator.c
index 09c471a0ba2e..d1be9568025e 100644
--- a/drivers/regulator/qcom_smd-regulator.c
+++ b/drivers/regulator/qcom_smd-regulator.c
@@ -796,6 +796,7 @@ static const struct rpm_regulator_data rpm_mp5496_regulators[] = {
 	{ "s1", QCOM_SMD_RPM_SMPA, 1, &mp5496_smps, "s1" },
 	{ "s2", QCOM_SMD_RPM_SMPA, 2, &mp5496_smps, "s2" },
 	{ "l2", QCOM_SMD_RPM_LDOA, 2, &mp5496_ldoa2, "l2" },
+	{ "l5", QCOM_SMD_RPM_LDOA, 5, &mp5496_ldoa2, "l5" },
 	{}
 };
 
-- 
2.34.1


