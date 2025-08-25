Return-Path: <linux-arm-msm+bounces-70540-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D30B334B8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 05:37:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3EEFE3A2196
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 03:37:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0379B27510E;
	Mon, 25 Aug 2025 03:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fh4KurSO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DEF2245021
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 03:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756092951; cv=none; b=CLCSu53unJScOiQ872L9vKLly+rR8nWLWcKbdk89iPT5unfWI85vMn8hTw/ol5jFyO2kNF+9UGYvYBe1HSUaMMIsLYmv1vv39PxBmUBRnW1I41F00lumfk6BK8w37PHOB8F/E9ltlCTllpcSRLDUhAjHu5jFjHjh2ser17pDOiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756092951; c=relaxed/simple;
	bh=LBoCkIOz1nhLErv2TZjqow4lrif4gDacFutX3m6t01o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cgqH/qVjAu+yIGCNBEKInIwVz43Ip8kndbkQowsS1jxfCB2xphobTy9TKsLA+B96yGGYHddlAF6TTD9lg/Ft+8eBicO/YBhXwmxJZR1vmcsopx5BmMIDOl9SGG8G3P8jWtQqqW7+mUWovwpi6VtT4MkwnSbVQAcD9MFWFc8FrTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fh4KurSO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P0H3hF026226
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 03:35:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OZg83hCdtMCdsj3A6OZC0JX1BgccRkDWTc/mnL5LnSI=; b=Fh4KurSODOa3EQrt
	dHbbZmlijp7FN0kX/upao1z7v1quR30bPGFp+oiG1YbqE5SuyKpIZ0Efk+P5gTau
	zZvujRbFFZ3OBhtthckrPwCss2dIFCe7QmIvhXK3FZ5tL71H6JBGp67LEMJcYvnq
	ekRaf3k4ASBuHfbro975Q6cMFVclN84dLq9qK5gi2bACmHIorBh0EnQm9QhnpKmH
	fK8J3IeMIkP5xeSNl0A7oGshoeQKV8+fMD0aRzndLfqzYfStGxpAE+n2gT6FfLtW
	XLJiUJGekz+ydyae2s9wppZpMNUIF9PvT/25PnmtEVXK/Zs1vTYJSw1PI9ljuFlY
	k/FMoA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q6x83h3c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 03:35:49 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-246736043cfso38821135ad.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 Aug 2025 20:35:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756092949; x=1756697749;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OZg83hCdtMCdsj3A6OZC0JX1BgccRkDWTc/mnL5LnSI=;
        b=qV+lMORpAntn/AE/WwXxXtj1xWdZP/pK08VYNVQ/mz/owv+cOMLAbIQqhzXXKFpsgg
         zWHXg3+4ebQgTpoMB2C3CS4GHYjFEOPG0VAG6OiGonoFcM2fag38rPezMxrLPBFclcdX
         phvlcuaI4X1LoqhTJi6SDqUAXIvXcWFufHzkXjcj3gAZlmKl+OeVG0Qgy46/c1LZEn0u
         7UiqyY719o3gYpuCJyjxAL60L8GzCRYDLvpzXzN0FnTUcj99nkr8mFp7pcmH2FF0A7WU
         uPyMFIC1eSACubpvRLn4XO5DdUSifH2y8Onu9Z552YL7gtB/sIHOW4bOeGYryeP29gnX
         IAVw==
X-Gm-Message-State: AOJu0YwSborCizlWTJos+Cwvh2aiiuBtVgkEjWDgXV3gHN34GTbEapjF
	2BoPS3hI7Z4LIheoxqfEX0U+wnY5kD79rd58zdUq4DIOHAd5MpQwX8K7ExVZWUPSiGXOCYDZ9HG
	OMh7mXEyjL9mr1PVe9bBJYUBpTDCHf1S8ENQUYsRNqxn/mvWQCz1p8bB0hL+3uTUYpkwt
X-Gm-Gg: ASbGncta2I7hQqOetaaAdkl4wYmzieGZWAhZonIIdg5n83fQdjJyEF0Tc5ReiZ6yCUS
	cSgiIwkMRI3X0xaMRV+s+XBOrM3KW684w4uSCo9DniPz5ov0tytaeISJ4lsgZiH6+X7XneO6UFd
	HmFkvb5L1S6y0uDcZk+1HwX3B23JaasEueRPJyxS/dJ13IqjghcZ0etFFUFN8qCJW5tKIAzGdNc
	Jy2VjqVJv9dG67r0Vrlc3k6V0BkapY5BZPx1GoDia7zyhhlV/DkC+QZ876SlrZYPe1eOGCZNIVu
	93LnRcCJXOGD4/N6Qg+sDMs2L9EPSZXqvbnASN/ChFd9yS9XZQUlEomBnEZyaLybVB/7IGQ=
X-Received: by 2002:a17:902:e847:b0:246:e621:96f2 with SMTP id d9443c01a7336-246e621a7f1mr14024285ad.31.1756092948822;
        Sun, 24 Aug 2025 20:35:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGAwYYh6f6erS5AzdwM3CnzPO5hhkgBPJrkBabrpVRyKaCiZvK90nuAoQsSrtjRliZmm1vy1g==
X-Received: by 2002:a17:902:e847:b0:246:e621:96f2 with SMTP id d9443c01a7336-246e621a7f1mr14023855ad.31.1756092948375;
        Sun, 24 Aug 2025 20:35:48 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2466877c707sm54859565ad.22.2025.08.24.20.35.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Aug 2025 20:35:48 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 25 Aug 2025 11:34:21 +0800
Subject: [PATCH v9 2/6] dt-bindings: display/msm: dp-controller: document
 QCS8300 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-qcs8300_mdss-v9-2-ebda1de80ca0@oss.qualcomm.com>
References: <20250825-qcs8300_mdss-v9-0-ebda1de80ca0@oss.qualcomm.com>
In-Reply-To: <20250825-qcs8300_mdss-v9-0-ebda1de80ca0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756092926; l=2062;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=LBoCkIOz1nhLErv2TZjqow4lrif4gDacFutX3m6t01o=;
 b=Y+yHBkF6j80VW9ppElFvbvtjnk+nZ8Ffhpo8+67cKLzsDwk48Y5mh2s5hr8gMEoFRRIrPcw8u
 +7JcJitAwSyDuIAeqQZXYBlerGqmU+wJBEBKq3NyyCb6aTQPzN/Axvj
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Proofpoint-ORIG-GUID: IyWUO0G6hIwkGo4OwfUVECyGaGXpvs_F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDA0NCBTYWx0ZWRfXxlff36N5fmjl
 1elJggOHm7cWTRZ/gp+Ls309xdjcoPQ3fODvOA4LVdUb6i0U/ERwhe3Kq0kI4tZyKrlkHhf11GS
 HGSgH4PArvFzwLCNbWJirEyH9XkJPQfagRGuQHhD18lYHUJljry/sAT0SxdpnQrDRh5Gcx3O+Zm
 bIEt6G4i6AJBSr0B1EtjYXfSW36dJxebHaKALlCG/r7EgNZbs2DPcJoCmDapDrwhQhJ5IR6Loan
 DKR2QW4qOuDknktOoWx5cGIBLl2Y1D7tqK2JwFswcpLWZRPEYlqg/utNCHA+MwJCJ2ZVSNfh4+P
 vkreW5Nbb5/SlAi3ZMzUWeVuqC9LL7I0CBuWsKsPwSnf/lAjGa42Vm0D5InRu2+XzXGFvGMIna0
 T4tQNs2k
X-Proofpoint-GUID: IyWUO0G6hIwkGo4OwfUVECyGaGXpvs_F
X-Authority-Analysis: v=2.4 cv=Ep/SrTcA c=1 sm=1 tr=0 ts=68abda15 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=eRoelbRBQ5ypv8gDxK4A:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_01,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230044

Add compatible string for the DisplayPort controller found on the
Qualcomm QCS8300 SoC.

The Qualcomm QCS8300 platform comes with one DisplayPort controller
that supports 4 MST streams.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 .../bindings/display/msm/dp-controller.yaml        | 26 +++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 68a6fd27506fda004e53174db5bcc88a29e8d2a6..4da22a211442b7abe2dc18e769d8fd14d224eb40 100644
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
@@ -179,6 +180,7 @@ allOf:
           compatible:
             contains:
               enum:
+                - qcom,qcs8300-dp
                 - qcom,sa8775p-dp
                 - qcom,x1e80100-dp
       then:
@@ -241,11 +243,25 @@ allOf:
               minItems: 5
               maxItems: 6
         else:
-          # Default to 2 streams MST
-          properties:
-            clocks:
-              minItems: 6
-              maxItems: 6
+          if:
+            properties:
+              compatible:
+                contains:
+                  enum:
+                    # QCS8300 only has one DP controller that supports 4
+                    # streams MST.
+                    - qcom,qcs8300-dp
+          then:
+            properties:
+              clocks:
+                minItems: 8
+                maxItems: 8
+          else:
+            # Default to 2 streams MST
+            properties:
+              clocks:
+                minItems: 6
+                maxItems: 6
 
 
 additionalProperties: false

-- 
2.34.1


