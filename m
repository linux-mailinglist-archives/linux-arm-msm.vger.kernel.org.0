Return-Path: <linux-arm-msm+bounces-77038-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BCAFBD3F36
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 17:14:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 37D673E4530
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 15:02:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5523B30F92E;
	Mon, 13 Oct 2025 14:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bsk8GZ9c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D689530F7EA;
	Mon, 13 Oct 2025 14:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760367216; cv=none; b=GUlKM6g5Gq/lFCPuLwqs/6VCAvwWUyA0N09/Zh9RaU9mPVI0MSe4zTBMCs6eOmPwkPO1/lz2p2FJ2hkmgNcRs/PIBYXSIkz+SAAOVa8QFa0yQBDuxD2GKzy4uOrxV8MX7e4CdSEeNsakbMg50j2oSF/Zj2cnFoP9iucXjP4YoMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760367216; c=relaxed/simple;
	bh=I5TKDag4w+iwVgXwmehp7o34kTQqdlAdeTrbFswVIew=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=d/UhPjATXeIwbBi2xZKDIDJzeFQuX/M3CrSDlTOsvFG9dbyya+FU9N1XrqECvQLLNBFT2TFrs+BLzywjjencMWQePNIWZlja2YberNJZE/KHSJYnj/CpwsLQpZBYRwLK9PI6s9VrsMdhBYf2w+d4M4Cjo06UxW5AYoo30LvMVIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=bsk8GZ9c; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59DAtp5V031249;
	Mon, 13 Oct 2025 14:53:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=9CQOpLcmmRX
	xCyH0vZT0QBHB0wRI6SDP5XKnkvPE4AM=; b=bsk8GZ9ceTD/9WXkO/a3EpM39UM
	EPiJZMLDnKp0JHnUI9r2UJbABiZ+Ym8otzTK6gvUqTOdLR5ucUENbWfpiRBtJRR4
	0q4V5XAoezuNT5bkZwXOa9o0vwmECBicikzjwFykw/WWLeGkmIbP0jVcaXUzGZY5
	TGr7h5V8X699LpZhRdGIlEx+Mi8tR7c7S4OF6RnIqVftBFqqHRtoqIoK1TxX0cUv
	w3G4RmecbWfFVLDNzLWGCdANFO+9lRMcEHyYnOktyRWI5K3Ds/Eu1GUIk7JL3Caw
	XWMdX9yvxy6ALl/LrquuwOWwQ3CIFtfnOjRUwKp5YuU6jcDyMKN5h7FLe6g==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qff0n00x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Oct 2025 14:53:29 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 59DErPGI025995;
	Mon, 13 Oct 2025 14:53:25 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 49qgaktje1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Oct 2025 14:53:25 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 59DErPWI025989;
	Mon, 13 Oct 2025 14:53:25 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-rampraka-hyd.qualcomm.com [10.147.247.88])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 59DErOXi025988
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Oct 2025 14:53:24 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 2305851)
	id 8F5E05C8; Mon, 13 Oct 2025 20:23:23 +0530 (+0530)
From: Ram Prakash Gupta <quic_rampraka@quicinc.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, quic_rampraka@quicinc.com,
        quic_pragalla@quicinc.com, quic_sayalil@quicinc.com,
        quic_nitirawa@quicinc.com, quic_bhaskarv@quicinc.com,
        kernel@oss.qualcomm.com, Sachin Gupta <quic_sachgupt@quicinc.com>
Subject: [PATCH v5 1/4] dt-bindings: mmc: Add dll-presets values for HS400 and HS200 modes
Date: Mon, 13 Oct 2025 20:23:13 +0530
Message-Id: <20251013145316.1087274-2-quic_rampraka@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251013145316.1087274-1-quic_rampraka@quicinc.com>
References: <20251013145316.1087274-1-quic_rampraka@quicinc.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfXzrT3s8Uuzw84
 mb/up+IMX23ZjI0Wqio8rZ6m+JFO+xqraWfFmduHfa0uM0dplLtAEpeovd7NEekGkz4dPCtb8NQ
 LBytvdRIah76rGHNjtUuJdw4hjJB92AxzSFOzhqO9pTLF1yhzZPxfQC3BT+Zj8qTsekfjdBI2S2
 1yKxifKZD4AjdTuUgo1YMWIJoe+KsH/v6M15QBojoSe0v+FCtuZsHyj5ZYYpyp7BuoyIcYvdIPK
 LWcA5FItSL2xC3//Ukrj/mApBIin0BrKzcXYGUggN+esz789nsfC7agaR2XA9NabqompH6/oUso
 j04zoggLWlEoLrmOgGYvv8SAlA8Md+0b5fU5J95Jn9P6Wk1bWL4lwNh0FuzSSbdCsfjG3CpXrfM
 Ncl61siKD4lNzv/vovxSIpQ3oonlLg==
X-Proofpoint-GUID: Vn4TL84tn9c4ibEGm_9hp8HfmVn6-VRY
X-Authority-Analysis: v=2.4 cv=PriergM3 c=1 sm=1 tr=0 ts=68ed1269 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=dIe7CuFFE9oM_I0KlkAA:9
 a=TjNXssC_j7lpFel5tvFf:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: Vn4TL84tn9c4ibEGm_9hp8HfmVn6-VRY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018

From: Sachin Gupta <quic_sachgupt@quicinc.com>

Document the 'dll-presets' property for MMC device tree bindings.
The 'dll-presets' property defines the DLL configurations for HS400
and HS200 modes.

QC SoCs can have 0 to 4 SDHCI instances, and each one may need
different tuning.

Signed-off-by: Sachin Gupta <quic_sachgupt@quicinc.com>
Signed-off-by: Ram Prakash Gupta <quic_rampraka@quicinc.com>
---
 Documentation/devicetree/bindings/mmc/sdhci-msm.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
index 594bd174ff21..f7b3b1ced3ce 100644
--- a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
+++ b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
@@ -138,6 +138,11 @@ properties:
     $ref: /schemas/types.yaml#/definitions/uint32
     description: platform specific settings for DLL_CONFIG reg.
 
+  qcom,dll-presets:
+    maxItems: 10
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description: platform specific settings for DLL registers.
+
   iommus:
     minItems: 1
     maxItems: 8
-- 
2.34.1


