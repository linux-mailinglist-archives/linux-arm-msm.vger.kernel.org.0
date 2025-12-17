Return-Path: <linux-arm-msm+bounces-85562-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A71FECC8C60
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 17:30:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4589E30B32AF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 16:20:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E68FC33C18C;
	Wed, 17 Dec 2025 16:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DvfjvJIk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="URCHb2yI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB6E634A3D2
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 16:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765988375; cv=none; b=m1s3QOhWbZ67LBQRMYH5NO9+UEb8ay9476UjNRpgLAIJVmTEUTOjIKtqyi7zTn6H8NTI8dKjEM3vimeCXspyqVIf2RpQcZqARTBb+GaupxOraFbvEVrI0UH/pJwBFJ2HcOTEzz44lt4v+Q1yHwCm4pjr3rdr9pt8mqh+pFgmXlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765988375; c=relaxed/simple;
	bh=MQUR4X4VE6vtHyT8c+tJ7bUFyjg9QuKpuh0a8nl1qFM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mcgYzKxphANwGErB0Soh+udVxR4N3arBYB6/lqDJzn4MdsuCdU5TQAzZfkfg11p4jpOcDmPCitCnlqFKugD+dn+mleQnf8e/V8ddYPZdprb7i6qAbFmVgA9PHwQXGOSsTLRDPvhk9Az1Cxcxpxhj3KDiAWl4wzCHRsz1W06MWtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DvfjvJIk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=URCHb2yI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHCKrAo2042739
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 16:19:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z7IPoGVPDfVfKn9yF+oHVvgbopBiQzjvOw9wHBxUVLg=; b=DvfjvJIkyF9wh85L
	5iI/fbwtbIauXX9T2sZdaML8JIi8ry6il04suE911eHrz5q/6pFxgenDD+w3jDPO
	5H6LLl1A8nfqkpDf++tLstUP0WK8PJahNTBTJGO3QaJKEy+OWkLiLnzUca8NcFQ8
	qnJbB7MV4nPJ49we8hLcB7rM0J0bMjXqdLlzAuE4+b6fpgZxxDX+T6SeuBo81rYL
	iQIwFRyCabijRzLP0zDq7jXZlWbCzXRnfd8yMoHHeemLlqyjfGrhkNt427cgCuBm
	WWe49xv6cwDzy9bYlfE4PTeLJNlXyDN1x0Ey3AtmZ3Ttp3B6uP9n3F9maYjVKmcJ
	IOQmyA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3fj1u6de-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 16:19:32 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4f183e4cc7bso113503091cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 08:19:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765988372; x=1766593172; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z7IPoGVPDfVfKn9yF+oHVvgbopBiQzjvOw9wHBxUVLg=;
        b=URCHb2yIhYejSNDfRQyaTcK0DwxawYFdunkUDhOr53J70YmqqtQ7/wS7XwmZWb8fF6
         EnEncpL0+g+GG5/5i8lujGLAOjMkHdutoXr4NHygVaue8+9QQhnBy48Upmer2mSmOtIy
         e3vI6gdaiCDCLgHeSIJ0dkcFOttWb5FyrjEPCw/2W05FQMGz3D+ft4ZBdN1ncOZVT/uk
         9aQDKorpH/RY+b20Krx+P4r8are+eLTtF9YIS7uZiEQAFs9/hUDqx2Bn9C2jShzvIIGI
         BDSPUyVGA6OZ5aLHFFKQURxwdZudcoDPeV05DqYqh7lb45+AWkfb3kbeSOUiKuvRoDWH
         afSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765988372; x=1766593172;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z7IPoGVPDfVfKn9yF+oHVvgbopBiQzjvOw9wHBxUVLg=;
        b=pq+z4lf5E9ffW2pIxYB1UVIE5McVb/8zKohLOq5zZ+4A/1QmhKc+B0BAsDtN9OTn8h
         KX/S2bR/yl3AbqI8gwBpnzQFHf7PTm157pFzivZZuwKAFPKD+GnksT+fpQsXmPNA8OOX
         k+yafDnwZf3SrKCAlb0Hb3rzyH1Z4tjycFp5rfFUhs46QhGItBbf3MJIXdYWruYp0t4l
         T6/qI5l/ykFL3w2GVo3bhM5VsgGyc6BqrfNS+bc+n5MBiONr0e4RxVdYfC8OeLQln6gp
         NQVWRNsgYgIYcpNFMqH/e97vfI58kENjg9CV5hSUoKJMbPbD7YcnWOnOFXTiIx+4PY9e
         q+Mw==
X-Gm-Message-State: AOJu0Yw2kTtm0MXNasN9Lp9APkjN1tFeH5dGMaw7SCyKBe22PnpJakE2
	QeEDj7UU7ZKWo9YiLInTY6yDDm5xmWOomalWwPhprl/4EFgLIHLj1ThtDuzNQUEvMAeGRA4c1+0
	z9kMWsM2pOgjizcu2UIJv8WWF1wlVUuHNfPwT75uTfbmxCh10V9OzmsRli1pB4rftAtPf
X-Gm-Gg: AY/fxX7uGcfV4Wi9eCoImzJNp3x3l84YlJYEotcaDZ+Qgqeao9dPCoV0JxTWcKGY4Hi
	sZ/VsbQMkXRAeiFQxQWgEfcvohKiNLcJEXKCUSvUyzY5+vb24WWmXCVozROh/Aja+8PuqBNte5W
	4n5IY8uNrOG/PSahqv1l5juhu0Y8BQjkBFbyxQApmdjJDK39XpYFfRkTQ2l2f5JQeGwK/4EWSTm
	2+UC1NaHwVu6DxXTC1km1aO+6Sz8A27n3ux2EEe3eu0deLTBlkqEEpGzj3TENVcYIjMUITaMRpG
	zD11sWnGIqec80mn6a126XeL5rWvtEJs0spPfkgzm0rPfhjTvpugrMLGCwMcD42GR6IQWBFcDZT
	7dCYFnEq8DRdp8G5PVrkyijH0/NyNCOv/
X-Received: by 2002:ac8:7f08:0:b0:4ee:ccd:722f with SMTP id d75a77b69052e-4f1d01643admr238862371cf.0.1765988371605;
        Wed, 17 Dec 2025 08:19:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG3fchTulCOCVLeXDHKfWjGrojPGLzDa4i9wnvts6b66tKGfSfFZLariJJXaZ/EsgMoxUBQZg==
X-Received: by 2002:ac8:7f08:0:b0:4ee:ccd:722f with SMTP id d75a77b69052e-4f1d01643admr238861711cf.0.1765988371055;
        Wed, 17 Dec 2025 08:19:31 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7cfa29be92sm1987868666b.10.2025.12.17.08.19.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 08:19:30 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 17 Dec 2025 17:19:11 +0100
Subject: [PATCH v2 05/12] dt-bindings: PCI: qcom,pcie-ipq5018: Move IPQ5018
 to dedicated schema
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251217-dt-bindings-pci-qcom-v2-5-873721599754@oss.qualcomm.com>
References: <20251217-dt-bindings-pci-qcom-v2-0-873721599754@oss.qualcomm.com>
In-Reply-To: <20251217-dt-bindings-pci-qcom-v2-0-873721599754@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=9369;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=MQUR4X4VE6vtHyT8c+tJ7bUFyjg9QuKpuh0a8nl1qFM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpQtgAdGs2q9KL4oLnUovLpOSHlYkCYGnvwHFE9
 vghrdhtKGCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaULYAAAKCRDBN2bmhouD
 1+e1EACC7+ikNoWhbW9ihK7l0nRx9g5UnPFbzDTDaBMC3fTheQosql8IlYH6Dif35RN9WHipQ0I
 xGYSjWct0d94eRnkht+c/doHVHBfvZFqDWDsniBXQTrxaK8MHOIbj4UaKVoIYIv+S7zCa+GWQ7+
 P3dh6/pcY/wKqmlv9GW3IIRHtWUr0TSeEUu9zxvqJGFrGggdrIqdea+Hx9rgACEYmssuoZc8EKo
 tjXrJw1YRqmEKHDDVvALIidSAy9Ye0dRrsSbxIfDofsxtraB/w9Ovuo3LYXHgVv5wZZTNWgmr69
 BpcIG41Udoe7lewhwDbDgHfONUemvNXYBVjr2CvsATHSCaQq3iOnicNrds1KetpWv7z0JLbQ3JP
 SZRVlDqt9ly6nbyTv755LkpVK/8jb7lNoDDF5OxaJVuwR7dce79RhRdW9RXn613pUwBJaTSvQI/
 xoYGZlVOProaHIUIabFlZ0Y12yFmeoUvXmHehWsM7qqhpDw3SUdCPBc7W5zmkinaLGEkkx7sCwS
 NMJ/n5499pEPLtHiXUr3kzYNrv/MMj72mks8JahtVFc0AIjrm5BNits5BuiPwgMLdWaQFHkjJA8
 /N97MVG5sBp86uSQ0iAXVWzcCe7tHDEsj578wwEmubLPaevux4Nhpvn63aBRz0B3SkIO6OdXbeu
 qQIXa4jGEaCd/Ag==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDEyOCBTYWx0ZWRfX4CAAnB4wC0hA
 8vhnpD0MbAt/u6X9dXcNoxHtQALOzoP9ne48gyY02+9h7RsIOkIJH6CmTs52mffPEF/eQdMl/t/
 aSOshuIDx+kvMA2yl2DdSmIqD7xDRF2OZqaTLGkz6AzQMGmFhcwmhsMI6FB+rS01suggrW8kjjl
 YiDPeD0BzXo80uBN5ujpcoEphZLZGyfgQILRVy4JUqiWa8Y4R2xVHUDOhyfsYtSjZ58AuPEp8Ci
 UrDsfFnTRpoabQLiiZ/eO3VlaeEptgaQcqwr5HcC/M4T/AbBk/Sf5jpBui4WFRto8tsp8W6mqZg
 21q9bShJ4a/cY9BAzxxKREEbhrNV0F/I7KB38AFn0Isv+tRtttPmCGG7GUs9uNKKrtJ8lnmUqcD
 YnUEZ8RMTAz9juAs1U4MTbMGopKvrg==
X-Proofpoint-ORIG-GUID: GoPxy534juLq3zFr8udVupbSLV4MW6he
X-Proofpoint-GUID: GoPxy534juLq3zFr8udVupbSLV4MW6he
X-Authority-Analysis: v=2.4 cv=edgwvrEH c=1 sm=1 tr=0 ts=6942d814 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=hmARNUlj3OVxZ3RlbIsQyw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=d0cN-5R3_aeRheYbsGEA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_03,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 adultscore=0 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170128

Move IPQ5018 PCIe devices from qcom,pcie.yaml binding to a dedicated
file to make reviewing and maintenance easier.

New schema is equivalent to the old one with few changes:
 - Adding a required compatible, which is actually redundant.
 - Drop the really obvious comments next to clock/reg/reset-names items.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/pci/qcom,pcie-ipq5018.yaml | 189 +++++++++++++++++++++
 .../devicetree/bindings/pci/qcom,pcie.yaml         |  50 ------
 2 files changed, 189 insertions(+), 50 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-ipq5018.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-ipq5018.yaml
new file mode 100644
index 000000000000..20c2c946f474
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie-ipq5018.yaml
@@ -0,0 +1,189 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pci/qcom,pcie-ipq5018.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm IPQ5018 PCI Express Root Complex
+
+maintainers:
+  - Bjorn Andersson <andersson@kernel.org>
+  - Manivannan Sadhasivam <mani@kernel.org>
+
+properties:
+  compatible:
+    enum:
+      - qcom,pcie-ipq5018
+
+  reg:
+    minItems: 5
+    maxItems: 6
+
+  reg-names:
+    minItems: 5
+    items:
+      - const: dbi
+      - const: elbi
+      - const: atu
+      - const: parf
+      - const: config
+      - const: mhi
+
+  clocks:
+    maxItems: 6
+
+  clock-names:
+    items:
+      - const: iface # PCIe to SysNOC BIU clock
+      - const: axi_m # AXI Master clock
+      - const: axi_s # AXI Slave clock
+      - const: ahb
+      - const: aux
+      - const: axi_bridge
+
+  interrupts:
+    maxItems: 9
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
+      - const: global
+
+  resets:
+    maxItems: 8
+
+  reset-names:
+    items:
+      - const: pipe
+      - const: sleep
+      - const: sticky # Core sticky reset
+      - const: axi_m # AXI master reset
+      - const: axi_s # AXI slave reset
+      - const: ahb
+      - const: axi_m_sticky # AXI master sticky reset
+      - const: axi_s_sticky # AXI slave sticky reset
+
+required:
+  - resets
+  - reset-names
+
+allOf:
+  - $ref: qcom,pcie-common.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,gcc-ipq5018.h>
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/reset/qcom,gcc-ipq5018.h>
+
+    pcie@a0000000 {
+        compatible = "qcom,pcie-ipq5018";
+        reg = <0xa0000000 0xf1d>,
+              <0xa0000f20 0xa8>,
+              <0xa0001000 0x1000>,
+              <0x00080000 0x3000>,
+              <0xa0100000 0x1000>,
+              <0x00083000 0x1000>;
+        reg-names = "dbi",
+                    "elbi",
+                    "atu",
+                    "parf",
+                    "config",
+                    "mhi";
+        ranges = <0x01000000 0 0x00000000 0xa0200000 0 0x00100000>,
+                 <0x02000000 0 0xa0300000 0xa0300000 0 0x10000000>;
+
+        device_type = "pci";
+        linux,pci-domain = <0>;
+        bus-range = <0x00 0xff>;
+        num-lanes = <2>;
+        #address-cells = <3>;
+        #size-cells = <2>;
+
+        /* The controller supports Gen3, but the connected PHY is Gen2-capable */
+        max-link-speed = <2>;
+
+        clocks = <&gcc GCC_SYS_NOC_PCIE0_AXI_CLK>,
+                 <&gcc GCC_PCIE0_AXI_M_CLK>,
+                 <&gcc GCC_PCIE0_AXI_S_CLK>,
+                 <&gcc GCC_PCIE0_AHB_CLK>,
+                 <&gcc GCC_PCIE0_AUX_CLK>,
+                 <&gcc GCC_PCIE0_AXI_S_BRIDGE_CLK>;
+        clock-names = "iface",
+                      "axi_m",
+                      "axi_s",
+                      "ahb",
+                      "aux",
+                      "axi_bridge";
+
+        msi-map = <0x0 &v2m0 0x0 0xff8>;
+
+        interrupts = <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "msi0",
+                          "msi1",
+                          "msi2",
+                          "msi3",
+                          "msi4",
+                          "msi5",
+                          "msi6",
+                          "msi7",
+                          "global";
+
+        #interrupt-cells = <1>;
+        interrupt-map-mask = <0 0 0 0x7>;
+        interrupt-map = <0 0 0 1 &intc 0 GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>,
+                        <0 0 0 2 &intc 0 GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>,
+                        <0 0 0 3 &intc 0 GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>,
+                        <0 0 0 4 &intc 0 GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
+
+        phys = <&pcie0_phy>;
+        phy-names = "pciephy";
+
+        resets = <&gcc GCC_PCIE0_PIPE_ARES>,
+                 <&gcc GCC_PCIE0_SLEEP_ARES>,
+                 <&gcc GCC_PCIE0_CORE_STICKY_ARES>,
+                 <&gcc GCC_PCIE0_AXI_MASTER_ARES>,
+                 <&gcc GCC_PCIE0_AXI_SLAVE_ARES>,
+                 <&gcc GCC_PCIE0_AHB_ARES>,
+                 <&gcc GCC_PCIE0_AXI_MASTER_STICKY_ARES>,
+                 <&gcc GCC_PCIE0_AXI_SLAVE_STICKY_ARES>;
+        reset-names = "pipe",
+                      "sleep",
+                      "sticky",
+                      "axi_m",
+                      "axi_s",
+                      "ahb",
+                      "axi_m_sticky",
+                      "axi_s_sticky";
+
+        perst-gpios = <&tlmm 15 GPIO_ACTIVE_LOW>;
+        wake-gpios = <&tlmm 16 GPIO_ACTIVE_LOW>;
+
+        pcie@0 {
+            device_type = "pci";
+            reg = <0x0 0x0 0x0 0x0 0x0>;
+            bus-range = <0x01 0xff>;
+
+            #address-cells = <3>;
+            #size-cells = <2>;
+            ranges;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
index db7d91d42af8..b448b8f07f55 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
@@ -21,7 +21,6 @@ properties:
           - qcom,pcie-apq8064
           - qcom,pcie-apq8084
           - qcom,pcie-ipq4019
-          - qcom,pcie-ipq5018
           - qcom,pcie-ipq6018
           - qcom,pcie-ipq8064
           - qcom,pcie-ipq8064-v2
@@ -165,7 +164,6 @@ allOf:
         compatible:
           contains:
             enum:
-              - qcom,pcie-ipq5018
               - qcom,pcie-ipq6018
               - qcom,pcie-ipq8074-gen3
               - qcom,pcie-ipq9574
@@ -300,53 +298,6 @@ allOf:
             - const: ahb # AHB reset
             - const: phy_ahb # PHY AHB reset
 
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - qcom,pcie-ipq5018
-    then:
-      properties:
-        clocks:
-          minItems: 6
-          maxItems: 6
-        clock-names:
-          items:
-            - const: iface # PCIe to SysNOC BIU clock
-            - const: axi_m # AXI Master clock
-            - const: axi_s # AXI Slave clock
-            - const: ahb # AHB clock
-            - const: aux # Auxiliary clock
-            - const: axi_bridge # AXI bridge clock
-        resets:
-          minItems: 8
-          maxItems: 8
-        reset-names:
-          items:
-            - const: pipe # PIPE reset
-            - const: sleep # Sleep reset
-            - const: sticky # Core sticky reset
-            - const: axi_m # AXI master reset
-            - const: axi_s # AXI slave reset
-            - const: ahb # AHB reset
-            - const: axi_m_sticky # AXI master sticky reset
-            - const: axi_s_sticky # AXI slave sticky reset
-        interrupts:
-          minItems: 9
-          maxItems: 9
-        interrupt-names:
-          items:
-            - const: msi0
-            - const: msi1
-            - const: msi2
-            - const: msi3
-            - const: msi4
-            - const: msi5
-            - const: msi6
-            - const: msi7
-            - const: global
-
   - if:
       properties:
         compatible:
@@ -489,7 +440,6 @@ allOf:
               enum:
                 - qcom,pcie-apq8064
                 - qcom,pcie-ipq4019
-                - qcom,pcie-ipq5018
                 - qcom,pcie-ipq8064
                 - qcom,pcie-ipq8064v2
                 - qcom,pcie-ipq8074

-- 
2.51.0


