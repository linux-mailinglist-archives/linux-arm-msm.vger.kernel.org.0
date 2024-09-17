Return-Path: <linux-arm-msm+bounces-31933-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D6CE597B4CD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Sep 2024 22:40:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9DA572861B8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Sep 2024 20:40:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1B021925B1;
	Tue, 17 Sep 2024 20:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Sgx9G0be"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 209561925A2;
	Tue, 17 Sep 2024 20:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726605576; cv=none; b=iZRTU1bNtlcFTHAi8RV27jaucuKjidx7tvOi++GrK2hQZDAb2VpZkcMrK28aSDh24Mng6oT2L2Wj8t81+t2qWisIegXAQFRRdXBgsSMxIYIcC24LSAoIRCjaa58IlTgUunUkDWMJ4LkELWb2O+Z1+zZfGZP+lmzQW4p6hA04kz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726605576; c=relaxed/simple;
	bh=ZYbJLcOh/wmOXdAy/+TTPtSaupxcc8KssfZwK9ksVvw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Mv0b+hGR5u44DIVw3KP1T4dTmHhlUvMGnv6njEjSddze1JiVc5XZEY1JNdj8wSJqbDh1yn1iRoXzt2ZSs3KP/fvJ1mCFqIqh0oNyDt+dsKV0MIB3q/VtWdrItSOWxmmrSeEnfmceB3Z2qUPM0sjwwY7nIemeR1vgU3QjaZWAk9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Sgx9G0be; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48H8Htax024611;
	Tue, 17 Sep 2024 20:39:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+ifZ55UPArIar+zM06kQDtpwdqKoDacemp6xyxO7rBw=; b=Sgx9G0be2huBD3Mk
	zewHUnhBy35yAw8sp9uNgGGmo77xZjmU3aXKa41ieLSpqjd4j4OfMCqomo0zLa1s
	12iNAvawJYalyrcboip9eZT57lGBNz+5SMJncSsTQkw8vG+8wSPmG579cWLLx5kA
	zR/47qyrzGT+LDHOpoj8eFyYneg4985FbdkkPp/iO0wtZKPXXombTDeUF3aEwSNj
	ZCUC48m/R45vUDuQi97JlSfzTXQ0kpKAucKuwRA+vqAchl47Fgfwck5aiBFB5NCC
	EScoOBUlrW7HfUEnZh1ePUMlHmGHHKZg6vaf2cAuwSBuzLMIf0ZbGnAklpWYVMZd
	6esSYQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41n4gcyxj9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Sep 2024 20:39:23 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48HKdMX1010442
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Sep 2024 20:39:22 GMT
Received: from [10.213.111.143] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 17 Sep
 2024 13:39:16 -0700
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
Date: Wed, 18 Sep 2024 02:08:42 +0530
Subject: [PATCH 2/3] dt-bindings: display/msm/gmu: Add Adreno 663 GMU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240918-a663-gpu-support-v1-2-25fea3f3d64d@quicinc.com>
References: <20240918-a663-gpu-support-v1-0-25fea3f3d64d@quicinc.com>
In-Reply-To: <20240918-a663-gpu-support-v1-0-25fea3f3d64d@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        "Konrad
 Dybcio" <konrad.dybcio@linaro.org>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie
	<airlied@gmail.com>, "Daniel Vetter" <daniel@ffwll.ch>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726605543; l=806;
 i=quic_akhilpo@quicinc.com; s=20240726; h=from:subject:message-id;
 bh=3E6fEJmPlHLH959TLAACVvdF5ECDHkTT0del3bghWG8=;
 b=Hu9/txs7HVDjTOHQKdipR75LnQB3+YajE0n/QC/PIVJBZKABaj8i85se/C5ZuiecZ7LzcRsfN
 sPYFik6jd+gDhxbfeBVScahRyC5TydOtVWeRws658v+/wNdyUQ0Q3Gn
X-Developer-Key: i=quic_akhilpo@quicinc.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 6-gGAeon7soajIZUAr-mKZhdD5C9Jmv5
X-Proofpoint-GUID: 6-gGAeon7soajIZUAr-mKZhdD5C9Jmv5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 bulkscore=0 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=999 impostorscore=0 mlxscore=0 priorityscore=1501 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2408220000
 definitions=main-2409170147

From: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>

Document Adreno 663 GMU in the dt-binding specification.

Signed-off-by: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
---
 Documentation/devicetree/bindings/display/msm/gmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
index b1bd372996d5..ab884e236429 100644
--- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
@@ -125,6 +125,7 @@ allOf:
             enum:
               - qcom,adreno-gmu-635.0
               - qcom,adreno-gmu-660.1
+              - qcom,adreno-gmu-663.0
     then:
       properties:
         reg:

-- 
2.45.2


