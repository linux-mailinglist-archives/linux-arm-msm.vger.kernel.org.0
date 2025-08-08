Return-Path: <linux-arm-msm+bounces-68093-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4850BB1E4E0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Aug 2025 10:53:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DB4637B459F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Aug 2025 08:52:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A97662698BF;
	Fri,  8 Aug 2025 08:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QO2vVE+W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D59F26738C
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 Aug 2025 08:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754643189; cv=none; b=j7flUjOlqo5OddvvFmYIpiM/7X6dRbcNmiGSLfHsNrafONkSIk3OlhUZL5p7+MzqJP8jlD/eQEN5Mb4ivJlb6UBj0A+2NmFo7D6SYEjK+WwI/AU9NKproTC7CJNRp0uwyq28AZghtLoH5ZPEq3b7KCN0j+Wr180IrtPFBW7YEsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754643189; c=relaxed/simple;
	bh=VO/XqcSD3T9bRV+GvDZsTJwOmB/gxlb+z0LFlAiA8e0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ehLXj5Ts++bIqUjoVNM4OE1dPNjGpYFy2h2fFi8UAMYs1c7Zt+hZ7qEvJqp7H62y50GrYbM/ThzhBRv4iVMnGNUer8+fG3VR/ijW4OMQUv2hTKKbkNZ49l+UKb52WarcLxJX28Ev9v+uHnPAJbrxHkaR2MFA8eU8oET9focgcD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QO2vVE+W; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5787Nkk0032599
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 Aug 2025 08:53:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=YY+jHz5mvoy
	usButmdCoBF7o4RYZY+zFj5xw1jAtys8=; b=QO2vVE+WImiB2QQHiDqCqsQQfy+
	RKEuhoNN0jAyOPrnDz8Bbg8+msNSO/P+LXXGqp+/OdweCQ4XPsA2X7FLB5C0Yjoj
	pdIgeFOBO1V45AFoqZJ7GeBliptt8tO1DkxWqByXoQl5xcycYSTZIy/jSkxdfZUC
	ofXaYIaVWYc3jrbUA37B7u6HszAHw7bMxcRXRFGSDqm3HuvUGDFJ+ChdS5Dtk1LM
	l5N4RfbW/IHeuur9/rp6eCrasfUITJkxCqbVqyYqzuzK706a31QqHeQo/y179cPt
	cJ4WvE9fKS8zzI5gjioaLAuSiLM+I/PxcGxX6PIRn+wgQp9drn20r+cB9Mg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpw39a8y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 Aug 2025 08:53:06 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b08431923dso43620801cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Aug 2025 01:53:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754643186; x=1755247986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YY+jHz5mvoyusButmdCoBF7o4RYZY+zFj5xw1jAtys8=;
        b=g5Gk00Ms9DAst3zUuz9G4jEXqJXWmRnsPegeJcj2Zc0OjP2wcHZvoVoit1QFnht7Gh
         iQgPDBt/WRz5FchiyQFY0kWhE5cRrJw73j/iska3eD/NrR0EcLzf3fzDjNK9WBhC+cWS
         Maf96ip8AAmBRo+pwFFwOdGliGauqxGY5GcGJ98kDqQVxQLneh4jnfxcIeKJsNdgTp71
         17AxuRmvQe2ozewPZNzvhvEwoZf8rc54Wy4bvpESdP5O3rpmqBlay9DmYl9TKrNCsz8/
         P6cMzxBW63FpA4NVXHLueU+XuQU2iJAXGZXI2jbJsMgkektui1En3yVKx0ddXHRnIimg
         rxCw==
X-Gm-Message-State: AOJu0YzN5XikwlhNI5hyN2sUBiVeYm6/xzJHgm7L33GiV8gpT0W91yIl
	83j5/BdEixFMmIoTPGqf4bWcacYhJ6jliLp8ecBI7s+IIIjYuK+pC0GZuACS1Zpf3fQQ09rPSRW
	aDH+6DEdFqtP+JJFC95ywxNIOi1IZxxpmXJM9Ft7vPGpw+UB9t2+91m/EjOrPXVLu6XSm
X-Gm-Gg: ASbGncvYrKvRlLf+r2WYyeUOkKYEbbe5jQ5wFftB9SqH/ktBVeqAKul+0+Tw+i9U9bK
	o14l9pI2f2ymXAjwVo1WH/nEuFNGWj2xXQeJe5GmnL4nT9rcd3TbiEXAhTiFal81pXez4FvopWd
	ja+gH8QJf4pCt9jVS6bnwWWM/CyPAdHKhj9De4tRfHv3uO/zhz1FIeVXDN339mTMCO89/Dva+Dg
	6sDcN1FSVUdKTjuNKrOJ1q8cBw6d9ONKCfcBKkTHdiw1AhpYOkTzCuwACLqI0oHSV4tCC7twTD8
	ClKlKQ2GloOyU2yF9AV343c7E+OZYf4LJS4eE+qsOz2oQGnWYViUOX5Jq2WXwmmuvVt1/giFSji
	VJfv7chTI0Ac2
X-Received: by 2002:ac8:5a52:0:b0:4b0:71cb:5e2 with SMTP id d75a77b69052e-4b0aee53c93mr28851481cf.57.1754643185524;
        Fri, 08 Aug 2025 01:53:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFWE1wy483FvBMCB8gBXqvEqz7+Bjfkn4t+XKPgdXxmTF4S/YKJVwzhPdLQiJy08CuS7YtZ/w==
X-Received: by 2002:ac8:5a52:0:b0:4b0:71cb:5e2 with SMTP id d75a77b69052e-4b0aee53c93mr28851201cf.57.1754643185091;
        Fri, 08 Aug 2025 01:53:05 -0700 (PDT)
Received: from trex.. (205.red-83-60-94.dynamicip.rima-tde.net. [83.60.94.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459e5e99e04sm123818745e9.11.2025.08.08.01.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 01:53:04 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, quic_vgarodia@quicinc.com,
        quic_dikshita@quicinc.com, bryan.odonoghue@linaro.org,
        krzk+dt@kernel.org, konradybcio@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, mchehab@kernel.org, robh@kernel.org,
        andersson@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v9 1/8] media: dt-bindings: venus: Add qcm2290 dt schema
Date: Fri,  8 Aug 2025 10:52:53 +0200
Message-Id: <20250808085300.1403570-2-jorge.ramirez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250808085300.1403570-1-jorge.ramirez@oss.qualcomm.com>
References: <20250808085300.1403570-1-jorge.ramirez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOCBTYWx0ZWRfX69FO1ruECEok
 YRsoYmbvJoTVSVHf+e4f496Oicb3evJ79p3K9FGHAhHvChc10qax7DVLTcq33OxuL2mImEEYKKH
 Quskn6tGacImUyHi8u974QTteVB1IZkw+EYMfjE6LHnyuHFV608UQsZL5Lv1iRCEYLzfqvr2YvH
 QWqlTce8dFvmILy8p7p0ukYw2B9ns3eMQBybS0CjByFlKb6RSOICdLiBDGexagPq4j/AJhkoBSj
 FXV/gI0sYl12K/kzfmdjea3UzrsqQAAS74Mbxd+1gIy2dAhgsk8ELtTK9bUlGTMTzDIwH0MhUre
 KGLA5XBt/7NMshtYWanGEjbP3XoRQ3XczdIG0/oEhVPA8L3M+zjtIl2NpWMlYQDM+Kx2XzQpzcd
 iSz+a/n0
X-Authority-Analysis: v=2.4 cv=J8Cq7BnS c=1 sm=1 tr=0 ts=6895baf2 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=Rr2dNH5/fcnoRoBmcVUeRg==:17
 a=2OwXVqhp2XgA:10 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=Wl4eHCndyL1IYbKsAYUA:9 a=kacYvNCVWA4VmyqE58fU:22 a=sptkURWiP4Gy88Gu7hUp:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: tXe_9GQ4lBOu-32Aqe_sQatnIoO-RyiR
X-Proofpoint-ORIG-GUID: tXe_9GQ4lBOu-32Aqe_sQatnIoO-RyiR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-08_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508060008

Add a schema for the venus video encoder/decoder on the qcm2290.

The order of the IOMMU list is strict: the first two entries correspond
to non-secure IOMMUs, and the remaining three to secure IOMMUs.

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../bindings/media/qcom,qcm2290-venus.yaml    | 130 ++++++++++++++++++
 1 file changed, 130 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml

diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
new file mode 100644
index 000000000000..3f3ee82fc878
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
@@ -0,0 +1,130 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,qcm2290-venus.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm QCM2290 Venus video encode and decode accelerators
+
+maintainers:
+  - Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
+
+description:
+  The Venus AR50_LITE IP is a video encode and decode accelerator present
+  on Qualcomm platforms.
+
+allOf:
+  - $ref: qcom,venus-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,qcm2290-venus
+
+  power-domains:
+    maxItems: 3
+
+  power-domain-names:
+    items:
+      - const: venus
+      - const: vcodec0
+      - const: cx
+
+  clocks:
+    maxItems: 6
+
+  clock-names:
+    items:
+      - const: core
+      - const: iface
+      - const: bus
+      - const: throttle
+      - const: vcodec0_core
+      - const: vcodec0_bus
+
+  iommus:
+    maxItems: 5
+
+  interconnects:
+    maxItems: 2
+
+  interconnect-names:
+    items:
+      - const: video-mem
+      - const: cpu-cfg
+
+  operating-points-v2: true
+  opp-table:
+    type: object
+
+required:
+  - compatible
+  - power-domain-names
+  - iommus
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,gcc-qcm2290.h>
+    #include <dt-bindings/interconnect/qcom,qcm2290.h>
+    #include <dt-bindings/interconnect/qcom,rpm-icc.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
+    venus: video-codec@5a00000 {
+        compatible = "qcom,qcm2290-venus";
+        reg = <0x5a00000 0xf0000>;
+
+        interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
+
+        power-domains = <&gcc GCC_VENUS_GDSC>,
+                        <&gcc GCC_VCODEC0_GDSC>,
+                        <&rpmpd QCM2290_VDDCX>;
+        power-domain-names = "venus",
+                             "vcodec0",
+                             "cx";
+
+        operating-points-v2 = <&venus_opp_table>;
+
+        clocks = <&gcc GCC_VIDEO_VENUS_CTL_CLK>,
+                 <&gcc GCC_VIDEO_AHB_CLK>,
+                 <&gcc GCC_VENUS_CTL_AXI_CLK>,
+                 <&gcc GCC_VIDEO_THROTTLE_CORE_CLK>,
+                 <&gcc GCC_VIDEO_VCODEC0_SYS_CLK>,
+                 <&gcc GCC_VCODEC0_AXI_CLK>;
+        clock-names = "core",
+                       "iface",
+                       "bus",
+                       "throttle",
+                       "vcodec0_core",
+                       "vcodec0_bus";
+
+        memory-region = <&pil_video_mem>;
+
+        iommus = <&apps_smmu 0x860 0x0>,
+                 <&apps_smmu 0x880 0x0>,
+                 <&apps_smmu 0x861 0x04>,
+                 <&apps_smmu 0x863 0x0>,
+                 <&apps_smmu 0x804 0xe0>;
+
+        interconnects = <&mmnrt_virt MASTER_VIDEO_P0 RPM_ALWAYS_TAG
+                         &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>,
+                        <&bimc MASTER_APPSS_PROC RPM_ACTIVE_TAG
+                         &config_noc SLAVE_VENUS_CFG RPM_ACTIVE_TAG>;
+        interconnect-names = "video-mem",
+                             "cpu-cfg";
+
+        venus_opp_table: opp-table {
+            compatible = "operating-points-v2";
+
+            opp-133333333 {
+                opp-hz = /bits/ 64 <133333333>;
+                required-opps = <&rpmpd_opp_low_svs>;
+            };
+
+            opp-240000000 {
+                opp-hz = /bits/ 64 <240000000>;
+                required-opps = <&rpmpd_opp_svs>;
+            };
+        };
+    };
-- 
2.34.1


