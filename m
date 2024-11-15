Return-Path: <linux-arm-msm+bounces-38096-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A07619CFA62
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2024 23:52:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5876A1F21E31
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2024 22:52:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A9331922E1;
	Fri, 15 Nov 2024 22:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="M7CQS9BM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4BB51917D6;
	Fri, 15 Nov 2024 22:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731711126; cv=none; b=gnvnT8L/xEKdaFZhg959BNhdLKSDuwkUKDUmz+ecRVH86kwiMsmPSWccFsn9OvFYIxgEiZhq8u4WdzIMZ1+fLYqmKQUN9T0qfViiTGu96TevolEGz/yucxv8pYPaAaxryaUWu/ROqO5yzkfNfhGTy/YCdz8rtubk/jV3KLxH21E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731711126; c=relaxed/simple;
	bh=dIRyxvhNkbd2lD2R6h3Ji91/8hSiny+q3wQ3SxiaEVk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C5WsYqkVql+IerlWvWluOVTWpmIYwN1DodX2C1hGmbwssjNU8zvkpxNADlQdTnlNjAAe3D7ffEbeG0PzWd20QDjZljkEL3GL8lPeNo05A3ijK7iJtWJqgGiemDnspiTdMkrOGdfBVJztn9QcAw5l2oY4rOvr3hN7e9S8tymtOWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=M7CQS9BM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AFBT1Pk017631;
	Fri, 15 Nov 2024 22:52:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=QHfX2QH680j
	EoMnqVF8LZ5BBimFCThoz3KmzaH+/VRs=; b=M7CQS9BMYpd3BtRRXyQ0DGzXV3m
	baQiSnmnGYeYkRSjS31LbJqxWYBYB2pa7JhFijGATCoQHdsxUWBE/0HO7U8X8ImB
	Jb6YPw0R96JacWumrfsxsicV8dmndOozHNDNcc+bymMy4w/hEGrJqvIm77VuWrbW
	Oz2vOcdJl/6BINsAMa8VgX1M4vvphB9rjDuJqxdqXsTw89by/ygvHzSpgF2SCfHb
	EGNoTD7GkA1tMSd+iS2Hxr7sybP6EhbOT1KM/+c60iYNy/DQnGvyjZ6eJEfr5SQs
	p/BCxYJW8PowNPwWKObIj6hERUPe/7Yaq+AUMzCi2+w2jMuCOqkkwlGi2Tg==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42wvw2k5n8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Nov 2024 22:52:00 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 4AFMpvkP020279;
	Fri, 15 Nov 2024 22:51:57 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 42t0tn65dg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Nov 2024 22:51:57 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4AFMpuox020254;
	Fri, 15 Nov 2024 22:51:57 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-wasimn-hyd.qualcomm.com [10.147.246.180])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4AFMpu2F020247
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Nov 2024 22:51:56 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3944840)
	id D8E7F5A7; Sat, 16 Nov 2024 04:21:55 +0530 (+0530)
From: Wasim Nazir <quic_wasimn@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@quicinc.com,
        Wasim Nazir <quic_wasimn@quicinc.com>
Subject: [PATCH v2 3/5] dt-bindings: arm: qcom: Document rb8/ride/ride-r3 on QCS9075
Date: Sat, 16 Nov 2024 04:21:50 +0530
Message-ID: <20241115225152.3264396-4-quic_wasimn@quicinc.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241115225152.3264396-1-quic_wasimn@quicinc.com>
References: <20241115225152.3264396-1-quic_wasimn@quicinc.com>
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
X-Proofpoint-ORIG-GUID: C8-eoY-jKwXRCYwVnVbgjl8eLldgQzC4
X-Proofpoint-GUID: C8-eoY-jKwXRCYwVnVbgjl8eLldgQzC4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 malwarescore=0 adultscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 mlxscore=0 phishscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411150192

qcs9075 rb8, ride & ride-r3 boards are based on QCS9075 SoC.

QCS9075 is compatible IoT-industrial grade variant of SA8775p SoC
without safety monitorng feature of SAfety-IsLand subsystem.
This subsystem continues to supports other features like built-in
self-test, error-detection, reset-handling, etc.

Signed-off-by: Wasim Nazir <quic_wasimn@quicinc.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 7c8c3a97506a..de5cf9fb28ae 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -46,6 +46,7 @@ description: |
         qcs8550
         qcm2290
         qcm6490
+        qcs9075
         qcs9100
         qdu1000
         qrb2210
@@ -928,6 +929,14 @@ properties:
               - qcom,sa8775p-ride-r3
           - const: qcom,sa8775p

+      - items:
+          - enum:
+              - qcom,qcs9075-rb8
+              - qcom,qcs9075-ride
+              - qcom,qcs9075-ride-r3
+          - const: qcom,qcs9075
+          - const: qcom,sa8775p
+
       - items:
           - enum:
               - qcom,qcs9100-ride
--
2.47.0


