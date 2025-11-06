Return-Path: <linux-arm-msm+bounces-80670-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E42FEC3D68E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 06 Nov 2025 21:50:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A0843A823C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Nov 2025 20:50:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5B0B2F7ACC;
	Thu,  6 Nov 2025 20:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XtOdaP1z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GbUtg4ai"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E1A2FB61C
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Nov 2025 20:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762462242; cv=none; b=ae8aFs0/7LA8BZiYxNOrLFaKKk2JRaRvneKJIWI5OfTsgSfPDq5kB8IxQzOEd1ERtWXpkkX79VN0q4tXnxyVHJPvy0JCE5OAMzApFQivn2RGRaVBtfb8Ia8tfxBr7jDlb8uRmTTcpafrPqkxUFBq1plX5uAi40gQJ+GtR8ldEZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762462242; c=relaxed/simple;
	bh=b0JC/QgVlb4XEDG4RFGS7AL+H2pQv9eCGoSbRQd2CRY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UVjRV2iNScoAV6XGDkcuAicUG0GsG7g1Sh/GuirhtKcIeZX9sQuwgRbfVuSvCSym7BNtyh37uu99XVHuU3FKalVtWx0HhPBU/B4FsA/xYGjyDnPZnjKtZV0lbk+yTVmXP/4gLFuF0litSI9hYMidRkY/M7aIVAH4FJc2gOPShGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XtOdaP1z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GbUtg4ai; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A6H3pmi557604
	for <linux-arm-msm@vger.kernel.org>; Thu, 6 Nov 2025 20:50:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kDesZG6/CED7jpvXL9qrzM0XoMxGJBuAq541n0vQcxU=; b=XtOdaP1ze6xKX7i0
	eBD5QWTU9T3sjzWofXLkxcJ+ApO0ZPmgQ0PGELA4dS+vYNfTqMX5OjinCX8JqUAq
	mRXuD+eEqs043Qbq3hBLlIJGpu4NYoxJB9Mhz3nbQyTEpBWoGg60aBBIdLCzkzHy
	IDHHzV1wh2n3g4faKIR/RsohZQLZD8wjeKD23Gq85mIdObkaTibXu19wN2N7ezSY
	7d8mreGji8iJe54hzB2Y7XI9qNJUgr8Hfq1xHmSWyucWYytERjyW+rZ1/cZbix4A
	1IoaxaSHcyQLwLyScyaPiv/G3K6gI0xjIuavXd7gaBCzDQHKzS6BkQu8ZxKlKZdX
	LBMBqg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a8yr9rmgm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 06 Nov 2025 20:50:40 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-29598910dd2so1007555ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Nov 2025 12:50:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762462240; x=1763067040; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kDesZG6/CED7jpvXL9qrzM0XoMxGJBuAq541n0vQcxU=;
        b=GbUtg4aiXAqn1vAm0vTr2JuwO+aLf5Ot7S7pQJ18F5gX/XtxDMZM4bjJD9buDQ3eHz
         /n9KjHZGmxuFmIfsxFNF01L5t139Y5GxF/LqNCrQ3G12zuFmkSMqGU6K43NwzwS22WMk
         +5N+boA2ljHJMVhCt4/EykOatIsMtxO1FUbgfxAdFo1sORy2VIl4T5ejF8ANd4D2qtgg
         S2Crv89qyqENLlvT6x0ao8xJmDDLrPzmpoFZU8ZXd+S4WBSzuwg9MD/9XWidcBwyqd4u
         stP8CEFa/S9MY2DhQ5wKzCPrKcUCF9zGVjNUayyKRLTX2xcd+FYsgtPaOQAYNYgxGuV3
         3P2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762462240; x=1763067040;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kDesZG6/CED7jpvXL9qrzM0XoMxGJBuAq541n0vQcxU=;
        b=ZMznK+Or2b/L2ZW60CSZoJsijkGgiXRpwjezESt60Mpf0lXZA5QnXYcbFlBFpKORVB
         POP6GLXnUqxUUncCpzY9EY6CoPXroJC8diflNGX7deCDdcQWdpD8reG+2Uf3RFnDe7Tg
         TIaolypoqiCpAr+hok8lj/E0wYSQ5ZD3Pp2xKGqt4KzVrQ7nvSCvaOHR3Xbee/rxu6OC
         SAq0IKK5Bmcarviof+2fnYqf72lI7Xw6TzSVkG4x9/pFdIayvU7Dy8qAjQtp/lDsPZAS
         DCy8GbKexiQuSxMkmrbKwbXrXxq/rO+dJEZV9kBzFNnMYTwAHsB3HVWHo0BTyJcLUtVI
         ZlHQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9wJ74F9f0rrY14665TUu2OcDrFCzrH5A40SCi8rBi65/toEOLL4kWkntpICMVQntFOSLhbTnLMES+BjSC@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/lR9q64Jx50ZHkntPptQmmJgFfQZAjD/aVNvhbGgnEp0Gk6Ak
	36ESvP2tnGO4j0B858yt2CAyUn3uXkrBUBbz8evxAfAU+cWqpgiODWbUEzUq6ok5yz4kVDQ2ifs
	QNOTy8j/tTSkSmfpRukrfZkzvGiQK/Zlr9/mMx5zAY0jF6HAnHqc1nVtj5VMna0CU+5cO
X-Gm-Gg: ASbGnctWVfeEm6LTcSl+PZ5kZmkDPjijL4lkDGT7aeB47YXK9z/EKFveOPjut7nI6fJ
	lmdKrZ07Z+o6wLaxLN7X0lvp2N88bsGEtXuUtW5Oe8U31ghKtvW9gixyZE+0YnvgBc+TInbQ8xb
	hz7/uXermy/DJfLFkRWw5QblWlnDaA8b9Pjbl+K2IP8U54yvvgdv013ENMuoeil9ACw2tsP4CB9
	JmLD9bbNoSlKtP6AEImuvkjvjwlDHfKmqjoMByBSfUGCjLXiUU9L52LRzi9OWgL86nsmUCGbR9Q
	e/2LTm/CgdJ5BDY7XUXj21uoqzTFZZ5MXflpXwoCVemjQzHPFpTujIQ5MMXNloqYP8r/0ODSYsC
	8LQyylcGYBpAckJp2juLgDRE=
X-Received: by 2002:a17:903:388c:b0:269:b30c:c9b8 with SMTP id d9443c01a7336-297c048bd5dmr11176925ad.56.1762462239685;
        Thu, 06 Nov 2025 12:50:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGyqMq8oXPm8KMRuVdssx8T94PXld7l7/+iih8jTurPLCDECgsDxR6DM0VmHaPkbu7+iLvRXA==
X-Received: by 2002:a17:903:388c:b0:269:b30c:c9b8 with SMTP id d9443c01a7336-297c048bd5dmr11176685ad.56.1762462239212;
        Thu, 06 Nov 2025 12:50:39 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29651042c24sm37408815ad.50.2025.11.06.12.50.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 12:50:38 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 07 Nov 2025 02:20:07 +0530
Subject: [PATCH v2 2/6] dt-bindings: display/msm: gpu: Document A612 GPU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251107-qcs615-spin-2-v2-2-a2d7c4fbf6e6@oss.qualcomm.com>
References: <20251107-qcs615-spin-2-v2-0-a2d7c4fbf6e6@oss.qualcomm.com>
In-Reply-To: <20251107-qcs615-spin-2-v2-0-a2d7c4fbf6e6@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762462219; l=1701;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=b0JC/QgVlb4XEDG4RFGS7AL+H2pQv9eCGoSbRQd2CRY=;
 b=IKm+r3bn2wtvdU7Ru1WSakT8tsBkihaAlI1fqDLfI5tHULp8KMfKJydUyzPZSO1P/88hnE2Kw
 n3DkKJtDyIrD8yP8C6E86emtqqvf092kuBf5b9O/wH4WNLv5DoyJMho
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=DrpbOW/+ c=1 sm=1 tr=0 ts=690d0a20 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=SkoZtctDx9gcCqASqUMA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: LtivdhtIEg59iEnbAL0FY7z9ODmaDrYd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA2MDE2OSBTYWx0ZWRfX/+34g3JKm5lK
 AI8Sfu1YOWxyBGSu+tiF4L+yB42+8hfG1qxLYgdi/elTxjPSkugQuQPdy6GFJnOFonkgCn265bg
 IKWKLGNw0bZp3IOREfNkXysFA5Xli6I4LlmLuuWn/K6nvgljKRy3XWD6edoLsenwJET+p1o0UXH
 KGiXGwE7Yc3GILl+kJfNl9ItDEpIDOtTA8eDskFh9iSHXvT7OJQ7OwT1xp2Sk3nzQ5movRoRoqa
 AC3x9KsQsAY9hHexI6omTqEpnzl3oHvSeEyDDpK+7GUxjAf8ATEIrUdHB0VHOMIQlJNsM3oRp5l
 kPLNLeJdb47Kpxr26H8leQBhNc2v49irFpJM7TMkmt3GFHLbTte702ATH9w6baNgwJJYBU9O8zP
 U6VU4RqfmNd0OdP5B8eUShY2HbuDew==
X-Proofpoint-GUID: LtivdhtIEg59iEnbAL0FY7z9ODmaDrYd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-06_04,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511060169

A612 GPU has a new IP called RGMU (Reduced Graphics Management Unit)
which replaces GMU. But it doesn't do clock or voltage scaling. So we
need the gpu core clock in the GPU node along with the power domain to
do clock and voltage scaling from the kernel. Update the bindings to
describe this GPU.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/gpu.yaml       | 32 ++++++++++++++++++++--
 1 file changed, 30 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index 826aafdcc20b..a6bbc88e6a24 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -45,11 +45,11 @@ properties:
           - const: amd,imageon
 
   clocks:
-    minItems: 2
+    minItems: 1
     maxItems: 7
 
   clock-names:
-    minItems: 2
+    minItems: 1
     maxItems: 7
 
   reg:
@@ -387,6 +387,34 @@ allOf:
       required:
         - clocks
         - clock-names
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,adreno-612.0
+    then:
+      properties:
+        clocks:
+          items:
+            - description: GPU Core clock
+
+        clock-names:
+          items:
+            - const: core
+
+        reg:
+          items:
+            - description: GPU Reg memory
+
+        reg-names:
+          items:
+            - const: kgsl_3d0_reg_memory
+
+      required:
+        - clocks
+        - clock-names
+
     else:
       if:
         properties:

-- 
2.51.0


