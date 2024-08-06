Return-Path: <linux-arm-msm+bounces-27974-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A53C948843
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Aug 2024 06:20:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 55F9B283DAB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Aug 2024 04:20:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8C0015ADA6;
	Tue,  6 Aug 2024 04:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VUnDiYYW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44EB82AE72;
	Tue,  6 Aug 2024 04:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722918009; cv=none; b=GvM5g8LIGOTTUsABVpEWEG2JY/slTjnjPtNNf0s3d3kfUliRA6p+pZqmmNoai0EVeCLmP55SGbC/IFe+8A+lJiFMbc8KBjkjUPnnSULCHxOZP0g8wQ/9121sTLLMKvTkcTvqI74EWHAKlCzeXZ+rZGaXfQJdeYB1a3l7bGs42y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722918009; c=relaxed/simple;
	bh=9NQUd50qUH/NSy1cCVazRKF7SJh06+94/K/ADQEslPI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=apqifbd0G7kaEYyRiSR0qnvAEKwF9W/tsh6NtljWmAxIVliv++eDU60mSOwn/b2maEtLRAO7aFaueJ1Sc9hT9QoGraDDwP7NVuZBo9/YqIs0Gp5/gws5carH/WrP8n91MPQnX6TBDKydfHtmlG3jDZCLGHnU0aMKDh8RGhV+tfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=VUnDiYYW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4763022i023732;
	Tue, 6 Aug 2024 04:20:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rHRm4tLOB3Jmd9GjRKx3EEyn8c2nCkrSR5qpHJ+ZdKk=; b=VUnDiYYWKyTVOQIw
	/jeDZPXdGf2+KF4eQMKtIRwqn53IDlLTtexl+HuA2OfXz4YEulMkvxvcMFALhH9R
	O3YjpKZ8t96tYyMW04y1TluREgvMGnAPNgepArcr2EFC8/sxhZKhfmesDXMuoWIv
	dtJTYNKWOGXqZb2VtOGsq+g5lopRl/429871DAx1b8gzTgBJbc4ljdi2fnhYX4LA
	V5iTrUj4waU4gA75JHe743jvjtGCi+oSIyJnAF1BwPdwl2T8+zzk23J1bJkcVEyi
	SEMGUVUuXa6bzeStKz7sOCim8jrBJORoCmXC3VKDw9lj8TvDEJ3M61mloPysimJb
	oCXaCw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40sbgrx1dt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Aug 2024 04:20:05 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 4764K4gk021019
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 6 Aug 2024 04:20:04 GMT
Received: from tengfan-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 5 Aug 2024 21:19:59 -0700
From: Tengfei Fan <quic_tengfan@quicinc.com>
Date: Tue, 6 Aug 2024 12:19:29 +0800
Subject: [PATCH 3/4] dt-bindings: arm: qcom: Document QCS9100 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240806-add_qcs9100_soc_id-v1-3-04d14081f304@quicinc.com>
References: <20240806-add_qcs9100_soc_id-v1-0-04d14081f304@quicinc.com>
In-Reply-To: <20240806-add_qcs9100_soc_id-v1-0-04d14081f304@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Tengfei Fan
	<quic_tengfan@quicinc.com>
X-Mailer: b4 0.15-dev-a66ce
X-Developer-Signature: v=1; a=ed25519-sha256; t=1722917991; l=845;
 i=quic_tengfan@quicinc.com; s=20240709; h=from:subject:message-id;
 bh=9NQUd50qUH/NSy1cCVazRKF7SJh06+94/K/ADQEslPI=;
 b=VJ3sWIbYQE7n4er1eWAGBYFzh/ZlenJY9he2CfCH3TrxQJixqPE/8/Qh4OAIUTaNrQD+ApJwQ
 x2fOBqWEQiuCNSRhJiGa23zokNqKmVp4PrXneYNLVV/U6b1h5Vy5/J9
X-Developer-Key: i=quic_tengfan@quicinc.com; a=ed25519;
 pk=4VjoTogHXJhZUM9XlxbCAcZ4zmrLeuep4dfOeKqQD0c=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: uV_l02WrpoTGkCshtvxRll41tkU_Frev
X-Proofpoint-GUID: uV_l02WrpoTGkCshtvxRll41tkU_Frev
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-06_02,2024-08-02_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=770
 impostorscore=0 malwarescore=0 suspectscore=0 phishscore=0 mlxscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408060028

Add the compatible for QCS9100 SoC.

Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index f08e13b61172..71368b08eab8 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -43,6 +43,7 @@ description: |
         msm8998
         qcs404
         qcs8550
+        qcs9100
         qcm2290
         qcm6490
         qdu1000
@@ -900,6 +901,7 @@ properties:
               - qcom,sa8775p-ride
               - qcom,sa8775p-ride-r3
           - const: qcom,sa8775p
+          - const: qcom,qcs9100
 
       - items:
           - enum:

-- 
2.25.1


