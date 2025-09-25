Return-Path: <linux-arm-msm+bounces-74872-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D31B9B9D291
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 04:29:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 121B07B0483
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 02:28:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08EBE2E0926;
	Thu, 25 Sep 2025 02:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NU3C+jqN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 254222E6CD7
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 02:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758767339; cv=none; b=EGrYvz5IKkwQLvzX7Qgj10fl9fqRstykq03pESFYlXRlDAwP67ncy0bxHIuk/Uf9YnbYvpbWa8abyh2GaySoYXdK5YabcKecj+e2F2uwxcygLGU1kj3YFocQoWOxbnJM6NQu5wkIVjbME8DLHXODJf5RUiwh77r9gSiz52ZfsM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758767339; c=relaxed/simple;
	bh=hRao4UrERcNdb8WEbncfpT8mndQ9UcxF3KEWBpC5u2Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=O8+a36kh5w3zZ6d0tUVnHwYnbpO+Lv9q7oIkXBAAHDfe15lKohpkhRswlIUpwEVnlTiGVpftT0v8ScjsIiuxbV1NPZjMl2xp3rNxcungqtI+SyQZzxZoRtRDAZNF19ke5Gz6CzQqXy3wLRBrBzKanDVdTRLT8xnQh6gFCCyWWY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NU3C+jqN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P0qitt001992
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 02:28:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Xn4sEHzNAa+
	rFACXl1zYTLnQ9MM2kFlvsIN0wm59uEQ=; b=NU3C+jqNPZacV30BvLQjAJXyLUa
	Ha9UuAi21OPzL78F4peQ7R2+UpVCyq8q/RqMUrFUVZrlPTuRWRHSmou8CP/JoRlo
	GvyhSdpbulTjrwiyie7YNASuENxa73PmvIMylnmH9qetR3PBZzlovik4X+jupowx
	NNKIiODvep37KvZ1BzKIqGhrftqbvZSsb1y6aadu8LXLOoVlbdAUrQl/OF2B3CdC
	xdv3CPEUxs/aUseEejWTRyW9VOLVlCfch+i1aWoSxMStywL8JbiVIYygW64AjGa+
	/j/IpptsWSvMGYsPllwhsX6abcjP3I8wdstjVb1MAB0B+u1rNpKUycI/Z6g==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499k98pep3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 02:28:56 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-32ecab3865dso666368a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 19:28:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758767335; x=1759372135;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xn4sEHzNAa+rFACXl1zYTLnQ9MM2kFlvsIN0wm59uEQ=;
        b=FQATujdpKXTTpIwNC7jVhxlh9z7CcbEfEeEW6o14Ex+cnfUGq8yWGYMFSTqq6PPdPP
         Sgx0UdxIGn1hpSYHvqo4PUx7Xr/hJ4abUld3/A2R9VjAmkDPpQBJoulfvTOOA+7v90dK
         C+JOfVVuHF4tVKNNm82/MTc/WurPpAxEVhq9jgRyUd59uFspTNGkqNtYgRhxRC1cFMis
         4E4O713F5cM1sI62Voutnzv8WCY5yiInCBziFEq5f2Mz042Bvi+4OuIkzBGaIHvRUhTd
         fbJWWVPj5zy5Cj53NQEiy91XErmGecMAQ8oEMK1Pso5pqpao9D+7pfQ94YDG8eVlatJX
         Vvlw==
X-Gm-Message-State: AOJu0Yw7+qfDuXCWp+3VL5xpjSCMhdnvKMog1K9FQpamVaJJeGUU0WR1
	3vbmQdO9g2fG5XpQu+rbjQdf4y1jUCLiObGimg/n7gk4d9feKqMgq1H2GK4hwrupbVOLcvbXJZx
	caGXPhAyYy2sfPqN+QsR/3S09xUOkfBdp2+0Ft116+JBJisfIZBvQTha4aTOeXCkE3E/gXeY4eQ
	dV
X-Gm-Gg: ASbGncvxI4vevmiJoNSeFfs4L4hNpmgU/Z+MlASeZEI6Ugaxw1bC0IXWpTa2I0LKxCl
	PvyRfbnF/kQMHotlKC08g/vvoQcnasaVWqZz1wSybaBXm2IvCyd01wqZmTjSAa48enPSFIXJLJd
	FUXuYsc/Rnzmp8QZfq/l7fLok1cG2hzJfxoTV4BhY3oROtP3uXdfDtp3Mah45WxPsyKkGrQxZ/7
	oZPOjnfls0jkhxXGAgryqe6L3DXbwXzrvXiV7RL1xkEbdJqYTqnZ7hllrBNIQrcvRkE0oXbZgj5
	FgvU2xyMN+TmR6BmsO5dKtfdl+HFpz/PPetASuVIyjSjNS1S4dl4d++K4MLkyKteEs79yR2ijhm
	wBgLdH0hztbRtYPQZ
X-Received: by 2002:a17:90b:4c86:b0:32b:623d:ee91 with SMTP id 98e67ed59e1d1-3342a79339cmr1495559a91.27.1758767335549;
        Wed, 24 Sep 2025 19:28:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEgXeMBQTVJUw09Ed16G9vpiBcqbEqjObxvR8uAyaAS4aBdffTCSPvxaIOoG4hdBmWBMeZxSQ==
X-Received: by 2002:a17:90b:4c86:b0:32b:623d:ee91 with SMTP id 98e67ed59e1d1-3342a79339cmr1495526a91.27.1758767335040;
        Wed, 24 Sep 2025 19:28:55 -0700 (PDT)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33471d711ecsm499881a91.4.2025.09.24.19.28.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 19:28:54 -0700 (PDT)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
To: krzk+dt@kernel.org, conor+dt@kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        kishon@kernel.org, vkoul@kernel.org, gregkh@linuxfoundation.org,
        robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Subject: [PATCH v3 01/10] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy: Add Glymur compatible
Date: Wed, 24 Sep 2025 19:28:41 -0700
Message-Id: <20250925022850.4133013-2-wesley.cheng@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250925022850.4133013-1-wesley.cheng@oss.qualcomm.com>
References: <20250925022850.4133013-1-wesley.cheng@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: hwIUNUcZsJ-7QC8GRnHwIcb17CIbwWdm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAxOCBTYWx0ZWRfX8pNPDmktcwx7
 rRSH2f1hb3UUEwFr1hJs6pDz2QANVKQOB788n72795tGkGv7RV/Q7s/Qm/knGcCUo4QH/YCion8
 jPudmYQv+WJBZD3R41KegQsge0J+/l5rwwqHF4THidbVYXjdYd2eixiV6ZXKV95TmpZ6yjITrCY
 +GRiRIWek6CSreegGaGDJ7nwLKBF9gdg1D+0hDh9UfsI9cPzBT2+sujdNXHlbJbiN8+N+uBEPvD
 4gTM12nIYK9L3isYDXRiRbhdR3vcZzR4HKE8NUsjx6bNITGqwEGFqBD6TnKR6yzb1M3S84FIRmc
 ri0OmUJzqj6pti6wFSl/oXeu6RwOwi4QFONM9k2LHkURD9YPwUWrXzCUBhadkAHpr384pS1naGR
 VsYlxo7H
X-Proofpoint-ORIG-GUID: hwIUNUcZsJ-7QC8GRnHwIcb17CIbwWdm
X-Authority-Analysis: v=2.4 cv=Dp1W+H/+ c=1 sm=1 tr=0 ts=68d4a8e9 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=tYbxrAoMRz_Rh0uxvwoA:9
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0 impostorscore=0
 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200018

Define a Glymur compatible string for the QMP PHY combo driver, along with
resource requirements.  Add a different identifier for the primary QMP PHY
instance as it does not require a clkref entry.

Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
---
 .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml    | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
index c8bc512df08b..2f1f41b64bbd 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
@@ -16,6 +16,7 @@ description:
 properties:
   compatible:
     enum:
+      - qcom,glymur-qmp-usb3-dp-phy
       - qcom,sar2130p-qmp-usb3-dp-phy
       - qcom,sc7180-qmp-usb3-dp-phy
       - qcom,sc7280-qmp-usb3-dp-phy
@@ -46,7 +47,7 @@ properties:
       - const: ref
       - const: com_aux
       - const: usb3_pipe
-      - const: cfg_ahb
+      - enum: [cfg_ahb, clkref]
 
   power-domains:
     maxItems: 1
@@ -63,6 +64,8 @@ properties:
 
   vdda-pll-supply: true
 
+  refgen-supply: true
+
   "#clock-cells":
     const: 1
     description:
@@ -109,6 +112,7 @@ allOf:
       properties:
         compatible:
           enum:
+            - qcom,glymur-qmp-usb3-dp-phy
             - qcom,sc7180-qmp-usb3-dp-phy
             - qcom,sdm845-qmp-usb3-dp-phy
     then:
@@ -128,6 +132,7 @@ allOf:
       properties:
         compatible:
           enum:
+            - qcom,glymur-qmp-usb3-dp-phy
             - qcom,sar2130p-qmp-usb3-dp-phy
             - qcom,sc8280xp-qmp-usb43dp-phy
             - qcom,sm6350-qmp-usb3-dp-phy
@@ -142,6 +147,18 @@ allOf:
       properties:
         power-domains: false
 
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,glymur-qmp-usb3-dp-phy
+    then:
+      required:
+        - refgen-supply
+    else:
+      properties:
+        refgen-supply: false
+
 additionalProperties: false
 
 examples:

