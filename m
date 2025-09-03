Return-Path: <linux-arm-msm+bounces-71844-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 389CBB41E0A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 14:00:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6A65A3A48D6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 11:59:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F3DB2FF642;
	Wed,  3 Sep 2025 11:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M1LVA8zy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00EDA2FF14C
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Sep 2025 11:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756900720; cv=none; b=Flmu9rX4yq5S1xb6JJN3soowDaZ9soFE0+NrkmmxhfYeSp33mWygd2e5tjYyx/h9dK39x3SsMY8haZrIt3/jtG8ccga8HOyT3P/+nxD7WJF6pm0BAVI+GGa9c0McWGr81m2/9NxoBOTStSiasz3xZDzr/2ZYET7Jaj/VlTXnnxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756900720; c=relaxed/simple;
	bh=5oXZrt2T2gFfyaDe9xWcCMsl4Quh/ruqJlZjWXyzEmY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C8pi8ssDkwtzQJD3rZwsyIUsBFolewjdk86AVHB6T9vVrDdRgGltHJgM6VvpMLPn77ecpfU7A5bpROMr73o1U2ypV/UBN+m7iXAFcSceUP84VRTdqvhIzESxWZeU7qfsaIKp1jhQTF7HxeLfxo5oECoXeGNh69PnWlfjmjeHNQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M1LVA8zy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583BEsJ7013984
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Sep 2025 11:58:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r0xPMPdjC1SNu6J74OSyptSDeIyByGI1ODski72XcQk=; b=M1LVA8zyE+wLXtXE
	kKRT1oFTP1GhLEyBQc8rWPCOopFXOjbYaHaTsZOzy7Fzcuu9GVUa/Ozd81KZ4i4T
	E8y3PBFEiGJPuvbVMWB2x6DzP8qx6Kyjsb25BzOjh2BR4owGhTvVLwRZ8TQInr65
	rGSaC4Lnm4/08GYs70fxqyt78oDWqxtT7pdON+WwSQn37lv51vvLh351X7eKv0ay
	6ecOUrAWph2k/FA7echL3RvPJaEJYvjmaZ/spyZa4lis+eIaevUACvP2xb7If4lF
	lFjYjN3r+1U/qV3GlJr5N6ts2i8kE5J/ruIIXbSZ0jxlYJqc/1JBkyUNfd83JGzE
	1Udymw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48w8wy7dy8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 11:58:36 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-718cb6230afso47620376d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 04:58:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756900716; x=1757505516;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r0xPMPdjC1SNu6J74OSyptSDeIyByGI1ODski72XcQk=;
        b=un6q2+iP+Qmy4VIObAoXQsyPyq9DMeSSvJaeZ9+jehr7SCZG+CW9Nt4TAgkCnthWK+
         bwEeYfNXdQj/Uzq52xErBt8swWN0uxjDbpNM8a/Kw6BJTPBir+Fedaa9ndNzCwDEQYR9
         X5uqgxMMrkDFtdsRnFtYJpHkMAcFaLb9/Q4YH0tIaioSX1UnG77BcPv/SW571rLy419c
         CdYWPHORFHhqqwSZU5jo6AYEOtj0ZKQnAuhbTpDgll3P+uggPhG2CShk7vxbFbYCqj75
         +aWjKWV0mt3QFE1zOMaFjcXuwa060hDmWd9Io0Pu94idjymsh4GQWASHho0u0fKDhpSw
         FwEA==
X-Gm-Message-State: AOJu0Yy4ZmomVIui7kNehANNHu6F8nfA4KkhlMEFys9No6ZPaQzPJ4iO
	de5R/uYL75fn8NGF7xyMZy/T/DvUDXPqB9zG3pOMWZt+Vx0j6gSQ5HtcCe6t4tQiB3f4eA+cWfG
	WLD9+as3nXIfozcghhzwwOc9ukJygB9ll5lO+g4AMllBcf8fgH+Gar38g+qg6zLAjohBk
X-Gm-Gg: ASbGncssK3GgAfDFyrvSC83dICM/9uW9vX7lfNr2hetfXwafRiW/AI3pxX8+dcXVoZf
	ayVAUwXf23jvPkNcHJMmFzRZZ2LXH72hRKKI2c1Kx/iE+1LT/SnzexKKCf61IHQTwV6oHZz8iLy
	kJm4j3N3uIbkDV4fvgRWSsGIdGir+RQ9UHZV+H2PvN1oua9AZAotkkVdUSBTvqOuF17I7ANXAFJ
	OzjW2wjQDDYq1mU+W6fO8hqYiBddE4J55CP0gIGe5cxw6oRMyWw19Q1C+a8LlyalK/z8aVnK9sy
	S2ijeHrdbbIpHVCR+S0ZEZ+CX0qJcudd4n4a9aryZCi3qwt6z5mnPDKSgBsdZd3j8tL0h1Rvt53
	cCOHDTTj+d8MZfY0h+snmtGhPZHtkAuyYgHs2w07HgqxK3Y7uW3i5
X-Received: by 2002:a05:6214:d02:b0:70f:a15a:9262 with SMTP id 6a1803df08f44-70fac913518mr156788426d6.51.1756900715738;
        Wed, 03 Sep 2025 04:58:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF0SuucAVxarCRPLTRQqLCBZ9vgTwGAR38CNe/suqV5ZdIiT7GcfkR7BtO6JAAehjJ+4N8lVQ==
X-Received: by 2002:a05:6214:d02:b0:70f:a15a:9262 with SMTP id 6a1803df08f44-70fac913518mr156788056d6.51.1756900715127;
        Wed, 03 Sep 2025 04:58:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-337f50d30b0sm9891421fa.67.2025.09.03.04.58.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 04:58:34 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 03 Sep 2025 14:58:18 +0300
Subject: [PATCH v8 7/9] dt-bindings: display/msm: expand to support MST
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-dp_mst_bindings-v8-7-7526f0311eaa@oss.qualcomm.com>
References: <20250903-dp_mst_bindings-v8-0-7526f0311eaa@oss.qualcomm.com>
In-Reply-To: <20250903-dp_mst_bindings-v8-0-7526f0311eaa@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Abel Vesa <abel.vesa@linaro.org>, Mahadevan <quic_mahap@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=15159;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=mtHyzGTb9hrM/WTe1AikW5eypI0AzlUrgR71ld9KC4w=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBouC1Y/Ov7hP+0RfhsbREPtQrI7EbtVDbgL2Mnb
 OfGf0ybedqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaLgtWAAKCRCLPIo+Aiko
 1XbICACH7tBodo+5AqLshUai3suEs3+I6C/qFG56DfxXrBFYVPzokXXb0BN9PXyh4d6R8Re8J1i
 1aXhp9ky6a5KA/rWByQynQ4BRthTnqmKfWbvuLHy1DkUgFN0qQFB7bJDeO4VsVmwEELYKbgJEHR
 O3e75omP2lDcYuMiyoeSoeo+SF5Y04Xw3lDAMjHA1AqAod7x54LI2rIs2YdJ74tB2aHIK6EJCHT
 6Y7OP7DhZqvdJ2NrJ//L8rzeR/Zta1PAwFy5Pxez+uiXy9XXv55Xh5iTnx8uJ+C9YFMmGWaYC5+
 nADFdN9PUDG7KMERXf7B4Yva38dCRRhRvQtmJhqVFxtBW/a3
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=Ycq95xRf c=1 sm=1 tr=0 ts=68b82d6d cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=uRafYTt1GBQvBzODlV0A:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: xDyJ69-4Wwp4-VpSWSQaEus7cQFU0ONs
X-Proofpoint-ORIG-GUID: xDyJ69-4Wwp4-VpSWSQaEus7cQFU0ONs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAxMDEwMSBTYWx0ZWRfX9jtSvSRTPzD5
 KBuMKDswXzprCEqMbSkl6jXKi2RIYJe9bYjDhn4NB6iBYDGBW9/pRdTsfj8d9ZZgaKdJ1xtpG3R
 FEe8yXto3zF8U791o9AKNoma0KrVLAMHN1ztU5D2sAJ8FnYkcu+jOwyNayyssjCAznS7CpKlDIn
 VJCorKZy9ctsFlQd73YfgciK6cn413Jw29cfKaGYhTnryNos3x9ytYn+EZi0IbQeLxUpy888+pA
 Q229sPRG+0CqBDKL5dhotakGBQYTIbK48FN999ufjtEhrRHPpQbjMqNQ9xA+RcQEQJqBegebRpd
 eVvefQoMRoeY+Nom+k6v8Ify0xjPYUc7NjEFMzrPVx0BU00m5bx2j8T8wtyO7Q8+YTBzcPH5VNY
 T+cWoyc1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509010101

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

On a vast majority of Qualcomm chipsets DisplayPort controller can
support several MST streams (up to 4x). To support MST these chipsets
use up to 4 stream pixel clocks for the DisplayPort controller and
several extra register regions. Expand corresponding region and clock
bindings for these platforms and fix example schema files to follow
updated bindings.

Note: On chipsets that support MST, the number of streams supported
can vary between controllers. For example, SA8775P supports 4 MST
streams on mdss_dp0 but only 2 streams on mdss_dp1.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../bindings/display/msm/dp-controller.yaml        | 103 ++++++++++++++++++++-
 .../bindings/display/msm/qcom,sa8775p-mdss.yaml    |  26 +++++-
 .../bindings/display/msm/qcom,sar2130p-mdss.yaml   |  10 +-
 .../bindings/display/msm/qcom,sc7280-mdss.yaml     |   3 +-
 .../bindings/display/msm/qcom,sm7150-mdss.yaml     |  10 +-
 .../bindings/display/msm/qcom,sm8750-mdss.yaml     |  10 +-
 .../bindings/display/msm/qcom,x1e80100-mdss.yaml   |  10 +-
 7 files changed, 150 insertions(+), 22 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index afe01332d66c3c2e6e5848ce3d864079ce71f3cd..aeb4e4f36044a0ff1e78ad47b867e232b21df509 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -66,25 +66,37 @@ properties:
       - description: link register block
       - description: p0 register block
       - description: p1 register block
+      - description: p2 register block
+      - description: p3 register block
+      - description: mst2link register block
+      - description: mst3link register block
 
   interrupts:
     maxItems: 1
 
   clocks:
+    minItems: 5
     items:
       - description: AHB clock to enable register access
       - description: Display Port AUX clock
       - description: Display Port Link clock
       - description: Link interface clock between DP and PHY
-      - description: Display Port Pixel clock
+      - description: Display Port stream 0 Pixel clock
+      - description: Display Port stream 1 Pixel clock
+      - description: Display Port stream 2 Pixel clock
+      - description: Display Port stream 3 Pixel clock
 
   clock-names:
+    minItems: 5
     items:
       - const: core_iface
       - const: core_aux
       - const: ctrl_link
       - const: ctrl_link_iface
       - const: stream_pixel
+      - const: stream_1_pixel
+      - const: stream_2_pixel
+      - const: stream_3_pixel
 
   phys:
     maxItems: 1
@@ -166,7 +178,6 @@ required:
 allOf:
   # AUX BUS does not exist on DP controllers
   # Audio output also is present only on DP output
-  # p1 regions is present on DP, but not on eDP
   - if:
       properties:
         compatible:
@@ -195,11 +206,95 @@ allOf:
       else:
         properties:
           aux-bus: false
-          reg:
-            minItems: 5
         required:
           - "#sound-dai-cells"
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              # these platforms support SST only
+              - qcom,sc7180-dp
+              - qcom,sc7280-dp
+              - qcom,sc7280-edp
+              - qcom,sc8180x-edp
+              - qcom,sc8280xp-edp
+    then:
+      properties:
+        reg:
+          minItems: 5
+          maxItems: 5
+        clocks:
+          minItems: 5
+          maxItems: 5
+        clocks-names:
+          minItems: 5
+          maxItems: 5
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              # these platforms support 2 streams MST on some interfaces,
+              # others are SST only
+              - qcom,sc8280xp-dp
+              - qcom,x1e80100-dp
+    then:
+      properties:
+        reg:
+          minItems: 5
+          maxItems: 5
+        clocks:
+          minItems: 5
+          maxItems: 6
+        clocks-names:
+          minItems: 5
+          maxItems: 6
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            # 2 streams MST
+            enum:
+              - qcom,sc8180x-dp
+              - qcom,sdm845-dp
+              - qcom,sm8350-dp
+              - qcom,sm8650-dp
+    then:
+      properties:
+        reg:
+          minItems: 5
+          maxItems: 5
+        clocks:
+          minItems: 6
+          maxItems: 6
+        clocks-names:
+          minItems: 6
+          maxItems: 6
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              # these platforms support 4 stream MST on first DP,
+              # 2 streams MST on the second one.
+              - qcom,sa8775p-dp
+    then:
+      properties:
+        reg:
+          minItems: 9
+          maxItems: 9
+        clocks:
+          minItems: 6
+          maxItems: 8
+        clocks-names:
+          minItems: 6
+          maxItems: 8
+
 additionalProperties: false
 
 examples:
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
index 1053b3bc49086185d17c7c18d56fb4caf98c2eda..e2730a2f25cfb0496f47ad9f3f9cbf69b1d4649f 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
@@ -375,7 +375,11 @@ examples:
                   <0xaf54200 0x0c0>,
                   <0xaf55000 0x770>,
                   <0xaf56000 0x09c>,
-                  <0xaf57000 0x09c>;
+                  <0xaf57000 0x09c>,
+                  <0xaf58000 0x09c>,
+                  <0xaf59000 0x09c>,
+                  <0xaf5a000 0x23c>,
+                  <0xaf5b000 0x23c>;
 
             interrupt-parent = <&mdss0>;
             interrupts = <12>;
@@ -384,16 +388,28 @@ examples:
                      <&dispcc_dptx0_aux_clk>,
                      <&dispcc_dptx0_link_clk>,
                      <&dispcc_dptx0_link_intf_clk>,
-                     <&dispcc_dptx0_pixel0_clk>;
+                     <&dispcc_dptx0_pixel0_clk>,
+                     <&dispcc_dptx0_pixel1_clk>,
+                     <&dispcc_dptx0_pixel2_clk>,
+                     <&dispcc_dptx0_pixel3_clk>;
             clock-names = "core_iface",
                           "core_aux",
                           "ctrl_link",
                           "ctrl_link_iface",
-                          "stream_pixel";
+                          "stream_pixel",
+                          "stream_1_pixel",
+                          "stream_2_pixel",
+                          "stream_3_pixel";
 
             assigned-clocks = <&dispcc_mdss_dptx0_link_clk_src>,
-                              <&dispcc_mdss_dptx0_pixel0_clk_src>;
-            assigned-clock-parents = <&mdss0_dp0_phy 0>, <&mdss0_dp0_phy 1>;
+                              <&dispcc_mdss_dptx0_pixel0_clk_src>,
+                              <&dispcc_mdss_dptx0_pixel1_clk_src>,
+                              <&dispcc_mdss_dptx0_pixel2_clk_src>,
+                              <&dispcc_mdss_dptx0_pixel3_clk_src>;
+            assigned-clock-parents = <&mdss0_dp0_phy 0>,
+                                     <&mdss0_dp0_phy 1>,
+                                     <&mdss0_dp0_phy 1>,
+                                     <&mdss0_dp0_phy 1>;
 
             phys = <&mdss0_dp0_phy>;
             phy-names = "dp";
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sar2130p-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sar2130p-mdss.yaml
index 870144b53cec9d3e0892276e14b49b745d021879..44c1bb9e41094197b2a6855c0d992fda8c1240a4 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sar2130p-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sar2130p-mdss.yaml
@@ -207,16 +207,20 @@ examples:
                      <&dispcc_disp_cc_mdss_dptx0_aux_clk>,
                      <&dispcc_disp_cc_mdss_dptx0_link_clk>,
                      <&dispcc_disp_cc_mdss_dptx0_link_intf_clk>,
-                     <&dispcc_disp_cc_mdss_dptx0_pixel0_clk>;
+                     <&dispcc_disp_cc_mdss_dptx0_pixel0_clk>,
+                     <&dispcc_disp_cc_mdss_dptx0_pixel1_clk>;
             clock-names = "core_iface",
                           "core_aux",
                           "ctrl_link",
                           "ctrl_link_iface",
-                          "stream_pixel";
+                          "stream_pixel",
+                          "stream_1_pixel";
 
             assigned-clocks = <&dispcc_disp_cc_mdss_dptx0_link_clk_src>,
-                              <&dispcc_disp_cc_mdss_dptx0_pixel0_clk_src>;
+                              <&dispcc_disp_cc_mdss_dptx0_pixel0_clk_src>,
+                              <&dispcc_disp_cc_mdss_dptx0_pixel1_clk_src>;
             assigned-clock-parents = <&usb_dp_qmpphy_QMP_USB43DP_DP_LINK_CLK>,
+                                     <&usb_dp_qmpphy_QMP_USB43DP_DP_VCO_DIV_CLK>,
                                      <&usb_dp_qmpphy_QMP_USB43DP_DP_VCO_DIV_CLK>;
 
             phys = <&usb_dp_qmpphy QMP_USB43DP_DP_PHY>;
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml
index 2947f27e0585216ca0e1eab6a79afcb21323b201..b643d3adf66947095490b51625a03635c64c37c2 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml
@@ -281,7 +281,8 @@ examples:
             reg = <0xaea0000 0x200>,
                   <0xaea0200 0x200>,
                   <0xaea0400 0xc00>,
-                  <0xaea1000 0x400>;
+                  <0xaea1000 0x400>,
+                  <0xaea1400 0x400>;
 
             interrupt-parent = <&mdss>;
             interrupts = <14>;
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml
index c5d209019124da3127285f61bf5a27d346a3d8a1..9b0621d88d508fb441f004261c42c2473bea2bcb 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml
@@ -394,16 +394,20 @@ examples:
                      <&dispcc_mdss_dp_aux_clk>,
                      <&dispcc_mdss_dp_link_clk>,
                      <&dispcc_mdss_dp_link_intf_clk>,
-                     <&dispcc_mdss_dp_pixel_clk>;
+                     <&dispcc_mdss_dp_pixel_clk>,
+                     <&dispcc_mdss_dp_pixel1_clk>;
             clock-names = "core_iface",
                           "core_aux",
                           "ctrl_link",
                           "ctrl_link_iface",
-                          "stream_pixel";
+                          "stream_pixel",
+                          "stream_1_pixel";
 
             assigned-clocks = <&dispcc_mdss_dp_link_clk_src>,
-                              <&dispcc_mdss_dp_pixel_clk_src>;
+                              <&dispcc_mdss_dp_pixel_clk_src>,
+                              <&dispcc_mdss_dp_pixel1_clk_src>;
             assigned-clock-parents = <&dp_phy 0>,
+                                     <&dp_phy 1>,
                                      <&dp_phy 1>;
 
             operating-points-v2 = <&dp_opp_table>;
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8750-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8750-mdss.yaml
index 72c70edc1fb01c61f8aad24fdb58bfb4f62a6e34..4151f475f3bc36a584493722db207a3dd5f96eed 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8750-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8750-mdss.yaml
@@ -401,16 +401,20 @@ examples:
                          <&disp_cc_mdss_dptx0_aux_clk>,
                          <&disp_cc_mdss_dptx0_link_clk>,
                          <&disp_cc_mdss_dptx0_link_intf_clk>,
-                         <&disp_cc_mdss_dptx0_pixel0_clk>;
+                         <&disp_cc_mdss_dptx0_pixel0_clk>,
+                         <&disp_cc_mdss_dptx0_pixel1_clk>;
                 clock-names = "core_iface",
                               "core_aux",
                               "ctrl_link",
                               "ctrl_link_iface",
-                              "stream_pixel";
+                              "stream_pixel",
+                              "stream_1_pixel";
 
                 assigned-clocks = <&disp_cc_mdss_dptx0_link_clk_src>,
-                                  <&disp_cc_mdss_dptx0_pixel0_clk_src>;
+                                  <&disp_cc_mdss_dptx0_pixel0_clk_src>,
+                                  <&disp_cc_mdss_dptx0_pixel1_clk_src>;
                 assigned-clock-parents = <&usb_dp_qmpphy QMP_USB43DP_DP_LINK_CLK>,
+                                         <&usb_dp_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
                                          <&usb_dp_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
 
                 operating-points-v2 = <&dp_opp_table>;
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml
index e35230a864379c195600ff67820d6a39b6f73ef4..8d698a2e055a88b6485606d9708e488e6bc82341 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml
@@ -183,15 +183,19 @@ examples:
                <&dispcc_dptx0_aux_clk>,
                <&dispcc_dptx0_link_clk>,
                <&dispcc_dptx0_link_intf_clk>,
-               <&dispcc_dptx0_pixel0_clk>;
+               <&dispcc_dptx0_pixel0_clk>,
+               <&dispcc_dptx0_pixel1_clk>;
             clock-names = "core_iface", "core_aux",
                     "ctrl_link",
                     "ctrl_link_iface",
-                    "stream_pixel";
+                    "stream_pixel",
+                    "stream_1_pixel";
 
             assigned-clocks = <&dispcc_mdss_dptx0_link_clk_src>,
-                  <&dispcc_mdss_dptx0_pixel0_clk_src>;
+                  <&dispcc_mdss_dptx0_pixel0_clk_src>,
+                  <&dispcc_mdss_dptx0_pixel1_clk_src>;
             assigned-clock-parents = <&usb_1_ss0_qmpphy QMP_USB43DP_DP_LINK_CLK>,
+                  <&usb_1_ss0_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
                   <&usb_1_ss0_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
 
             operating-points-v2 = <&mdss_dp0_opp_table>;

-- 
2.47.2


