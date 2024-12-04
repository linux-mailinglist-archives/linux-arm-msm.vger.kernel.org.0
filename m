Return-Path: <linux-arm-msm+bounces-40413-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B8D9E4886
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 00:18:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 94C651880463
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 23:18:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E4491AFB36;
	Wed,  4 Dec 2024 23:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="eVi0hG7L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B555A19DF66;
	Wed,  4 Dec 2024 23:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733354333; cv=none; b=UlVEqPGXcFBJEsYxx5hRmnCUntFKH8f03Yt6XCULCh317imo1juvXdOqpdWCBPtB9CUTYOHqV7/6eeMSPFUyCGPoqay01d/3NGE/NeVVtzvWCzQZGNr7fsDuh7qwLY8jg3Tdl7kjYp84GscY17w1AJ1uIYi6qhxuz/sa+hArQtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733354333; c=relaxed/simple;
	bh=OwnVuq00vbXFaEYCKtLGG9eyV9YUWd5L//ybktK0jVI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=ZNVLc9548fIFL06+pmR1UwOSQDz/nnh7SP59RmKb1axdUiYNcPQLmbaAqedXIzy3HPdQJDhvQoQP9fW2DDbkJyFUt+U9FXQlPF6IAWg3cy+juHKtsnndstuTcdCRvH/28TM6kEHV56TFDYe5WtB64V1fqVZnMZU7QplbaFzpmJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=eVi0hG7L; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B4DPxB0031997;
	Wed, 4 Dec 2024 23:18:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D2H2hG1pAU7RzK3FQX2d+D2gXB3m/FL6BwlcSfzQBiY=; b=eVi0hG7LxUuLHJ73
	IdmYG9Bt0sjaXebNglufH9YBi0Hoc5m7i67yrePAbQgUDEhvJSCGs9mQiuyxfu7o
	mQ79OD3zlw3YyRUO2ntR9UGoLDHxJNWM/pgvAi9TAnIjG/+LxUaqxyvOduynyzcc
	T4dtm0zpdvWx8VQLKia45YtSE5oAIGp19UV1DMuixQVjlhy1usicIUy/FhSjFJDF
	xjvbx0sSGl66M7y5R5GuEbAfIHbVUWrNyaCxDA6vVrwEr8zvBqklgDa73niKWgDn
	czN/u6SWC2hYm2LJBqI1I7gZ7eOiz6FX4vJgsnKSi2xiHJkDb+4gCIYihHyTpt02
	7dlaRA==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43a3favmfk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Dec 2024 23:18:43 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B4NIgov014835
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 4 Dec 2024 23:18:42 GMT
Received: from hu-molvera-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 4 Dec 2024 15:18:42 -0800
From: Melody Olvera <quic_molvera@quicinc.com>
Date: Wed, 4 Dec 2024 15:18:01 -0800
Subject: [PATCH v3 1/7] dt-bindings: arm: qcom: Document SM8750 SoC and
 boards
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241204-sm8750_master_dt-v3-1-4d5a8269950b@quicinc.com>
References: <20241204-sm8750_master_dt-v3-0-4d5a8269950b@quicinc.com>
In-Reply-To: <20241204-sm8750_master_dt-v3-0-4d5a8269950b@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        "Satya Durga
 Srinivasu Prabhala" <quic_satyap@quicinc.com>,
        Trilok Soni
	<quic_tsoni@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733354321; l=1091;
 i=quic_molvera@quicinc.com; s=20241204; h=from:subject:message-id;
 bh=OwnVuq00vbXFaEYCKtLGG9eyV9YUWd5L//ybktK0jVI=;
 b=JrhOQEcZiaPhbvyiI046JOhZNngCCrFH0zt1NxujbSWlTsOsvG9KdWDJm2ZnPXfC1a1bYcnSo
 f2lz6VgMCZiAxWV00rijAUsd8EvRwNu/jLemoXjye0RmlZFsEdO4EeL
X-Developer-Key: i=quic_molvera@quicinc.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: zd_uQjzFq_0mM1tmo5RaizpF_PWzkWh7
X-Proofpoint-GUID: zd_uQjzFq_0mM1tmo5RaizpF_PWzkWh7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 spamscore=0 mlxscore=0 suspectscore=0 adultscore=0 mlxlogscore=874
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412040178

Document the SM8750 SoC binding and the boards which use it.

Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index d394dffe3fba5a396b85a6093f34e9ef62b6f9cc..f42442993045a648ce61e92a5b10c48ee37750e8 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -97,6 +97,7 @@ description: |
         sm8450
         sm8550
         sm8650
+        sm8750
         x1e78100
         x1e80100
 
@@ -1099,6 +1100,12 @@ properties:
               - qcom,sm8650-qrd
           - const: qcom,sm8650
 
+      - items:
+          - enum:
+              - qcom,sm8750-mtp
+              - qcom,sm8750-qrd
+          - const: qcom,sm8750
+
       - items:
           - enum:
               - qcom,x1e001de-devkit

-- 
2.46.1


