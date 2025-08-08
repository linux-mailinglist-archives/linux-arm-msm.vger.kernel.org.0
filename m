Return-Path: <linux-arm-msm+bounces-68083-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2702FB1E4AF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Aug 2025 10:49:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8CFD67A7E7E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Aug 2025 08:48:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4179266565;
	Fri,  8 Aug 2025 08:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PApENXoZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B629249F9
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 Aug 2025 08:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754642973; cv=none; b=uozvfRBYN84iwJ79qZ5gNc5aINDwFK3fmar07WI9o5F+Za50vlIM2wWE0HIOfpyOJLnd4dEdRwx8xyogRewIGgit37oD8C+Sz2d7qK7XTnrZ4mXgGxribjLxpqf0XRKO3ckYruBMQ5YGVCIh5wLJI7YFBBTk9q1hvmr/nRdsiE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754642973; c=relaxed/simple;
	bh=VO/XqcSD3T9bRV+GvDZsTJwOmB/gxlb+z0LFlAiA8e0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WuQiSoZAKj4XSqFByOiIxN53SIpt1fCO9R/PfFvg+uRx8SfR+xodaDhdzlS32j+roZsO8AGxn9VdCWsy7XO56rhHQKMRngtuCvQ0IBiodAhlLfZGn3w84dPy40hJGLpLxvh7ot7sG1y3F4hntJ3qv9SM7tQNcn/2HFDKhlo43hE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PApENXoZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57813Gkj030191
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 Aug 2025 08:49:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=YY+jHz5mvoy
	usButmdCoBF7o4RYZY+zFj5xw1jAtys8=; b=PApENXoZ0oH5gON89HIJ+9YwMoX
	iN1h2BkseLOMlBvlS2uEVCtnvgdmjPQNcU8kKEfKzGcFJ42SHHzuoiS/geGBJvpF
	kvMNfWwT2hrJqpimY8C4CrZrHSggpAgO/ZIENUvOdabPSfTh+X5qb3PDOq/kVYsh
	be2NPAZUGzmtLA0rYQcbBVmb2m7OsmEhcH3TU8sh7Oe00RZbt8aLPsokORf2FnLJ
	16/MyTetFCFMbz0p/JWxNx+i9BKPHnA6wb4c8fKg4w5eiEpirVQaWHAjKWXwRzNQ
	XMtSx+UB1GQ7/Fpp7YCsTcHi8S7eopNhVq/eor8cBFVBawf42zlX6fDxmdA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpw01jb0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 Aug 2025 08:49:31 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7e686308729so472979085a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Aug 2025 01:49:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754642970; x=1755247770;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YY+jHz5mvoyusButmdCoBF7o4RYZY+zFj5xw1jAtys8=;
        b=iaA6XWRYtm6d2CWfiQUfs0ZD3kur/4GU1VBwEimklNU2olJcfOUZRJGuoAdR09TYro
         AEc5gv8o+NhFQ1+scNeNerBPqnQ2B2WM8jE4l6fBr9S5Xb4KrilB75J3A7FCn3WduSw6
         qPMzAWCA6lsu2lZhxGpFGT6gPyYUvxcOLVO771WfUFK0+Jz7D7LGC7gw+khsILlLiYnj
         SJvMlib4vym7Knt++MjgLJt3Kw6RxfDaTfPlMEQAA5jKMOaX06IBxPpr7F3PFnLivanL
         wUBcUpQsuJPDnO/atID5NkhdVTYNTgMDzYEyXnK0MQY/E6pRW+StibjW36MJ+UddDQCV
         PzkQ==
X-Gm-Message-State: AOJu0YwhdSqQIA+2aVJb3+Kq9IFJ5S5GlSQhB7/6x/BWn4dHv3xWmPRD
	iEAXksA39AYiJ1qm7YX48LTHLbFvgvp3QMF5kEXSjAuEvhkEqglHxZzeO4RAXFdwpOc+sVGVOT9
	FZH80tHkNtV/I+mHaHdu+iG6Ndq8s6Deb+eiUgPKxd6w/DlRsZ3xkJid3HnlKdY088Y5p
X-Gm-Gg: ASbGnctrAdRy7/EMrHpIVJwHvUoK2qtGRv/BqNiNAD1M7apC/hs1w5moyLk2/O7KbhZ
	Sbvji+9x59bP5YslsWhE0SpIiCVdE0mrMdBTCOvSfXbPSreMa4xUpM0vUU5t/Q/S5Bl3OU9NZkV
	wu7b3+/pjeyy4ZoOMlweo3lXPVDCzu6qMkJ2W4PR5thBUfUDupYF07bIPoY8NJY1Gt5g0M6qKbE
	0MwUute6IDt0YoSXJ8qrSQQ4q9vH1fnkg6EIWWkwff2yCyHcLMPe4FNMqfRTcqta2WP56Wvp5aY
	HhwXDkgB14qykfjkB5UlllNgDG3AdI3PnGUEsPW1tp8//00I4WjcGJeCVBss0bo+den9rxuyW8V
	c2r3IvRip31oC
X-Received: by 2002:a05:620a:aa18:b0:7e6:211f:c1f1 with SMTP id af79cd13be357-7e82c77afdfmr235170985a.30.1754642970288;
        Fri, 08 Aug 2025 01:49:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHrnqG1fYrsPPgSDt/6KiFyQFURcQNGhFPS+8mxkKIlHrqKTsQkCORYvz4jXC1HcC0BILXBsQ==
X-Received: by 2002:a05:620a:aa18:b0:7e6:211f:c1f1 with SMTP id af79cd13be357-7e82c77afdfmr235168385a.30.1754642969822;
        Fri, 08 Aug 2025 01:49:29 -0700 (PDT)
Received: from trex.. (205.red-83-60-94.dynamicip.rima-tde.net. [83.60.94.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459e58400f5sm122904295e9.2.2025.08.08.01.49.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 01:49:29 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, quic_vgarodia@quicinc.com,
        quic_dikshita@quicinc.com, bryan.odonoghue@linaro.org,
        krzk+dt@kernel.org, konradybcio@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, mchehab@kernel.org, robh@kernel.org,
        andersson@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v9 1/8] media: dt-bindings: venus: Add qcm2290 dt schema
Date: Fri,  8 Aug 2025 10:49:16 +0200
Message-Id: <20250808084923.1402617-2-jorge.ramirez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250808084923.1402617-1-jorge.ramirez@oss.qualcomm.com>
References: <20250808084923.1402617-1-jorge.ramirez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: lDKf_aY5fBDVDE3mtIxkEEER-G8b4gFe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfX+fAsFADFL7c2
 ZrXLYKmv1A96ueN7BNwODJG5w8x/FWQYAVVVrtQGwMFm6AyJIIWCT2kcHTFaHB8z7zRJzTMJjWQ
 Ff+yY02ybhai+Kobphz5v5NlsS0+nTkXT2JImnXGiiBO5CW239Xk10qanhHNSwHzBiSUvFi8rOy
 jOltgjjT8fH7MqW62SYKsUNmEQXCB95MuHbWV2WnXIxbxdzC+kF/7V2QmNNB+O+vyHHtvpFBKfk
 fztHJ14wuQetZI0w06S6yab+H4Feo59uqHws+dHjfeDQkELlTZJsNtZzeeZBiscTFvmkOXTBPSA
 qiqs0OFAHh0sOug7lT94R12lQUhKlve8OsOt3gRCv+Hla9AuxhE4SZ1H/dvlXl9FzyhD9h9euKC
 H2xK0iKh
X-Proofpoint-ORIG-GUID: lDKf_aY5fBDVDE3mtIxkEEER-G8b4gFe
X-Authority-Analysis: v=2.4 cv=NsLRc9dJ c=1 sm=1 tr=0 ts=6895ba1b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Rr2dNH5/fcnoRoBmcVUeRg==:17
 a=2OwXVqhp2XgA:10 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=Wl4eHCndyL1IYbKsAYUA:9 a=NFOGd7dJGGMPyQGDc5-O:22 a=sptkURWiP4Gy88Gu7hUp:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-08_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009

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


