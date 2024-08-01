Return-Path: <linux-arm-msm+bounces-27665-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B5BFB9444B3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 08:47:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5F23B1F2303C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 06:47:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C5CC16DC07;
	Thu,  1 Aug 2024 06:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="anNe+jda"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED19158554;
	Thu,  1 Aug 2024 06:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722494786; cv=none; b=jS9wdSvKEYDcpcerQ6eOWVaMM/xV20Dd4I+DdOJXZyUQZAWAGtmQ/PVGdUFVP2EFxlD1Fu1DInSS93yePqygLAqOHRQXnGsDdD9R/O45HaP/7kn1kt/uSdfkQgyuV42WmxhpdPdxRETqZIAKmneBg0Q/Kc19bpJhzfth3uHH5Oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722494786; c=relaxed/simple;
	bh=8G5gthiGLmFYfsSpOfWnuLC+WUAqgUgWU6CxbcIjH38=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WXHRHsIgFaHJ3MjaysgcR5eiaP5Y6Dm7GICdcBH88M2hKscYK9z8P8He0m4Qe+8tGUggKX7/YbISmYGAgburceIACswiUSBQqeBPvst9HqvMAF7GI7H6ph/23bc3QCTolVjZc5WiuZv8g23ydZsgzMb0RuP0Wdc+3tr55Je2Kps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=anNe+jda; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46VL5qKo022460;
	Thu, 1 Aug 2024 06:46:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	triLUo8JO01x0w27o+gY+yiSzmk/tRwCc2VJYGT8vbY=; b=anNe+jda61z0s0V1
	XRTiR/6MWwGxjVZLf+EhdgeFNmJwQ9fILl0T8ADNW7TUJxGWY+ktQ4HwOp2a18W/
	DGCShkyCd5vdQ1zZaGBqQUbuGflfByiFQoSJrp5qY+U7bt3qQzoCJj0J/zA1ggWD
	RdgEchDkrj5oxaKXeZwvM5eqgll+3VfbHcbtKp6k6y+dtLSNgnFpmlBxr1mDYRCI
	nOHvXFYXyryKUGbXZTGCB4XQ3DE3jojY9kxRtJAB5K18DJOOxBOg4hSkPBenOvy9
	4QYYAZ0WxWeJZdS2NvOAKwiUQk5BDjhK7WEnA4VKx7XLBpdrdiIXvEXkBJ3q2uuw
	JUS1bA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40qkv0twr0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Aug 2024 06:46:07 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 4716k6sG026165
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 1 Aug 2024 06:46:06 GMT
Received: from hu-jkona-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 31 Jul 2024 23:46:00 -0700
From: Jagadeesh Kona <quic_jkona@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Taniya Das
	<quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        "Satya
 Priya Kakitapalli" <quic_skakitap@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        "kernel
 test robot" <lkp@intel.com>
Subject: [PATCH V4 1/2] dt-bindings: clock: qcom: Drop required-opps in required on sm8650 videocc
Date: Thu, 1 Aug 2024 12:14:47 +0530
Message-ID: <20240801064448.29626-2-quic_jkona@quicinc.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240801064448.29626-1-quic_jkona@quicinc.com>
References: <20240801064448.29626-1-quic_jkona@quicinc.com>
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
X-Proofpoint-ORIG-GUID: HYzyw6yCQ90aMr7Fy0Pt2EsSX5OjutyF
X-Proofpoint-GUID: HYzyw6yCQ90aMr7Fy0Pt2EsSX5OjutyF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-01_04,2024-07-31_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=915 clxscore=1015
 adultscore=0 priorityscore=1501 malwarescore=0 mlxscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408010037

On SM8650, the minimum voltage corner supported on MMCX from cmd-db is
sufficient for clock controllers to operate and there is no need to specify
the required-opps. Hence remove the required-opps property from the list of
required properties for SM8650 videocc bindings.

This fixes:

arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: clock-controller@aaf0000:
'required-opps' is a required property

arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: clock-controller@aaf0000:
'required-opps' is a required property

arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: clock-controller@aaf0000:
'required-opps' is a required property

Fixes: a6a61b9701d1 ("dt-bindings: clock: qcom: Add SM8650 video clock controller")
Reported-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Closes: https://lore.kernel.org/all/0f13ab6b-dff1-4b26-9707-704ae2e2b535@linaro.org/
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202407070147.C9c3oTqS-lkp@intel.com/
Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
---
 .../bindings/clock/qcom,sm8450-videocc.yaml           | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
index b2792b4bb554..9829ba28fe0e 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
@@ -44,11 +44,20 @@ required:
   - compatible
   - clocks
   - power-domains
-  - required-opps
   - '#power-domain-cells'
 
 allOf:
   - $ref: qcom,gcc.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sm8450-videocc
+              - qcom,sm8550-videocc
+    then:
+      required:
+        - required-opps
 
 unevaluatedProperties: false
 
-- 
2.45.2


