Return-Path: <linux-arm-msm+bounces-64156-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F522AFE459
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 11:40:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0CE361889D06
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 09:40:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FD51289E10;
	Wed,  9 Jul 2025 09:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HpT2HxBu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7170428981F;
	Wed,  9 Jul 2025 09:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752053908; cv=none; b=RJ8gNYSeEfV5F8EEKkXduGt4YCMwbcnJrUWnj80NG8XPfBBMt0/Ickv8bSGn3BzLlq7p1lE+D3ESGeg9yK7Siqo3j/VfLC9i61vIDzXGXC3L6Frzc+t94sAvW82f8mzSoq3LeWFQ+SPcbGwsTr6EzbHkcVVLR7Q7VWr8W+N2IEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752053908; c=relaxed/simple;
	bh=7m8rVrVbYDI/FGMFoHFiW2fYHx3bg6XtCg+Dfvkev7g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=jxr52zcksg1ct9T3dqdu9Cya7S/2+j7frL+2BcM6kjk5j4OJP0AZJVJ8O1HetGOW6U4rdCptaKvgnSxDTjOr304BS0NQeBww2qTzyVbkzJOwVYCIeyEEZvuA7h/d86+ZoUFAGM4voZE5kdvxlFL9svxmY1hy149v5YrCJnS8MdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=HpT2HxBu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5697nwCN008903;
	Wed, 9 Jul 2025 09:38:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ltsVdKj23CA1fao0MoiDx/oEwkBZNSrjju/rYZZQRpE=; b=HpT2HxBukxca1wez
	U+4gMkqIkhPKWSMFUH3cUwBzg8lGkB2PRodSEzV8fKkMUqtvNAGvVcqoqKafLp5E
	IflfZMiM8J1T5ms9gYVFNSRV6n3KPuvbrWPVDH1IKkkmxsE36XxiVRMR3p2cCO+f
	Se0oEpSLDRFI6hcRkJgcqPd932xWTPWerqAZKkRJmjwd6WRL36zpzMTdiHBauVX1
	HH/DpoaZUBoj26+d6iDqYhBIpRrpGy1bwA7nrO/34YiXXWaVPyppZaE3LZQMxfqt
	0Z9eBQjCc15HlRAV0v2DUyUPgNRkBqQW5M+DTTQMG3FOmy4Fvc6syVcfcnyOXtPI
	isHogQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smcg0as7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Jul 2025 09:38:24 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5699cNfT018639
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 9 Jul 2025 09:38:23 GMT
Received: from hu-skakitap-hyd.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 9 Jul 2025 02:38:18 -0700
From: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Date: Wed, 9 Jul 2025 15:07:27 +0530
Subject: [PATCH 6/8] dt-bindings: clock: qcom,sc8280xp-lpasscc: Reference
 qcom,gcc.yaml
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250709-gcc-ref-fixes-v1-6-ceddde06775b@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=P7o6hjAu c=1 sm=1 tr=0 ts=686e3890 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=F0pU5uu_82tItD7d-gkA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: NlOzVMGWu92D0zKcORj2BnJh_AEVbc0x
X-Proofpoint-GUID: NlOzVMGWu92D0zKcORj2BnJh_AEVbc0x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA5MDA4NiBTYWx0ZWRfXx9l6LXBEmjPX
 x8IS+VGx908qPzC3HjSRXYYuaAwjaC4YuDYtejOVeOd42z5x9LIjA4T41f3f6OlfKS4s9+1MuUN
 wBE1QpIbojB5eYMWh0ctXq0AkOQhiLPyfbfDzHuyH9vXTPG9NfXamYXyZeTx/k+XbBoyrEea8Yh
 krBx1xKyqSHSbDYr3e50fU/eukTs0VpBDbBbDNKbz5fsBxBAyR6KIeoFM96eEmcfDfCPwLgZh1A
 HtHPBSxrg9/LJLYon8SdMQhqVVI22FyfvxuTDSUn8PZe9e2MDYHdNk/tb3POZOqUz8fi0N6PeVW
 t9c1ssM1EfqvzsbEIxcd73QcyZvCYO7Qf4Pyrf6a8nSLfS7u7Z4VYa5OQejGpSq7KKIrWgm7JIT
 ehpBSbLkGaN3KLi9voIOhR7oDddy1ZX2POPHPenmD0iRZtfdX077yiyYNZIdla8nFClx3qJr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-09_02,2025-07-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 bulkscore=0 mlxscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 adultscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507090086

Reference the common qcom,gcc.yaml schema to unify the common
parts of the binding.

Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
---
 .../bindings/clock/qcom,sc8280xp-lpasscc.yaml           | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml b/Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml
index 273d66e245c5fdc3611a8b0254c2c6434e14cd5e..035d716c19cae0c7fd8a49d46092d2248d821a08 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml
@@ -29,22 +29,13 @@ properties:
           - const: qcom,x1e80100-lpasscc
           - const: qcom,sc8280xp-lpasscc
 
-  reg:
-    maxItems: 1
-
-  '#clock-cells':
-    const: 1
-
-  '#reset-cells':
-    const: 1
-
 required:
   - compatible
-  - reg
-  - '#clock-cells'
-  - '#reset-cells'
 
-additionalProperties: false
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.25.1


