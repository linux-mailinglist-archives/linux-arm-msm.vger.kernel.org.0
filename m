Return-Path: <linux-arm-msm+bounces-87079-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1657ECEB943
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 09:46:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9C311300985C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 08:46:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4251D314A63;
	Wed, 31 Dec 2025 08:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="enOU9L9v";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E1CdK4rX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65CB92E8B81
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 08:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767170777; cv=none; b=NDS4qQS8X+06DmhlaoFnjH2I/vdmuXID6lvZ4TrCSWhirmbMNkrS44ARk7MbaLcOIGQKG+VQQxPbXgaMY1XVLjf2Z87B+FE7SlB3AxuD6+56amSwb0Kc7FxdP1Q3rTyD9zBHuPqOMFmqABFJCU8Wtq0SifGXf4Pa7ouJldGc8lM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767170777; c=relaxed/simple;
	bh=SxseFOKc1WYjsO5ic0UJ5UoQcIwXeRsx+h5Ca5Pfoi4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E+d7tA3sVPxh7q2ATPFYAh6wDVJzHUfjkySLWwu+e3fKPNNZ/E+A0FA8GlGjDUFcqzhmdgy0DbkQDULlc21Wh6X0CpnAtw9ynsNti18NUO0UHvW5+pOlia5/XLMI4ACbBNrDoRFMYF4Jj7WBgcuUpezLrYl5FdlEJsM8qVz1Dec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=enOU9L9v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E1CdK4rX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BV03aau1750839
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 08:46:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l5cNqp8Qm+t8u06T9EpMpBkWlIdG9mhCzVCQBuziAp4=; b=enOU9L9vGENbD5fC
	2ROlRFuMQwBc5MZdEo8pFtA6inEy/wGtAm2cPKbsvJyaeSDKm+JXClB1ByweaW6e
	WFiS9tPYfdX03Nifj/KuZ2iEep2ZjUYVUZn1eH5mof+TyvTBWjLdkoRuDPvFKR2o
	0Inw6Ef4fi1dkFqdsYOwwLtw0aNpb0xalqChyue8tVTffQ+Pto/Ysn9dIiHRDGrv
	Pg1uA3PJuqK7C0wrV5KGrijePdSUEo8Z3mM79ayS17pAx+H2s/CPf0x+2HDCLYqd
	prsK835c7sfiv0BwGYyba5MLafZO8eKUaZeLAYGA9EOwKGyiobE+eokI60BHcEa9
	tSFFkQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc0sguya2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 08:46:14 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-34c6cda4a92so22776140a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 00:46:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767170773; x=1767775573; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l5cNqp8Qm+t8u06T9EpMpBkWlIdG9mhCzVCQBuziAp4=;
        b=E1CdK4rXd6XK2v6pfjmOobo4nUtbfFa1LqXhwsrQPJIfnwaklIZSMuign2LkL6Y8uz
         m5Rwedr2G3eX7l4ZbnjVq5qzhxRiPDTQWdcztg29vBM6bgmzDpLOCbPorm000XpBhNoF
         Pt8lcvl5VAUJs+iUhLvNlXakXFG1j8vjjj9MU2nv7vv40sR7ufJo31/HPuKYKHKsy0h9
         MQzk6B4Xl6Y2g0aWIdhu/j3HSW0aQcWgrCYwKu63YHtahvowP4T4lNpNyVW9r4rdqiqu
         3g+WnQOPRfAVzxFw9AIx79Qh//gPuvndeooKyTc1E0T0X39gsGE0ApdxsHtbU6aKJ0zI
         jhNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767170773; x=1767775573;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=l5cNqp8Qm+t8u06T9EpMpBkWlIdG9mhCzVCQBuziAp4=;
        b=FL+U11keWfAXAVkWVA4GXD8Y7jYNkf3y4S+4EqmUW0gKWQcqXPnoYgHRGXjVet8v4W
         Uh3E/SfHaT3++cbiWrDyrueopZyi1NoQTceUMzQ2tW4ZF88CpZs28RirhuncaLwO4c2Q
         8qACa1JBZ84TMB17S3M90sAPD5HJT6bwO5UXS+elpP0WbpUffw42hObcffoyvFt9NYsy
         nWTNGcs0B34pYb+IeOMjIcQWBPQbbs37fhjqr66sFgCWeexDnKIRdscBMz1KwRBW6iom
         YtBw+XyfMTFQs8brG96FlUfpP7Dj1lGwOjlZCgMlfl1LbmoliWdhvM6CdGe3i/y07x/f
         q+ug==
X-Forwarded-Encrypted: i=1; AJvYcCUHk84GzK/Fq4RsvkIeFZf5sJcZzvVGha1seOy0Bfx3FtsLA88eGLY4/Us0tIdRcob05kGPJGkpSu9Zcl+L@vger.kernel.org
X-Gm-Message-State: AOJu0YyrWkwQgU53Ia/IuXdNe7dK8UsF/gjRSKbKID4GHMZMRpZ28BPC
	SssI2RjA/+hILsXdmvzItB+CgZGY0vQU2p21VpJB7tXmOOyiWJisHmQMr/VN/QeZYFIZyGbyYuQ
	4qKbQ6rIPziYbwwllua0RItZ/h/SbdOqiwIT8bovXXo76ipst/AFpyisW+6L0+Xmz12XO
X-Gm-Gg: AY/fxX7sJp7d3GCELT98rj9zFH5yqKw1SYImPRR+xS9qjSUZzWC/V3mDJmGPOI6jYD2
	fiZ0YaAsU7QnTAPoF0i1cNvyVMQpXhOXmudxQTC0JH/b09gtz4IRNp9Flrj3Z5KXpntkIVjDGHl
	vl/11MVgki3dAM699qD8Dy12gzM0Y8FfidjLKcll7mUi2q0JMv0I71KywunTR9rsn/JMXDTbzsJ
	hIKgMPzTq5/lR5a6mjsUdDRjYKEx0VbEMmSIgqaIaRzS+zTTPsAbmWHXezJOwWtlgxItv1oeldV
	UybrgirQXRDVeHLa8dp5N9YeMey+rnkKUUKg47B/MpZ20KCGkFj4qeRYqS+hCQiWIsSq0QH68dz
	C6E37btDCK7v5K1PSLyna1mbICIEXmCAPhg==
X-Received: by 2002:a17:90b:5608:b0:34a:9d9a:3f67 with SMTP id 98e67ed59e1d1-34e921f010bmr27965285a91.33.1767170773192;
        Wed, 31 Dec 2025 00:46:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGWOcECsKpcRLks7dTeqSCj0+OwVQ0OhTkXgRdE0DhiH4j04pWxlR5FMxv41W6Bk54tKaKa0Q==
X-Received: by 2002:a17:90b:5608:b0:34a:9d9a:3f67 with SMTP id 98e67ed59e1d1-34e921f010bmr27965255a91.33.1767170772690;
        Wed, 31 Dec 2025 00:46:12 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e7a018eb5sm31356070a12.16.2025.12.31.00.46.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 00:46:12 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 31 Dec 2025 14:15:25 +0530
Subject: [PATCH v6 4/8] dt-bindings: display/msm/rgmu: Document A612 RGMU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251231-qcs615-spin-2-v6-4-da87debf6883@oss.qualcomm.com>
References: <20251231-qcs615-spin-2-v6-0-da87debf6883@oss.qualcomm.com>
In-Reply-To: <20251231-qcs615-spin-2-v6-0-da87debf6883@oss.qualcomm.com>
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
        Jessica Zhang <jesszhan0024@gmail.com>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767170740; l=5026;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=lCkErxOFNNBDx36AE9ptfo0yTuYneYy4ZQHJcSJyUY0=;
 b=8+HJTL/p0K5LbiQrOgs79dxL0EPGF8264zO3XhO07ZabRQotm1NWN35Pb1j0WFGcN44+17YkV
 yaM32Cu9BoUBIhK+bqs7cu8NVfEzKF5TWCJEd+HzCjizWO0VVSkKslr
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDA3NCBTYWx0ZWRfX1Lwu8mYnUm/o
 A3ZUsmGW/EPdDjLAEwgjlhkGYV1HsRlEnW44hvWtcUXPS32DG/+hKKBLp3bgXiK3SCF8/F6Q3z4
 Fgz8+hORgTMsYsPovCK7kZpXxLKcjJD2Bx3CqT53qOK3Qk9uoUF9j+3Qy/M8SZ4hhNoKZKV3VkX
 H8XljR0DDq1WG7gX5P8sJvEB0eN7oLYP7eH5HfL/Vk0H7f66bgPBQKaU5abi50eiyNkkeVKwHEi
 fOTkfc3nHXkPrclX3L28+QWLquObuz++ZITNXwxfgItTCpsley6dIffi57AAa6Zi2vChOdENC+N
 u9hsunNctr4YYqtuVDoNP7JiWvPfhzB01ZB0Vu63626wPBTWlrSt0UQuQhwxJ3MRpvukNTTTN7S
 hv0h/MjUyElhkGGwRenE5O/kfa1mMZRxIzCZnOLLQ/hbKetqb416sqSaK9L0g/20vMGcEJbNlfX
 49JoWD6UPtiSdH8rlUA==
X-Proofpoint-GUID: po4fgiiyIHcMWET8etGx5UiifdoT4JVm
X-Proofpoint-ORIG-GUID: po4fgiiyIHcMWET8etGx5UiifdoT4JVm
X-Authority-Analysis: v=2.4 cv=foHRpV4f c=1 sm=1 tr=0 ts=6954e2d6 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=OspxmFM2CjPT0bdoapIA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=sptkURWiP4Gy88Gu7hUp:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-31_02,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 suspectscore=0 phishscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512310074

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
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
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
index dc731d37c8fe..ee09fc2a6e59 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7982,6 +7982,7 @@ S:	Maintained
 B:	https://gitlab.freedesktop.org/drm/msm/-/issues
 T:	git https://gitlab.freedesktop.org/drm/msm.git
 F:	Documentation/devicetree/bindings/display/msm/gpu.yaml
+F:	Documentation/devicetree/bindings/display/msm/qcom,adreno-rgmu.yaml
 F:	Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml
 F:	drivers/gpu/drm/msm/adreno/
 F:	drivers/gpu/drm/msm/msm_gpu.*

-- 
2.51.0


