Return-Path: <linux-arm-msm+bounces-59868-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1367AAC8AC8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 May 2025 11:30:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 441243B53C0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 May 2025 09:30:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85556227EBF;
	Fri, 30 May 2025 09:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JI4W7V0d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5CE4220F5F;
	Fri, 30 May 2025 09:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748597353; cv=none; b=saIw2g9dJrnpW8xIG6vLP+3oDEMh3Da8Ij2djEY8Nk/H/JtTzlfLvBa/Q2C7GBUOAopT48DewrkX0aOYAiG46WOoof9JC+6kVssioRi1RD+vNCaF4/LRTvZBtIQKdvSxE+ywfV3wCCgKyKZQtwdbzAdvTsIzRscHxiu5Wu0TLiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748597353; c=relaxed/simple;
	bh=StvqrR/KMPt4u0QVmgVVABaEWr7rgSio0K+BjrS71pw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ys6tGBCZhiknpug4DozYFS4kdviVgZFrBIXrzcjut8ZHQ3ttUq0jVu+GxNzHP7dShV+44FEwrj5kSRwfCTljm1N7yrRfxKpYaHVo67UZxznGTb2IlIdtH5Klan1cvC3ApSTiZ1JpjG7R2nesZh6tLA8McfZxkPfrHcDbTSl87Cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JI4W7V0d; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54U0d4PV009479;
	Fri, 30 May 2025 09:28:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=T+ZaYlXkMV/
	3zAis8DcjNCqUTkV9KdxdODhGIpNgDIY=; b=JI4W7V0dq7z4HsBcDb+jVQwOqYf
	Gqef7hnnzE6XABix7OFwgIEnxHzU4HdcZ68SsZwNKMVGVBAe3byHgMCmGlJKnO+B
	Frchun5KHkMws325J45IL9wwPzgN9Pi7kmuyyFeulZAhHWjQVcFevAFF1kjdhVgr
	TUbDTdjxNr3MDDHWoHdT8OzzqAQmFaasCq9SIZc1AnmoWzbcS2K2xcHP24BgwWTF
	mPWTr4rJoPHi7kfMPxEK1g9trym5aK3sRBgnIqy4NgxHiUrYSIqbNNDSevClNR7j
	l8QpEMB0rGOwX2fEM7xYv2N3SqScLjaYypWYvdDPfPjdVWDu0m/BCsc8bnQ==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46w691k4g7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 May 2025 09:28:57 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 54U9SqEX008747;
	Fri, 30 May 2025 09:28:52 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 46u76my9gp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 May 2025 09:28:52 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 54U9Sqo8008721;
	Fri, 30 May 2025 09:28:52 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-wasimn-hyd.qualcomm.com [10.147.246.180])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 54U9SqFN008717
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 May 2025 09:28:52 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3944840)
	id 2A5154FD; Fri, 30 May 2025 14:58:51 +0530 (+0530)
From: Wasim Nazir <quic_wasimn@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@quicinc.com,
        kernel@oss.qualcomm.com, Wasim Nazir <quic_wasimn@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v9 1/4] dt-bindings: arm: qcom: Add bindings for QCS9075 SOC based board
Date: Fri, 30 May 2025 14:58:44 +0530
Message-ID: <20250530092850.631831-2-quic_wasimn@quicinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250530092850.631831-1-quic_wasimn@quicinc.com>
References: <20250530092850.631831-1-quic_wasimn@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=WfoMa1hX c=1 sm=1 tr=0 ts=68397a59 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=htuHtO1j-8kfaUu6lmQA:9 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: tRktHrlRX-mi8vYazSvXgQtyClRUc-Br
X-Proofpoint-ORIG-GUID: tRktHrlRX-mi8vYazSvXgQtyClRUc-Br
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDA4MSBTYWx0ZWRfX6g0dZKVeEU/x
 YhVzovQy1Tb+feGR4hVvJhA9UiO390W0bf/ORrspsgZfk2MfIA18cznsjZ1YJ2tYcxX/69hzoyW
 P8XZZnHZTUioUygRBKT/DSivCJ36Gi9GIGL51F/kZxM8uz5PZ4GFGbCH7JY7SUhyVPzRtZSwrv8
 6KfneMRLtff3GC4p3+4hEeKXy1pyleLQ+lbkNuzb/rJn/e9Y6jKKJEHOSO29zNYz4e3gKslyDc3
 gpOZyZB8pq6eAbj4XUv5AX1bMaDP3xmpPGM49X/rRE8YwZs8ipqp10P05+MO0yiX0pZWhHo9kL0
 RF/wjdSUeJ4wGLVSF81WMCMj5+SJHNTkyFYK5k52VzaLuBKQkJpCSaKN6gY6tUI3nGr9vtRxHaV
 paBp7qlYsDZy2iar0xZHUtPFBGjaxi0kEYeKecoQYgBFdORwGBXqROLHdXjX7EyJgnwyFn1Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_04,2025-05-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 mlxlogscore=999 priorityscore=1501 mlxscore=0
 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0 malwarescore=0
 clxscore=1011 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505300081

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


