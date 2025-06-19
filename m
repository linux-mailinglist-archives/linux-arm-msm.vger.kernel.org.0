Return-Path: <linux-arm-msm+bounces-61809-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F6DAE0880
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Jun 2025 16:20:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4217517D67A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Jun 2025 14:20:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5022321B9F2;
	Thu, 19 Jun 2025 14:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UBld/Jgh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 297482116F5
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jun 2025 14:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750342823; cv=none; b=cIzMRgaHFudPSeg6aMKR8CqTiCjCcHmFqxgLE6r5a+fPUUhNlOXTKxnKL8xSUhDdblJG6pMSVv7AGB42mQkoEeHVcy9B9A/DKizADeF3HA9y5O6QIhdtRoyNb5nDFc6YcAXunbTgyUzXem59PQ/WliGIkXHbPbsoYDmOJ/zXAO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750342823; c=relaxed/simple;
	bh=IFOmcOgvkEQOE6UT1GX5a0TCQ3Ddrsxu/wCNW4a1u0A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=a95qcxjLtzppxFqe2CUj5BopluMa+6DF3kN5+WYO21R+v+QHLiOmfXs/ggq7a8OMMgLwj4U+Trt8EytRuz9bibtoWZ0NivfWYa2Qc+WxmUn+aGpgJaCyIqlva2wlrMh0w2/f+VALNr/QE2QHAKoVV7xwP2Vi59473jivxHd2Pic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UBld/Jgh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55JBwDkp011409
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jun 2025 14:20:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=rjG4zPddXl0
	PsKH45bNGGBvIH8sLOx5tvW+L9Xts+hY=; b=UBld/JghjMbzTfzqJ3EaBHHnODy
	YbOvTSsSsqwa+uHZksXZR36vXjhC/7MsRhNWELvdnxQU99aaVXfKcqmPrqCrVXtJ
	0kujUyBAXuADRQrGDFvw0TCpwZnbRcS271ArA/2YdlkDb9/901S03WjxIb2TkxLE
	M96RlK2btzC6FybRZmKsFoqg99+85hW9l3zCo4+S30KgwvXWzf73mdrqdPYqgDMn
	+v9/ca3Lr5krVAwlxNafCnz4HSg/2Gz+qhvRSJJkze6V38WqpjN7Y+0csd2EZwVY
	x8TzcS0hgxBCkvExh+sJomottE/2kzBMivz+yugqovZ8xvqpOfhQohU/dmw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791enr7ac-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jun 2025 14:20:18 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4a42c569a9aso13157791cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jun 2025 07:20:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750342818; x=1750947618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rjG4zPddXl0PsKH45bNGGBvIH8sLOx5tvW+L9Xts+hY=;
        b=XB4DXOGFenYUM6kArP8HH9HgRRl5TI1SawfEHy9Vp+V6+vVh55b1O2kVK1JcABEyM7
         QqKzzvLdtjHxmbhdqCip2bC+GiBmAQSV3TH380AsSuQi4Lxt+tjpuL/04WlYT8sY4w6F
         3mCNOwsZD4LG/ZleFxbYnKce5w5YyEJ21CP8xvlYmBXu9qiQ00AC1ioR2zquGQUHuIeo
         muBV5QiTUPxYvnnAX9ojoc4ovfJW5kxQt62FY+N3u8BRG/4pVnZ7MolBkkwNc7AECuOs
         OJJ7Hep3k9Q64q4MgNLYkaRwqB6K59weQheEMPY+pd9qSExtT/hbOgMpdbnzs3LjjY1b
         f10A==
X-Gm-Message-State: AOJu0YyTlDfJDlEangbUjzExaVqvZw962quLJAW5EH7ZgDuOHXh8fNHj
	Y66WT4S3wOPfnuBZnL50fkUZs6xDMvxtBmduiX1IHsSjtMOw3frkd+bYVXSigzSSMq4Pq85V7Ta
	Qw97Ycz8Xv6kkZpqIkiPT1OgGGz5H5visPYD/AWOhCDi2XBy3YmXag7/4rae457JRjTFt
X-Gm-Gg: ASbGncvxsZ1zOtMjydylFaRPR4U5yx0bAat5wXKt30/XeDHEsR8nKgL2ZFfIB9zjN6u
	MgzfCaYW0g5CQbOmGCbbPSZA32+vOheOQNVQt/RqzEZuKdvq8fnlzYQ/Exf+lbpBF4FLeRd7QQ9
	rqTNt4C1aqD3if6/uOhrcIt3e8ZekuvJ8f/ls07ztFff/Axy4b5lwFmEFPoVgAM00S4KHAqbnJC
	Zi5NmlLXLrt8DorsUjLNYrC4Pqmt9/fhhbkwQIJwSM/m5avOmGdR4VEunU0X01w+cAJpS2PnKE+
	1q1sNqmVk2ebq7q0R9Ohf7JGHmLE1GnOj5/ySfMWijGXhlOSOblbfMo04bdHz8NkroOice37GN3
	5
X-Received: by 2002:a05:622a:5c17:b0:4a7:937:4620 with SMTP id d75a77b69052e-4a76e14ecc7mr47626051cf.1.1750342818106;
        Thu, 19 Jun 2025 07:20:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHlppA8sGbGQRFqd2N+SMTI1PPhRu7R/h34nY5vhkPBHfCbnZx2OPccT1Zo399ooSWXltrljA==
X-Received: by 2002:a05:622a:5c17:b0:4a7:937:4620 with SMTP id d75a77b69052e-4a76e14ecc7mr47625141cf.1.1750342817267;
        Thu, 19 Jun 2025 07:20:17 -0700 (PDT)
Received: from trex.. (132.red-79-144-190.dynamicip.rima-tde.net. [79.144.190.132])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a58963561csm7254312f8f.47.2025.06.19.07.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 07:20:16 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, quic_vgarodia@quicinc.com,
        quic_dikshita@quicinc.com, bryan.odonoghue@linaro.org,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        stanimir.k.varbanov@gmail.com
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v2 1/7] dt-bindings: media: venus: Add qcm2290 dt schema
Date: Thu, 19 Jun 2025 16:20:06 +0200
Message-Id: <20250619142012.1768981-2-jorge.ramirez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250619142012.1768981-1-jorge.ramirez@oss.qualcomm.com>
References: <20250613140402.3619465-1-jorge.ramirez@oss.qualcomm.com>
 <20250619142012.1768981-1-jorge.ramirez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: wS0fPv1kO6le1JayuKj3Yx5zWB1qds-s
X-Authority-Analysis: v=2.4 cv=D6RHKuRj c=1 sm=1 tr=0 ts=68541ca2 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=wjE3nLva0YkvARyJ+Gfmxg==:17
 a=6IFa9wvqVegA:10 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=UBg8vxrJu69tSQrAULkA:9 a=uxP6HrT_eTzRwkO_Te1X:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: wS0fPv1kO6le1JayuKj3Yx5zWB1qds-s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE5MDExOSBTYWx0ZWRfX4OWFxsZiXxcA
 WT3Ii7vkAvdZRXVHwam7kDaX0kgLfY8todA2fF98DRhOdGsOm2lY2esennMaV+wm5PlA7Q+9cgp
 5L78zVqEJ1NKsge5jZvXOwlD5ysymGTpNdxJ0WuRQKeHEi5iZBwwwWjjPhIPM2kxC6eVBDmILlL
 2MADDAPjmVW4ZkVEPw1QNM3/0rEkB4Xi1IQSv+YGeOs5Ia9ucwrFhj+KBC9tT2iB1v0chPevkIO
 tlD2S1YO4dIFfZimPDVdk0BaoP/YJ7TAY521sEDR4LGej/l90ytWbvlIsT7cVdLWKvObahgDDnu
 lvu5MCmXq88TQiMHVRY2m8U8FgkXP+y+KOTjWWp933USxpmPrptkDMeCq/8CQZ03GgzUyrkNOQQ
 lfKHmk7p11GC6hzR69i1zcVz0yw/v2woLnYpzztFAo3cQENFLVAsZTBcva2YEIyGpfQIP6dU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-19_05,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 adultscore=0
 suspectscore=0 mlxlogscore=999 clxscore=1015 mlxscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506190119

Add a schema for the venus video encoder/decoder on the qcm2290.

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
---
 v2: power-domains set to 3

 .../bindings/media/qcom,qcm2290-venus.yaml    | 117 ++++++++++++++++++
 1 file changed, 117 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml

diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
new file mode 100644
index 000000000000..244559e1bdd7
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
@@ -0,0 +1,117 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,qcm2290-venus.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm QCM2290 Venus video encode and decode accelerators
+
+maintainers:
+  - Stanimir Varbanov <stanimir.k.varbanov@gmail.com>
+
+description:
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
+    };
-- 
2.34.1


