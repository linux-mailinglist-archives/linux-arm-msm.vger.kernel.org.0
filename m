Return-Path: <linux-arm-msm+bounces-33780-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C2B4997D75
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 08:39:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B1F73B2282C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 06:39:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95A2219DF9A;
	Thu, 10 Oct 2024 06:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Y4xOCSDL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5FE23D6B;
	Thu, 10 Oct 2024 06:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728542367; cv=none; b=IBdkn4LUDlSOmMWv6HxJUrUsPzVUqnyPkgVA06TUU86eZUFskC7DZjCg1ZAgnWOr/33tM9cToM6x63Nm2PcX5TNH/4wCLt2FckZXRtZI3umzpm+1W0SPRv1KgBP3raggGbVIn6yIcB4lCGO2CaOnBHbjjeNipVrdpu6wsbDR4Wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728542367; c=relaxed/simple;
	bh=5qMusEJp/MI39DWIjOa7OD0CB2B9Fflz2uVKGPTZ8Kk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=R4wwoX7NvkvHkB7YpVyxXteT1XtOCCw5nRsVYGDvcm0Umdp5DOXe65m790KasN9jqnRD1IcaNpceo7UMPo8WpzeiTiB6Fk6g42C1wmaXCsEnHA4ihOZ7Ks3oW1qTt00nL7ieawLL5ti44FIvwg5AqguJOCor4GlrjMIczeFBOZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Y4xOCSDL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49A1bQa8009420;
	Thu, 10 Oct 2024 06:39:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fSU0x6QhdOAirppOVw6LVX4eLblAdXaNL7ugDjZbt+0=; b=Y4xOCSDL2w1Yzxew
	st1PW6JGgq9UwewwfZJhOoAT7rOERXCW6jAa9d9g+2Ip1ffsAWsoZETyvJ2WQlCy
	zVUzGaefgvuFh/nLfbbEybqn5cQcRevbUUaErkvrB5QLLz/c0Z0ubWVdTkTjsKzT
	TKWXwmXdiyo2KHvMN+N11IBnH4voJYIS3mFsqq2DqL+Fhfw4RonAS3R9g4d6gbRm
	7/c3Jc5gK5TCuXmA7A3Xbp+cy478SmPqealAf/0hxRhyf1imd9ecqABB2DZtyDwr
	I+s+a4fxwmMKHvaHDtOC6K3rwccWuUcuuWZQJKjhjHAjZa6IbEYk/1pAO33hlGmH
	ehbNPQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 425tn12f3b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Oct 2024 06:39:22 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49A6dMwO015795
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Oct 2024 06:39:22 GMT
Received: from songxue-gv.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 9 Oct 2024 23:39:17 -0700
From: Song Xue <quic_songxue@quicinc.com>
Date: Thu, 10 Oct 2024 14:38:39 +0800
Subject: [PATCH v2 1/2] dt-bindings: cache: qcom,llcc: Document the QCS615
 LLCC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241010-add_llcc_support_for_qcs615-v2-1-044432450a75@quicinc.com>
References: <20241010-add_llcc_support_for_qcs615-v2-0-044432450a75@quicinc.com>
In-Reply-To: <20241010-add_llcc_support_for_qcs615-v2-0-044432450a75@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728542354; l=1077;
 i=quic_songxue@quicinc.com; s=20240911; h=from:subject:message-id;
 bh=5qMusEJp/MI39DWIjOa7OD0CB2B9Fflz2uVKGPTZ8Kk=;
 b=X6DR3KTani412/UcNPmhqSsJOi0JTCQqtLKairKG7RmCCF6gVEC8+zzbUrW5rFeV4yvW9L5rp
 S8epQC0f6rwDQrjlFVuBkTpcH/lRQPVc7w1NmWsoP3DZeLuyNXQAQUZ
X-Developer-Key: i=quic_songxue@quicinc.com; a=ed25519;
 pk=Z6tjs+BBbyg1kYqhBq0EfW2Pl/yZdOPXutG9TOVA1yc=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: i8XmMxx_6g0bPXdFC29h-v3mffYTKTBy
X-Proofpoint-GUID: i8XmMxx_6g0bPXdFC29h-v3mffYTKTBy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 mlxlogscore=850 impostorscore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410100043

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


