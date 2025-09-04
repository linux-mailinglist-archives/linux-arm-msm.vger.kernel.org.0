Return-Path: <linux-arm-msm+bounces-71982-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E4683B433D2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 09:24:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DF8A63B32DE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 07:24:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F005329BD92;
	Thu,  4 Sep 2025 07:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jhLEI/44"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91EBC29B8F5
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Sep 2025 07:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756970640; cv=none; b=o2U2xeRhRmCA2rjDnpDrtb6D/moR9j8Ve2ZgXTle5Z3EtTaaVM/yhq7euL54PNuIHH3jH0rvIPfoUHQBhG9+zz9Zvdem/Za9cKqLp5oXoh8MkKyJJ9GQW1ylrSazUQQR7jJ7wrCjh/8Y6nnJ/l8pC8kyvQVSqXUaqmO27eOXwRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756970640; c=relaxed/simple;
	bh=+O3JVszsjnLSrzFlB2OH9FsEdDEqIq5Fgx/8nAIsEh4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kjCog3/dyyNySryFUAghUu1x4oa9YBn5lVsS9//hp/dXmrWg5HBInDX84QqhPoreeqAbQAUWIXlO95j62MMXX6UXJnW2szjcHNBlxZpPj+MGOeeubHM8+ZIMElQGu18izDW3ZHQaFVewCjjj1uiqYcO/EEfk6YVS9N2nI1QIvm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jhLEI/44; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5840Un3k005573
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Sep 2025 07:23:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IU5cufGmzzYIjzid/BiRcbiln05RcV2CZkR0KkZBDZM=; b=jhLEI/449Th/2S0b
	yB8jz/PzwDHvlUpWEAPaa/Jk5QypLvBhbqDWuh5OtQYE0kCukp2ceCjYn4OF1iHZ
	vOzdV7M1Qat7F78FCVN5VOGpFtWwh36/BKtdNAoM//LhEtwLA59dz+c9PIrF0tc0
	5Zzs1vGtoO5qe/9S9fInBMq8zIxKSVc/VLA16XEnr+h7U++k7q1Vjg/ajm8pqGZA
	8gLhdvK/COpiqzYObN8UUC0N10sc4C4ff0ve19l24Q4+2s8wIRSxiUVBPQRY5U1F
	DAsSAvcsldRx/kFAnxNk18dPluyPWOYxKNTLnv8P3pBCSsHBaxeBCd3+jcJERSCV
	j+XUog==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urmjpj2y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 07:23:57 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b47253319b8so550782a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 00:23:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756970636; x=1757575436;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IU5cufGmzzYIjzid/BiRcbiln05RcV2CZkR0KkZBDZM=;
        b=TK2hltjMi8p7I/aUVhKtvxexQdvYSU0LT+02/ixR/15cMBf5acpXkjtWp/G7/beaea
         9P0d5XYOvXCU3d5JYSusfvcxOehYVfdB5IS19v1rIVeJADToffPg2DrGb2TNN5L8tyW7
         0rtbih1WeYqWQlx4d+ZgvPAop9K8uSZuRKb/J1bH9T/iGDdlbIpuTMPxnUhkdNrb/oT9
         YJQSY1zQZwQ1DNxe919isRu1jWE/luocJfL7SVPsGzjOZPYmzRYhA3lNMTP0QIM2jwff
         MCSmzgtGHJoCwK2iS76nQQXJ56SYmi6gymNNHLWVazh2wykEpE68Qyril01XjgRHqE1U
         0lrg==
X-Gm-Message-State: AOJu0YxOVt9Q7v4O2yCqmikSNnwQtEyKxVTPxfptU3jJEv9zLLhGdZVb
	13Tj/0D9ZmJUve4HOTT1vAYxDPGJ6kJBtuDjUPuRn62xL0sVEvRfb7MKCKERcn2WfUgzVQWmMBc
	FrldNoxDB7tkSO2cKHqs2ZQ+8QbEiuz2slo6JZfeXNpxdhMZR4SoZ0Q6Sjs0KywAzrg/l
X-Gm-Gg: ASbGncvnD6kfPVXkoRquUXDG8QGU16kH5TgQ5hvS1KfT0PdOgOkcwEoqxOaYw7F4tky
	SA4d5SRSC/zAeg99FOJtmC6gfVqhYVRUL2HddhlxSURPng/1A4jrx9Cu27OhAP8d2IvH/Ys9MkJ
	59En/h5vO9h4s1vqnytNGhl4AT0iSoqP89mtg/LmpLjMKQaoKfFdRJc3NZWJR8zaX7ugE55iCh1
	iw1dKwT38WF+T2paP6gf+EbB+9HhX7lJm35e+b4K4CWQgDT9PN//b1bnP/QH9hiFxtd0hfy78WY
	Bs0wLNljZqOJc8eU7tkJeUMdNWNv+BFOcg6X3GBi++glsEKNOfC6YEDIVL/QTrIzeqRfK10=
X-Received: by 2002:a05:6300:218e:b0:243:aa4c:afd9 with SMTP id adf61e73a8af0-243d6f03239mr24769356637.35.1756970635757;
        Thu, 04 Sep 2025 00:23:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFDePBQvO93ASzEYF1+34i/DP2V1A20QvNO3VpmRY7W2WN8nqtwQh7SOiu6OgkszsPY/xvBAA==
X-Received: by 2002:a05:6300:218e:b0:243:aa4c:afd9 with SMTP id adf61e73a8af0-243d6f03239mr24769313637.35.1756970635249;
        Thu, 04 Sep 2025 00:23:55 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77243ffcebasm14656452b3a.51.2025.09.04.00.23.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 00:23:54 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Thu, 04 Sep 2025 15:22:37 +0800
Subject: [PATCH v11 2/6] dt-bindings: display/msm: dp-controller: document
 QCS8300 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250904-qcs8300_mdss-v11-2-bc8761964d76@oss.qualcomm.com>
References: <20250904-qcs8300_mdss-v11-0-bc8761964d76@oss.qualcomm.com>
In-Reply-To: <20250904-qcs8300_mdss-v11-0-bc8761964d76@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756970611; l=1783;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=+O3JVszsjnLSrzFlB2OH9FsEdDEqIq5Fgx/8nAIsEh4=;
 b=Kfi4EmWe6GawXwHy9Ndco2Y9vej8kL59cvhYCKx46sfAb4L2FFOtnKHbKSIfKrGR8u3g6mTY3
 am8xMIDU7JFCQjofxPqxW9QOtw2NWgL+ViIv0KJj0LSh+8VgL2QTKhx
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Authority-Analysis: v=2.4 cv=OemYDgTY c=1 sm=1 tr=0 ts=68b93e8d cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=EzsmDbvTTSquCHoeoRYA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: 1jVXTs4N80xtJprz9yETjo-EcFfmraz9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNCBTYWx0ZWRfX93kleL3gOEm1
 dqNjiXpO81DDeFqRMZpMIFTioUNaGyl9SJJhEVZ97CbjfpB6yHAGAhkAlRez3XBdy3pAQlc97df
 IauSpSriYv1nIhRqbNY+U9xPneEge5uWMJfVEQADSgBxG7Opo1mGcktpl/P+YMce/ue+Zt7el4h
 DhezjqWP6WCarNmUTqJhV7QaG8FkunnR7GgBz2wV86JdEnXwOIFFqgy7lBjds2F0MZpYgl3wFCY
 YfaiLlPwb8jOKmlesZdZgp0uDh4IGelAjV5Y01j291t8xA/BRn2MymlJYHDtt2+iIYlXr8RnqAV
 qNkMz8qYbDjBzF3sNaNB4h7GcYliiugJIu2LiaQr/5lkBSzv/51HqUmhzj+oAS2eqGdkUIYhl00
 9X9OJQOk
X-Proofpoint-ORIG-GUID: 1jVXTs4N80xtJprz9yETjo-EcFfmraz9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_02,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300024

Add compatible string for the DisplayPort controller found on the
Qualcomm QCS8300 SoC.

The Qualcomm QCS8300 platform comes with one DisplayPort controller
that supports 4 MST streams.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 .../bindings/display/msm/dp-controller.yaml        | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index aeb4e4f36044a0ff1e78ad47b867e232b21df509..ad08fd11588c45698f7e63ecc3218a749fc8ca67 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -18,6 +18,7 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - qcom,qcs8300-dp
           - qcom,sa8775p-dp
           - qcom,sc7180-dp
           - qcom,sc7280-dp
@@ -195,6 +196,7 @@ allOf:
           compatible:
             contains:
               enum:
+                - qcom,qcs8300-dp
                 - qcom,sa8775p-dp
                 - qcom,x1e80100-dp
       then:
@@ -295,6 +297,26 @@ allOf:
           minItems: 6
           maxItems: 8
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              # QCS8300 only has one DP controller that supports 4
+              # streams MST.
+              - qcom,qcs8300-dp
+    then:
+      properties:
+        reg:
+          minItems: 9
+          maxItems: 9
+        clocks:
+          minItems: 8
+          maxItems: 8
+        clocks-names:
+          minItems: 8
+          maxItems: 8
+
 additionalProperties: false
 
 examples:

-- 
2.34.1


