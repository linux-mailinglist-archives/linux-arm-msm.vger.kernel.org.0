Return-Path: <linux-arm-msm+bounces-39983-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 506529E116B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 03:40:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AC9E5B23DBF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 02:40:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90DC5664C6;
	Tue,  3 Dec 2024 02:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hmFtUwse"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B8D61EA84;
	Tue,  3 Dec 2024 02:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733193632; cv=none; b=LmdJtfy6bR2TaQIDbpp/arihmNlYtgtV0EOjUB93HBMTvokssqcrETVVLqDb0ePBVq1NgGNUBJDjvYAwCDEQIg9IF1+DE8ZIsUZn6qtNWgAcBUN4ksOcswA18+kv3UfLcNZbgivQRsAh5gMCfqU/05jbK3AauCN04YdR1tlcnSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733193632; c=relaxed/simple;
	bh=/6bUNqZkfq0kEP+vXDez6pmz80GSahXbagXwiR0UpBE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=LvCz6x8vvpcWvhgxC0SVEsslW0GvfGqBU+CIdqNZkSTecEAq+58pvG+zoppFo/Kil+0cz6quaK06hwKHl5QnqUmiK9tU8Rfe5WiLriaMuwIH0/jwYiVmWtZck5mf5Xmx2uTgqZUxXTAZW+EhJgrpHOMJzkcfitHa9DJSJnYsSIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hmFtUwse; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B2I3gQv031568;
	Tue, 3 Dec 2024 02:40:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=5Zv6y0Vlz7tB46ZdvQZ7xH
	kef6tLCAr7LDBFRT5UXdw=; b=hmFtUwsecRRiDZpAM7m43K78CpfHqVNhyLnk16
	Z6r4Wj76kzOyHHwmcnPGvV303Q7Vv0pVI00ncLiIOX7ONkzUGQHs0faMaqD/pmM3
	NpdACipIqW1fWPic4owwMw8r5+zFzaNr8T1Tjjf5yLE+2eK7IsIrZuoHJyf6Lem+
	WLxIzI9qOVWNMO/hMDf8l2csqgWZVK8w4fyFX4AJQ3W7KSfxhjetYMWGnodGJNA8
	GfHunb5pJ1I9/+9a6fOwTfYTQP6mnEDaG5l+ETHQaG2Mc1/4kL+1RSkFWRFtjXcd
	V8qKqZS9k/wo5z9rpmBKh4IEqFe3u1NjLdgdvPRRaPZ1KQaw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 437v07pg8e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Dec 2024 02:40:28 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B32eS3a027880
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 3 Dec 2024 02:40:28 GMT
Received: from hu-yrangana-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 2 Dec 2024 18:40:25 -0800
From: Yuvaraj Ranganathan <quic_yrangana@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_yrangana@quicinc.com>
Subject: [PATCH v1] soc: qcom: ice: Prevent UFS probe deferral on ICE probe failure
Date: Tue, 3 Dec 2024 08:10:05 +0530
Message-ID: <20241203024005.391654-1-quic_yrangana@quicinc.com>
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
X-Proofpoint-ORIG-GUID: nAmIQjHk0Yismr8qgtD1b7QVzCVxMLlt
X-Proofpoint-GUID: nAmIQjHk0Yismr8qgtD1b7QVzCVxMLlt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 adultscore=0 mlxlogscore=999 bulkscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 spamscore=0 mlxscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412030021

When the ICE key programming interface is unavailable, the ice create
function fails, causing the probe to set NULL as the driver data. As a 
result, when the UFS driver reads the ICE driver data and encounters a 
NULL, leading to the deferral of the UFS probe and preventing the device
from booting to the shell.

To address this issue, modify the behavior to return an "operation not
supported" error when the ICE key programming interface is unavailable.
Additionally, mark this error in a global variable. When the UFS driver
attempts to read the ICE driver data, it will check for this error and
return it, rather than deferring the probe.

Signed-off-by: Yuvaraj Ranganathan <quic_yrangana@quicinc.com>
---
 drivers/soc/qcom/ice.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
index 393d2d1d275f..160916cb8fb0 100644
--- a/drivers/soc/qcom/ice.c
+++ b/drivers/soc/qcom/ice.c
@@ -41,6 +41,8 @@
 #define qcom_ice_readl(engine, reg)	\
 	readl((engine)->base + (reg))
 
+static bool qcom_ice_create_error;
+
 struct qcom_ice {
 	struct device *dev;
 	void __iomem *base;
@@ -215,7 +217,7 @@ static struct qcom_ice *qcom_ice_create(struct device *dev,
 
 	if (!qcom_scm_ice_available()) {
 		dev_warn(dev, "ICE SCM interface not found\n");
-		return NULL;
+		return ERR_PTR(-EOPNOTSUPP);
 	}
 
 	engine = devm_kzalloc(dev, sizeof(*engine), GFP_KERNEL);
@@ -303,6 +305,9 @@ struct qcom_ice *of_qcom_ice_get(struct device *dev)
 		return ERR_PTR(-EPROBE_DEFER);
 	}
 
+	if (qcom_ice_create_error)
+		return ERR_PTR(-EOPNOTSUPP);
+
 	ice = platform_get_drvdata(pdev);
 	if (!ice) {
 		dev_err(dev, "Cannot get ice instance from %s\n",
@@ -336,8 +341,10 @@ static int qcom_ice_probe(struct platform_device *pdev)
 	}
 
 	engine = qcom_ice_create(&pdev->dev, base);
-	if (IS_ERR(engine))
+	if (IS_ERR(engine)) {
+		qcom_ice_create_error = true;
 		return PTR_ERR(engine);
+	}
 
 	platform_set_drvdata(pdev, engine);
 
-- 
2.34.1


