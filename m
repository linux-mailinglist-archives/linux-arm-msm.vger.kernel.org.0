Return-Path: <linux-arm-msm+bounces-68126-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D22AB1E9E0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Aug 2025 16:04:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2D7E916E2FD
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Aug 2025 14:04:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C53227E1AC;
	Fri,  8 Aug 2025 14:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XkT+Hxdu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F401527E7FD
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 Aug 2025 14:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754661839; cv=none; b=ZMZF5mbkMJQRhPxRvMA7e8raeH/1K0IzEnAiOCEaZoVgrX4U/RY4Syw7g3smOLWbiuUZcuowDv6w22J2zNcueRVwOtFZ90WJGNlpplZTNa7c96rY+tE3++AhgvzYPFi7XAMyjHbyjbEciUoylNO66W5lq1bdEuSBTAfUyS3l3oE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754661839; c=relaxed/simple;
	bh=NIUgvFjTnufpMaUkhepDMTHRYMdG1B9PZQLZLAxkW70=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=alIouNwO3yrK1PLYhb7L7S+2bkr32yTvd+n2DKnONM7+DvjV9jCcJLh3CwyH8b67/4VppeuUVQUNuk3zHHkJRuKf6MuPSOBDph0cNZnlL0xisxYcnf6p3zOmWWa5sfl61mZJjoBreDqJiejGaw5+Lf7SW1LNBGhteFLZX9qc2Z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XkT+Hxdu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57876RmO020381
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 Aug 2025 14:03:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:date:from:in-reply-to:message-id:references:subject:to; s=
	qcppdkim1; bh=cnwUV/QDjexBy5i2zSATpYmuz01jPJJmOp4tvR0Fjy8=; b=Xk
	T+HxduDoSB2QQmVB7zz54+Mo7dYHn/AApzxrJE1mNG/dPhFcIo2Z6QWFDef6pgrO
	PTzTqeBGVnzDaFfALKMtniB0lgPPQB2ox0Cc8LYD64IJs89LXZMEbDRS0qIzw2Fz
	gdBz1CADWa+Q7BmejfEFsB1aJAE0d5BuKoWunBjzLygXVKOkmgo2ZYV/W+vxUZrD
	3Ggkzn88o6gx16g+tDTABZYa2sHrkGqFHtFqPG4Rvo5yFN6hUUsN1pyCxke0TSuL
	rpCEMVrQog1NRx1F9HQaOW96+qY3eZ0TPwcuP4Hx20xe7hF7NRUprG4Fyl/iRXLA
	EZFEjNHNprdPInLi4Wlw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpy8j8yy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 Aug 2025 14:03:56 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-74b29ee4f8bso2530593b3a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Aug 2025 07:03:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754661834; x=1755266634;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cnwUV/QDjexBy5i2zSATpYmuz01jPJJmOp4tvR0Fjy8=;
        b=qao7F0jRuhJqvE/9VqOl+H6JpsRIP1ln/5lajGtwIDlSSdcf7stZDNqmeTC486bM+8
         Z8Adp78QcS+MYfkKswk1cml3UWEuQGpdTmPx+a6Dd0ZNqhGehsv41n+c9MMMhIvoGsDr
         BRDjqvt+AAGI/uPrQLbJqWyD3ypahDi3covGxhFMRIhlz0tHVyYWgIwDBevCGWWwCZP6
         WzYA3PnwKfTCjcbcpX4wg2FRiFNMisBOnN22h80N5P9E3hYMmwJzPGuH9EDErVYLfotY
         YL3aGCPLB9iWH2VrupybQ7LqZjNcGb6ROIf8T9CTLiqphyFMs6aYqRtvIEfcozmCaPqD
         +i1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXmrM0WIpqXWgWNPmQ8Dk3dD4H+WlGbNir/mqcM+FiZ572V1XyesIsPUaQDrEz4ieNP7Y+X+Vv5SzZ7t72I@vger.kernel.org
X-Gm-Message-State: AOJu0YwrGIS64bRakITn7dhUL88xRamheZtOSCGpM8M9WCtWTV3TGafa
	2VidsArzqm8sDacLx3AZsBMt7d3g/2tNPJPjrpHjlV+gPBNAmKsgESX51tK+xtyWpUE2zZW+CGo
	c6iQigUNpYxIAyNNkzwX2cet8AP+kjIrAOh1LZEu6jtW03mYGe/WXwit60+5W9dbywm6d
X-Gm-Gg: ASbGncuFCXncTDzP771HD1LuTSvd/3p1GSPGQ0ToidR/BSW2YD/qhrb7ib6mdM9pwl5
	Fhr13cG8HeEUaO7LkSAU82mhEfMCZtsyrNETV+gD5AyM2/XUXjNLgN8U3d2Ey3n/49+3nPfiieI
	EbdMiloU1KSb2PeLz+M7SIcO197Z0TGvLYn0tM/c9scCf2DrRmaRWEuymGA58e16OqjwemQvH02
	Is46xywnby8hOVf724dzXnIpy4L28q09JdG1br0b7S/kUnAyc9ek4/5KvfbFPYaREgIfjgiBRdM
	NmJww5JNt08TuOJnZBebcgKevyayeKz7Ru6JURSG4IfIyupVH5e4wOEkQx11pa+tbknRH1nQgw=
	=
X-Received: by 2002:a05:6a00:23d2:b0:76b:c557:b945 with SMTP id d2e1a72fcca58-76c461f7dfcmr5163482b3a.24.1754661834239;
        Fri, 08 Aug 2025 07:03:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHTzksWDnpE2o7+ZsFPvW6Wq4obz7S9H+b2kg5hFSWzEbMcyjh4qUMKtT2DtOoa8U5Mt9x6nQ==
X-Received: by 2002:a05:6a00:23d2:b0:76b:c557:b945 with SMTP id d2e1a72fcca58-76c461f7dfcmr5163411b3a.24.1754661833734;
        Fri, 08 Aug 2025 07:03:53 -0700 (PDT)
Received: from hu-okukatla-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76c2078afd8sm8595621b3a.117.2025.08.08.07.03.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 07:03:53 -0700 (PDT)
From: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>
Subject: [PATCH 1/3] dt-bindings: interconnect: add clocks property to enable QoS on sa8775p
Date: Fri,  8 Aug 2025 19:32:58 +0530
Message-Id: <20250808140300.14784-2-odelu.kukatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250808140300.14784-1-odelu.kukatla@oss.qualcomm.com>
References: <20250808140300.14784-1-odelu.kukatla@oss.qualcomm.com>
X-Proofpoint-GUID: IXy_75i9qm6oKVIs2qvnFvcyvcZ6hZZ2
X-Proofpoint-ORIG-GUID: IXy_75i9qm6oKVIs2qvnFvcyvcZ6hZZ2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfXyTmlEIYxCZK+
 X1+jelLKNY3LmhDFrKaVrgp7DWQqqpfuxl38D+Jz6vRGTDi8q3hfpWw3engeyKsOGE6ITsCQr5U
 CbOgNUERCayV52z+iJfYQQQYZfGIAz4ukuc3Sc6QZgIrHZA7BNKFKyoyHiV248TV7u4gG9pv9Y9
 uHBIChj42/ZWmHBvBE5wTXg9VZ2P3TZ1lalnOzIryLRiodN2sbE1Nn1tERqSTolZ8L3+23JkA2Q
 KJfyV9EagZZeMTvaHuwcLZE0SA1jpigI1jeGP2HE4OXCPIxrnn1/1vm/2lnUZ9Cif5uv2wye50D
 c58ngBuS9jbNcD5NY4pK0C1w25ZIFK9NLcn2rEVqGOlVB+T//R8+OyPVREv9M1kknaT6AtuePxC
 5gFDA9XP
X-Authority-Analysis: v=2.4 cv=GrlC+l1C c=1 sm=1 tr=0 ts=689603cc cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=kq7KVtybw__Sne4F7ZAA:9
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-08_04,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1011 suspectscore=0 priorityscore=1501
 phishscore=0 adultscore=0 bulkscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

Add reg and clocks properties to enable the clocks required
for accessing QoS configuration.

Signed-off-by: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
---
 .../interconnect/qcom,sa8775p-rpmh.yaml       | 78 ++++++++++++++++++-
 1 file changed, 77 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,sa8775p-rpmh.yaml b/Documentation/devicetree/bindings/interconnect/qcom,sa8775p-rpmh.yaml
index db19fd5c5708..be3d02fb73a4 100644
--- a/Documentation/devicetree/bindings/interconnect/qcom,sa8775p-rpmh.yaml
+++ b/Documentation/devicetree/bindings/interconnect/qcom,sa8775p-rpmh.yaml
@@ -33,18 +33,94 @@ properties:
       - qcom,sa8775p-pcie-anoc
       - qcom,sa8775p-system-noc
 
+  reg:
+    maxItems: 1
+
+  clocks:
+    minItems: 2
+    maxItems: 5
+
 required:
   - compatible
 
 allOf:
   - $ref: qcom,rpmh-common.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sa8775p-clk-virt
+              - qcom,sa8775p-mc-virt
+    then:
+      properties:
+        reg: false
+    else:
+      required:
+        - reg
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sa8775p-aggre1-noc
+    then:
+      properties:
+        clocks:
+          items:
+            - description: aggre UFS PHY AXI clock
+            - description: aggre QUP PRIM AXI clock
+            - description: aggre USB2 PRIM AXI clock
+            - description: aggre USB3 PRIM AXI clock
+            - description: aggre USB3 SEC AXI clock
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sa8775p-aggre2-noc
+    then:
+      properties:
+        clocks:
+          items:
+            - description: aggre UFS CARD AXI clock
+            - description: RPMH CC IPA clock
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sa8775p-aggre1-noc
+              - qcom,sa8775p-aggre2-noc
+    then:
+      required:
+        - clocks
+    else:
+      properties:
+        clocks: false
 
 unevaluatedProperties: false
 
 examples:
   - |
-    aggre1_noc: interconnect-aggre1-noc {
+    #include <dt-bindings/clock/qcom,sa8775p-gcc.h>
+    clk_virt: interconnect-clk-virt {
+        compatible = "qcom,sa8775p-clk-virt";
+        #interconnect-cells = <2>;
+        qcom,bcm-voters = <&apps_bcm_voter>;
+    };
+
+    aggre1_noc: interconnect@16c0000 {
         compatible = "qcom,sa8775p-aggre1-noc";
+        reg = <0x016c0000 0x18080>;
         #interconnect-cells = <2>;
         qcom,bcm-voters = <&apps_bcm_voter>;
+        clocks = <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
+                 <&gcc GCC_AGGRE_NOC_QUPV3_AXI_CLK>,
+                 <&gcc GCC_AGGRE_USB2_PRIM_AXI_CLK>,
+                 <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>,
+                 <&gcc GCC_AGGRE_USB3_SEC_AXI_CLK>;
     };
-- 
2.17.1


