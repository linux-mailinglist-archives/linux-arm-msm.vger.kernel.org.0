Return-Path: <linux-arm-msm+bounces-36524-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C13019B751A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2024 08:15:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8550E2864CB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2024 07:15:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4A40149C54;
	Thu, 31 Oct 2024 07:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Pek9q0fB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3E0F146D68;
	Thu, 31 Oct 2024 07:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730358912; cv=none; b=onkCSOlbO4VaQ6RixnG4VraI7NhcOzkz5fqD8/jN9C5prKuw+a8UJR/5jruG8bGJzaRVzpYqDdVhQnGD+CZKAy3WCVWIYO7vPyfY0Aw+lcWqovdu6FbwZbzzib1ylKfOkCIRVByVo9YdUpR3/+5duhhtSp3OyCw3yqWczFuCy1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730358912; c=relaxed/simple;
	bh=ipkMi+pjI98bdfDw6CnT0LlQQkmi0gPNjf7TGrglbRg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=SXRFl6GnB38SEstEnQSuw4U8u00NDHBNLhrHOjP7DoEc9tZK3PXwyVJERYp4tktbysUKMDPnB5VRv3apQShcePmO8M6Hl0bxTNqcHH3AWvp2NJjHXGGEDynjBpmPVnIvNKaqM8arN8pmtMla7KFckUVp+/eOocBg/kEug4k1tuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Pek9q0fB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49UJfDiK004847;
	Thu, 31 Oct 2024 07:15:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+4XBAn7eZdQIylI5Ze2P/GsV2IOHESvKWrYkziUkYR4=; b=Pek9q0fBB5vgU5vW
	c8AYVTo/T7244IZ7CyNt0jdtaYIhlTmWicBltix950vOCbqAyAZHk4f9aLVPBMpz
	IutgZkTa1Jing8xPsEHrkzPrWRAanJXgUQnqFL21bNaxd9reElBEWE+YSG0es5rb
	T5FottOCVSYoyAs3fPcdW9+EQxa+imONUxp3ak0r6zOrVSiSfO5Idr2jv7XuZHb/
	jjAVmPrnLQE08ooH5AsLQSa4WvotvbrvjlyN9tdHq/FpLm07hSpSPHCKpzDDYnFM
	Zr+jjoyea5+VdwrQacK3yjxpnLrXyRreECXNavUNEIDnqUp3bBpPXFYXN5eTdlIs
	Kv/i/g==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42ku659fqa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 31 Oct 2024 07:15:06 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49V7F5qT026228
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 31 Oct 2024 07:15:05 GMT
Received: from jingyw-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 31 Oct 2024 00:15:01 -0700
From: Jingyi Wang <quic_jingyw@quicinc.com>
Date: Thu, 31 Oct 2024 15:14:36 +0800
Subject: [PATCH v3 1/3] dt-bindings: cache: qcom,llcc: Document the QCS8300
 LLCC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241031-qcs8300_llcc-v3-1-bb56952cb83b@quicinc.com>
References: <20241031-qcs8300_llcc-v3-0-bb56952cb83b@quicinc.com>
In-Reply-To: <20241031-qcs8300_llcc-v3-0-bb56952cb83b@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <quic_tengfan@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_tingweiz@quicinc.com>, <quic_aiquny@quicinc.com>,
        Jingyi Wang
	<quic_jingyw@quicinc.com>,
        <20240925-qcs8300_initial_dtsi-v2-0-494c40fa2a42@quicinc.com>,
        <20241026-sar2130p-llcc-v3-0-2a58fa1b4d12@linaro.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730358896; l=1019;
 i=quic_jingyw@quicinc.com; s=20240910; h=from:subject:message-id;
 bh=ipkMi+pjI98bdfDw6CnT0LlQQkmi0gPNjf7TGrglbRg=;
 b=Cqts6e3UdrY3WjeLV5YaQHvGkipA+gXi8++GtH3wILPExXPTViyR/yBpiEjRjy2P52aP3C7dC
 yy+RQte4QftBMWCJMFg8xDjT9N7hnyDLwtR/IzhoGodtMd0hsaux+HI
X-Developer-Key: i=quic_jingyw@quicinc.com; a=ed25519;
 pk=ZRP1KgWMhlXXWlSYLoO7TSfwKgt6ke8hw5xWcSY+wLQ=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: eS86PdgZoGX62xKgoBx6dpqrktKQpZpZ
X-Proofpoint-ORIG-GUID: eS86PdgZoGX62xKgoBx6dpqrktKQpZpZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=863
 suspectscore=0 bulkscore=0 lowpriorityscore=0 mlxscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 clxscore=1015
 malwarescore=0 spamscore=0 adultscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410310052

Document the Last Level Cache Controller on QCS8300 platform.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>
---
 Documentation/devicetree/bindings/cache/qcom,llcc.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
index 2edacf28944c..869bce968fc3 100644
--- a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
+++ b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
@@ -20,6 +20,7 @@ description: |
 properties:
   compatible:
     enum:
+      - qcom,qcs8300-llcc
       - qcom,qdu1000-llcc
       - qcom,sa8775p-llcc
       - qcom,sar1130p-llcc
@@ -193,6 +194,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,qcs8300-llcc
               - qcom,sdm845-llcc
               - qcom,sm8150-llcc
               - qcom,sm8250-llcc

-- 
2.25.1


