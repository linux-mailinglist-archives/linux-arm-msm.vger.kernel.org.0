Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C9743099BA
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 Jan 2021 02:41:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232538AbhAaBkU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 30 Jan 2021 20:40:20 -0500
Received: from m-r1.th.seeweb.it ([5.144.164.170]:48303 "EHLO
        m-r1.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232490AbhAaBkR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 30 Jan 2021 20:40:17 -0500
Received: from localhost.localdomain (abaf219.neoplus.adsl.tpnet.pl [83.6.169.219])
        by m-r1.th.seeweb.it (Postfix) with ESMTPA id 463FD1F70E;
        Sun, 31 Jan 2021 02:39:33 +0100 (CET)
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
To:     phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gustave Monce <gustave.monce@outlook.com>
Subject: [PATCH 06/18] arm64: dts: qcom: msm8994-octagon: Fix up the memory map
Date:   Sun, 31 Jan 2021 02:38:37 +0100
Message-Id: <20210131013853.55810-7-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210131013853.55810-1-konrad.dybcio@somainline.org>
References: <20210131013853.55810-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Gustave Monce <gustave.monce@outlook.com>

Windows-based devices have a far different memory map than
the standard LA one.

Signed-off-by: Gustave Monce <gustave.monce@outlook.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 .../dts/qcom/msm8994-msft-lumia-octagon.dtsi  | 166 ++++++++++++++++++
 1 file changed, 166 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi b/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi
index b9e3e7821cbc..ff06b2161b10 100644
--- a/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi
@@ -10,6 +10,19 @@
 #include "pm8994.dtsi"
 #include "pmi8994.dtsi"
 
+/*
+ * Delete all generic (msm8994.dtsi) reserved
+ * memory mappings which are different in this device.
+ */
+/delete-node/ &adsp_mem;
+/delete-node/ &audio_mem;
+/delete-node/ &cont_splash_mem;
+/delete-node/ &mba_mem;
+/delete-node/ &mpss_mem;
+/delete-node/ &peripheral_region;
+/delete-node/ &rmtfs_mem;
+/delete-node/ &smem_mem;
+
 / {
 	/*
 	 * Most Lumia 950/XL users use GRUB to load their kernels,
@@ -28,6 +41,159 @@ chosen {
 		#size-cells = <2>;
 		ranges;
 	};
+
+	reserved-memory {
+		/*
+		 * This device being a WP platform has a very different
+		 * memory layout than other Android based devices.
+		 * This memory layout is directly copied from the original
+		 * device UEFI firmware, and adapted based on observations
+		 * using JTAG for the Qualcomm Peripheral Image regions.
+		 */
+
+		uefi_mem: memory@200000 {
+			reg = <0 0x200000 0 0x100000>;
+			no-map;
+		};
+
+		mppark_mem: memory@300000 {
+			reg = <0 0x300000 0 0x80000>;
+			no-map;
+		};
+
+		fbpt_mem: memory@380000 {
+			reg = <0 0x380000 0 0x1000>;
+			no-map;
+		};
+
+		dbg2_mem: memory@381000 {
+			reg = <0 0x381000 0 0x4000>;
+			no-map;
+		};
+
+		capsule_mem: memory@385000 {
+			reg = <0 0x385000 0 0x1000>;
+			no-map;
+		};
+
+		tpmctrl_mem: memory@386000 {
+			reg = <0 0x386000 0 0x3000>;
+			no-map;
+		};
+
+		uefiinfo_mem: memory@389000 {
+			reg = <0 0x389000 0 0x1000>;
+			no-map;
+		};
+
+		reset_mem: memory@389000 {
+			reg = <0 0x389000 0 0x1000>;
+			no-map;
+		};
+
+		resuncached_mem: memory@38e000 {
+			reg = <0 0x38e000 0 0x72000>;
+			no-map;
+		};
+
+		disp_mem: memory@400000 {
+			reg = <0 0x400000 0 0x800000>;
+			no-map;
+		};
+
+		uefistack_mem: memory@c00000 {
+			reg = <0 0xc00000 0 0x40000>;
+			no-map;
+		};
+
+		cpuvect_mem: memory@c40000 {
+			reg = <0 0xc40000 0 0x10000>;
+			no-map;
+		};
+
+		rescached_mem: memory@400000 {
+			reg = <0 0xc50000 0 0xb0000>;
+			no-map;
+		};
+
+		tzapps_mem: memory@6500000 {
+			reg = <0 0x6500000 0 0x500000>;
+			no-map;
+		};
+
+		smem_mem: memory@6a00000 {
+			reg = <0 0x6a00000 0 0x200000>;
+			no-map;
+		};
+
+		hyp_mem: memory@6c00000 {
+			reg = <0 0x6c00000 0 0x100000>;
+			no-map;
+		};
+
+		tz_mem: memory@6d00000 {
+			reg = <0 0x6d00000 0 0x160000>;
+			no-map;
+		};
+
+		rfsa_adsp_mem: memory@6e60000 {
+			reg = <0 0x6e60000 0 0x10000>;
+			no-map;
+		};
+
+		rfsa_mpss_mem: memory@6e70000 {
+			compatible = "qcom,rmtfs-mem";
+			reg = <0 0x6e70000 0 0x10000>;
+			no-map;
+
+			qcom,client-id = <1>;
+		};
+
+		/*
+		 * Value obtained from the device original ACPI DSDT table
+		 * MPSS_EFS / SBL
+		 */
+		mba_mem: memory@6e80000 {
+			reg = <0 0x6e80000 0 0x180000>;
+			no-map;
+		};
+
+		/*
+		 * Peripheral Image loader region begin!
+		 * The region reserved for pil is 0x7000000-0xef00000
+		 */
+
+		mpss_mem: memory@7000000 {
+			reg = <0 0x7000000 0 0x5a00000>;
+			no-map;
+		};
+
+		adsp_mem: memory@ca00000 {
+			reg = <0 0xca00000 0 0x1800000>;
+			no-map;
+		};
+
+		venus_mem: memory@e200000 {
+			reg = <0 0xe200000 0 0x500000>;
+			no-map;
+		};
+
+		pil_metadata_mem: memory@e700000 {
+			reg = <0 0xe700000 0 0x4000>;
+			no-map;
+		};
+
+		memory@e704000 {
+			reg = <0 0xe704000 0 0x7fc000>;
+			no-map;
+		};
+		/* Peripheral Image loader region end */
+
+		cnss_mem: memory@ef00000 {
+			reg = <0 0xef00000 0 0x300000>;
+			no-map;
+		};
+	};
 };
 
 &blsp1_i2c1 {
-- 
2.30.0

