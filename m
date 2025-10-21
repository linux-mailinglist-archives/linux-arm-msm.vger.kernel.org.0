Return-Path: <linux-arm-msm+bounces-78086-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DC2E2BF4924
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 06:04:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6FBB018981C2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 04:04:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 663511D7999;
	Tue, 21 Oct 2025 04:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="WKQfwvni"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A35198615A;
	Tue, 21 Oct 2025 04:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761019451; cv=none; b=MdEW+m86TmaaeiEH2I148ig13JmeobQC7pBQW4McCxWW+GJj6IOH6jfX4tuTeCUJRXLlVhHnk/mByilUaLZVCbojJXHl5NWla5wp0BvxctgVm/Nsh15QDIPCpqLmE//t8c20AZLxI8rx+80pKPCo7gi+V06u/pXLDGoDM4c4Gfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761019451; c=relaxed/simple;
	bh=pniHWhkDj46xPpYmdftLqXe9tb8Rn1sLicOaUC0/Y4s=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Z+lemNO/44rb46WBKs16a92jKwncx69QJMW09TjOpGX1blpxRY4Yt2Ij46qCCvkM7VU9SlL2cm3Sa6A/geJ66C/Jf/AX3McAhxOUYQ8qgRtMVT3HR+A2NAKi8D7/kPLtT2Qc3+wOBta1YqP0JHUqsF7HHqn8L54GbSG+8wzttgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=WKQfwvni; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59KL1B1G002360;
	Tue, 21 Oct 2025 04:03:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=sS99kXuvO8tRfzb74p05uX
	dgt5SQfG6eloyhE90leQI=; b=WKQfwvniKDeCurKRvXUSao6r1tfcDFBwT7zlkT
	x9Ahqysu3FuyTxEMdaPw7/274dngpGoo6NeqAcNonLUKDbRy/rAn7WfPjv2uIHUx
	2S7AmvToEKEUV9PQGW7lKf2a/2sjz6LZMUH8/KAJ3rZbEHqzqSmePsuYCIDjjCza
	Y6eGJ+Il7aODXVk3UdqzfUOpSXLqrrUR0+zdX7sPax5nDv3E4Ut4yMDUO52eP7eF
	uHJlrv8glr47EpjSySdr7oWoR3qKbRd9Mc0YnvQZp5eSSdQdzjM2eKG5KS4qB74h
	BV4oCIaLNN4zgv81ot/yPJVRo5UTZ3y1Ji6s6JZKFSV1WGpw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49w08w4n5a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Oct 2025 04:03:59 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 59L43wrV012371
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Oct 2025 04:03:59 GMT
Received: from hu-dmukhopa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Mon, 20 Oct 2025 21:03:56 -0700
From: Debraj Mukhopadhyay <quic_dmukhopa@quicinc.com>
To: <quic_neersoni@quicinc.com>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: Debraj Mukhopadhyay <quic_dmukhopa@quicinc.com>
Subject: [PATCH] qcom: ice: Prevent client probe failures on unsupported ICE
Date: Tue, 21 Oct 2025 09:33:37 +0530
Message-ID: <20251021040337.787980-1-quic_dmukhopa@quicinc.com>
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
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: GcORUaXlo2A7ESlyTXMwWCkiE2ivhzyz
X-Proofpoint-GUID: GcORUaXlo2A7ESlyTXMwWCkiE2ivhzyz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE5MDA5MCBTYWx0ZWRfX93OC8fAyVzLK
 WS2bF5JK3/Lwdu0s7l0No8b6IiSiIPerTpXq4cL/2RKlnoQkAr6TlyW1sVAS9H0ycT90qT2d3VO
 kHbJRN9gLWbJcWF0H4sQ5dIG3wBY/v8KZImWcQ9ZrDUQECyAG9296geLDepoxF9/Bk0Rj9jQFJV
 5pB5AV3IgjoYaQcPRc24MTATxNshtWlhKqN9omhBdNoJYd5v2zjfFUhMR0mzopWTuRwHdGmWxV8
 lhdG8lCkTgIY6mE41is/2hlvEhqs0Gs18LVlhJ8l8AtdS5tzq/FpQ3SYhvbrLD2bXDw7/Fbm/vH
 SYDiFVnZoj6pNXDdKHmmTODaI5ABqktzPTvYNbJ4CfvKcaFB/bZ4fXUsVoeEmEEBrQDS9oruj0W
 6zzaTKD81BVeSUdTNkiqpLQ/IV2VlQ==
X-Authority-Analysis: v=2.4 cv=V5NwEOni c=1 sm=1 tr=0 ts=68f7062f cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=e8WBJt8hLZ1ywCPIfMwA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_07,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 suspectscore=0 clxscore=1011 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510190090

Storage clients (ex. UFS and MMC) invoke of_qcom_ice_get() to obtain the
handle from ICE (Inline Crypto Engine) driver. Currently if ICE is
unsupported, the return code from probe could prevent the client
initialization which is a bug. To fix this a new flag
qcom_ice_create_error is introduced which caches the error encountered
during ICE probe.

The qcom_ice_create() and of_qcom_ice_get() functions are updated to
return -EOPNOTSUPP when ICE is unsupported, allowing clients to proceed
without ICE.

For other failures, such as ICE not yet initialized, the existing
behavior (e.g., -EPROBE_DEFER) is retained to ensure proper error
handling.

This improves error signaling and ensures that client initialization is
not blocked unnecessarily.

Signed-off-by: Debraj Mukhopadhyay <quic_dmukhopa@quicinc.com>
---
 drivers/soc/qcom/ice.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
index c467b55b4174..5460436d9158 100644
--- a/drivers/soc/qcom/ice.c
+++ b/drivers/soc/qcom/ice.c
@@ -85,6 +85,8 @@ union crypto_cfg {
 #define qcom_ice_readl(engine, reg)	\
 	readl((engine)->base + (reg))
 
+static bool qcom_ice_create_error;
+
 static bool qcom_ice_use_wrapped_keys;
 module_param_named(use_wrapped_keys, qcom_ice_use_wrapped_keys, bool, 0660);
 MODULE_PARM_DESC(use_wrapped_keys,
@@ -524,7 +526,7 @@ static struct qcom_ice *qcom_ice_create(struct device *dev,
 
 	if (!qcom_scm_ice_available()) {
 		dev_warn(dev, "ICE SCM interface not found\n");
-		return NULL;
+		return ERR_PTR(-EOPNOTSUPP);
 	}
 
 	engine = devm_kzalloc(dev, sizeof(*engine), GFP_KERNEL);
@@ -604,7 +606,7 @@ static struct qcom_ice *of_qcom_ice_get(struct device *dev)
 	struct device_node *node __free(device_node) = of_parse_phandle(dev->of_node,
 									"qcom,ice", 0);
 	if (!node)
-		return NULL;
+		return ERR_PTR(-EOPNOTSUPP);
 
 	pdev = of_find_device_by_node(node);
 	if (!pdev) {
@@ -617,7 +619,10 @@ static struct qcom_ice *of_qcom_ice_get(struct device *dev)
 		dev_err(dev, "Cannot get ice instance from %s\n",
 			dev_name(&pdev->dev));
 		platform_device_put(pdev);
-		return ERR_PTR(-EPROBE_DEFER);
+		if (qcom_ice_create_error)
+			return ERR_PTR(-EOPNOTSUPP);
+		else
+			return ERR_PTR(-EPROBE_DEFER);
 	}
 
 	link = device_link_add(dev, &pdev->dev, DL_FLAG_AUTOREMOVE_SUPPLIER);
@@ -691,8 +696,10 @@ static int qcom_ice_probe(struct platform_device *pdev)
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


