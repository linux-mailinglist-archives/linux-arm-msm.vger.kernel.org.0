Return-Path: <linux-arm-msm+bounces-79516-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E87EC1C144
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 17:30:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D6B804ECA27
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 16:05:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB8E434FF44;
	Wed, 29 Oct 2025 16:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fp4KlcOi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WuhnKCsc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE6E346E50
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 16:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761753687; cv=none; b=YlnrgIJz363kbdt9b+q+yjoA9hNGHwYYirxD4+EaDFG96ZGSLBlGB2/jLP91XuHZh7/StcUgn/gs1HMg0306oa+SU0kYvw/X4c9H6PInsrAWON7KCmp1Ul7UX3Rog7kgS4qMTGmx1/HHImy8WzQxtt1lGO+9x0G2xThUsGNHRKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761753687; c=relaxed/simple;
	bh=EKU/HsGn5C1um2y0d1RTOlDdIIAAM6JbAG4htV2yCb0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kzyA8I5pW7q0FchTjBEUreYobAtTTa4k+7TkDjSBPO8n9fEtxC1+2OLPUg0kHMN6CuhibPewGW4X818JfiJB50r2DRvwB5JNtd5w49eQnzgCuTcodi+TiY6eQZ+nCPpuQSvKnubYmkIqzbHngLHWTgDYwbU/MVbjhXF6QXUrSfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fp4KlcOi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WuhnKCsc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59T931IP4155120
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 16:01:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=IEq2aSb00s4
	qKXheRiZL2KxJNF7/Ul190P2t2smNwvw=; b=Fp4KlcOisn08BOseA3d2L7cvsCh
	+XpBrZOspxy9+Xgbu+dU0wa2K2vKPOtqFvNgvjGeX50hQCwyczD6UPIKVci6Z8yR
	LtWEj2lBNTTCQRvodytoceCXnPiiFH/SnZn8F5nGAujRGdkByChv05TrW9Doe+uG
	u1RqPO4OtY1SDq/73NvjxToORamprtc6h+sFnF7b+lUqjofQglI6yPagrpVYesRb
	il4Mzuc5mdakde9uvcnyJ/P+oUBOxW+vXKy+EUWoedtlO4XOqHfOiUNRnlTUy6zT
	0tK2zzEnTfwMGT4Z4qogmS6FeLSUBlyhqs1eewbCdlNn1vGC32DV5uT42qg==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3fy0s9q8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 16:01:24 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-54aa347b2e1so16675717e0c.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 09:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761753684; x=1762358484; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IEq2aSb00s4qKXheRiZL2KxJNF7/Ul190P2t2smNwvw=;
        b=WuhnKCscsOlIFIQiYHpYWyXepL7haAUEmXpti2R7FTYclstQkV7dhV9bGLJAS6gdNj
         yXwNTyLrlYO8uFkRJRW3KeC07N3c/vc+GU1r7sT4DqTFQ8df0oHJz853sPu/WxpOwVo5
         mxdcRr3N5yM3IXjZarTfkX0T437dyBfgJ4Bt/K32nRvvOFrjmWqTuM3MfBL59+LFD+Hx
         dbY+SgGUbwiLd1G3A1L8FvNvTBwnIhyTj/43KorIHLcgRXNPnwsvZQsTYxQK4tmYSGCJ
         gGX2gFYTVtianOZHvRJSZfrDv5fwp4iSUw1WLD9Fjk8cewsZHWFO+soG8QYiOjwTq0s6
         ZY3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761753684; x=1762358484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IEq2aSb00s4qKXheRiZL2KxJNF7/Ul190P2t2smNwvw=;
        b=Y38GEfpF8qemFYVpIeoieyCgc/GFGMaPDb2O+rUYkHBydL8SKoXupGxBNPM2KzngQ7
         I0TF3Hnb3JwOp2a04WLAmbBLo4jBSWfeEeoOebCPdYC+xRyg9ZxrMWG8ab9gF7tHMqjG
         mR1j50oWPOvkhMZrmPk3DSlAbhyRVzelg9U4fdbc6J2ojHc/kjK3Afl5IEf52dYQYgtn
         oRuCOLJciSNeAHrnpvE4cYJXZpQEBeTYgVoye9e6kx3Ua9CFl0iA8cNraz8UmcY+Vao0
         v3c9BxV9TGsq2lamfi130rUPHew3KjYa9u+MAMgALpKSpl6FH57FwFgswmzPF8v8KPxh
         Ldsw==
X-Forwarded-Encrypted: i=1; AJvYcCVlC4YpY1gAYzNO7pJidS5Ps6hkFk1o9OiFSMw4GFNRZ+3QFiy2YoVmfLTc0fOs8BARwekz8cZ9bR/K1Ytp@vger.kernel.org
X-Gm-Message-State: AOJu0YxHrXPpiVhaZYIoNpRozprS40t+ZgPEZpCzfZCPSs1qzp1x89UN
	jJGsD3fCexZOK3qK/Qc1wWRmt2HDyYEsoq0/DXpC04sO+IzvOMAwCSLe8mWCI1dciLmSv68HH8X
	90PQ3FTCt8IOF56GtjMcAu/iaEn2/tUgkfASdYE4IxQKYgec5/5fiFl64bK5NS8F08waqEum7jS
	/z
X-Gm-Gg: ASbGncusLVe2Tdxr6NkkE59e8pn5o8+ynx9hjEYOWnhXLR/ahBEOOUuWIPQSth9odnQ
	hGyEkKv+6gJKFNK5uIx0X9vzU1zd2tkSnxhAtTBEyPfufwsQIsUCKZrhJBnXVquqiHsABCoSMdB
	7N97IoFK78Xne6QQQ5Fup7znT/9DfAP9oTccmJDe7vljAhg0FRy9mUTa0stFRaHdbNRLh6mkhdb
	gNRjdKxs7CPPcvUc656jawVZTh9NZcikC56onkdsuJdZWf8z2rXVeQtUgCGlVota64o4vl7JSo8
	QN1iKlG/t2DlNkfpk2IST2O4Oa7KeGwIwAWTlA2Ww9yLk8foygMDqEgeiycBsSp9/ZkpZNKJxRH
	c+NYf0gQq3Bi7
X-Received: by 2002:a05:6122:90a:b0:556:97dc:4a83 with SMTP id 71dfb90a1353d-55814267160mr1315485e0c.14.1761753682105;
        Wed, 29 Oct 2025 09:01:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH3Y9WaBzilw+bQFAcYPxp8fJjA+27I+dMEnAhZub51yTwrAHnCEemtfq+h8JeZrRrzVZ13BQ==
X-Received: by 2002:a05:6122:90a:b0:556:97dc:4a83 with SMTP id 71dfb90a1353d-55814267160mr1314998e0c.14.1761753680063;
        Wed, 29 Oct 2025 09:01:20 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4771e27f7b8sm57154535e9.0.2025.10.29.09.01.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 09:01:19 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: robh@kernel.org, broonie@kernel.org
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
        perex@perex.cz, tiwai@suse.com, srini@kernel.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, alexey.klimov@linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 4/4] ASoC: dt-bindings: qcom,lpass-va-macro: Add sm6115 LPASS VA
Date: Wed, 29 Oct 2025 16:01:01 +0000
Message-ID: <20251029160101.423209-5-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251029160101.423209-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20251029160101.423209-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=VJLQXtPX c=1 sm=1 tr=0 ts=69023a55 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=0AadgyblTOGOoKeRh1oA:9 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: e-yR1bME2biAciP8ISh1hTuNYXFCXxJy
X-Proofpoint-ORIG-GUID: e-yR1bME2biAciP8ISh1hTuNYXFCXxJy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDEyNSBTYWx0ZWRfX4rtVKTfTrXUE
 bnDo0S7eeDZpzg66nr5b5pw2QNljPYbbxSy4y5VIYKDQ5ApJQRm0tzwi8XcGL+c3wns294plAcv
 ClHz4EXAZwn/g2yDIeY13iMakp7t9fdTY55cI8KDpX4HPCWamDGzkwo0PHA3Guj8dujwu/cJv5h
 fJY5JhbhHfLpq81/+F4mNXIz6RSI275CnFbyzfY0CFnGhE0wKU1gu82VoeQ0Q9xmh0rGANzOgkr
 6aXxT51xCWIh5njFaJGHjS06ZWo68+uPNA3aZ375zDqznbMUyF1Fw25r7qvouxlAoeggv8Cv4XX
 R1uI3UNOSZhznUg57k+8IwZIE0k4ins83VVUmhV9elWGqdSGrqPsrMwhLG2sYDCMttO8KhpHBp3
 TZBJYFeXrM98doKX+ogjWPQivo0wlw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-29_06,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290125

Add bindings for Qualcomm SM6115 SoC Low Power Audio SubSystem (LPASS)
VA macro codec, which looks like compatible with SM8450, however one of
the clocks macro is available in this SoC. So updated the bindings to
allow min-clocks to be 3 to be able to use SM8450 compatible for
SM6115.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 .../devicetree/bindings/sound/qcom,lpass-va-macro.yaml | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
index 5b450f227b70..1ac3392776ca 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
@@ -26,6 +26,10 @@ properties:
               - qcom,sm8750-lpass-va-macro
               - qcom,x1e80100-lpass-va-macro
           - const: qcom,sm8550-lpass-va-macro
+      - items:
+          - enum:
+              - qcom,sm6115-lpass-va-macro
+          - const: qcom,sm8450-lpass-va-macro
 
   reg:
     maxItems: 1
@@ -44,9 +48,9 @@ properties:
     minItems: 1
     items:
       - const: mclk
-      - const: macro
       - const: dcodec
       - const: npl
+      - const: macro
 
   clock-output-names:
     maxItems: 1
@@ -125,10 +129,10 @@ allOf:
     then:
       properties:
         clocks:
-          minItems: 4
+          minItems: 3
           maxItems: 4
         clock-names:
-          minItems: 4
+          minItems: 3
           maxItems: 4
 
   - if:
-- 
2.51.0


