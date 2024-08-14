Return-Path: <linux-arm-msm+bounces-28456-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A616B951586
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 09:29:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5FAA11F2831A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 07:29:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 165E813D635;
	Wed, 14 Aug 2024 07:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HUisjCY1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B49713D51E;
	Wed, 14 Aug 2024 07:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723620521; cv=none; b=GDww+kpmYIuL7P+498fXwwjLiN1KTgrx1chj1Dbx4jfGnG4xNP68DaP68ZzpM+RXwZgWdSObqeErbutjglJp8UFSQ418EBjqpdKHJ+kAlQQkpZSJo2Rmu6xZjy/yGa6G+uMy9iCjGoAOTIxAjHQqMki5qdEpN98kikKhXm4m2Xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723620521; c=relaxed/simple;
	bh=YDSnzxhBXO5WjVXbrO4QKFVkLDBLDEb3W2FsYi0afq8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BoDYnvd7tGVhobe7D/CWFIevA6MJyzB6or86QhtFooA19d1nWwzCiUmrS9vt2WBh4lS6kG1h/MpD3Nfooc+4X7GN9R8g45/71lpUzWR29wKXRqmMQbT0OCMqcOI1rBL7Fc0+IrBNCPapJCwP7W9/jXodezh4XMk7b8DyoLLrI7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=HUisjCY1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47DNAUh3026141;
	Wed, 14 Aug 2024 07:28:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Rxhu+LNKykDQep3hlwz7tnW5aDEfsGyZ089N0Sxe+Ic=; b=HUisjCY1grQ9xFVi
	DSqbY8tcohxFPZuzGLOalzmsjzJzKT36kzCBCU80uDNcCRdva+y1uBuknaFrAzCS
	Or7fSt6gcETsqWmKXC91rADM7px3F71DUVyNuY5WV6Bmo0SJSImABHk82BGZltJP
	mOGKudjuE9hDb0lYRVP9xWRREissO8T+nzUqBlMcKF219YAl41ZzECVcaJeEwJ1s
	MrI408HfManCkvMKKknp5IKnw64k9idMOZ0EFwqG8D7ZC9AtQ7qghXyGs+m/Sh1t
	TmnhTIHTqlSo8piv5MSfYn0LNK3DpWn/S9NhH1OJSQTLlOTDPmFjolYnib7hHEw2
	BE5h2Q==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40x18y2cqg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Aug 2024 07:28:34 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47E7SXHX030706
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Aug 2024 07:28:33 GMT
Received: from jingyw-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 14 Aug 2024 00:28:30 -0700
From: Jingyi Wang <quic_jingyw@quicinc.com>
To: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <quic_tingweiz@quicinc.com>, <quic_aiquny@quicinc.com>,
        <quic_tengfan@quicinc.com>
CC: <quic_jingyw@quicinc.com>
Subject: [PATCH 1/3] dt-bindings: arm: qcom: document QCS8275/QCS8300 SoC and reference board
Date: Wed, 14 Aug 2024 15:28:04 +0800
Message-ID: <20240814072806.4107079-2-quic_jingyw@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240814072806.4107079-1-quic_jingyw@quicinc.com>
References: <20240814072806.4107079-1-quic_jingyw@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: SkPVDKkiR8-nd16OYfjir_r-gQM8gDLB
X-Proofpoint-ORIG-GUID: SkPVDKkiR8-nd16OYfjir_r-gQM8gDLB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-14_04,2024-08-13_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 suspectscore=0 phishscore=0 malwarescore=0 mlxscore=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408140051

Document the QCS8275/QCS8300 SoC and its reference board QCS8300 RIDE.
QCS8300 is an Industrial Safe SoC, while QCS8275 is the Industrial
Non-Safe version which can share the same SoC dtsi and board DTS.

Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index f08e13b61172..3952e1579767 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -42,6 +42,8 @@ description: |
         msm8996
         msm8998
         qcs404
+        qcs8275
+        qcs8300
         qcs8550
         qcm2290
         qcm6490
@@ -884,6 +886,12 @@ properties:
           - const: qcom,qcs404-evb
           - const: qcom,qcs404
 
+      - items:
+          - enum:
+              - qcom,qcs8300-ride
+          - const: qcom,qcs8275
+          - const: qcom,qcs8300
+
       - items:
           - enum:
               - qcom,sa8155p-adp
-- 
2.25.1


