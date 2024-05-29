Return-Path: <linux-arm-msm+bounces-20922-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 364BC8D3466
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 12:20:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C5E111F2577E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 10:20:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80A0F17BB07;
	Wed, 29 May 2024 10:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="K/Pu5VkS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 117E117B50A;
	Wed, 29 May 2024 10:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716977998; cv=none; b=cFT/VxgcWhHJCBlcB5sWtn1XVj9N/MCvRQ7kALYcz1ivSLJ0nClgabMvaTVAjp8lRyiTdQmHgvJ6r4kxywP9s3MA+sl9EDIKkLy9q03j4/tlEENYmTixvD13SBYNcR7a1h/GVB8WGoI+n4jfM3nyeLzQNiWmrcDnedCzybWp3UA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716977998; c=relaxed/simple;
	bh=7xsed52nOYGOtWjE0e/nzP2CxRjMX4a0dibUsohNieU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZHv8Qlmj6+lKyA5PGVczrCAYvtTo4unX1A+UZpRYr2+/997sg1KkYd4psaQoYHaS6xIuRy6Hq1TTG/pO+/SOGjCB9HMvbug+ywRR3UJ1LsNF8m9eBZ1R+CS/7Q03XxqSFRxMlBw1GINF1ppBe2MNfyiDYZbJxr4y097+WR6DFSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=K/Pu5VkS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44SMkT0u031447;
	Wed, 29 May 2024 10:19:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2RIBPaIiPA4XUS6U/lPBsafiREp5tGtrqfrsF29+LOg=; b=K/Pu5VkSw3Cn2ozz
	t4ZkfbvFQhx2ArBxnEzSoK8fYc7LBYW1m/iGP8fe4YCArw+MTKY0iIqrMrwFbl9R
	iRYHR2ZwqOZNb8XSKEANwLM4sJKBvGYm5F4z3CGZiNMwD5tQgwcOCG1odrymdUxz
	TLqrxw0TSZCX/PhSwPa/JtLhmqRxuQsjmxx4/6CjjZ+hcH8zHyhpboyWAp+kWidE
	+wlLDm8QBOhB8XAoBRvgO9LIXA8KJXVOWTaiN0xsDL9kyabmaQIEAza0ru87WqzN
	7PW6x8KINlme3woH23z1rUEHT8JnjuU5utnhDoGPoYhbbPxd7EzpwRQXPZugEg+f
	r2M3fQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yba0x8nfy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 May 2024 10:19:52 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44TAJpgl013351
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 May 2024 10:19:51 GMT
Received: from tengfan-gv.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 29 May 2024 03:19:46 -0700
From: Tengfei Fan <quic_tengfan@quicinc.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <andersson@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>,
        Tengfei Fan
	<quic_tengfan@quicinc.com>
Subject: [PATCH 1/2] dt-bindings: soc: qcom: add qcom,sa8775p-imem compatible
Date: Wed, 29 May 2024 18:19:28 +0800
Message-ID: <20240529101929.3167610-2-quic_tengfan@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240529101929.3167610-1-quic_tengfan@quicinc.com>
References: <20240529101929.3167610-1-quic_tengfan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: rocNVY_a56DLxsbs1hhsYLwj7H10cZq5
X-Proofpoint-ORIG-GUID: rocNVY_a56DLxsbs1hhsYLwj7H10cZq5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-29_06,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 mlxlogscore=871 priorityscore=1501 clxscore=1015 bulkscore=0 phishscore=0
 malwarescore=0 mlxscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2405290068

Add qcom,sa8775p-imem compatible name support.

Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
---
 Documentation/devicetree/bindings/sram/qcom,imem.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sram/qcom,imem.yaml b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
index 8025a852bc9c..faef3d6e0a94 100644
--- a/Documentation/devicetree/bindings/sram/qcom,imem.yaml
+++ b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
@@ -22,6 +22,7 @@ properties:
           - qcom,msm8974-imem
           - qcom,qcs404-imem
           - qcom,qdu1000-imem
+          - qcom,sa8775p-imem
           - qcom,sc7180-imem
           - qcom,sc7280-imem
           - qcom,sdm630-imem
-- 
2.25.1


