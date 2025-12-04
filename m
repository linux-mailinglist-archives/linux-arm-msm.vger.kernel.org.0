Return-Path: <linux-arm-msm+bounces-84372-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A7982CA3D59
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Dec 2025 14:36:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 45DE330A7A74
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Dec 2025 13:31:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB184344059;
	Thu,  4 Dec 2025 13:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RZI0wMG4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KASDER3h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BF0B34402F
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Dec 2025 13:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764854560; cv=none; b=B6ueajnsHNYd9McprPvDPleVDSSFmzXTepxajyL7Z8X2G2icFinshl60XnqYrWNVNPneXBdsFcVQZhASQac1rr+ONcjBvTvlj4WYrL5uzPekguqsDrCXrxwdE4NKKUgiA2Lus+NbM01hKwwsFU7HoVaUjA6T6UI2hmZ2YmH/bRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764854560; c=relaxed/simple;
	bh=nllHIarzQ7x1w4cIQ+mzYrnC4ouTjUGWchGSLlkHcQ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B1j+ABb5iVgU+FUgFvnxsK0Vpp5jgsYmTVF4XhWNF8+oKnx94HSJtG+XY0owzv1QsAGvYuiTsOTNyUglpromxEBhzIF+uPDwN0c58GO0iQcMGkUw8oNVPEv854Vw1jV0g/qjfL5+Fkg2WeRyzEE/SeGD+lp2GDLVzdUFyZX4Gt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RZI0wMG4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KASDER3h; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B4B0xdT614240
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Dec 2025 13:22:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xrwxcmbJg6cVbMantUgzlL+o9/ix/U7MTWE7Yt9Jblg=; b=RZI0wMG4AwNZj/7+
	D6o41fFUa8EZodi/EZa5IVDSYUjbfaP5J1+AkNFHtXKlcefV0cr4thaNSbCxw5sR
	vYJt47NmR5pN6C96QywUX1O/37gaOCJywANsQ3oYgImWcAqrft58Ja3oIG/WiNJt
	V0O8HBWp4lqqIrWRjHtEUs3NJn00yiojqdLakAUwn1iSJvKGcgmES66LIYVbVO5q
	QSckG2iNsYv5Ai3SmOlYBpmZ8m5Ey5WlB4zt6VZHW/J5lGlVGYLAn+R9zcsLCWfH
	h+8mXe002XyxDyVAmNqeudxp4iqFYcYV+IZUgmhpskZxyalkEr7HDBd17xE/s+a9
	lQvblQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4au9298byn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Dec 2025 13:22:37 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3436e9e3569so1561051a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Dec 2025 05:22:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764854557; x=1765459357; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xrwxcmbJg6cVbMantUgzlL+o9/ix/U7MTWE7Yt9Jblg=;
        b=KASDER3hrwunuAH3O357AiQRqudM80ZvX/PkMfwXNzNiM1uzaP57Ccm48z8cyi96re
         ZDaBJMHRZ1a99iJ27vay7uR0pAyX/FXsbUMTJy2JlCJqg1dbb64BPc5VynKxugF8ip1z
         pGXApLlqpKF5DL1Cc9M6ln6598p7PfvDbVrveTzxQej6dCBnkd2Eq7f+PUNTOILBqHVV
         jnyU4MwwuFHYPHO0LDvT2QgBqX6uCXKPa/A5Q4wTOHMzYe2+wTWfuxWbpy8lUFqEasWD
         0wL4ygDSInS5AhPGUhyrKu5e5efQcn6+j2NAz2W7JWQop2qe45r8qgLhTkpSnH+A5ons
         Lb7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764854557; x=1765459357;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xrwxcmbJg6cVbMantUgzlL+o9/ix/U7MTWE7Yt9Jblg=;
        b=XU5ePTgqq2pRt1unPfVRLLeA4Y1uodyB0ykHU5C2cJqm8NK2bVGMyDCT8MUlMonrW5
         UDMthCilNCiRxsXvIC96XG1+HmqR1ocow9io5/UObT+J8Y3kvNp7dsKOGJbejYEdS50r
         GSM8S7vNngL7tb5femTlLnxAbwuUNe4ZgeBr8V3XWUAxoS9P8NKs298SqEqG7TfHFAtb
         FgG77dfwMEUk/iOS7y5d0i8oiZ5FIknFuwxsRwLeAyfoXo/owyVt6tdzVmtTRzpkvMwB
         YotKwVi3bQs84wTHGyLLm8G0X0v2CzI5Mc4MaO006GVIyQ/GcXn1JAwXA/z1rflAEyjL
         qB3w==
X-Forwarded-Encrypted: i=1; AJvYcCW17lilH9LZ2Xg5XsmXdoe19W1zOxp8ajxTOGQsti+p3cC/NgUMOyfkJXKvHle/ooLmpHg4S+NNiKQGqV0G@vger.kernel.org
X-Gm-Message-State: AOJu0YyvePZvdIsvYNavfzV2lujo/RK0h+qUk+gnKAhd9qSsFRdNTZQp
	JNex2YpqEHI011C62EGnc5Be0ihqsztosHzra+fABFB3ztO/TB6kTVqpTp/9XyorrC2TmA49pfl
	IRcxwaGrYfeYqusLqBi05u4pTY4dIWzoHh9hoJxTD9w2MVtMgq2fscAGozkVDndLaNhfD
X-Gm-Gg: ASbGnctU8sJb/g3ajb6yuDVrsQxeB2rV8cQmwhcoIqZZVbxU47Fi23spIHOA8/MkwZo
	MMg8qWhSyJY6hFt/X+P4WC+mMSfX3//+nwS36NjeKfkVl1+f/YHqHO1qbnzK6n8gt2oGeWWONEp
	fyTmedWNzqa9lrTttxzqyyOk83YLU9nkjTy35tDCtG+73JwPJjpf1y3h1HZwb6Txzj666gHL9+D
	fYQIS6CxMZIK5ltjGWW/KGd3oFcnsiEbkq4ckHrmZbqxPUXYG+zQPhT54KAhwYXGUgyVN2gsjWL
	Hs7OLjx3DVYHHhJvCzekBIvH1y4B9txE87yX2X9/gAQbGqN/aLkJUk9OETv3GgvAJUTUv2uEOwt
	VGgN1F7aFXMqTbsEESkrD4lKc4W/nI9GCcA==
X-Received: by 2002:a17:90a:e7c3:b0:340:a1a8:eb87 with SMTP id 98e67ed59e1d1-34912710eabmr7174313a91.35.1764854557309;
        Thu, 04 Dec 2025 05:22:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHpFOlNn8OCsRbojUuDdPv2uX0wdMKR06SYjf/NDO7mAHyORuIFXRA5cb9fpAz5sy67WHXGeg==
X-Received: by 2002:a17:90a:e7c3:b0:340:a1a8:eb87 with SMTP id 98e67ed59e1d1-34912710eabmr7174267a91.35.1764854556850;
        Thu, 04 Dec 2025 05:22:36 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3494f38a18csm1914740a91.1.2025.12.04.05.22.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 05:22:36 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Thu, 04 Dec 2025 18:51:55 +0530
Subject: [PATCH v4 3/8] dt-bindings: display/msm: gpu: Document A612 GPU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251204-qcs615-spin-2-v4-3-f5a00c5b663f@oss.qualcomm.com>
References: <20251204-qcs615-spin-2-v4-0-f5a00c5b663f@oss.qualcomm.com>
In-Reply-To: <20251204-qcs615-spin-2-v4-0-f5a00c5b663f@oss.qualcomm.com>
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
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764854530; l=1749;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=nllHIarzQ7x1w4cIQ+mzYrnC4ouTjUGWchGSLlkHcQ8=;
 b=J+2G4HYsxfq8jhSbC6KgkFHZE1eJA9Ko/oM+TQBKINIyBHJBvx2KT+jhZ11TLw09fjxQPYgrG
 7NCGdJBcVuGBQGSmsOIWJcOTpnbwXOxovcw/JAPq4ypcoENUdePtqDq
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: eRd38s7FeGF1h6H6DJnM12ebyDal46L2
X-Proofpoint-GUID: eRd38s7FeGF1h6H6DJnM12ebyDal46L2
X-Authority-Analysis: v=2.4 cv=UddciaSN c=1 sm=1 tr=0 ts=69318b1e cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=SkoZtctDx9gcCqASqUMA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDEwOCBTYWx0ZWRfX53znjqI3LhT5
 yxNjXwJorozE4EFOk5Pod5CErlfYur4MqAs9w+KiCLm31HqDw4NxQ8uS4ptSwpvqQOJRvSvOQn/
 vaI2c50JKqDBSc7vADOrWgN6RnsvyejQ2ZKBVHC8HHnT1CyBc6y0sA0lweCweb6ZJpdUHu0tfbo
 K6TmEBSLhZuUkwUPsF5JvRcfOmhJ/fQMb+dcMF5AmZBVEhO/v4tKN+DxqGnPL0rz/IqeSS/NdJb
 ZaSlNC8zQHnci2c6I3ey/e4hv7bA0JoGKTVAVOhaa2oYXS0YnU9RSL8B5vUliG5W4Vy71nur0s1
 0kEUaTFvohuG2oDJKfho84JytGkw8zzIXpp/diSCBfofdYZv2KxD/Kk4vuwhcDJsLPc2XpNKIzq
 uT9n8ar7hSrhxnUQi5cex6gctGmmmw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_03,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 phishscore=0 clxscore=1015 spamscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512040108

A612 GPU has a new IP called RGMU (Reduced Graphics Management Unit)
which replaces GMU. But it doesn't do clock or voltage scaling. So we
need the gpu core clock in the GPU node along with the power domain to
do clock and voltage scaling from the kernel. Update the bindings to
describe this GPU.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/gpu.yaml       | 30 ++++++++++++++++++++--
 1 file changed, 28 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index 5c12b5aacf8f3ff64ca2ef97fb0dd6c3a26a71bc..5d5ff4307ee7ce5464afc5233f03a8bd1daaab22 100644
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
@@ -388,6 +388,32 @@ allOf:
         - clocks
         - clock-names
 
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
+        reg-names:
+          minItems: 1
+          items:
+            - const: kgsl_3d0_reg_memory
+            - const: cx_mem
+            - const: cx_dbgc
+
+      required:
+        - clocks
+        - clock-names
+
   - if:
       properties:
         compatible:

-- 
2.51.0


