Return-Path: <linux-arm-msm+bounces-73184-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 27374B53D9F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 23:21:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7FEF41BC3D7B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 21:21:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A98A228C9D;
	Thu, 11 Sep 2025 21:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JooI/OAX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9648A27979F
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 21:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757625670; cv=none; b=dCQjFHt6Et1tUNw+0cQjE4o7hDOLyLVLU0reFYqvEqJevvPzyN7X2wnVX/XksUEvggLknhqZFTW4tAgiUZoX4FX0xlPIXtQIWdmAC5hRArO2l3/C3mGdbX92XqVebQWkQxGNmtitK/RlDfzXFYbovJ7LEJnxZdpolEfwaGUCMBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757625670; c=relaxed/simple;
	bh=7HKObMcS0bG/xYgR+s8o/QEbbBnC+A9rwJV1ihYzxO8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=EimvUj+Ei8kLwCGiH4QTe8mYJuNFWJ7kig/m2w7iLhIcMIjxaRSO3FtxkiIdOz0HFgqog5uBdDk5Lg/OQHcfAj+/3FUu9sbkh60FGp8DalGkVHBpBjvL4SvRvtt8BsiZlrHjEEjwpvZmqC6U5fnd8Nm1rfOftZR3Ce0WNLmksX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JooI/OAX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BJB9x1006616
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 21:21:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=skpxVi02HZrlESlDioFv56nkinK9bp1CNjc
	w1o5RuJk=; b=JooI/OAXMknJIfcjBABD+zZ5hZ9EOmm4NtQO5fr08E0AbOPJ57l
	MJxCknc1H+8zBYTPLk7DraMAw+uVn9rz2SQV6SoMjm7R5/VmXk6Ho3+Q5jz7SakG
	tNkb7UMoxwMPfggdu9j0HniygkdePyeTDummt40dVbsVAU7OmRAlpe3AwL/TJa7T
	2hWk5pShmB/KDMOS0QYUwTJ9CqyUZcHyMyNlgx0YW65Pr2YO1nTPheLHobi5f4EE
	Lhvv1IdjhlpybsOL1W5tPXPIkf0GABICOoSorxHXEbcb0kFjVzUA9WnuFJ6kuRWr
	ccAhXHRypg6wMe1gYB5gN8qO0JU/2cmb/lA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491vc2dcqp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 21:21:07 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-726aec6cf9fso33043666d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 14:21:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757625666; x=1758230466;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=skpxVi02HZrlESlDioFv56nkinK9bp1CNjcw1o5RuJk=;
        b=GC//7eJIok7jlXezVGjDvNH7ug2hfY1Keh2KoOsLv61btHc63wXGBBdLtZH9hMHnlq
         v8ZL/vtIfE9HA/+V2XDi7G1hmEW3gEgKhBMGk2zqxTRQLlKBK7ncm/9bWInC6G0RzEmZ
         rcdhu+kmCh9pZ6/0OjGgDDadJ2wwWp/IqoQWJ6sP5bkBJUuS9EQ76IYjK92sId65P3hj
         d01H/9747qDtYn1lokWL4MfeoU9U7T4xqau9wi46jr8mveD5Nfa9HnJnjAbnseoC7xzr
         p5Lj1wELofb/WYvl85hADq9mFQ8p4jDsRFmUEeRMpnOIi+AJktA3aF1CIONAX5Zx9BQd
         MDUA==
X-Forwarded-Encrypted: i=1; AJvYcCWFfyzAwiaKOcpCXbGhYfXIomp7sYNWRqtuo9buz8fYtMeMiHuW0jnui0ks8EZS3u95FWi9iH5uTnjqr2sz@vger.kernel.org
X-Gm-Message-State: AOJu0YzN69mnyk+yaGovO/D79lDRTCNQGJ25t1V/tVXAqa3Ts5M7SUIX
	XO98ZeFPtjTn7t8PSv78TnKc0AZSTrtuTBXC1chp/xcaBWX1lLog56LRbpdAz8YiGD6ySPQqnFW
	8nZkOYU5G9zTFTb/etRmFwCvl1z/7Bp/JQnYIYdkGU/I/mNtcpuzsMEa6r4Teb4F6Z4Fl
X-Gm-Gg: ASbGnct8HcpLpXdpT0H8vY+Ba+Sg0YkxsxO24TKWAux8KPgo9gpCEpwKOqK9YOikqTy
	zyjpMxqYE5jvN5SIGY28FI+2D8qkRr1afTj/RfqKQpVR2CBa/avLTFdC5FTaA3Iwvcl2al71WOh
	OxgOfTIAWaSHL2XmNZw0uFc3LrOLA+xIZ5jm2o1s6j69WzDXGaWiPEczP2WQONyI4TezUdHZAh5
	LemCsKHzOZoDHw9kHqpbvpKyF4tvfY9L898vI4JWrVJkuj4//ymx4fFqmXEWDWM/x8t/1I47ew3
	IsTkYUbQk50bbTjqHvcTuB1Nn045YTao32YB6YQ1m7SmWgKStP4lFeCiL8Wjp6D3MRM/Ok1Hv7s
	=
X-Received: by 2002:a05:6214:2b09:b0:70d:bcbe:4e87 with SMTP id 6a1803df08f44-767bd287b56mr10462456d6.8.1757625666258;
        Thu, 11 Sep 2025 14:21:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHHpVcUbJt6w3i2oI9zDeKvQh73YEpqoT8PihoTUvwa9PwTBX7gGMHfKElQYoKWqsZnNP03vA==
X-Received: by 2002:a05:6214:2b09:b0:70d:bcbe:4e87 with SMTP id 6a1803df08f44-767bd287b56mr10461536d6.8.1757625664925;
        Thu, 11 Sep 2025 14:21:04 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:3c22:d6b4:15f8:475e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e0187f0a7sm21843935e9.3.2025.09.11.14.21.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 14:21:04 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: andi.shyti@kernel.org, robh@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH RESEND v5 1/2] dt-bindings: i2c: qcom-cci: Document QCM2290 compatible
Date: Thu, 11 Sep 2025 23:21:01 +0200
Message-Id: <20250911212102.470886-1-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=FN4bx/os c=1 sm=1 tr=0 ts=68c33d43 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=NlPZ1nVzr820ScHG1asA:9
 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: ISf95wQ79oc2-HGXAS1aUhEWK3P6J0CX
X-Proofpoint-GUID: ISf95wQ79oc2-HGXAS1aUhEWK3P6J0CX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDA5NCBTYWx0ZWRfX28Et5FUk2/PJ
 I3KimXUNUNrkYi7T/9cWJcnWf1gusNj1tvI1mPUyDMKfaLCMaovshtTXKnaVK+PnFX/JVvmFprA
 fWvK2P6ehkFSUjL3n7HJetSJ9AyB8PdefwOIfD9Tik3fwSyl6w0GuEABzKS/vfW+VqotFxaVil2
 1+2YOZ2Ls8AzN6jIQapxGO7f0+9Mei3e787XkQ/xIVnvT/b2ZWH4t6Dg362LtTyl6n9CppGzrG8
 xU+bolQFTaiUDyYineOGv+4otiy9TM1mQEtZCb99tdYK/qNBAMHJ9o16inkgsenScvpPk7mfO+O
 PmOtck3DNIYSS5NKYEUWFBL6A5zpb0ObX8f1FMpJy4sGdCduEUOiC4KA3j7uYHFnZB8oL5SLcyk
 qoJ0VULs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-11_03,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080094

The CCI on QCM2290 is the interface for controlling camera sensor over I2C.
It requires only two clocks.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Bjorn Andersson <andersson@kernel.org>
---
 v2: Reorder commits and Fix binding testing syntax
 v3: Add clocks minItems for msm8974 as top-level minItems changed
 v4: change AHB clock name from camss_top_ahb to ahb
 v5: No change; Resent with missing recipients

 .../devicetree/bindings/i2c/qcom,i2c-cci.yaml | 22 +++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
index 73144473b9b2..83b13370ff6c 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
@@ -25,6 +25,7 @@ properties:
 
       - items:
           - enum:
+              - qcom,qcm2290-cci
               - qcom,sc7280-cci
               - qcom,sc8280xp-cci
               - qcom,sdm670-cci
@@ -44,11 +45,11 @@ properties:
     const: 0
 
   clocks:
-    minItems: 3
+    minItems: 2
     maxItems: 6
 
   clock-names:
-    minItems: 3
+    minItems: 2
     maxItems: 6
 
   interrupts:
@@ -113,6 +114,7 @@ allOf:
     then:
       properties:
         clocks:
+          minItems: 3
           maxItems: 3
         clock-names:
           items:
@@ -120,6 +122,22 @@ allOf:
             - const: cci_ahb
             - const: cci
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,qcm2290-cci
+    then:
+      properties:
+        clocks:
+          minItems: 2
+          maxItems: 2
+        clock-names:
+          items:
+            - const: ahb
+            - const: cci
+
   - if:
       properties:
         compatible:
-- 
2.34.1


