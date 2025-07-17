Return-Path: <linux-arm-msm+bounces-65380-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C5121B08520
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 08:40:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C53EA1C21554
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 06:40:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8E7021767C;
	Thu, 17 Jul 2025 06:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LxJlLdwb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 261FF2192E4;
	Thu, 17 Jul 2025 06:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752734370; cv=none; b=UQTgXLwlpdO3wZ8lVg1E769TaYdrqYRsun8AKgTSiimVJbXclgDM96rRmeB/Zgqldck/IC3XFsx90LXLg9B0h/ILY8UQL91etGyKoyvtt/Kwj9PwlbBOP2q0JZ4Hh3bibNt6sXWGF9QhW6Eg+UkNqYR6AURhfuOaeGKuXYUwBqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752734370; c=relaxed/simple;
	bh=CISzNPd7z9fxNZA47ggkUmMKwlJW0e2fcJ0/AfBmesg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=GkscteADQWQ3AhYmuLIAp8O6RVpOLXQqH6PVFCnDWtcD/xvkiVFRrSLrL2nxuHhOtuqazxrTBP/M8AyV8VpKDKWYHOXADMYfe6TNvzKcapEpM7CYzUXlhGBsEtM3wyHNfL/q1CCNeAOyGjrn8i1hmt85khGaR+3zfLdzODoTj+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LxJlLdwb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56H4Bg8j022228;
	Thu, 17 Jul 2025 06:39:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rR5Ga/9lzffQLlAzWAcKzBckmsuukJzd+PEaHjWh+yM=; b=LxJlLdwbLAa7p5JK
	kiwHzDTBktooR205RRkUqFcx1YXcjz2mAteYgI4X8dGlS7EP1uKp49NVES3nvgBh
	ree5w8faLBKYe9m6spC+aVk1xtq/vYSzEh0X3taTv/DQOYvdaMpkAYZkmiSkUCk9
	FfmAQJ0m7b//tMjtf7xjEzeED6AflYbo3ub1SBE3JRCe6dpK2OAtMQ69neoh5gh9
	OiVOc8RAAUkt9SuFavbkVcouOkBGt8A7ABFPRlmRPjo0gr5dDfwZxNXTv/24zdl4
	xSKgGl4gJUDV4Wbj0yDrP3k6X5sis3EeEUwUJgNnfuMdOSlFwJiNzb3jYhRmqwTL
	nKbwJA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wqsy6f9e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Jul 2025 06:39:25 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56H6dO4a003741
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Jul 2025 06:39:24 GMT
Received: from hu-skakitap-hyd.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 16 Jul 2025 23:39:20 -0700
From: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Date: Thu, 17 Jul 2025 12:08:34 +0530
Subject: [PATCH v2 2/4] dt-bindings: clock: qcom,mmcc: Reference
 qcom,gcc.yaml
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250717-gcc-ref-fixes-v2-2-a2a571d2be28@quicinc.com>
References: <20250717-gcc-ref-fixes-v2-0-a2a571d2be28@quicinc.com>
In-Reply-To: <20250717-gcc-ref-fixes-v2-0-a2a571d2be28@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Jagadeesh Kona
	<quic_jkona@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Taniya Das
	<quic_tdas@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Satya Priya Kakitapalli
	<quic_skakitap@quicinc.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDA1NiBTYWx0ZWRfXx/LC3UynlI2V
 J37Tgid+xRMjKImoPL4O47RqmwjImU3f1ck6+LC6hUNA0/FpW/K6NXtKAH6kzvN3EWlqyjsowLG
 HVHFmd/tQr29JUf1XPyERM9rykUF5FdGcPoREp8okNTU0nH9JhDxgc8Y5vc2T6FKszfQz8I3jEq
 fMEYcSQpiLriB2j4e8amYtaa+VCw5ex5CR+tq+u/hBj2gYJdSF1U1vDKbjbTFjNMr6qySLVA4q2
 9f58nvG49X2Vx2oIUMndp/V1HF55Q1ADjyxGWPMc9n+Xms/Hp3f3pkyBDIzoHx4aBbsklg608w9
 bTDftxbc5Ezmx7fX0mu5XnrLbr00IbVAerR3FHBaFglhRui73/5ohxLrTPKViZNsS5CN9MLFARA
 /LturmWoZdN1M6EKllKiau5hkSW0BHoDhgf9PJcX4JoFqsoTgG8q8i1kEnthtXmp2vHftUXF
X-Proofpoint-GUID: sxrjcELw1QyerZhsCPzK6gs94maHJxI5
X-Proofpoint-ORIG-GUID: sxrjcELw1QyerZhsCPzK6gs94maHJxI5
X-Authority-Analysis: v=2.4 cv=McZsu4/f c=1 sm=1 tr=0 ts=68789a9d cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=N-yRUQX-G7W_IfMN7YQA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_01,2025-07-16_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxlogscore=999 impostorscore=0 mlxscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 spamscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507170056

Reference the common qcom,gcc.yaml schema to unify the common
parts of the binding.

Suggested-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
---
 .../devicetree/bindings/clock/qcom,mmcc.yaml       | 24 +++-------------------
 1 file changed, 3 insertions(+), 21 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml b/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml
index 59ac288ca5f12de4f14fac3ce0d783d1ee1ebb4f..53ceec9673a810c2230548a47e045959e8159806 100644
--- a/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml
@@ -38,36 +38,16 @@ properties:
     minItems: 7
     maxItems: 13
 
-  '#clock-cells':
-    const: 1
-
-  '#reset-cells':
-    const: 1
-
-  '#power-domain-cells':
-    const: 1
-
-  reg:
-    maxItems: 1
-
-  protected-clocks:
-    description:
-      Protected clock specifier list as per common clock binding
-
   vdd-gfx-supply:
     description:
       Regulator supply for the GPU_GX GDSC
 
 required:
   - compatible
-  - reg
-  - '#clock-cells'
-  - '#reset-cells'
   - '#power-domain-cells'
 
-additionalProperties: false
-
 allOf:
+  - $ref: qcom,gcc.yaml#
   - if:
       properties:
         compatible:
@@ -351,6 +331,8 @@ allOf:
             - const: dp_link_2x_clk_divsel_five
             - const: dp_vco_divided_clk_src_mux
 
+unevaluatedProperties: false
+
 examples:
   # Example for MMCC for MSM8960:
   - |

-- 
2.25.1


