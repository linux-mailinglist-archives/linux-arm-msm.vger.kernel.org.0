Return-Path: <linux-arm-msm+bounces-68172-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF1FB1F355
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Aug 2025 10:34:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 232E918C6337
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Aug 2025 08:34:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CF7E27F00A;
	Sat,  9 Aug 2025 08:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nMbhVHQh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93DAF2638BA
	for <linux-arm-msm@vger.kernel.org>; Sat,  9 Aug 2025 08:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754728443; cv=none; b=PZZZdlPhn0WJpKLbyFdbcGZxSCEx0ufUcOrNdMwDsE+kiQBoqDbJuZ7mM9szllAYuNrW3f+YY9g3V4sP7WWIKsTVecMgGVtX61Cb90VUbPThx/A9PW4hCTpEiC/kHv0TmdcQbjURBRailJFDxsEXPfM8XNNYuotsWSKLZ1ERl8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754728443; c=relaxed/simple;
	bh=d48/C5oLUka5zAtODxq9StYs/l7s2f/Mtt/RsfxEURo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZTDpqz9qFOBIeBLSPdKcCEMGtuPWmQRbVbtAPow1Nl7OlAg8FYpCHPjcgwFY6NvLsGjrD0rpP+V/VJwUMEGrqGE3DDFXZ31F5DrYoJk99j5Nbh7hETeTYYjlUYB2JtrO0Agf4k82OUJUhs42Oyk8GVHj+8v2rvRDjq/TmvEw068=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nMbhVHQh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5793ZC6b013381
	for <linux-arm-msm@vger.kernel.org>; Sat, 9 Aug 2025 08:34:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VyXYRLJzDKBZ11ZVF0ZtjEW2r8lFG8npoaFqtCmnxaw=; b=nMbhVHQhq8jI5CRp
	7yUt+mqcmsSLef65JrnmWBNO7DIIe/iXwpsU2bd7plPrO051N3wO1Fy4g1Y9i237
	V16xl/4kmgtbX4XZu/dhXavIt6WvbQirQ4/tMXuIjlMb5IHGUUZg8uSnOI+M3fec
	OT/9rjC1sfDbC93NmggK2905T0GnLhcfHK0ESMCSTfWHafIcLdCIx8gJiLFjOb4Q
	ogfOms8YUwjJCVs+fp4TJ0x5JNrQiFAdSSyP/pKj96CIufCxkDWvlKI1g2PIiVWX
	RCz41py0D8qwXDDocQO3oog/7OoDDpjNWMbZ8ejnksDNlqIT6PNh8GQoUsLwQhap
	5KUVPg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dxj40b3d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 09 Aug 2025 08:34:01 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b06d08d61bso86784541cf.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 09 Aug 2025 01:34:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754728440; x=1755333240;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VyXYRLJzDKBZ11ZVF0ZtjEW2r8lFG8npoaFqtCmnxaw=;
        b=dEXAHlNGHY5jt41UWUqJeBnTWEyy8wf8ct+KXIRUStPWYS3iGppFsfbF67kkJ562lq
         uXB7UZzNLFtbJJnYGxgB8jdaGvDR85E4dAETUSLXJjue3K67qMJ1MSl6OsirpHe2OfH6
         TfgcE3PyM8jouXH6UmfQX2gDdAHwFTnUBnMliXsV6Cm/ER3l/0qzjKCg6IF/VAuLkJfP
         f53mEJ3D7AwfJSEQUlWm3Wsrsnn+ybSpEV2t3Ulpv4YSC8hjEjkOIFm4Fr7pd6r+eedh
         grZHpFdLYfY4d9pZAYiP7OIP7df62lf5Ul04+2qsiewfZD9hV4RWwQR24xcogzBZY4Nf
         kilQ==
X-Gm-Message-State: AOJu0Ywxd1XOWhNfmUWeWFyYWQFen1rLWHGLFMiUN+FuVZOO5w8Ptzkb
	B5ahxtDmulUz9q+DhuzcfwHZjidmy+BqPy6wpQKlvbpt5oLK2Y5ZaWHwCQU5mJ1VjVXsI4GNItP
	W4rVgEWXQoc6bFOvo3eotXaynngaBBItR+xl5yVEb6Xdi1Ml2rWAiEpMzS8BE1z/7cmPk
X-Gm-Gg: ASbGnculiaFnktrCs0BsrVNfzQvDg/NqG5iTL4UomC8zH3STlKbx18Gv9ItDuyrcmDI
	HA3eGjLOH+PeNztmAjB6znf4FR+Bk6BhD9N3d1dUizxS5TFwD/B6YTwUm24MErAsa5QeHCr6Xvy
	cRFmXaB4UcWJIQMg94ZkpwdUY6bHDsjpjrPJldQE5DFxcYy8nT2JCyVRqid5I4Z7W1G43kJQHWZ
	pbEV1MKUM5quJtsnPxVfX4K1xfAsDbwPjKFYep99cqxP1PJ7OrX4UOOGE4EuzffJyQyTbphHP/6
	Y3Kgv8uLzqNlwmxXD3Qn79yOjniXXDRfHdo6BH6sokm7fKQUMvpQ35toyAIMyXHct00Cn8LCD8V
	joyvtKxWe3eNAEbcSONoGrfqHQzInVgY5thdPH9ckEmvYWHu7AF16
X-Received: by 2002:ac8:574c:0:b0:4b0:7b0a:2a48 with SMTP id d75a77b69052e-4b0aee54906mr100496051cf.56.1754728440522;
        Sat, 09 Aug 2025 01:34:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGn/NnXSPgAnPNiZQ/pbt34Ubwax9v+///1C+g1FSm/0KIGAfDfUO5MlDxi/4Fchku48X0j1A==
X-Received: by 2002:ac8:574c:0:b0:4b0:7b0a:2a48 with SMTP id d75a77b69052e-4b0aee54906mr100495691cf.56.1754728440012;
        Sat, 09 Aug 2025 01:34:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b88c99078sm3268166e87.102.2025.08.09.01.33.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Aug 2025 01:33:58 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 09 Aug 2025 11:33:52 +0300
Subject: [PATCH v4 1/6] dt-bindings: display/msm: dp-controller: allow eDP
 for SA8775P
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250809-dp_mst_bindings-v4-1-bb316e638284@oss.qualcomm.com>
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
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1543;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=d48/C5oLUka5zAtODxq9StYs/l7s2f/Mtt/RsfxEURo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBolwfzl5BuaDrbT6HWXVPwy0irjYqtk03FHP9tH
 ozEaGP1IfSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaJcH8wAKCRCLPIo+Aiko
 1YtGB/wO+YGdbSiT/sAaWpH4F7MPaKpOP6u5ombiMKD1jY1fO0NYnKDviwkkqiOPLWRRVrFEmRE
 +Piqxk9P0ZAslUYqub7LSouPvPX/tZFgd6fScO2IF3Qcco4tmLdBxCgmKpWqtqmy4ALY2aYg63G
 nytaNqcw0Cdz2zBz0VNm8bwKZofITv0fyMcJrfQghHBzITnRW74DTBJgWg89tHY69TMRzRzsRMT
 B29nt87RjXF9BbuWLzKdKogbhVGl2xrE2xk/jhUcPYtH/heblHz74nSPSAnC70RJ8Vi5BInpJzy
 ScdtcH3nxrSSZEXrJ48+NCv0THnInCInWC8xqVYPfO3t+0kP
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyNyBTYWx0ZWRfX95OzZn4uWqEI
 CKzptp6mckUfLYIbaNAjCKPY/F8+hdmC/28sLKajgxfOlE9o9puzJ/BPWMh4BlUko0fhROd6TLx
 6yuNqYLImkz3kwuBdpoPMRRGsMrxr1+sddjL0nGWtX9Aqh0NDzf1fjmvkgt7eZRMJokicdI7d9k
 809OJYMu5g6t90wWmzhRDEub7cYBWstgR8g08tcwsl49HZF7aCNWYuEwTDCNfnNQ0ygJGSWwNm2
 rWjLWdZDR9IDokJ9mUksaHwsOuvGzEIq5yRz/+Yb62ioB4jOx8QZE+SkOChWaH8LtCUK2Z/eDiX
 8XKqfzLoNrW1MStiZGkIziAg0Q7YwWnoDqs1dA3PxqydiEOUeXutYISx48QkfbuvAXRRZNYtFvH
 /JbeDlHy
X-Authority-Analysis: v=2.4 cv=fvDcZE4f c=1 sm=1 tr=0 ts=689707f9 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=iBDq5nSyD7x731avtJAA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: cNIcgCeUXbUVlxx5_qM0EPwxce05HQ8Z
X-Proofpoint-GUID: cNIcgCeUXbUVlxx5_qM0EPwxce05HQ8Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-09_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090027

On Qualcomm SA8775P the DP controller might be driving either a
DisplayPort or a eDP sink (depending on the PHY that is tied to the
controller). Reflect that in the schema.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../bindings/display/msm/dp-controller.yaml        | 25 ++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 9923b065323bbab99de5079b674a0317f3074373..aed3bafa67e3c24d2a876acd29660378b367603a 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -174,12 +174,25 @@ allOf:
       properties:
         "#sound-dai-cells": false
     else:
-      properties:
-        aux-bus: false
-        reg:
-          minItems: 5
-      required:
-        - "#sound-dai-cells"
+      if:
+        properties:
+          compatible:
+            contains:
+              enum:
+                - qcom,sa8775p-dp
+      then:
+        oneOf:
+          - required:
+              - aux-bus
+          - required:
+              - "#sound-dai-cells"
+      else:
+        properties:
+          aux-bus: false
+          reg:
+            minItems: 5
+        required:
+          - "#sound-dai-cells"
 
 additionalProperties: false
 

-- 
2.39.5


