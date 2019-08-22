Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 27228996F9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Aug 2019 16:40:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389287AbfHVOha (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Aug 2019 10:37:30 -0400
Received: from onstation.org ([52.200.56.107]:46814 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728049AbfHVOh3 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Aug 2019 10:37:29 -0400
Received: from ins7386.localdomain (unknown [207.110.43.92])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id 95D533E99E;
        Thu, 22 Aug 2019 14:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1566484648;
        bh=Aq4BpuNxY324r2hl6SoSoEp3suUXUAW+4xkCx7xFQqE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Ayui5eYLmXme4OMchq1G+iaJuS0IHI1KuxTNuAl3acQ2n+LBEjAyaD2D/bHM4PuG+
         JApKyacgnyTMom9RxqQc5mcYpJJmMdxqzT9hLbJPz4VZaChNEhVVrMRj4hmTB2cElK
         pB1vZTqPbA44kGrQjltFiUFRmw0B2cPa4FwgFpsE=
From:   Brian Masney <masneyb@onstation.org>
To:     agross@kernel.org, robdclark@gmail.com, sean@poorly.run,
        robh+dt@kernel.org, bjorn.andersson@linaro.org
Cc:     airlied@linux.ie, daniel@ffwll.ch, mark.rutland@arm.com,
        jonathan@marek.ca, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        jcrouse@codeaurora.org
Subject: [PATCH v6 2/7] dt-bindings: display: msm: gmu: add optional ocmem property
Date:   Thu, 22 Aug 2019 07:36:58 -0700
Message-Id: <20190822143703.13030-3-masneyb@onstation.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190822143703.13030-1-masneyb@onstation.org>
References: <20190822143703.13030-1-masneyb@onstation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Some A3xx and A4xx Adreno GPUs do not have GMEM inside the GPU core and
must use the On Chip MEMory (OCMEM) in order to be functional. Add the
optional ocmem property to the Adreno Graphics Management Unit bindings.

Signed-off-by: Brian Masney <masneyb@onstation.org>
---
Changes since v5:
- rename ocmem property to sram to match what TI currently has.

Changes since v4:
- None

Changes since v3:
- correct link to qcom,ocmem.yaml

Changes since v2:
- Add a3xx example with OCMEM

Changes since v1:
- None

 .../devicetree/bindings/display/msm/gmu.txt   | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/gmu.txt b/Documentation/devicetree/bindings/display/msm/gmu.txt
index 90af5b0a56a9..2305a2aede5a 100644
--- a/Documentation/devicetree/bindings/display/msm/gmu.txt
+++ b/Documentation/devicetree/bindings/display/msm/gmu.txt
@@ -31,6 +31,10 @@ Required properties:
 - iommus: phandle to the adreno iommu
 - operating-points-v2: phandle to the OPP operating points
 
+Optional properties:
+- sram: phandle to the On Chip Memory (OCMEM) that's present on some Snapdragon
+        SoCs. See Documentation/devicetree/bindings/sram/qcom,ocmem.yaml.
+
 Example:
 
 / {
@@ -63,3 +67,49 @@ Example:
 		operating-points-v2 = <&gmu_opp_table>;
 	};
 };
+
+a3xx example with OCMEM support:
+
+/ {
+	...
+
+	gpu: adreno@fdb00000 {
+		compatible = "qcom,adreno-330.2",
+		             "qcom,adreno";
+		reg = <0xfdb00000 0x10000>;
+		reg-names = "kgsl_3d0_reg_memory";
+		interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "kgsl_3d0_irq";
+		clock-names = "core",
+		              "iface",
+		              "mem_iface";
+		clocks = <&mmcc OXILI_GFX3D_CLK>,
+		         <&mmcc OXILICX_AHB_CLK>,
+		         <&mmcc OXILICX_AXI_CLK>;
+		sram = <&ocmem>;
+		power-domains = <&mmcc OXILICX_GDSC>;
+		operating-points-v2 = <&gpu_opp_table>;
+		iommus = <&gpu_iommu 0>;
+	};
+
+	ocmem: ocmem@fdd00000 {
+		compatible = "qcom,msm8974-ocmem";
+
+		reg = <0xfdd00000 0x2000>,
+		      <0xfec00000 0x180000>;
+		reg-names = "ctrl",
+		             "mem";
+
+		clocks = <&rpmcc RPM_SMD_OCMEMGX_CLK>,
+		         <&mmcc OCMEMCX_OCMEMNOC_CLK>;
+		clock-names = "core",
+		              "iface";
+
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		gmu-sram@0 {
+			reg = <0x0 0x100000>;
+		};
+	};
+};
-- 
2.21.0

