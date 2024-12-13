Return-Path: <linux-arm-msm+bounces-41964-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C4689F09A3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 11:36:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 05D782828A3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 10:36:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 483AC1BD9C6;
	Fri, 13 Dec 2024 10:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="kk4ZEGRO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDCF31B652B;
	Fri, 13 Dec 2024 10:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734086199; cv=none; b=cFehTQSP6u+vmbWXv6rZUpCM2OhXykhlZL/eTZbFSZDFOTsNMfc5JzZkUjM/uJM2uXnCvGeP24AjHsprAJOIbcrcP5BU/9bvDy9P1sBZbNXwPjcI8+QGRJIhIL47xayPsZUO3K2k6rsmmuzEMAnGysB+BHSvNK7VF7FTbY8UA6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734086199; c=relaxed/simple;
	bh=qt5OtBFGHoMrepBGIH8TqYCQQnXfj5g8zxXVqFzAWX8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=B++lL9xtXPU0EQEYdtAMF0SN4InfQJTQGYrpXzQ8vxFnJ1NZUM82wBa3Feua9eJ3sWNHzO55M434tkn4LC1c4K7C9SYXAni+BwGAUDQROujYUN1PfFPvZ96N3qyFpPnWL8h8cB0TcG7tI2fEkYGvA9wDi5KZb/pv01XjGdrRhFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=kk4ZEGRO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BD8D2mf032195;
	Fri, 13 Dec 2024 10:36:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hzmINyaTaTwsL25V5875NymhrFoz/rmPA0ZT0D2ui1Y=; b=kk4ZEGROeKwLTK84
	mPTjfExg26YOs37xgejhgF+jd3/Qrk+8TUUHJmFcJzo4GAXXzNFCNkLntqpbMawN
	TLWWDz9CuQZLJ3YJjq7EoYC25sWkDzbmCpLoc+fPPD9MXR+FN3Cmv7rqdEjeFqUw
	61e1YMZ+Rx2JXky/TshM40k/z2CT9RZqMv4zNSCU4vDdLIBpgRZbk25PZOO82Zj7
	2m3Ns35gJl0H/pFGWhEyO3uE0ZTTVS0o+GBqepnGmF0b4WmN3xtoJctKmEj3ysBx
	9a2KyfFWMbPRnddu/fAMRnmMjJz6JqV7KdLV5ovDdkv2vNfJwr7Vp1Ue+REzsS06
	4fMQfg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43f6tff9gp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Dec 2024 10:36:23 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BDAaMXj013164
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Dec 2024 10:36:22 GMT
Received: from [10.213.111.143] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 13 Dec
 2024 02:36:15 -0800
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
Date: Fri, 13 Dec 2024 16:05:43 +0530
Subject: [PATCH v2 1/4] dt-bindings: display/msm: gpu: Document A612 GPU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241213-qcs615-gpu-dt-v2-1-6606c64f03b5@quicinc.com>
References: <20241213-qcs615-gpu-dt-v2-0-6606c64f03b5@quicinc.com>
In-Reply-To: <20241213-qcs615-gpu-dt-v2-0-6606c64f03b5@quicinc.com>
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
        Akhil P Oommen <quic_akhilpo@quicinc.com>,
        <20241104-add_initial_support_for_qcs615-v5-4-9dde8d7b80b0@quicinc.com>,
        <20241022-qcs615-clock-driver-v4-3-3d716ad0d987@quicinc.com>,
        <20240924143958.25-2-quic_rlaggysh@quicinc.com>,
        <20241108-qcs615-mm-clockcontroller-v3-7-7d3b2d235fdf@quicinc.com>,
        <20241108-qcs615-mm-dt-nodes-v1-1-b2669cac0624@quicinc.com>,
        <20241122074922.28153-1-quic_qqzhou@quicinc.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734086167; l=1611;
 i=quic_akhilpo@quicinc.com; s=20240726; h=from:subject:message-id;
 bh=qt5OtBFGHoMrepBGIH8TqYCQQnXfj5g8zxXVqFzAWX8=;
 b=HSTHHytwSjTd6YhWmI4T3Qis+C4BpcuQmeZwSm8SeI/Q07PAg/nKVpIN95DKE33aknXq5e1HN
 MVw0QaLZqONDvUHYlFUilh5YGXDR9mbLmcsSygWszcRsaenHQi+YhHn
X-Developer-Key: i=quic_akhilpo@quicinc.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: flLJhklz2REECl_MVCZZE7V2gRmo6BJS
X-Proofpoint-ORIG-GUID: flLJhklz2REECl_MVCZZE7V2gRmo6BJS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 mlxlogscore=999 malwarescore=0 spamscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412130073

A612 GPU requires an additional smmu_vote clock. Update the bindings to
reflect this.

Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
---
 .../devicetree/bindings/display/msm/gpu.yaml       | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index 6ddc72fd85b0..1276331cb262 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -217,6 +217,42 @@ allOf:
       required:
         - clocks
         - clock-names
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,adreno-612.0
+    then:
+      properties:
+        clocks:
+          minItems: 5
+          maxItems: 5
+
+        clock-names:
+          items:
+            - const: core
+              description: GPU Core clock
+            - const: mem_iface
+              description: GPU Memory Interface clock
+            - const: alt_mem_iface
+              description: GPU Alternative Memory Interface clock
+            - const: gmu
+              description: CX GMU clock
+            - const: xo
+              description: GPUCC clocksource clock
+
+        reg-names:
+          minItems: 1
+          items:
+            - const: kgsl_3d0_reg_memory
+            - const: cx_dbgc
+
+      required:
+        - clocks
+        - clock-names
+
     else:
       if:
         properties:

-- 
2.45.2


