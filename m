Return-Path: <linux-arm-msm+bounces-56384-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA109AA620F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 May 2025 19:06:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DD8D917E6FE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 May 2025 17:04:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 909972144CF;
	Thu,  1 May 2025 17:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b="TykRutXo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from box.trvn.ru (box.trvn.ru [45.141.101.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0BC020AF98;
	Thu,  1 May 2025 17:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.141.101.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746119059; cv=none; b=Dp/DAbjadQ+/g16YUB/QdKkDoIC0cJ2wf55RnWTjuMMt2/R24BLlk1wCNM9Wdk9OxXrngFrvAGeIyS8s/D+sFMkoFMxgC5Y6A6jseUaZTuu7LqpW1iPfWv7pjpcGNavbuXMwVOQbifqe38/cDo1qjCAVJAtcYZE0O2XjMCC6MoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746119059; c=relaxed/simple;
	bh=v5SDWro0TJzIb2mbIpfFToKsFwnljBb/D4Hlq7DtHY4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tsP49OKKa4fPCg/LsDn2VpqQSc2fQIqnrEXG1rKw+J3BDNshyUR5cpmmznoMHYfF1HYztokt4VWsgEPG0M1vHxVp8NmRmnyADgHAO9valIqi4htiyiTgm9rv5c1Uk5IPpfOHAnyRdv3M22YYobj/y6kQU3eTABkF0ZToIz4CKFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trvn.ru; spf=pass smtp.mailfrom=trvn.ru; dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b=TykRutXo; arc=none smtp.client-ip=45.141.101.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trvn.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trvn.ru
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=trvn.ru; s=mail;
	t=1746119052; bh=v5SDWro0TJzIb2mbIpfFToKsFwnljBb/D4Hlq7DtHY4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=TykRutXoTftdPWC5AqQ+dnTPB4m2frxrHruTzUXPsGTDp5NTQ9wnLs47zMU9bX+4o
	 wdI9vAXScoTPiqKblPdgkBYFRlsSp5I8PE9l5b1vU4Jk/4IUlZtnYWT5J7t0Q0uGkE
	 hzseSfydKw7+t9ovTKtHoT/wl43jCnDEgEgrpSVPrdY4VPA7drE/+mh/dzfcNAR2mw
	 YgIrEK6Tf2mgd8ctNqfdaywxJGS7zPejyYg9eAlnVQG7FO0nLwnR4XYHFOH7fsRVjo
	 xoOFzEypXnrT/S8DYh6GgcwFAQMmHvy6A2masl0DiI8j/RsZ2R/D3/oekzFCYlYSKh
	 qzdwKSJhnDqNw==
Received: from authenticated-user (box.trvn.ru [45.141.101.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by box.trvn.ru (Postfix) with ESMTPSA id AF330C90B;
	Thu,  1 May 2025 22:04:11 +0500 (+05)
From: Nikita Travkin <nikita@trvn.ru>
Date: Thu, 01 May 2025 22:03:45 +0500
Subject: [PATCH 5/5] arm64: dts: qcom: x1e/x1p: Add EL2 overlay for WoA
 devices
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250501-sc-el2-overlays-v1-5-9202e59e3348@trvn.ru>
References: <20250501-sc-el2-overlays-v1-0-9202e59e3348@trvn.ru>
In-Reply-To: <20250501-sc-el2-overlays-v1-0-9202e59e3348@trvn.ru>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: Marc Zyngier <maz@kernel.org>, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Nikita Travkin <nikita@trvn.ru>
X-Developer-Signature: v=1; a=openpgp-sha256; l=5777; i=nikita@trvn.ru;
 h=from:subject:message-id; bh=v5SDWro0TJzIb2mbIpfFToKsFwnljBb/D4Hlq7DtHY4=;
 b=owEBbQKS/ZANAwAIAUMc7O4oGb91AcsmYgBoE6mEO6CuH2+N8BMC3AkrEGDFJAOzZj3Hc2AEM
 qSPZvLaqxGJAjMEAAEIAB0WIQTAhK9UUj+qg34uxUdDHOzuKBm/dQUCaBOphAAKCRBDHOzuKBm/
 dc9GD/90bWvMlLBH0lLAyzEzwoGB6tZUguOoZ3UZ75Y+mrIXXPnVpPmGlLC8/KgJ3U79oiwFiYR
 YvAzAo+nKrhgf6TmKZ+Ft/eA2YLXZauVQ67qcX0XxnZJIEf7a6aZC8lrd+PmYP4+LdsARh7suKs
 WvOEl/weyXS2IkGWkYRLv6iQufxpM2YddleN3SsL3SjJBMeaHllNffGLvESeibXItB8bOJPuPr9
 8DUs7TiLT7mvfEfUOpOE4RYV0jn+p63DI/9bKvETl3xsTZ84K8d5QKbz8QWczfCO/VYPdSpFNQj
 J+1sgxFiCQXiQhLCdQENc0tq12bxwcjHxXJ1pJ80AmJaJBq/ZqbSSOoVKJ2EGl62qEJv+ZD4Jgj
 h3pyXv2Ji78YEBrXQ2WQASro3w+y1Pubh7tT0uD8gv8zDCC/ILP5wXZzyZeYq9oKO7UkXSdPe01
 YJ8NDoXAqQUQSRh2Aw9gv3/FERASzrrxhy5BXq1A3b2d85/5x2PR/wH9e5EZZNmbf+TWHOebzpT
 JtxTIuK9f8EYsLW+MK1iYmxbWIUWTnKtW6rtm2ZETdC0q+nKZif7/2R3Ve1QG6B4q+OxPWdNEbx
 cAdQDWU+dRnA88ExQpCJ+Q32HGo3ZVpAl75YC1n4B9GTNUhik0ybmTlzjA/OUvvkGN1Cv/qwjYd
 HLJgpklV1jOS0HQ==
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
 arch/arm64/boot/dts/qcom/Makefile      | 36 +++++++++++++++++---------
 arch/arm64/boot/dts/qcom/x1-el2.dtso   | 46 ++++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/x1e80100.dtsi |  2 +-
 3 files changed, 71 insertions(+), 13 deletions(-)

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
index 0000000000000000000000000000000000000000..7a818045ef098b44632df45253d32e31c5c7aeed
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/x1-el2.dtso
@@ -0,0 +1,46 @@
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
+ */
+&pcie3 {
+	iommu-map = <0 &pcie_smmu 0x30000 0x10000>;
+};
+
+&pcie4 {
+	iommu-map = <0 &pcie_smmu 0x40000 0x10000>;
+};
+
+&pcie5 {
+	iommu-map = <0 &pcie_smmu 0x50000 0x10000>;
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


