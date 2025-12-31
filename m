Return-Path: <linux-arm-msm+bounces-87078-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 327D2CEB988
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 09:47:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9A2263032AFC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 08:46:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 743D1314A63;
	Wed, 31 Dec 2025 08:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fBFIIBQZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HKR8Sk5l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E40A3112C4
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 08:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767170770; cv=none; b=mPwk22GT9OD5K+S+3BT/1ubyoRYycGfNxsEOJ3vHvsPZj9OKbjC7dWO6KJQofxeDcD53ropMmNvJeieugT/Z5eztuLQuWjmF6TEI16aWcSoeANLj7ZfzbxyqrCRw/VDapkVMvLrl45lEaenVgpM6bh2WQE/rQe0wWz8zKLxZOPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767170770; c=relaxed/simple;
	bh=T0aJD33DIX3eTHbNDuhSmkpxxHoTSUhKHFqgSnJxirY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qAQ4MdahazCOTKeVOvgCtQprlMBdQe7lv9HsxZ/S9RF4uTJLDzjLjujx0sUUVTw7TTqQhMOQ307+eJh4H21YvJatJJegP+DMBfWLArTJDMIC+dU5btrvuAA6w2L5GB899ZJkp3lX/WrBs8BgR/yupIx1XcSATvhtH6n+AKlxU40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fBFIIBQZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HKR8Sk5l; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BV63QGi2054591
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 08:46:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LHdgIK7rIVdHeDRXxeUpAdW6FlQ9DymFt0TcCA0atqE=; b=fBFIIBQZm4j3IfW3
	unEXOe0yc8SHr95y8bLxvyWdpxPQPk96ExGq8OEv38mNd/1L0fEJxsF/21vWUSKf
	BcC6J562dLv0MlXo7pG7AbEHYpHrvH9+3buDcRoT74GI56gCQvhWnr2mrauKaGIn
	r6hCjCdtG6dXFrdMqh7te/CnFRqwg/cOVLk15E/OAYp5DeIqpf9iDdtHdUvtReKb
	kiEjmldCAP+spTYwnzjRgsxhwObjwpeykPftxboUwRozbttFD9Jqh8LE1Tn3VUU3
	dUqSXgmrMKS8pwhIsZ9be+oD8STpV5Ju8Qp2ETEFCEkiR1uQL2mDYQ9AePmRM7FG
	5l5d9Q==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bcx74896e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 08:46:08 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7c240728e2aso22357940b3a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 00:46:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767170767; x=1767775567; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LHdgIK7rIVdHeDRXxeUpAdW6FlQ9DymFt0TcCA0atqE=;
        b=HKR8Sk5lWfjvHZA58ISoijuOJth8Le/MLXnv+PuKIToaMPUUPaO2VxGSkELR8Yghsw
         dR4lsNXqdLsLQeuwQPrvVWiVNJBC5+dVoFYELc20o+6TpK6pbqkARKAyaOLqY3yJ1POm
         MVib84HVeWOG07W/lbncOiRPm/vE5ZJX0OylIG6Kqsg80yrF1+k8BcyAumDpxzQ40Lfu
         lOyasMFyRF0EaNmQCwFgd4s0mNyzY4P7METVw504KzOJyd+yWGJjcLBOrA6SQYExyZSr
         QX9kDvsyifWx9eV88zd56enJ1QzcjAqz2EDIX9ORPsZs7eGOK/Lh3utkInryscYOnxIK
         cT1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767170767; x=1767775567;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LHdgIK7rIVdHeDRXxeUpAdW6FlQ9DymFt0TcCA0atqE=;
        b=VGNcR71JLZ3ten8O2gfUkPEbTpf2KAvYpYocy+WB4XLBpR1oun0ppR3XlCrApnZlld
         T93254Ms7un9+8RWdw+5thWInxaBTrH+jBvo3+on9mGW/05CyEYYyPZEHg34vm9LXvCR
         pI1Ma97UjcdYtqnHD2DfrNKEaPFW8rRLhHT2+UJLOLcnftltmNhjOqi0GTrKNwdRDt4h
         otTBMs+uVlg4ppqupWMZmch7bnDHLXgT4jFNT+DNdkPblj1HXs8mnWwLyd0pNEoAXTfy
         XLraNUc5d8OwC7tNnRX1QTjnfQpNi1YsCqOoC3AOeL+BTX9Tl1PsgdPHjK9y1vDYQCgQ
         ry4g==
X-Forwarded-Encrypted: i=1; AJvYcCUsh+mU2tcAU62P87OsOB37PK0YhARDvraBxxmBykVKMmrgOjJt86JhgAQN4LDM7rFT1T9hb6QmTjWNA75R@vger.kernel.org
X-Gm-Message-State: AOJu0YycS3f12cYOC69opKP1N8cPpXWO6V+E7n/4kCQ+sAC3WVbw0xt6
	OSxiQHBigdV7ijegF8ls3sWG+HfmfEcoOdRQH5TnwGWfY9ZD4tQ9LlGppyp0O/gS81g+pPCBRgA
	5dMPv0C2eiA/bMEEgwicrX6JbNAvHahS+zQCuW960iUkL4lp6BcyJ+WfMaivINYFaJTiU
X-Gm-Gg: AY/fxX4Lyg+Dxdoh/6os50OkdBvSrb7kBFZzoZOs5jBY3CKqKM0FXcjyC26mYG3azqk
	kkR3+/UYai9lWG/OFWD7AdaXRE0lXX/5L9Aj7FaaqyMBWcguWidzZH0AxkEySW1hUHMEYOW2ECz
	IN1W11yydkzA1lPaxfqXkCnuTU/WGrXFweJZ/kvZmWPftvWinNwQvZgMt2cdacGXnJ9CZYNzKya
	YKOsKZ8X7GnLNOSLMR9HDeN2HGuUMwFwWd18vbxtF0q6yj5H6MmOOXx1vyuw/DMv3k3dpN5Nlnl
	D+mO+/7s+rHKq6aQ75yBa510AOq3A7w1bQROZpwrUItVAgH3EuEfNLqM+39NnJN1KSaAbq0wIbQ
	mnMWBaqivQugUQXj8th9r5rZyd9rIGvZNBA==
X-Received: by 2002:a05:6a20:3ca2:b0:344:a607:5548 with SMTP id adf61e73a8af0-376aa8f3946mr36073240637.58.1767170766830;
        Wed, 31 Dec 2025 00:46:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEaGppZIEcNFj7h+K5+adlAthXR0ANkOoGwkAkNm/WxOfY7fMuAjR6d2+dVPJ5qc03dhZ4wOA==
X-Received: by 2002:a05:6a20:3ca2:b0:344:a607:5548 with SMTP id adf61e73a8af0-376aa8f3946mr36073221637.58.1767170766327;
        Wed, 31 Dec 2025 00:46:06 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e7a018eb5sm31356070a12.16.2025.12.31.00.46.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 00:46:06 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 31 Dec 2025 14:15:24 +0530
Subject: [PATCH v6 3/8] dt-bindings: display/msm: gpu: Document A612 GPU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251231-qcs615-spin-2-v6-3-da87debf6883@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767170740; l=1808;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=T0aJD33DIX3eTHbNDuhSmkpxxHoTSUhKHFqgSnJxirY=;
 b=RchQq5wGsT96YNkpPSE1H7vENdCVRpxN4zehwiDWyIAOB1DybAjhppVLFYlLjna0sCObQVg0j
 291CczjEsrlB8J1o/dgJ/NLiq0pVuTFAyvrbJ6Ubhq08VTPPmegw02G
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: cA0S38NLVx3uRKPG3qXs223ga3QenRsK
X-Proofpoint-GUID: cA0S38NLVx3uRKPG3qXs223ga3QenRsK
X-Authority-Analysis: v=2.4 cv=HNvO14tv c=1 sm=1 tr=0 ts=6954e2d0 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=SkoZtctDx9gcCqASqUMA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDA3NSBTYWx0ZWRfX30GQPVeUCv5L
 hPIvmZSOpBz07Pmq5SF746WMQSmK+ooAoDYpYAs+O0SRyPG+il9XEA45CUpmPaYXjaGAlu7izq+
 G6aAMOEtVM9c1tVQaOQIDrrtVm6QNjFuktayNZt59ruR7BCDg13IO5YuXtdaQzeEigDmD1JLxs1
 3ySg2IkRA48D/a4EwgpT2a98yc1Sikmi6bYvzTW2BWaVrTweyslA96a8YZUW3Oa2zviqMNv09pE
 UwdSNxf0KnGvUX++9/jf6TJg1j74Pno6f3CwhdGR0H+MT3cKNrVxkptVxAbXRrvI0YgVgLsR5lc
 gFM9WUhrv3JLVKIkgscPCPeaR5l0LXAoJdswEsaHlIjzvqn6y6TzxBfOjEJsxoDXyLSGcTkHkLV
 OPNfhuj02QkmWUP2joINTrvFkXiU7YBld9CwP/u1RQnLZhsc4DtybUhMjCAfcWSchcifpg53Diq
 A9n3nnoW5I76DjOxQWA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-31_02,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512310075

A612 GPU has a new IP called RGMU (Reduced Graphics Management Unit)
which replaces GMU. But it doesn't do clock or voltage scaling. So we
need the gpu core clock in the GPU node along with the power domain to
do clock and voltage scaling from the kernel. Update the bindings to
describe this GPU.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/gpu.yaml       | 33 ++++++++++++++++++++--
 1 file changed, 31 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index 5c12b5aacf8f..27ce88766dc5 100644
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
@@ -388,6 +388,35 @@ allOf:
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
+        reg:
+          minItems: 3
+          maxItems: 3
+
+        reg-names:
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


