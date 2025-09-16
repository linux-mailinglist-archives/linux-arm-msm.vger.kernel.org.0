Return-Path: <linux-arm-msm+bounces-73799-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1720AB5A1D2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 22:07:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A4D8C173B3F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 20:07:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6932B2C0268;
	Tue, 16 Sep 2025 20:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pKntb37w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B1B21FF55;
	Tue, 16 Sep 2025 20:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758053227; cv=none; b=G2NBaN/xXaK5eow4U4oTFyM2a5TX6o2PH55f5Znlc8ceDgmioIy5bJ6vW4NJjxMKDRFPX989xTPfeITdkcufgh/erG7YZ8pMqAsKBj4AM8ZTvhk7ojuDMUFqZf6M6IH68lnmWxrp2hLbPS+wuI6fApS1kNMhlrg0EkTDdY9iU5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758053227; c=relaxed/simple;
	bh=82ODHO+ZHstBJ3tXU3RRL74ckaZe2VyLF/nSIFdDBC8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=j1Ko12bceJ/jepiswCtdCPMR0DS0NuMjujsTQbQvEp6qG0GF38nNCW07aJ+TWQGnFOWijSVUZyzR3X62YZ3R3zssCLpCfzhnQc5W9ND5lKc3UbcIXMdhOuPtDS3RKJbHf1gO0Iq9yl00Zf1CDrLeGW8cd9+iEodM3iQ2kV3ir2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pKntb37w; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 778CEC4CEEB;
	Tue, 16 Sep 2025 20:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758053227;
	bh=82ODHO+ZHstBJ3tXU3RRL74ckaZe2VyLF/nSIFdDBC8=;
	h=From:Date:Subject:To:Cc:From;
	b=pKntb37wA+2URaeTKiVR+RnQbI2WbfCKz730Q24GL5W0vJAHW42XiP1iyQNsV5T+6
	 ADqKBCXgAwUQzapNWsEOQvIieUu7bDStup/B+aA88AQm+NGYVe0Se0jCG6UTFk5SRd
	 /TqGnSXlUZAhuiBMZTIV+qvYWYb8pkGvwfCT/33LrRmmOd4zn7iiaHP2JDHgMsl3hE
	 Py5lO1/tecsKMj1vons8Z7ae4eHkOj5mo2/iov7y4ToQxTGsVyi1rmKquWyq9CMyBa
	 hj0rg3Nj7K9YikoDJ4MlhQVpBEY8yVRPiw/tXnuUS5Qi6uYHcp/ERnVEwgJLdz1BJ6
	 QQYHlXzHkpsgQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Tue, 16 Sep 2025 22:06:01 +0200
Subject: [PATCH RFC] dt-bindings: thunderbolt: Add Qualcomm USB4 Host
 Router
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250916-topic-qcom_usb4_bindings-v1-1-943ecb2c0fa7@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIACjDyWgC/x3MSwqDMBRG4a3IHRvIwxZ1KyKi8a+9AxPNbUtB3
 LvB4Tc45yBBYgi1xUEJPxaOIcOUBfn3GBYonrPJavvQjXmqT9zYq93HdfjKVA0Th5nDIsqhdrB
 WNzCgnG8JL/7f664/zwtboI2GagAAAA==
X-Change-ID: 20250916-topic-qcom_usb4_bindings-3e83e2209e1e
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, 
 Wesley Cheng <quic_wcheng@quicinc.com>, Jack Pham <quic_jackp@quicinc.com>, 
 Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Mayank Rana <mayank.rana@oss.qualcomm.com>, 
 Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Andreas Noever <andreas.noever@gmail.com>, 
 Mika Westerberg <westeri@kernel.org>, 
 Yehezkel Bernat <YehezkelShB@gmail.com>, linux-usb@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758053222; l=10454;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=7i8SYua4P42R+C99GKv8GP2AAHRi2AKDbV2qgnnCITg=;
 b=LoBP/bKbJzR7Kyy+IEwJNJ/xwVx2S+enbDx0KSUpbMST4m+/tWbYApZeIlW5t7WCTO37b1FXh
 kavzL8gNx8LCzFFtYX5Ds/d4zNiD1E1m9c8CdT6Y2cn4fKJj6g2O76h
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Several Qualcomm platforms feature an in-house Host Router IP block,
which enables USB4 and Thunderbolt 3 functionality. It implements the
common NHI interface, allowing for easier integration with existing
Thunderbolt driver implementations.

The Host Router features a microcontroller (with loadable firmware),
which takes care of detecting and acting upon plug events, initiating
high-speed link establishment or performing HW power management
operations.

Each instance is connected to a single USB3.x host, a PCIe RC and a
DisplayPort controller through a fitting Protocol Adapter, allowing
for the tunneling of the respective protocols between the USB4/TBT3
device and the on-SoC controller.

Describe the block, as present on the X1E family of SoCs, where it
implements the USB4v1 standard.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Hello!

This is our stab at USB4/Thunderbolt dt-bindings.

This submission, as stated in the commit message, describes our USB4
Host Router block, which is roughly the same class of hardware that you
can find on add-in PCIe cards aimed at x86 machines.

This specific patch is NOT supposed to be merged, since the bindings
may still ever so slightly change, as we continue work on the driver
(i.e. it's still possible that we omitted some resource).

It is however published early to create grounds for a discussion.
This is the first bring-up of USB4/TBT3 on a DT platform, so this
binding is likely going to influence all subsequent submissions. I've
added various DT and TBT folks to the recipient list to make everyone
aware of any decisions we settle on.

Comments very welcome!

P.S.
The driver part (which has quite some dependencies) is not yet 100%
ready to share and will be published at a later date.
---
 .../bindings/thunderbolt/qcom,usb4-hr.yaml         | 263 +++++++++++++++++++++
 MAINTAINERS                                        |   1 +
 2 files changed, 264 insertions(+)

diff --git a/Documentation/devicetree/bindings/thunderbolt/qcom,usb4-hr.yaml b/Documentation/devicetree/bindings/thunderbolt/qcom,usb4-hr.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..1cf3d083c6129a492010a4b98fea0e8dec9746cf
--- /dev/null
+++ b/Documentation/devicetree/bindings/thunderbolt/qcom,usb4-hr.yaml
@@ -0,0 +1,263 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/thunderbolt/qcom,usb4-hr.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm USB4 Host Router
+
+maintainers:
+  - Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
+
+description:
+  The Qualcomm USB4 Host Router IP block implements the NHI standard
+  as described in the USB4 specification.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - qcom,x1e80100-usb4-hr # USB4v1
+      - const: qcom,usb4-hr
+
+  reg:
+    maxItems: 17
+
+  reg-names:
+    items:
+      - const: router
+      - const: router_config
+      - const: tmu_config
+      - const: port_group
+      - const: sideband
+      - const: uc_ram
+      - const: uc_per
+      - const: uc_mbox
+      - const: nhi
+      - const: cfg
+      - const: debug
+      - const: usbap_config
+      - const: pcieap_config
+      - const: dpap0_aux
+      - const: dpap0_config
+      - const: dpap1_aux
+      - const: dpap1_config
+
+  interrupts:
+    items:
+      - description: Combined event interrupt for all three rings
+      - description: OOB Firmware interrupt
+
+  interrupt-names:
+    items:
+      - const: ring
+      - const: fw
+
+  clocks:
+    maxItems: 10
+
+  clock-names:
+    items:
+      - const: sys
+      - const: tmu
+      - const: ahb
+      - const: axi
+      - const: master
+      - const: phy_rx0
+      - const: phy_rx1
+      - const: sb
+      - const: dp0
+      - const: dp1
+
+  resets:
+    maxItems: 13
+
+  reset-names:
+    items:
+      - const: core
+      - const: phy_nocsr
+      - const: sys
+      - const: rx0
+      - const: rx1
+      - const: usb_pipe
+      - const: pcie_pipe
+      - const: tmu
+      - const: sideband_iface
+      - const: hia_master
+      - const: ahb
+      - const: dp0
+      - const: dp1
+
+  power-domains:
+    maxItems: 1
+
+  required-opps:
+    maxItems: 1
+
+  phys:
+    maxItems: 1
+
+  phy-names:
+    const: usb4
+
+  iommus:
+    maxItems: 1
+
+  interconnects:
+    maxItems: 2
+
+  interconnect-names:
+    items:
+      - const: usb4-ddr
+      - const: apps-usb4
+
+  mode-switch: true
+
+  wakeup-source: true
+
+allOf:
+  - $ref: /schemas/usb/usb-switch.yaml#
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - interrupt-names
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - power-domains
+  - phys
+  - phy-names
+  - iommus
+  - interconnects
+  - interconnect-names
+  - mode-switch
+  - port
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,x1e80100-gcc.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        usb4_router0: usb4-host-router@15600000 {
+            compatible = "qcom,x1e80100-usb4-hr",
+                         "qcom,usb4-hr";
+            reg = <0x0 0x15600000 0x0 0x8000>,
+                  <0x0 0x15608000 0x0 0x70>,
+                  <0x0 0x15608070 0x0 0x500>,
+                  <0x0 0x1560d000 0x0 0x1000>,
+                  <0x0 0x15612000 0x0 0x1000>,
+                  <0x0 0x15613000 0x0 0xe000>,
+                  <0x0 0x15621000 0x0 0x2000>,
+                  <0x0 0x15623000 0x0 0x2000>,
+                  <0x0 0x1563f000 0x0 0x40000>,
+                  <0x0 0x1567f000 0x0 0x1000>,
+                  <0x0 0x15680000 0x0 0x1000>,
+                  <0x0 0x15681000 0x0 0x1000>,
+                  <0x0 0x15682000 0x0 0x1000>,
+                  <0x0 0x15683000 0x0 0x1000>,
+                  <0x0 0x15685000 0x0 0x1000>,
+                  <0x0 0x15686000 0x0 0x1000>,
+                  <0x0 0x15688000 0x0 0x1000>;
+            reg-names = "router",
+                        "router_config",
+                        "tmu_config",
+                        "port_group",
+                        "sideband",
+                        "uc_ram",
+                        "uc_per",
+                        "uc_mbox",
+                        "nhi",
+                        "cfg",
+                        "debug",
+                        "usbap_config",
+                        "pcieap_config",
+                        "dpap0_aux",
+                        "dpap0_config",
+                        "dpap1_aux",
+                        "dpap1_config";
+
+            interrupts = <GIC_SPI 472 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 579 IRQ_TYPE_LEVEL_HIGH>;
+            interrupt-names = "ring",
+                              "fw";
+
+            clocks = <&gcc_usb4_0_sys_clk>,
+                     <&gcc_usb4_0_tmu_clk>,
+                     <&gcc_usb4_0_cfg_ahb_clk>,
+                     <&gcc_aggre_usb4_0_axi_clk>,
+                     <&gcc_usb4_0_master_clk>,
+                     <&gcc_usb4_0_phy_rx0_clk>,
+                     <&gcc_usb4_0_phy_rx1_clk>,
+                     <&gcc_usb4_0_sb_if_clk>,
+                     <&gcc_usb4_0_dp0_clk>,
+                     <&gcc_usb4_0_dp1_clk>;
+            clock-names = "sys",
+                          "tmu",
+                          "ahb",
+                          "axi",
+                          "master",
+                          "phy_rx0",
+                          "phy_rx1",
+                          "sb",
+                          "dp0",
+                          "dp1";
+
+            resets = <&gcc_usb4_0_bcr>,
+                     <&gcc_usb4phy_phy_prim_bcr>,
+                     <&gcc_usb4_0_misc_usb4_sys_bcr>,
+                     <&gcc_usb4_0_misc_rx_clk_0_bcr>,
+                     <&gcc_usb4_0_misc_rx_clk_1_bcr>,
+                     <&gcc_usb4_0_misc_usb_pipe_bcr>,
+                     <&gcc_usb4_0_misc_pcie_pipe_bcr>,
+                     <&gcc_usb4_0_misc_tmu_bcr>,
+                     <&gcc_usb4_0_misc_sb_if_bcr>,
+                     <&gcc_usb4_0_misc_hia_mstr_bcr>,
+                     <&gcc_usb4_0_misc_ahb_bcr>,
+                     <&gcc_usb4_0_misc_dp0_max_pclk_bcr>,
+                     <&gcc_usb4_0_misc_dp1_max_pclk_bcr>;
+            reset-names = "core",
+                          "phy_nocsr",
+                          "sys",
+                          "rx0",
+                          "rx1",
+                          "usb_pipe",
+                          "pcie_pipe",
+                          "tmu",
+                          "sideband_iface",
+                          "hia_master",
+                          "ahb",
+                          "dp0",
+                          "dp1";
+
+            power-domains = <&gcc GCC_USB4_0_GDSC>;
+
+            phys = <&usb4_phy>;
+            phy-names = "usb4";
+
+            iommus = <&apps_smmu 0x1440 0x0>;
+
+            interconnects = <&icc0 &icc1>,
+                            <&icc2 &icc3>;
+            interconnect-names = "usb4-ddr",
+                                 "apps-usb4";
+
+            mode-switch;
+
+            port {
+                usb4_0_mode_in: endpoint {
+                };
+            };
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 9da37c8dee69de9421d4f70906b4e623a442d171..b607f0a66f953fb1ea72e3405820288850004dfe 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25428,6 +25428,7 @@ L:	linux-usb@vger.kernel.org
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git
 F:	Documentation/admin-guide/thunderbolt.rst
+F:	Documentation/devicetree/bindings/thunderbolt/
 F:	drivers/thunderbolt/
 F:	include/linux/thunderbolt.h
 

---
base-commit: 05af764719214d6568adb55c8749dec295228da8
change-id: 20250916-topic-qcom_usb4_bindings-3e83e2209e1e

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


