Return-Path: <linux-arm-msm+bounces-57287-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A21AB003E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 18:20:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ACB6950021A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 16:20:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB03B2820D8;
	Thu,  8 May 2025 16:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="IgJaFNNE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F655280325;
	Thu,  8 May 2025 16:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746721199; cv=none; b=QlzaTO6P6Kq8bgvaZOUmgokqeCSpotW1sCzBu5Dw2DMXzqDUt0bzqUnWiy3tLGxylHQ71o4DbNk2X3xtYZIcSqYSrKvShFj5sQKEhyN2AnY++mv7tN9eg5TpBeuHtTHWydaMUXXLDVkxIz4bu/fSD76SDfKVGC6fY5UJ+godQXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746721199; c=relaxed/simple;
	bh=7lmGtjAJkzaMicHJHivzud16jAo9MSQZF5aKFnqHwzU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=rd3ZEuoOKWDZp4zmnQDkltw1fzeZsf8L2LQSm62th3fczDCP3/zPuRDbSN/2l97+/MTcSAwJh6pRhvYJKuVl1YTQLARWxxFtf2OkcDS8MSYXnqTcVGCDqP99+R3f6dhaUALK49ilWLOPZQYNJ5BhkKqzsuQIfl2wWrPI6LWTg8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=IgJaFNNE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5489cTF0013054;
	Thu, 8 May 2025 16:19:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Yxd/K+pZqCUFrXf9xr2Yw5EoV6zmboGoRme6ruKpUG8=; b=IgJaFNNEm7dPHsFq
	OTSQ0iOHRuIqCtRRBt3uWvMHRPkacPTQon7nG898QfKCsFX+QJpxW5tHRvui8/8N
	qADZb2wBoc8mg/zlZFTF0xko9l/ZIYD9GSeu4hSuowOs7RzPqmciSvcLJooGBevj
	d0ayBIUWgwoZ1kQGntYCXruTj/mg76tJHeZT2CRT1WnVInbHWlC7RehziroM4/+U
	bHapDaZUvzfMBqmz8J1d4TXAcwsrVSlrC9+WlBXmrg+6/aOONyxM4XgJq4VOX3S/
	2s/BXlPAwJXQHzTSeL29vl3i3a+v7OiEMX5KlWM9+3AVM2Ey8nehlWhvaU7Y6ji3
	X6c+0w==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gt52s3ff-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 May 2025 16:19:47 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 548GJkhc016679
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 8 May 2025 16:19:46 GMT
Received: from [10.213.111.143] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 8 May 2025
 09:19:40 -0700
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
Date: Thu, 8 May 2025 21:49:19 +0530
Subject: [PATCH v3 1/3] dt-bindings: display/msm/gmu: Add Adreno 623 GMU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250508-a623-gpu-support-v3-1-3cb31799d44e@quicinc.com>
References: <20250508-a623-gpu-support-v3-0-3cb31799d44e@quicinc.com>
In-Reply-To: <20250508-a623-gpu-support-v3-0-3cb31799d44e@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        "Konrad
 Dybcio" <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Jie Zhang <quic_jiezh@quicinc.com>,
        "Akhil P
 Oommen" <quic_akhilpo@quicinc.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746721173; l=1898;
 i=quic_akhilpo@quicinc.com; s=20240726; h=from:subject:message-id;
 bh=VoAfYHkAmPVpXM4uz7NgbSLR6zpbCmPQYNPA788LYUA=;
 b=WzpO8z+ETKwGLeTzQx4Mhf9tuY2feOm3Q6AJGT+1kWopNuMnUGnj1XcsQKvsJomozWRgncGhC
 B1TGLp1CsjkC4xDlwnZPA6DgymQRmkh4+jHocqFPB/A9qOMKma/I187
X-Developer-Key: i=quic_akhilpo@quicinc.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDE0MiBTYWx0ZWRfX6JgPuIRZ6ywI
 JbYchejsQIi+K1sSbbSyJBXxMmDmEyFcD8QmQznGQYh9upcciOXifm2QqPd28g+hju4EXIVACSI
 8xwnJ832vBwAZ/hOayucrx7gOW2ZtUahonx1HOcYmZ70mU92QHQUqzIvddW6HaLCF0sUJs1K1il
 uc2XNk4s0KBO2fQcdbQDoa1MCQ+LYvABnzRa63I5COeIrU2RFxYXR6ZsRVX2QYHm8JPcSzB7A+L
 ZV5JBSYxsZIh9d06/I9Gw2Eb7BceCWuQNQOEMviKB2KmwoNtoIri3UP/0MrHxfBVR13s+ozTxgi
 9JLcFLPPpr2nReF8a203Jj6QnMkMstm32PopIxkJ4nUfM5Q+dnH8FADzhhnsy/VjYw291QRE8Ze
 H5spWRZSXc3lf9HK+FmsYPMCJAeIWCKVW6GHojbv0gZVdYIX8CJTdDk3fhygZKCE33fXUxhL
X-Authority-Analysis: v=2.4 cv=LKFmQIW9 c=1 sm=1 tr=0 ts=681cd9a3 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=KKAkSRfTAAAA:8 a=lg8D87i0TRp2Yfz5Kl8A:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: V3jz_spu3fZTNRauxjqASELss9oJXI7f
X-Proofpoint-GUID: V3jz_spu3fZTNRauxjqASELss9oJXI7f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_05,2025-05-08_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1015 lowpriorityscore=0 suspectscore=0
 malwarescore=0 mlxscore=0 bulkscore=0 spamscore=0 phishscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505080142

From: Jie Zhang <quic_jiezh@quicinc.com>

Document Adreno 623 GMU in the dt-binding specification.

Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/display/msm/gmu.yaml       | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
index 4392aa7a4ffe2492d69a21e067be1f42e00016d8..afc1879357440c137cadeb2d9a74ae8459570a25 100644
--- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
@@ -124,6 +124,40 @@ allOf:
           contains:
             enum:
               - qcom,adreno-gmu-623.0
+    then:
+      properties:
+        reg:
+          items:
+            - description: Core GMU registers
+            - description: Resource controller registers
+            - description: GMU PDC registers
+        reg-names:
+          items:
+            - const: gmu
+            - const: rscc
+            - const: gmu_pdc
+        clocks:
+          items:
+            - description: GMU clock
+            - description: GPU CX clock
+            - description: GPU AXI clock
+            - description: GPU MEMNOC clock
+            - description: GPU AHB clock
+            - description: GPU HUB CX clock
+        clock-names:
+          items:
+            - const: gmu
+            - const: cxo
+            - const: axi
+            - const: memnoc
+            - const: ahb
+            - const: hub
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
               - qcom,adreno-gmu-635.0
               - qcom,adreno-gmu-660.1
               - qcom,adreno-gmu-663.0

-- 
2.48.1


