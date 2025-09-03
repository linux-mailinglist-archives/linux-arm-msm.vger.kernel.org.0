Return-Path: <linux-arm-msm+bounces-71726-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D4DB4163F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 09:20:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7E98B1BA1898
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 07:20:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7DAD2DA76A;
	Wed,  3 Sep 2025 07:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WhP6YCn0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 163162D9794
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Sep 2025 07:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756884020; cv=none; b=sHnloyw7hJM5Q+BPWvGEjtZMGe4Oer7EQcw+BOSn2gIxCbmtqxlMw8dBXV0LYTKRBCVjZf2JrNv3Gou6QQF/DIpP6we60Hl/kWwIuEbIL3q1cX2CLz0dsqw4hELTPphqbPyoCOWCMT3SmZPMJuJkAxyXQOUlQtDQ2G8RzR4s5Ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756884020; c=relaxed/simple;
	bh=OqO8tYRqtS5572WtbMixP6NoK2GKv0qjh/+BfhYV+CU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GopzQ8DvGsOaLfWm97Syeqn8fviTcqGj2bBKospTV+peUKz8/P1ipVTqQQEyBJdZSOPTtdak6gvgLLJrHVu3hnFmAZiN36wgKDyhpKS1uPJHD42fj4xx5Qkn2WTYsNt0K9MQM1TJ3dLxd/Uf52cm/3PapobN67aq/JQQCBY0OKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WhP6YCn0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5831npuU021309
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Sep 2025 07:20:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PR6KqsPCNUM+EZNcWonweXt6CFzY44sPfHX2M7jwd74=; b=WhP6YCn0bkXXOkys
	EFEdGtm70REHJV1emT2YiqfAql4S28V40ku38wqrVS+fWnbF2Db1LAqThyrtw1nz
	dvkzSygM8E9XmT/TMc+mqjYY8q831hCkTv75Y6/NO+XWPVVBd6zK8Cc/wgp/Dd0Y
	lMs4cvXFdBb2texc9SxEz9RaB11usHC7hJHIKW+YH2Oa6cCYJLs5wHl7Yiti1OqB
	5G1rEC6bfwJBRN8D7O9NnJomdiWg6JkW+5DO6ky/byHqpm7lJtE503E2gHgtXF/Z
	EW5uOLbdh0JLGl3urfzT51ncIugEhqPmDlWlNgtqyVU/Np8frLrjhtR0Pov5x09D
	M1Yh1g==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ur8s2p5h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 07:20:18 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-77231755b56so659421b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 00:20:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756884017; x=1757488817;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PR6KqsPCNUM+EZNcWonweXt6CFzY44sPfHX2M7jwd74=;
        b=RVyALs34pzlciDExCMogSkI7kPjYxCTa9/RRESzjsOqscS/WCIupfxHHHcVdnp56YM
         9D/zs9QBIzO1+qdKSS0lSAOWfHdZ1AQA0qq5iT2J5PCSQ7CaLXWaM9Rf08+UexjwUWrm
         ROzxnG8IzGU2M4V9U4SMau5HaJO4ZkQ6aoj12zxlGZhG8KWnDVQvSEl+c89xxC6leIuN
         sRshz4fIOJA/tMW94vs8e6J7eoN1rIVoTKJb0VeEzUNa28BECjxCqw+QG9x9kNhdtfG8
         Q+K6OaNdeha6aSpCkXI8Gy+tQIqGt+lLziDsZH2wSM8FiPmMhujI+8uOekwiiXqUKxU5
         Fxgg==
X-Gm-Message-State: AOJu0YzTNLAqfFBqgb70X0odzQFzEqrhrNaRD2gkClpFi/gS6Ipu17AY
	4FZ1wQWr/4GZIH03ghknvqd5/iOOOxJ3fBAaVaM5MWSox3lfJF9/eY1GHPwBty+/+9e8NUbRQ28
	nxMtceh+uL6i97/N4nSQuwFJLgbZwxN4vYvRWcQExBOZjxYxOqtUM6sF0iBfIHjIe0sXN
X-Gm-Gg: ASbGncvfFLHmcu5W+hNLwCWY1MT2tPXQxZSH+Iz+lobbK2PJ6yK/fUfiuinwAjCiZrZ
	J0BlbcuY2OO20+Lic1Is4OHFrniNjeHm1o/WCHOOW4x10V9364dQoWqMDpMHC0lm63ttNireGfc
	+0PU3pYVLPg6HUkvQuZlsvheYoHO8l7HXOg8wZkVS/Dp+u5zg0Xn5uuUvF4pKfeUmJrLM6F5JH5
	RqdI/C+Ihp/+ehG5emhp2O51VZRIfNWEhml1YTAXe1aH8l+OMjsNt5QAXL8eUDrwRgoPy35r30g
	XZZQH+MUxkvK27W+H8OUQsSUT7sYUpKQKvOVcGoVf+l3IXDBZ0IaySP999FViNet
X-Received: by 2002:a05:6a00:138e:b0:76e:7ab9:a239 with SMTP id d2e1a72fcca58-7723c5c841bmr19009901b3a.16.1756884017217;
        Wed, 03 Sep 2025 00:20:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHoCKD0QFh/hM1sUteZfm2odrN6P+2cM9K5e1ZRXWq6q8tcAxq9HE3dI/77BQtbZrh4URINKA==
X-Received: by 2002:a05:6a00:138e:b0:76e:7ab9:a239 with SMTP id d2e1a72fcca58-7723c5c841bmr19009871b3a.16.1756884016695;
        Wed, 03 Sep 2025 00:20:16 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a2b78d7sm15816191b3a.30.2025.09.03.00.20.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 00:20:16 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 03 Sep 2025 12:49:52 +0530
Subject: [PATCH v5 1/5] dt-bindings: display/msm/gmu: Update Adreno 623
 bindings
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-a623-gpu-support-v5-1-5398585e2981@oss.qualcomm.com>
References: <20250903-a623-gpu-support-v5-0-5398585e2981@oss.qualcomm.com>
In-Reply-To: <20250903-a623-gpu-support-v5-0-5398585e2981@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Gaurav Kohli <quic_gkohli@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Zhang <quic_jiezh@quicinc.com>,
        Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756884002; l=1928;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=u87CzBgcXsITaBIhArlZrl9vUsN6j2cKpyp8cwIsM1o=;
 b=CiL9c+CxrSxF6MC52aVaGcpBg9TQe2gy4Y8Jxg1eWT61ioWHIbVTfgmwHGthgwBy6xFhNGIuo
 MlZS8xehYqdC431+l2BX2XaNWR5GpZOMBdClLX1Okkx4eDs3yvXlzfR
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAxOSBTYWx0ZWRfX6Kw+rBMpyBy+
 VQYR5rume1dZ0YqAAbz2JDl+mDD7MxLqkFobvKf+GbiKkFJIB7qc1MfgT3js4R4hv6ilFOEh8p4
 BZ5OaEdSzrxpYyp2Aa23r1aNp3hARUsTPGZRQY45w7DDpnXOy6uw7ZkS8FCdmX4GMoLLjkR3hXh
 Su+syK50zfMXxqjF/KMG2t75G4GGeO0VFOi2+Z7h9vEKb8ItafOjv6A9iH+OI4K5B9NL4Y5E/2h
 O+sSUUssrQcC8A20Gb3TJ2uzMH3eso3NRWirCsQS6AAM3e9jAJySy8bJqZU/P0yLwA681CKC9JI
 QwhH52UC1hncxBbwYdtHTzYU/lYqpK5xRzmyRCO047vWtjscRDIzLFpWaCWbVZUvjKuvYrfwS2o
 NS7nZdV5
X-Proofpoint-GUID: 9F9SVLv7uKXUegQ_wDfGXiuWkBTQNPj5
X-Proofpoint-ORIG-GUID: 9F9SVLv7uKXUegQ_wDfGXiuWkBTQNPj5
X-Authority-Analysis: v=2.4 cv=PNkP+eqC c=1 sm=1 tr=0 ts=68b7ec32 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8
 a=Z2Up3Oz-XkvUWgdIv6MA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300019

From: Jie Zhang <quic_jiezh@quicinc.com>

Update Adreno 623's dt-binding to remove smmu_clk which is not required
for this GMU.

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
2.50.1


