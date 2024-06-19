Return-Path: <linux-arm-msm+bounces-23178-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A2390E33E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 08:17:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 347661F227B5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 06:17:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58C886F06D;
	Wed, 19 Jun 2024 06:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="megeJkDT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D571973514;
	Wed, 19 Jun 2024 06:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718777842; cv=none; b=KuC9pT7Mkb/7y9PlZZQu4kdcgZsh4LYWIAxXHqn+mKFCj5m+DBlhBNeralE9jmi/HM1/J6PdRW6Py0cwScvMztAS1YRwJrK3BTHslqnHsksFbWTPdblkzP08i4V56biUt5w5ulzXfU6ZjKK9uLa0CDWkSLiBTas9Ly91lc3lQXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718777842; c=relaxed/simple;
	bh=RfjoFjVsfFJo2IqO5ZYk3ijiIF9jTs4wHC+NBGLrhw4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L1+jaCbDYhL2Blt9bc5YKjKg5qJmAh4N+wGVz6FdMFissQbry5w4po222qy1iIwaUvI+yo7P57y6ilzg325nOPnW246kp6+wAsfgD5lo6Bnb77zi+L5WDkmFCpFPk14UbK5D0czhL9AlIBrRTutUGRCOZuwxyCbYBM/L+A/JH78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=megeJkDT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45ILaDe4009357;
	Wed, 19 Jun 2024 06:17:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DG89oTNWgNP2PhzSdThEv4bfllI6Li791dDVkVx/3gI=; b=megeJkDT7tYQB9k+
	4w5GfSl+TfjELDFdNobpdVpYO8bupoUi5+v5TgkD7yT65MpRkJmhYqiZWzFLH+8+
	BMD/Je/J+zZp1trceWxaclWJJ2Y+MUQ6ia/2BlweXPhi0MmWWJJnmqGzaVvpurXp
	XtecVWY7R+Peq4AGgY84Q2lJRXgnImlwFOXsV0Lr15q0JqTTi6EJ558rnh32+5as
	9EkQt/gi+5QdhGt8tfQaTb8TzDuviYB8zPm6FPwc4v2DCweEjV2Oa9jDvtE7uOKF
	vnNOqjMB8iZ+MB6dZG7MRO/yBZsKygM7iT6VPpt7L4LtccHZc2CNL+J/cMq+lu+q
	cyUHQA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yuj9tgtnd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Jun 2024 06:17:18 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45J6HHde017448
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Jun 2024 06:17:17 GMT
Received: from hu-kbajaj-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 18 Jun 2024 23:17:13 -0700
From: Komal Bajaj <quic_kbajaj@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Mukesh Ojha <quic_mojha@quicinc.com>,
        "Komal
 Bajaj" <quic_kbajaj@quicinc.com>
Subject: [PATCH v2 2/2] Revert "dt-bindings: cache: qcom,llcc: correct QDU1000 reg entries"
Date: Wed, 19 Jun 2024 11:46:41 +0530
Message-ID: <20240619061641.5261-3-quic_kbajaj@quicinc.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240619061641.5261-1-quic_kbajaj@quicinc.com>
References: <20240619061641.5261-1-quic_kbajaj@quicinc.com>
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
X-Proofpoint-GUID: OukkQvcMd-rl5BbAOs5lSQhKzAxPxSr2
X-Proofpoint-ORIG-GUID: OukkQvcMd-rl5BbAOs5lSQhKzAxPxSr2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-19_02,2024-06-17_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 bulkscore=0 malwarescore=0 lowpriorityscore=0 mlxlogscore=901 mlxscore=0
 priorityscore=1501 spamscore=0 phishscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2406190044

This reverts commit f0f99f371822c48847e02e56d6e7de507e18f186.

QDU1000 has 7 register regions. The earlier commit 8e2506d01231
("dt-bindings: cache: qcom,llcc: Add LLCC compatible for QDU1000/QRU1000")
to add llcc compatible was reflecting the same, but dtsi change for
QDU1000 was not aligning with its binding. Later, commit f0f99f371822
("dt-bindings: cache: qcom,llcc: correct QDU1000 reg entries") was merged
intended to fix this misalignment.

After the LLCC driver refactor, each LLCC bank/channel need to be
represented as one register space to avoid mapping to the region where
access is not there. Hence, revert the commit f0f99f371822 ("dt-bindings:
cache: qcom,llcc: correct QDU1000 reg entries") to align QDU1000 llcc
binding with its dtsi node.

Signed-off-by: Komal Bajaj <quic_kbajaj@quicinc.com>
---
 Documentation/devicetree/bindings/cache/qcom,llcc.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
index 192911696010..68ea5f70b75f 100644
--- a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
+++ b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
@@ -67,7 +67,6 @@ allOf:
         compatible:
           contains:
             enum:
-              - qcom,qdu1000-llcc
               - qcom,sc7180-llcc
               - qcom,sm6350-llcc
     then:
@@ -132,6 +131,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,qdu1000-llcc
               - qcom,sc8180x-llcc
               - qcom,sc8280xp-llcc
               - qcom,x1e80100-llcc
--
2.42.0


