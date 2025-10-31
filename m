Return-Path: <linux-arm-msm+bounces-79882-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E301C24ED4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 13:09:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0CEDF1A66C48
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 12:08:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76CFD348882;
	Fri, 31 Oct 2025 12:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UPYPV+xg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BG6y0LQz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0193346E7F
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 12:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761912462; cv=none; b=Q7D8RsJrVe2kZPqaP+uAC59oAZ38S0+8mOblWZ9doEf7nGYutgZkfc+clEREXXMtINXEy5Z0zREXZ1OdxlMKWViquCqrztMuidbXDXDJG5qgd9g/QvUrtJ3K8inw0iw/r45ExSsJu1sdiMMaKm9VWug26xNB7K66xlE5VgkoDfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761912462; c=relaxed/simple;
	bh=exPcFwTkKob1Kvtn/KJIwEEHNtSYPJUVpMm1QHlPqwQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ULYVNDy7E1le2vYqLH0zhHSyKfr9sJVIKLvxWrxNQLqBsOB15NGlVnrSOlEejba2UjMt/duGBqXX44GSOlg/S2NDg3ep9I+ZI5dhuLXUIZNUz3S7jO83lLYf2D1QQJcWEDSNxx2NxpaKQ8PacJRF0F9WdE7pI+naP2vTXPsx04w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UPYPV+xg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BG6y0LQz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59V9qGAG1513952
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 12:07:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=MlpYleSVISD
	gz2HE7RgANuLdkU0REzZ/tp6gPxx4A68=; b=UPYPV+xgTFIea5AG1ek8E2Yd/cH
	vbL/SGLSwUNipzg8CmVJdvSPJaAL/prUQEpGqFf3LMhmY3n1Mb4z4MN02Q0azclW
	XjjZI0UFCCkZ16Jpnv4U3slYUbA/ZkxiSR/DELJI5zDABCLnDxRCv/BkhDOvrkgY
	0Hy2OkEGO/8ezRhYE3XORas8phngVzJ37S7Z6/C1+CMYTe6t/qcrz7BGS08lwdm8
	8jWr4GwaZoINcRPi0oQlKIvxx/mqEZdesd5NBCh/JT/hwwZnsHnNzCU4/iskWR0o
	+fm0Vn+YdDXqCHadNARiatsqwWKT7EA1uM0emcoeV/sR94lt4yFpJ8/tXvg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4k69hkj0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 12:07:39 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4e8a3d0fb09so27238611cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 05:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761912459; x=1762517259; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MlpYleSVISDgz2HE7RgANuLdkU0REzZ/tp6gPxx4A68=;
        b=BG6y0LQzFzJxOQt6xCXtCViMfgCUyrCgXr/aPNAetnevsIQ4E9FzDIg2s71cr9/khn
         9STT6mhPnfPDS2ZQUeDQkFb1x4C6DV+ncJl4dpdH40BAhzZJw2W7drctV2MX03x5ttI/
         i+iCd0eCYuDaexAMe61kapzxv0m7EkYGQwVYvOjm0qI5486KBNOEmnV6wSkgRhbvJOAH
         8WPLjximNJQTCNuYTSfjarD+TYK2m5jlJjXC2odnD04iDsqyHN1az5sk13EVcoKEU4tX
         CFYdBZlnnhuXNlIyhv8CQuWrU5LqhY5CNtYYF++Nm6Ignh+3ld2qHvpwyvc4U+I7xSyc
         954Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761912459; x=1762517259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MlpYleSVISDgz2HE7RgANuLdkU0REzZ/tp6gPxx4A68=;
        b=IIH8Qa1tjSOjwuxwKTr8Bh96rTYlxs1gDiABzoiS9QKLielqb/wLVDz35S++yM2sIj
         OdPntjU1hqF4HP8Tj8qveGmz0yObY0gOEhxMvFyrrq8f/A4AkJ/vQaUHBxSwXRVpmpAs
         0G2ELrV8RFtFk/vx/krJFbPVQBxWweSd4rFG9vbONjrP/zYM+5ZTxad3v/Uo7S0gm/gf
         84QlLU4CE/eWE+wITl4jjbzVbaRrysiyvhDppoebeJUodrcwQK0UiUl9lBKtb/52UPB0
         CSsoLFkrtBOrCPITdtfxSZRIfhoSyL9naCytyod2M5j18hsS/H38182gMVB1U6gNg1OS
         t9nQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3V+1t+fNZrrU+e4B6gm+5bszW/h7iX/JQIwhI/DY77Bccu5UutWVH7YG40b1ArlPR5RDnbBmwDH48sTai@vger.kernel.org
X-Gm-Message-State: AOJu0YzGDkSKfKFgTEe+cL5Rqz4iDpOAa8odQsdG/hexa/Sj0q5NPnQf
	kRyskm5AcAucsZyQxAKVdEOl/XmbhtT3V+OnnRQae4uKDOBKU72hTfENCvukIGZpomXBkW7t5Lq
	5MU2v4opjljR1Zqzq2akFjqh8Oj8bWpNqjFJM+e2FDOzDlTWy9a1/BOBkJCLC6QP/2odZ
X-Gm-Gg: ASbGnct5iNGlXZpUxJQkwICnPyvLzXyqGn89/+U9ZoOrZRWzIKZlFyF4xFEf2387Ave
	c09u7P3LxNbJrioXzcSiuENI9m+enwpbnoMEO6Ub3ue3WEv8zOALO4dtrcgfLLDA+pPwJQCJhqf
	zpbauhxq/pKIiExyNl6fhBNWG+mjUhWRijCgd8veIG9E73g1ACamGzCqehKxG0Gcga0L39m0wUv
	Map9ArNeS7NoUXUGjyGxtOOEETO62Fe9inIydN5IthlSM6V7ojUEB7Rt7RBJaS6/6IuICQKyuIy
	T22/VKFQhwMQWE3v97Wor/SgMzNCuMo/WkmrOGvyB27rbBaVQxrOsjnQrjnD2vS/S7FgFef0cj2
	4OwY6FAxo+SkH
X-Received: by 2002:a05:622a:5c0c:b0:4e8:b56a:992e with SMTP id d75a77b69052e-4ed31079298mr40427421cf.59.1761912459071;
        Fri, 31 Oct 2025 05:07:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGTdwQ+KHzFYlxZpQKmPBG1OdksqFeW+dC/tTItymnmUsb7Jy30j58j1b7FVARoFRV4sNfGWQ==
X-Received: by 2002:a05:622a:5c0c:b0:4e8:b56a:992e with SMTP id d75a77b69052e-4ed31079298mr40426761cf.59.1761912458612;
        Fri, 31 Oct 2025 05:07:38 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4772fd280fbsm21273995e9.5.2025.10.31.05.07.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 05:07:37 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: robh@kernel.org, broonie@kernel.org
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
        perex@perex.cz, tiwai@suse.com, srini@kernel.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, alexey.klimov@linaro.org,
        konradybcio@kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v3 3/6] ASoC: dt-bindings: qcom,lpass-va-macro: re-arrange clock-names
Date: Fri, 31 Oct 2025 12:07:00 +0000
Message-ID: <20251031120703.590201-4-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: cDUge8Sk3f-LfNmAe-cKAVkm6yfekfk4
X-Proofpoint-GUID: cDUge8Sk3f-LfNmAe-cKAVkm6yfekfk4
X-Authority-Analysis: v=2.4 cv=OYaVzxTY c=1 sm=1 tr=0 ts=6904a68b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Zn4RAEFE0_yfxgg1y30A:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDEwOCBTYWx0ZWRfXx4VL+kSwQquV
 YrhFkESkS9DLK1DwuhRtDsJr6kyDBp7A9WyuPIJo84qMPVYOAKga5xXgQtfrOXUGd4ACkslr9lk
 61HWfs+Bfk1VvLPIziVpGWgdQUc3BjRl8sCP7oMfRzG7Q6Kms/9r8v3AU4m+SLG1XPtsPS9sEq2
 /OvhfVhQcBW7pun5pncxGLVD7WqxnR/XdIRNuhtKNMn+SmDxSpq0MJPiD+CTqVz+QpUgetkQPyB
 JdrTnrAV5rdzr3XW2KKb+hglthSVOwk6aDD8jyPj5Hy2PdptK7Ky2Kkr7rc5OTnG3c7cdHGcdx7
 3ZEbjWffYiNbYmObKlKA/pwGkgNJibKUF0fwZkFM/znBkaUMP94GjS+VrxX0/Oo2QvFVSxMomVQ
 WnfpAVBeIFRPgGdPuicEo/hNxhezwA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_03,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 malwarescore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510310108

re-arrange clock-names in the bindings to be more specific to the SoC
compatibles, this will give more flexibility to add new SoC's which do
not support some clocks.
Move all the clock-names under the SoC compatible rather than keeping
int on the top level, this makes it more align with other lpass codec
macros.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 .../bindings/sound/qcom,lpass-va-macro.yaml   | 35 +++++++++++--------
 1 file changed, 20 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
index 5b450f227b70..d3851a67401e 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
@@ -42,11 +42,7 @@ properties:
 
   clock-names:
     minItems: 1
-    items:
-      - const: mclk
-      - const: macro
-      - const: dcodec
-      - const: npl
+    maxItems: 4
 
   clock-output-names:
     maxItems: 1
@@ -91,16 +87,18 @@ allOf:
           clocks:
             maxItems: 1
           clock-names:
-            maxItems: 1
+            items:
+              - const: mclk
       else:
         properties:
           clocks:
             minItems: 3
             maxItems: 3
           clock-names:
-            minItems: 3
-            maxItems: 3
-
+            items:
+              - const: mclk
+              - const: macro
+              - const: dcodec
   - if:
       properties:
         compatible:
@@ -112,8 +110,10 @@ allOf:
           minItems: 3
           maxItems: 3
         clock-names:
-          minItems: 3
-          maxItems: 3
+          items:
+            - const: mclk
+            - const: macro
+            - const: dcodec
 
   - if:
       properties:
@@ -128,8 +128,11 @@ allOf:
           minItems: 4
           maxItems: 4
         clock-names:
-          minItems: 4
-          maxItems: 4
+          items:
+            - const: mclk
+            - const: macro
+            - const: dcodec
+            - const: npl
 
   - if:
       properties:
@@ -143,8 +146,10 @@ allOf:
           minItems: 3
           maxItems: 3
         clock-names:
-          minItems: 3
-          maxItems: 3
+          items:
+            - const: mclk
+            - const: macro
+            - const: dcodec
 
 unevaluatedProperties: false
 
-- 
2.51.0


