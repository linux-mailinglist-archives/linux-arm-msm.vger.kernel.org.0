Return-Path: <linux-arm-msm+bounces-69926-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B03EB2D887
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 11:38:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C4CD17B943C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 09:36:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 668882D9EE2;
	Wed, 20 Aug 2025 09:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="israyspq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B616E2D6E72
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 09:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755682551; cv=none; b=uRtz+ub07iSvMnGyC2Z2nlFLm7mUaJOf3wajO35S3N5jx1U4I4nWcrhh5N2QnUFSRSiJIcoN3/MAQat21Z7QmYC1xSiJXVljxzp5AyLtU23e/Y1jD/BFggnpomc/RwYEi+l1StFJq5HFP3jjDQ+kLiaeM0ZW1annhN46D+wd9IE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755682551; c=relaxed/simple;
	bh=955LdwJghMXcL5Oa+X/F1FbgTdWO2XwHgQyUzbm6CDw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BjPRbLbC5lcTjCyt3u/wllxNgWzmhl2xDteYnFtYebFYRjKRVf2098nI6PNZH50Mk2SNIMQIPBd8TzpHAmSt4qYy/cJ6goOdXc41XoGEmEn31HBrHez5q7igRRQ4d76L1d7CVQiiJXfOyT+BicZgOmGxaD9lYKAPBhM5YxqDW8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=israyspq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57K1p2Yd031297
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 09:35:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/49lgJ2lsCfdk25hmebOHzPWeKmLJyq/ws+x1TYhUE4=; b=israyspqpbWd2wp8
	leQfCenqxm2845XZ5xLbsqfuzlVK+zU6/lRl0sCjKN34B0Iiaagf43GLo4kBa5t5
	aSb6d8MEfAOG6wSJr6K49b6UNI8y6QXrb3AZET286aM7EN8CmPLsm7C0oX2R/kTw
	qJkiwa68HLMww/eTBN3bKU1iIWJSV79eQr4PXwjcUgUOcgyI7ipbdKTxHsgRDVh5
	OzTqLBsMEzDx4si0I+FXl/7eG4JGZ1gOwkiVwfCE3QyBlWj0sGi/6CCf1iT8LYp1
	vCQBhJkYqz4aWAenF7AbSFB+DwvgHmvFUF0/poHBilaE9XOU/MxC8PKOBqnf/Kwn
	HvLk0Q==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52dh6ph-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 09:35:48 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b474310a516so1258809a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 02:35:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755682547; x=1756287347;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/49lgJ2lsCfdk25hmebOHzPWeKmLJyq/ws+x1TYhUE4=;
        b=QNQOBxWx6g3DXT+gYvMV4xqNY1C15oFdERac7vBrwKaIluyF8ZoKgOsFCgCEyoDIBT
         kGYxOL83rzT5LXDOaTYBxroK8mC+IkVJllVvDsGWKrZcN8FvBc99c0AeFbxCwdXrkCLw
         fJQLFHut4xTfUIww/uWwkTnWIcaCwKDz8Q8TvudhUdjYKS0K3gBrl4iqSvjIyankg+O/
         ewvIhhy+4+Y9mSPyUda7BtTa6yJAZsQWAjH2TD056Y/eesKwV6in5qTjFCbArSGOiFsM
         TDNmY9ZN+MjAoXTl2rWEJ0+9Wv2CrvFdybCSOckI+3WU53nGpfJjBYruybQ6intNvJw5
         dR/A==
X-Gm-Message-State: AOJu0Yz7K43GDl4ACJ6EQhFW9lk+XDyx2za54XucwtASuGqjF388GsDV
	dqtGdIqtsk6252yv+BY4Wev3E+qYr9AQpTbsuVmxdnfNC/MEapdb5kikFouiOBUpeLz+kMb422i
	WgYzCJXGvbUfo/lHKGiTZ3+ilN0nVBIW8WbZOfNiBO7PxgwYoa89+14fTJoTg4eNeFxUz
X-Gm-Gg: ASbGncuH+8E3+t+2cUPc39V6r73LBdSp1LceGzGklifxJijzVGCRPdblN8ff9C80sfr
	Y9QGg6n6rj223GbqAxGoWiD3g7xBqLsC/bDMV13G62ZroNfhQlChsK+RGwMo59mXCLO1xsBT0gR
	0WFc5IqVj0mXQnF3jSXi2ghPqvLbt+9vcCKwaRtdmHFB9dIywR2lNKX+jsbUTAV1iaw4/3KulRS
	IQqPZSgjKVQZ3g026gwZ3kl0m7TuvESLX6/42wgD1Fcf6qMjuPXkhBPkLlpkRtCtX0ht7DLlPXj
	yLA4GHl/yrc4+/s74P9GwqpXC9shkkMVV7wEKEq4Z4IHiXTvVyyPAqgx2VDsJOf1fuGVkSzHUOi
	s/6NRBQWxr0h8SMM7lrRXJu6ub7mgJC7SvqYsLKVmmDsThXpgtE9/p/Q6
X-Received: by 2002:a17:902:eccf:b0:240:3e72:ef98 with SMTP id d9443c01a7336-245ef289590mr14784745ad.10.1755682547301;
        Wed, 20 Aug 2025 02:35:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEN7kE8X7szS3MCwXFpbr5XYPBLHKFwJ2wnJ+GWqlR/yDhGf6M8mCARQFC3BCAmxLuxBIVsiA==
X-Received: by 2002:a17:902:eccf:b0:240:3e72:ef98 with SMTP id d9443c01a7336-245ef289590mr14784525ad.10.1755682546776;
        Wed, 20 Aug 2025 02:35:46 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed4ec100sm20954305ad.116.2025.08.20.02.35.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 02:35:46 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Date: Wed, 20 Aug 2025 17:34:44 +0800
Subject: [PATCH v3 02/14] dt-bindings: phy: Add QMP USB3+DP PHY for QCS615
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250820-add-displayport-support-for-qcs615-platform-v3-2-a43bd25ec39c@oss.qualcomm.com>
References: <20250820-add-displayport-support-for-qcs615-platform-v3-0-a43bd25ec39c@oss.qualcomm.com>
In-Reply-To: <20250820-add-displayport-support-for-qcs615-platform-v3-0-a43bd25ec39c@oss.qualcomm.com>
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
        Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        quic_lliu6@quicinc.com, Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755682520; l=3426;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=955LdwJghMXcL5Oa+X/F1FbgTdWO2XwHgQyUzbm6CDw=;
 b=nRN16ajcM4hDuEKG4MGhqYaO9MQPThBPfr7/k5iQv2p8RAz3Bpvm3qgoHRjh9h0AQnJ7Lr8uJ
 zPjRkWKFQ6FDsj88aANvA9/ugZbqSMVWLWriyLXGLLoVvPm0Bkvhv/o
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX6TGcGSN/gdTA
 eAciMYmmLgWi8e+GvlPTOHXBcl9MX0EJawMEDTeVgAvtEJiJ2zTYoCgTbnHO9Z5t3F2Bx9n4r4i
 QDpPgoJDI98jolk79E2jIJ6csnFuLxvJhVCweZ5qcTvvUVrRItoxulFJ6mo4qLn4TME8NqVYyqg
 ND9DlCvlMjZ5WDoV4rBMQcBLo/Pr32+WiSxZzYZv8Z67KgOjUazodQ5HZvSKdTSl3kDJkMbBrVU
 eoANYfVI3Ivmfe9NaVPFe3J+xA6sLSvmWBl8s3CYu2GLzBmrtP9YHZI6sZ58KnJ0ArncjTDNuew
 3pGoeIcHMV+rvbX0eOBGysrVR3MxqxwFs2ptY7uryUEQlUQnBkN6prTt00JpaL3LmjtporVdein
 HrI5t0qdxSuFiM/c+yhvOFledZBi1g==
X-Proofpoint-ORIG-GUID: I7AMW-3AnF_j_1jya-Gh3sDjqq7OM6BK
X-Proofpoint-GUID: I7AMW-3AnF_j_1jya-Gh3sDjqq7OM6BK
X-Authority-Analysis: v=2.4 cv=SoXJKPO0 c=1 sm=1 tr=0 ts=68a596f4 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=W1uZXkYdwnJCVkvvQWQA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_03,2025-08-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

Add device tree binding documentation for the Qualcomm QMP USB3+DP PHY
on QCS615 Platform. This PHY supports both USB3 and DP functionality
over USB-C, with PHY mode switching capability. It does not support
combo mode.

Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
 .../bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml   | 108 +++++++++++++++++++++
 1 file changed, 108 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..c2b1fbab2930f0653f4ddb95f7b54d8fe994f92d
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml
@@ -0,0 +1,108 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/qcom,qcs615-qmp-usb3dp-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm QMP USB3-DP PHY controller (DP, QCS615)
+
+maintainers:
+  - Vinod Koul <vkoul@kernel.org>
+
+description:
+  The QMP PHY controller supports physical layer functionality for both
+  USB3 and DisplayPort over USB-C. While it enables mode switching
+  between USB3 and DisplayPort, but does not support combo mode.
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
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: cfg_ahb
+      - const: ref
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
+      - items:
+          - description: phandle to TCSR hardware block
+          - description: offset of the DP PHY mode register
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
+      clocks = <&gcc GCC_AHB2PHY_WEST_CLK>,
+               <&gcc GCC_USB3_SEC_CLKREF_CLK>;
+      clock-names = "cfg_ahb",
+                    "ref";
+
+      resets = <&gcc GCC_USB3PHY_PHY_SEC_BCR >,
+               <&gcc GCC_USB3_DP_PHY_SEC_BCR>;
+      reset-names = "phy_phy",
+                    "dp_phy";
+
+      vdda-phy-supply = <&vreg_l11a>;
+      vdda-pll-supply = <&vreg_l5a>;
+
+      #clock-cells = <1>;
+      #phy-cells = <1>;
+
+      qcom,tcsr-reg = <&tcsr 0xbff0>,
+                      <&tcsr 0xb24c>;
+    };

-- 
2.34.1


