Return-Path: <linux-arm-msm+bounces-80799-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 710A5C40E14
	for <lists+linux-arm-msm@lfdr.de>; Fri, 07 Nov 2025 17:29:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C5CFD4F5F27
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Nov 2025 16:26:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E13D2C11F2;
	Fri,  7 Nov 2025 16:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="aVryJvXp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8802C2BD5B9;
	Fri,  7 Nov 2025 16:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762532759; cv=none; b=X7F01TkJutZ/nRpPEqeAHErqrdMaatQ3YRGA6aAXnbj4iPbC6MLLN/8pYm5dwomNthwL75ModCpXDrgIVBACPQaWt9rdVO2DhQVBMAx59WMCzL0YewBvPj8mKu6zWcI/Mo5D3lmlWTQg5iTw+Z+QaIX6pmB7MvYkCjgMAmAYF5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762532759; c=relaxed/simple;
	bh=7CwFn3glPOx+LEuwLyVNBz8w4VFBGU+ikxsXH3OvEZM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JoCJArT6o3ueY8SENqqbPKZTWWSGaz3syeT1NgV68MFF5sc64jfb2u7ppFcRvtJLWF87C0Ym8N1Q6Xhe01b+k4EKGGwGQN5gT2wrNJ3DzY6XqphKla9tJDVFmRM+pbUjQePh5vbq2EDh6xHh8s9zIAIN20Z6xchCM6zGxUhnc+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=aVryJvXp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A7D0ooh2282023;
	Fri, 7 Nov 2025 16:25:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wejWMBrYU48tLmTyosI5XfDNT011hcTBGXvSUb8Cw9s=; b=aVryJvXpOJJa/lhM
	FLZyG7K9pYzPNeoSnIYGKJAxPPNi5d4pLmQPAHODPsPcvgY7OxFRHrYM4wlukTGu
	PvvC3o6SCrRahEdHo98ntbfCrQyiMkjf9N0fXlxAyTUEY4Sdb5ANASlGyQrhWyMr
	Zq97E1Krv8s6oxauUCXHyEY06fIn0RuNWffJP7WEkxWQruoSdAh438tETKj8zNZe
	Kt51GkBYnofaMcjLHmoMeaaZApyARyEJOJB+JOFaO6aBUG6HyCPz+1DL5sQs+MQo
	CnRAh6m8t7FADWghEbGcKBfea/dyrvqu/uvf6M77lPvBXc7vS9XJV3sojtFMiYvr
	M2Z90A==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a9a9shv6g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Nov 2025 16:25:47 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5A7GPkQV024442
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 7 Nov 2025 16:25:46 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Fri, 7 Nov 2025 08:25:40 -0800
From: Vikram Sharma <quic_vikramsa@quicinc.com>
To: <bryan.odonoghue@linaro.org>, <mchehab@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <cros-qcom-dts-watchers@chromium.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <quic_svankada@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_nihalkum@quicinc.com>, <quic_vikramsa@quicinc.com>,
        <stable@vger.kernel.org>
Subject: [PATCH v6 1/2] dt-bindings: media: qcom,qcs8300-camss: Add missing power supplies
Date: Fri, 7 Nov 2025 21:55:20 +0530
Message-ID: <20251107162521.511536-2-quic_vikramsa@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251107162521.511536-1-quic_vikramsa@quicinc.com>
References: <20251107162521.511536-1-quic_vikramsa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=CdgFJbrl c=1 sm=1 tr=0 ts=690e1d8b cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=Cg3GaYijB682ADaUwpUA:9
 a=TjNXssC_j7lpFel5tvFf:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDEzNSBTYWx0ZWRfX7KWhvaCkoG4G
 pBJLSRAY7dkbwytqYYt3GE8mwh+t8BGoUk94SOc+mkVH+XpWIyYK/S5ekiYLtdEYIo+gGCOpbNS
 WSO4xY8ZsnIwDGWzrU2dk35iI+H5Cd4kkVGYmBrN1A7HY9lPne24T7YLzBQodrIfxBWHGmrS/Vj
 CmBK8PAyLfTJhc9DefE0/KZCdUWqlCe0KkhPE+aZQKchbmWJ1aQV2UZUFHrEbV3505OB03SDt7L
 n3TvSWzvPf4GagS6ZW2xEBupWCSfBMcPDOsqmn7iHZfs7eaDcnSTurCH0w06r06rC2RELgFdiw+
 XXkp16fjL9K2oM0qdyJ4oPDGOR8XCvPwbIoiIxT3Y1e31MDv5PfheiZ7sHI2EkRvPARKpf9w58o
 8M51hnpG3WtGRcVRCofqieLyjFSz+Q==
X-Proofpoint-ORIG-GUID: 6tor7pudIUAbELG53kSioz-X6DKPGxdE
X-Proofpoint-GUID: 6tor7pudIUAbELG53kSioz-X6DKPGxdE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-07_04,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511070135

Add missing vdda-phy-supply and vdda-pll-supply in the (monaco)qcs8300
camss binding. While enabling imx412 sensor for qcs8300 we see a need
to add these supplies which were missing in initial submission.

Fixes: 634a2958fae30 ("media: dt-bindings: Add qcom,qcs8300-camss compatible")
Cc: <stable@vger.kernel.org>
Co-developed-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
Signed-off-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
---
 .../bindings/media/qcom,qcs8300-camss.yaml          | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,qcs8300-camss.yaml b/Documentation/devicetree/bindings/media/qcom,qcs8300-camss.yaml
index 80a4540a22dc..e5f170aa4d9e 100644
--- a/Documentation/devicetree/bindings/media/qcom,qcs8300-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,qcs8300-camss.yaml
@@ -120,6 +120,14 @@ properties:
     items:
       - const: top
 
+  vdda-phy-supply:
+    description:
+      Phandle to a 0.88V regulator supply to CSI PHYs.
+
+  vdda-pll-supply:
+    description:
+      Phandle to 1.2V regulator supply to CSI PHYs pll block.
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
@@ -160,6 +168,8 @@ required:
   - power-domains
   - power-domain-names
   - ports
+  - vdda-phy-supply
+  - vdda-pll-supply
 
 additionalProperties: false
 
@@ -328,6 +338,9 @@ examples:
             power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
             power-domain-names = "top";
 
+            vdda-phy-supply = <&vreg_l4a_0p88>;
+            vdda-pll-supply = <&vreg_l1c_1p2>;
+
             ports {
                 #address-cells = <1>;
                 #size-cells = <0>;
-- 
2.34.1


