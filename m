Return-Path: <linux-arm-msm+bounces-45781-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F2896A18EB0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 10:48:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C564018821CE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 09:48:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 005B4211295;
	Wed, 22 Jan 2025 09:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Lzb1ml2d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70755210F7A;
	Wed, 22 Jan 2025 09:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737539260; cv=none; b=lQJrfLxDudNTQ8nfFA89D66K4HfCX5RSuJ95D7MNHmKDdmvigWbeKvK8dpv9ot9PRYM0RCuNAgTPE6gaVgRJ05ZW2svC/G0df3+7PEuHdpq9eivSJECamAhSmyFQ0aYsCwDDMtdPWZknxb75XhTMdsuZ2gS3wldCr0LufSqaP1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737539260; c=relaxed/simple;
	bh=7ThAnBLDuyNLes3909bR3KbZBieJGPGTusa9FxiaGpQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=q78Fyoit5GmlVBEdA8gj2aEENbwe2VLf4FfKt7PxeVZT6nEGqsEEQwUbB4BX1jHmkWksNXGnVz/5E9a8sNxRCAvIh1Y/HdgYcv9nbW3mH64Xbt6Z4WtVW4cboRcbscOSoipmH9Iw/aiOunR9vawgDqls/VBYsschIfci4l9rXuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Lzb1ml2d; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50M4Z4Pd019857;
	Wed, 22 Jan 2025 09:47:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kjU5fQuo+P+ke+jm/8Etxacy
	ahCtxiZnRKj3JClFncw=; b=Lzb1ml2dmG0gxeB/PtICl5ly/Kg3b3x2r0HSDjAZ
	BYL2/aQt2wsQaNK+AH9R0IErFlNKnzYehy80rc6Fv7Uis9vgQp4dLQEwZTAjSIvt
	aXLN/B/XH6TREmw8ts2bBmZO8a+vT30XssBmEJqIfi83rJmG8qEkaSwkJgu2Tbzg
	C2jKub4cuVoCHErUK5uZj5T0YGlLIANw4wGwSwYupU/+JGhzWM9UndFB+N31o2jO
	eWQShYEttqpGpbTFDSTL8MVmJeSucSyeZoTIrd4UUbNxBd0rEZVoS+9JE1Bu3pPo
	m92vJEjXRRQ/l//BP29ZRytpoBW/5yl9ZmByblJcpkKJXw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44ass6gq4s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jan 2025 09:47:35 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50M9lY5T012094
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jan 2025 09:47:34 GMT
Received: from hu-sachgupt-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 22 Jan 2025 01:47:29 -0800
From: Sachin Gupta <quic_sachgupt@quicinc.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Bhupesh Sharma
	<bhupesh.sharma@linaro.org>
CC: <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <quic_cang@quicinc.com>, <quic_nguyenb@quicinc.com>,
        <quic_bhaskarv@quicinc.com>, <quic_mapa@quicinc.com>,
        <quic_narepall@quicinc.com>, <quic_nitirawa@quicinc.com>,
        <quic_rampraka@quicinc.com>, <quic_sachgupt@quicinc.com>,
        <quic_sartgarg@quicinc.com>
Subject: [PATCH V3 1/4] dt-bindings: mmc: Add dll-hsr-list for HS400 and HS200 modes
Date: Wed, 22 Jan 2025 15:17:04 +0530
Message-ID: <20250122094707.24859-2-quic_sachgupt@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250122094707.24859-1-quic_sachgupt@quicinc.com>
References: <20250122094707.24859-1-quic_sachgupt@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: w0M2PPkWl0XkyIA0YB887CywsXELyj62
X-Proofpoint-ORIG-GUID: w0M2PPkWl0XkyIA0YB887CywsXELyj62
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-22_04,2025-01-22_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 mlxscore=0 adultscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 clxscore=1015 mlxlogscore=754 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501220071

Document the 'dll-hsr-list' property for MMC device tree bindings.
The 'dll-hsr-list' property defines the DLL configurations for HS400
and HS200 modes.

Signed-off-by: Sachin Gupta <quic_sachgupt@quicinc.com>
---
 Documentation/devicetree/bindings/mmc/sdhci-msm.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
index 8b393e26e025..65dc3053df75 100644
--- a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
+++ b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
@@ -133,6 +133,11 @@ properties:
     $ref: /schemas/types.yaml#/definitions/uint32
     description: platform specific settings for DLL_CONFIG reg.
 
+  qcom,dll-hsr-list:
+    maxItems: 10
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: platform specific settings for DLL registers.
+
   iommus:
     minItems: 1
     maxItems: 8
-- 
2.17.1


