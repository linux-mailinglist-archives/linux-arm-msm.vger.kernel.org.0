Return-Path: <linux-arm-msm+bounces-21232-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CEFD78D5E78
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 11:36:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0BEFF1C20402
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 09:36:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66A641514C9;
	Fri, 31 May 2024 09:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="PGF0AlsR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C26F4142620;
	Fri, 31 May 2024 09:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717148159; cv=none; b=nwJ8FevQf7fULTunTqdCChcJny/I9DiSNlRTWqQ8+5ldBRsuXrW6gqLU+3pIbP34ntfzY8F8AuIVxHZc0cgY51mJ/cz2WqrGOqLRFJdLIX7QcFq1uwRcgazwaEKzD6f7FmCDq7WgKSTpSGzidOOs5gWuSzZ9lqzvc3xbZOD0KBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717148159; c=relaxed/simple;
	bh=7xsed52nOYGOtWjE0e/nzP2CxRjMX4a0dibUsohNieU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kDdeVTNhPlRbstMOPEz+fQ8F0as6KaZF6Kz2wPTugjuGChJAhwAmImaE4IPVksj9eD8DX8s3/uDOoOjNm3IICkVCcsQvLRQ8EERmFxI7Y9Hlj3dvIMoScebSuGtPkWkwHo4LvY+z9VE9VFmM3/uy8SG+X7HmDnq3QjA5e5KlU2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=PGF0AlsR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44UMfC5A018782;
	Fri, 31 May 2024 09:35:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2RIBPaIiPA4XUS6U/lPBsafiREp5tGtrqfrsF29+LOg=; b=PGF0AlsR5xthboD6
	IeqzryutryWJf96jm0eL/WBEWXToG5kWAFoC88CnT/umWB+RCXJwP3KU8CmzujJr
	ZtfZSZxkv3VjO5WD4GY0k1ynj0hM/E5wTwVCV5fBCe6O5pISnuYLf3/BUjkw/phx
	9mKIlCe1kJUKQkUYXrIQQAcuHhDec80ueLR2iQOmE8/grUv6OMEMKPgam6OnE5sZ
	Oz1cpH7orrF1vnVbnvASF7BAVIE7vjMwQ53YaQ96f+YkW4zol4456SKbmz2ZO9cM
	7UEmMIOcMl2wEjFbjhvswmCLop3h40WdyRRhUXAy3EqWGc1uh7atp2GYuP5Z8zeF
	XjxRCg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yba2n6f9g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 09:35:54 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44V9ZqdQ003762
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 09:35:52 GMT
Received: from tengfan-gv.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 31 May 2024 02:35:47 -0700
From: Tengfei Fan <quic_tengfan@quicinc.com>
To: <andersson@kernel.org>, <konrad.dybcio@linaro.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_kbajaj@quicinc.com>,
        <kernel@quicinc.com>, Tengfei Fan <quic_tengfan@quicinc.com>
Subject: [PATCH v2 1/2] dt-bindings: soc: qcom: add qcom,sa8775p-imem compatible
Date: Fri, 31 May 2024 17:35:30 +0800
Message-ID: <20240531093531.238075-2-quic_tengfan@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240531093531.238075-1-quic_tengfan@quicinc.com>
References: <20240531093531.238075-1-quic_tengfan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ubBKGLuD_3DXTjjpjR8m53_SILAgX-lZ
X-Proofpoint-ORIG-GUID: ubBKGLuD_3DXTjjpjR8m53_SILAgX-lZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-31_06,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0
 malwarescore=0 spamscore=0 bulkscore=0 mlxlogscore=870 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405310069

Add qcom,sa8775p-imem compatible name support.

Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
---
 Documentation/devicetree/bindings/sram/qcom,imem.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sram/qcom,imem.yaml b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
index 8025a852bc9c..faef3d6e0a94 100644
--- a/Documentation/devicetree/bindings/sram/qcom,imem.yaml
+++ b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
@@ -22,6 +22,7 @@ properties:
           - qcom,msm8974-imem
           - qcom,qcs404-imem
           - qcom,qdu1000-imem
+          - qcom,sa8775p-imem
           - qcom,sc7180-imem
           - qcom,sc7280-imem
           - qcom,sdm630-imem
-- 
2.25.1


