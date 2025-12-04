Return-Path: <linux-arm-msm+bounces-84373-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E74E9CA3D62
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Dec 2025 14:36:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1360B30C8C70
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Dec 2025 13:31:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D919B345729;
	Thu,  4 Dec 2025 13:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ldf5rvob";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F27Y4RUy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B85F3451CC
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Dec 2025 13:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764854567; cv=none; b=qws5Z1ciTM67f4+phK4z9JIYayevdFhL/fE6aOO4ZZl1h7b44N+aXN0nm4ApTU5KrMmL1IW3kECyLSK+D61PPV8zsmatWhP8QZIElXLb5NnEyHLCLqzZpe6/7HgNXNOS0Jvm6074RYNT6zT1OHPd4GiJh7W3A/AaSX9kPZqrS5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764854567; c=relaxed/simple;
	bh=uzoDcZNdCpHHjRw8JCBhOS0dKddZGSZY5hbgz/0ND9U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YXb2JUKQebkc2NiCKZHL+VwFDeWm+4PTPvihMb71Y5pYscfaAIu0OokCELys7/d4/KJjcRtnMqT11dYJ1g4PSRoll/o2e7hm1OZinpCZgkJwf3Ls42iKJshjMY0YxvUDG/ksjf6/Ds8NXZpTi+IfJZcpr573laVJJVqLQ0rfh70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ldf5rvob; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F27Y4RUy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B4AExk81275778
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Dec 2025 13:22:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dNj9R18HY9BBEV+EQzdpIOpzUF1L4+YTCM0LbT+T/xo=; b=ldf5rvobKiSCPKK2
	rE4ypVn8GX4D92jJfjaEfsxX62QgLnER5fLdsj9uO4e5Yppp5Xk1F0wwWwp8yzR8
	13LQBQ3OxtuCV7rEUaE2k0J7fGygvCzrq7HA7wpI2/9dlhc+eL0tEOWh58/CgSBx
	vzIzAVvTcq9AK5CUQwsecWlS5VMQwWn67UN6lsVVTehD5Y6Gb3RDYc1VCDBCusni
	4lxhsyQRfi2QdO8CNYfChDNGRFIwm6YRHMM1+MJOrjbIKSQyFVXTN0Plra2CgBVg
	mzpnOYI9GodoN7eTQbaRG6ok9l4FFZ25GCIFncKyR3qvnI8gU/16UwYvt3igubb/
	YF/UKQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4au6uvrvk7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Dec 2025 13:22:44 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-34378c914b4so1706416a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Dec 2025 05:22:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764854564; x=1765459364; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dNj9R18HY9BBEV+EQzdpIOpzUF1L4+YTCM0LbT+T/xo=;
        b=F27Y4RUyj11Com8fxqpV0ePKYQ0zPDnkMJ6owNnVnE7FIK1jZD5xYdKaLyMVAqY/jI
         +pqaB2BGV3rc5bSdHUf5f+UH15ssaTiBVwkjckqs/CpGWpH9jOZntqZKxjWD5m7219oD
         yr4CKHddJLbg0eTTIV7qSijJGB8oDDtZlRWhJLDSjqqdEEDQ5A4XOfDEzG5VyLJI/VIg
         XxA5oFajDK/K2Z05NmSiDdQmVoi9m66jEu49gu+DdRN5NXSkwP6OsTHppi+MUsLYvt5y
         pYsN3aVaiX1Nh26osgTAfhHSLhRkYTfljwC2z+oyHG/kcrDU4LewCqlgr6jZ1JTVltxQ
         C5Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764854564; x=1765459364;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dNj9R18HY9BBEV+EQzdpIOpzUF1L4+YTCM0LbT+T/xo=;
        b=bn8vuBAMnBHiD75tOaSeJZxcP7zgVKhDRA3PwwSzLRQsYaJf/AP0SlfK1ULetY5a34
         f5oVyyJcXWKIaSCW11DtMNknw2cPGqP7LzPfJ6s0Gaentl/PR3KyaseFy61OtKAE8jCn
         VG89G34ak6sYkEAEIeoWjZqmtB9dVH9z1VtfSiuIjkpo2wRDBjBjXQogOOddNFN0CgGg
         NMjkT4rkOau90yS8cdzWxSmGe6f1wMBec2yyPgaJJFdtNQ74Stj+c6NyrRAAj1uXiEOU
         jYAycOhXwsWspXF/YBkpZUwvW9YIB1RZHMVEX2GnVb8FmXIbASfwYh3JZ9N2pZy3b5B5
         DZDg==
X-Forwarded-Encrypted: i=1; AJvYcCUI35qm4eARWzxGbyXqQHyvxZozcv/hV04ZswCFzZ2oXuQ5nzO8UwY4FR35jIR44K2mbZ02aWMHl43vMUhQ@vger.kernel.org
X-Gm-Message-State: AOJu0YyBsdhNhEOIV3vPs9PopZpjO8oKUkjPKpc4kSVQMrP2gZTRf+HK
	R0OC0T9XAUAlCB7P6mLoPfFF+aoSty8+oTdtZm8833LBCR0cXD7TJayhnnNn2bIgo/dFsadf/BN
	EHqRYSVKzgKhBEEatKsc+Pd64dOtEfAKL6SRLp73iIAirgPFz42aGFFlG6Sax+q6Rg/rI
X-Gm-Gg: ASbGncsHC0oLxArMnPTvijlSe5WZuuQr7KK61zhNFS3Nig6OtYau8t9BpzMxAZKoyn6
	pdYjidYmksTe5AbozbJrfPZJyCiDZdJzSUmCa30JSP+YfpqpIjmd5lNeRQ72OB36Fywm8z2ga8s
	Zppu/U4dqZWIr89GJGypKaUR5ESRLtybflDEhDCMqr/iuua9aO21d2dvVmTenj8P9whxnSk3boa
	RSL9dmTAFgOR8wm84EbUBEyOZGUBQK3IOIgQZVh3ejQ6JdRVAwv1EtlJMc9cC3ntqyS0nAspsQR
	fqGTnMWm88fy2W+5jP+gE/DXxRxRUiJH04dfqVGPM1QNIl5br8tJk0DGFud3PGuLo+o8MC0ayUq
	6h7KhOeeYKMloobfYmsAvaXuLq6PQjn3qFQ==
X-Received: by 2002:a17:90b:3c50:b0:330:6d2f:1b5d with SMTP id 98e67ed59e1d1-349126b7cb2mr6437089a91.26.1764854563714;
        Thu, 04 Dec 2025 05:22:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFM7Yj0aAfp0DXPBcgTSCIeIyBXDcgz95NeVV+9v5b3m13qcDhXGMK6w6HenmZz+/02fo7qtg==
X-Received: by 2002:a17:90b:3c50:b0:330:6d2f:1b5d with SMTP id 98e67ed59e1d1-349126b7cb2mr6437060a91.26.1764854563184;
        Thu, 04 Dec 2025 05:22:43 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3494f38a18csm1914740a91.1.2025.12.04.05.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 05:22:42 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Thu, 04 Dec 2025 18:51:56 +0530
Subject: [PATCH v4 4/8] dt-bindings: display/msm/rgmu: Document A612 RGMU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251204-qcs615-spin-2-v4-4-f5a00c5b663f@oss.qualcomm.com>
References: <20251204-qcs615-spin-2-v4-0-f5a00c5b663f@oss.qualcomm.com>
In-Reply-To: <20251204-qcs615-spin-2-v4-0-f5a00c5b663f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764854530; l=5138;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=zUAYCX1J5MIdytFviYtCDr+x6dE7Gr9+3odzNMnnNEI=;
 b=nLTboisLMjix/tDE2QzkAreMiBJRUIWErvDk+xe6+ZTfWQ9SZUYN3KU02bsZJd/s9kbQy1S24
 BzgXb/Xkt82DSn1USz+XUiN1zjhHSdSYO/j5Jt3L3VgeM2OYc1Ui52J
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDEwOCBTYWx0ZWRfX70Rcf1z9oZiU
 xxKI6n1AXjsReRL43dNjL0qw4A/a6IODCX2W32kJSeUz8zif83VuzSyjiOeffE47Gv/MySFOrZ5
 skeqEJ4ZzYFVopKRrwdp5MM2ex8JlZlpjrMDgah2Ou86y9s+wqgTcFSqv1DKeSyL1zqY5SALDHM
 fj2U/4Y1hNi86EsHYFhKQf4f0pw9OMlf+Om5qKXyOyGFgReghkJTcPWHaFgfOMP02kBxczZ5Y7p
 QUH+xMDNiA+/xcUYTqCplwGmeMgHibaqYoV6xe4ZJ4Gelc/6NTAIlJedD05W2wA12sUZUpRRYhF
 4dTC7MLnRWtxKE2zIRw5V4BM93aJbmSmmIplshCMp0lYUBbU9KCkGegNNrbktNxsL3MPxBb4ZuH
 FMX9lJc+M31+dUo1siJKBaPwx1Jm+w==
X-Authority-Analysis: v=2.4 cv=d7n4CBjE c=1 sm=1 tr=0 ts=69318b24 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=y_M5XU1qouMi1lcPmcIA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=sptkURWiP4Gy88Gu7hUp:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: hoEL67LNYVaEnESWi_0udgh3fwwVatK3
X-Proofpoint-GUID: hoEL67LNYVaEnESWi_0udgh3fwwVatK3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_03,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512040108

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
index ea364af99ba5c28895df765288d9d77448d2a8b7..77d7ecb92d9eeacf54e02415746e41d472915e38 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7980,6 +7980,7 @@ S:	Maintained
 B:	https://gitlab.freedesktop.org/drm/msm/-/issues
 T:	git https://gitlab.freedesktop.org/drm/msm.git
 F:	Documentation/devicetree/bindings/display/msm/gpu.yaml
+F:	Documentation/devicetree/bindings/display/msm/qcom,adreno-rgmu.yaml
 F:	Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml
 F:	drivers/gpu/drm/msm/adreno/
 F:	drivers/gpu/drm/msm/msm_gpu.*

-- 
2.51.0


