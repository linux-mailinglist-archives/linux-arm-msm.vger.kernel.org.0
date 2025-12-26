Return-Path: <linux-arm-msm+bounces-86661-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C5C0CDEE57
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Dec 2025 19:30:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 849CD300F9C8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Dec 2025 18:30:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F12C27056F;
	Fri, 26 Dec 2025 18:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oDcsmNnT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q3sWHQZp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A0861DFE26
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Dec 2025 18:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766773821; cv=none; b=YTRBKP15F3cGpPzUYdrVAhdoNa+wpCyVWYy58nnPXz7EeUqAMsXDS3V1Sd3cwZySRa9Gqg88cXol7Wh82umSe+3LOvi2TE4nrxe9f4sa9TLcycmChEzg0zDZymNmIs2EK5J2oLXiFdb39TB6ZtW4UmQIpcCiTZ0nyhS8X9k5LqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766773821; c=relaxed/simple;
	bh=PEO1TV4xiVpe7ckRjCFNmBaI66ohIGEJLpxfUH0hRuk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YwIvOM6nspZgp3UZpBgfgBvOH8sjdILqM9d2+k+f4biuBYE+sWJcFZoST6bgp9Yo5wM7TyQt92KTFXlI8r0y8iNE8VI2Xn5MUbVmR0P7ikQYyiYyJweI62cktmuzkYIvPkRzk7Kj7hsoEePTkcfIGtsqjxwDKUiG+emCyDWYQxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oDcsmNnT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q3sWHQZp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BQ8bbaI889912
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Dec 2025 18:30:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6Ie5hriCo7ts+dnv5WrjYrSDf8fix2GswPegCB7Q6Gs=; b=oDcsmNnTZ0m2nizw
	KmcMrHGjZRbMLBqSg0rlIwMt+oOKdJdC6koztAYRviJptMmBLDjIGERh/K3jRHFY
	hs/LXoqzkYXxk3qP4E7H8LR5YUKZ5RJa7u17tVhtV/gs6ZvzRbwZZdxPkLP6W7kA
	TzZSi1SqxG2UTAt553Syp370aNwdXezHwIKm/D6XIq34Eoq+1ftxDhbiGEADovdC
	kzOBHsmRjnAR6eOuDXns51i2slrJaXiFmZJpL7iVvwC4wcYdqSh3XLcypRNuj/yb
	aJftMUANfcFDFZV7a8GTGrgQFTeYJnPASGX/2CtbOEvTVIVMIbBrH4nMkyl/llFv
	H/SFmQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b8xvcbh4a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Dec 2025 18:30:18 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-34ac819b2f2so9366514a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Dec 2025 10:30:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766773818; x=1767378618; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6Ie5hriCo7ts+dnv5WrjYrSDf8fix2GswPegCB7Q6Gs=;
        b=Q3sWHQZpFXN2fDjvlOojymfi+TASJBiVUnseirhDwBcx2LYH2GzUKFVxf748+kV0MA
         NkUd8iqG/khkBwMxQ8yLAy1MXA3djVbGu6NC5zgshqGtqvKS+vpiN2Ve87zWH1s6SUtE
         Mue0kyxTkGgMFf9SCctWHx+POXtJl3XMmaqhzrw2mCYCDFhON2s5tknoeTwp0sW2C5qH
         TvlTaAqE31qL7abT073KuXr5lajiwwfp+erYg2Z492lSg5VYePAjd/FDLsb/D64o8aHT
         orVdgFhJzsD6usFEtKJMUKS4Eq8e/REggboph7heIVvT27ED1d2hGI7dbx2wnHfvX/Q/
         dD2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766773818; x=1767378618;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6Ie5hriCo7ts+dnv5WrjYrSDf8fix2GswPegCB7Q6Gs=;
        b=XTwZXa9uiom1VPunWOW/A0Xh1bpPJEEKB1Bug5cyuAuPiOal4AWvcKb5qGsFDJNdRR
         YeFtFAw6JC6JpaIOQZAln7ls2PX7oyfzmovCR6lC6NuLE9udzF6u7jYkmxRmvijeztkQ
         b7ac0aksfA/yea9ViIuu2PKzIbbCTZZeEEyA38LG4aPExu3pxdOg3tDkSwPpJldSyyJ4
         dP4VAJ+d2r7jrEPyU5twvD++4BKlWitN8/BD2yzL3/pq07yZlPbclKlJk1JV0JSHLF27
         IvwNI4OwlfU05i3UD6hNvNtHF9+W4GQooTlK0GT6YpqxEyMd8vNh4r6/YD6TWB7LTtF0
         ll9w==
X-Forwarded-Encrypted: i=1; AJvYcCUhfmtQxIOoOIcuAjqow2X4dIU/wT470uupJOQAk3seb2hp72/2jOYCIMc6VXVNWcYoHVZLudTbyCPGbjqG@vger.kernel.org
X-Gm-Message-State: AOJu0YzQxGOPXf8ELv2d0YyT91r7ZmReTi+ZT6R05p6DErA8xdqkeOIv
	1SaOVxXu8CjXmwx6m6wRpojxZ8zBl3NHYWn++DZIn8Bzdfbkg/k7R/qT3360OwY+K8YhFAejmLr
	8h9GN8U5XKppXSVhWIENVeCrfDkmACLori5KgxafuVLWeusdVpaWXk/nFRKkrVmAd7XLi
X-Gm-Gg: AY/fxX6V0MUs4h0znlCmYrEDXhh4etdt0ufBgYJRH9sC9eMU2ge3GxDsEsiIn5tbPmk
	tXrVm9F+06UpiyUOvVlfhgf/LjBADZPs26sYqMfHnEoepqeNtJsdHL+rYEWZg+2R4j94tf+GAzA
	8cWp4+Bj78euZM00Y2yQ2SHveswpAYE4+50VUu/SVOKv4zPWnbVUeRhH+RusAsBEdNEcsy4L9Mg
	3ZqDsmRCKmyo44/jiyhuV6zGFrNkKwQIRl6ON+4o9S9GLunDojbLQGPWgUEgDLJTev35XYkuxHz
	wCNZvXlYsGoRaQa2GkSclxG4m6I64qRfe587+RPVSG1JCuVSHWD29nc6+HKJldSyKIhuOG+yBWt
	Sw/x/ymMjMBcpPP/5bHs80DwhXUlf0yXuYQ==
X-Received: by 2002:a17:90b:49:b0:340:ec8f:82d8 with SMTP id 98e67ed59e1d1-34e9212a245mr21750059a91.12.1766773817959;
        Fri, 26 Dec 2025 10:30:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH6arPAm4eu93VUri7WcDBR3B52qY+86NrPjGiLN2KtKlUGWoZTL/KM2q/WV1QkkVto1WWe0g==
X-Received: by 2002:a17:90b:49:b0:340:ec8f:82d8 with SMTP id 98e67ed59e1d1-34e9212a245mr21750023a91.12.1766773817446;
        Fri, 26 Dec 2025 10:30:17 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e70d65653sm23808883a91.5.2025.12.26.10.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Dec 2025 10:30:17 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 26 Dec 2025 23:59:35 +0530
Subject: [PATCH v5 2/8] dt-bindings: display/msm: gpu: Simplify conditional
 schema logic
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251226-qcs615-spin-2-v5-2-354d86460ccb@oss.qualcomm.com>
References: <20251226-qcs615-spin-2-v5-0-354d86460ccb@oss.qualcomm.com>
In-Reply-To: <20251226-qcs615-spin-2-v5-0-354d86460ccb@oss.qualcomm.com>
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
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766773796; l=2645;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=PEO1TV4xiVpe7ckRjCFNmBaI66ohIGEJLpxfUH0hRuk=;
 b=a4b+MVsPOTuT9p8SgjIh3eaPEksCj793CCqs7OEr6C386a9kvuOUo6lYSlq/neDZ0y1FtE8EB
 pgO9vsTVUd7AnFekrTegfDpBdE+La6CfNGplP32mPSOnzqjUJcTwWk8
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: ukJuarOOjVl6FBD2-hOct44hIAlPGD-U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI2MDE3MyBTYWx0ZWRfX37B/f+7Xfz32
 nvFVz+j8x2QLUtXaISqR9uLh+BnK1pXYovI+7Axhc2/ZpI/zLR5OcwuU6U/50ZDS5sluUwG19Ks
 zuKBjpb2QSrLWEPDfG1kV20RH0BmE8nB6gAEjNBiEZo5GLmyhwLlmkJfFQ+QpwsV7RGA56C/v4B
 h4cpy+yiFgz56bssI93McMRwniQzLsIjUG9Gebgmwe/SJ5tMU8hGCAxsDKdEn/brUDxU0RibwdC
 KyRziOoPPqNV4+TL0BPlLeYHLoDRCrLGfzXx/Xzf3/KtsGbgPBV0mVBTEaNQjRjDzSEVe0fWypv
 EztQyk5WdkMJG4Y0oA6pXjVvTWScD5hZuF9ND00EasaQ5dCSarX5f+LHmJK974V+5SouO+OLMeR
 I8E+7VMKdO4fokP8d3TU9y7FjYkG+tMQJOqlhj1JhQ9MdJhH/fKob6Km6hJDA1qECRvhVm+FL/A
 jxMInh4CdvbiYfDQjDw==
X-Proofpoint-ORIG-GUID: ukJuarOOjVl6FBD2-hOct44hIAlPGD-U
X-Authority-Analysis: v=2.4 cv=M4xA6iws c=1 sm=1 tr=0 ts=694ed43a cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=SNFa__NYaeNfRMWcEAMA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-26_05,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512260173

JSON Schema conditionals can become complex and error-prone when combined
with regex patterns. To improve readability and maintainability, replace
nested if-else blocks with a flattened structure using explicit enums.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/gpu.yaml       | 56 ++++++++++++++--------
 1 file changed, 36 insertions(+), 20 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index 826aafdcc20be4bbd7eba619f7fe172b6e9a5897..5c12b5aacf8f3ff64ca2ef97fb0dd6c3a26a71bc 100644
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


