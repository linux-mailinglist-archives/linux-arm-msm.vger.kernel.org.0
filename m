Return-Path: <linux-arm-msm+bounces-85561-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 99179CC8C5D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 17:29:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3F6BA30AC3DB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 16:19:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 264C033FE36;
	Wed, 17 Dec 2025 16:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pgcYrUT1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WtdtijWd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 043033491D5
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 16:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765988374; cv=none; b=J0w/vw3+KeGijjyI7vnSRkMcZyR5Vvistg+kzC/UrLWN4Um4iNwNRWTGhLEIrngQn4zB8y7pbRnPOCbm1LROJMu5mhjk/wnfDPGDRuf/dkQ6YKcouUt2c/1Hgv/pVJrKbmM1LjcfzOtpDxKHaPG1hgSG3pHQ9fYu9iSDWKQDhMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765988374; c=relaxed/simple;
	bh=5jy6pUocsOcDboYaHFYJ7u9mrr4iWYgI8qULuMPdMlg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iRv3QDYkhs5+acGWz5cZOMATnaEB790wGp3NyncEM3yMdpE3P1NMODPnS8j3jOhqSRv3O+eyT4OyFq2imzpPPuGPF/wfNPqugWbggPH2amLkLaN/1usiefMiu8g5KluBwAZEPeosOZ1OWRR/0qryZPvMLdLv0whWqIoaNTMz96o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pgcYrUT1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WtdtijWd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHCKoAu3000633
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 16:19:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k+y57+w2ydBiOeKADdi1XNCrcxy3SzZvnAdeJfUzeGM=; b=pgcYrUT1t3iR1zog
	sUUUfN5eKRF6fTGFvAMmCl/BH82zPxacq4vtgReZagz/PlEmxqSAXYYA06/nPmCC
	U45/Dk0TNR1yPRgzv3ZhFLRNMCWHUfYAjf0KpUckhnxcKaB7ofHUhI5FDpNhkDLq
	5EL+2UReaidBGH5PDPNi0NFcIBE88BbSXKi0LQpUCncLxZOZZLFOaSmFL34P64sM
	2smB9RknwUOJTC+qXdEI4bIRe7BSq1f3s3HJx7mRqtCFsHKX1ZECwGstZEMEDR7s
	Th5VXc44NTYKRwpg3PS/SAELVE8tBWnmXpJW6S+VATw+Ve6xo5YjSUIh+pg1TmrV
	5KFJZQ==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3n332ah3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 16:19:30 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-78ab0ef3673so93215377b3.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 08:19:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765988370; x=1766593170; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k+y57+w2ydBiOeKADdi1XNCrcxy3SzZvnAdeJfUzeGM=;
        b=WtdtijWdrVC4GRTfsV8yopCvJ8/+7jaQR5hT+oe7e8VWBvjUd9iw48xscsT7izRxLg
         5A1Nsw4V67ZonNuqggLGcn/zs9dRJRWNThYWj+PL4p/iL3gST/0vbSU/IOPJkt4vKEmF
         7ywl4OcK0opZTmUJY9bc/Xu/dBx4OGcoWfSVXmYCb756f2Go64MSGwnbNpQwj35EBwcx
         vGsxdszGB42YZnIYrYRUubILXYzispnBRMpZ2jxfrWqxRyJjtS3XHrv/nFXrlOCg+GMe
         Ay3TKb5DutsX/ArOzVDhZcITYAe0LLaX6Rt+f7/o/ayp2EvNq8oQftn1BlJKyFbhLRUh
         ZM0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765988370; x=1766593170;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=k+y57+w2ydBiOeKADdi1XNCrcxy3SzZvnAdeJfUzeGM=;
        b=g4v1JRjbyuAE6P168n9uyGT/vOYaYZHyWx3Akeb0syHX349c4NkZnVVCQmiVFDB+cy
         R8WorSYIyQm9bNuOZDc0cSy5ggbUaQqBWGb5OrgbN8VOfZsTc/gpCvUpf9w7HnhWdMu9
         aFNX3khLOBJFvCC0+PR0wOZhw5tsbEMa3+Swz3N/mOzAD16RkmF5z0rrd6l2hZOmaCXv
         R4iTqJjds2ku1AVxWxTMSLjR/dzK4FEMxPuz2ZJP6ioncY0cuDIS+XwoR2KIs7d//dzU
         m5g7k12De++OWYtcmqzZYOqPf8VKIFUl9nnmGSIMitKYmD0akFtWV7r4tds7SjwS4IIM
         mTRA==
X-Gm-Message-State: AOJu0YxP2EnpZ4JPmiBz+x4Co1IxdA1hHycASljfcQMKZZ2PXHlB6ETl
	zXZ/CbTbc9YiCdwwcjBRA0ZzRH5nzVUYtGY/XA9j+i3ixAOsRQWmHrwTzGK6EgJPoL8dMP+626+
	K1nTjE7Ef7bH6iFIv3GwP4CBXzb385ogOiwBPvfemQ+W8+H4lckqP+aBYf2bvqsa3QOrvwNdEhj
	gn
X-Gm-Gg: AY/fxX7dQvActL56gO3GTQpbvFjvUjdKNEmJntQrmcvLpJI1zVVSbMdOeYaCCJAuaMu
	LhMDbhJSq05rA50kW64YE6O1HUVJnWg+/4pPCHSOhnpwc5w3EfrzWG1mBNVRr/BUcoFe6IONXBt
	R2aFYeUg5gCDQAbfb25DY2Rc64Cxinnr6bYIjoJd+0UloVi6u/XuWq/2Rg1KkJmX3gkqNlzO/Fx
	zYCcAxuoN1C8q84+0u0xSftHYodceBPU4VAuBqX7kIIlTlGVdHsy7/WBnKI/+Vhv4Mz8HV76aN7
	MKpTO13ZyEiJIeHHUinYYCgKZRFejotfR9tPi/NVNfDR2Em5NI/Onnl8TbR4EG5GKaUVo+VRWFE
	SewjeMwvZXP1zbORTYBTulQrGBiYLUdQS
X-Received: by 2002:a05:690c:630a:b0:78f:8d3b:1aa5 with SMTP id 00721157ae682-78f8d3b2203mr42463527b3.36.1765988369878;
        Wed, 17 Dec 2025 08:19:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEOWpWXsM6y9ara3AXwPvX66XCAmIgVClGcxK594sAwkw48RyVF0iW4mVrrcCW5HkHebpMKUg==
X-Received: by 2002:a05:690c:630a:b0:78f:8d3b:1aa5 with SMTP id 00721157ae682-78f8d3b2203mr42463167b3.36.1765988369239;
        Wed, 17 Dec 2025 08:19:29 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7cfa29be92sm1987868666b.10.2025.12.17.08.19.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 08:19:28 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 17 Dec 2025 17:19:10 +0100
Subject: [PATCH v2 04/12] dt-bindings: PCI: qcom,pcie-qcs404: Move QCS404
 to dedicated schema
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251217-dt-bindings-pci-qcom-v2-4-873721599754@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6948;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=5jy6pUocsOcDboYaHFYJ7u9mrr4iWYgI8qULuMPdMlg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpQtf/8wTTVCNj4octtmgeym/q7H5Ge3YxDt4+U
 jWQQT2sMY2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaULX/wAKCRDBN2bmhouD
 18ewD/9YgvokU2D9BFpzzVq1CctSbrwe2IVET1DT6Dov9JPrGsVSha7dO9jxSD9ze6z7y3WJCfc
 PL52WsbiIMu/Y2w6p1ioAJER5L/cAd5kmcrZJvskQ4wRawISJSZfY4XhrdRIQ3PbyO+0EDY3VRn
 qKfPdE0NlJ1WLkKJLz4hXfj2Xf/+bvIj8/tCQVXgjpMkFj9wd+zE5hrzjvsKqWzfJvInhFSn2vW
 yTs2FRpQNcwwiGYiqjZwE/XNNbGQfdKn0WcRPlqxUmgIZ2Xvag14hgSxuWona++DsPYxDnh6qIA
 vF17YDo5pM7AaHXM7wSmZUgyO/bkQLi7NxvElR5XzMBYUY9cfzJbTSymBkExdKOqCNF9WrNQr80
 uJQLD3J/iKNdqcEB7QIp2j0IsBDAWtYH42EqoYuKauvmq9sbgo2nyKiUwdBi3A1APyDDtKpDytK
 1LrYKVfoe7fqxTimFaf83kSxvyHRjjUw7BpmNWlZhjy83PB0eGjXiya4KJ0hE2++TxyuAx6T54Z
 MMYG4cxaPNO5Bnfa2bJhiB9Kcd068fWyF5b2IPAtkcWCCmWdSNCDA69Z6He50Af6Gsgl5AKmMNZ
 b78AdU25VPnjP144TzgeeruDBXIdRsOv4H+RnTrkpRb227IrQYb0hhadmG04fuFMRXpxulwS5nU
 nX6anpwpRLEeZ6Q==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDEyOCBTYWx0ZWRfXx4Gx5DZauHx+
 UN7RMRJzSsn4zFMXsWKshBWWOlz2/rI6Z3YO9lWiZ7c3yxW9N9gsOOb3sYrr3LBt4oj0EypApW1
 jSCw1CgsIJDCbhCsCfq05Zi6qN/yQEgL3l9LmjXlWkF6zytk7aBk2V11JmCPflhxV6cLKpwZW42
 +awVy16SjPVScHWnnsUX0eDRnc+KRnAyT08MmlepyR0uBTI3IMGY0SLf79ZY/0V3ci3NOEOQgg6
 Ucu9YsHj3OnGRJUXBXJT0zB8FSNa7ZLdyV8iRSYDUJAzoer6srdooHad8X6ETDM/4zXBGFF/gU0
 sXGO4lM1dkgvTBPA9hfUVEKvjhzP+r2k+SjyoJABqrANq16ohDdMetFeJDVTv9LDmG8aOGgT2yu
 iNUjRWvYwGN0+lnKCZYSH4TDZ8cbGg==
X-Proofpoint-GUID: mLGP5A9AgFH4L_FH9lo-53oOKs5aGMxY
X-Proofpoint-ORIG-GUID: mLGP5A9AgFH4L_FH9lo-53oOKs5aGMxY
X-Authority-Analysis: v=2.4 cv=U82fzOru c=1 sm=1 tr=0 ts=6942d812 cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=hmARNUlj3OVxZ3RlbIsQyw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=EisBvoLQgbKCbwdZyrgA:9 a=QEXdDO2ut3YA:10 a=kA6IBgd4cpdPkAWqgNAz:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_03,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170128

Move QCS404 PCIe devices from qcom,pcie.yaml binding to a dedicated file
to make reviewing and maintenance easier.

New schema is equivalent to the old one with few changes:
 - Adding a required compatible, which is actually redundant.
 - Drop the really obvious comments next to clock/reg/reset-names items.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/pci/qcom,pcie-qcs404.yaml  | 131 +++++++++++++++++++++
 .../devicetree/bindings/pci/qcom,pcie.yaml         |  33 ------
 2 files changed, 131 insertions(+), 33 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-qcs404.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-qcs404.yaml
new file mode 100644
index 000000000000..99b3ed43b87c
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie-qcs404.yaml
@@ -0,0 +1,131 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pci/qcom,pcie-qcs404.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm QCS404 PCI Express Root Complex
+
+maintainers:
+  - Bjorn Andersson <andersson@kernel.org>
+  - Manivannan Sadhasivam <mani@kernel.org>
+
+properties:
+  compatible:
+    enum:
+      - qcom,pcie-qcs404
+
+  reg:
+    maxItems: 4
+
+  reg-names:
+    items:
+      - const: dbi
+      - const: elbi
+      - const: parf
+      - const: config
+
+  clocks:
+    maxItems: 4
+
+  clock-names:
+    items:
+      - const: iface # AHB clock
+      - const: aux
+      - const: master_bus # AXI Master clock
+      - const: slave_bus # AXI Slave clock
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-names:
+    items:
+      - const: msi
+
+  resets:
+    maxItems: 6
+
+  reset-names:
+    items:
+      - const: axi_m # AXI Master reset
+      - const: axi_s # AXI Slave reset
+      - const: axi_m_sticky # AXI Master Sticky reset
+      - const: pipe_sticky
+      - const: pwr
+      - const: ahb
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
+    #include <dt-bindings/clock/qcom,gcc-qcs404.h>
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    pcie@10000000 {
+        compatible = "qcom,pcie-qcs404";
+        reg = <0x10000000 0xf1d>,
+              <0x10000f20 0xa8>,
+              <0x07780000 0x2000>,
+              <0x10001000 0x2000>;
+        reg-names = "dbi", "elbi", "parf", "config";
+        ranges = <0x81000000 0x0 0x00000000 0x10003000 0x0 0x00010000>, /* I/O */
+                 <0x82000000 0x0 0x10013000 0x10013000 0x0 0x007ed000>; /* memory */
+
+        device_type = "pci";
+        linux,pci-domain = <0>;
+        bus-range = <0x00 0xff>;
+        num-lanes = <1>;
+        #address-cells = <3>;
+        #size-cells = <2>;
+
+        clocks = <&gcc GCC_PCIE_0_CFG_AHB_CLK>,
+                 <&gcc GCC_PCIE_0_AUX_CLK>,
+                 <&gcc GCC_PCIE_0_MSTR_AXI_CLK>,
+                 <&gcc GCC_PCIE_0_SLV_AXI_CLK>;
+        clock-names = "iface", "aux", "master_bus", "slave_bus";
+
+        interrupts = <GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "msi";
+        #interrupt-cells = <1>;
+        interrupt-map-mask = <0 0 0 0x7>;
+        interrupt-map = <0 0 0 1 &intc GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
+                        <0 0 0 2 &intc GIC_SPI 224 IRQ_TYPE_LEVEL_HIGH>, /* int_b */
+                        <0 0 0 3 &intc GIC_SPI 267 IRQ_TYPE_LEVEL_HIGH>, /* int_c */
+                        <0 0 0 4 &intc GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>; /* int_d */
+
+        phys = <&pcie_phy>;
+        phy-names = "pciephy";
+
+        perst-gpios = <&tlmm 43 GPIO_ACTIVE_LOW>;
+
+        resets = <&gcc GCC_PCIE_0_AXI_MASTER_ARES>,
+                 <&gcc GCC_PCIE_0_AXI_SLAVE_ARES>,
+                 <&gcc GCC_PCIE_0_AXI_MASTER_STICKY_ARES>,
+                 <&gcc GCC_PCIE_0_CORE_STICKY_ARES>,
+                 <&gcc GCC_PCIE_0_BCR>,
+                 <&gcc GCC_PCIE_0_AHB_ARES>;
+        reset-names = "axi_m",
+                      "axi_s",
+                      "axi_m_sticky",
+                      "pipe_sticky",
+                      "pwr",
+                      "ahb";
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
index 0a3ce5a46372..db7d91d42af8 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
@@ -29,7 +29,6 @@ properties:
           - qcom,pcie-ipq8074-gen3
           - qcom,pcie-ipq9574
           - qcom,pcie-msm8996
-          - qcom,pcie-qcs404
       - items:
           - enum:
               - qcom,pcie-ipq5332
@@ -149,7 +148,6 @@ allOf:
               - qcom,pcie-ipq8064
               - qcom,pcie-ipq8064v2
               - qcom,pcie-ipq8074
-              - qcom,pcie-qcs404
     then:
       properties:
         reg:
@@ -483,35 +481,6 @@ allOf:
             - const: msi7
             - const: global
 
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - qcom,pcie-qcs404
-    then:
-      properties:
-        clocks:
-          minItems: 4
-          maxItems: 4
-        clock-names:
-          items:
-            - const: iface # AHB clock
-            - const: aux # Auxiliary clock
-            - const: master_bus # AXI Master clock
-            - const: slave_bus # AXI Slave clock
-        resets:
-          minItems: 6
-          maxItems: 6
-        reset-names:
-          items:
-            - const: axi_m # AXI Master reset
-            - const: axi_s # AXI Slave reset
-            - const: axi_m_sticky # AXI Master Sticky reset
-            - const: pipe_sticky # PIPE sticky reset
-            - const: pwr # PWR reset
-            - const: ahb # AHB reset
-
   - if:
       not:
         properties:
@@ -526,7 +495,6 @@ allOf:
                 - qcom,pcie-ipq8074
                 - qcom,pcie-ipq8074-gen3
                 - qcom,pcie-ipq9574
-                - qcom,pcie-qcs404
     then:
       required:
         - power-domains
@@ -588,7 +556,6 @@ allOf:
               - qcom,pcie-ipq4019
               - qcom,pcie-ipq8064
               - qcom,pcie-ipq8064-v2
-              - qcom,pcie-qcs404
     then:
       properties:
         interrupts:

-- 
2.51.0


