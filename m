Return-Path: <linux-arm-msm+bounces-71981-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A6CB433CF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 09:24:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CB2543B4D9C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 07:24:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 813BC29C33F;
	Thu,  4 Sep 2025 07:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q+5s0AAB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C6A29B8E1
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Sep 2025 07:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756970634; cv=none; b=Nb4quxaUHWYDAzDEwmjOdA0pWSfIJJKA+cFSVX68oR+kAjt/XGoWbzcb0mdb0B1kcBsyb1WYdQ6lE0+JvDu1oBc8tTSgXPklaCFijQ1FDUTvDiQlyHCrXzYCxQnhqSAPFSVt/29cQNUkwXPs5o9rXWHPu8yp+5vSx7tppRH/S1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756970634; c=relaxed/simple;
	bh=gB7HmGiD8GjEmuy7612J5648tP6/6MkBhyVIM4ydbsE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=somP5T1uLs+cNSuA3kqT0wpzWyp8LiXlT2v1ec2qV/y73mdcek5y9Jxv1dNVoUDUgcFJU9wUKdL3q9ughE5ZfBN/Rbs1WG+dUTs6O24IQ3tueJfP+lgarTWZNUdodhRlStQNXOl3LmET5nK1veQt5KVNyE7sMRWQvmJqQIKKgUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q+5s0AAB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5841dAl9029641
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Sep 2025 07:23:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9GVW1gIOHT36zGHHStOfqVFIcMi+JiFxcWbVSTpf52g=; b=Q+5s0AABPsLBVdYQ
	yBfCoRTYSloNTSGx2dRijI0cYn8BYQDfiM7/gl7//OEvc4ghl4YD1dVQS8JF05W5
	ANgUWIgfNnyM/8B0PYYTFwzXnWe9mCZ3FP5VkslfqCxT58adzrJrZ6FkY1ibcWIN
	neQJmowZJbGv5thRum95dzvxh1MKda4ci1VtHir2Y6hDLkup/Oh2aLsyo/sGQJvG
	1A4zgFcQDji2jawR1wT81y+Ge1jHg0bzTLKuideLCNSrUGD1YvzkG4Ol0HIbrAa8
	TdQtzBeAfoNOGcSKuYk6syFaD4x46hcP2iFxv8Fdq5r6ogbv1uo3A7GfF8BHnl1a
	UF3qjQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urw06mt4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 07:23:51 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-76e395107e2so776840b3a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 00:23:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756970628; x=1757575428;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9GVW1gIOHT36zGHHStOfqVFIcMi+JiFxcWbVSTpf52g=;
        b=EiFZ81Mr7SBpOrnenX8ur3x71noPqEPIAVWl3+bpfarqe1mQci50w708/2WkF/hW3Z
         fhRzUvMEr6yBgAVpUwZbPooQEBIhv7R0uJ23gC6cnTkuXahnw6v0xJ0AsS7Jg3/8OKiX
         dPOh5ZED11dVSXTrHK2RqeYAxkW5h5RKOaOXCFkCxZGiyv9EZcFTw10DLF4krP7XQlez
         jGGzxP61uZm0L2ToblX9APiJmUpPE9zzBbFFsxsf83BgoYtjwp26m/n3LqJ9cNZe4/k4
         9oFbA9aN9lq/NL+rFz17m4XVQ3TRN/NPGVOiMNS+y3BG8OAau7NWw0Rmx/pJqndTC6u4
         28JA==
X-Gm-Message-State: AOJu0YzP2knFPx0HS33twWEVKxkJ51eOL1+Ft8u2gtqQuVXZML6xp4+1
	NPCtHZiI/+ZGOSNsWIQm0ItUiEigJUsFy6KAR9TvhaevrdPYSdMunB7Nn97o8Cpp9nkFzC+PBw6
	MhICimFVLjc3IHJjc4Rmj2ALSGmG6RBcz0KLJV/2CW86265Y1Z8x7cGaydq3/VJXYJXVp
X-Gm-Gg: ASbGnctTPjtUyZ5A1XXq3UANRXNKIwV95tLWDICYtDg6R+x6zY2d4I4IQrO2KXxlwBE
	brZcob7YRbqNq7Fab02yl42+E6PyQYuwbkh9Z4gHoyUbU857V00fnOnGLxavicbuYA9X3tM7pig
	FvYFgCQSFkZIY+pX/Er77EHmE7RzYlF8TwuIRVCTQhFYkxMY8W69i0MaSMKRGagwRRFZy/tdv9A
	dAugse9sP97/rT7LK8QMbAC86YRiUWgq74opxxfv4w8q1z2I6Am8K1ZyHif9/dzfGmuAu/cfikL
	LN+YqpQZQ1d+OFZ/GLAsFAjDkgep+v7icYxF1TunjQK1D8HA/zGhWmlecp42Yo2ZUJEJNu0=
X-Received: by 2002:a05:6a00:7450:b0:772:f60:75b0 with SMTP id d2e1a72fcca58-7723e3b1c5fmr21478357b3a.24.1756970628140;
        Thu, 04 Sep 2025 00:23:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEOSmxB9zN4NxPoJkLTcpBFf0RO7oPiV/YSxMz4H00lZgVQ0z67xbJrlIxbtRFrShD+RZf8dw==
X-Received: by 2002:a05:6a00:7450:b0:772:f60:75b0 with SMTP id d2e1a72fcca58-7723e3b1c5fmr21478332b3a.24.1756970627705;
        Thu, 04 Sep 2025 00:23:47 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77243ffcebasm14656452b3a.51.2025.09.04.00.23.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 00:23:47 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Thu, 04 Sep 2025 15:22:36 +0800
Subject: [PATCH v11 1/6] dt-bindings: display/msm: Document the DPU for
 QCS8300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250904-qcs8300_mdss-v11-1-bc8761964d76@oss.qualcomm.com>
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
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756970610; l=1298;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=gB7HmGiD8GjEmuy7612J5648tP6/6MkBhyVIM4ydbsE=;
 b=gE0tbp59NwJVvTLAcNX2z9/BDrDyVvGpk3+A5/wtShwkT7Rbo8BvTh8rqL+gw+DngvaZ3T32b
 BaddeC9p5G/A67nsj6U5kK360spcmD2o/VAjIQc4qpJK1WZaSkQMItU
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Proofpoint-GUID: NdZyHhNZxyewijGFcfmEwKYdxFrzwlVa
X-Proofpoint-ORIG-GUID: NdZyHhNZxyewijGFcfmEwKYdxFrzwlVa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNyBTYWx0ZWRfX6p3ToooYwY0z
 F8SdycnlqwEh9G2Pa2+CF1D9DyboZ/f0qd7ydGhsxrcR/hhJ6WRLXo4wamcLdk6LrjOrh8jVZCa
 Kx+EY1CVo5JGy0Ybx7hbjCZ6UCIEOuKvJcIG/hWDsf2lqMb2uT/OyNSrhmelwzJZXmNz2SND8K4
 AwjTji1kzG9MnAKkTatSoiRlXiQoruc+/HyK0wUM3jtb7mQ2+NTu1bI0PKg2rzl5RUCDUqvDih6
 rFhw3Zh0TfBz7fU8vutlsEIxMjTB6EeV9ggBV1zf0pCDcNxlHYNu+zpYYmsWqxN4466DjANWpbn
 9GvLpauvJul8CXDmBvkGiII1xzM6PzUJQUBh2rhPCNfTwLuvQcxoq6oQY9plcI0J9uyxD1Rgsks
 H16xrnDM
X-Authority-Analysis: v=2.4 cv=NrDRc9dJ c=1 sm=1 tr=0 ts=68b93e87 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=5ixSZjX4nqodb9qzXsEA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_02,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300027

Document the DPU for Qualcomm QCS8300 platform. It use the same DPU
hardware with SA8775P and reuse it's driver.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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


