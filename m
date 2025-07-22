Return-Path: <linux-arm-msm+bounces-66007-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79501B0D430
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 10:14:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A70393A52FB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 08:14:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34FB52D3ED7;
	Tue, 22 Jul 2025 08:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mA3tXiMZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A468A2D373B;
	Tue, 22 Jul 2025 08:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753172071; cv=none; b=GQTMJhcmGl7Tvi2wCbfBlyljoiX19V/I3Wo4SeAwIsZIgAcKsXxrlu5d0Fig58kxmLDXRXJiO62yfuCG01oaJKPz+pIs7oGvisiUcsbk6fOO6kWOttpyxWUWfZrzTOsAGNleDGLaJAhpOzEUI/n3mn4zJ+k4sEKpky+747EWNwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753172071; c=relaxed/simple;
	bh=YOFn9maK6DH0SKcq2uZ2scIM+s+JXhRwG2UYnbT74xg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Y+WjAtiixQhs8rtxgqYsUnaPJa32u7SbtETUgcn2aByNGWjZ89e4Z9P8gOdY5GXMmpfofHl8KUILSiyzgxxsTc0745lVNziIprQNU7Qfc8eryFRo7oNxK9YO5+FdjqM8AnRX6txSpWy/ICwLYKIo21T9qU68nHVP8kPySj4p0IQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mA3tXiMZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56M7WnZc032748;
	Tue, 22 Jul 2025 08:14:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	woNBnziE8osFFeyWhWsrxwNCjZX1BCpANYJQWz/MjCQ=; b=mA3tXiMZBTFU3Aiq
	rwXOXyKNsT8+arie+Am4BTa44zn/cMq5AV7cCm3ki5g+nVHmnl5RuP+p7t5Mc2dG
	rJUBJdFQVEH7xTDVNIug7yIIDWemPciqXH6zFQzVeQR9DAQcFoIMMsiibpHT9bVK
	tlOKfOCugS1qw/ZCxecK6qj32d1Eonj+Znb6rmYKsVMfgwfQklnqhC2kHmW+EBne
	a2cR5Q7qRWUMwFvr+g9wixyI5Rfd7XuKb3ne/83m6zstcCFGwFohoVd3oPber7mL
	ttBgMuAlvMQMvnejWuYX5uxtXS7UeQtl9eVQZPLtvK+9hA9OfXpzkXpSt4wLNjCI
	wbzgqQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48048v70da-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Jul 2025 08:14:18 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56M8EHWD001630
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Jul 2025 08:14:17 GMT
Received: from hu-jinlmao-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 22 Jul 2025 01:14:17 -0700
From: Mao Jinlong <quic_jinlmao@quicinc.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Alexander Shishkin
	<alexander.shishkin@linux.intel.com>
CC: Yingchao Deng <quic_yingdeng@quicinc.com>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        Mao Jinlong
	<quic_jinlmao@quicinc.com>
Subject: [PATCH v3 1/2] dt-bindings: arm: Add Qualcomm extended CTI
Date: Tue, 22 Jul 2025 01:14:04 -0700
Message-ID: <20250722081405.2947294-2-quic_jinlmao@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250722081405.2947294-1-quic_jinlmao@quicinc.com>
References: <20250722081405.2947294-1-quic_jinlmao@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: hi8_RfKdThoqSDUBJQQfjdz6lmBEjrZA
X-Authority-Analysis: v=2.4 cv=SYL3duRu c=1 sm=1 tr=0 ts=687f485a cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=3H110R4YSZwA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=uCLwI1R7FFjruh-RNAkA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDA2NiBTYWx0ZWRfX6khDhDQYbskY
 6+nq7lXXzkLHuvfuq63A0CwfXijqGyH+8twIRg5eh8KAEwM200xDX/5FFuMj7hcguu1EXRDSAci
 KNgl5m8LG0TzO0JB4BSopuO1rTV3KsJCRp41TljvaEkwpbckt+lC3S4QYDm7rQvM1appByty6oV
 yr1GoOKGKvnLfv3h5OjhHNSBtnEDxbzsIzQAM9Bkui8aP+PAY7yBcPJh+6dCARiUYVDqgAlRMvj
 E4ZQf4ZfLU09zWRynOO48C6RboEa5XF3spYZCvFY34fWxp+fF2tXzeb6qDhNO11lWzRUkJKp+3+
 bCSU7lqi4JTF+4r3p0sfxOb/4toDmTk9mMc8Oo0G6dmM+JN4KcoP8m6gM/LrrZJD6aWuFwyicoP
 +MSBksbLdu8L6GqLmScZH9PjyjatGMVfyTMx79z0i9euJ1dhB/kyRt1T9VgfoxfnMgICR/lZ
X-Proofpoint-ORIG-GUID: hi8_RfKdThoqSDUBJQQfjdz6lmBEjrZA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_01,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 mlxscore=0 bulkscore=0 mlxlogscore=871
 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507220066

From: Yingchao Deng <quic_yingdeng@quicinc.com>

Add Qualcomm extended CTI support in CTI binding file. Qualcomm
extended CTI supports up to 128 triggers.

Signed-off-by: Yingchao Deng <quic_yingdeng@quicinc.com>
Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
---
 Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
index 2d5545a2b49c..1aa27461f5bc 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
@@ -84,7 +84,9 @@ properties:
           - const: arm,coresight-cti
           - const: arm,primecell
       - items:
-          - const: arm,coresight-cti-v8-arch
+          - enum:
+              - arm,coresight-cti-v8-arch
+              - qcom,coresight-cti-extended
           - const: arm,coresight-cti
           - const: arm,primecell
 
-- 
2.25.1


