Return-Path: <linux-arm-msm+bounces-45645-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E6CA17768
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jan 2025 07:39:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 77AEA188A463
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jan 2025 06:39:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AA6319E7D3;
	Tue, 21 Jan 2025 06:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="PRQ6ISYw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C6F186294;
	Tue, 21 Jan 2025 06:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737441581; cv=none; b=FgafIY0r0e3mnl571HxkLACrcjxqNLFLD4FKnkGo7LeV6kKbEiKhT62NodLWxi8SM0wjdUNzgUVtwrV4aeDQKw6NfnfxSEGb0XGoTbvjgjxSs+oQ2iwFm6mLTjX2NBuLUOpupl/T0HlBv+AnBKcYQqGbZ7ST7MRqRzYJ92JNUkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737441581; c=relaxed/simple;
	bh=jtYsDsR+ZbOn/y6vwpCep+pKJCvurrsOGxD8uXcfQR0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KbtuPwbFhKrq5hpDFouqG7tR/YKqpn/f+2JN61uAIEpSM2FO/iViZgcQz3NReta17MML+vmSCnLC0JHz82Ura3pFTBp3JJG+YUv+vxF05c7PkeJouplY5kY4JieVd1yYYS5zRMPPcaW4NZc3su5JGs5VsD7bJr/rOAtDyzEnrTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=PRQ6ISYw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50L1ssVL004975;
	Tue, 21 Jan 2025 06:39:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XNEd4f3lsublZxdjuJqaZcs0
	gWmUyU+UY0g9XZEOvBQ=; b=PRQ6ISYwaXJUTSt12rSCbSVPccg5dd3csP5aQ4wT
	8o25myG45vbahE/zGybjduVipsn0CrEv1YdbiCDNsNAIBgav6H3HFWfUIKt9UlJ8
	cBv3wo2Rc2da3rZSPk/u1ZFToa5oXkS8MGWd5aPkg1dOl4QEjMWH6KlfE4Ql5PRl
	ctaviiyLsrhbwZEmiRiYaSqFJLptwpW3p3ql2BNMhDPyMNskWqTXJKKHMOx5kAXw
	Cxq5jd6EW6YPuARE/GeNpolcl3/dK65dVMDTDJKiHawQXcNWzltCszk1ZApsVADY
	4gWHUnEAtCWqhc0/PU4GG6pmUaGgzhTKxlbzh0PUdHJuNw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44a2b80j6u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jan 2025 06:39:24 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50L6dNdw009977
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jan 2025 06:39:24 GMT
Received: from jinlmao-gv.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 20 Jan 2025 22:39:20 -0800
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
CC: Mao Jinlong <quic_jinlmao@quicinc.com>, <linux-kernel@vger.kernel.org>,
        <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v4 1/2] dt-bindings: arm: Update compatible for remote etm
Date: Tue, 21 Jan 2025 14:38:59 +0800
Message-ID: <20250121063900.3211-2-quic_jinlmao@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250121063900.3211-1-quic_jinlmao@quicinc.com>
References: <20250121063900.3211-1-quic_jinlmao@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: zgX1agSx2X6ZtC1coKaNhIWUTr162H9d
X-Proofpoint-ORIG-GUID: zgX1agSx2X6ZtC1coKaNhIWUTr162H9d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-21_03,2025-01-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 phishscore=0
 clxscore=1015 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501210053

Use different compatible to distinguish between different remote
etms.

Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
---
 .../bindings/arm/qcom,coresight-remote-etm.yaml       | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-remote-etm.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-remote-etm.yaml
index 4fd5752978cd..199f2ca4b8a9 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-remote-etm.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-remote-etm.yaml
@@ -18,7 +18,14 @@ description:
 
 properties:
   compatible:
-    const: qcom,coresight-remote-etm
+    contains:
+      enum:
+        - qcom,coresight-modem-etm
+        - qcom,coresight-wcn-etm
+        - qcom,coresight-adsp-etm
+        - qcom,coresight-sensor-etm
+        - qcom,coresight-modem2-etm
+        - qcom,coresight-cdsp-etm
 
   out-ports:
     $ref: /schemas/graph.yaml#/properties/ports
@@ -38,7 +45,7 @@ additionalProperties: false
 examples:
   - |
     etm {
-        compatible = "qcom,coresight-remote-etm";
+        compatible = "qcom,coresight-modem-etm";
 
         out-ports {
             port {
-- 
2.17.1


