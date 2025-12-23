Return-Path: <linux-arm-msm+bounces-86303-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B1456CD88FC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 10:20:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 900CF30142EE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 09:16:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FFB631BC95;
	Tue, 23 Dec 2025 09:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G60oct1E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jDW73+n5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B3A7249E5
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 09:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766481399; cv=none; b=nh2wHHDq4JZbh7rFAOtJkH7flKlpn3kA+jBj+mU3bZD/2jNL8Xy+WO09GoXcz04KGB2KL16t2/l4aXhG//pjcli/pnRi1JoINhq6mIsh4x3ZsMDoUO1qHAEuvU283VxsxLGBHYPwWynfzW6T6lS9t+PQM+Ssb5shGR3U/cLmCtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766481399; c=relaxed/simple;
	bh=5KumP20fDI2ZbJDHb4/tO7FSR6emNSPBnijP7UxKCAE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XsGzD9dAKTkfUH4TPuJSelkjIYKenbzlU/sjFnZo2MrAiaOwKqcbDTvl0V1REkNCHONnOC8D84yVd3mtKC9OO7K+kDByndbFmq0EEdALBtqLkzkxTuGqictCbMar/RFyDv+6Mv82lGlFmtp+VRwnO0q0MRgmfKth6Ell6aO9MMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G60oct1E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jDW73+n5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN345FV1891267
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 09:16:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZNuj5fMI4Xpxt6s2cvQVzAdTguidM5KXUybpFV8NeYA=; b=G60oct1E5AKiarxt
	Zn0QJc8C+DvbXtCiFNVeTJW+Ggx3p2tSxg7eN2PczS3ZhRh2cahDP3jo/uyJ/cZQ
	Lh3FfhI6MKjja9Y10h1oaO3AU5f/KM9Cy4NEGkHMqmuwmuSVTlxdPheW0I3cXNw2
	xGYUI31WNFrzmAmLH1zO6nh2a7sHfbr4Mt5MwMOT4kfNFfp2PEAL/4HejFaixFvy
	uOK5noBcFu3w8UZJ04LrktzUCpFHyDVSFvLJLwifcV4LUShRONJzWNzs1VmztlX8
	Bktmg5v8PuQe7hp8Cmpg2ij+VZn1vc+XhAxJmU6W5919kUsj/RJVNBIwZb6B7G14
	yoyh2Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b770ajy8s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 09:16:36 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-29f25a008dbso44710465ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 01:16:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766481395; x=1767086195; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZNuj5fMI4Xpxt6s2cvQVzAdTguidM5KXUybpFV8NeYA=;
        b=jDW73+n5WvQKxEgQb1+Gax0NzqPYM0CpRX+HyECvVL3NmdjCBVwUk+0LiHoAdXdPTu
         xZztMfY7T2aHzotZeADUKyaM+hmNxEa0BAW7QHEHT3/yLlvOTQcQtf0VsybWInyuxsOm
         p+wLfxvKiVZPAv+lUAMXNBUr3riN5NAH4l+fWmO1zwFM2/5lcV9Jfw+zB+cGh8QtUYLF
         03IB8oQZYTkFCblqHhIO7uXv1etag68YQsvLzcxihXEmeZ7PDxhLErarQ2Bxqr4CUvON
         jeU5tlKuLNlyT8Ey/BYG/7n0ZRoM57Ged4xXu9Kk3ox3qEN3qahDD3BrJ8dEetkqka9N
         bIqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766481395; x=1767086195;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZNuj5fMI4Xpxt6s2cvQVzAdTguidM5KXUybpFV8NeYA=;
        b=VXJGdGfIQE4D4AhC4QvNjld+QfKC/z1fe1xbXMXAzd4td4hPpKZFka6Q6C9s1+8IIC
         jCr4T1/orZnpeg7O89eosMrSGtqg1/BF67NjoR5VUQxhqfm2qf2GHXNpEhl6esKwQpAL
         QLD1JKMfhe/G/F9uhu6zbGyJGxZkO7+o13Wq9qbltILAYHSZCy0CzvM1OHzSBn87NDz5
         LFxYB/A/jIyRltIcx/wVDfuvNrFIKbltqc/Mawf5fbDSb9wNPdBTCrP5QlnB8Zpd7eMR
         DJvmnK8DBT7Jfo10EUBCxEP6SWTLvEABPjvAnz4g7MG4sJAdy1D2PSERo8HemVQ6S3VY
         SpXw==
X-Gm-Message-State: AOJu0YwUMtwaQeslLRRF0pHkvXSWkgl2yfTF2iq/htGY3W4p6y9zNRJK
	x8OIgVeuLzb7AYe02+nvRPgkWfbSqjkOLAw6CN/M9LqUneFntTPl+LRZ3R8w9dJRAE5aBjTZzOm
	lPu7zr/WX8n+syUXgyFN5po0tbrxImnEshPy5QwSQwIzWzDxxtqAA9IZT+/LHmpNwXeLH
X-Gm-Gg: AY/fxX66A8nwAlffBcH5Z74Sre8bpkVi34cocrx+RaQlhWP+JfOTO5oxiXo6XbBG3Oa
	1rqDnbAMHO9FoCU45iS0fcqyU7KAWTP0VfC5VNmaLaYp5wOC3z0gpFZoj/1ZfF1XKCFaRinmAL0
	6hDEJtlHlGwkYN5hqjoPx8AlhIuIRLzszep+ifaC49GOqhLe1vcmub/nRY4uhDqDQEdh7Qx1dAC
	LJKZ8QFx+RS2pG6UKCSup2ce4+LN+N15eVjV/+Hn1sY3yBNxRSdX2bP9j7ogwH8GzitKNkF19ck
	xZBdIb3R9zqs2qPnf4vPd4kezZe945SSlZp1NOhSie2m5B0zEqjZeV+RAhOuyMAtsaWUSJ22qj6
	+14OaTSlS9Wbwv9MvoIyARf9YDFB3emIhiS/byugh9Gw=
X-Received: by 2002:a17:902:ef0a:b0:295:ceaf:8d76 with SMTP id d9443c01a7336-2a2f2840085mr125555515ad.47.1766481395418;
        Tue, 23 Dec 2025 01:16:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHvV0SECnt5qr2+m+UX+cGQTWDSVIgi6rAUtFKfd1ZisA+JQJTtq4hEzNrXUMisbHRIUEJB8A==
X-Received: by 2002:a17:902:ef0a:b0:295:ceaf:8d76 with SMTP id d9443c01a7336-2a2f2840085mr125554935ad.47.1766481394647;
        Tue, 23 Dec 2025 01:16:34 -0800 (PST)
Received: from hu-msarkar-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d76ceesm122507585ad.91.2025.12.23.01.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 01:16:34 -0800 (PST)
From: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 14:46:20 +0530
Subject: [PATCH v4 1/2] dt-bindings: PCI: qcom,sa8255p-pcie-ep: Document
 firmware managed PCIe endpoint
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-firmware_managed_ep-v4-1-7f7c1b83d679@oss.qualcomm.com>
References: <20251223-firmware_managed_ep-v4-0-7f7c1b83d679@oss.qualcomm.com>
In-Reply-To: <20251223-firmware_managed_ep-v4-0-7f7c1b83d679@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        quic_vbadigan@quicinc.com, quic_shazhuss@quicinc.com,
        konrad.dybcio@oss.qualcomm.com,
        Mrinmay sarkar <mrinmay.sarkar@oss.qualcomm.com>,
        Rama Krishna <quic_ramkri@quicinc.com>,
        Ayiluri Naga Rashmi <quic_nayiluri@quicinc.com>,
        Nitesh Gupta <quic_nitegupt@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766481382; l=3868;
 i=mrinmay.sarkar@oss.qualcomm.com; s=20250423; h=from:subject:message-id;
 bh=5KumP20fDI2ZbJDHb4/tO7FSR6emNSPBnijP7UxKCAE=;
 b=y8UTo8ea7bkyRTK9lgNPiEvbBGa2FlFKJn362J0hRNhJbymyNLIk097LtE0fO5lGxDEuW1x2c
 DWEVHqC8ZVvCFJo4T7sAyz+ng5womvaok85sMqlEUfWl8nudU+jR7CA
X-Developer-Key: i=mrinmay.sarkar@oss.qualcomm.com; a=ed25519;
 pk=5D8s0BEkJAotPyAnJ6/qmJBFhCjti/zUi2OMYoferv4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA3NCBTYWx0ZWRfX4YqcHsUQMYbu
 TEe7QvOUrndlbFXVSxHQ0F/EQ7IZfkaxOjBO14/9a0JG999pT0BggeuxbIm9Am5tPkJBJ+U5Kjq
 eGhswtukLbNZtU9n2LC3dlcFvsz8Ru/I2MW5+LlR1mImY8lPKzJLKMks5bsABQBasNTFPd97MHn
 UKqU1l4TbkreTJ/1EcXq2BY48ednDrjnnPCha4kbU9KSU6R4ijHIWsH2x9WshYYkloeJbYZu165
 GkL8PuOkGVrhI/TYVshHFKhzVAVSlGjmosxT8IY46nxewLFnXiDbSgDOJIbukLUE/xZJFE7Mfm8
 7RnU7XXK0Ra0RJyKTrhk6hQZ6mYHELGw3n9g1wZiTtk561V66CYn0UOePChtUjEENEJKuK2oU4D
 r6VmZfZtibgldfygYISmUW1aYgsTfK+LhXdxAIfp7axHcQUZfHIvCW2lcTPp9am77xCNkYNnqcR
 ydGg7gT6sz2LZ2cUEfw==
X-Authority-Analysis: v=2.4 cv=VqAuwu2n c=1 sm=1 tr=0 ts=694a5df4 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=avnAaoOVoNrTWVjlPhgA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: bu3Z7niOntiD5UV7HnyldJZMEvsA1fYh
X-Proofpoint-ORIG-GUID: bu3Z7niOntiD5UV7HnyldJZMEvsA1fYh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230074

Document the required configuration to enable the PCIe Endpoint controller
on SA8255p which is managed by firmware using power-domain based handling.

Signed-off-by: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
---
 .../bindings/pci/qcom,sa8255p-pcie-ep.yaml         | 110 +++++++++++++++++++++
 1 file changed, 110 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/qcom,sa8255p-pcie-ep.yaml b/Documentation/devicetree/bindings/pci/qcom,sa8255p-pcie-ep.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..e338797d5dc2f68e2ad658e7f2c073023c4aea75
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/qcom,sa8255p-pcie-ep.yaml
@@ -0,0 +1,110 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pci/qcom,sa8255p-pcie-ep.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm firmware managed PCIe Endpoint Controller
+
+description:
+  Qualcomm SA8255p SoC PCIe endpoint controller is based on the Synopsys
+  DesignWare PCIe IP which is managed by firmware.
+
+maintainers:
+  - Manivannan Sadhasivam <mani@kernel.org>
+
+properties:
+  compatible:
+    const: qcom,sa8255p-pcie-ep
+
+  reg:
+    items:
+      - description: Qualcomm-specific PARF configuration registers
+      - description: DesignWare PCIe registers
+      - description: External local bus interface registers
+      - description: Address Translation Unit (ATU) registers
+      - description: Memory region used to map remote RC address space
+      - description: BAR memory region
+      - description: DMA register space
+
+  reg-names:
+    items:
+      - const: parf
+      - const: dbi
+      - const: elbi
+      - const: atu
+      - const: addr_space
+      - const: mmio
+      - const: dma
+
+  interrupts:
+    items:
+      - description: PCIe Global interrupt
+      - description: PCIe Doorbell interrupt
+      - description: DMA interrupt
+
+  interrupt-names:
+    items:
+      - const: global
+      - const: doorbell
+      - const: dma
+
+  iommus:
+    maxItems: 1
+
+  reset-gpios:
+    description: GPIO used as PERST# input signal
+    maxItems: 1
+
+  wake-gpios:
+    description: GPIO used as WAKE# output signal
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  dma-coherent: true
+
+  num-lanes:
+    default: 2
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - interrupt-names
+  - reset-gpios
+  - power-domains
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+        pcie1_ep: pcie-ep@1c10000 {
+            compatible = "qcom,sa8255p-pcie-ep";
+            reg = <0x0 0x01c10000 0x0 0x3000>,
+                  <0x0 0x60000000 0x0 0xf20>,
+                  <0x0 0x60000f20 0x0 0xa8>,
+                  <0x0 0x60001000 0x0 0x4000>,
+                  <0x0 0x60200000 0x0 0x100000>,
+                  <0x0 0x01c13000 0x0 0x1000>,
+                  <0x0 0x60005000 0x0 0x2000>;
+            reg-names = "parf", "dbi", "elbi", "atu", "addr_space", "mmio", "dma";
+            interrupts = <GIC_SPI 518 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 474 IRQ_TYPE_LEVEL_HIGH>;
+            interrupt-names = "global", "doorbell", "dma";
+            reset-gpios = <&tlmm 4 GPIO_ACTIVE_LOW>;
+            wake-gpios = <&tlmm 5 GPIO_ACTIVE_LOW>;
+            dma-coherent;
+            iommus = <&pcie_smmu 0x80 0x7f>;
+            power-domains = <&scmi6_pd 1>;
+            num-lanes = <4>;
+        };
+    };

-- 
2.25.1


