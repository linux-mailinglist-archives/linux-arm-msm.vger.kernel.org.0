Return-Path: <linux-arm-msm+bounces-32262-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B07C984324
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 12:08:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4BF2D1C22CFB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 10:08:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C73F61714C6;
	Tue, 24 Sep 2024 10:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Au+Kpd7+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45F1C16F288;
	Tue, 24 Sep 2024 10:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727172488; cv=none; b=pG7Gekwh76rKL3y+YlQ/zQLMjov5uUhvPyr5y34smkmYSy4JCY6uaxjT0Q+I9s32VfmaxCWyeaoUpUrr1a4aAQI/iDkwpothRZTCsFiGdguK2Z2+ZD5HI5Ll1cszWakyMQUgt0LV92uYhtEl09kzMHtQawxdLloz9ug5Uw0E49A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727172488; c=relaxed/simple;
	bh=5qMusEJp/MI39DWIjOa7OD0CB2B9Fflz2uVKGPTZ8Kk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=EuElF88r7E9fFJR4V2DqUKtznN92WK651vl9uvvLsMFzIbSt/hFzvRB6gt0Yx/xZyQtZY5ne3lHjwDhmL1K0MDIC7WJfsq7Pg7/DGllv7Fft1g62CbamuYRYmVImkiUzE4vb/e8jEbq9EUMHPsf8u+AN4aKJ8QUmMpJZSreBMiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Au+Kpd7+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48O9Ht3H029683;
	Tue, 24 Sep 2024 10:08:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fSU0x6QhdOAirppOVw6LVX4eLblAdXaNL7ugDjZbt+0=; b=Au+Kpd7+hFrSVhLH
	vO9zNEbLSfs1JAfMmy3o44hSdyGNRuUV60OvbzLNI0XRX60d+F/L9THDNrcA/NZ4
	leb6U6HcYTQfN/ZN/EUDesIn3K0no6R3yOzNhbnGAYiAfkLiv7BwIAu9TxbbexMS
	7BMlrNVWOoSXEMAWSHyvaZByRa47eBREMRCwrXmvjYGLEleHW5uDBK5QgskrPpU1
	jI4yIaIOkTegCkEeQgHpbzJ+tapJScuz5j9Fifkag2vkUgHL3NdQYdRZn2EmI3V3
	mRLcrmvwpCMMVGO8E4fEriwbixstO7qABzX7SWOR5gJIi/5v38FFZ/h5ubke8usS
	M0v2qg==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41spweqvqe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Sep 2024 10:08:04 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48OA846J023293
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Sep 2024 10:08:04 GMT
Received: from songxue-gv.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 24 Sep 2024 03:07:58 -0700
From: Song Xue <quic_songxue@quicinc.com>
Date: Tue, 24 Sep 2024 18:07:11 +0800
Subject: [PATCH 1/2] dt-bindings: cache: qcom,llcc: Document the QCS615
 LLCC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240924-add_llcc_support_for_qcs615-v1-1-a9f3289760d3@quicinc.com>
References: <20240924-add_llcc_support_for_qcs615-v1-0-a9f3289760d3@quicinc.com>
In-Reply-To: <20240924-add_llcc_support_for_qcs615-v1-0-a9f3289760d3@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
CC: <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Song Xue
	<quic_songxue@quicinc.com>
X-Mailer: b4 0.15-dev-88a27
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727172476; l=1077;
 i=quic_songxue@quicinc.com; s=20240911; h=from:subject:message-id;
 bh=5qMusEJp/MI39DWIjOa7OD0CB2B9Fflz2uVKGPTZ8Kk=;
 b=OUIyLcMhgSYBDu1XZ/00pjeWqoE1+psCf/RyKmS6t/2yfXRMu0SH3xk9o8RpPaZ6V1x+vFpex
 mC7MVBYaqhaBrA2pcnAd5YfWTOFRTdVMbz/Qer5QhBUK3G7MMi07/12
X-Developer-Key: i=quic_songxue@quicinc.com; a=ed25519;
 pk=Z6tjs+BBbyg1kYqhBq0EfW2Pl/yZdOPXutG9TOVA1yc=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Emr0mTOS_C-oejNNLKSLv-1O4kDBrA1G
X-Proofpoint-ORIG-GUID: Emr0mTOS_C-oejNNLKSLv-1O4kDBrA1G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 mlxscore=0 mlxlogscore=855 impostorscore=0 phishscore=0
 spamscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409240071

Document the LLCC on the QCS615 platform.

The QCS615 platform has LLCC as the system cache controller. It
includes 1 LLCC instance and 1 broadcast interface.

Signed-off-by: Song Xue <quic_songxue@quicinc.com>
---
 Documentation/devicetree/bindings/cache/qcom,llcc.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
index 68ea5f70b75f031cd8b23cf48d566c3a760dab77..51dadf661fc82114324aee0dab6e49387dad81e2 100644
--- a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
+++ b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
@@ -20,6 +20,7 @@ description: |
 properties:
   compatible:
     enum:
+      - qcom,qcs615-llcc
       - qcom,qdu1000-llcc
       - qcom,sa8775p-llcc
       - qcom,sc7180-llcc
@@ -67,6 +68,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,qcs615-llcc
               - qcom,sc7180-llcc
               - qcom,sm6350-llcc
     then:

-- 
2.25.1


