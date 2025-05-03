Return-Path: <linux-arm-msm+bounces-56639-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A54CAA801D
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 May 2025 12:40:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 11E77464E69
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 May 2025 10:40:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B28781E5B66;
	Sat,  3 May 2025 10:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b="wy8biJhs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from box.trvn.ru (box.trvn.ru [45.141.101.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B80191B4248;
	Sat,  3 May 2025 10:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.141.101.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746268808; cv=none; b=pcm0q8nY+i+OwSWoctUj3K/sItKMihPIbD620ogPFdKkyCli02T5Vm1I0RH+rIGLAaEyfePrh7q5mVMWfe4NOqzfRC6TQGnFizBMODGHRvz0jOO+DNWlBfv8RdKBUAMyUvha0OWe0UVZSxbyTzR/+PM9/3mOs9UuzNNDHgYsLJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746268808; c=relaxed/simple;
	bh=PsJs2on36RmRejiUBvCHrDrk5iO37M0LIWA8gc5UU+g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qOEWtwytEs1BYwkjySc0XTE6rwU1vNZStcXr6fO48H0JgZfJbK3M00WYhlzkawSyOlcYPZyqlk6dUiXuECkByv7Sb8SMAcAZe6X452wq8X/XSIHURMKh16mjj3fnMMpz7RBkji+7IqMN9SVRdRup8m6TmYOH4WVhVayLMGu76Ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trvn.ru; spf=pass smtp.mailfrom=trvn.ru; dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b=wy8biJhs; arc=none smtp.client-ip=45.141.101.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trvn.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trvn.ru
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=trvn.ru; s=mail;
	t=1746268799; bh=PsJs2on36RmRejiUBvCHrDrk5iO37M0LIWA8gc5UU+g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=wy8biJhsZvTe8aZLZDuQTIk9+QthKGXJto0p4qoT94ZUNAGufDkHYtdPjWjuypdJM
	 TmyzGPfrpYA0FTDZD5r/QQJufc8PQf0COxqmeOp/cdomAXlMmH4ZrXRvHbYaggnIqB
	 EPd6fSTddqnYhWvHAdV83drRXi9BoCbJXrLAE0EpAZVemhvsv+awPb0kNmN1ZQL+az
	 iLtrBEO9KN9kCDjWsgI42a/whP5bv3myvLmEoW9A6rXQKEZzwXjGg/7nE0FGI4CNao
	 smq0n/6+aun1hCVEPCOtTu88lJ4W9ZuOB+xIsynjzU9mui9K2xoDY1WiDmCFgEXdcN
	 NfDf87hpknNLw==
Received: from authenticated-user (box.trvn.ru [45.141.101.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by box.trvn.ru (Postfix) with ESMTPSA id D310FC970;
	Sat,  3 May 2025 15:39:57 +0500 (+05)
From: Nikita Travkin <nikita@trvn.ru>
Date: Sat, 03 May 2025 15:39:28 +0500
Subject: [PATCH v2 1/5] arm64: dts: qcom: sc7180: Add EL2 overlay for WoA
 devices
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250503-sc-el2-overlays-v2-1-24e9b4572e15@trvn.ru>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2416; i=nikita@trvn.ru;
 h=from:subject:message-id; bh=PsJs2on36RmRejiUBvCHrDrk5iO37M0LIWA8gc5UU+g=;
 b=owEBbQKS/ZANAwAIAUMc7O4oGb91AcsmYgBoFfJ7RlS9PLDUos+d10Kfi/0N5eXPeY/wQ+nk/
 7xUw+YDvAiJAjMEAAEIAB0WIQTAhK9UUj+qg34uxUdDHOzuKBm/dQUCaBXyewAKCRBDHOzuKBm/
 dc77D/kBF/Cxy28SDF5cWtPzl4bvWkfy4c108avGiM+/5T8fO5ADY2g1F8GPUGi8I4lflMYiPT9
 TUmbe4SzAcnkxn0EYukMb/I9Osd/Rd/0IUz27vP/fF1YLA/1+DG6VNZdcEK/GzyzS+LZ8PWyyEy
 IBsfH+QzMfKjQFRINGodipA9J/CHb5yuT6tMbCoT2U7rz2Clr84OxZl6pqOuDKONjiDwUTnWnYi
 V87FHgl49RGQ4Yc9Gh0IbgjfQmS6eHb2p0hHIIxwl+mvUzYOclFnN2Bydkt+4Lc4qSpBBAoTftM
 yoW5W3Hm6P5G0ft7Pm5MlDKeSvDJtMJ+OwBBaUCBhDjTHmIctbfPIfPXZpkXqoQQsJAhDJ2u8YX
 sDY0BOr3fc1qMamNYL3p58W+TJKhmFjbYoQe8bLNCT7fxYHVzwx2Gy6CXss+bF9TWpOM5jJ0oOD
 BYo+DtZXn7SAbQdOgvIoL2HyAjhEr9iG/rb3qDPKpD+ny/aVSHiX4SvJZp9RTHmV98NHrWiUvHY
 9rRb3y1gxeTEGSx7ZAB1X4lFrfFwj/4v4M/VnkVvQAbWYDBUMcNWJRaT7WtYO3NwF/U/lwhbXEe
 jiPfHJTfoVpLV2W2FIHoEXr6YKb2uWNa7ISxCvlnife1bRBrHMAwuZh6HO2yvjOmVtTU9IBIj5L
 yzOlIFDgPW40RdQ==
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


