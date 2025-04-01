Return-Path: <linux-arm-msm+bounces-52968-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B0002A77DEE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Apr 2025 16:36:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8F1897A2D94
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Apr 2025 14:35:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18616156677;
	Tue,  1 Apr 2025 14:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AhcoGwok"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE842040AB
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Apr 2025 14:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743518197; cv=none; b=fQzCO+daRFE/xhvkiT5oFEWbAOO9LWX4IM4ePfC7DmLleSrWqbfIAUpQ7O72Qj4u22q1Gldk0bwVjh/QSRTpDaLrxFWNhUacw6/I0hYXf7Z/kYzCG57MPWssEMR6tRedXYDZxTovqwwRTsWt87qevsj4WlykjfmnFMmH3ltM5/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743518197; c=relaxed/simple;
	bh=uE4zTtSMR0UVFG17z41kGgDjdyhI6warBpT85TIPf/I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cDpTc6g9kLJv+XnC6YhhMbW9KzHeaGyAlUmU8QsXrRHEHGkKrRDanGjWn5tNtFe2fBpnRYPo+1YsOPqQOrjmf2zjcuL3tqw4GuMG0Q9PS/1un+f91jxOU8RsM2dYHP+ndQdKIKuevHLngWdoYsTocJzpUySMA1iN7YU/hdHDwq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AhcoGwok; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5318Fe6F019531
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Apr 2025 14:36:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=NN2qZQpuywQ
	hWQEV1cgKj+jZhFYj7tdYJKCqPQ3mi2g=; b=AhcoGwokK91w1I3coYrGtdM6kaa
	FO+jZLtYEUBKRCcev7xxJ4UKLo4kbN/OT7gL1jD5jmfThudnZsn2pbTSdXHeLlFF
	2qZTkHpAMDoeENlIB3OjlG5x8jLur+Veq/JFPuEsMRNc8rKNEueXlEkVm/Ji5KvS
	k4okUtMRr6wRvFVLtP77OLtwLwidIzBl1/Qju6UuEXfUNf/R0xqSJAtUqsjwnYWa
	cFXNCggOsUtfLgD5L25TcxDM/IeHzOnXbU7atxcBk7VXcCEJfe0H+4XNwkuDHh0D
	oRwM9lEI4jiHoo28QU9YrzqaTn029oTLrpHffJtgU3Ii6rgVSTc8y0QYR/w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45r1vnasry-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Apr 2025 14:36:34 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2254bdd4982so144103085ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Apr 2025 07:36:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743518193; x=1744122993;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NN2qZQpuywQhWQEV1cgKj+jZhFYj7tdYJKCqPQ3mi2g=;
        b=EJ04Hb5hUA/YV11SuqnEt5KIfn22yDI17rw/LyGYF9Uv4SKbjxS3aZL8GhpzSwx8ql
         gmfOSIVtk7ypeQKCHTQsnVXwkL+KL4ctoO4DrUQCutUjnq4nWGnJvMJ+xIPR3EN3PhD0
         gmyvLLdXzF9X8zZ7NVy9ycuf9y9og4xmFmTHIoSof+Bs5ggkTFloHeSSQjFHBfX03Q82
         PZYVeOiuQ/wWHemWp6PzD+9qfn4nzq+by5pEGq/dt9eI4Y2RkQ3nc1uczeX0OSczL0A1
         x+FSlyQtNt1aqPZA4xTvDp4/pO/+q8Piz6s97Ca7rwEqTGxpi4ltJfgJ5+O0ypq7nulI
         f1jQ==
X-Gm-Message-State: AOJu0Yx9CPLCKJJsaeocsKFng7PwLwCAiV3QGYwj0WG1edQ1p980SCNB
	6yBlDeId4fWCpWgA6RAX+RlFbo65sNa2JFnHWgqoQqC3H/AMPq4hRB4K5RT8lUZhry3lsvT5Zxx
	6oT1E8OsMWN/E6HV/RPhVjF+lbBxgdSIklkV4OudmhYErHpFCjuDd54VULekd5DwxNhCWmQbS
X-Gm-Gg: ASbGncvibYoJH33XYwiAGvbQBd6dGVpUxvqRsKMPtE/KDWlwBYoZARQ/t7YjK6Oh6UV
	LuBETogczPp9mCcW+lOQlQENwGuovS6CHZklWpRihXgkXUApYxS7cK6G5UzZVKZ4Nz6JS9+sXtO
	5GykGQXsTPUMBI9TXjVG6/3P0KUP3YADXhgcHm5U6miPFzZgk6tPdjZaNyybeEGe5WHOuakmXgt
	b7NeE83FapTIr3vEtxLk8g3Y8IlG7RQZGNVI6Yh3/1MMKXcCUW7GDcOuXSmfI2vzIg8IsOLx4bM
	EeIIA5C13MOAhovxVDgoepzMWVI+W8S2M4NO1KBKdGwI96Euwsk=
X-Received: by 2002:a17:902:da84:b0:21f:1549:a55a with SMTP id d9443c01a7336-2292f942cbfmr198958515ad.1.1743518192841;
        Tue, 01 Apr 2025 07:36:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEBz8R8GJZLfBlpPfj8nyA/e7ohAgn1KyhnFv21Xo3mZWoNmPZC3NLJbyoEJruPzJW3MTFqhg==
X-Received: by 2002:a17:902:da84:b0:21f:1549:a55a with SMTP id d9443c01a7336-2292f942cbfmr198958135ad.1.1743518192464;
        Tue, 01 Apr 2025 07:36:32 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:74fa:12d3:5d67:6ddd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291f1dd292sm89006355ad.185.2025.04.01.07.36.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 07:36:32 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH 2/2] dt-bindings: i2c: qcom-cci: Document QCM2290 compatible
Date: Tue,  1 Apr 2025 16:36:19 +0200
Message-Id: <20250401143619.2053739-2-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250401143619.2053739-1-loic.poulain@oss.qualcomm.com>
References: <y>
 <20250401143619.2053739-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=UL3dHDfy c=1 sm=1 tr=0 ts=67ebf9f2 cx=c_pps a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10 a=QcRrIoSkKhIA:10 a=EUspDBNiAAAA:8 a=NlPZ1nVzr820ScHG1asA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: 0ek5-aYIu1nHTx01eMNPOmN3l8cqh6-V
X-Proofpoint-GUID: 0ek5-aYIu1nHTx01eMNPOmN3l8cqh6-V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-01_05,2025-04-01_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 malwarescore=0 mlxlogscore=999 phishscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504010091

The CCI on QCM2290 is the interface for controlling camera sensor over I2C.
It requires only two clocks.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../devicetree/bindings/i2c/qcom,i2c-cci.yaml | 23 +++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
index 73144473b9b2..1632e3c01ed2 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
@@ -25,6 +25,7 @@ properties:
 
       - items:
           - enum:
+              - qcom,qcm2290-cci
               - qcom,sc7280-cci
               - qcom,sc8280xp-cci
               - qcom,sdm670-cci
@@ -44,11 +45,11 @@ properties:
     const: 0
 
   clocks:
-    minItems: 3
+    minItems: 2
     maxItems: 6
 
   clock-names:
-    minItems: 3
+    minItems: 2
     maxItems: 6
 
   interrupts:
@@ -119,6 +120,24 @@ allOf:
             - const: camss_top_ahb
             - const: cci_ahb
             - const: cci
+  - if:
+      properties:
+        compatible:
+          oneOf:
+            - contains:
+                enum:
+                  - qcom,qcm2290-cci
+
+            - const: qcom,msm8996-cci
+    then:
+      properties:
+        clocks:
+          minItems: 2
+          maxItems: 2
+        clock-names:
+          items:
+            - const: camss_top_ahb
+            - const: cci
 
   - if:
       properties:
-- 
2.34.1


