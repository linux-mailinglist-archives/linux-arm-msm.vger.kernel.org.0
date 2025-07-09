Return-Path: <linux-arm-msm+bounces-64153-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C9EF0AFE449
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 11:39:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C62041885649
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 09:39:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B2E92868B3;
	Wed,  9 Jul 2025 09:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="U2lKCI4x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16AB6286894;
	Wed,  9 Jul 2025 09:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752053897; cv=none; b=TuJmeKCAFBG+l47kzvpyrBay8lnhGSWvLDk/+FJ42V0jSD2hMaqP5i7l4x4RegIloDr4B5hiOhqHAvKVkgH3fyRtNBptO6XENyOCpDQliHl+1mF0nyAfftAtVDaWCEIfdxQJKza7aMkYDtgMeZtmDN4gZunL680ilBLeBuPOSKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752053897; c=relaxed/simple;
	bh=OPs98XQk4zL/ffssrEB4uAKaYLiwuoxrM3kt/JQj5Zw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=RMChxn4C5I0MZufpEO2CmPwme39B/xOgUj0BpvLvOT5rxnHeMetB8tsqGRRGNpnpc5U5ya30vrLz+Mj0DmdpOIJZ8iad8No0I+sWHUjryIdXMu09l8qFRqKKtk7AgjBFErV+jXznbSmN4f/o3yjKqC96QqjJFGbGpccu+NDjUPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=U2lKCI4x; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5694x2Oa006230;
	Wed, 9 Jul 2025 09:38:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GBAgqCQrcm/EG/e/Kdvc/CH6fuohof1rfbZbE8xr+C8=; b=U2lKCI4xBcXy81XR
	MYQnWu6VLXhWStKHvcbHlB9dR8POslBtuSXSJwO2fCN/0AkfLb58u0IfEQiqxr1F
	f2IWC6Nm0tJSuz2/yQj7MOtkU6JVGn9LxUwXF9X4O0bJ98raBNNZDHhfrQhtDyjH
	NoK8FHOZ+ROura4CYYgC36DGBmVoqQ7ttNRBbEVph7R96wWhLZugqR+TYj0Liy8g
	LtupgzIWgIkYtigulO913rnmhfJYqXkmrDXkzm0D+jHCYdWyLMORSKERZXgxuHtl
	uCQ9ZT7gF5JaqXI+Qg6FlrnD/4NpXO6BsUyW7BWnTHimypOUVAGcYOwor0zU8hEP
	GScg/A==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pu2bbq15-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Jul 2025 09:38:10 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5699c8va023455
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 9 Jul 2025 09:38:08 GMT
Received: from hu-skakitap-hyd.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 9 Jul 2025 02:38:03 -0700
From: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Date: Wed, 9 Jul 2025 15:07:24 +0530
Subject: [PATCH 3/8] dt-bindings: clock: qcom,mmcc: Reference qcom,gcc.yaml
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250709-gcc-ref-fixes-v1-3-ceddde06775b@quicinc.com>
References: <20250709-gcc-ref-fixes-v1-0-ceddde06775b@quicinc.com>
In-Reply-To: <20250709-gcc-ref-fixes-v1-0-ceddde06775b@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        "Srinivas
 Kandagatla" <srini@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        "Jagadeesh
 Kona" <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Satya Priya Kakitapalli
	<quic_skakitap@quicinc.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA5MDA4NCBTYWx0ZWRfXwdcn/deVjZck
 guYlbpgA1TNZUVC34mPQQA1zuTlt7R33m0AMRHGu0m40R6sJwaOIo7wrOMk8EIkpFxcrdLytmYc
 uiW1XOsuGjhX8SghtV0sW6nv/ef1d+ZBCvDS3IRWZB3vDZJoWWWihWh1nFH1Y7i5GlLAs7Cccke
 1uWnJissWpFxZg7wNXlG0OfEmBiZsqmif4hy9csDEZln4rYnYkXbtwmZgwrlAc0oqK570g9wDJF
 LCrrzHOFSotulNafMo6YHIThmbUGwmRXQIEqlWFphyF9+HmGoKc0GYBK9/l2XxSN8YgZX+4KPiV
 jLOJy2xBSjWN+zIeefHwY/F5lFMMFza1jINmqgXMaJW9RFGSpd72k1Kc8tB0UuMPl69fKaH9C7P
 Qf7LAaw9a/3k+u2VjxYFslITWSnXH/c/fsR2VVOnWvd4gO0jJHk200rTuREWgFl2ZYNyoVDm
X-Proofpoint-ORIG-GUID: COaTBKXHe4S9XAC53Kk5MB9S4xbrPDeK
X-Proofpoint-GUID: COaTBKXHe4S9XAC53Kk5MB9S4xbrPDeK
X-Authority-Analysis: v=2.4 cv=erTfzppX c=1 sm=1 tr=0 ts=686e3882 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=N-yRUQX-G7W_IfMN7YQA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-09_02,2025-07-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1011 impostorscore=0 spamscore=0 priorityscore=1501
 mlxlogscore=999 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507090084

Reference the common qcom,gcc.yaml schema to unify the common
parts of the binding.

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


