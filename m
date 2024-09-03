Return-Path: <linux-arm-msm+bounces-30457-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 93EAA969390
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 08:22:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4C9DC284E53
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 06:22:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF3FC1D0495;
	Tue,  3 Sep 2024 06:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bWo3hbMs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4515A1CFEA2;
	Tue,  3 Sep 2024 06:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725344531; cv=none; b=m0VVtrt5YVUPMxyCSu+Dij0e+VaPFtlwZBC9Wwn9EzT75EtuHMKzrRk1g4cOse8hpFB7bDznoR+cUT/qRqBr+ZHQWBGMv/56FOu5Fs1zBmFmqUaUit/UAr+pV89cCTsbXqfxdOXRz0gmz0ce2PLxj+TR8IoYEx45NoHIDWjIB+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725344531; c=relaxed/simple;
	bh=Q8DCJS2Qf7zoKwoyq4aZeaqvBd6zXcW2HcvUkU0+KpE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=kSRrebIlENsAQKRItXjq2AN7sZCgE2uFvbjq+b746aC9uO/t2GsVlueGVSIxfZSIYGiIkXcsQIz7X4IJupQP3kX2qrB8uufe7meZoOyWYUrszCuScM+J/kXAoTWAPzwuifyrBK5zA/fgqyuHvIHAKBARGOvFdfvTdOIasRFeRyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=bWo3hbMs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 482Lr3gt003208;
	Tue, 3 Sep 2024 06:22:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n92iDvCv1kJ8a691sfdjNXPvRQBvMNegMQdz00VBhW0=; b=bWo3hbMs/khwHxIx
	GOjq2tTRDHuljLWQ4rPXNwAKpsrkYg1aPFLn1cmN6u0K014y5OcWNJKcVTSoCMpj
	3cxPL68Og4mkqeLJaWKux0qNLUlwkKFGJewO8FMbYdDE59k3Ls6t3mO0gpv1QMgR
	x1Yww6bt9aGhtrVva+AInUbOma2jvM/7hEntLJ7Gcj5FIDuQvdMTYtPuPDwGYms3
	2Neu6LzBprJB+4RR89qNgWqLEZfACT0zVguZkf7YMo644q27pBvprq8hHMZwG5Sz
	dEt/NszsDFti4hGfYQWdoh02QcUUI1j69WaWouSlzdGXaqzat2Esy+67hcBIORz9
	CF8MDg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41buj6xb81-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Sep 2024 06:22:01 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4836LxGQ005573
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 3 Sep 2024 06:21:59 GMT
Received: from jingyw-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 2 Sep 2024 23:21:57 -0700
From: Jingyi Wang <quic_jingyw@quicinc.com>
Date: Tue, 3 Sep 2024 14:21:31 +0800
Subject: [PATCH 3/4] soc: qcom: llcc: add errata to get bank num
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240903-qcs8300_llcc_driver-v1-3-228659bdf067@quicinc.com>
References: <20240903-qcs8300_llcc_driver-v1-0-228659bdf067@quicinc.com>
In-Reply-To: <20240903-qcs8300_llcc_driver-v1-0-228659bdf067@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Jingyi Wang <quic_jingyw@quicinc.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725344509; l=1216;
 i=quic_jingyw@quicinc.com; s=20240829; h=from:subject:message-id;
 bh=Q8DCJS2Qf7zoKwoyq4aZeaqvBd6zXcW2HcvUkU0+KpE=;
 b=w4/ym9aVVv1PbZ5ow7gcTC4kcYr3ovymHk2zDuRYwNzHZ2g+Qm5wrj8owxD8YSUiimMMXkV0T
 5AKvdGdY8opBWBEIEAUj5xnoJVHEDgI4TedLwkoeNcW9dXJOiXiSll2
X-Developer-Key: i=quic_jingyw@quicinc.com; a=ed25519;
 pk=3tHAHZsIl3cClXtU9HGR1okpPOs9Xyy1M0jzHw6A/qs=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 4ruTTcnnYMcOpEOzcS_-NkHdPBJIJ5EA
X-Proofpoint-GUID: 4ruTTcnnYMcOpEOzcS_-NkHdPBJIJ5EA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-02_06,2024-09-02_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxscore=0
 mlxlogscore=781 impostorscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2407110000 definitions=main-2409030049

Use "num-banks" property to indicate the actual num of banks for
errata.

Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>
---
 drivers/soc/qcom/llcc-qcom.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
index 8fa4ffd3a9b5..3fb45e625d82 100644
--- a/drivers/soc/qcom/llcc-qcom.c
+++ b/drivers/soc/qcom/llcc-qcom.c
@@ -1275,12 +1275,17 @@ static int qcom_llcc_probe(struct platform_device *pdev)
 		goto err;
 	cfg = &cfgs->llcc_config[cfg_index];
 
-	ret = regmap_read(regmap, cfg->reg_offset[LLCC_COMMON_STATUS0], &num_banks);
-	if (ret)
-		goto err;
+	if (unlikely(!of_property_read_u32(dev->of_node, "num-banks", &num_banks))) {
+		/* errata: get num of llcc banks. */
+	} else {
+		ret = regmap_read(regmap, cfg->reg_offset[LLCC_COMMON_STATUS0], &num_banks);
+		if (ret)
+			goto err;
+
+		num_banks &= LLCC_LB_CNT_MASK;
+		num_banks >>= LLCC_LB_CNT_SHIFT;
+	}
 
-	num_banks &= LLCC_LB_CNT_MASK;
-	num_banks >>= LLCC_LB_CNT_SHIFT;
 	drv_data->num_banks = num_banks;
 
 	drv_data->regmaps = devm_kcalloc(dev, num_banks, sizeof(*drv_data->regmaps), GFP_KERNEL);

-- 
2.25.1


