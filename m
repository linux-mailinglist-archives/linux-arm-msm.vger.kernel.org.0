Return-Path: <linux-arm-msm+bounces-60470-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 97543AD00E3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jun 2025 12:58:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F17B21896B4F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jun 2025 10:58:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 630E328750A;
	Fri,  6 Jun 2025 10:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="B5L6he+B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D89920F09A;
	Fri,  6 Jun 2025 10:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749207517; cv=none; b=IpIiVfTkFaR6zOliDjta1T9SBxoReVf4DC/83k9p7alekYJBuPE9QZbh/RPhK3woiYPkiy7B9QVkJw7mnHv5S7IoERZa3gx2tFwVZ/aL8XHTJVLovRlMfwPQIsML17E9o4JAeGUmHNfNvG/LLfIiYyWEa0jEMVHVU32cZZJmDvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749207517; c=relaxed/simple;
	bh=6rTR5qhArzs7JaDLfBWlMMihigZBq70sto6kq9gME/c=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Kt99+BcupHk1PHnJ1FBvB8v8o1pV1IVcwjmf0U1XFH2eYIWtL+pOYqWrPJofCWKZxMuK8b0Vu2OYuVlkcfvPeQbIQSSrw4FwQADZPoOM4g2uHFvamhCik6AmB92zZzaGPxh+rCqUq8e5HuMgGmkqJkx3bMo6ZJ5g99fEItiXAlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=B5L6he+B; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5568GdVH024322;
	Fri, 6 Jun 2025 10:58:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=HvybIUrky2Ylqll0vNupJS
	dh61ID7HsNEIdYFcNeiq4=; b=B5L6he+BeOoLW5y9rcyEE5HH711++oMMCPI6hB
	Wgy2nYxU2RWeg9waBw9qDr4j5+CBZY8j8OcRQJQ1iYia0FKmaDsz/Xu+1I/RAg2N
	OZKYS0UZWpmTLegdMd/mG+Hx1K0SU6LaF39s0lFxGVVOADPfz1N1Bj7iI34Tbc/P
	20VAWZnHuUv4irKYySiiEevRVEdcWjlACerURJCvctS2KgVL9LZ1SC9n4eV38qyP
	gZVYU8jxiaoLOjOPfL0X/IM5XwWBgTRL4Le6NVW7cAl4dedbaxoALgw5w5oFNMCT
	lA5VKdN/PCmOurvD/AS691cSN1xHcYACMtPo4fJcoydqomtg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47202whyrw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Jun 2025 10:58:27 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 556AwRip007922
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Jun 2025 10:58:27 GMT
Received: from hu-utiwari-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 6 Jun 2025 03:58:24 -0700
From: <quic_utiwari@quicinc.com>
To: Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu
	<herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>
CC: <linux-crypto@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <bartosz.golaszewski@linaro.org>,
        <quic_neersoni@quicinc.com>
Subject: [PATCH] crypto: qce - Add suspend and resume support
Date: Fri, 6 Jun 2025 16:28:08 +0530
Message-ID: <20250606105808.2119280-1-quic_utiwari@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: bj5entsUtkRlWHvNPkWVOt36YaJ06O_2
X-Proofpoint-GUID: bj5entsUtkRlWHvNPkWVOt36YaJ06O_2
X-Authority-Analysis: v=2.4 cv=Y/D4sgeN c=1 sm=1 tr=0 ts=6842c9d3 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=HUDAnx6uG5BSWO10QkMA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDA5NyBTYWx0ZWRfX0/ebGCBvKFMV
 8eZWP5WWwuFL9O9xIHEcJwT2+jehTdvOEPoUTXqrThpYVAtR1tb5TBuI4Y3Jn8cTqhJrQ8R99he
 WeKZf8eY16ykJuTYKPflCzn1smeZ8Mqla30raHnCeSEuapyOsMRHVGpm7v/Or1ZuPgNxE2kddhw
 4UF4l0yYwQc9r8v0qeNTaY3mjlkdaXzfPkolVX8KWpu3GHWqFnJF9amnMRqkoSuCMyUhL4uoKpf
 ZJ1TeDPUiHp9Q81/Bx7aU/FhPggeIBOx8BnDpVPfmi7BD2Ay6vbNEXls1XHmFcMuqG7naG3C/XR
 GYuyRCdbxtiJ7Sk9SNRIXWwyXM8+VWjxxWnO1bkO2ZweDvkB6a/oB5Z2IVyqxEASDNAvi4ARX5u
 tfXCZMrCwXzpcQpxDjdO7s3paepn+6cKp5WvU1cfde5irQoR9pqdfdPSK6vuC53+zjzN/0Y6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-06_03,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506060097

From: Udit Tiwari <quic_utiwari@quicinc.com>

Add basic suspend and resume callbacks to the QCE platform driver to
manage interconnect bandwidth during system sleep and wake-up cycles.

Signed-off-by: Udit Tiwari <quic_utiwari@quicinc.com>
---
 drivers/crypto/qce/core.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
index e95e84486d9a..2566bdad5d4a 100644
--- a/drivers/crypto/qce/core.c
+++ b/drivers/crypto/qce/core.c
@@ -249,6 +249,21 @@ static int qce_crypto_probe(struct platform_device *pdev)
 	return devm_qce_register_algs(qce);
 }
 
+static int qce_crypto_suspend(struct platform_device *pdev, pm_message_t state)
+{
+	struct qce_device *qce = platform_get_drvdata(pdev);
+
+	return icc_set_bw(qce->mem_path, 0, 0);
+}
+
+static int qce_crypto_resume(struct platform_device *pdev)
+{
+	struct qce_device *qce = platform_get_drvdata(pdev);
+
+	return icc_set_bw(qce->mem_path, QCE_DEFAULT_MEM_BANDWIDTH,
+		QCE_DEFAULT_MEM_BANDWIDTH);
+}
+
 static const struct of_device_id qce_crypto_of_match[] = {
 	{ .compatible = "qcom,crypto-v5.1", },
 	{ .compatible = "qcom,crypto-v5.4", },
@@ -259,6 +274,8 @@ MODULE_DEVICE_TABLE(of, qce_crypto_of_match);
 
 static struct platform_driver qce_crypto_driver = {
 	.probe = qce_crypto_probe,
+	.suspend = qce_crypto_suspend,
+	.resume = qce_crypto_resume,
 	.driver = {
 		.name = KBUILD_MODNAME,
 		.of_match_table = qce_crypto_of_match,
-- 
2.34.1


