Return-Path: <linux-arm-msm+bounces-56643-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 180DAAA8029
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 May 2025 12:41:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4383C9A0169
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 May 2025 10:40:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8311C1F30AD;
	Sat,  3 May 2025 10:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b="x40qW9sc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from box.trvn.ru (box.trvn.ru [45.141.101.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91EB61F09A8;
	Sat,  3 May 2025 10:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.141.101.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746268812; cv=none; b=hHUt5zUDU+enE42xMy58OvprdNWlIYR1dTcYuiOJGkFgD+16/Na8Y8TRNlWyQuSysufVLrKAJvQJDQDfLOhP0i5tj8OPTMqP2RCqVx/3+AcDl3YI/qt46CDXkCn7vJILjm/L264TkeKrBdpcLtmstpQuyVEKnNxk3IEPHRJRiB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746268812; c=relaxed/simple;
	bh=MPBTfFU0Xf6+ddYrvZbmg422nM4nFrs0KVb2QdwKdPM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OL9+HegKloffy2aXzZtwdig5AoPT3cn9udEAcG6RReWIogPhuT87t+x7Dviyz7L5mzdf/Do+lmF6wU/N/EpnGgDaOyT191jH+RRDZCC+w4Ch4EUVK3OTE23RrrMWiAOQR5d8mxGCdtOS6+YQPjlQYRwPJ/N6fnKh/Tig7v2EEeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trvn.ru; spf=pass smtp.mailfrom=trvn.ru; dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b=x40qW9sc; arc=none smtp.client-ip=45.141.101.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trvn.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trvn.ru
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=trvn.ru; s=mail;
	t=1746268805; bh=MPBTfFU0Xf6+ddYrvZbmg422nM4nFrs0KVb2QdwKdPM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=x40qW9scyazgae0RD1QfOkJ+hKsXZCv15vnFLCyext5SBtSearcvQNf0l8umX8Jlj
	 euZb70jcgTNkJHpE+Gj5eacs/phinBFLFLW+kIDaEDRGn9mWLa4SCJ+pWIciuJLSXn
	 vader/vvpsztV9VhGU/fUVlleQMGOQzYiKzJOT48UZxoF1ON/HCAau/rPqpMphuYAE
	 Ll8QE6VSFR76FdYOygWeD75T0u/Iuo/izUvNQh2uzwskPDGesJh/tbbJUzGBBH9z1C
	 GCcus8jvP2+J1cFZizpHtCW9//kZ9JX7pBLjetncy29udp6GnfolFEfKk0cH4KL1Un
	 J0eCNTrOTX/WA==
Received: from authenticated-user (box.trvn.ru [45.141.101.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by box.trvn.ru (Postfix) with ESMTPSA id DC6EBC99E;
	Sat,  3 May 2025 15:40:03 +0500 (+05)
From: Nikita Travkin <nikita@trvn.ru>
Date: Sat, 03 May 2025 15:39:32 +0500
Subject: [PATCH v2 5/5] arm64: dts: qcom: x1e/x1p: Add EL2 overlay for WoA
 devices
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250503-sc-el2-overlays-v2-5-24e9b4572e15@trvn.ru>
References: <20250503-sc-el2-overlays-v2-0-24e9b4572e15@trvn.ru>
In-Reply-To: <20250503-sc-el2-overlays-v2-0-24e9b4572e15@trvn.ru>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: Marc Zyngier <maz@kernel.org>, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Nikita Travkin <nikita@trvn.ru>
X-Developer-Signature: v=1; a=openpgp-sha256; l=6029; i=nikita@trvn.ru;
 h=from:subject:message-id; bh=MPBTfFU0Xf6+ddYrvZbmg422nM4nFrs0KVb2QdwKdPM=;
 b=owEBbQKS/ZANAwAIAUMc7O4oGb91AcsmYgBoFfJ7R9fCT2kh6+Q5ZE7r/8m/VnbY7MVlM3NbL
 qkXlvMvvkqJAjMEAAEIAB0WIQTAhK9UUj+qg34uxUdDHOzuKBm/dQUCaBXyewAKCRBDHOzuKBm/
 dbAHEACMiCFQWxv8glvEerRJrCWcSd87E9TDVPcY47/ED936iN2924VGIVnHHWf5fdYidw1s8fb
 YDN7LEIDWltCFMlva1Pk0H96cg9XFovfLjcmbwljTLCtQKXPa8IURzDJoOGrBHU5ublOANhw55B
 Ma6RAY9PZwL1TvohADrZOw6wa1zCaCHcEdWfzlubEL3LOmr/8xcvb9zR7f1uQSfPbHKXs4kfsDm
 YhHA3VEACeen16dv1+9XFaRKOcZtZDtKBfO3xjzcdFoLQp4AvRP23VVfmdyecciiCHVFaL6i+Zh
 20JaPfFAeBS0/UUI981PG6olu4lFTv4Z4HDIl9OxBbNKGE87bVFdVPQ3Pt+9S9KH2JhRJIb+afj
 VCxmlpNWOOyFGLP8QNh92PIsx/qwpuNT6xWwfvyVB1upOmHT36aCbWknIP/5FEtsLoUX1A5U3Pj
 93Mz9F4YIXAXDjzidjspsCJUIITlkAj6ONtFk8hk50IeLFVzVvMoNcOFUUpRRZqFWQfsfDpkyLS
 Axu05/9Oe5Kh1mgbc4zsYJnfWerXphFSYa5AfnQ97ZPGJw7i25EjeNjF0T7Np7DlxcWjjgl9GP1
 j/lpciJpaSk86NSZRVnCL1oH7ryNFRZOLZ+JOmDGuHnPBfA1KXBbM7p0gypNlyaRcSFUHpx08dS
 ox64w9apbIsYKlQ==
X-Developer-Key: i=nikita@trvn.ru; a=openpgp;
 fpr=C084AF54523FAA837E2EC547431CECEE2819BF75

WoA devices using x1e/x1p use android firmware to boot, which notably
includes Gunyah hypervisor. This means that, so far, Linux-based OS
could only boot in EL1 on those devices.

However Windows can replace Gunyah upon boot with it's own hypervisor,
and with the use of tools such as "slbounce", it's possible to do the
same for Linux-based OS, in which case some modifications to the DT are
necessary to facilitate the absence of Gunyah services.

Add a EL2-specific DT overlay and apply it to x1e/x1p WoA devices to
create -el2.dtb for each of them alongside "normal" dtb.

Signed-off-by: Nikita Travkin <nikita@trvn.ru>
---
 arch/arm64/boot/dts/qcom/Makefile      | 36 +++++++++++++++--------
 arch/arm64/boot/dts/qcom/x1-el2.dtso   | 52 ++++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/x1e80100.dtsi |  2 +-
 3 files changed, 77 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 12d9ed1129b4e83146e561910aca9fc3718b0820..4300b29397c6a0087e5c5909d756d733f308d373 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -299,15 +299,27 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-qrd.dtb
-dtb-$(CONFIG_ARCH_QCOM)	+= x1e001de-devkit.dtb
-dtb-$(CONFIG_ARCH_QCOM)	+= x1e78100-lenovo-thinkpad-t14s.dtb
-dtb-$(CONFIG_ARCH_QCOM)	+= x1e78100-lenovo-thinkpad-t14s-oled.dtb
-dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-asus-vivobook-s15.dtb
-dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-crd.dtb
-dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-dell-xps13-9345.dtb
-dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-hp-omnibook-x14.dtb
-dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-lenovo-yoga-slim7x.dtb
-dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-microsoft-romulus13.dtb
-dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-microsoft-romulus15.dtb
-dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-qcp.dtb
-dtb-$(CONFIG_ARCH_QCOM)	+= x1p42100-crd.dtb
+x1e001de-devkit-el2-dtbs	:= x1e001de-devkit.dtb x1-el2.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= x1e001de-devkit.dtb x1e001de-devkit-el2.dtb
+x1e78100-lenovo-thinkpad-t14s-el2-dtbs	:= x1e78100-lenovo-thinkpad-t14s.dtb x1-el2.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= x1e78100-lenovo-thinkpad-t14s.dtb x1e78100-lenovo-thinkpad-t14s-el2.dtb
+x1e78100-lenovo-thinkpad-t14s-oled-el2-dtbs	:= x1e78100-lenovo-thinkpad-t14s-oled.dtb x1-el2.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= x1e78100-lenovo-thinkpad-t14s-oled.dtb x1e78100-lenovo-thinkpad-t14s-oled-el2.dtb
+x1e80100-asus-vivobook-s15-el2-dtbs	:= x1e80100-asus-vivobook-s15.dtb x1-el2.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-asus-vivobook-s15.dtb x1e80100-asus-vivobook-s15-el2.dtb
+x1e80100-crd-el2-dtbs	:= x1e80100-crd.dtb x1-el2.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-crd.dtb x1e80100-crd-el2.dtb
+x1e80100-dell-xps13-9345-el2-dtbs	:= x1e80100-dell-xps13-9345.dtb x1-el2.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-dell-xps13-9345.dtb x1e80100-dell-xps13-9345-el2.dtb
+x1e80100-hp-omnibook-x14-el2-dtbs	:= x1e80100-hp-omnibook-x14.dtb x1-el2.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-hp-omnibook-x14.dtb x1e80100-hp-omnibook-x14-el2.dtb
+x1e80100-lenovo-yoga-slim7x-el2-dtbs	:= x1e80100-lenovo-yoga-slim7x.dtb x1-el2.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-lenovo-yoga-slim7x.dtb x1e80100-lenovo-yoga-slim7x-el2.dtb
+x1e80100-microsoft-romulus13-el2-dtbs	:= x1e80100-microsoft-romulus13.dtb x1-el2.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-microsoft-romulus13.dtb x1e80100-microsoft-romulus13-el2.dtb
+x1e80100-microsoft-romulus15-el2-dtbs	:= x1e80100-microsoft-romulus15.dtb x1-el2.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-microsoft-romulus15.dtb x1e80100-microsoft-romulus15-el2.dtb
+x1e80100-qcp-el2-dtbs	:= x1e80100-qcp.dtb x1-el2.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-qcp.dtb x1e80100-qcp-el2.dtb
+x1p42100-crd-el2-dtbs	:= x1p42100-crd.dtb x1-el2.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= x1p42100-crd.dtb x1p42100-crd-el2.dtb
diff --git a/arch/arm64/boot/dts/qcom/x1-el2.dtso b/arch/arm64/boot/dts/qcom/x1-el2.dtso
new file mode 100644
index 0000000000000000000000000000000000000000..380441deca65d1b443962fbe6151f4aadd918383
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/x1-el2.dtso
@@ -0,0 +1,52 @@
+// SPDX-License-Identifier: BSD-3-Clause
+
+/*
+ * x1 specific modifications required to boot in EL2.
+ */
+
+/dts-v1/;
+/plugin/;
+
+/* We can't and don't need to use zap shader in EL2 as linux can zap the gpu on it's own. */
+&gpu_zap_shader {
+	status = "disabled";
+};
+
+/*
+ * When running under Gunyah, this IOMMU is controlled by the firmware,
+ * however when we take ownership of it in EL2, we need to configure
+ * it properly to use PCIe.
+ *
+ * Additionally, it seems like ITS emulation in Gunyah is broken so we
+ * can't use MSI on some PCIe controllers in EL1. But we can add them
+ * here for EL2.
+ */
+&pcie3 {
+	iommu-map = <0 &pcie_smmu 0x30000 0x10000>;
+	msi-map = <0 &gic_its 0xb0000 0x10000>;
+};
+
+&pcie4 {
+	iommu-map = <0 &pcie_smmu 0x40000 0x10000>;
+};
+
+&pcie5 {
+	iommu-map = <0 &pcie_smmu 0x50000 0x10000>;
+	msi-map = <0 &gic_its 0xd0000 0x10000>;
+};
+
+&pcie6a {
+	iommu-map = <0 &pcie_smmu 0x60000 0x10000>;
+};
+
+&pcie_smmu {
+	status = "okay";
+};
+
+/*
+ * The "SBSA watchdog" is implemented in software in Gunyah
+ * and can't be used when running in EL2.
+ */
+&sbsa_watchdog {
+	status = "disabled";
+};
diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index 7a3e75294be545a719f3543a8b874900f7c78f99..c04a2615ca77629b27fbd6fd98f1a25a3b6697db 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -8163,7 +8163,7 @@ frame@1780d000 {
 			};
 		};
 
-		watchdog@1c840000 {
+		sbsa_watchdog: watchdog@1c840000 {
 			compatible = "arm,sbsa-gwdt";
 			reg = <0 0x1c840000 0 0x1000>,
 			      <0 0x1c850000 0 0x1000>;

-- 
2.49.0


