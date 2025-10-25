Return-Path: <linux-arm-msm+bounces-78768-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 54873C0876A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Oct 2025 02:48:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 53B501894EA5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Oct 2025 00:48:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA09B1F4613;
	Sat, 25 Oct 2025 00:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kkE5zmEL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58CEF1E8331
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 Oct 2025 00:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761353279; cv=none; b=OxPawmeXMpF+FgjQv3wYVhrgnFsT42ZeFvbTlRI0ibqemCvO3xgHWTbYMi8eGnRM7VAa5BEohLusgKSQm5/HZRl+MK0CNbM7hu2XvVXTV7pgVh7IETtrJmc0v9+8lQb7x4lje6yJIDHg7uBLT5KQ/EMhwMRLqW/llBc1AUF35mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761353279; c=relaxed/simple;
	bh=1Ss4IHvUR0Qc/qOVO/ljfPe73HHlUmVAfb94GZe7OO0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L48ebgzq4S9gsnzsN76YAMhTEWYb2EHG6Zt9XFICVpSHPNKHHdiQcJf4e+WNk2HNm6ULZbcQE5M/QXnjAsADj5XEubtaIsbHcIMiv7Z+60zF2sAuf2qLsa0Wv88b/OXttmWp175ZUkUDX5HZDexZBT73J6SoI/+Z8RlbhWMtKaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kkE5zmEL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59P0lu5L015327
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 Oct 2025 00:47:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F/a1kob5ZcmeRBTwqpB3Ugws3u5wdaGjY6oAzB1/mpc=; b=kkE5zmELkqhqNl71
	yqLxN9Msfga82XSsXF3aU8T7ff1XDbEeM+1gwcfCFQFj0iVurFJvvdwxOlpmArFe
	chMsXHXrcAlq+Dxkhm+PkCtLjAiTlafamNDb6xhTwb9DbGsuG7jBx9XK3X/OwE3z
	TiXOgw/jomfLlB3Z90HFPW6AaqLyjzRINdYeyEd07P8oFiIWnxc91vAWYAN5924N
	MMvsEo2Gnij/VoRc4xkklI3qmEIp+lkZZbdSyear8bQnrRfNkwUbRlgutPlyThAq
	khb4N4MNPxKpvcrctggsge+ZRndW4gqeQmeKUEBKiU3M0/yUPKQ3xiMZvOIvX+1s
	yQuL2g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v1w8dj8w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 Oct 2025 00:47:56 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-33bcb779733so2343904a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 17:47:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761353275; x=1761958075;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F/a1kob5ZcmeRBTwqpB3Ugws3u5wdaGjY6oAzB1/mpc=;
        b=Ksx28ixmRKc2ZkvIpRU4RD7vUBrLu3i+LabZ5Pob/3VjDsWvI0/xxtGZUBzsY730be
         cAf9VCx38Aq1VsNeSajUKS8G5P0zweran5LRBDz5BuZYesrcue9mo8Z9Y1kLqiawwf+0
         u/eVwzd6O3VPOiN2SaDzTUv0i1JOplYvuTUWaXxt2ahmhDSJyijX9auVKl2s3/P+OyLM
         y8BafCq4qVAMj9qT5YXDZtdfpM3d1VQAB9zXXRI8DSPPimfGQNckNniKMf8H7dv/VWyc
         23H31DM2041tdp3CEKCrk2+uro7P6ca7WDapAcBCsef08AIjg8ZYWk8IvNH+khxVf2tW
         7uvA==
X-Gm-Message-State: AOJu0YwlDLv3l1X+gVtFJt5TvLx/HbcilbWicbkoj6V54rX9/je4jSzi
	0lnerBXXFgRNKblU6vK0YbLxE2zl0V1wJu5pMbg8zPbCmD46ZKjmRkxAPzu1Oa+hBXb/lCEB8x8
	5Qi+rldp7qMKp/7yNhfNwuoy7kzvD6kDSwRGdkOBPXjVFxBsG2YOHBP4yJwdl2CYn7975
X-Gm-Gg: ASbGncu2Ja73oZg0UKEyyZWd6+Gx06s2haN++OJ/hU0mPzNd13IHdzebRGO3p8/hWrn
	z/Y/xSaSFALTiasd/F4TrMru0M2nDBWccdZKWXIX8ueubNSSZVx7mYJ9gQvnUk+FHGDub5l7zUq
	4H+9aLIVZMNP0K1FDYMGXws5qJGbg7HdxA63itiH/ihPgrmfy058zkb0n1pGKW1+LOgSPusHNxi
	4BH95AJXIJLoyJYvk3UN1QALqePiK3goiwGvRfv2DU/pIWsRVcEq+2bHgWcs3HW4lESOxvQZSXa
	cKG9X6Szyzvh3Nvkvt83GiFPsjTDyQQUFsZnwAGe/1PskxBFxDX8miH4nUH9rOCg23X3phzEpZM
	crg2GM7/KT4QTUspIH6ZiPMzyY3ac3532QT76Pc+BP8idW86Wdqc=
X-Received: by 2002:a17:90b:28c4:b0:327:c0c6:8829 with SMTP id 98e67ed59e1d1-33bcf8e4f50mr38230862a91.24.1761353274891;
        Fri, 24 Oct 2025 17:47:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHsWduzpj9A0+6O0Mb4Y5n3tBIAhWy4IVRZU2n2C8/tYxem2hrCBYq4qjS6B1Ab7R1Pf4uGJA==
X-Received: by 2002:a17:90b:28c4:b0:327:c0c6:8829 with SMTP id 98e67ed59e1d1-33bcf8e4f50mr38230842a91.24.1761353274331;
        Fri, 24 Oct 2025 17:47:54 -0700 (PDT)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33fed3eca8dsm167352a91.0.2025.10.24.17.47.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 17:47:53 -0700 (PDT)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Date: Fri, 24 Oct 2025 17:47:39 -0700
Subject: [PATCH v6 1/8] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy:
 Add Glymur compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251024-glymur_usb-v6-1-471fa39ff857@oss.qualcomm.com>
References: <20251024-glymur_usb-v6-0-471fa39ff857@oss.qualcomm.com>
In-Reply-To: <20251024-glymur_usb-v6-0-471fa39ff857@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Abel Vesa <abel.vesa@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxNSBTYWx0ZWRfX52rf31/UCGwb
 +fY2CRZlJXVh2l4+9SZAnfrZOEuEli5wlkYEx7sTukm2hw/FinAxsMVS81VWljROEuVZgoYcUw+
 m/yvBTJGAlE6rwlxRl0QKcKUgxguRumKXN5WG0LuLdOTE5z7LiI/FA16O6R9XH9WLyurRp+iQmM
 M2xrOi8u2QfPJAybRve5Zuwow3wLELWeXhkkMCInu9wETiXcVldAOtim9w5Ukmc+9X3xTSnaMHQ
 sXMMoNmyDeepQbmHDYZATzmZnFfINsT8XGaMRZXzENbDa3OKiqsCUQ2X3g9aDZYlYVJw0nbVeOY
 nb4NP04U8KzZk+DPOTY/bgwa0s4l95dSTI/YASVoL4y+YfJESBzG0qPk5gGd6YeFX4xa4J19GXT
 0w1jasMUatsABJ/Ili3xDFz8I2NPuw==
X-Authority-Analysis: v=2.4 cv=bNUb4f+Z c=1 sm=1 tr=0 ts=68fc1e3c cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=10t125jH_Dd_vgTH4ywA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: e-zPQC02Bo_MwfkQIHxjSmC_ynGye49S
X-Proofpoint-ORIG-GUID: e-zPQC02Bo_MwfkQIHxjSmC_ynGye49S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-24_05,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180015

Define a Glymur compatible string for the QMP PHY combo driver, along with
resource requirements.  Add a different identifier for the primary QMP PHY
instance as it does not require a clkref entry.

Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
---
 .../bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml      | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
index c8bc512df08b..915e6024d3e4 100644
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
@@ -63,6 +64,8 @@ properties:
 
   vdda-pll-supply: true
 
+  refgen-supply: true
+
   "#clock-cells":
     const: 1
     description:
@@ -128,6 +131,7 @@ allOf:
       properties:
         compatible:
           enum:
+            - qcom,glymur-qmp-usb3-dp-phy
             - qcom,sar2130p-qmp-usb3-dp-phy
             - qcom,sc8280xp-qmp-usb43dp-phy
             - qcom,sm6350-qmp-usb3-dp-phy
@@ -142,6 +146,18 @@ allOf:
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

-- 
2.34.1


