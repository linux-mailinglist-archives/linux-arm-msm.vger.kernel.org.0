Return-Path: <linux-arm-msm+bounces-69642-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4373B2B7A1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 05:35:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5083F3B78B0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 03:34:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB86F29D272;
	Tue, 19 Aug 2025 03:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QBKnSicd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57BC42517AF
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 03:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755574444; cv=none; b=DcoTAKdYwBhT0TLaeGxP72HtBcgLZ+cbACvSINpOZ5OHY4yqJGvFB1wOmv/iQt/etYmlGC6FCAwE/HOXyjKlXd8TtakY4AF9bEO260NCpVud70s53lRgqTEGdiUMYUAagoJI2HCleKDmksibWsC287gA7SdGja166L7EhGpER04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755574444; c=relaxed/simple;
	bh=Vcbndb0BitXQXBCCDy5phydPWg7MwP6Brhlf2YVSZNE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UsBDy42Ezi295hLnyY5tYwqrwJFPxt7IyFMUG/802VNfOERxZkGe3Ne+QjqPLJAMCeE/2eqLhtos4JSVVxjmDs8jTRrJwm72s9/c3sFvgVUW5OwDxiBnPMclnns7TfDSdMHMJVD2yETRb6EtuWrw+UPv7aBNQz9c3ko992JgF+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QBKnSicd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57J2gZf1025353
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 03:34:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0Yg/2s8cwpHYy/pmAzzHeffOyyjabiwQv6sxOo7TaLA=; b=QBKnSicdQ60U/RwN
	rM6ti3M1BzNnCvfb60iv4nHKRyBJOZ6zFdz3gGXKfue0X2x7mBm1deVbpbV9GDF0
	2QQW2+NbvJTGkCsJ1ees8a3yJFgoq+r0rFhwac3NRrDZJDVCTWuX+LQvBRrsfo2L
	WFmN/bNLWs/MZ/P4XP/dwWiA9zL9UMInCRS78jIcz4UvT/3YCy3qv2kqcYyltXqA
	o5/XizvG21twe/cuJxfqlKFYl8oYTV0c6xrxxQzTAPFHjERLCbTE0da08jOdtFTe
	5noXDm3aKwatKwF5l8o3FMCpQuhx4RK31pDU/g+h64b20/CvCoWQb/IvA7n4loY6
	6Jw0Ww==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48m71chr7u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 03:34:02 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-24458067fdeso57981035ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 20:34:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755574442; x=1756179242;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0Yg/2s8cwpHYy/pmAzzHeffOyyjabiwQv6sxOo7TaLA=;
        b=AYh+8BTwnPJVJwVzAZJYssE2iddILoHY5tQmNusoYLxwSPr3mqaUJeOe6Z2qw5S8fO
         LIiuMN74TC8+5PyEkhgFEwc24WIIBrtun06kPoTvs+Zn//yV0IC/Th0I3AoYwxE1a1Lg
         eVg8KTV+gPin9dV6NF2hf8RmqvMql52XVF+PEPVGPHZOMD0AyONg68YylHP88XWcQSRB
         bXBHCq/+3qcxdrQjd5l4XKm/euQo648iBAeVHgp7rfqj5SBIfNkVaRU9k1ON0vHVgdb3
         qtc+CgCyEu0DXhgMm5RYCSEDU2/e1mLQpX5bkAfemRHdXCPd4jVJi0Gf2LKTDQ2VIMX+
         MCLg==
X-Gm-Message-State: AOJu0Yy6HDRRY53UqMVx0TgkfYoGkecljP37fh+ZFAbh2bR3KLUsHEy9
	9DdqhEn1JeeAjyUyt0MrmUozvhHOcUebkxOgzhcCQoBf2hCBEpj6HUL7QU9suwvV9T8sSGK/J5M
	oUFXZLFyRJkYMelRijSCSWAOfgLve+V+VLX2RRAdGChTG+wKB4jvoSlMszn5Ad2z+hvUQjiuS+Q
	HvT41XDQ==
X-Gm-Gg: ASbGncvrTmdDGrHwKzgXALfblm4+g5fOoeMuRL3eZBtzNaEidn4bBvMTKAAL4xRf4cL
	kgzKQjycbRStsXc6CV0/bMzEPs+4kClQd2YnrItSD/HpJjxQMd+yETGjqdFRCuxKee590vrBe4C
	yBah9ovKLrk3Mt+IMpy0CqXw1PsPlJKQECfemY6oyQJxtMpql0kRUs+nzMs63a1E+u02GfN0+PY
	5ABQx5aduXoiGxWL3ePCOcV84wfPBJ5ErxZDuW5KOV5EBEFb6V01Jnbjy0W5qv5O9fy17y75Dzv
	IGSU1b5d/1Wi98Rrs6TIlbZGVoNz8mxEKOOpKJiQPRsDto7FOmuLR+exLKkBcglpkuvF68A=
X-Received: by 2002:a17:902:da92:b0:242:eb33:96a0 with SMTP id d9443c01a7336-245e0328fc4mr13756375ad.25.1755574441581;
        Mon, 18 Aug 2025 20:34:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFrNApVEFRaReBUGFIN+/yStP1nVoxmL/eBm8PHCEFQfNZ6i4GKi9pKkySdHpDkpBiZwAMlig==
X-Received: by 2002:a17:902:da92:b0:242:eb33:96a0 with SMTP id d9443c01a7336-245e0328fc4mr13756125ad.25.1755574441145;
        Mon, 18 Aug 2025 20:34:01 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446d50f55esm94486325ad.82.2025.08.18.20.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 20:34:00 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 19 Aug 2025 11:33:28 +0800
Subject: [PATCH v7 1/6] dt-bindings: display/msm: Document the DPU for
 QCS8300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-qcs8300_mdss-v7-1-49775ef134f4@oss.qualcomm.com>
References: <20250819-qcs8300_mdss-v7-0-49775ef134f4@oss.qualcomm.com>
In-Reply-To: <20250819-qcs8300_mdss-v7-0-49775ef134f4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755574426; l=1231;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=Vcbndb0BitXQXBCCDy5phydPWg7MwP6Brhlf2YVSZNE=;
 b=mUJMxoOSV81o4koxqdJbI5N6soG55O7wbqXD0dzr+1rxU6/SC3oVCKT8159FPywHXQQd8ZJ94
 FWOBhhiXatDCGTTsP7IYgNL+9ROa6RylZU+9nOngybefW6dHuZUr5tm
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Proofpoint-ORIG-GUID: UKsjtN-IX9H2NJIGCjN-lsf6o9xgnOKJ
X-Proofpoint-GUID: UKsjtN-IX9H2NJIGCjN-lsf6o9xgnOKJ
X-Authority-Analysis: v=2.4 cv=IvQecK/g c=1 sm=1 tr=0 ts=68a3f0aa cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=5ixSZjX4nqodb9qzXsEA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE4MDE0NyBTYWx0ZWRfX+ZcZTuURPPF7
 rvIsP+R7jlQU+azZT87g/WFcGGru+DjYai0CzsuhaffxREdfeQg5wKIRTFwgVLlTD+dkUcO0FS4
 Aa/5gsfa7UPv67NV0PbEf3apR02e+WpzPfgcUnNAbUKE7IwfX6A6axozEd6BZr8+sGuu1DsBset
 tdSzywZT5J6kCgG0iAMT5H9AK3CQpbWMFOPa9ifA6wRpAoP6scQll778KbMgCHHhwyHCUsRlqoT
 J3NjxdemCNXxCO/Kcm9mVeKF5PSZ4BDhL7vXbuqEQvz5GMN4WCkA90EafwHHL99IO4rUhwz1pBM
 bfvb02oHLW42O1jc1PgDeW4IxMF9Wf9XK7bPZw/hN7IURO+r7LotYpb0n4ya/JlBtR1w0MNMM39
 sFkRzdGP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 malwarescore=0 priorityscore=1501 clxscore=1011
 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508180147

Document the DPU for Qualcomm QCS8300 platform. It use the same DPU
hardware with SA8775P and reuse it's driver.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml  | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
index 0a46120dd8680371ed031f7773859716f49c3aa1..d9b980a897229860dae76f25bd947405e3910925 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
@@ -13,11 +13,16 @@ $ref: /schemas/display/msm/dpu-common.yaml#
 
 properties:
   compatible:
-    enum:
-      - qcom,sa8775p-dpu
-      - qcom,sm8650-dpu
-      - qcom,sm8750-dpu
-      - qcom,x1e80100-dpu
+    oneOf:
+      - enum:
+          - qcom,sa8775p-dpu
+          - qcom,sm8650-dpu
+          - qcom,sm8750-dpu
+          - qcom,x1e80100-dpu
+      - items:
+          - enum:
+              - qcom,qcs8300-dpu
+          - const: qcom,sa8775p-dpu
 
   reg:
     items:

-- 
2.34.1


