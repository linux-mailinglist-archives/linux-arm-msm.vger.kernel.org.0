Return-Path: <linux-arm-msm+bounces-56386-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B477FAA621E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 May 2025 19:12:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 624321BC6467
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 May 2025 17:13:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FDA3214A9B;
	Thu,  1 May 2025 17:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b="o3lCjki4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from box.trvn.ru (box.trvn.ru [45.141.101.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3753442A87;
	Thu,  1 May 2025 17:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.141.101.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746119565; cv=none; b=T3STYtm88u5cVGUu6FDJZQqO79FYRI9hxxPjsvmqNNM31kIaF9MxzwFtRCVJVK2r3QuEvxXlI+JO6rDYqpXdSzJoIwQI7faFQdgiNP9ToaQ+lo2b+xGV4NkCXMwHitggB5utqXf45wSdvp7xQZfydARF+UoMOMSiHlQSpcJ2nbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746119565; c=relaxed/simple;
	bh=PsJs2on36RmRejiUBvCHrDrk5iO37M0LIWA8gc5UU+g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CZACycD8GOZ6BSO26B7+zbqBEVnTWSlQNcK20WEY6qpNIDwyR54YN5jUnNaH0zIoWH5zEb9kH4HeEXSTOEUB3p+XXV/mtPKZFpHiu1hYHeW64HLxDKdjlTKtuorV3wWOb1Sten2Jz9yuuTfXTHh1l4IfIubNjLvNPHxp2zoenXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trvn.ru; spf=pass smtp.mailfrom=trvn.ru; dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b=o3lCjki4; arc=none smtp.client-ip=45.141.101.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trvn.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trvn.ru
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=trvn.ru; s=mail;
	t=1746119047; bh=PsJs2on36RmRejiUBvCHrDrk5iO37M0LIWA8gc5UU+g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=o3lCjki4eLSgC9pdGX0mDQuFqwFNEVNPDYrQXSrvDbpwf7JI7o1RIfV9cU2GBj5pc
	 9rH6Hkt7cRmBXmChTaTMHgGcHsfckmEYe1X/spCzhZHFfBqWG/irzykl3N1QqIWBbY
	 yD/N+HC4M3be8zryHsgCPp17GY2mvUR+DFU5ENRHxBv3BNBu5W5q6JxwKJfuGu772f
	 ttcT8ZXTVMzii+gwGWBDLSbBJCtlkD30jCZ6AztzuFb2ZCgZMVRG5RLWAOxpuWMkX+
	 GQfFSY6x5lpB/oLSizwJB/VoeMv398g8TmgQ2F4B0pzSzU3IEptUfkpqBuMI9h7J8X
	 fxTW4oIKuC8HQ==
Received: from authenticated-user (box.trvn.ru [45.141.101.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by box.trvn.ru (Postfix) with ESMTPSA id 29B75C8F7;
	Thu,  1 May 2025 22:04:06 +0500 (+05)
From: Nikita Travkin <nikita@trvn.ru>
Date: Thu, 01 May 2025 22:03:41 +0500
Subject: [PATCH 1/5] arm64: dts: qcom: sc7180: Add EL2 overlay for WoA
 devices
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250501-sc-el2-overlays-v1-1-9202e59e3348@trvn.ru>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2416; i=nikita@trvn.ru;
 h=from:subject:message-id; bh=PsJs2on36RmRejiUBvCHrDrk5iO37M0LIWA8gc5UU+g=;
 b=owEBbQKS/ZANAwAIAUMc7O4oGb91AcsmYgBoE6mDnTq+s4NK7u5SFmEUEhmgVoQ73l6Dyhigd
 sAE53ie10iJAjMEAAEIAB0WIQTAhK9UUj+qg34uxUdDHOzuKBm/dQUCaBOpgwAKCRBDHOzuKBm/
 dT0iEACUbB46U0x9F8/TNXUNcEDSN5xE2tAAXAWWQLAK0GGMdl1UZJBcr4d/+yqIkgXnEA5E+2O
 mwK2jxys46l4JnNftbDXeWCRNMzlpHvpbng+7MjcSD7JWONp9AzpjrJrNI9h03Roifya0m5AeSO
 +i3mzdFeOmqdRWIGDr+OJ2yCEY2P4ZGYAMsqpHSpx2HYAcBl8mHMe7AQwUdaWRk1ExJLl8GfDlX
 ADuo4eyYuthra9CApd2LwNimsTnPeLPAQ0i1AT8B9j5su6QmwA/S7SoIvTlG5PpxK90XwwWtPbv
 QmD6AeU8hm2m5ge/HJ4V4/Y+QmuqFgZvv/DtIVtQKWl/flfnO2b0/JgZZ2QQvw311HsvHKmQtZl
 a8eUGE1YM1p+TMtzDV3DKpD7Uo07C245Eb0gmrlWRHESOn5n+d6aP8XienduMOx7fz82sr+Dk5P
 NRB5uUR2Fpfh/cnUs0UdykEYeinb2y2x0/j5N1pm3/Wunfq8w4iUimYL9J1zWXszn5rjEBMttmC
 WXxB4V9ANYDYaV4yIisggOZo4U61jIg2pVIZnRuoKPdyZKDrIiS2NUXodiEfRYuFTsGC2fFQe1w
 mZ5Y3MmN28WDz8T0G7GuDWLO7wgd5NOzUJ8R+F1do8TlN+o9opeK4hZDwxBtGoAeNxTH+97AdY7
 dy1vQRORgq0uMNw==
X-Developer-Key: i=nikita@trvn.ru; a=openpgp;
 fpr=C084AF54523FAA837E2EC547431CECEE2819BF75

WoA devices using sc7180 use android firmware to boot, which notably
includes QHEE hypervisor. This means that, so far, Linux-based OS could
only boot in EL1 on those devices.

However Windows can replace QHEE upon boot with it's own hypervisor, and
with the use of tools such as "slbounce", it's possible to do the same
for Linux-based OS, in which case some modifications to the DT are
necessary to facilitate the absence of QHEE services.

Add a EL2-specific DT overlay and apply it to sc7180 WoA devices to
create -el2.dtb for each of them alongside "normal" dtb.

Signed-off-by: Nikita Travkin <nikita@trvn.ru>
---
 arch/arm64/boot/dts/qcom/Makefile        |  3 ++-
 arch/arm64/boot/dts/qcom/sc7180-el2.dtso | 22 ++++++++++++++++++++++
 2 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index adb4d026bcc4b24d73de92e204db8d525b0770e6..06da6f6791d69f56bafc3dad3e721c9ff2a1a68a 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -138,7 +138,8 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sa8295p-adp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sa8540p-ride.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sa8775p-ride.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sa8775p-ride-r3.dtb
-dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-acer-aspire1.dtb
+sc7180-acer-aspire1-el2-dtbs	:= sc7180-acer-aspire1.dtb sc7180-el2.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-acer-aspire1.dtb sc7180-acer-aspire1-el2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-idp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-coachz-r1.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-coachz-r1-lte.dtb
diff --git a/arch/arm64/boot/dts/qcom/sc7180-el2.dtso b/arch/arm64/boot/dts/qcom/sc7180-el2.dtso
new file mode 100644
index 0000000000000000000000000000000000000000..49a98676ca4db270ecb55e8f801d0800ef9e4def
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sc7180-el2.dtso
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: BSD-3-Clause
+
+/*
+ * sc7180 specific modifications required to boot in EL2.
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
+/* Venus can be used in EL2 if booted similarly to ChromeOS devices. */
+&venus {
+	video-firmware {
+		iommus = <&apps_smmu 0x0c42 0x0>;
+	};
+};

-- 
2.49.0


