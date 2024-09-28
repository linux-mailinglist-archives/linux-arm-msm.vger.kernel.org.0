Return-Path: <linux-arm-msm+bounces-32700-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 58472988DDE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Sep 2024 07:05:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 07371281339
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Sep 2024 05:05:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EB3619D068;
	Sat, 28 Sep 2024 05:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GWHkA9QI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E87EB4D8A3;
	Sat, 28 Sep 2024 05:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727499909; cv=none; b=GNz629+hofYvMfrsG7ZBFeAn0WuJIrTAmL/mwOb0dnWM3Pn4yG+YeaF9uFWcU/eW6JpFfLR5UzM9+vJkZjoHvAY56SVsaWHBJAq6oVkiAUWCTs8Meh4NpFzMvi21bi/xXBqKBpv/Fnb0C/6mLq0e2kmlm5/snTXmzc0zw04gcng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727499909; c=relaxed/simple;
	bh=Y/l8OP4Jqm74Qv6NVICljLxDy2DiosmZh6cusyq/iJ0=;
	h=From:To:Cc:Subject:Date:Message-Id; b=kAEZOVm7jp4txdI1VtN3H4KR2OXm/SkT4qhaDwuJdwRXaEn2t8GtNo3r7yvDk6HTwBZQBTPmDM8Qd2vB+vfL9aDwzcj3xX5adUvj9LGToD+zACQW8QfGt3pCKvgRWlMchvRlm70GUBDmq4HRaYAQYCFeJKE+mcNfIvcCDdIvzPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=GWHkA9QI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48S4TCxj030469;
	Sat, 28 Sep 2024 05:05:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:date:from:message-id:subject:to; s=qcppdkim1; bh=w6t2kxjxFBKo
	evrFbAt5Q8vCLPF7LOV752ahSCKVjUs=; b=GWHkA9QIZai2C5sir08kJTtL/2ET
	JgGbQthE4KLx9mLwLQYEAxlhjf3u6kj4caboSDGhk1ZSLVFu7rEBbZGjlgxvMaau
	71RnzzxInOldUUO4mkV6mxYRiyX+8OmAHXtUzPYikkztgbESvNkZtETOAvSTY2wA
	JzFLnG2pZwCjV2DHSaO8qrB9cNzbe4vBT+c1yVHfw+VWOumrHv+A8+IiX5ohfASq
	hNrcbqAX8kfhrs6BLGy3dzfrxsqxDHxu4PJRZX6uaYrBX3qNGv1nqQNvpTzUXRip
	JYiPij0Ruik4Apezq3ZohWavvXPzG19+6bE3/y2czy9XmwO54BRnmQeY3g==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41x9cy84d7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 28 Sep 2024 05:05:01 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 48S54vH1005864;
	Sat, 28 Sep 2024 05:04:57 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 41xavk85mk-1;
	Sat, 28 Sep 2024 05:04:57 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 48S514Sx002720;
	Sat, 28 Sep 2024 05:04:57 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-spuppala-hyd.qualcomm.com [10.213.108.54])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 48S54uOn005859;
	Sat, 28 Sep 2024 05:04:57 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 4137148)
	id 57B1E5001B7; Sat, 28 Sep 2024 10:34:56 +0530 (+0530)
From: Seshu Madhavi Puppala <quic_spuppala@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_rampraka@quicinc.com, quic_nitirawa@quicinc.com,
        quic_bhaskarv@quicinc.com, quic_neersoni@quicinc.com,
        quic_gaurkash@quicinc.com
Subject: [PATCH] qcom: ice: Remove ice probe
Date: Sat, 28 Sep 2024 10:34:56 +0530
Message-Id: <20240928050456.27577-1-quic_spuppala@quicinc.com>
X-Mailer: git-send-email 2.17.1
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: mBUuJg3wLtnlJHFI2Oasj2u-9NECCCOE
X-Proofpoint-ORIG-GUID: mBUuJg3wLtnlJHFI2Oasj2u-9NECCCOE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 malwarescore=0
 bulkscore=0 spamscore=0 phishscore=0 suspectscore=0 priorityscore=1501
 mlxlogscore=999 impostorscore=0 mlxscore=0 lowpriorityscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2408220000
 definitions=main-2409280033
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

Under JEDEC specification ICE IP is tightly
coupled with Storage. Qualcomm vendor HW
implementation also ties the clock and power
supply for ICE to corresponding storage clock and
supplies. For a SoC supporting multiple storage
types like UFS and eMMC the ICE physical address
space is not shared and is always part of
corresponding storage physical address space
hence there is no need to independently probe ICE.

Cleanup commit 2afbf43a4aec ("soc: qcom: Make
the Qualcomm UFS/SDCC ICE a dedicated driver")
to remove dedicated ICE probe since there is no
dedicated ICE IP block shared between UFS and
SDCC as mentioned in 2afbf43a4aec.

Storage probe will check for the corresponding
ICE node by using of_qcom_ice_get to get ICE
instance. Additional support added to
of_qcom_ice_get to support ICE instance creation
with new approach. Backward compatibility with
old style device tree approach is untouched.

Signed-off-by: Seshu Madhavi Puppala <quic_spuppala@quicinc.com>
---
 drivers/soc/qcom/ice.c | 44 +++++++-----------------------------------
 1 file changed, 7 insertions(+), 37 deletions(-)

diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
index fbab7fe5c652..47f1b668dc86 100644
--- a/drivers/soc/qcom/ice.c
+++ b/drivers/soc/qcom/ice.c
@@ -303,7 +303,13 @@ struct qcom_ice *of_qcom_ice_get(struct device *dev)
 		goto out;
 	}
 
-	ice = platform_get_drvdata(pdev);
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base)) {
+		dev_warn(&pdev->dev, "ICE registers not found\n");
+		return PTR_ERR(base);
+	}
+
+	ice = qcom_ice_create(&pdev->dev, base);
 	if (!ice) {
 		dev_err(dev, "Cannot get ice instance from %s\n",
 			dev_name(&pdev->dev));
@@ -328,41 +334,5 @@ struct qcom_ice *of_qcom_ice_get(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(of_qcom_ice_get);
 
-static int qcom_ice_probe(struct platform_device *pdev)
-{
-	struct qcom_ice *engine;
-	void __iomem *base;
-
-	base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(base)) {
-		dev_warn(&pdev->dev, "ICE registers not found\n");
-		return PTR_ERR(base);
-	}
-
-	engine = qcom_ice_create(&pdev->dev, base);
-	if (IS_ERR(engine))
-		return PTR_ERR(engine);
-
-	platform_set_drvdata(pdev, engine);
-
-	return 0;
-}
-
-static const struct of_device_id qcom_ice_of_match_table[] = {
-	{ .compatible = "qcom,inline-crypto-engine" },
-	{ },
-};
-MODULE_DEVICE_TABLE(of, qcom_ice_of_match_table);
-
-static struct platform_driver qcom_ice_driver = {
-	.probe	= qcom_ice_probe,
-	.driver = {
-		.name = "qcom-ice",
-		.of_match_table = qcom_ice_of_match_table,
-	},
-};
-
-module_platform_driver(qcom_ice_driver);
-
 MODULE_DESCRIPTION("Qualcomm Inline Crypto Engine driver");
 MODULE_LICENSE("GPL");
-- 
2.17.1


