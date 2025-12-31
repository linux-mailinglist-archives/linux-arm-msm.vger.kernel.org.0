Return-Path: <linux-arm-msm+bounces-87077-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7097DCEB97C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 09:47:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9A3E8307D861
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 08:46:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E28D2E3B1C;
	Wed, 31 Dec 2025 08:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b8ZDTMjA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HWlCh+TQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D1E3112C4
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 08:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767170765; cv=none; b=tUjmhof9WNkYv/hOdSfPYoIz5kaBB5GF1m9OsD83fvzRTL//S9iCZm++2gfaAaJhbFjXwMMummt6FMeZO0xiK68A+bias1wyQM/YkQJczAgDabwr40p3daII8P2T/l4xE0O6Tbwt4MeI9MMdQxQgt0lqeV//LoNh81QwZ/nGyzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767170765; c=relaxed/simple;
	bh=b59YgubgwvsRqSeGZjcLSpPFFQKVSgA7ctQ5ydCIlmI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eLFj0Y1LbaUrvc5pZdDeMZM1Gug8wfSANatVtt1ALtfPQiYG536OQEyB3Deuik5iOruJnNtw3qlqTDb5h2FqphEEewaM0o6Jq4zY1txYj5UX4bJS7ccnM+lNsBIgu2Ij2cWCVEu8m/R5YdzU96QI2njdN8ECuN890EEre/ETT5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b8ZDTMjA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HWlCh+TQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BV62Mco2050665
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 08:46:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CPWRcnVAsBr/GyDsy1wxzlUy7eBR0cR6vueWTgWJCOc=; b=b8ZDTMjAV+UprkMk
	lGf2q4930KFS1mLQcwunPyXT+0dDHB1M/eNURrx0Or5TOZCTbZnYDMmP+OCrShW2
	OVWJmMuTFV5s8/iurnXfUPO5DOSy7NSl1pVswd+FCkQV7byEQriSWGr3PxNe1SZH
	F8KMZ3iu/J7fuf7m974j2Pue6LBj2N847jsUB39CLogD3uEZsgwQ1E/O9ZfBfMuh
	v1qZEo6bp2DH0M04cHn/CKkuNdMdEAEXAV6JeyREeXi9L+tbn3gB69J0HQsTkPfQ
	ylMYKXoros8Cub0kUa16HT3r/0dkemqFE4Bfw62d3lyT8giB1fiTu7wdandgNENR
	N6Q7rA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bcx748963-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 08:46:01 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7c1df71b076so20401453b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 00:46:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767170760; x=1767775560; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CPWRcnVAsBr/GyDsy1wxzlUy7eBR0cR6vueWTgWJCOc=;
        b=HWlCh+TQrNtL6nE3LZ9FVNACNDjVYLCnY75/r1mhgYOHO2xbHt9pD62EiRnywcsJhd
         zfcYWlPe/TArYH3dM+ltn4n2jSw/mZlpBN1H8RAz01opANO3DhRgKblPm1hEHfaMsrBQ
         4kFPaciCUC1X9WF3CmEL9JEV/fS6k/gMdagJgV34JO2CI3I80mLiZS0VyoGDfHjmD4LT
         BQmOXA0tF0v03bQaOk0H+OgB37LiSoMsupwUjKSBPojdJXcrFInK/3rjGkfD8B59AKfl
         Igdebvsy+6T57MzoMCxOUpbCbaxY1i5cJGVtq4O4ULYFnWjBxImMVM4C+8wIEgDSVyT6
         u6wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767170760; x=1767775560;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CPWRcnVAsBr/GyDsy1wxzlUy7eBR0cR6vueWTgWJCOc=;
        b=WMR+4UQLWzQ+yehduOZlcFyTCyVsXxsfooVPhWmWRsMD+M35uBJkBFzPCVmFZB641f
         6y/+Ni6cXQdE4+1Rw5pueO/Npa+p6VSVfZoVbSDvMt+3vPnY8dt80Eegq+z7IySIId/0
         yOBGLr63bdvKVka3cw9NbH6T9VAYPWxcwFsmXRSra7FCgZc/vNfYnG4WhZ447t27XOai
         g9bnEIGA+XzmufHdD6CdLl+66ictI2HqhGLuueOInlFfIVBHfYaqIxmOKlNaNHPfWl+t
         mdFBkxTVOXSJqpU67PM2mjKJJxDyCPI8L24VdefomM7AkcVzKqPcwr332MN9I6OPcson
         wtVg==
X-Forwarded-Encrypted: i=1; AJvYcCWgWkaTAvJDJRpDx6hi6SiC8QU9nF5ophz3N18DDMkRbTr3f1b4YZEK2uyXTQdDEIot1Z310YXnb3fQbsF/@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/rpKX+f1UqhnHJyBAr+eShZky3ekyyrNCOuMp2XriJA3F+MyO
	1k9wVIFE2BolDH/jdr7lWDwPjpJvFUG4dlEMyNcfqV7ZdpnMSWHo4+6SPuxe9idCMaHY4thXHyK
	31zAm1fLy7RHYkSuG0PABszdaLwGExVoGu7yC/dOmX+FgteDFeaYf+hhnjm4fkVpGence
X-Gm-Gg: AY/fxX6KU2740baNMnBFaPZJkLnmARNkl2XZqN1SaaIXvuEQnMVOzdVq9/lkcPsHmwA
	5ukLMNkgAdLYrXSIVnWMXpYWm5w9358YiJ0nrt7sGBToGZVOBDED29Z2BWBLiA5Ye1RTPKTHxRh
	/i4CYb54d+DpRwnoYrvWonhv7IIBhNq0rV2OuN3Di+6MMREd0B9e1RqW6Z2836/TuOEbrREOWPf
	aRgdGtGlWlZ8n25eCIvO0zSIvEDk2x5pE6Hq2JIAEF3A/J2cviIpblTvd6ibbwUCqmFjxFB9RJB
	qjeTH81kYeJjWA5bC8dMekOJ/F93X2G53VvKUbWG227KdBuwqgyEEW/ZvMrITpJ4f25mnXHXG8O
	68ESXSMovdBC4l7xR7074gBjVLIVtlinbEw==
X-Received: by 2002:a05:6a21:e097:b0:371:53a7:a4ba with SMTP id adf61e73a8af0-376a7bf0c5bmr33126315637.30.1767170760457;
        Wed, 31 Dec 2025 00:46:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEPOg4abWQAItTWlyZTTd7dHPOf9V13Fb5IfDDm9V71xWCcXMRJSLtxI+U14N0Ld/snSkxmwA==
X-Received: by 2002:a05:6a21:e097:b0:371:53a7:a4ba with SMTP id adf61e73a8af0-376a7bf0c5bmr33126286637.30.1767170760005;
        Wed, 31 Dec 2025 00:46:00 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e7a018eb5sm31356070a12.16.2025.12.31.00.45.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 00:45:59 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 31 Dec 2025 14:15:23 +0530
Subject: [PATCH v6 2/8] dt-bindings: display/msm: gpu: Simplify conditional
 schema logic
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251231-qcs615-spin-2-v6-2-da87debf6883@oss.qualcomm.com>
References: <20251231-qcs615-spin-2-v6-0-da87debf6883@oss.qualcomm.com>
In-Reply-To: <20251231-qcs615-spin-2-v6-0-da87debf6883@oss.qualcomm.com>
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
        Jessica Zhang <jesszhan0024@gmail.com>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767170740; l=2589;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=b59YgubgwvsRqSeGZjcLSpPFFQKVSgA7ctQ5ydCIlmI=;
 b=kmZq4Zs08vLy/inDxy3PCYbL391nZJKFzBZh8G/C7WZIwdj0BYntTnVC4yAervS5lHaC9a5YZ
 KW4S5S8Kt1jBaqXpgIf2jXNdr5iXIjHhRLd1AEQ0F3HuTB7RCv37vlU
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: F1WgH7RbGPcBNCCU6PfWgjCHRFqqLxin
X-Proofpoint-GUID: F1WgH7RbGPcBNCCU6PfWgjCHRFqqLxin
X-Authority-Analysis: v=2.4 cv=HNvO14tv c=1 sm=1 tr=0 ts=6954e2c9 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=SNFa__NYaeNfRMWcEAMA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDA3NSBTYWx0ZWRfXw2DFmPqlbjYI
 ewCB5Zzox3NjtmWZ4GWJr6sVLUlU9b/H04hhoM8saFuztrgZlcliT7rnOaexhKEORIqPel+zgDg
 SdBYGd42C9pHcFjzRbYTMvvfLEhNR37h+yRtMtyPNnj3iUGkMfEKss0zmzxKw6+lQfd0dq22G8S
 XwK2fArJcWExMrvNmLD358a/EKwrfsnyu/oo61TXUVA+KmLLrSJiQKAsI0D0fH8mIzkDB1wZZcJ
 nTDKNO1UcE29dKGN/wKFeiXxt5g5y+l/tkmWx8EhT5SQ3J22MgGHSWwnQOAB5ZR7o97vE12sL7i
 129z/7p+XafjLwhsTUzTITUuHpf6JojJWWuanTuqnqqRxzR+a/S86IqzWATpAiErKP2xIqWIJdB
 jzQGlTHgD+cT6n0SmGoI7j0obQ14jRJMVsbqNWBlBD4ki4XwGW7xurrOev7tGoGjp3930MDkmbI
 4P87Rt2lxquIN+lpAOA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-31_02,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512310075

JSON Schema conditionals can become complex and error-prone when combined
with regex patterns. To improve readability and maintainability, replace
nested if-else blocks with a flattened structure using explicit enums.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/gpu.yaml       | 56 ++++++++++++++--------
 1 file changed, 36 insertions(+), 20 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index 826aafdcc20b..5c12b5aacf8f 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -387,26 +387,42 @@ allOf:
       required:
         - clocks
         - clock-names
-    else:
-      if:
-        properties:
-          compatible:
-            contains:
-              oneOf:
-                - pattern: '^qcom,adreno-[67][0-9][0-9]\.[0-9]+$'
-                - pattern: '^qcom,adreno-[0-9a-f]{8}$'
-
-      then: # Starting with A6xx, the clocks are usually defined in the GMU node
-        properties:
-          clocks: false
-          clock-names: false
-
-          reg-names:
-            minItems: 1
-            items:
-              - const: kgsl_3d0_reg_memory
-              - const: cx_mem
-              - const: cx_dbgc
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,adreno-615.0
+              - qcom,adreno-618.0
+              - qcom,adreno-619.0
+              - qcom,adreno-621.0
+              - qcom,adreno-623.0
+              - qcom,adreno-630.2
+              - qcom,adreno-635.0
+              - qcom,adreno-640.1
+              - qcom,adreno-650.2
+              - qcom,adreno-660.1
+              - qcom,adreno-663.0
+              - qcom,adreno-680.1
+              - qcom,adreno-690.0
+              - qcom,adreno-730.1
+              - qcom,adreno-43030c00
+              - qcom,adreno-43050a01
+              - qcom,adreno-43050c01
+              - qcom,adreno-43051401
+
+    then: # Starting with A6xx, the clocks are usually defined in the GMU node
+      properties:
+        clocks: false
+        clock-names: false
+
+        reg-names:
+          minItems: 1
+          items:
+            - const: kgsl_3d0_reg_memory
+            - const: cx_mem
+            - const: cx_dbgc
 
 examples:
   - |

-- 
2.51.0


