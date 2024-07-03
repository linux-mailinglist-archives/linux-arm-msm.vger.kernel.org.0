Return-Path: <linux-arm-msm+bounces-25215-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A838A926B46
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jul 2024 00:13:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DA2F21C2164F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 22:13:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E48B313C8EE;
	Wed,  3 Jul 2024 22:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Y3Oh5/Fc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5507013D892;
	Wed,  3 Jul 2024 22:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720044787; cv=none; b=OPsRWPhp5dn6McC0QBQdr/3ey13fkV7arCsQGs90+wY021FkPA0c5hbJHx932TplNTGZQ7Vr0x309UeXOaGpLK1a+9UkAttj6Brb1aT3kx1+4RgsaVEIglmu27dumf8RhOn4dSpD2fnRtiRhBhHJ4Zc1wwLjEi3Xja+PlUlwqko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720044787; c=relaxed/simple;
	bh=9I1Vyx5wE4nOahuZQwkqWHmQDUlUqDYuwgxadc9/kn4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=I2yMjF65ZZQlA8RPTwiJszNggTtsEVx3/VK8hUJRVrbuHTnk10RFy8rF2UwktQzAcqX1pk7n0YeAyHvhTF3OjwqGVew9cKcwmxIaECYS0xlzgJ/MEm6P1oIVObC01tq3mso6bH+DwnDsPy1f3aGFRzBeGCWhSzehbaIICz6Zl0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Y3Oh5/Fc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 463K3Njh022578;
	Wed, 3 Jul 2024 22:13:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=r5gmEDxT9jYfJP5zplDXOZ
	5X/zUTKTpwVyM840H3jjA=; b=Y3Oh5/Fcwp2hM98iUDGZ3OxLTBog/uj6pgE/uR
	GJ8rtQoFVcVoVIfqBvruFM+fl7B49FeIsh97mEg0krlZXNPhdwbgmftyuGODWy39
	QzaAx6nbL09/8Wx40gwzDRR38u6GX/HA/CLm01HYAOC5OnKcfgiKe0yNPnW0zDLV
	fgUMehD7Kz/hNICCbjP277jPlxDJZrERLn0YCo6PjexdEzlpVqmvbchOioZCHg8W
	6De+LyxGk15a1C+SI2kT0ORBHykdcLSH/x9GjSpVD0IPDRWu+7OXNDgoOZ24aZM2
	C7ASr8n70yaSnXz6tOSXR3nF5Jn5dwzgcSWJBBVaKShTcilA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 405dbe06jg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Jul 2024 22:13:02 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 463MD1Aa010654
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 3 Jul 2024 22:13:01 GMT
Received: from hu-collinsd-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 3 Jul 2024 15:13:00 -0700
From: David Collins <quic_collinsd@quicinc.com>
To: Stephen Boyd <sboyd@kernel.org>, <linux-kernel@vger.kernel.org>
CC: David Collins <quic_collinsd@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        Abel Vesa <abel.vesa@linaro.org>,
        "Dan
 Carpenter" <dan.carpenter@linaro.org>,
        Neil Armstrong
	<neil.armstrong@linaro.org>
Subject: [PATCH] spmi: pmic-arb: add missing newline in dev_err format strings
Date: Wed, 3 Jul 2024 15:12:48 -0700
Message-ID: <20240703221248.3640490-1-quic_collinsd@quicinc.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: foGClTXZDzIA3fRJUtLxtfTfVBzQnLMI
X-Proofpoint-GUID: foGClTXZDzIA3fRJUtLxtfTfVBzQnLMI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-03_16,2024-07-03_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 malwarescore=0 phishscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 mlxlogscore=999 mlxscore=0 priorityscore=1501 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407030165

dev_err() format strings should end with '\n'.  Several such
format strings in the spmi-pmic-arb driver are missing it.
Add newlines where needed.

Fixes: 02922ccbb330 ("spmi: pmic-arb: Register controller for bus instead of arbiter")
Signed-off-by: David Collins <quic_collinsd@quicinc.com>
---
 drivers/spmi/spmi-pmic-arb.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/spmi/spmi-pmic-arb.c b/drivers/spmi/spmi-pmic-arb.c
index 791cdc160c51..c408ded0c00f 100644
--- a/drivers/spmi/spmi-pmic-arb.c
+++ b/drivers/spmi/spmi-pmic-arb.c
@@ -398,7 +398,7 @@ static int pmic_arb_fmt_read_cmd(struct spmi_pmic_arb_bus *bus, u8 opc, u8 sid,
 
 	*offset = rc;
 	if (bc >= PMIC_ARB_MAX_TRANS_BYTES) {
-		dev_err(&bus->spmic->dev, "pmic-arb supports 1..%d bytes per trans, but:%zu requested",
+		dev_err(&bus->spmic->dev, "pmic-arb supports 1..%d bytes per trans, but:%zu requested\n",
 			PMIC_ARB_MAX_TRANS_BYTES, len);
 		return  -EINVAL;
 	}
@@ -477,7 +477,7 @@ static int pmic_arb_fmt_write_cmd(struct spmi_pmic_arb_bus *bus, u8 opc,
 
 	*offset = rc;
 	if (bc >= PMIC_ARB_MAX_TRANS_BYTES) {
-		dev_err(&bus->spmic->dev, "pmic-arb supports 1..%d bytes per trans, but:%zu requested",
+		dev_err(&bus->spmic->dev, "pmic-arb supports 1..%d bytes per trans, but:%zu requested\n",
 			PMIC_ARB_MAX_TRANS_BYTES, len);
 		return  -EINVAL;
 	}
@@ -1702,7 +1702,7 @@ static int spmi_pmic_arb_bus_init(struct platform_device *pdev,
 
 	index = of_property_match_string(node, "reg-names", "cnfg");
 	if (index < 0) {
-		dev_err(dev, "cnfg reg region missing");
+		dev_err(dev, "cnfg reg region missing\n");
 		return -EINVAL;
 	}
 
@@ -1712,7 +1712,7 @@ static int spmi_pmic_arb_bus_init(struct platform_device *pdev,
 
 	index = of_property_match_string(node, "reg-names", "intr");
 	if (index < 0) {
-		dev_err(dev, "intr reg region missing");
+		dev_err(dev, "intr reg region missing\n");
 		return -EINVAL;
 	}
 
-- 
2.25.1


