Return-Path: <linux-arm-msm+bounces-68176-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 905AEB1F364
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Aug 2025 10:35:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5DF217B4AF2
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Aug 2025 08:34:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 126C627F007;
	Sat,  9 Aug 2025 08:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GcrdEFS2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA0D280CC1
	for <linux-arm-msm@vger.kernel.org>; Sat,  9 Aug 2025 08:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754728458; cv=none; b=ERtwBGA15V/xL/1QvMTxj1e44ke8lfhmgDl0LlVN6Cyu2PjTAmEP+1jKsrwN2UHUgNkGEuHWhqrdiou0D18Lx+kJMYSkb9Ruuc8gOZAdxkR0hLn5vuhvaGZ4xIAFWm05WjyWyzo/fafK9YH3FlT9chDmJFg/X8Db+2OPMvy4Y6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754728458; c=relaxed/simple;
	bh=QH9bEyRbTgQr/SMtP9uL6CI/xPFqXWvcCxc4003YFY0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bgwzNYpMjRxD6LD9ZqPuYmFA987C9NXSBMqf/YYCexjrAM9R1swh06YNn820cn9L54xAW00mlZA7Qc32/5qop7xw9AUHd1KaqsiPpuYpY/OZK5HSwXo5J8yvDIBgDugVC1vqrdf6KMx8VBRtRZulzs0k/ucJRTTK0nDh0XkQUio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GcrdEFS2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5793VFSt002766
	for <linux-arm-msm@vger.kernel.org>; Sat, 9 Aug 2025 08:34:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E3trp5QopP1lAPE08Rxz4pqQidjVa3JjOfwrhzJqniw=; b=GcrdEFS2qFFViL1g
	M5Q1DP7GX6tuYbRPfEugaXlmvz+bC6fzBhJwEr/fvzIYVulrUJ8UxA5rw4iFM+Uk
	kuDQ3lNiOoqWNwrGDQw6BAUQEGAHjEFEr4rjKkyODD/29f7AcJdEON80b1xNOEaq
	fPi6fTSMDME+V9G2lywgNRMTh3irv7zOg1lBE7XN7IQG9uzJjALn/RLjR2l2WDBz
	JK+kFgOFMDvJWW34qnDeXfZdhtgy9pMA6pt9/YaZuQCkQkt4H8MEu1Y0SA96i3zO
	eIlXsWaF5RfLyJZOPl15FQXaic3iWjIm7kPjzMFfZUYYs1AzLE06lYWt1RrCRm9R
	YYoDDw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dw9sgev3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 09 Aug 2025 08:34:15 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b0791a8e8dso81339151cf.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 09 Aug 2025 01:34:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754728454; x=1755333254;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E3trp5QopP1lAPE08Rxz4pqQidjVa3JjOfwrhzJqniw=;
        b=cdxQCssnxwyJpYCJe+b/ZV4RFEsrYS84gTl2Cc0aOlJtvnb85hC/drkkWJ99TkHrvS
         dSrVnBtbluhd13mJu2fkCGKoPP0im5qbAnncvsCVQsKy5sWlcX3WvAYAE7DQrkNt8ymB
         QAiAVht+wT2o3WLyKeR70W58obe1P0M3XSvpBfMBHpTSTRZkSAKzVUhzxwRy6g6gkJvj
         g5Dcs21Pi22VhNwwuQv/flCa9bBezi176WpqvUWgDLyePSuQUq65xRcxzfz1H1QsO9kj
         j46FAD3bZhD6HvfmxGxymT8t7A84ywb3VwCUFZrypUrZIOv34uqDjsQKeh7YOY3L5YgD
         eH2w==
X-Gm-Message-State: AOJu0YxVYKBXgpTBSAkbhFWK9Oq53qUvekbNKMfa8ER3Fyrv1ZCY54Rt
	TDDRT8W29qbe81gbFVY42AgrKs46t3HCNWTrqrAFe68ZJs5LYzSAkKB8sXmzQGV+40hCHXTGRKp
	lpaAvKxl6Yl3l7rhZVZCT9pcn8wZMp/kYvXVnpB02U/FcICMLaKftjs1X5WJ8HhDUGtAV
X-Gm-Gg: ASbGnctDR8OWbCyUcJcXSZIqvoXN5/b2eHj6Rhfz7eZVoqYy9tHv9CqvxYh3W6iEMYG
	C0KRLtkOHlwEnZIvrIqxbQKET/6npEVdJyg5LdWNQDh1vsvn+/hn8ZndG7Vzem2q6UPteNbDg/V
	ikx0mnzSLdOPpBLdo7w+S1e04lYRE+r3OYkRGgYgFGprfUIeKUvliv2v3WKqrZ9p4QAX2qJsqO+
	DULQdbSwKwFkildkFTuITXNu2D51dOYgqqyncMG5hz8LNUVvNL5cWYyyXPs5db8xt0MoOIbhuVw
	EoA+IP9UjHchcBXrxdUCO52kcgVaxSa2q66EmeGiVOfi8hndU5ApQ6XNBHK5z5JRVINZQILhGm/
	FZbrpwFgNXzuv5+YPl//Yk33mrYIQIfH06Q4n7mLZl06KH5Vzu73C
X-Received: by 2002:a05:622a:28f:b0:4b0:86b4:251a with SMTP id d75a77b69052e-4b0aec8cdd9mr83983691cf.25.1754728453618;
        Sat, 09 Aug 2025 01:34:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGyCVZKSBHC54JdM5p58f1S5MyswhdGCal7GFylGg6435Jt7NqmdsgKodNFmS0caxCzIEusvQ==
X-Received: by 2002:a05:622a:28f:b0:4b0:86b4:251a with SMTP id d75a77b69052e-4b0aec8cdd9mr83983291cf.25.1754728453106;
        Sat, 09 Aug 2025 01:34:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b88c99078sm3268166e87.102.2025.08.09.01.34.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Aug 2025 01:34:09 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 09 Aug 2025 11:33:56 +0300
Subject: [PATCH v4 5/6] dt-bindings: display/msm: add stream pixel clock
 bindings for MST
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250809-dp_mst_bindings-v4-5-bb316e638284@oss.qualcomm.com>
References: <20250809-dp_mst_bindings-v4-0-bb316e638284@oss.qualcomm.com>
In-Reply-To: <20250809-dp_mst_bindings-v4-0-bb316e638284@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=11374;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=hGc7fsj26Xga3qWRP+i8elMb6OQNsJgXKaSRfZLzYug=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBolwf0KI+oF4eOEW8yL11+SMTWknHyvnAzGAJNd
 MqeGrmMpCWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaJcH9AAKCRCLPIo+Aiko
 1UUrB/9jkpj+O3jNlxE+6MFnrVWv9baLIm5rhTNRw44C2CRZjwPI1qKnuOGqWnmTQyBtPdjYLDq
 CWTJrAv21OoBkOh9mlelwnSl9Ea7LxlsUCZn4+lH0IUyHi9ktIXcTi75ijvWKV98iSNJ0NTdOjn
 qY5I+X2ObQKYXRxrWyaZVTBtBsCHnkRiXbuPP0wimrqUp5S69oRo3dJqzK1U7MUj9HA4RwHxnFv
 CGhXuZ453goAQof+KEVxG7Xlr5jzLF+INB42oBwLMRITHp0uuhIuhVKzEVE2s3rSeud4tE0BXzU
 YDgxm8/x8Lu6KMjOjRKlPNBYtpS1RtuOWWrUMfZdj9GK3J8n
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=J+Wq7BnS c=1 sm=1 tr=0 ts=68970807 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=oIdPugyScH22JW1vPx4A:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: drILBUH8--syCmPAjDkb1UXdTfOmo2HA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAxNSBTYWx0ZWRfX++2GEjY+tpmx
 8SYreaWO98BL0cGEdjB+YdJmfRLr4AW+ROqPQ3DhECgkEUSJfovW/huK+bFeGJ6ygO8IvI6ZBkD
 6TSrJ6MTTuNpXnrfcc8T/0fScpEucR568nle+enTx0G7EyIvw4uRL9PgG1WK9gwXuv8LNyqeRlY
 AXeRxaRwRBBBTLX91m33SKookFlZkWnJJvH2awMJquMNZsJn4rDmO20VqqHrYFSz+WHNXtX8TvQ
 KXZ77uLR4K4H2Ldfeupr+YWskAOs49698T8mBiosOzMSKz410cojKHdlkzeYEyeeZJOD0DCISTw
 dz9j0j6PXQKf8W971QqksxrJqJR1zJRlAp8kWeFu1YTfIbphyybqImJ6hy1t1QEZwwY2D0zJS3u
 h/m1sTgh
X-Proofpoint-GUID: drILBUH8--syCmPAjDkb1UXdTfOmo2HA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-09_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 phishscore=0 suspectscore=0 spamscore=0 clxscore=1015 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090015

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

On a vast majority of Qualcomm chipsets DisplayPort controller can
support several MST streams (up to 4x). To support MST these chipsets
use up to 4 stream pixel clocks for the DisplayPort controller. Expand
corresponding clock bindings for these platforms and fix example
schema files to follow updated bindings.

Note: On chipsets that do support MST, the number of streams supported
can vary between controllers. For example, SA8775P supports 4 MST
streams on mdss_dp0 but only 2 streams on mdss_dp1.

Note2: SC7280 requires changes to the clock controller bindings.
Corresponding patchset will be posted separately.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../bindings/display/msm/dp-controller.yaml        | 73 +++++++++++++++++++++-
 .../bindings/display/msm/qcom,sa8775p-mdss.yaml    | 20 ++++--
 .../bindings/display/msm/qcom,sar2130p-mdss.yaml   | 10 ++-
 .../bindings/display/msm/qcom,sm8750-mdss.yaml     | 10 ++-
 .../bindings/display/msm/qcom,x1e80100-mdss.yaml   | 10 ++-
 5 files changed, 109 insertions(+), 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 352824c245224d7b5e096770684795625fc9f146..0a6f5920565efb31da4cf23d6c8795556471e9bb 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -58,20 +58,28 @@ properties:
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
@@ -187,6 +195,69 @@ allOf:
         required:
           - "#sound-dai-cells"
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sc7180-dp
+                # temporal until clock driver is updated
+              - qcom,sc7280-dp
+              - qcom,sc7280-edp
+              - qcom,sc8180x-edp
+              - qcom,sc8280xp-edp
+              - qcom,sm6350-dp
+    then:
+      properties:
+        clocks:
+          minItems: 5
+          maxItems: 5
+    else:
+      if:
+        properties:
+          compatible:
+            contains:
+              enum:
+                # some of SA8775P DP controllers support 4 streams MST,
+                # others just 2 streams MST
+                - qcom,sa8775p-dp
+      then:
+        oneOf:
+          - properties:
+              clocks:
+                minItems: 8
+                maxItems: 8
+          - properties:
+              clocks:
+                minItems: 6
+                maxItems: 6
+      else:
+        if:
+          properties:
+            compatible:
+              contains:
+                enum:
+                  # on these platforms some DP controllers support 2 streams
+                  # MST, others are SST only
+                  - qcom,sc8280xp-dp
+                  - qcom,x1e80100-dp
+        then:
+          oneOf:
+            - properties:
+                clocks:
+                  minItems: 6
+                  maxItems: 6
+            - properties:
+                clocks:
+                  minItems: 5
+                  maxItems: 5
+        else:
+          properties:
+            clocks:
+              minItems: 6
+              maxItems: 6
+
+
 additionalProperties: false
 
 examples:
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
index 1053b3bc49086185d17c7c18d56fb4caf98c2eda..2ca7a12bb4bcb4316107c5f5dfc69b0f9959c3a0 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
@@ -384,16 +384,28 @@ examples:
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
2.39.5


