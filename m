Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 799D955E55
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2019 04:22:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726648AbfFZCW3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Jun 2019 22:22:29 -0400
Received: from onstation.org ([52.200.56.107]:46118 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726423AbfFZCWG (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Jun 2019 22:22:06 -0400
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id 49C903EE74;
        Wed, 26 Jun 2019 02:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1561515725;
        bh=OXpAhLy5srruCKMhwhvoAj0B2oecFMLNetfymmEW4Eg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Yu9N++HXluSC7if/HhprtF0gPOTHMDYHeTbWS5ufkbnJ8KHq1/Dqulfxkem//oKuJ
         F4co2TuaAO7Hweaeq8aCrNuEduy6I3QbId2O4f0J9nlxGmhSEcZSsnkKNvqo//RCbL
         PW33jIlHDDqjzJRe2YbQ4ntNpgTyXGDvklvU3g/k=
From:   Brian Masney <masneyb@onstation.org>
To:     agross@kernel.org, robdclark@gmail.com, sean@poorly.run,
        robh+dt@kernel.org, bjorn.andersson@linaro.org
Cc:     airlied@linux.ie, daniel@ffwll.ch, mark.rutland@arm.com,
        jonathan@marek.ca, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        jcrouse@codeaurora.org
Subject: [PATCH v3 2/6] dt-bindings: display: msm: gmu: add optional ocmem property
Date:   Tue, 25 Jun 2019 22:21:44 -0400
Message-Id: <20190626022148.23712-3-masneyb@onstation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190626022148.23712-1-masneyb@onstation.org>
References: <20190626022148.23712-1-masneyb@onstation.org>
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
Changes since v2:
- Add a3xx example with OCMEM

Changes since v1:
- None

 .../devicetree/bindings/display/msm/gmu.txt   | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/gmu.txt b/Documentation/devicetree/bindings/display/msm/gmu.txt
index 90af5b0a56a9..e5596994df7b 100644
--- a/Documentation/devicetree/bindings/display/msm/gmu.txt
+++ b/Documentation/devicetree/bindings/display/msm/gmu.txt
@@ -31,6 +31,10 @@ Required properties:
 - iommus: phandle to the adreno iommu
 - operating-points-v2: phandle to the OPP operating points
 
+Optional properties:
+- ocmem: phandle to the On Chip Memory (OCMEM) that's present on some Snapdragon
+         SoCs. See Documentation/devicetree/bindings/soc/qcom/qcom,ocmem.yaml.
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
+		ocmem = <&ocmem>;
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
2.20.1

