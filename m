Return-Path: <linux-arm-msm+bounces-39206-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FFD69D9934
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Nov 2024 15:10:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B3A3DB25792
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Nov 2024 14:10:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A08281D5CCC;
	Tue, 26 Nov 2024 14:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="iExVai88"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F04D31D5CC5;
	Tue, 26 Nov 2024 14:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732630202; cv=none; b=AoGfZqK/jW68r6208TLRuggCurvhGRim55T43xlM0ZNCWTsSzL5UJN2dv7P/37znYwOUOb39/aRwIuyqsauVNJTs/V9b3JOCmQ5jgnGzFpe4Y6Dh2QTwkNWvUVD+XsuhV1iXy5jBMipAa8+Ea89ZC8vdjhfSIOUSLeRJ28DpqOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732630202; c=relaxed/simple;
	bh=MGLpkH1rzOEFhurkWKmWfxDMk4DzkUU4iKdYDl3zThM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Enbt1e0PUy2wey7JjH4GWTAbF6vG36Oxqf+BFXKY1FGChPrEX4VkUW6IsDWXw4hU+1d9KaWxbyj01SgHQQZWWMhGFwsLhmWjLxBr2Ls9m6FEvKdddcWcFJp9/JuAeKgghfqZTNVgNdjLn2pcDdPKJ+K4fVcgQOQ2leJC6v/a6Yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=iExVai88; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AQDieRx030683;
	Tue, 26 Nov 2024 14:09:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8PV562Jk6ptnrUpZn9fOpgmvXsImbS4J6TPrgj5m1z0=; b=iExVai88xNK54RcW
	rJdGt55HNpiRt6+71hyVG+0h8OmxKc/4tMj7WMrnGW0mFCnIumQWd8mveOgFvJX6
	jVWrKp9djtLf68ApbQF57CKSVE/gOtLgENuIyrF7kkTd7XR6ubMfH+bI7ZtPmDKm
	mBP86WbjMsEJsoMqIld7mc04P5wJ2vdlDRJmtA1tCUe0k66RwETRUvPQWJfV4H8C
	crZM/1lb9/wJZ0f+clB3Afw41/PS58oAzCwEjsoZfn7KXoynxPA8sEUpQkXkRorY
	olm53BAi5hVsGIQjAqHSFDJV3SkuvPO9cbL5KuWIFyPSy7xMrBlGxp/LZr74CHNV
	WWE9qA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 435ffyr21w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Nov 2024 14:09:46 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AQE9j11032096
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Nov 2024 14:09:45 GMT
Received: from [10.213.111.143] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 26 Nov
 2024 06:09:39 -0800
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
Date: Tue, 26 Nov 2024 19:36:47 +0530
Subject: [PATCH 1/3] dt-bindings: display/msm: gpu: Document A612 GPU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241126-qcs615-gpu-dt-v1-1-a87782976dad@quicinc.com>
References: <20241126-qcs615-gpu-dt-v1-0-a87782976dad@quicinc.com>
In-Reply-To: <20241126-qcs615-gpu-dt-v1-0-a87782976dad@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        "Konrad
 Dybcio" <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Bjorn
 Andersson" <andersson@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732630173; l=2098;
 i=quic_akhilpo@quicinc.com; s=20240726; h=from:subject:message-id;
 bh=MGLpkH1rzOEFhurkWKmWfxDMk4DzkUU4iKdYDl3zThM=;
 b=Ivgtz6L2HVRy8MP22Q9c+cyo+5I+9Xp3kFhdRF3887yGv7Nuu/qYpV42u40vaqWpsN4udzINR
 5cqKlcaJZbDBcg46R7HpktWCaptKfFZ2PM3FBi9HoPrHtpYK0nDkeIk
X-Developer-Key: i=quic_akhilpo@quicinc.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: oKOOSP6JtsrfptBLrL-bmgTI5fF1B76j
X-Proofpoint-ORIG-GUID: oKOOSP6JtsrfptBLrL-bmgTI5fF1B76j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 bulkscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 phishscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411260114

A612 GPU requires an additional smmu_vote clock. Update the bindings to
reflect this.

Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
---
 .../devicetree/bindings/display/msm/gpu.yaml       | 28 ++++++++++++----------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index 6ddc72fd85b04537ea270754a897b4e7eb269641..201150d3151b55c26c95832d36f4e02f66060a25 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -187,6 +187,7 @@ allOf:
             enum:
               - qcom,adreno-610.0
               - qcom,adreno-619.1
+              - qcom,adreno-612.0
     then:
       properties:
         clocks:
@@ -195,18 +196,21 @@ allOf:
 
         clock-names:
           items:
-            - const: core
-              description: GPU Core clock
-            - const: iface
-              description: GPU Interface clock
-            - const: mem_iface
-              description: GPU Memory Interface clock
-            - const: alt_mem_iface
-              description: GPU Alternative Memory Interface clock
-            - const: gmu
-              description: CX GMU clock
-            - const: xo
-              description: GPUCC clocksource clock
+            anyOf:
+              - const: core
+                description: GPU Core clock
+              - const: iface
+                description: GPU Interface clock
+              - const: mem_iface
+                description: GPU Memory Interface clock
+              - const: alt_mem_iface
+                description: GPU Alternative Memory Interface clock
+              - const: gmu
+                description: CX GMU clock
+              - const: xo
+                description: GPUCC clocksource clock
+              - const: smmu_vote
+                description: GPUCC clocksource clock
 
         reg-names:
           minItems: 1

-- 
2.45.2


