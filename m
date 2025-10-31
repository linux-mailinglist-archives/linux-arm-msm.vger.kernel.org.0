Return-Path: <linux-arm-msm+bounces-79883-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 02024C24EE6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 13:10:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 199521B2191E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 12:09:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DDD034A3AF;
	Fri, 31 Oct 2025 12:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kDUX1usR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jS1pmuyu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E9853491DA
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 12:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761912465; cv=none; b=euidm+tG4Gi/9Jvx4JRCeE2E/z/P8uWTrUkA9cLKllMBvKfs6rPOOmfj+bcUlAJWogeqxF8Shs3Gwd4wKmJ3ORwAtuWok02O1TEaRKZ9VDXI107QxOwUbQbNe+16XZwWG4EvAE+JbGwg12vOaTvTtunXnvRyM0iTJlLL7FDOY2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761912465; c=relaxed/simple;
	bh=1z/FSnj3ZUgyWqaLRX5fY7Les2o4JmWnSmIDwUcEQN0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l2AYJOyyL0+4Wot08zB29CqyNRwJpLDfbReuP3NM5rZgKQOFSEBz8RnxUNekDzZVWtfsK2cIC5erxxPVGw+CVL+ppM8Nn5FN6IBDnd/7U01x5wbudZWhLxXf29Xm4yBSMDf0HpXnVUce9eMni7ieIsMsseMG1dPpaMHJPBnCXyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kDUX1usR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jS1pmuyu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59V6MZ2R3115666
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 12:07:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=pWjm3r9JBLg
	yWiY5RrLVYsR7m0kB0QZc1E+F4Ywtwhk=; b=kDUX1usRPtAq81ci+XbWM5Wr6CJ
	ZySLzKr3qqnhz9m3oX7XaUR6weDsdTI6PQlzKLdbZIbqmtOnAszUVpc//6IGEu3D
	a9sVdwidi9X/6i9URLrf9bGpAHcvWk23AukZDtojdEi6BXKjStxpMLHI7nVTJE2y
	yrTVTzipjleMQWXyLWogQZHn8PWAz8nuc4pRJhnQTurbBjLdjKpv2Kyfn5xP0CRb
	F5Kat1n0FeO1RmAk6Gm2n5SMWl59DJiPYQxNntWkgK6AraAbpzEty6k0LWQOn7hE
	9AJUSa4zV6FYDNBU6262V4kwvodir6yiu0ZC/GcoSDayL98Q0pCpJ7BftyQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a45b4436c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 12:07:41 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-5db24da6d69so4210895137.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 05:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761912461; x=1762517261; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pWjm3r9JBLgyWiY5RrLVYsR7m0kB0QZc1E+F4Ywtwhk=;
        b=jS1pmuyu65rUOP+HFZrKLHgS5hnkfjEDNadVRjaMJAsBg05Tr3l66fuhGjJSHR5iaC
         bczS1a6nYU1mbdeVL8LAaTDSwBR/ujgybeUDWj3XmGdpY/5Bx9ZNEJTtrCBPSappuV5c
         yhZX1MchRMDBJvme0fQbY0/frH/j+G+RLVpjJkh8sN9Izba0i+x+kwP5dT3J6qWr34wH
         H2t4c4j8gzxgxtwGEVE28HiN+ok0ZJgvcQB8x7/fkmU7KiDHbF+jAzOy2pZPAdjLbCGP
         Ufs8TuarmLdbBTYQXDVWp4HnJJ98CVXDShzdDSfpuP1kubTyajqKE10Dhme6cUIHUaQk
         hnlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761912461; x=1762517261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pWjm3r9JBLgyWiY5RrLVYsR7m0kB0QZc1E+F4Ywtwhk=;
        b=JrzYdbS0KwVgk2Xf/kG6pVq+zjCdy6AEm1Xmv638Z38yCZ1NyWtTuxjYHG9aJO344v
         3a9OTrqMLgWBSvurOXrCLorKYIMRfKRHX3a/pVokUV3jGrJD5yXnXQBiYv5GQJ6q0k4n
         TykD1gH3aATPamUdpAKz+q+Q0J3Mb8lSvZVE9XG9708oGHo743938fOM4lDEveKSobRl
         twfkBG/893fY5kDh/AFeFoERKbQnOL3ZkkAd1PreQZjobeGbYV7T4TCrTxQ8mJGFtftE
         kwGCdMT6OcZZ64ig1IUllDpJof9caAZ4+bcRhTzg1MGdrXPb0gz0o56ENR3Zp/qO3DvM
         plUg==
X-Forwarded-Encrypted: i=1; AJvYcCWXbmlIQHjar/6VRji00oIByDRvnkMHjvmjEu2zpZLpthLgy50u4iw6kWIRKRCh2W+EOewWkzVoZsjmDbvO@vger.kernel.org
X-Gm-Message-State: AOJu0YyD0HspSk97YBFbL9WlnQfRsW5sIzlw6h3yX56jdiM+F3ttec1g
	2HiIb51l3/Bj0hLJoPsrPhv3QB1eiHMGYb0XVgbfHmIlxN8EMg6OCAzBB9Mm7Fy2hWzVlyksbD0
	KyE3q7m8jJRKRl/AKPetw3GMNEgjSDI2FT43iauyfEHJM768MZPkHTivtPIMxggoKaPm0
X-Gm-Gg: ASbGncv5+J02EG1Cw1j/L4cutzPi57eq+bes9t4lNFMg65lRyNuNkpGUL4s5NDXDLNj
	eJJAiFh+oqfSylqP2JmeIp2vGqcU8WDrOn2PzrrrPHjc9qIuUhNBB8WnWhtgqvvfZStmfCbnjTA
	wJG8tQ0PDMI/8zyXFadpRLXxAOi3h9LDgqY/AIY/K5X/AMi6VETNB8IGnOd9zSlrEUs4lBLdp8v
	EmR50PvaGn5bgwD2SDaX3K1rFDKxwdXUwHdLYSC9w0ZFeX6C8iR+A6d5oa1mzg+OZAm5+OTHPoe
	rf4uTUo1GulNhDrOUESaFFmDF6um3tG+Tn7LxJ11ALnnx4QP8bRFedJZh7NXYKGvnv0YfMq2SZu
	p7deAIisx6I9I
X-Received: by 2002:a05:6102:3f46:b0:5d7:bd64:cc72 with SMTP id ada2fe7eead31-5dbb121c807mr997441137.15.1761912460899;
        Fri, 31 Oct 2025 05:07:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEDodoCZVLOUdcpxRleWvKRAfyDhfwenQkOa2/iYbWuD6ME4XdksbEW5FLWFXXxrVhue5fhqg==
X-Received: by 2002:a05:6102:3f46:b0:5d7:bd64:cc72 with SMTP id ada2fe7eead31-5dbb121c807mr997417137.15.1761912460425;
        Fri, 31 Oct 2025 05:07:40 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4772fd280fbsm21273995e9.5.2025.10.31.05.07.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 05:07:40 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: robh@kernel.org, broonie@kernel.org
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
        perex@perex.cz, tiwai@suse.com, srini@kernel.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, alexey.klimov@linaro.org,
        konradybcio@kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v3 4/6] ASoC: dt-bindings: qcom,lpass-va-macro: Add sm6115 LPASS VA
Date: Fri, 31 Oct 2025 12:07:01 +0000
Message-ID: <20251031120703.590201-5-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251031120703.590201-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20251031120703.590201-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDEwOCBTYWx0ZWRfXy6P+CQmoIWqn
 fN1c4+BTUSJ2fUnwKw8AKc7ZrTmDUjnlKr3gpgPecazkcpPWxurBWUBgr9e0RHjUZu6foe5NUwY
 eDJh7MFUyp9VXVYFFw3FcLavl4aBjQQwvnme+wR8cgtEmpn7ORsGkkU22byqLPFknefnDjKe/bP
 lC48R+zihrsSdueFjhPmw2oq20x6xmAu8nRSNdAiNqDBlDVkUFwDyPLGK2PV3UapdWZzL0eiQyb
 v9cbPN/yIAp0FxcPYaDY+S+5H1HEDxli8oo4h9zrM2ixFrsxrabtNpIWl9uIy5Ga/EsixTcdmdp
 fEyIPkDHijoDZlFkh+CaoVoinKhVPY6fCD/7TJ/ZYi/1+k3u0BfYyyRvbF7Q486yiPcbRDUii79
 QhUgIYroDthiXG7NcZgWGIiWQi1chw==
X-Authority-Analysis: v=2.4 cv=KePfcAYD c=1 sm=1 tr=0 ts=6904a68e cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=q4DFcrmTo4ZQpOTRNT8A:9 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: TBxxXB63X17zOtAzlKlhZ7r8BWQbEf0l
X-Proofpoint-GUID: TBxxXB63X17zOtAzlKlhZ7r8BWQbEf0l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_03,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510310108

Add bindings for Qualcomm SM6115 SoC Low Power Audio SubSystem (LPASS)
VA macro codec. This SoC does not provide macro clock so reflect that in
the bindings.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 .../bindings/sound/qcom,lpass-va-macro.yaml      | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
index d3851a67401e..5c42b2b323ee 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
@@ -14,6 +14,7 @@ properties:
     oneOf:
       - enum:
           - qcom,sc7280-lpass-va-macro
+          - qcom,sm6115-lpass-va-macro
           - qcom,sm8250-lpass-va-macro
           - qcom,sm8450-lpass-va-macro
           - qcom,sm8550-lpass-va-macro
@@ -99,6 +100,21 @@ allOf:
               - const: mclk
               - const: macro
               - const: dcodec
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,sm6115-lpass-va-macro
+    then:
+      properties:
+        clocks:
+          minItems: 3
+          maxItems: 3
+        clock-names:
+          items:
+            - const: mclk
+            - const: dcodec
+            - const: npl
   - if:
       properties:
         compatible:
-- 
2.51.0


