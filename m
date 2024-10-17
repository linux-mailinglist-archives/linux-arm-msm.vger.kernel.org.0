Return-Path: <linux-arm-msm+bounces-34689-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EA0379A19A5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 06:24:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 11CC81C22B3A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 04:24:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A82F1143895;
	Thu, 17 Oct 2024 04:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="MbSYk/gA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AAA47346F;
	Thu, 17 Oct 2024 04:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729139037; cv=none; b=BTkIvAEOOgGFcsgWZQBzB1Wrsd9NpAASgJy9L/a/AZbHAl5GFa8u8HyeF66tT0kFeoQaPGWt/yxfUAlf0DWpvrRwNV7H8ICiQXFz8X5uZGhNJdnLJT5J0saBrkmtjwLK9l80wMHWudKn77XPYyWwhaHIdE0Xric/6jFCp2NH1Qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729139037; c=relaxed/simple;
	bh=EC0Q2bw/6/mCuq0ikTm5yQjaUMk2RBpo4IwLJO3mniw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N1Trwa1CUkgHMuyMLaMqwQKTii0Nl6jApWlEn/dINAipQSTPLR8AQdbFca2NaVipCjVz5VDDj0XxlBoG6Z13yQW+NwcIvwqtrpcIxSy0fd9gyMvne8MFvKgsKVtYR3HQ6df3YUAegv+ojOezMeik0aMQHKPlydz6oDml2ASamO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=MbSYk/gA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49H0N3dV010214;
	Thu, 17 Oct 2024 04:23:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e4c32fQp7Wu/Z1fc/bRbz2Q464s66jmr/8HvvG1+SBQ=; b=MbSYk/gAHx02BW61
	0n6SsB3gvpzIyKS8pkkQBUAI8jT2VSCYVzFbqjYFLMJynSEMfWc0CqVGqPIAyfIt
	qcNv1hGU+ZMvFnIe6rdCCl6+sPXxHMYnWbLaN8bm/qTkkl6+EFjlFSWky8ttN0/u
	8Gt2RnTlfib8jSPNRRUuNxBWlvrF3yHxwaOloCcsSyCGkfuNIrao0FD1WvUdiJBC
	RFSD9j7/5b8+wmPlq6YuYg173ZVYlvuYPR4Fv68U07uOn2uwNwptD1+txvHlJeHn
	Xyc+RkLRd8mzix/q+W0yUT78x5iXzLfjUdEh24bVGXydrTBwEtkxbx5HAp3IsgH+
	S/3syg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42ar050gh1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Oct 2024 04:23:43 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49H4NgJL019515
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Oct 2024 04:23:42 GMT
Received: from liuxin-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 16 Oct 2024 21:23:36 -0700
From: Xin Liu <quic_liuxin@quicinc.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam
	<manivannan.sadhasivam@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>, Andy Gross <agross@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-scsi@vger.kernel.org>, <quic_jiegan@quicinc.com>,
        <quic_aiquny@quicinc.com>, <quic_tingweiz@quicinc.com>,
        <quic_sayalil@quicinc.com>
Subject: [PATCH v1 1/4] dt-bindings: phy: Add QMP UFS PHY comptible for QCS615
Date: Thu, 17 Oct 2024 12:22:57 +0800
Message-ID: <20241017042300.872963-2-quic_liuxin@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241017042300.872963-1-quic_liuxin@quicinc.com>
References: <20241017042300.872963-1-quic_liuxin@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: uZ2U60uycUYMUTj-5dnKm9OhSFMPSK9P
X-Proofpoint-ORIG-GUID: uZ2U60uycUYMUTj-5dnKm9OhSFMPSK9P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=988
 clxscore=1015 spamscore=0 suspectscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410170029

From: Sayali Lokhande <quic_sayalil@quicinc.com>	
	
Document the QMP UFS PHY compatible for Qualcomm QCS615 to support physical
layer functionality for UFS found on the SoC. Use fallback to indicate the
compatibility of the QMP UFS PHY on the QCS615 with that on the SM6115.

Signed-off-by: Sayali Lokhande <quic_sayalil@quicinc.com>
Co-developed-by: Xin Liu <quic_liuxin@quicinc.com>
Signed-off-by: Xin Liu <quic_liuxin@quicinc.com>
---
 .../phy/qcom,sc8280xp-qmp-ufs-phy.yaml        | 45 ++++++++++---------
 1 file changed, 25 insertions(+), 20 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
index f9cfbd0b2de6..a93d64d1c55b 100644
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
+              - qcom,qcs615-qmp-ufs-phy
+          - const: qcom,sm6115-qmp-ufs-phy
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
-- 
2.34.1


