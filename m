Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C0903135063
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2020 01:26:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726654AbgAIA0Z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Jan 2020 19:26:25 -0500
Received: from onstation.org ([52.200.56.107]:53880 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726438AbgAIA0Z (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Jan 2020 19:26:25 -0500
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id 0E27B3EE6F;
        Thu,  9 Jan 2020 00:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1578529584;
        bh=bSP4GLHNIkw9HeeIY0NybAJJvEgnnxZaLRa3yG6+E1Q=;
        h=From:To:Cc:Subject:Date:From;
        b=TK7LNbfLzwC1F6wyfJLhAZh/bLnMAMGWyPQ+53Ef9F9qfGO8LdHQdNxZzdN/ApgLQ
         spnXD0HCF2D5BgqAqnzHtGmbgkilGBxb8HwbfZjcP8Jtx2F3pGL+IMEfcms3ov2jp4
         CwsIsk1ZiP73Lrd5/c1t4wIJrKy7VCeU3zbrKz+U=
From:   Brian Masney <masneyb@onstation.org>
To:     robdclark@gmail.com, bjorn.andersson@linaro.org
Cc:     agross@kernel.org, joro@8bytes.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH RFC] ARM: dts: qcom: msm8974: add mdp5 iommu support
Date:   Wed,  8 Jan 2020 19:26:06 -0500
Message-Id: <20200109002606.35653-1-masneyb@onstation.org>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This adds preliminary IOMMU support for the MDP5 on msm8974. It appears
that the qcom-iommu driver in upstream can be used on this SoC. I marked
this patch as a RFC since the frame buffer becomes corrupted when I boot
the Nexus 5 phone with this patch:

https://raw.githubusercontent.com/masneyb/nexus-5-upstream/master/images/broken-mdp5-iommu.jpg

A quick note about the ranges of the context banks below: Based on the
downstream sources, I believe that the memory addresses should be mapped
out like this:

	mdp_iommu: iommu@fd928000 {
		reg = <0xfd928000 0x8000>;
		ranges = <0 0xfd930000 0x8000>;
		...

		iommu-ctx@0 {
			reg = <0x0 0x1000>;
			...
		};

		iommu-ctx@1000 {
			reg = <0x1000 0x1000>;
			...
		};

		iommu-ctx@2000 {
			reg = <0x2000 0x1000>;
			...
		};
	};

However, the qcom-iommu driver in upstream expects the first context
bank to exist at address 0x1000, and the address space identifier
(asid) to be greater than 0. See get_asid() and qcom_iommu_of_xlate()
in the upstream qcom-iommu.c driver. I put in the patch below what the
driver expects. I modified the driver in my local tree to allow the
mapping that I have above so that the extra 0x1000 of memory is mapped
into the global address space and still experience the same screen
corruption issue.

Downstream MSM 3.4 IOMMU dts snippet for reference:
https://github.com/AICP/kernel_lge_hammerhead/blob/n7.1/arch/arm/boot/dts/msm-iommu-v1.dtsi#L110

I'm hoping that someone that's more familiar with this hardware has a
suggestion for something to try.

Signed-off-by: Brian Masney <masneyb@onstation.org>
---
 arch/arm/boot/dts/qcom-msm8974.dtsi | 44 +++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
index 4b161b809dd5..2515a3bd4aa7 100644
--- a/arch/arm/boot/dts/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
@@ -1305,6 +1305,46 @@ etm3_out: endpoint {
 			};
 		};
 
+		mdp_iommu: iommu@fd928000 {
+			compatible = "qcom,msm8974-iommu",
+			             "qcom,msm-iommu-v1";
+			reg = <0xfd928000 0x7000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			#iommu-cells = <1>;
+			ranges = <0 0xfd92f000 0x9000>;
+
+			clocks = <&mmcc MDSS_AHB_CLK>,
+			         <&mmcc MDSS_AXI_CLK>;
+			clock-names = "iface",
+			              "bus";
+
+			qcom,iommu-secure-id = <1>;
+
+			// mdp_0
+			iommu-ctx@1000 {
+				compatible = "qcom,msm-iommu-v1-ns";
+				reg = <0x1000 0x1000>;
+				interrupts = <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
+			// mdp_1
+			iommu-ctx@2000 {
+				compatible = "qcom,msm-iommu-v1-sec";
+				reg = <0x2000 0x1000>;
+				interrupts = <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>,
+				             <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
+			// mdp_2
+			iommu-ctx@3000 {
+				compatible = "qcom,msm-iommu-v1-sec";
+				reg = <0x3000 0x1000>;
+				interrupts = <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>,
+				             <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>;
+			};
+                };
+
 		ocmem@fdd00000 {
 			compatible = "qcom,msm8974-ocmem";
 			reg = <0xfdd00000 0x2000>,
@@ -1427,6 +1467,10 @@ mdp: mdp@fd900000 {
 				interconnects = <&mmssnoc MNOC_MAS_MDP_PORT0 &bimc BIMC_SLV_EBI_CH0>;
 				interconnect-names = "mdp0-mem";
 
+				iommus = <&mdp_iommu 1
+				          &mdp_iommu 2
+				          &mdp_iommu 3>;
+
 				ports {
 					#address-cells = <1>;
 					#size-cells = <0>;
-- 
2.24.1

