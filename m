Return-Path: <linux-arm-msm+bounces-67311-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1466CB17E79
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 10:46:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD39D6249B2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 08:46:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55AEC221FC8;
	Fri,  1 Aug 2025 08:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Pb+52nQu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A8D21FF3F;
	Fri,  1 Aug 2025 08:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754037941; cv=none; b=tgpixZTvua2v0ieH3m34G9O4DBzQ2oaF/t21T5B0BFMshy0Ka/lFQ/RZWb+dvhi1bUBudlFGJ9A9HQHhqhpU07DABrRTsDZ2m0XCiGIkNAuUpJGieijEU2L00zh2T4xcSW/lkGqQHk2rgegVMa+yMthPXcdrKCwRZKgENJLiq8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754037941; c=relaxed/simple;
	bh=PmqxtXEZigyuVD0N/kVpV0knztc0McTWg70S3aEjSgs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=elXzRyUgleDOotKHbm8PB9SSXBkxVEjYeF//OTeInoZf+cFgwguOmZKczsZ2aXO8O9ZYO1tRvfT4r5S6sSDDek10sayJvwY9BB6Rthp0eqE6KOARq0pucUggRJf74hnfTadNl0omCsBhooCCgAdi5NC7JlxgbJ/i1Bbm/emhbkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Pb+52nQu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5710bFcc006838;
	Fri, 1 Aug 2025 08:45:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ModDe4r97lA
	BsBjzkVNIZyq2KXGiUgO13GI0A1G32s8=; b=Pb+52nQujROVrzKEdlW2UkGjaEc
	pM0P6ikquXhqvDxnDkKEgXj7v6BWy5mOmHwgFrq6It3CPelutDyqFIytPCGb4YpW
	8I0cgxFu8JX2BCJkR/DEFIbC9Zx6rPTbypER2ohTPV1UTyUtAL4GT/i625g7SbFH
	ANaTprcacMd3vQOAx14meZNSBohyBAnEIk7ZAHjqNm92Z9ELZnl/ulXMY2tiylDV
	PoKqGbRVS3whr4lTKq5JIOr/VMMpkBiJ+z+wTdp6CV4PDd0xDkdzH+kEBvpDzutT
	VcMhuf7TImUReUp+Vb4V81fT6QFSxnGAy6Ye2JGCsJw/U7BlwIZuQkOIawA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484pm2tyg1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Aug 2025 08:45:34 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5718jVmw016915;
	Fri, 1 Aug 2025 08:45:31 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4859bemgsm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Aug 2025 08:45:31 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5718jUUn016909;
	Fri, 1 Aug 2025 08:45:30 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-sartgarg-hyd.qualcomm.com [10.147.242.251])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 5718jUHt016908
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Aug 2025 08:45:30 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 2339771)
	id AB1C15CA; Fri,  1 Aug 2025 14:15:29 +0530 (+0530)
From: Sarthak Garg <quic_sartgarg@quicinc.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        quic_cang@quicinc.com, quic_nguyenb@quicinc.com,
        quic_rampraka@quicinc.com, quic_pragalla@quicinc.com,
        quic_sayalil@quicinc.com, quic_nitirawa@quicinc.com,
        quic_bhaskarv@quicinc.com, kernel@oss.qualcomm.com,
        Sarthak Garg <quic_sartgarg@quicinc.com>
Subject: [PATCH V4 2/4] dt-bindings: mmc: controller: Add max-sd-hs-frequency property
Date: Fri,  1 Aug 2025 14:15:16 +0530
Message-Id: <20250801084518.2259767-3-quic_sartgarg@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250801084518.2259767-1-quic_sartgarg@quicinc.com>
References: <20250801084518.2259767-1-quic_sartgarg@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: GArhJZL2ZIJpqEnSKU5XvFfSWuiqst_0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDA2MiBTYWx0ZWRfX8+p0xBkZ7vYN
 yrGLA+/6ML8N0MFeOe8ibV1cTTSOAN+TawaEbJgmBPPoc6ZhmIgveBJp/1uflm5+Y+AwRGdAaNY
 GmbdHkt6rVvlwaxx0UheVyTKj1WqJJZSTCNxdEEPbuWzjYv27LnyhsGPobx/T8oC6zJcnid5dcU
 3qs5KbFifWALP2VqKzonNyeGtnxcTeYZ99tse66SPZKCTBpET5r1j4D3iJXPoQ1phCiUZyU6NEw
 00HJeemPFXhWNt5+riAlKRC6Vsoi2tFyAb8MK0TvUnRIjs5db7OlgQ/mILQaztZgeHCg4o38A3l
 +CroSLZW0xye/ifWXpHrQkGzOA30JdwyvO4lFHMT9a9eoeYXQXim3epTSG51ZFQ5N8lJYTeU+wR
 qtzjbhitk8l0IVP3tlxe0JY0sgSPuOrbBh2ZNRV4sBxPJd9J/jTIoYHeJUmqaCn/MrJf9Wha
X-Authority-Analysis: v=2.4 cv=HfYUTjE8 c=1 sm=1 tr=0 ts=688c7eae cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=Xv05fe2E4YnGG6AOwTMA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: GArhJZL2ZIJpqEnSKU5XvFfSWuiqst_0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_02,2025-07-31_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=999 phishscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508010062

Some platforms may require limiting the maximum frequency used in SD
High-Speed (HS) mode due to board-level hardware constraints. For
example, certain boards may include level shifters or other components
that cannot reliably operate at the default 50 MHz HS frequency.

Introduce a new optional device tree property max-sd-hs-frequency to
limit the maximum frequency (in Hz) used for SD cards operating in
High-Speed (HS) mode.

Signed-off-by: Sarthak Garg <quic_sartgarg@quicinc.com>
---
 .../devicetree/bindings/mmc/mmc-controller-common.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml b/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
index 9a7235439759..6c2529b976d1 100644
--- a/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
+++ b/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
@@ -93,6 +93,16 @@ properties:
     minimum: 400000
     maximum: 384000000
 
+  max-sd-hs-frequency:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      Maximum frequency (in Hz) to be used for SD cards operating in
+      High-Speed (HS) mode. This is useful for board-specific limitations,
+      such as level shifters or others where the card cannot reliably
+      operate at the default 50 MHz HS frequency.
+    minimum: 400000
+    maximum: 50000000
+
   disable-wp:
     $ref: /schemas/types.yaml#/definitions/flag
     description:
-- 
2.34.1


