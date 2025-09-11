Return-Path: <linux-arm-msm+bounces-73107-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F92B5303B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 13:25:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7803C3AA262
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 11:25:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CA7531CA6D;
	Thu, 11 Sep 2025 11:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hwRPrjMO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF39631CA5E
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 11:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757589865; cv=none; b=jCeFViI6+Z1cGnVNvxrelArSYcs1oFs+LpSKfkcOuiHRddkFeTgFHKTlNmcxot0a6g19ZBVe0/F2spA6mx0XR4FuYuz3sYrO7GXwysPlcTMcAqOnOIMztiiRMPOa7ON1ApFYAt310KSn0nVs59/qZVB93TT1MXYzD08lW7aT2e8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757589865; c=relaxed/simple;
	bh=fxALVBYM7qYW96U/dSw79twk6v0y6XKjhtJ/F/CsPC8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XCXBZquoFgqcyWrJk4zJTfcu0+cr9Dq+kW4yC/N3AajSviPj+YwORB3aQcgYRZBdADlwnBXSVP4Sd7wIw3d0AVV2hhbQi8kMDGNswTXVfe3AEHuha6hGX51p3dFYvlcIxt0zUz8Jc/nG0uuJwGxEPdQsF8aBB9yHk8DtAE0ROHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hwRPrjMO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BBGDvh003364
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 11:24:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IzFssouc9mamtc9gsC/kHechOIc88AvDywUnbNXgus0=; b=hwRPrjMObMo9ewQ2
	bZ2FRPfklMfCBgxcNDuAMvSOQJEL3OMOZlMu22wXiTQ/Pz0gaSk3KdaFtYdjMPjn
	BM+kYpzsBf2pGeklKaqK8OVdsf38EDkH9ghLHcrgiNadZ5msZEtjFvKhP/Y6vk/Z
	25J3im2pggNKTRSiUHvsM6VM+4tTDeLzfhoqOks0xJZNWMvoaBadFD8oDGSjXNpt
	dcBA8rPJ6whZC+LXskg3pisw/6FUnvUrP2OfcGTD+DmObqhRGbzbluS17JGj2xEt
	vGXGHkkUX0/hbwcBLd/elrGPvcW7DSu7SNfaRPtCYcpIftlluAxDOeKhdW20MWnf
	az7yxg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490db8qeya-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 11:24:22 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2507ae2fb0fso5588595ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 04:24:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757589861; x=1758194661;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IzFssouc9mamtc9gsC/kHechOIc88AvDywUnbNXgus0=;
        b=B8IF/7XkIE//P87hW9PsS/9tN6XoUD/0N4r8pf6VFutUl1t1xbpHu+0cuuy4BKVduQ
         mZ7Q0qrVpGj8Z6r6sNM+BPWuKWCKuZPFhRl6SNkHxzKeE+fxb4tTDkIkH8r7WNIGv4O4
         GAg/vs/rsKjRPllnc47s+gfiTmA6d416ntfvGPCEI4ozm0jSHmMHgmsGXA7mqwG6RgtK
         oOcvbNnzjrBB4lkMP9TJHw3RH4LoeeHp88QKdmUsQEVIKRnxRde05fePPo7ORgTTFUdd
         j95+w8I+PdU1bSbiBqT8Cv2lhGAUJJPOSQWwBNR7+D086Ax8818mDipAzl2fNhcBRdh6
         +3eQ==
X-Gm-Message-State: AOJu0Yy3NYQurXO7pl9As/cjQWj3AFLgWhT8BvcfjUz5w9GFY+WG2s94
	ZxW0jnri4aBcgNWDxORTTHQJsozkFGSqU8ZK9XkhyDDpE7C8tIlWfV20fYpP+CBzIFJEBUSB4EM
	ZWqbd/HUjNU5c++ejMHwbexjLK+zLepXdWLi876NqQ+ji7UWibvUpd0BKDQYP/h6utCdj
X-Gm-Gg: ASbGncsDUSadrnmnOZhV8C+Zjzkl0ksgdufokXyvt4vCE/Jg6gD1Eh3xRHmh+jM5MLH
	ivtcsGMp4me8Uem/7ZpQgPUkokMQ+08RvrBGCs9e5O/i7SBIm99ILyAIh2aTTSE8NQEEtBASbye
	cnWAi/dzw+GHv2ntwTrleSNEFs71yea3n5Wfc6P2wVp0YYMtUa3d47Oa3P9w6sm9kXzpJI/wg1K
	XKXeZJdF8ydD/eu1JrfuyizcDhwvLNuzhNA6UrxyaA1+uLKPNzaqgu10OaDns2fkgHRx/9Xjr19
	fe6MwoO+cKYrmmJ7jPf0q4u7ronmInJBGIb6uUL/pFE3KaHL9fYpu3IEsTDZqgkjhs7+QqQ7352
	/1lx3liceaX+DrkBM1ql+IWgrB9uaescZ
X-Received: by 2002:a17:902:e886:b0:25c:a9a0:ea60 with SMTP id d9443c01a7336-25ca9a0ee09mr5664925ad.42.1757589860741;
        Thu, 11 Sep 2025 04:24:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGwhy+ThWRQzuFVTo3tgTP57p2T1jMEsKjOoHNoY7Em1lQydlaLgExlKlN33CpwQLV12SmqA==
X-Received: by 2002:a17:902:e886:b0:25c:a9a0:ea60 with SMTP id d9443c01a7336-25ca9a0ee09mr5664645ad.42.1757589860248;
        Thu, 11 Sep 2025 04:24:20 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25c37294b17sm17005365ad.40.2025.09.11.04.24.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 04:24:19 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Thu, 11 Sep 2025 19:24:01 +0800
Subject: [PATCH v12 1/5] dt-bindings: display/msm: Document the DPU for
 QCS8300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250911-qcs8300_mdss-v12-1-5f7d076e2b81@oss.qualcomm.com>
References: <20250911-qcs8300_mdss-v12-0-5f7d076e2b81@oss.qualcomm.com>
In-Reply-To: <20250911-qcs8300_mdss-v12-0-5f7d076e2b81@oss.qualcomm.com>
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
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757589847; l=1242;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=fxALVBYM7qYW96U/dSw79twk6v0y6XKjhtJ/F/CsPC8=;
 b=5XItcEhzZr/Ql1Cbibe/YCArxvl6ARnxlQ2S6RUK1cWoBIjKyauD+Eq+u4y6FKJtpzjf/gEjm
 RCFyyfO50tzC4Yl+qv/XfFLb8u3DpagmsLf0DbQDSM/if3MSmoeMw5X
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzMSBTYWx0ZWRfX9WZiSIornwaN
 plwV7d56yOH4tbneBbwyvVOzfby0tEciYMTlbiL/00FUBvhJO43mG9w/y//vt91MxSNtOlaUi/x
 H7/z2CT0rD9hf6bQCSlmBZXGYVeZeUqhMSnpAHQGLWW3YvDyZhIT1Ys6r4yzfX3VpCIHN30PBWu
 kGz46P+dZMaf9sUlEDshHjXI+vQiXUTiX9cHnFsb/+j8jc1PB88XYfuKPS5hDh4xHMzqMgunur9
 NoqN+WYL9z1Y9lGVbFOFjG8i1AK4mXClJvcM93UGunEtnZCMWVkBtiSOdL9yqMeFeg/qQ9VWaD9
 CucYHTBMWXwT2Rk8453r0yPN+D2lZEOMdTvIwfLTP3GQXAx1gaBhnjg210uFMhsZndaxXUbxfwu
 AW2xiFbv
X-Proofpoint-ORIG-GUID: c-f6rmWXhqGmXaOySrbgp9Cf2O6s7JDr
X-Proofpoint-GUID: c-f6rmWXhqGmXaOySrbgp9Cf2O6s7JDr
X-Authority-Analysis: v=2.4 cv=VIDdn8PX c=1 sm=1 tr=0 ts=68c2b166 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=0ru3Ub4c0dYyKLRCKckA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060031

Document the DPU for Qualcomm QCS8300 platform. It use the same DPU
hardware with SA8775P and reuse it's driver.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml  | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
index 0a46120dd868..d9b980a89722 100644
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
2.43.0


