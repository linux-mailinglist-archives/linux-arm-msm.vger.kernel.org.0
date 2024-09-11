Return-Path: <linux-arm-msm+bounces-31448-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9972F974AB9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2024 08:57:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2B3501F2610E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2024 06:57:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAF7F13AA45;
	Wed, 11 Sep 2024 06:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GC4mXxVf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71A613AA3E;
	Wed, 11 Sep 2024 06:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726037813; cv=none; b=EuIhVP9e7FDtAye8yEFu52CmgvkczKQAtGQjZhy9b0cvK/lKcy86jrwPF1+QsduTr8y1O89VjYAJKAR8E07/80yl2tuHfLcVNUp7FDZlwEDn+9X97RPdb96/Xqg6PJ+UWdM2JjTj4KHiHf0OlrzVVR/O/qzR4U1OLJuHa8hPDCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726037813; c=relaxed/simple;
	bh=5XHmeOafFEPb+83jR1scQUngvM06Zf6uSKB+LBJsZGc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=dNjE2kDu1gmvkgLKINp4bQJcLEDWcYE+166cL1MztVJWqGBpGokMmIJRR9/Royvtn1kPaFMqc+8n+L5KVAkVbT829EM74HvC+3mdjUKuqMdC9LCqVA7l4or8HISIkfLVxKGfamP6ajKTBhQdVFHD3aacBKnv6iKwKxERaP9xIf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=GC4mXxVf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48B2UPkv025595;
	Wed, 11 Sep 2024 06:56:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6/bkBr9Tx3/7BDAHIB2V2G
	Gy6nmTSJTP79H8ggFV2lc=; b=GC4mXxVfznlM2BRJxBRa7ER9vp/dd5PtM4jkD0
	JYNFwXL5huOWcBYhKTyoQ1QwumqmNfXxoiVsOhif/ZcAaOM34At81oqbMfEpMJZF
	BahTgUyGo7EDluj3jeQXCS+4ZCfg3Xhnjxm/WLUsgDyP1PTSTJ7lx0GHPOyWrWJ8
	aZmEegOamhm3aRfNsoPV2uZZs0ewf/qqSIp7VyXA+46e9wfEKA895pSua0py2EVm
	agvYEuEmL9ncu7nBU7ypwPHMTOowhTum96r6rlK361PnVjSg0yMFg3Hi7u1Aqcai
	dr7VeE44QG42iASOopkoeTy4y+7NQzYAHz04SISbiQ7zUMGA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41gy730nwe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Sep 2024 06:56:43 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48B6ufiI007829
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Sep 2024 06:56:41 GMT
Received: from jingyw-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 10 Sep 2024 23:56:38 -0700
From: Jingyi Wang <quic_jingyw@quicinc.com>
Date: Wed, 11 Sep 2024 14:56:16 +0800
Subject: [PATCH v2] dt-bindings: phy: Add QMP UFS PHY comptible for QCS8300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240911-qcs8300_ufs_phy_binding-v2-1-c801a2d27a84@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAA8/4WYC/z2NwQqDMBAFf0VybspGQ9We/I8iISarLrRRE5WK+
 O9NpfQ4A2/ezgJ6wsDuyc48rhRocBHSS8JMr12HnGxklkIqoRSCTyYUGYBa2qDGflMNOUuu44W
 8ScAM86bJWVyPHlt6n+VHHbmnMA9+O49W8bW/Jsh/kxzNpJ/KzoH4KjhwC6hL3VoDkFfTQoacu
 ZrhxerjOD7KenfqvQAAAA==
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_jingyw@quicinc.com>, Xin Liu <quic_liuxin@quicinc.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726037798; l=3160;
 i=quic_jingyw@quicinc.com; s=20240910; h=from:subject:message-id;
 bh=6E11ti2Lz75Yu9od4zrxe9UYQq4yP0zh1Q49HV1v+aQ=;
 b=SygEXo0n/hX7lHirmFjyKpA/ieT1v9RmC8rvld7rmFyqr6VeI9VtbQ9H7h/FMub/KW3s6mMPh
 jyU4Kyb6LXNDFlkcd3FdelmjZMP4+Wkanw5uDEJZ9NKFjWt8JiOUsvI
X-Developer-Key: i=quic_jingyw@quicinc.com; a=ed25519;
 pk=ZRP1KgWMhlXXWlSYLoO7TSfwKgt6ke8hw5xWcSY+wLQ=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: s3Nw7gUB9wv-FHyVVux_JP7QHa3fA3pb
X-Proofpoint-GUID: s3Nw7gUB9wv-FHyVVux_JP7QHa3fA3pb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 adultscore=0 mlxlogscore=999 suspectscore=0
 priorityscore=1501 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2408220000 definitions=main-2409110051

From: Xin Liu <quic_liuxin@quicinc.com>

Document the QMP UFS PHY compatible for Qualcomm QCS8300 to support
physical layer functionality for UFS found on the SoC. Use fallback to
indicate the compatibility of the QMP UFS PHY on the QCS8300 with that
on the SA8775P.

Signed-off-by: Xin Liu <quic_liuxin@quicinc.com>
Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>
---
Changes in v2:
- decoupled from the original series.
- Use fallback to indicate compatibility with SA8775P.
- typo fixup
- Link to v1: https://lore.kernel.org/r/20240904-qcs8300_initial_dtsi-v1-0-d0ea9afdc007@quicinc.com
---
 .../bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml    | 46 ++++++++++++----------
 1 file changed, 26 insertions(+), 20 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
index f9cfbd0b2de6..626a2039e177 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
@@ -15,26 +15,31 @@ description:
 
 properties:
   compatible:
-    enum:
-      - qcom,msm8996-qmp-ufs-phy
-      - qcom,msm8998-qmp-ufs-phy
-      - qcom,sa8775p-qmp-ufs-phy
-      - qcom,sc7180-qmp-ufs-phy
-      - qcom,sc7280-qmp-ufs-phy
-      - qcom,sc8180x-qmp-ufs-phy
-      - qcom,sc8280xp-qmp-ufs-phy
-      - qcom,sdm845-qmp-ufs-phy
-      - qcom,sm6115-qmp-ufs-phy
-      - qcom,sm6125-qmp-ufs-phy
-      - qcom,sm6350-qmp-ufs-phy
-      - qcom,sm7150-qmp-ufs-phy
-      - qcom,sm8150-qmp-ufs-phy
-      - qcom,sm8250-qmp-ufs-phy
-      - qcom,sm8350-qmp-ufs-phy
-      - qcom,sm8450-qmp-ufs-phy
-      - qcom,sm8475-qmp-ufs-phy
-      - qcom,sm8550-qmp-ufs-phy
-      - qcom,sm8650-qmp-ufs-phy
+    oneOf:
+      - items:
+          - enum:
+              - qcom,qcs8300-qmp-ufs-phy
+          - const: qcom,sa8775p-qmp-ufs-phy
+      - enum:
+          - qcom,msm8996-qmp-ufs-phy
+          - qcom,msm8998-qmp-ufs-phy
+          - qcom,sa8775p-qmp-ufs-phy
+          - qcom,sc7180-qmp-ufs-phy
+          - qcom,sc7280-qmp-ufs-phy
+          - qcom,sc8180x-qmp-ufs-phy
+          - qcom,sc8280xp-qmp-ufs-phy
+          - qcom,sdm845-qmp-ufs-phy
+          - qcom,sm6115-qmp-ufs-phy
+          - qcom,sm6125-qmp-ufs-phy
+          - qcom,sm6350-qmp-ufs-phy
+          - qcom,sm7150-qmp-ufs-phy
+          - qcom,sm8150-qmp-ufs-phy
+          - qcom,sm8250-qmp-ufs-phy
+          - qcom,sm8350-qmp-ufs-phy
+          - qcom,sm8450-qmp-ufs-phy
+          - qcom,sm8475-qmp-ufs-phy
+          - qcom,sm8550-qmp-ufs-phy
+          - qcom,sm8650-qmp-ufs-phy
 
   reg:
     maxItems: 1
@@ -85,6 +90,7 @@ allOf:
           contains:
             enum:
               - qcom,msm8998-qmp-ufs-phy
+              - qcom,qcs8300-qmp-ufs-phy
               - qcom,sa8775p-qmp-ufs-phy
               - qcom,sc7180-qmp-ufs-phy
               - qcom,sc7280-qmp-ufs-phy

---
base-commit: 100cc857359b5d731407d1038f7e76cd0e871d94
change-id: 20240911-qcs8300_ufs_phy_binding-84640e3e7bb7

Best regards,
-- 
Jingyi Wang <quic_jingyw@quicinc.com>


