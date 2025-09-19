Return-Path: <linux-arm-msm+bounces-74196-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD187B89E72
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 16:25:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 132513A6175
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 14:25:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 478673081AC;
	Fri, 19 Sep 2025 14:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XwLNwrKN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF87E211A28
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 14:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758291915; cv=none; b=RqIoGv2+qNYHksJCtRk65dHN133xbai/HFd7Whxsj9Mxv/izrLe4xRbSopFknfBrMsspP44KPQZklvtPMPlV/71R5t4bXPWlHw6jmV6IjoDMJ4lKFdTr4bpm1+I5C71cB++sW7uQeGNYHkXU609c8Bvvynoi1zgye8+3h27+Azk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758291915; c=relaxed/simple;
	bh=LgccMGQtMns6i0nd4D5JzFa/u0XEgWzMdMJHz1iq7Mg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fd4gmX1Idl3L4W4Wr2pggUv55NZwJbu58c+ZRqk5T6bLZAmeNrukEbRfv61Z0XEUMY1Aa9ynL0ZmLPl6jgpT0J870oN/M91omr+XHBjQ6V8oW2ZN8Y5+UFvEZwFeHjo2zcYDbOdYISSAoqOM5hkwB2muwI0DdSdZJ0W1bMagjzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XwLNwrKN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58JACIvD007416
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 14:25:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jjkngGlYDAm4B8CujfeVMFkJRW4QuQM6B+E9nbyKLy0=; b=XwLNwrKNd7S2G9Ag
	tVv/XivBG3wkM00x1URxUr+16xz5hvEjAl7txzyNk+DVQ1O1fEAmL5ANBNNsO+uu
	SY5edrw9DW6kJnNdXHZrZGg5AGydVyo0Pc6ABzXIE99ETlqOB3rtstNRrwxSehMq
	d4U49c75//MU8W/Tm3R1XwzDwRBFVI8flA4j22L81MaAz1XQM39VXEmL2fCCT/y5
	4eSAgOYaPFrk4F7u2J1xCOTLrteq7kFtUtVMlyslw8XXWqxi78MzRnwUOQbVqMT2
	Uux4E0w7v9Y9jURrFbStxhhbOC4di72lmg9j60fRuWaj/lUadUDeoi7J48OtMm6b
	yDGV6w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 498ebew6ru-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 14:25:13 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-26b3e727467so2155445ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 07:25:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758291911; x=1758896711;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jjkngGlYDAm4B8CujfeVMFkJRW4QuQM6B+E9nbyKLy0=;
        b=FZA3n3o715s/2ih95jJzKBS4lHm44wC5J5y2I6oFhERUlvAB7O6s3jds1BntQjANhw
         9AeCpaO8aG2K8dCuv+VZzkF45qHIhcPz4CB8dTgudkmLVwrVbCqXtC3SsYVHvMVYfYP6
         cWLU0J7FZ1LeQx4Ieyoexotr3h8IfWLDE4j+UWQ+IcZH7GKJ16O+h809e3OJAUA6E1ft
         fKR6nyPUIADFDURud5E9s9ZxmyDWtmuxZU7HCW/9uRqEDqmr/6bOM9bDt+SFIHDazTEe
         Djfg0mAhe7wTVQsdLs1Mn4I8Obx6GEdGZet222UEpRGGIa/XjvNiAQIvmXXnivRf2YKD
         NQqA==
X-Gm-Message-State: AOJu0YwzAZvBCR0hbKmW0EdU4Q4lsIU7RUF125E4ow9LI4R2jAiEwIUo
	HWG+0EU1sIb5EQD2FnhyCvGLU7hLqBecwGa/IKHdMdWLneeOEoCF4EuKay07Vlmgkpz3WOaKnf3
	uE4Le6Og5Rw4HKa9H6p0qQWyM3Ym/K705UUud2LIQYfIHYrvn5+8/SOmC1tynl20PIxOj
X-Gm-Gg: ASbGncseSHg9AarovwieqANUt5p14xpXQltFYCkKClzELvtfHjzxYBvz6X+GJTcNZqm
	HM3fT1Mo6dXIYmQUT2v4ZyfvJhT+IXpMoHYJg8st/IUPAJCh7wy8STjzwV+J3gRGDJ5lQJPVSZf
	cBBpJLic1cteuPifmSyUHgEgQD1uSBcj86eGdLBeUJMbJqWEVR86yohlcrBvuUcLhJvLrSR9P/s
	w/IN0ic2XGeSRkVMbcIKAbpCzqOQmAb1f5gb1DCYByQBoqo87Y46wB+LOHc1pe9aeuD/P+6JzWq
	NE83/QmJa3vc2pKVlnuVxigOKlvlGQuOmLwU9XiOul6kUMmpiXoLTD2S3kGr/vV1ZECL/ykGHUn
	DIyqHSi0mGsHEFQ==
X-Received: by 2002:a17:903:110c:b0:266:914a:2e7a with SMTP id d9443c01a7336-269ba50450bmr27749485ad.6.1758291910734;
        Fri, 19 Sep 2025 07:25:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGNdp3Kcohgum9P+lZ9uer4C3QWn2+bzqgb/I1lYBtm+XMAJb9HgZWehfhr8J/pRPZqfU6JUQ==
X-Received: by 2002:a17:903:110c:b0:266:914a:2e7a with SMTP id d9443c01a7336-269ba50450bmr27749045ad.6.1758291910184;
        Fri, 19 Sep 2025 07:25:10 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-26e80409ee3sm2210035ad.80.2025.09.19.07.25.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 07:25:09 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Date: Fri, 19 Sep 2025 22:24:18 +0800
Subject: [PATCH v5 01/14] dt-bindings: phy: Add QMP USB3+DP PHY for QCS615
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250919-add-displayport-support-for-qcs615-platform-v5-1-eae6681f4002@oss.qualcomm.com>
References: <20250919-add-displayport-support-for-qcs615-platform-v5-0-eae6681f4002@oss.qualcomm.com>
In-Reply-To: <20250919-add-displayport-support-for-qcs615-platform-v5-0-eae6681f4002@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
        li.liu@oss.qualcomm.com,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758291893; l=3530;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=LgccMGQtMns6i0nd4D5JzFa/u0XEgWzMdMJHz1iq7Mg=;
 b=RZ+pfI6lFlal5bTRELifiJDJOmNfSXOrbV3GmlnRc2mTgli3PLCghwRB5J5m50K8n1B+MODV2
 XfXIoGT1Ml/BuEV6FMILLRv1YKYgdDV2m82jRmd6HmmA/ON7VD3gTd3
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Proofpoint-ORIG-GUID: K8-TufU0pgwIrEWuHmh0vZ9AaJI6Ug-n
X-Authority-Analysis: v=2.4 cv=H6/bw/Yi c=1 sm=1 tr=0 ts=68cd67c9 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8
 a=z8W1oWq9hX_DlPyfQGsA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: K8-TufU0pgwIrEWuHmh0vZ9AaJI6Ug-n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE4MDA3NCBTYWx0ZWRfXxuiZ9M5liW8z
 HR/8GJpZ8jIWIFsYQL9wIVhbZZI+ivEJokmFKKrf4j09+62nZLL9xlg0Tw2KFg2dG7xozMJB15X
 XNFLaLRcisONugKnm/O/kkxlvvVt1vA0d3YOegy0i4gpmK5/idRWYppykMrmOdtM31DFWCTAmoI
 +5EHeQk2jsKBeNd+zbsLfiWTPp8qZCTff76JIyb+at8E7ohb9jXk20CtkDq2Mir4Uu1hKKWKuf3
 rKkWGOT+6NVqFsDtjCQL/ZSP+kb1Dd6UCD8AH3MWm85EZ/2O8UMSj+YR0ZMYtE3MvkLlz0NwLb4
 saiJpjmSVC9F+V8VoW7lFwho6/m7q9Yj1EGIJmxGWDkM8KtxQtp+W6sjYNUhO5Dg/8jT+k8Qt0m
 6D6mqqeU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-19_01,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509180074

Add device tree binding documentation for the Qualcomm QMP USB3+DP PHY
on QCS615 Platform. This PHY supports both USB3 and DP functionality
over USB-C, with PHY mode switching capability. It does not support
combo mode.

Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
 .../bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml   | 111 +++++++++++++++++++++
 1 file changed, 111 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..efb465c71c1b5870bd7ad3b0ec215cf693a32f04
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml
@@ -0,0 +1,111 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/qcom,qcs615-qmp-usb3dp-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm QMP USB3-DP PHY controller (DP, QCS615)
+
+maintainers:
+  - Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
+
+description:
+  The QMP PHY controller supports physical layer functionality for both USB3
+  and DisplayPort over USB-C. While it enables mode switching between USB3 and
+  DisplayPort, but does not support combo mode.
+
+properties:
+  compatible:
+    enum:
+      - qcom,qcs615-qmp-usb3-dp-phy
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 4
+
+  clock-names:
+    items:
+      - const: aux
+      - const: ref
+      - const: cfg_ahb
+      - const: pipe
+
+  resets:
+    maxItems: 2
+
+  reset-names:
+    items:
+      - const: phy_phy
+      - const: dp_phy
+
+  vdda-phy-supply: true
+
+  vdda-pll-supply: true
+
+  "#clock-cells":
+    const: 1
+    description:
+      See include/dt-bindings/phy/phy-qcom-qmp.h
+
+  "#phy-cells":
+    const: 1
+    description:
+      See include/dt-bindings/phy/phy-qcom-qmp.h
+
+  qcom,tcsr-reg:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: phandle to TCSR hardware block
+          - description: offset of the VLS CLAMP register
+          - description: offset of the PHY mode register
+    description: Clamp and PHY mode register present in the TCSR
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - vdda-phy-supply
+  - vdda-pll-supply
+  - "#clock-cells"
+  - "#phy-cells"
+  - qcom,tcsr-reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,qcs615-gcc.h>
+    #include <dt-bindings/clock/qcom,rpmh.h>
+
+    phy@88e8000 {
+      compatible = "qcom,qcs615-qmp-usb3-dp-phy";
+      reg = <0x88e8000 0x2000>;
+
+      clocks = <&gcc GCC_USB2_SEC_PHY_AUX_CLK>,
+               <&gcc GCC_USB3_SEC_CLKREF_CLK>,
+               <&gcc GCC_AHB2PHY_WEST_CLK>,
+               <&gcc GCC_USB2_SEC_PHY_PIPE_CLK>;
+      clock-names = "aux",
+                    "ref",
+                    "cfg_ahb",
+                    "pipe";
+
+      resets = <&gcc GCC_USB3PHY_PHY_SEC_BCR>,
+               <&gcc GCC_USB3_DP_PHY_SEC_BCR>;
+      reset-names = "phy_phy",
+                    "dp_phy";
+
+      vdda-phy-supply = <&vreg_l5a>;
+      vdda-pll-supply = <&vreg_l12a>;
+
+      #clock-cells = <1>;
+      #phy-cells = <1>;
+
+      qcom,tcsr-reg = <&tcsr 0xbff0 0xb24c>;
+    };

-- 
2.34.1


