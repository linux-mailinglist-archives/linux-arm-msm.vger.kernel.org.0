Return-Path: <linux-arm-msm+bounces-35366-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7EB9A9D7F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 10:55:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0FA95282FAC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 08:55:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 020EC18BBA9;
	Tue, 22 Oct 2024 08:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QTr7SVoo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C293187864;
	Tue, 22 Oct 2024 08:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729587308; cv=none; b=p1JvqbEymqpDoM0fk6ddJ+xglPr6jQS48Hs7NNFK4h4ZHnTGy/zjUopfJi+r+q3hb+qYBV/LGyjaEnn8dqdVN5vSWnyC3o797yRZUim43XQ/04GNR6WIiCqyNtGlyws5b4K9JbjWQuzuHzbQeBGfqZcVtOHqVtiuN5YLtgcHKkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729587308; c=relaxed/simple;
	bh=rj6QhY4DLgM5UrhaZNflw9q9xvFv1O5ClkmbkY9/mZg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Zog4/w/dxB/qQFhpxy//Pqyp+OO0e9nOm0NUymzMLMmyDzueN0kst8pzP9HIOvwDpFb/FV2wuVg+ksWpfspMthj/ccPKZzSqx5FR+BMKSaBgDVVUQntdLxGD50eRj7sSZ7DiuhPJ500KH7kEHoeLnm2KAtZPa2Qal4h9BBHKpKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QTr7SVoo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49M8c159025234;
	Tue, 22 Oct 2024 08:54:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WFlQW94zwagu/U0D8mN+kC/ZUkxOsNscwbLWBDsbVZs=; b=QTr7SVoocRBS9gmn
	3gFQG6IS41DctyLAx4YyHM4HobaVRmx+IroAM9VSyY8DiDaizIaR01ZixnDJFYnI
	kPyJq9TJmHHvfxBNqZaI1BXOmwWIK0VcIonAsruk1JQ574AtYgT9eeiX5QTlAC3U
	Xys8UFZdnifTD72eEHp55ctisfrNt7YAJ13ovHyci+WFueAGDVL0UfbmUMVxGdpP
	yBvOGpodkzBkIj3lY9lqY0TIj3C71TGPoIkwHPBFeU+ooKrgFqKv5G7DT5D3+LUl
	VsOnV9NjUZsRcukXyL7cI8hJ+9ZzvM2K3fPvDtm1+RNiMyeU2YTPzTd5kawR3NC8
	skf1MA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42c6vc7pgu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Oct 2024 08:54:55 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49M8str4001830
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Oct 2024 08:54:55 GMT
Received: from lijuang2-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 22 Oct 2024 01:54:49 -0700
From: Lijuan Gao <quic_lijuang@quicinc.com>
Date: Tue, 22 Oct 2024 16:54:29 +0800
Subject: [PATCH v4 1/7] dt-bindings: arm: qcom: document QCS615 and the
 reference board
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241022-add_initial_support_for_qcs615-v4-1-0a551c6dd342@quicinc.com>
References: <20241022-add_initial_support_for_qcs615-v4-0-0a551c6dd342@quicinc.com>
In-Reply-To: <20241022-add_initial_support_for_qcs615-v4-0-0a551c6dd342@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thomas Gleixner
	<tglx@linutronix.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon
	<will@kernel.org>
CC: <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Lijuan Gao
	<quic_lijuang@quicinc.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729587284; l=1010;
 i=quic_lijuang@quicinc.com; s=20240827; h=from:subject:message-id;
 bh=rj6QhY4DLgM5UrhaZNflw9q9xvFv1O5ClkmbkY9/mZg=;
 b=1UnjV7HrH17VGVzlaXLeRlEaLOcQMYKsKxcVt9JhFDaeUhcl+Vk0zcNcgG+lGqjMYDbLNsh2h
 uuuz60xWEfRBrbgQ38d/raSyUmvJemZkaIwEhB2WKxgkM9/B6FyuF7+
X-Developer-Key: i=quic_lijuang@quicinc.com; a=ed25519;
 pk=1zeM8FpQK/J1jSFHn8iXHeb3xt7F/3GvHv7ET2RNJxE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: zJNb8xj14bimTv1N121F0IarCciA2Rjl
X-Proofpoint-ORIG-GUID: zJNb8xj14bimTv1N121F0IarCciA2Rjl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 suspectscore=0
 spamscore=0 phishscore=0 bulkscore=0 mlxscore=0 adultscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410220057

Document the QCS615 SoC and its reference board QCS615 RIDE.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 0d451082570e..74316c6af300 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -42,6 +42,7 @@ description: |
         msm8996
         msm8998
         qcs404
+        qcs615
         qcs8550
         qcm2290
         qcm6490
@@ -896,6 +897,11 @@ properties:
           - const: qcom,qcs404-evb
           - const: qcom,qcs404
 
+      - items:
+          - enum:
+              - qcom,qcs615-ride
+          - const: qcom,qcs615
+
       - items:
           - enum:
               - qcom,sa8155p-adp

-- 
2.46.0


