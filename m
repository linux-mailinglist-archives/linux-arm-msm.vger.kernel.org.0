Return-Path: <linux-arm-msm+bounces-61232-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F01FAD8EE4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 16:12:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8C3523BF694
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 14:08:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F200D2D320C;
	Fri, 13 Jun 2025 14:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R/pXrXiH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE9162D12EE
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jun 2025 14:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749823474; cv=none; b=Flazv6phpEX02Tq9X8EfS8cJ+uDpKXYVjOomLhln9klbVT7vvgRIo2gWlYsds/9rm18UjdxvPA5WICk7jQD/7F/NSX6ZO9RlOeW0f4YUwNeXhqheSfZXUYaIGBi92RYYTcdkaUxELYK4C/X6eI9U1Vm87LloQLWmgThJgit8Zy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749823474; c=relaxed/simple;
	bh=gdhfUspPyqBiEzOlF6EWkZ6U0ttrz2LFWzzIn0eDJFA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NyH/8fhtPuUTmUDTyg/Hi7O9AY38lIpgxRJlQsE6YP7BsH668XjWEa5TgoJjDmdR5tphj8HpRu+hO+AZoOAk9UpbKX9Tlo9khuJDgEw9DYG0ALi44fSXn4VU2gi1GgFT0DqGwzWws2P+/Jpe6fy9u41GbRKGOGvkLBWJc3z1GAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R/pXrXiH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55D7uYMH019613
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jun 2025 14:04:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=dRjk/GIaSQo
	1IqS/32SDSp43gzWPCoXG2x1Joi96rvA=; b=R/pXrXiHkOGAxiUHCmLBipGR2bq
	MikV93dz4G2AvH0QoJf0D49xrjuHxB1qzKpmPL1L1BIxvBuCvOSeGxjsjJkuWqC3
	I2MSPEOZ45y+44EjNGXMWM/gRJYkFtMBwrCQJBxp5N9owSYOSLgfAUSK/va5fHAv
	x4zxdiUpitdIh1PIBBEUv6rtc3oILju8pp/ZyDOV30e6romAFdYOD4HavOtAmtHw
	kCe+R0rfrmccQ7yr59LSImIwuqQAn3ElfuOAjS21ewi+2IMvI/MsOabDztZ820xB
	o8c7tTHeWHbT33iLnScgEpbDvrrQ4TJc1EhlwuA54AbtirnPjkTA6JZRw2Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474eqcuq17-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jun 2025 14:04:31 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2356ce66d7cso30779085ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jun 2025 07:04:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749823471; x=1750428271;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dRjk/GIaSQo1IqS/32SDSp43gzWPCoXG2x1Joi96rvA=;
        b=qEPdiV/RBodVzL67MH0oa9Qzer2WHkZashL6uhNIfii4k2WPAgKr1L7JWIBIaqsfh2
         4iHCwGDoLjYGxPD7PiwupXwJu8mnI4ciGf+02UaOYh+u5cGGCqyKEsF2gHDDxgUarXJA
         uGVTjSPbZ6L8AoWUIeJRhdiQ47vo3eqhIjuc04x6Q7D0e7VlJgN3Zqt/32pewyxLfDyZ
         kHIkUSbk3U4LNsn+YBoUWtoeK7L6cBVwauIG0M8cxZjGq56iZT1/aGKWWDUFy72IsC/s
         UI/b3q49ky6u4ni++nWPmimacPPK2HkZ8BjjteWpqYB3sASZH0UoM9MOkZghP/OlxuAm
         FgXg==
X-Gm-Message-State: AOJu0YysA6+jNMyLGW1U/b7+dy2FSR7wBJ4EEsQPg6ZACrigDRX1Pyvb
	LGgFAdODje754l4HBTjfr7HTGeCKLVjYt/qhSYPOCKrvRjprG4yxxppgZ6+5Kd+67UjGs4rR8/a
	TynoOqq+DOsdnZK/+RJR1B+hTWI+lq7FuRbyt5StEsDld1qVvvQkmBzVohqhmJgXg47Kx
X-Gm-Gg: ASbGncuCUw9SCdPbhs6x4DQRNWMg+LrF6eJ/VOtQLBnT3W3uSW9CHvHDvo8aBfnRyfS
	g78xrZwU/J4NVDK4P9LLg482gQZBwckZzaxOKxp9DLut0WEpw2LaWHI+iOZuDtWN5QEgbM3oVWs
	2+/fmIfUzmG8OgH0lkAIIvyzwO3tUGkiRS8R0ny5dxz76vHaWYElosDZalsQLcG4zaEIZ07D1QU
	6O6i50DKbuKBB2vPC22BdLYlHx5wxhz7FvkbLNNZgEqSKyEU7HVPqGSoBH8vbtiEHnATyozQ3ss
	+AgXokZfyrZ5lLF9AV8ldr4evHBaTU6tTywlWniYJPWY83/Wm1uQwkhtZ77aLKKGtYD216jy135
	N
X-Received: by 2002:a17:902:ea11:b0:234:ed31:fca8 with SMTP id d9443c01a7336-2365db04ca2mr42309725ad.27.1749823469959;
        Fri, 13 Jun 2025 07:04:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFR8jsfnA0oH2YzM9LYN0RUmbEBZjUfR9KtG7h9Y5VC+XY+k59J/pusktrBSu7tajQ58/h8lw==
X-Received: by 2002:a17:902:ea11:b0:234:ed31:fca8 with SMTP id d9443c01a7336-2365db04ca2mr42306475ad.27.1749823465796;
        Fri, 13 Jun 2025 07:04:25 -0700 (PDT)
Received: from trex.. (132.red-79-144-190.dynamicip.rima-tde.net. [79.144.190.132])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e268de2sm53503615e9.40.2025.06.13.07.04.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 07:04:25 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, quic_vgarodia@quicinc.com,
        quic_dikshita@quicinc.com, bryan.odonoghue@linaro.org,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, stanimir.varbanov@linaro.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] dt-bindings: media: venus: Add qcm2290 dt schema
Date: Fri, 13 Jun 2025 16:03:58 +0200
Message-Id: <20250613140402.3619465-2-jorge.ramirez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250613140402.3619465-1-jorge.ramirez@oss.qualcomm.com>
References: <20250613140402.3619465-1-jorge.ramirez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDEwMyBTYWx0ZWRfX6s6cWc9ybtzP
 67ympRSTK5mMI535I5OQg+DvdQ0HB9FZvRMKgS9dWNLxMUvurwlxzO9op7BN+Co+D0aTyl/D4T4
 fWHZiOsAfNCPdaYI8+bVPHur8gDTfEgFeQihp+QiYqxLf9lyTTmRigei3ldFJZJ6xvLAWiXbmFx
 EWNIcvjQqoFkfSY2gUXttPs0eUfVCcJ06jHml88eUWkF8WtByhIgqqX0R5KdlDDZXsGv7NtJdvh
 bE1lUGuVt6fUNtSJJjTy28lZ4DhloeIvJfE0rhC2xCNAtMlCPaSHrvsrmbfBotYG3i7mM7Xt898
 vbb05xt9HVmgFahLAGNI/zYH5WChys9a4QFI2s1bz17eSy6I6K+NPFSnqjZbsDYxaMqBhxmr4GA
 Ehdlcsw8Mk2Z5JtsdBk4N9I47CqOHFPWBARRfw1ggycUIbdG2p1Gg6/CEXsHYZKbXrJZtiLH
X-Authority-Analysis: v=2.4 cv=Q7TS452a c=1 sm=1 tr=0 ts=684c2fef cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=wjE3nLva0YkvARyJ+Gfmxg==:17
 a=6IFa9wvqVegA:10 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=1mX_ai67dwKzVtmm1w4A:9 a=uG9DUKGECoFWVXl0Dc02:22 a=sptkURWiP4Gy88Gu7hUp:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: XOE1_JMUAmCTbHu8xzO1g8u1zYTo12BO
X-Proofpoint-ORIG-GUID: XOE1_JMUAmCTbHu8xzO1g8u1zYTo12BO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-13_01,2025-06-12_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 bulkscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506130103

Add a schema for the venus video encoder/decoder on the qcm2290.

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
---
 .../bindings/media/qcom,qcm2290-venus.yaml    | 153 ++++++++++++++++++
 1 file changed, 153 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml

diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
new file mode 100644
index 000000000000..ffa72f1e27f3
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
@@ -0,0 +1,153 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,qcm2290-venus.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm QCM2290 Venus video encode and decode accelerators
+
+maintainers:
+  - Stanimir Varbanov <stanimir.varbanov@linaro.org>
+
+description: |
+  The Venus AR50_LITE IP is a video encode and decode accelerator present
+  on Qualcomm platforms
+
+allOf:
+  - $ref: qcom,venus-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,qcm2290-venus
+
+  power-domains:
+    minItems: 2
+    maxItems: 3
+
+  power-domain-names:
+    minItems: 2
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
+    minItems: 1
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
+  video-decoder:
+    type: object
+
+    properties:
+      compatible:
+        const: venus-decoder
+
+    required:
+      - compatible
+
+    deprecated: true
+    additionalProperties: false
+
+  video-encoder:
+    type: object
+
+    properties:
+      compatible:
+        const: venus-encoder
+
+    required:
+      - compatible
+
+    deprecated: true
+    additionalProperties: false
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
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/qcom,gcc-qcm2290.h>
+    #include <dt-bindings/interconnect/qcom,qcm2290.h>
+    #include <dt-bindings/interconnect/qcom,rpm-icc.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
+    venus: video-codec@5a00000 {
+        compatible = "qcom,qcm2290-venus";
+        reg = <0x5a00000 0xff000>;
+        interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
+
+        power-domains = <&gcc GCC_VENUS_GDSC>,
+                        <&gcc GCC_VCODEC0_GDSC>,
+                        <&rpmpd QCM2290_VDDCX>;
+        power-domain-names = "venus", "vcodec0", "cx";
+        operating-points-v2 = <&venus_opp_table>;
+
+        clocks = <&gcc GCC_VIDEO_VENUS_CTL_CLK>,
+                 <&gcc GCC_VIDEO_AHB_CLK>,
+                 <&gcc GCC_VENUS_CTL_AXI_CLK>,
+                 <&gcc GCC_VIDEO_THROTTLE_CORE_CLK>,
+                 <&gcc GCC_VIDEO_VCODEC0_SYS_CLK>,
+                 <&gcc GCC_VCODEC0_AXI_CLK>;
+        clock-names = "core", "iface", "bus", "throttle",
+                      "vcodec0_core", "vcodec0_bus";
+
+        memory-region = <&pil_video_mem>;
+        iommus = <&apps_smmu 0x860 0x0>,
+                 <&apps_smmu 0x880 0x0>,
+                 <&apps_smmu 0x861 0x04>,
+                 <&apps_smmu 0x863 0x0>,
+                 <&apps_smmu 0x804 0xE0>;
+
+        interconnects = <&mmnrt_virt MASTER_VIDEO_P0 0 &bimc SLAVE_EBI1 0>,
+                        <&bimc MASTER_APPSS_PROC 0 &config_noc SLAVE_VENUS_CFG 0>;
+        interconnect-names = "video-mem", "cpu-cfg";
+
+        venus_opp_table: opp-table {
+            compatible = "operating-points-v2";
+            opp-133000000 {
+                opp-hz = /bits/ 64 <133000000>;
+                required-opps = <&rpmpd_opp_low_svs>;
+            };
+            opp-240000000 {
+                opp-hz = /bits/ 64 <240000000>;
+                required-opps = <&rpmpd_opp_svs>;
+            };
+        };
+
+        video-decoder {
+            compatible = "venus-decoder";
+        };
+
+        video-encoder {
+            compatible = "venus-encoder";
+        };
+    };
-- 
2.34.1


