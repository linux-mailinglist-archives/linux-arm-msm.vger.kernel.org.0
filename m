Return-Path: <linux-arm-msm+bounces-73151-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69582B53673
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 16:55:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AFD315880BC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 14:55:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4ECE3451AC;
	Thu, 11 Sep 2025 14:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OWa2rwR9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1411A1E1DE9
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 14:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757602545; cv=none; b=deywRL5MDL+PcbxjeIunuMzWNts0iEpnoVgKQ7c/kSZCsjaGaH9wThwFZZa/lrKY1YgqICeYKXaRKdZ1DDeb186sPs1ou6VCBljB5/vVqvlbiDRbn9/i0kxJZpOTu8dkjxZDVW2ZDzHebjr3oSUcmZByk9T2MGok9k5iMpEb45U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757602545; c=relaxed/simple;
	bh=LgccMGQtMns6i0nd4D5JzFa/u0XEgWzMdMJHz1iq7Mg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BJw3NpD2GTvMNvb3OrwviPHQPOkd/UUOey15D4/6GryjJxZQb91bmw426sMgRWZMIapOwJlY15Cvyj8bhVSuX2rNasG/rVerCjOIEi7FMlYQVn35kpNPXwuRRSHCAuoK0lytEIAYXv330IQz9XUi9FGwdPNtaWwtUifxB2/3mfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OWa2rwR9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BBRmEe031037
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 14:55:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jjkngGlYDAm4B8CujfeVMFkJRW4QuQM6B+E9nbyKLy0=; b=OWa2rwR9JtE0Pi3E
	+VVmB9lAdF4GiGxz+77B3UPGSlLm7tlINIrm0wv1hVvZpywBjDiafCuGLmH3q2pN
	Ce3+OCnwsiOZnKHvBEXVexJJeJmwQtsPZFr1C7fCfEYu0UYMatUMWf02EAzrbpWE
	2//eJRAW21/1cBzgfsBrdmyBooiOApSHXkPkgsNyn6LUn0REtjcR2t8U30ffMStQ
	TfLVPpoS2IbH9wFFfMVb5n7XkU3PPeNcJ2Fg3VZ8t6Mxf6960P6uK6X5i55EHJvu
	5n2ciqIrHME8O4/yBWohYxG4EsKtVAMdUjaVhbMYHtGnSxHE80/b4HxsmOZQPXwa
	ZpegLg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490dqg7xhu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 14:55:43 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-24ce66b9b3dso2174605ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 07:55:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757602542; x=1758207342;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jjkngGlYDAm4B8CujfeVMFkJRW4QuQM6B+E9nbyKLy0=;
        b=e+gfmyx9gvOqWEL4xZtTnIS8M8oG4ahniHzHf246esv141Ky6iYMWZAeff6hf1zTWP
         PGsEKibika8rFeg6ejRliIDXXrpVS0MPSldcC7Mx9oWooMe8cG91Y5t0xFKNCkVmDKn2
         YkfLjGZw4HDJl3Wodirk1GyZ4gO2F1hunaQhQn1Qa+Mz9PIeDA6zRR0T8wEXsmLye+Vs
         FdtH8IBXZJn8+cxWIGz3aQz2R8x3QeI1N+C4RE5mCAqGpXAB8orzUnO826zPXjd8jPCy
         OV2yH1Hvq5j8y3xYKeU4ViELKOM6ZJ1yXtpT0MT7//haFmEjvZiSGc8baqk6JiAew1QS
         efKw==
X-Gm-Message-State: AOJu0Ywly+kiDgVW8JsA0qVscBIwgYC+LOpI0bHOtGqOo2A+DrKpRL95
	so+DDd0qRRQ+OYa5Ot+mBsE/8vo5dF7hzJdbLSErWkodw0NxVut6cK+HAGe7G73UZ07nOG1Nkl2
	eqDkARYVLxWmq+Jx1znN+CoB+iAOgsDhikOcxhGPiMU4FN2KJjWXMoRu8hNOKPfRJ3inJ
X-Gm-Gg: ASbGncvD5ykDOYcgbuEqBkU+uPuFvzC/8yxFIkxx4BC4p6i2/KQx+W3HwkjlG1OQ6gf
	SRvUtASS3zFfTo9GfrmI+lHolMjyGB0gTo/938IOlGkuUPuYxrKgmJkCIYqWw+PWy55kfpCscIn
	/cqEbt4pbj87LRPpJgbJMDMfQ2FmoK7n9znrKSSyUX3sZFndX2dMiU+UnJjLCws3zIxcQwUIt9p
	v+UqwUYet4t8PAHolBqPOettDJFnsoYwcH+8rfTt3o8BHGYuBIUnyOB3zHLSjHP+geeBRr4kr2N
	K3Pw7FoE+EAzn6Qt9GtVKO6tPN+XBk0EDognOpVhzphX9D95NgDGiiWZ9+FWwhZvI2n3txM740m
	F1g4XpVmf/GP7vYAJcfml+CD6mdO1GxSBLJKWqMl4AW+qzr3ed4VzZwRr
X-Received: by 2002:a17:902:c40b:b0:243:589d:148e with SMTP id d9443c01a7336-2516f23de24mr132990885ad.5.1757602542196;
        Thu, 11 Sep 2025 07:55:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFEtpsa7qlUyYAsgBCQGIBTzIJxW2bcMhr8lZkbI7bFHvqypkmZ+m9OuDf0/hYNs6aysv1XsQ==
X-Received: by 2002:a17:902:c40b:b0:243:589d:148e with SMTP id d9443c01a7336-2516f23de24mr132990335ad.5.1757602541465;
        Thu, 11 Sep 2025 07:55:41 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b54a387cd4bsm2107453a12.35.2025.09.11.07.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 07:55:41 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Date: Thu, 11 Sep 2025 22:54:58 +0800
Subject: [PATCH v4 01/13] dt-bindings: phy: Add QMP USB3+DP PHY for QCS615
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250911-add-displayport-support-for-qcs615-platform-v4-1-2702bdda14ed@oss.qualcomm.com>
References: <20250911-add-displayport-support-for-qcs615-platform-v4-0-2702bdda14ed@oss.qualcomm.com>
In-Reply-To: <20250911-add-displayport-support-for-qcs615-platform-v4-0-2702bdda14ed@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
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
        li.liu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757602527; l=3530;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=LgccMGQtMns6i0nd4D5JzFa/u0XEgWzMdMJHz1iq7Mg=;
 b=mXj8P2zI5LqxmvJf/ITJhpiVlig+/0otZwvxQRDsBRti9c9obJVcSQTesm+iB69NrWfS1lqLZ
 V6KJztXRPxcBV79k9PWjTr9xRHUa2hlg3SDAYgvXdXof961JAOSGaTy
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Proofpoint-ORIG-GUID: mx-0B_PgNtV5mSneCX8mnxfumhfC8wTb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzNSBTYWx0ZWRfX6j9/Mb6y4OA3
 3ulNrXRWJrKgPgcgNsfnk4j37iJSqsFHsd/QrvkEcuM4Jf50JpZZXwfb4sXzaktY3+/E5h5Nfkg
 F/87QotSkQAz7QGpGl6ZW96DGiVe/vPROkUrsR/3sJUaSUcPmugmSsrCQ44jvwOXgI9seFt6s/d
 2KtNsMBw/8D9HpiDEbmVYm2mlDNUfpQkL8or/wbDtd/bSE/HnvlAe5hlzEaWY/Du+k4Ph6BH/uS
 2wxgmuaq0ywX8ZUAF2kXjRDfZhGhS/z8PfSZi3fd15qx6XOYyq7+8ZP8sPcMKAg4lYgiJGSnibe
 EqzNi5vITNYWK+Dv7GXqKvpGXoidZTb1umjsqu05/3pZSy+gTRSQkeKol2Apwwwh8Upty+Goadp
 XUXVRopF
X-Proofpoint-GUID: mx-0B_PgNtV5mSneCX8mnxfumhfC8wTb
X-Authority-Analysis: v=2.4 cv=N8UpF39B c=1 sm=1 tr=0 ts=68c2e2ef cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8
 a=z8W1oWq9hX_DlPyfQGsA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-11_01,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060035

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


