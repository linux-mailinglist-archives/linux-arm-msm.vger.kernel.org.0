Return-Path: <linux-arm-msm+bounces-68181-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D321B1F398
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Aug 2025 11:16:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 155131C221A1
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Aug 2025 09:17:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E3D327FD72;
	Sat,  9 Aug 2025 09:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fn5mIsbW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E417327FD4A
	for <linux-arm-msm@vger.kernel.org>; Sat,  9 Aug 2025 09:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754730989; cv=none; b=Dmm57OaDRdjNjEK5JUSxnbvEmNPpCdXLRhC9mei9ji7vt04IuiqCEVqXTIieCjGWiSB0ZgD6lR1ZmE6cEJBMlFORYTdQyuV14wnDLMfLLz+f1YzpzSaSubOtokbgv3XH30O7yE+oyCr1I0XZ+iFaHqYr5LOAq3fdHYNvokbRggQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754730989; c=relaxed/simple;
	bh=d48/C5oLUka5zAtODxq9StYs/l7s2f/Mtt/RsfxEURo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D81IJY6c76nkbprbfbojmiEH/CMV41vbq3gq2WD/+Avt6WKR5BrW7nTlLvcByR+NKmqDWkIgPltnGSyUzNF60Hs2uUrgoXDVuZBwflOcfiGM+EnrvbSb0aFmODz8sr6yWpcXYOOa1upj+/W0M3lKR8biSxRBWu9V6+3n+xgkjaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fn5mIsbW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5796SncF027199
	for <linux-arm-msm@vger.kernel.org>; Sat, 9 Aug 2025 09:16:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VyXYRLJzDKBZ11ZVF0ZtjEW2r8lFG8npoaFqtCmnxaw=; b=fn5mIsbWRWgBpZsO
	OKqATLLR+TyK436b2ljC/4Azo3Ti+ij5pua8ZG7WMIft2ansSCoFgE0uVohJjzfi
	tldH5aIp6V+tnFu9mX5+m+9MVAcPzVkgsLiyG7NOUyYYDtSNiekF9x8vR4ua4tcV
	KXxnvq6X18BySJH6+OWKzI847owOFkOg0fuY0ocnF+Kdk9HPwclLNv8rVfEAJe+V
	sNkDFRMZtOMTw2ew9szwV867tB5tddd8B142lSYiIqknENzWi8b/26Bv0UPiO+G6
	cRj4P/mcRyfywwVIf2P0tddrLFg2ak5zg9IjhFH//f9MMS7D3IVckZMJlKyTGLOR
	QATNxw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dxdurd0m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 09 Aug 2025 09:16:26 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7e8072f828cso296277985a.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 09 Aug 2025 02:16:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754730986; x=1755335786;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VyXYRLJzDKBZ11ZVF0ZtjEW2r8lFG8npoaFqtCmnxaw=;
        b=jo87KXcYlfi29v/VR+k/VU4IjkjMFP2t5w6/VTLMjtxsgzXt22ri78xDa+OnqqaVlA
         VP7AxsDZ4DngujqRJ69WCEnMGIPQLNZ8/W4dr/5i9JlICIII6HPzQoTS7cLS4bcXTevg
         pOfI8HpAjNyb3b8qJHtsrcm2PZHhN9UMYN497wc+yVKKARsuhxRpS/Qx/AnCUdOdrZIq
         x7U7VOy5svYzgmvuTZnHI207MkKg+HHS3Dv4uvI93ireTViLJViFtmLCnTdg7TR1Jid4
         vxNj4skXt+BJgS09khPdI6yrfJsaWah7HU/xNyP50D/sirlUblTFiIbiop6bIxXFK/aj
         1QLQ==
X-Gm-Message-State: AOJu0Yxq/VVF2FloaoOyF06bgciKrBxNpdHnC2J2UwRJw6TL94fx5SZq
	dDfiXTosCTYKQ4TjiOFPDI+E7ha+qo8PGtJzxwgW88sJhmvzONMJbJd8/KOnApF8U4wA3npJr0D
	v2vEEjUTeozCUK+we0kIlFD9uIei339TqMjWe+hRNNxdLjxBXJ3CCZnpdtJ09S3c8iKdI
X-Gm-Gg: ASbGnct8VPXqr/XMJ8NkuvZ2zAnqmPhFJwM3g7krBDXKhVs+TgkQxkSATO1TRkqWPT8
	sGcwqoHIYJ4SXug63UjFxIp4kXUX5Y4hrPl8zCSt56aNGEfXuANL4/TUoSGDkxAfHrcwNybvR5v
	QXpJKF2idcshJcJKnvHmE5z9yTVpH5pLSE6KVh/tHckoariNUtmrahrxMejGkKe1pt4hZKrkXvy
	okektFEeBU4J1KMRkU4LDewsKb6XXEHyBcKl0cK6xANXkjsXmYny+uGL7f0UP04VZNVcHjBm+bW
	0S3ei9d+g9BlXD9k59ipXsoGwu7plOIpk6B9dGKmWkGqSNdwnsmgWTzHLZKSn9c8eDYETK/fIKh
	JUpkxIDcwbGFu5kOoogQp2oAjjGRAgj6QZz/0UyJ83N8z4TWAIS/L
X-Received: by 2002:a05:622a:5a0d:b0:4af:21e5:3e7d with SMTP id d75a77b69052e-4b0aedd7c35mr96176741cf.38.1754730985819;
        Sat, 09 Aug 2025 02:16:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHbn+j3VRJGx8/ht60WZkPpDMpeHGZ9tFQkrI4f2soZwGGzxl43DRhjFw07MRX4FV4PJWf9Dw==
X-Received: by 2002:a05:622a:5a0d:b0:4af:21e5:3e7d with SMTP id d75a77b69052e-4b0aedd7c35mr96176301cf.38.1754730985409;
        Sat, 09 Aug 2025 02:16:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b8898beb4sm3361989e87.30.2025.08.09.02.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Aug 2025 02:16:23 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 09 Aug 2025 12:16:15 +0300
Subject: [PATCH v5 1/6] dt-bindings: display/msm: dp-controller: allow eDP
 for SA8775P
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250809-dp_mst_bindings-v5-1-b185fe574f38@oss.qualcomm.com>
References: <20250809-dp_mst_bindings-v5-0-b185fe574f38@oss.qualcomm.com>
In-Reply-To: <20250809-dp_mst_bindings-v5-0-b185fe574f38@oss.qualcomm.com>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBolxHip3RY4bSc97JuF5htWVTzp4BE/6CgqBmbf
 WBSRHZgOw2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaJcR4gAKCRCLPIo+Aiko
 1eVWCACl+QuJRQmjzmthSRPrrgvGLOXJ0Wa0bo/mvMwIgh5UXfoECTWXn9ZzRLyWrYMD+XY8A7o
 AGCR5SPempa60En1FGWeFtbIaMFOGlIhQopFJyiTT4TahDDXRQDILESmOiwsII+RNPJP3di5he7
 PhDCM2QtLByA2/sORcyeoOuVro0Kt5f7q810eEVE93KCtIx3HR+LKc0/mY5XvvQIAYYDz7qjH49
 vzqc82tcSqCFl044wQAg/459esVRX2YaOsFp0PY7eton9lIvTxxw2c8rIZYY4XFI1kijb8xQ6/V
 ZjEEiZ8EfsTji9pv6/+ZQ8SYBB/+Ln9zhkYXj6it7Oefv+LH
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=IuYecK/g c=1 sm=1 tr=0 ts=689711ea cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=iBDq5nSyD7x731avtJAA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: w3xSNLD1TMYtziLhA0_tjxGgHn8C5nX4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyNSBTYWx0ZWRfXwtUW/GrbK3Ut
 THJSGgBvhynsCDF6ORX5RXQRU8IQ8vRk1FDyY27enQySVM7AjHCeZeO91R0moID4xqm0f2qIf25
 HY84vbx3UAt97Yf09q3nFV8t8jvsTvBuKN0cVwZr8Ap06uMsNP4c6DFA113IiRtZ03M7XJze6zZ
 rJYyIv7jz4BgE7MTHh3sY5DY/s/5gjulKf+5lsWlujQK14FeL9gBXqsEfxlhWdNBxfbATlLScbf
 hbnAK0fxmyO8aYNVHSUP2z4OBe9gV0jx3Or7dZ5VSdOyPKgwr5WbcvmWFSFUbVEtgAV+8Mi1oJj
 TZZZs82i5Cd1VXu0gHqAv9UXlwy3ZRdKJ3/oUSd6HcsBzfTDRjiwThZRgyFRYRKsuPoKIJ0tbr9
 xp6W5BQP
X-Proofpoint-GUID: w3xSNLD1TMYtziLhA0_tjxGgHn8C5nX4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-09_03,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090025

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


