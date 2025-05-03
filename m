Return-Path: <linux-arm-msm+bounces-56644-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81A23AA802A
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 May 2025 12:41:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D17B146516D
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 May 2025 10:41:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E1D81F3B87;
	Sat,  3 May 2025 10:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b="RV8lIBes"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from box.trvn.ru (box.trvn.ru [45.141.101.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B339D1EEA5F;
	Sat,  3 May 2025 10:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.141.101.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746268813; cv=none; b=f3mMvktWu1si44hzKQpP8zEOaE7/a7MVLQ/+C2DM8K7LGbv2EHSeOkHzaQcLQ9OLDHrAW42ckWvrMo94Bur4rqUi2CFQR9hswuhzm3OZXkIndT+m7QUT/+QDB8PDRXgNUg/Wv7dEPLFYNXSMENDpMASoPxiR5zInjUf8bru5GKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746268813; c=relaxed/simple;
	bh=yZ5AUrLf7fwFTnXazjJiDVbDwXh8gK863PfsGEF+COE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CDDOolxpqwRRDdTnMY6FWtcR7zZhHAKWxrgFks0PjTjVrHRvWezMA3AjRzfVsqwYr6lXNb0kX6Ohw1iAngN3fX5In0aWfNEnpHLThmRSUegbV8Zc9NU76O3NB+htgQzrEk0rXd4wyR7/PnrS5mOusleRkriOaovzbc+3dTKwEeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trvn.ru; spf=pass smtp.mailfrom=trvn.ru; dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b=RV8lIBes; arc=none smtp.client-ip=45.141.101.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trvn.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trvn.ru
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=trvn.ru; s=mail;
	t=1746268801; bh=yZ5AUrLf7fwFTnXazjJiDVbDwXh8gK863PfsGEF+COE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=RV8lIBesg6bm+3+WxTcJfZ1qcsv05w0t4r1kXcKrr658kqsmMVQDs2nTU6frHdsHG
	 d/hq4pxhI49YS22WhjtAdyGnlXRLX4mLBalsmPE+Po4mGObUvyneTV6gnLErM/OMRG
	 6l1gihBMNG2l1os3bWdni6OWYT9LKvk0s6uaU9F+uktaHdeGt48EFsqNGl+j9lhsR2
	 zAc2Fe0ZA7FXsGUGsQ+BBOsZVYagWp0WjPNZMO5KatMwgTofR/9OdFNxuVhbtQdMr7
	 j75nsg7Y3S+auc40RpE3CfVexwKGqCXFSRU4eImiuHZ/VRjd11EqgcuK3fUEKQYUKf
	 L1eLsFVY4mxEQ==
Received: from authenticated-user (box.trvn.ru [45.141.101.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by box.trvn.ru (Postfix) with ESMTPSA id B225CC973;
	Sat,  3 May 2025 15:40:00 +0500 (+05)
From: Nikita Travkin <nikita@trvn.ru>
Date: Sat, 03 May 2025 15:39:30 +0500
Subject: [PATCH v2 3/5] arm64: dts: qcom: sc8280xp: Add EL2 overlay for WoA
 devices
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250503-sc-el2-overlays-v2-3-24e9b4572e15@trvn.ru>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3816; i=nikita@trvn.ru;
 h=from:subject:message-id; bh=yZ5AUrLf7fwFTnXazjJiDVbDwXh8gK863PfsGEF+COE=;
 b=owEBbQKS/ZANAwAIAUMc7O4oGb91AcsmYgBoFfJ7W3JhVsSMdFH3UYKcvKN2kRJvh3XzL9RkZ
 WHrKS4fMnGJAjMEAAEIAB0WIQTAhK9UUj+qg34uxUdDHOzuKBm/dQUCaBXyewAKCRBDHOzuKBm/
 dXoFEACwm+C1nTTALVRMuoVoDZOgQ3lsjOnA/jfN4TQjr9fcwjOx+2WHqSUe/YbYpKJClWjsuqA
 J2s7dqK6eUKoD0L7KziywERMIrhSYJcbAMvcXZZzCVvEktKXNqO71lYiz1iwFHnU/65jjmFsDf1
 acncroD/kb6OZ8B77ICCEqH2e/3Sy+pOQAhUDP7psNWPw6UzBn1pmQIvZM7gIYVAMMJ50unl1Ia
 1bdvUxm/GzLKFCUymL57fB9Mkuzy9SyMJIlU2ZBwZfgB98TdPVxnyrYVa6jGfdMFv29SHVZEu1w
 PB2sf4So472FuHnPlIoWVteVlPhxWdebL2oIbhsMQkufuEBeFPmYLPTdhxpyFA3w8/AHowE5iMw
 ePAxLhBaQCgyvnmLrD6QcvtH6fq9aqEOvsqHeAg0OzejkILGWaYxUhyJ0Wrr21+6Pel2zwWBJEl
 kqFg1R/kjJuECpiBO2qjx7IvdccGW1XECqL+k0ub5NGGZzzuMHMn2PgfE6me7SdIXUi2AhiDyhk
 jZk+ZjvM7zoEoqrbvpIcz4oXmH+mLOq8gGIAADYZflscY1Lto8viMxTEH5P/ilD/FuGbAPUKWJn
 i19Eyjd95n0Sr9gmLkSq/YkPsM7EVFlp0hXSRbEE5rOPn/C59qoLJNwe+aOulD597Jdc8aOEJ5c
 K7jN+/9Q1KZK5zQ==
X-Developer-Key: i=nikita@trvn.ru; a=openpgp;
 fpr=C084AF54523FAA837E2EC547431CECEE2819BF75

WoA devices using sc8280xp use android firmware to boot, which notably
includes QHEE hypervisor. This means that, so far, Linux-based OS could
only boot in EL1 on those devices.

However Windows can replace QHEE upon boot with it's own hypervisor, and
with the use of tools such as "slbounce", it's possible to do the same
for Linux-based OS, in which case some modifications to the DT are
necessary to facilitate the absence of QHEE services.

Add a EL2-specific DT overlay and apply it to sc8280xp WoA devices to
create -el2.dtb for each of them alongside "normal" dtb.

Signed-off-by: Nikita Travkin <nikita@trvn.ru>
---
 arch/arm64/boot/dts/qcom/Makefile          | 15 ++++++----
 arch/arm64/boot/dts/qcom/sc8280xp-el2.dtso | 44 ++++++++++++++++++++++++++++++
 2 files changed, 54 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 06da6f6791d69f56bafc3dad3e721c9ff2a1a68a..12d9ed1129b4e83146e561910aca9fc3718b0820 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -205,11 +205,16 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sc7280-idp2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7280-crd-r3.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc8180x-lenovo-flex-5g.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc8180x-primus.dtb
-dtb-$(CONFIG_ARCH_QCOM)	+= sc8280xp-crd.dtb
-dtb-$(CONFIG_ARCH_QCOM)	+= sc8280xp-huawei-gaokun3.dtb
-dtb-$(CONFIG_ARCH_QCOM)	+= sc8280xp-lenovo-thinkpad-x13s.dtb
-dtb-$(CONFIG_ARCH_QCOM)	+= sc8280xp-microsoft-arcata.dtb
-dtb-$(CONFIG_ARCH_QCOM)	+= sc8280xp-microsoft-blackrock.dtb
+sc8280xp-crd-el2-dtbs	:= sc8280xp-crd.dtb sc8280xp-el2.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= sc8280xp-crd.dtb sc8280xp-crd-el2.dtb
+sc8280xp-huawei-gaokun3-el2-dtbs	:= sc8280xp-huawei-gaokun3.dtb sc8280xp-el2.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= sc8280xp-huawei-gaokun3.dtb sc8280xp-huawei-gaokun3-el2.dtb
+sc8280xp-lenovo-thinkpad-x13s-el2-dtbs	:= sc8280xp-lenovo-thinkpad-x13s.dtb sc8280xp-el2.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= sc8280xp-lenovo-thinkpad-x13s.dtb sc8280xp-lenovo-thinkpad-x13s-el2.dtb
+sc8280xp-microsoft-arcata-el2-dtbs	:= sc8280xp-microsoft-arcata.dtb sc8280xp-el2.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= sc8280xp-microsoft-arcata.dtb sc8280xp-microsoft-arcata-el2.dtb
+sc8280xp-microsoft-blackrock-el2-dtbs	:= sc8280xp-microsoft-blackrock.dtb sc8280xp-el2.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= sc8280xp-microsoft-blackrock.dtb sc8280xp-microsoft-blackrock-el2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sda660-inforce-ifc6560.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm450-lenovo-tbx605f.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm450-motorola-ali.dtb
diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-el2.dtso b/arch/arm64/boot/dts/qcom/sc8280xp-el2.dtso
new file mode 100644
index 0000000000000000000000000000000000000000..25d1fa4bc2055e67db0508aa09c8a8bd7fa01687
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-el2.dtso
@@ -0,0 +1,44 @@
+// SPDX-License-Identifier: BSD-3-Clause
+
+/*
+ * sc8280xp specific modifications required to boot in EL2.
+ */
+
+/dts-v1/;
+/plugin/;
+
+/* We can't and don't need to use zap shader in EL2 as linux can zap the gpu on it's own. */
+&gpu {
+	zap-shader {
+		status = "disabled";
+	};
+};
+
+/*
+ * When running under QHEE, this IOMMU is controlled by the firmware,
+ * however when we take ownership of it in EL2, we need to configure
+ * it properly to use PCIe.
+ */
+&pcie2a {
+	iommu-map = <0 &pcie_smmu 0x20000 0x10000>;
+};
+
+&pcie2b {
+	iommu-map = <0 &pcie_smmu 0x30000 0x10000>;
+};
+
+&pcie3a {
+	iommu-map = <0 &pcie_smmu 0x40000 0x10000>;
+};
+
+&pcie3b {
+	iommu-map = <0 &pcie_smmu 0x50000 0x10000>;
+};
+
+&pcie4 {
+	iommu-map = <0 &pcie_smmu 0x60000 0x10000>;
+};
+
+&pcie_smmu {
+	status = "okay";
+};

-- 
2.49.0


