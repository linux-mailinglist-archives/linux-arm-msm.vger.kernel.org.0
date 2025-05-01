Return-Path: <linux-arm-msm+bounces-56387-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EFABAA6220
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 May 2025 19:12:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C7C6B4A6E86
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 May 2025 17:12:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18A74215181;
	Thu,  1 May 2025 17:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b="Zxp74pjs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from box.trvn.ru (box.trvn.ru [45.141.101.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3758D194C75;
	Thu,  1 May 2025 17:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.141.101.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746119566; cv=none; b=OXbxc2RadwQnDkJjc0nD0jXq3btlk9tJntjrJKbBSBSklb70sqbtT/3d1gupKCGDRzTgpxoS2oW2jS5uljdEEop5UXteQcCVJudK3MWmv4EL6KBA0hM3QpDqy2ZuizMpwFKoDFw1qr6gpeH3Srt/K/B3yjKH1B0CRj7Z+2+PaAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746119566; c=relaxed/simple;
	bh=yZ5AUrLf7fwFTnXazjJiDVbDwXh8gK863PfsGEF+COE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WdVrZR4pQiDCrCHqx7+IPgCrKuzLDWUEi4wCEmgnWrYXbiWmseUnJY+cIh1UdPIQhAX7jfgFuYCXOFwZZ9gkIHWY4yMgQ0ml3luCvOcu9+IOh+iASn14L2AFhDyLKUQeU1nZO5UEg2ikZ768iuEcFp4SVIU8eH332pzKm0xk2/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trvn.ru; spf=pass smtp.mailfrom=trvn.ru; dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b=Zxp74pjs; arc=none smtp.client-ip=45.141.101.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trvn.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trvn.ru
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=trvn.ru; s=mail;
	t=1746119050; bh=yZ5AUrLf7fwFTnXazjJiDVbDwXh8gK863PfsGEF+COE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Zxp74pjsUXf2IwPqaqxSXmFBDlGU4ozvIwodwqs5783kXcoWe9wQvHeECp+MXR3dD
	 GKAyB7+lgKHulM5ttgnAXwa9uhW/QQbhAPTZgTPWbTjdDQClob6pEjihElsngvRG3t
	 E8btU+ai3faDH60hSVVUn5CYaMblOH1i9srqKtvVn0+hWntborKAzF8h0k+j3Q4NId
	 CUozT6KfyejLINPOJDafHm93Si5Hs2qa0ZC0fUrSJ3EJa7d60mKKbfhvnx6Vwv0e13
	 oTjLA7j9Pf0go5QvHHvRbsOfIGoV89a8jOSjqxKtfouLNusWM4eUVMXssdhA7cuQSA
	 sy6R5T9UuQWNw==
Received: from authenticated-user (box.trvn.ru [45.141.101.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by box.trvn.ru (Postfix) with ESMTPSA id E5374C8FE;
	Thu,  1 May 2025 22:04:08 +0500 (+05)
From: Nikita Travkin <nikita@trvn.ru>
Date: Thu, 01 May 2025 22:03:43 +0500
Subject: [PATCH 3/5] arm64: dts: qcom: sc8280xp: Add EL2 overlay for WoA
 devices
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250501-sc-el2-overlays-v1-3-9202e59e3348@trvn.ru>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3816; i=nikita@trvn.ru;
 h=from:subject:message-id; bh=yZ5AUrLf7fwFTnXazjJiDVbDwXh8gK863PfsGEF+COE=;
 b=owEBbQKS/ZANAwAIAUMc7O4oGb91AcsmYgBoE6mDkn6tWsK2fq7ykFuBJcmiv52VPXsz5sCvn
 sC2u9tHUdqJAjMEAAEIAB0WIQTAhK9UUj+qg34uxUdDHOzuKBm/dQUCaBOpgwAKCRBDHOzuKBm/
 db3WEACApheWJc6oJN279nxcP/Kow2qxj+HDKox9GnGGY/tDD1MMNe3DklYRC94JO4F5zEvNnCP
 zXIefpL1nRPjiwl+MseouZvSEZDHN0J+2xoNU/Lb5lJszFs1xjrgAebc+RZkpku/UZD3UsXmAal
 hpTd4byB6Mr/BwkvDrb4vXNX+d0w3FZNB37xhbcqQtBkaVOQMzSxQkxRKaLXCmWpov8AwWxY7RE
 UlKM4GdHWJzOtKTQyswbF8w6KDc4jUsbxkBAy7EnY9+CJc5kQI35Lic6juV+osaSWGlwBrCXuoE
 /hU+Xf3/pNDXQojtK2J07fxowf7/oBEbMcFUdMSLQid1l1Se0H1schBPWz7+mCBUo4JL/ajP7H9
 kAFrXDCTCdu12e/WZYYbMC3daLXbaY6oqkrKyHRFvjfOwZaAyCAUwYqIZyMNmjS1yvJ4Xi4LL1g
 rku5y9GiXUhKjqSMfeJ3zVxvqJW7Cytz1CoGf0QL+0yImEbk6s4oy46SHKkpfC5+xDr1xqGJyhc
 297lRm6tBIqrVuJuEcCyljF1ikvCYNLOiZzcUou2xAOYDXhPi14iMk2N20ul/OeRmT0qXszWXxU
 pzvyPfEQScMNjbzlOV62gu/Q5Yoe9JzNw5fPBSy+zzzHAKv2gjQKLq4miDo3OOC+1MhOxah28qT
 zC2NONiuJhYLyxA==
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


