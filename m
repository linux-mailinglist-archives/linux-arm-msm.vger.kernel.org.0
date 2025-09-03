Return-Path: <linux-arm-msm+bounces-71838-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 81BB0B41DEE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 13:58:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1461118937B7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 11:58:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DF1C2FD1AB;
	Wed,  3 Sep 2025 11:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EQLw1s6V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97B3F2FC87C
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Sep 2025 11:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756900706; cv=none; b=YXoHxDsGevLf7gLxQD5kQEQRA7ccZyYaQhmGbTm132SFV1UW1qHlq1pL0gKdR9YM0Qd96ZzuxgEm7WKmWRJdn1FI7nJcp+LIpMxwcqxoE38WXdz3Gq2Cp+eXJUKFfKUaKkcuofJv/YVTqHPWg9Vi5h2E6pCZQDyR5+J2vTc8xVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756900706; c=relaxed/simple;
	bh=Mg8cF8dtHa8FBVVXmu7mhjOEv6I2lafX52Q7aTfQdic=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nroKkH+PzoNvPm4de8KXqZLDXK8WCNl1fFPCAmP9HPZr8JtzcdBYy3SHH6rGHUaecqLVaQ422MrvXYot0gMHFhSJb8nnH5FbGGvu/sSj9C3BiciQcGxIdmaOWfeGnacd6tx+0Rxbea+dkb9EAakXHrmY8szLK+0VVQaXnuWD7F8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EQLw1s6V; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583BEqHg009331
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Sep 2025 11:58:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7m1HwxzI8G7RL+o2tt5C5+jDIvVaSDVT2O8wP58iCTY=; b=EQLw1s6Vwpk5KUvn
	5mZpuQBSCeTg5U8GFQ+9ZgzJWEGiCA20lsbVlPYYRjkrX+FI7mE8sJxxpVb2D25e
	Il7Z34ZyKv9EjK6ql9sU0nUj6hc0v24sbSduEET7DAlgsGBNTe4j7Xsr9UFTKs77
	xfNZJkFuf9rFvD6alQn5blSKbhUtClMf4QcXhIzYMglXYLuL3N0SjT334Dpb5IFx
	aG4tD1KoUouTCmzYteSayI4R5U+NLTKyQJgXixUlscJNEReZyhVKXt3mpGv3Kaht
	H20pT9yd3VjSA5sC5UEUVoSILHg1eHFgAd8Ub51Lmlory96VHhRbT8A8LzpT8Ae3
	GjQG6g==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ura8ufpp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 11:58:23 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-70faf8b375cso79539416d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 04:58:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756900703; x=1757505503;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7m1HwxzI8G7RL+o2tt5C5+jDIvVaSDVT2O8wP58iCTY=;
        b=CyDqAaW3mhPf8G8fgetR2pKa6s3vYWq7V3C57C9k8mcnNw8T/TwcAeAA6eM5i39dtb
         joNj6yJih0A2QX8YcDVwEUsv6kthrVB9gIDxqkSPf8OqD1683RgCHqAUwhoKbGXrNfs3
         207xgmSYdcCHJsDRre+LStEoymklHTq0Q2bauiTxPA6ToNWU1S0xRVN0iCn/SoMqf542
         XvZPMtsFz3zgafpxzkKSbWbD3eXXlAGqmeo7iaMKa1kj/DjH792SKyhuG1x8iQhfdF/B
         M9SHwM75PqPXqOZdI05FSFx/NrV55vcnPvDWQbgKSr5LTZ4yglCxkLRjVeWmNy5Jnlw8
         M4Og==
X-Gm-Message-State: AOJu0YwHjTw7NqBOA5CEmHcyjG5VSQFmcJHgMWCfdIvgtpHX4LVLw6aR
	ArxXREraF87DnbMzsyX53PAkeXSyKU+z3WtP6OQHpRa6nA7n8GMm4zbxuLqbKtKoCvC08rTVYZX
	Dy60cnq2haKQU5tYwQxD6ApBhz0T3TfuYEZYyQ1uQgPx7Eh1NK29kO29zgd7MCNR42jVJ
X-Gm-Gg: ASbGnctGtWJ6pef5q2tM9cHx+iLeQoV1nVcjocA+VTS+PfOCtMH7OR7XAn3prudejh1
	1XzjGxizZeARC2ibRKlkZpdNhI3izMU5BjYtKm+qNDrg85PN9OkYB9ncKLYF8MTQJIGARtNrUPC
	5rHRw6GNmQ3N4sEZiZGya36bnUH0XLCFW6ya4zwXe1IRbq9cIvpE0leSzADBPRXhcKnrcZZu0zm
	oAO9CHbtDCVmnhg2lwwNIYQ11jUDysefO/ID19mgfeUhvz7fDyiyIPcKB2COnHJTSEicg0ajva8
	GHvNenXutzGtE+Qn8gq0svKbgHCUfg6GCqgqeONVRGZOBh4DOQ7boDuBamzykwX2FtqN2itOG1W
	L8/Wp5QgxLKqCIcU06rG/uGEfgMrdo2FvP49NDidKff38I/LEtESm
X-Received: by 2002:a05:6214:234c:b0:70d:c901:64fe with SMTP id 6a1803df08f44-70fac883ce1mr176720516d6.41.1756900702740;
        Wed, 03 Sep 2025 04:58:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHj9hZcrJ+8S42PCt+RrOt1ShsvO+BYl52eMjU0T3wyJA35RFJjzM/AJCRPGUZH3504p2FyKQ==
X-Received: by 2002:a05:6214:234c:b0:70d:c901:64fe with SMTP id 6a1803df08f44-70fac883ce1mr176720126d6.41.1756900702249;
        Wed, 03 Sep 2025 04:58:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-337f50d30b0sm9891421fa.67.2025.09.03.04.58.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 04:58:20 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 03 Sep 2025 14:58:12 +0300
Subject: [PATCH v8 1/9] dt-bindings: display/msm: dp-controller: allow eDP
 for SA8775P
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-dp_mst_bindings-v8-1-7526f0311eaa@oss.qualcomm.com>
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
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1543;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Mg8cF8dtHa8FBVVXmu7mhjOEv6I2lafX52Q7aTfQdic=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBouC1W1p9ibzzCWoQUIQX0KfzGSz/kKXFwqoffX
 NJj3hOGz9mJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaLgtVgAKCRCLPIo+Aiko
 1XT3CACu1B8wHPkuKcAXGFd3QruC31bXNY0THTielGdmOfrW1fAonzUr3Uu2fYxVH5s7ghwg9k8
 68pHE89tztuW4b4bNgWVshbnNrINXf70tUF0y70xHDMIJ6b+EHPogOndk3qAcJUholeTSK9swx7
 PS0bFEobZk+VbXsh0QiVlHl5RZRmoSflDwsGA88Vs580Cch8RFs+b1d52zmEYfEbrB9siCkWGu6
 wRWaOfCtn/+iTtNQIvEdvLazeBoi5MsCrAu1KAgKEmvSuV3ObzYNpprUKesg1vr1uW49Fhj2U2L
 YLQv8p0o35kFJsMsvDISYVh8N1pcKQuVXLc6KYInBJ9Km+g7
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 5lLL01LrjDDyOVc-AJbtjUeV_IAc7DtP
X-Proofpoint-GUID: 5lLL01LrjDDyOVc-AJbtjUeV_IAc7DtP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyMCBTYWx0ZWRfX9A+AFG6lZG80
 ZLFLje+M+OoEaol0L6ikiYPKm7xM4aWf8bcVWy18Q910vaos+Z/H21JPypIfVW4fVfHV3n5Km9l
 WSf55Nng694lJRq9/fGHUWayoBkCmWABrgzKVv3ExojL4WQcY3v5LaCe7AYMI3zBFrejC+KNIX0
 z2+qxrDbE92CYEACZG0NpzeQvBi6MJ0sVsxP/j0v80W09BbbezArD12zt2BjUYgliwp04pOkqAY
 lP+TzvLkVYPIb3WjlBptmDJhwmkD2tamNUIi4bQs2YYoJqbhpSwy41bxHRvIEx6yAZg7/MZdcXU
 M2EPN62m9zx+N+bmSh0vcgK93NV8nQnXFXR78z2ifoGlOoM+2NUvg4J8tYIMqHK9L4eD0rH2zi8
 +6yaTlmZ
X-Authority-Analysis: v=2.4 cv=VNndn8PX c=1 sm=1 tr=0 ts=68b82d5f cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=iBDq5nSyD7x731avtJAA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300020

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
2.47.2


