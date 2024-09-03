Return-Path: <linux-arm-msm+bounces-30519-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48949969D54
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 14:19:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AE338B21F0B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 12:19:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B86F61C9877;
	Tue,  3 Sep 2024 12:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ZlgkQqZR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 358861C9857;
	Tue,  3 Sep 2024 12:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725365965; cv=none; b=UTp8pFK3rnn9k9XNG+N/Prp13ryff7CranFL9BbiCbYtfxn3MjtrHN3raubRyeUrQ0aMeAi0p9/YjhDryvH/E8hSXnb1GpK3VWSdBRg1Oquf5Iy/bZlz3u96KTw5KmB0ZPAA1HCc9H6a1nv+Z8ZufESBaXR2iBzNTHR0l6DkLUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725365965; c=relaxed/simple;
	bh=ii1/NyVsxr2qk73ZDhBJMCPwC6YgIr9F4Hp2yjFIAAU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UOSO2w1abrA97MOYkLPsMOIR1dcQIt3MvgQ6sJhUUfSW9RwcVy8oKFBZ/44L0OyVPjMQK523SOrk5DKwevL4JbvJ9LykTmVf23O3qbjWH0NZWti4rnWj6JJrwyaLZrvc68SAehf8OWP7MCBZsE14nSOVAScDD9/7R/Qc8D/w6lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ZlgkQqZR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4838R7xK020929;
	Tue, 3 Sep 2024 12:19:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l66YsLJZk4WHxaR2rbKmbE0bNjKE/BtXOmdLawEMeHg=; b=ZlgkQqZRF7cyC1/S
	Q/iIh2uR/BbynkVsVta6ynlyiVvToiPkGE8+GZUFYyxCNMtAoIi+HWZHMxa+cSBs
	LYX4M5IoY5EojCl1cf5V8C2FXzLWRqJVQO/kx1IZu3bkJ5lyIhI+uC8VIuyHWp3V
	eqzJB3Sty8SFh1bzRNkH2mao6RX8dvA4YiqqwRoJWZTnscTcGU8/nXMs5HOpolkf
	B7StAKX8cV5TOezmRqINEq4d12m6iStgW+acxRPVfkaLrLpIAuLfT9Z/iqLchYPr
	pUCPGmlv4L5vCYnCWBVYkfWe/CqeZv2lHf/T7kAxzo1BS0wQEUsXq21AQsvJBn6f
	EtKB4w==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41dxy20kkc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Sep 2024 12:18:59 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 483CIxQc001887
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 3 Sep 2024 12:18:59 GMT
Received: from hu-jinlmao-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 3 Sep 2024 05:18:58 -0700
From: Mao Jinlong <quic_jinlmao@quicinc.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>, James Clark <james.clark@arm.com>,
        "Alexander
 Shishkin" <alexander.shishkin@linux.intel.com>,
        Andy Gross
	<agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring
	<robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: Mao Jinlong <quic_jinlmao@quicinc.com>, <linux-kernel@vger.kernel.org>,
        <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v1 1/2] dt-bindings: arm: Add Qualcomm extended CTI
Date: Tue, 3 Sep 2024 05:18:43 -0700
Message-ID: <20240903121847.6964-2-quic_jinlmao@quicinc.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240903121847.6964-1-quic_jinlmao@quicinc.com>
References: <20240903121847.6964-1-quic_jinlmao@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: EyEbIDmAIrhiduBPhYl9kK2FLJif39R3
X-Proofpoint-ORIG-GUID: EyEbIDmAIrhiduBPhYl9kK2FLJif39R3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-02_06,2024-09-03_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 lowpriorityscore=0 mlxlogscore=999 spamscore=0 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2409030099

Add Qualcomm extended CTI support in CTI binding file. Qualcomm
extended CTI supports up to 128 triggers.

Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
---
 .../devicetree/bindings/arm/arm,coresight-cti.yaml | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
index 6a73eaa66a42..141efba7c697 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
@@ -87,6 +87,10 @@ properties:
           - const: arm,coresight-cti-v8-arch
           - const: arm,coresight-cti
           - const: arm,primecell
+      - items:
+          - const: qcom,coresight-cti-extended
+          - const: arm,coresight-cti
+          - const: arm,primecell
 
   reg:
     maxItems: 1
@@ -254,6 +258,16 @@ examples:
       clocks = <&soc_smc50mhz>;
       clock-names = "apb_pclk";
     };
+  # minimum extended CTI definition.
+  - |
+    cti@10010000 {
+      compatible = "qcom,coresight-cti-extended", "arm,coresight-cti",
+                   "arm,primecell";
+      reg = <0x10010000 0x1000>;
+
+      clocks = <&aoss_qmp>;
+      clock-names = "apb_pclk";
+    };
   #  v8 architecturally defined CTI - CPU + ETM connections generated by the
   #  driver according to the v8 architecture specification.
   - |
-- 
2.41.0


