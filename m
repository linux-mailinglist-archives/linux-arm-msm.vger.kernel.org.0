Return-Path: <linux-arm-msm+bounces-86663-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1827DCDEE87
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Dec 2025 19:31:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8A8DF300B686
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Dec 2025 18:30:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04F1B23372C;
	Fri, 26 Dec 2025 18:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nzLUXdDM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cFDEO7fF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4323E227B95
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Dec 2025 18:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766773833; cv=none; b=AaScMwjBiuVDvz1j9sckyiiQbPcu0lCvvbqlt+2SvbkuHkQS8eOIKOr+BoeH+BxNJnmSAzeROLuk/kLF2nA1JzYQhX4R/3pF7IVluIXX+aJml1FdTiaaLHGeguF2ONxSABnrE/DMyTRzYQMz35tu01MuhebY+ZwDSuxDDI2RE2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766773833; c=relaxed/simple;
	bh=Gd73rVcr0MlwnXF8ffDby5dlnKdQoY1dvN8Y4lvZBfc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rfxN/qKaUhKCc7Zjy7cmGS28hosQu0PlwFVCyeYBX0sDs9tZT21Y79W7aAzeR+juLlRzbtmop6/2709/Nkv6qiaQG0pglFEddPRUHCmWlSyWzBn+pKBzl1YM6/9BDSyQiZYGg87bLw+RXt4z2Bn0zLIeiQPdMNSa8uruQ8l1SEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nzLUXdDM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cFDEO7fF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BQ8c7gt756033
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Dec 2025 18:30:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WVp1yFN8HhnapkBgDp3KUg9KO3H+6by3N5ei8C2EZbE=; b=nzLUXdDMe/ZdWg/J
	NIwobe2a67R3FUltjEukcQ+4tsdEYOuqk4F6a1WLbWeoVYrTts7z/3vS3VP4nYer
	qyXkEklojNZUcURlA4puongoejom0oSSH/B5AT6jPFcQdW5H3AON/fR68qNq3EJ2
	//Q7SUwdPQFMoYJw/XVDdVj/YOdGNqIjEvoNDTasyXaXlPlTPY4B48bmYEtFLvqO
	4otMpjHUVQ4+7oQeHVijP9gvagx0jWUOcLEkqgYDCRQ99IIaVJekPrw9m84nrERH
	peu088g/pMAHGBlQQlq/rLvGAMNCCxvY+fco5kB7IdGB6gCnD7NIeELs/bqZDLQi
	/0XwJg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b8kbuvh8g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Dec 2025 18:30:31 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-34ac819b2f2so9366827a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Dec 2025 10:30:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766773831; x=1767378631; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WVp1yFN8HhnapkBgDp3KUg9KO3H+6by3N5ei8C2EZbE=;
        b=cFDEO7fF/jmt4si+4JZ7cLf29yBsvmzxfsnsdYNrSVS0eYdKZAe0mw7nDO1dWLV2Ls
         Y2vgFbDo2bi26I9qfW8cw4UjRNQj3koQ9tS6up/y0+PtNOnVOeqx6I9bBlWZs9esTQ14
         TMntYo59KPQUJsg62LD0625GIW0UADCoixHtSBCUqLMfZsdsAHhgUiKzgPfcTwGXM5V6
         0TNBlOx5No5ENftCr+O2M1A5X01w06coz9kChMXf4Gf9kuLM32B/m2XYRhyggeQemcnY
         0HfRbhbbgmphc+PUj588KJXyJHUA/LpTx3GI/BTs9SZuUKlnVSyfxNVIl5zusLJZr7Sx
         NYFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766773831; x=1767378631;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WVp1yFN8HhnapkBgDp3KUg9KO3H+6by3N5ei8C2EZbE=;
        b=BN5yLA6nu9+DK9NbUOIxxpAVp40YyMvz5jLOqGf5a1l1swYeKOnTDc/aPDgE+rfD0t
         n8b/YRf7OyDNnLlkloDE3zVLOmYci952Cf0Rt4wxhbqGZmcbxUPTgrkQhbeJOhFcnVgS
         bifk7UQSHpEpVMOrsSOzUPWF44evHGQ3r6wIsX/E9mbXuXj5DK0itBQRbY9CrvbZOY/o
         Un1mdty/lz4blPQUpZuNxhogl+dSWH+ChNq1jLV7YSR5dmKPYbW6jQMFn9v0MnrTsG1L
         cH1vHASw6py4dRvLy53d9MF+sQkBEvYz+glmUSo/8yRF+Gru/B7rt3y3TF41eLjEaRsd
         yNXQ==
X-Forwarded-Encrypted: i=1; AJvYcCV08j8XZcG78niS77BvLaKyxB2KgZz0lw1uGHoE6zWQCK9S0Te7HCB7WWtcYkxp/DNOM/Q6XAE/yPqH/VDv@vger.kernel.org
X-Gm-Message-State: AOJu0YyDX5EqVw8/0fLYykUYU+xTi8v94FNEX1r3iQOFu+Xnyqbh28cg
	kNbquIMPrOnks3pBRuRFJ9a/kfcR2/6PZGkkbVXIqw+ZzNxGFa6kdKR9okezFfiryWx4gdzeeJH
	FklU68mzW5i3yGnq91XWbqaZmsPId6l+swHWmvXe1siEptCi/nW6+8KjbbVbaPdwnpmop
X-Gm-Gg: AY/fxX7PtxC4uBnB/BoAGwTCOsdi1StsFocXk6mzmagnFXpZ6YCCmC/ebCnKinAPYf1
	yNkadGWkeLOpn7kxlXFwxUl6OCrkkPaGGEQu1tiw3/dL+HsuGTYI1DoKvgyl7gK/FSk8jrjHQNe
	Z2KVV9nlKAj10qmfMYuTU7ODyC+qnqynklPigQEZQeRhn101NdD2A/JYTqGbn8WXwJ9DtuVY/ER
	3m5WFKr9hdvpVfaec+FiiFY+4v1+/oVR3Ot4trT+KTvxSfu8GdeWFiKz42zSBG0QAnWsDC5XTPC
	8rIWY0MITfpgnyWGgSlTkVafJWSlO/3q/y3JmH+1vYAktHZVUzrBK7+1olIjTSbkM8/DjlpKh0v
	qm4k/0129AVblzr2rDn6PjwKi/NhR26s5PA==
X-Received: by 2002:a17:90a:ca90:b0:340:d06d:ea73 with SMTP id 98e67ed59e1d1-34e921af95amr13974275a91.19.1766773830629;
        Fri, 26 Dec 2025 10:30:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHsM5qVuZEDipjpNOFh4UfS/2dryUGeX7TCYh/GNfIog0vGtjrnDurTRSGqnGigsD/a9CIdUA==
X-Received: by 2002:a17:90a:ca90:b0:340:d06d:ea73 with SMTP id 98e67ed59e1d1-34e921af95amr13974262a91.19.1766773830115;
        Fri, 26 Dec 2025 10:30:30 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e70d65653sm23808883a91.5.2025.12.26.10.30.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Dec 2025 10:30:29 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 26 Dec 2025 23:59:37 +0530
Subject: [PATCH v5 4/8] dt-bindings: display/msm/rgmu: Document A612 RGMU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251226-qcs615-spin-2-v5-4-354d86460ccb@oss.qualcomm.com>
References: <20251226-qcs615-spin-2-v5-0-354d86460ccb@oss.qualcomm.com>
In-Reply-To: <20251226-qcs615-spin-2-v5-0-354d86460ccb@oss.qualcomm.com>
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
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766773796; l=5138;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=uSE3sPERAiE75iumRyMImqBKNCNCcqza+1Vl3ymDj24=;
 b=SySzSMISdayjTf0CVmjXM/8v9YN+Mzj+yQ14mU7mxUS+w33xf3MNXyburtfW9Mm8mPEqjeFQC
 50T4FLmfwXpCodI/3y6N4O6+zA9nzEz9Zyef66oz7wDiKEoeq1V/+x2
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI2MDE3MyBTYWx0ZWRfX32QGuqB9YLQW
 7OqZG3YVgDTZnNOdx80uZt/Q0D/AjZ7OEuMXtRh7xBOYV15Nl9OLUuB8vbwWz8Q3lrhpgcycy3w
 fx0Vgue5YELieO5Wi5beyfTW6/2DEhnX4mMeRbNcm72ig9C/IWSIJRJI3+vKEaSMgGaGTe3OTIA
 M8U1m/RNLrgSPeULG1b6PrDHmJ/PnJ472poYuhLm5mPO9XAEkEpmttsWSifGmDPzA5m9BZ/BTgq
 4g9GUJIcgOaFuUMBoTRMLSI7Y2jCHYDii3YR2ieC3f9OtLlPPMAhvNb96YEYMoIyCkE/RTqjtU/
 1Sf4UpmggzshT43KlT/x2zIL9ZP44eawKukbKNX4hx7D/0FbO8rnEa08HDjrDl7JC9aL9k27bT7
 xfa+e9/qiGAjBlFRsVpVccaH8ijybR91MdGQtTogyMgsXYryaGnSqF3sg2kH8Ho6pP9ZkWYanbl
 Ds66QzGdVrPfnCJmbKw==
X-Authority-Analysis: v=2.4 cv=Vtguwu2n c=1 sm=1 tr=0 ts=694ed447 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=y_M5XU1qouMi1lcPmcIA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=sptkURWiP4Gy88Gu7hUp:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: Zv8U4wzPInz_nEhYcKyqI17xUVxGWRvW
X-Proofpoint-GUID: Zv8U4wzPInz_nEhYcKyqI17xUVxGWRvW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-26_05,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 impostorscore=0
 clxscore=1015 spamscore=0 bulkscore=0 phishscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512260173

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
index 0000000000000000000000000000000000000000..bacc5b32e6d7b2f2b9e0424e77236e6a0ebe9a19
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
index dc731d37c8feeff25613c59fe9c929927dadaa7e..ee09fc2a6e597f2432691b268d9956846789f39e 100644
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


