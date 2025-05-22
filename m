Return-Path: <linux-arm-msm+bounces-58973-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 859AAAC0145
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 02:14:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AA67D1BC4719
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 00:15:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9324228F1;
	Thu, 22 May 2025 00:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kCcqb8aK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE6A16FBF
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 00:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747872883; cv=none; b=izDkJtc1SYO+6oWdvNvNi7BYDGhx6U+Qg4qGc1GcEASAbhi+LHI36thSsVkkfCHbrYtwl2a3r6ppvXPXbyI5mOvQAZPHtCt3uOZo904tYvuWYUimKrjc3fRoq+1UhdCVO8e+6OMITXoJNOpKaJE3A/vkw/Rs4nSSD23O85VBa2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747872883; c=relaxed/simple;
	bh=9cNf7bR8xI1WZnub4ccaYHFHl1ti/TpzbhRj+WFIrMg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oVGT4RDsP3SGW90RDlHM6/9DTrnBVXGRXMM7Q7g5BAjyVWd+Q+MXZtp4jVWXC3HfU7qLn4SkDcu8RZN8MOPgcxxbJnxxL4KAYQ2szbkrif5AD1lp21Oagn6GCFSJ01f9NgFeAEW3qVg7maSeMvv9R9uoQdNiTFq+8iwR2UhPv3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kCcqb8aK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54LIMAoT001325
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 00:14:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=rmlMYWdV/MK
	piyqfowc8oeGaqdJi10redcq+NIHcDCE=; b=kCcqb8aKROIz+rSDTz2/JNwaCS/
	bqKDQPzXvCcBU1FDk0zA+kM4zoYRtBmUK3FtQcGZxJ57It4SeE7K//ExhXZ6souB
	8cm2mLmFjlNcbzBLPfqBVxVFis8UuxjQUBgdLmQU9r7Gv6UzA18mK+mt6mqVNJ2Q
	RUkXEymf4N93wPiT6y3Ktc+nOIjwr5hUgwKxWtNuMYmExtcdVKbUvmin5lhNSiEK
	3vkV8tW9Yor+MEcFxLsdhd14SXwiIsQuqNGCC56C+cmV2W/wH6vr3i19ELhA6Uto
	GdbyIluYz4oZmwTlHG5GMPMwx6OlgzVA5n2/p8qVvrm2bkhe1WfMgDkKEtg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46s95tjw1j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 00:14:40 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-310a3196132so860598a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 17:14:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747872879; x=1748477679;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rmlMYWdV/MKpiyqfowc8oeGaqdJi10redcq+NIHcDCE=;
        b=kNJu7BWOoMPjlnnXd0QcQWSR7nnSBZ156SwoRo09oYzaAgUSxjT6/xy402tjy4x50x
         bFHTGyU86FOdC/LNUO7QwZijp2fFtfYr5i9tVo+RGlbCdlM8Y2mzUj17asVuWjMiET4O
         UDod2+HnXsb7TACXPhuHcRglvKSYSc2MD68KG1w+nR621kPmTVg751un42LeotlIRUu4
         oHYVkkNXlcj7Gi9k9v9tx+VYyCA/Gd6yLnRXcN86uD6agd355EdY+x2BsUUCOThunywi
         jvU0T2lFQNOelpC5aYX3nP5295HW2mAcFshCQU/1yU9qYWIhDZ3GOEQ9ld4j2XaSImME
         9mqA==
X-Gm-Message-State: AOJu0YzkrmhvH+NtcU1bN9AXcUkfLLpq94xjAOIjVV4gmyl01XKxPBjh
	xUs70b6touAiQIZNV9U4bd/bjF4SRdncxqs9KjNk9/8K+X8OJTra2taSybGZNeLlcDWktXyJTkd
	iEJgEViM7VucjQg+WQt0KmhjMu2C+q9yjn6oMZUWGVy7UF0eT0DctnItI5qxHLdnVxj//
X-Gm-Gg: ASbGncvet4hr8bOFgMWJdoEAsEaCZw0wTUqTs3CjUV4SyoqUCy8ioBy4BG1IJI/ME35
	fcGDQu2M9NowVa2U2yC8Qx2Frw1g1QMWp63cJOFLRaEnlItYlZFJCpnvJLfK+pEV9z0J+/jKS0d
	91VwaIu9HYRF/DxIiC6lgnh6uqn7sbkL6p3bEDuCgnvR2xUUkDfdqUwlSnJBIIc2r48b/O548EJ
	SlxV2WWUVh0JkNu02syM/qAvVQR9Mlz334F4yvh85wAC3QNQ9b9kK4tTPuNqGPJXq/pU7nsGGfk
	GhDuoK393GJCdPXfcQx/ZsV4vEglHSV1vJxrjwdFhzYkpcV7NX/7gS3CD6pHQw==
X-Received: by 2002:a17:90b:3e8e:b0:301:1bce:c255 with SMTP id 98e67ed59e1d1-30e7d5a93bamr33089959a91.27.1747872879214;
        Wed, 21 May 2025 17:14:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGXwxibgAiSbpx5ECy8y8p1QnDYIC2ZVrNVybzyMUZBzLDEJ+/xtzuoJ+FmMj7t1wlejBhOHQ==
X-Received: by 2002:a17:90b:3e8e:b0:301:1bce:c255 with SMTP id 98e67ed59e1d1-30e7d5a93bamr33089915a91.27.1747872878808;
        Wed, 21 May 2025 17:14:38 -0700 (PDT)
Received: from hu-mrana-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f3651611bsm4617101a91.49.2025.05.21.17.14.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 17:14:38 -0700 (PDT)
From: Mayank Rana <mayank.rana@oss.qualcomm.com>
To: linux-pci@vger.kernel.org, lpieralisi@kernel.org, kw@linux.com,
        robh@kernel.org, bhelgaas@google.com, andersson@kernel.org,
        manivannan.sadhasivam@linaro.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, devicetree@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, quic_ramkri@quicinc.com,
        quic_nkela@quicinc.com, quic_shazhuss@quicinc.com,
        quic_msarkar@quicinc.com, quic_nitegupt@quicinc.com,
        Mayank Rana <mayank.rana@oss.qualcomm.com>
Subject: [PATCH v4 3/4] dt-bindings: PCI: qcom,pcie-sa8255p: Document ECAM compliant PCIe root complex
Date: Wed, 21 May 2025 17:14:24 -0700
Message-Id: <20250522001425.1506240-4-mayank.rana@oss.qualcomm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250522001425.1506240-1-mayank.rana@oss.qualcomm.com>
References: <20250522001425.1506240-1-mayank.rana@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=QKBoRhLL c=1 sm=1 tr=0 ts=682e6c70 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=dt9VzEwgFbYA:10 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=KKAkSRfTAAAA:8 a=MHjvnb3Eh_dVhpJH9IQA:9 a=iS9zxrgQBfv6-_F4QbHw:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: -vf7DNUVTAJeBlznLs6PSe3U_x6NR0hb
X-Proofpoint-GUID: -vf7DNUVTAJeBlznLs6PSe3U_x6NR0hb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDAwMCBTYWx0ZWRfX5drJC6JXd7Zm
 nI2U+V6RIbqREJQJpPDlAVWHn1gwvBoHRzYPOKG/YvC0ydYJNoqj5B6E4koJGZMm2eeIY1QCFIb
 Rz29C5neTh102XzlRIXcj7prVj58xADDFpSlOagj/RkFUsvgd/ZFDW3xJTDxSjlWDyiRj4GwNXJ
 nJVUdhaqSydtCXVvGTahslarDAeRhekmMY+mLlSZs56QKSB9wm6nZ3Lea0zsy6knDQIOHhB/Jhr
 0x+QpzS5XJVHcQOMd72q8r6IxXiNhvwqq+fJND2we7795zYCJwaQWDytqEW6czARrTwDwWDPJNA
 r5BMvDeJIaO+N12jdZ7eHyjDacPAJIJlQYlCnSJfkdJ4wX6VaOnPpRg8QyDxGR4ODR8qAgn6nPo
 qft5b4n+kd6TxFRYPmhKN/TdPxirrOO5Zs+ImMxM/Ki4SCTnQwxeBHiUz+rNVeFT/psWex70
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_07,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0 clxscore=1011 phishscore=0 lowpriorityscore=0
 adultscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505220000

Document the required configuration to enable the PCIe root complex on
SA8255p, which is managed by firmware using power-domain based handling
and configured as ECAM compliant.

Signed-off-by: Mayank Rana <mayank.rana@oss.qualcomm.com>
---
 .../bindings/pci/qcom,pcie-sa8255p.yaml       | 122 ++++++++++++++++++
 1 file changed, 122 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/qcom,pcie-sa8255p.yaml

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-sa8255p.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-sa8255p.yaml
new file mode 100644
index 000000000000..88c8f012708c
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie-sa8255p.yaml
@@ -0,0 +1,122 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pci/qcom,pcie-sa8255p.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SA8255p based firmware managed and ECAM compliant PCIe Root Complex
+
+maintainers:
+  - Bjorn Andersson <andersson@kernel.org>
+  - Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
+
+description:
+  Qualcomm SA8255p SoC PCIe root complex controller is based on the Synopsys
+  DesignWare PCIe IP which is managed by firmware, and configured in ECAM mode.
+
+properties:
+  compatible:
+    const: qcom,pcie-sa8255p
+
+  reg:
+    description:
+      The Configuration Space base address and size, as accessed from the parent
+      bus. The base address corresponds to the first bus in the "bus-range"
+      property. If no "bus-range" is specified, this will be bus 0 (the
+      default).
+    maxItems: 1
+
+  ranges:
+    description:
+      As described in IEEE Std 1275-1994, but must provide at least a
+      definition of non-prefetchable memory. One or both of prefetchable Memory
+      may also be provided.
+    minItems: 1
+    maxItems: 2
+
+  interrupts:
+    minItems: 8
+    maxItems: 8
+
+  interrupt-names:
+    items:
+      - const: msi0
+      - const: msi1
+      - const: msi2
+      - const: msi3
+      - const: msi4
+      - const: msi5
+      - const: msi6
+      - const: msi7
+
+  power-domains:
+    maxItems: 1
+
+  dma-coherent: true
+  iommu-map: true
+
+required:
+  - compatible
+  - reg
+  - ranges
+  - power-domains
+  - interrupts
+  - interrupt-names
+
+allOf:
+  - $ref: /schemas/pci/pci-host-bridge.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        pci@1c00000 {
+           compatible = "qcom,pcie-sa8255p";
+           reg = <0x4 0x00000000 0 0x10000000>;
+           device_type = "pci";
+           #address-cells = <3>;
+           #size-cells = <2>;
+           ranges = <0x02000000 0x0 0x40100000 0x0 0x40100000 0x0 0x1ff00000>,
+                    <0x43000000 0x4 0x10100000 0x4 0x10100000 0x0 0x40000000>;
+           bus-range = <0x00 0xff>;
+           dma-coherent;
+           linux,pci-domain = <0>;
+           power-domains = <&scmi5_pd 0>;
+           iommu-map = <0x0 &pcie_smmu 0x0000 0x1>,
+                       <0x100 &pcie_smmu 0x0001 0x1>;
+           interrupt-parent = <&intc>;
+           interrupts = <GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH>,
+                        <GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH>,
+                        <GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH>,
+                        <GIC_SPI 312 IRQ_TYPE_LEVEL_HIGH>,
+                        <GIC_SPI 313 IRQ_TYPE_LEVEL_HIGH>,
+                        <GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH>,
+                        <GIC_SPI 374 IRQ_TYPE_LEVEL_HIGH>,
+                        <GIC_SPI 375 IRQ_TYPE_LEVEL_HIGH>;
+           interrupt-names = "msi0", "msi1", "msi2", "msi3",
+                                  "msi4", "msi5", "msi6", "msi7";
+
+           #interrupt-cells = <1>;
+           interrupt-map-mask = <0 0 0 0x7>;
+           interrupt-map = <0 0 0 1 &intc GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>,
+                           <0 0 0 2 &intc GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>,
+                           <0 0 0 3 &intc GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH>,
+                           <0 0 0 4 &intc GIC_SPI 151 IRQ_TYPE_LEVEL_HIGH>;
+
+           pcie@0 {
+                   device_type = "pci";
+                   reg = <0x0 0x0 0x0 0x0 0x0>;
+                   bus-range = <0x01 0xff>;
+
+                   #address-cells = <3>;
+                   #size-cells = <2>;
+                   ranges;
+            };
+        };
+    };
-- 
2.25.1


