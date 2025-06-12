Return-Path: <linux-arm-msm+bounces-61160-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 19048AD7EFE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 01:39:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E2B1A1897D0D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 23:39:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F21282DFA39;
	Thu, 12 Jun 2025 23:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ZPFW1kH5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 698AC2C327B;
	Thu, 12 Jun 2025 23:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749771535; cv=none; b=TnjYhL8Rq0FY8pXUqB0M4TK/a0NMd4x9TMTnVwguke1HZTpd18mbnp0B5KE/MXZZowrrEeh1yF+UDdiUe9G34zCiI1wvMN6KNJrx1jBR2qLKZWVkSntYwOOWsyijOc9792gWjqBETHqQAKkjLzMGfFPQV1SIPPOswJ8D/7wbJ3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749771535; c=relaxed/simple;
	bh=StvqrR/KMPt4u0QVmgVVABaEWr7rgSio0K+BjrS71pw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LeWWxy4wPgvGSctnv0UryZwQfd/WGuhOj7tfKZijFSPstFkbsV7mEw52f/EpB3IFiIWOivTT+J2nl8ZdRu9s84yQSQa38C1VSox2XNMowqjJ+06C5jeUzXimim4VcxCwzPNKN8xkMI0pJriIv88KYXxEzHjp9kPam/LevZjgq2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ZPFW1kH5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55CGg1ml026638;
	Thu, 12 Jun 2025 23:38:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=T+ZaYlXkMV/
	3zAis8DcjNCqUTkV9KdxdODhGIpNgDIY=; b=ZPFW1kH52DIbMeUFTDInWWga6wg
	AgW7V6I/DVG4aJptQVzwk43d/bNwbRfIT0bKGhr+roieMl5IRloGcCB16PRKHRtO
	pb3wp2WOvlmtEzLIMjrRJFTY2dzYIr3PeggqzAdx8Uysc+IPy0CuOG3V6K2NshEB
	UlAZUQZ8PDstGpFGDJ89CAm+HFSVbnMzgcQNW8L24vXRO26rVq8wIECKzPFIr2yD
	ssc6z5KG/YxFsOpGWD6U7c7MTfx7p4ET5MSmG0/y8lJ/zOBLvN3mdq9p62urSsPm
	A/YU1ffIV4WHWdap/Ng606P9IMm42MHrqjQhKldrP6pKPxML7N9qZ/H/9cg==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 475v2ycyce-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Jun 2025 23:38:50 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 55CNcQ4A017023;
	Thu, 12 Jun 2025 23:38:26 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 474egnstc7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Jun 2025 23:38:26 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 55CNcPhG016971;
	Thu, 12 Jun 2025 23:38:25 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-wasimn-hyd.qualcomm.com [10.147.246.180])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 55CNcPLb016962
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Jun 2025 23:38:25 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3944840)
	id B2C304D9; Thu, 12 Jun 2025 21:24:53 +0530 (+0530)
From: Wasim Nazir <quic_wasimn@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@quicinc.com,
        kernel@oss.qualcomm.com, Wasim Nazir <quic_wasimn@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v10 1/3] dt-bindings: arm: qcom: Add bindings for QCS9075 SOC based board
Date: Thu, 12 Jun 2025 21:24:32 +0530
Message-ID: <20250612155437.146925-2-quic_wasimn@quicinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250612155437.146925-1-quic_wasimn@quicinc.com>
References: <20250612155437.146925-1-quic_wasimn@quicinc.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEyMDE4MiBTYWx0ZWRfX9h8gPvnKmG12
 XqrJ6/0P7l+r6ctb5+upl+R9fkUot7qJTtVI+DRUh5lS4Kj5p9VD/Uyf1+HaQgwcdjUe6RQEo+w
 9K54t/zjhH6HP51YpZZmu2ZxgrqaVA18ldZp605dw3XLgi/061wX/QhWX7QZbyeqR2/oi/cXyu9
 HLI3OuFuBPCpTX5rC1MhPTjJjBcufa7gl93xad6n3BZaLPrmt5kKpaOeW1dMgLLPfE1gmaqqxiD
 JkV/4xZlZEXRQWSDpf5fGsLzWZU8+AcbQIUgffjM9Bhe/rDbYxMMeZkSvxnmxKGPnlsEgEi7I1+
 e+ZxP75VdlEhBuYjXvmWnS8Q92cTbURShX86Jf0I7SQPgalfQITmhFa0df5cLG5qYeKRRtPmB0S
 qWA2rZ+mAjrXHCyAXgk9AHpeOB2SysPIiyWj7MNEPVLA7KkFb6L8UTgrU/FozinOkZ4+sY8Q
X-Proofpoint-GUID: Y1LxDVjdHvLjCnIWrJ8QY9b0ap8KEp0W
X-Proofpoint-ORIG-GUID: Y1LxDVjdHvLjCnIWrJ8QY9b0ap8KEp0W
X-Authority-Analysis: v=2.4 cv=f+BIBPyM c=1 sm=1 tr=0 ts=684b650a cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=htuHtO1j-8kfaUu6lmQA:9 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_10,2025-06-12_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 mlxlogscore=999 bulkscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 phishscore=0 mlxscore=0
 malwarescore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506120182

QCS9075 is compatible Industrial-IOT grade variant of SA8775p SOC.
Unlike QCS9100, it doesn't have safety monitoring feature of
Safety-Island(SAIL) subsystem, which affects thermal management.

qcs9075-iq-9075-evk board is based on QCS9075 SOC.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Wasim Nazir <quic_wasimn@quicinc.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 56f78f0f3803..3b2c60af12cd 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -58,6 +58,7 @@ description: |
         qcs8550
         qcm2290
         qcm6490
+        qcs9075
         qcs9100
         qdu1000
         qrb2210
@@ -961,6 +962,12 @@ properties:
               - qcom,sa8775p-ride-r3
           - const: qcom,sa8775p

+      - items:
+          - enum:
+              - qcom,qcs9075-iq-9075-evk
+          - const: qcom,qcs9075
+          - const: qcom,sa8775p
+
       - items:
           - enum:
               - qcom,qcs9100-ride
--
2.49.0


