Return-Path: <linux-arm-msm+bounces-82915-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A99C7BCDB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 22:53:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id F1CE7366155
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 21:53:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 210E42EF65B;
	Fri, 21 Nov 2025 21:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OdojFF11";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f9q+UXIW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 656052F7AA9
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 21:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763761990; cv=none; b=mF0/CqYleRjKKyjhDyUZQmXdpqjlNJMK7VAF9ajsg2qSUCAC2gsBRZEfWlNoyDanamHqPlB5HriVVlYWOZJgDgo/9bgxq1DJeyyw3WETX22y0/6COmWghOTWNoRISgvNgxVyxA7BMkMQNwy+xS+MfTwHt5Vgpl4c2/OGs3EicwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763761990; c=relaxed/simple;
	bh=1MBFxxCP44vKNuX6Y4hdWjd1ieCsTtaD8E8Yx6Hjr3k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kX4YpuL6vmNzGykfNLG5MvBfNGY+Y9tBK3e2cDgXIoln6bD+2VjI9htYLlaTkVRd0YU6ocBOlgva1wlApBKOgQ+2V3L1FgoHOTyIIBblECozOM3G0bl9s6tmUjhNirz+F/gAPW/Pr2qUrYUmkBZ/e8OGSdmC62vRzbpVeZ+kx54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OdojFF11; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f9q+UXIW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ALG7OHh3675867
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 21:53:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LHl/GB/jo70EitSbdhdMrpAF7ix8vnjgTe1J/9HR1d8=; b=OdojFF11bbtCq47c
	gnt68Fu28VIqDL05HSPTHewLbOr81yWyHyd9/bSjR40uG6iFK8YLuK7frIQMGaPz
	JMeIaIaohdB1vP5IDM78afRt8NZopiV5M4baOi8Tqd99fKyiD4b0+kKKZpv2Kaw/
	dUV+P5teenXes5IGeKoza/JTy7e1wP892uol77Kio5LfjZ/28m9m3Q9u6weIXKSp
	Q6m+3gkrvEAwjDwAzsTQ6oKPBYd6pAVmWSXwFP3J99Zza3Q0qJuhiwXXRS6qVn5o
	1ZyQ1XZA4B/EsW3iX1FR4QCbWNIXg32KKiQcoCirNHwfBG75M88md5FtPEOJo0Mn
	xM3Q4Q==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajmyjabhj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 21:53:07 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7baaf371585so2709932b3a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 13:53:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763761986; x=1764366786; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LHl/GB/jo70EitSbdhdMrpAF7ix8vnjgTe1J/9HR1d8=;
        b=f9q+UXIWE62KmUmnIGsRkPRfGCDtGu0uQBolydLIvnW6/3OUMUeJu6qkFdvLPbp0bs
         D+mN+3QRJqexfb0NSngLJ6dJYMVSoJ3HnbBydx/hkOx3CCLzrMhg3R0VEvmTU0OJZi/q
         Agfih9Mf0LfSgkVz0YGTOH2KZfK/axc8v7RAl031b6J4t7BQohW9hNG7+S1wQLLUjmdo
         AlpX4LIC9rlpQL26uIJmfLMkUZJbD72bpSUjgPsJi/zAV46EwMoxwKz71gckp0DrTeq/
         dWDwYUQdHd+O8W+6k51wKXFdRufIteOxNGpvvT+XklafKQ8YlbTtj5QW/iFRloa6ay6T
         BqGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763761986; x=1764366786;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LHl/GB/jo70EitSbdhdMrpAF7ix8vnjgTe1J/9HR1d8=;
        b=cCd2M6kF4eQkwBfhA4Ulf2E62glZb3x/wKSW7YZhGUUjumdJkZHqmQ0c+dKBNminsn
         4ETjvLRUHyB/tP71NcD2nlhjAqaHJ3JTPcopY4e5PaKxkR2ktYXtiDXvvz7gI4y+r1pG
         Rmmk97IHjukswxsJml/3Gk467nTCzLIrvkciFKHe0+xKIJKpKafKO8Fx4dD0Uurj+Vqe
         7j601Dm+8UgQeinNUIOQDb+uthWcr+Y1MbN8Uif+Kg5A9R7xpy8E5ouQEV6wraEbbukz
         30Vq9wDBrfpGreSvWdCCmzZPEgdGnvqNWuXWSljUohRVMzqob2XEQudLD1eq53b3UjRJ
         O1ww==
X-Forwarded-Encrypted: i=1; AJvYcCWmqkSkPw7M0j/1g4Jsb7C+4kiZAwUI5VaBb/7I2h9gDa61Z+PGaTN5TZAS8bdolspVvOBiQun6bPRgBWO5@vger.kernel.org
X-Gm-Message-State: AOJu0YzYwBylRjHpTCfaGnbPZW833ushTsPUH3bmUdOTMZxY/C94r7cW
	KoiCx4ytBwisQIenLOsXFob0ijFOmrD6KP52wOWCkNC1s5iygOVzZrJmPe7B4UeR5PHMonxDhEA
	U27z2w9V0Q3+Cn9qWJZAa0ayVRIHP72YezvIGzQnIu2jeupA8xlcqJP2rFzwtKHZDDPLC
X-Gm-Gg: ASbGncsdkf8EKaS2iWcrIkj3QcMC67pkkjrRZoORyR9J8uanfqsaLKaIvR6blHjKmz6
	vjHMOdaKFvA35kmNI0zFAGVqjUsbglysIYzMfsU8aE9MoxMxKIUes2emGFUHi3KAEh2kbfxOqLE
	g6eTBAKI9Q53pcPLq3i7uNsub50D/AsEjyocgQVqeAflFZ5PpyuFUtCNEVq1oO6GXcCDvH+enuX
	TjBsJA3nmZIf3Io98U5wb1fNmbyBo5JCCipYZFc+rCwZAhaqTKR7BoCVQgFfqGBymfTEEpy25qv
	B1LPgjLYvOB5J0/+xu7+eY8daRQRzAYwQBugluxpiw6awxUU+6F2nEJWLtjLPQPTlf3QiuWMna/
	jpdwJtuZ5sZ9PFnN68AcCbJ/d2vA4yze41g==
X-Received: by 2002:a05:6a20:72a2:b0:35e:b02b:4efd with SMTP id adf61e73a8af0-3613e5abfa4mr9071469637.27.1763761986073;
        Fri, 21 Nov 2025 13:53:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF11iHDqgjwpVwwnGeh2ib8bqQV6EKSXFBnhvWQZTYg5xViCSpPUbmOmjN6Xms1mxCZtSjE8g==
X-Received: by 2002:a05:6a20:72a2:b0:35e:b02b:4efd with SMTP id adf61e73a8af0-3613e5abfa4mr9071439637.27.1763761985528;
        Fri, 21 Nov 2025 13:53:05 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bd75def6314sm6399270a12.7.2025.11.21.13.52.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 13:53:05 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sat, 22 Nov 2025 03:22:17 +0530
Subject: [PATCH v3 3/6] dt-bindings: display/msm/rgmu: Document A612 RGMU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251122-qcs615-spin-2-v3-3-9f4d4c87f51d@oss.qualcomm.com>
References: <20251122-qcs615-spin-2-v3-0-9f4d4c87f51d@oss.qualcomm.com>
In-Reply-To: <20251122-qcs615-spin-2-v3-0-9f4d4c87f51d@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763761959; l=4974;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=dHnbBdwTFFaHzI/uvU7oZBCQbIeKLNxKJrLt9qTuo0c=;
 b=usT1ULrG5ctQoyANX0NRjiuoSRPoWhuu3kyFjQ+SqboWZbhpnT2zN/UBogYrw4QezYw1k58tH
 qEBrCnJEty7D5ZqKzYtK/OJ/mFB7JW9KGtj9u9MDAEB3HawgjlXkQOl
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=ELgLElZC c=1 sm=1 tr=0 ts=6920df43 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8
 a=OspxmFM2CjPT0bdoapIA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDE2NyBTYWx0ZWRfX8fr44gpZynVN
 EgAMHU0afVkedF3eCAIB87WWvXd3xnnS7QeHdbrodeGWCCe+6JltjGLo0B+vPMBHJ1757Mb3Y46
 0GqRqdYCwtKvTcITjhZ8hCV7uDfipZlW1KyIborEWJ5H1lekeudjLijLig41yfYmwiqJ5JIinrN
 /QnwaSnASLJumnu2+HYynU0usiXOTutR26Z4COROlGJS3KJd5UUSytHcxNIr19eImNnzEie+Ijo
 rFl17FyXgvbnrmDAQOpI0mV12SKyVSJqRNUJ9+X9zMF+w2CbUX0dw8WL35eAX9uXLa725ha6deW
 BE+1dDLZzwbMq8jFXsCzzZ9az7yZPtOFT6yHL4d0ePHRAzaXq6v9zHR+BI89gtLHlj5VpAS8ikE
 fgJu8VPyI8tWBoMO13kOUegzhaAxRQ==
X-Proofpoint-GUID: L07_i90XgOKF19yN50uNUNTGPce1Kw4-
X-Proofpoint-ORIG-GUID: L07_i90XgOKF19yN50uNUNTGPce1Kw4-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_06,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 phishscore=0 spamscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511210167

From: Jie Zhang <jie.zhang@oss.qualcomm.com>

RGMU a.k.a Reduced Graphics Management Unit is a small state machine
with the sole purpose of providing IFPC (Inter Frame Power Collapse)
support. Compared to GMU, it doesn't manage GPU clock, voltage
scaling, bw voting or any other functionalities. All it does is detect
an idle GPU and toggle the GDSC switch. As it doesn't access DDR space,
it doesn't require iommu.

So far, only Adreno 612 GPU has an RGMU core. Document it in
qcom,adreno-rgmu.yaml.

Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 .../bindings/display/msm/qcom,adreno-rgmu.yaml     | 126 +++++++++++++++++++++
 MAINTAINERS                                        |   1 +
 2 files changed, 127 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,adreno-rgmu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,adreno-rgmu.yaml
new file mode 100644
index 000000000000..bacc5b32e6d7
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/qcom,adreno-rgmu.yaml
@@ -0,0 +1,126 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+# Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+%YAML 1.2
+---
+
+$id: http://devicetree.org/schemas/display/msm/qcom,adreno-rgmu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RGMU attached to certain Adreno GPUs
+
+maintainers:
+  - Rob Clark <robin.clark@oss.qualcomm.com>
+
+description:
+  RGMU (Reduced Graphics Management Unit) IP is present in some GPUs that
+  belong to Adreno A6xx family. It is a small state machine that helps to
+  toggle the GX GDSC (connected to CX rail) to implement IFPC feature and save
+  power.
+
+properties:
+  compatible:
+    items:
+      - const: qcom,adreno-rgmu-612.0
+      - const: qcom,adreno-rgmu
+
+  reg:
+    items:
+      - description: Core RGMU registers
+
+  clocks:
+    items:
+      - description: GMU clock
+      - description: GPU CX clock
+      - description: GPU AXI clock
+      - description: GPU MEMNOC clock
+      - description: GPU SMMU vote clock
+
+  clock-names:
+    items:
+      - const: gmu
+      - const: cxo
+      - const: axi
+      - const: memnoc
+      - const: smmu_vote
+
+  power-domains:
+    items:
+      - description: CX GDSC power domain
+      - description: GX GDSC power domain
+
+  power-domain-names:
+    items:
+      - const: cx
+      - const: gx
+
+  interrupts:
+    items:
+      - description: GMU OOB interrupt
+      - description: GMU interrupt
+
+  interrupt-names:
+    items:
+      - const: oob
+      - const: gmu
+
+  operating-points-v2: true
+  opp-table:
+    type: object
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - power-domains
+  - power-domain-names
+  - interrupts
+  - interrupt-names
+  - operating-points-v2
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,qcs615-gpucc.h>
+    #include <dt-bindings/clock/qcom,qcs615-gcc.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+
+    gmu@506a000 {
+        compatible = "qcom,adreno-rgmu-612.0", "qcom,adreno-rgmu";
+
+        reg = <0x05000000 0x90000>;
+
+        clocks = <&gpucc GPU_CC_CX_GMU_CLK>,
+                 <&gpucc GPU_CC_CXO_CLK>,
+                 <&gcc GCC_DDRSS_GPU_AXI_CLK>,
+                 <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
+                 <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>;
+        clock-names = "gmu",
+                      "cxo",
+                      "axi",
+                      "memnoc",
+                      "smmu_vote";
+
+        power-domains = <&gpucc CX_GDSC>,
+                        <&gpucc GX_GDSC>;
+        power-domain-names = "cx",
+                             "gx";
+
+        interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "oob",
+                          "gmu";
+
+        operating-points-v2 = <&gmu_opp_table>;
+
+        gmu_opp_table: opp-table {
+            compatible = "operating-points-v2";
+
+            opp-200000000 {
+                opp-hz = /bits/ 64 <200000000>;
+                required-opps = <&rpmhpd_opp_low_svs>;
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index e2ed9827be3f..b891eb0141c9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7949,6 +7949,7 @@ S:	Maintained
 B:	https://gitlab.freedesktop.org/drm/msm/-/issues
 T:	git https://gitlab.freedesktop.org/drm/msm.git
 F:	Documentation/devicetree/bindings/display/msm/gpu.yaml
+F:	Documentation/devicetree/bindings/display/msm/qcom,adreno-rgmu.yaml
 F:	Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml
 F:	drivers/gpu/drm/msm/adreno/
 F:	drivers/gpu/drm/msm/msm_gpu.*

-- 
2.51.0


