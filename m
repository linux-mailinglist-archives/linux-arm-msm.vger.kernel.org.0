Return-Path: <linux-arm-msm+bounces-32942-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 544F598D4E5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Oct 2024 15:25:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 86D2C1C21C17
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Oct 2024 13:25:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A4881D0B93;
	Wed,  2 Oct 2024 13:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=getgoogleoff.me header.i=@getgoogleoff.me header.b="myM1DGRM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC32F1D0429;
	Wed,  2 Oct 2024 13:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727875482; cv=none; b=dzbV1D/F8lQl8osSbM3cNDwnnNrJ2518zleRB0Z2KY1GwTuT1fduLh10YHrr8TACOcy6T4uGpjgkM9K2YaKfOzfSlnZVw9++yOQNyPNw8n4Nxxz1YuFfTurRmo+JSlV0NddZpFYuvtfW91R6WjVIw2DjkLvHXBII9CufVP195+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727875482; c=relaxed/simple;
	bh=vlT6BUE0i0bCZYlq2mO18x7e5FjTZyQeszvJG4JrHMA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ldaDOeED1kdzFZqShWoqTjCmUtLBFjuSaxD5fApNBKvx0RmI++vAUV44mO5igvr2fK1YA7DMRbVTCDOPjeynu+l8kv+oUt3iI5u42H8qfPnWNnjFF1XVsJCF7V8S+kbkkMrI6UdhMNuClCNRMeeZ8BHeLh/wgYKSd/QtOHnKSdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=getgoogleoff.me; spf=pass smtp.mailfrom=getgoogleoff.me; dkim=pass (2048-bit key) header.d=getgoogleoff.me header.i=@getgoogleoff.me header.b=myM1DGRM; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=getgoogleoff.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=getgoogleoff.me
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 6F56A23E12;
	Wed,  2 Oct 2024 15:24:39 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wgbEzQZg6XFG; Wed,  2 Oct 2024 15:24:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=getgoogleoff.me;
	s=mail; t=1727875478;
	bh=vlT6BUE0i0bCZYlq2mO18x7e5FjTZyQeszvJG4JrHMA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=myM1DGRMncDaR+7yr2txYfOcDUmUZIeDlFmD1eh4Du3eZdubM4a0XjC1AS46zUGxq
	 mj0/3TpSa2YvViuGWyA7MfKPca/Cm2Emi8kg3TMYORKHOxOnZCfv4aui4LNaAfrRaI
	 smSpVcdTnbjS4gpZi9YCH8Ug52fy3oZe8r0g6jsTP9h0eqBRkPnf7IW4jLCS5tQWLr
	 nc5834fgpSovFbYJa7msT6pm9uXJSFz6Ho790q8NkmnT4rU8VbrTpJFfgLhhEGCFT6
	 8v+ekzwafQemdypP8N2vc6st2ELjRjZ0auH6T7A1GJynGcO1g/l01zgSe4ie50+2xV
	 btpdZ7RflDH0Q==
From: Karl Chan <exxxxkc@getgoogleoff.me>
To: linux-arm-msm@vger.kernel.org
Cc: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Karl Chan <exxxxkc@getgoogleoff.me>
Subject: [PATCH v2 3/3] arm: dts: qcom-ipq5018-linksys-jamaica: Include dts from arm64
Date: Wed,  2 Oct 2024 21:23:02 +0800
Message-ID: <20241002132302.31608-4-exxxxkc@getgoogleoff.me>
In-Reply-To: <20241002132302.31608-1-exxxxkc@getgoogleoff.me>
References: <20241002132302.31608-1-exxxxkc@getgoogleoff.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Build the Linksys EA9350 V3 device trees from the arm64 tree together with the ARM32 include to allow booting this device on ARM32.

The approach to include device tree files from other architectures is
inspired from e.g. the Raspberry Pi (bcm2711-rpi-4-b.dts) where this is
used to build the device tree for both ARM32 and ARM64.

Signed-off-by: Karl Chan <exxxxkc@getgoogleoff.me>
---
 arch/arm/boot/dts/qcom/Makefile                         | 1 +
 arch/arm/boot/dts/qcom/qcom-ipq5018-linksys-jamaica.dts | 2 ++
 2 files changed, 3 insertions(+)
 create mode 100644 arch/arm/boot/dts/qcom/qcom-ipq5018-linksys-jamaica.dts

diff --git a/arch/arm/boot/dts/qcom/Makefile b/arch/arm/boot/dts/qcom/Makefile
index f06c6d425e91..147dbeb30a6a 100644
--- a/arch/arm/boot/dts/qcom/Makefile
+++ b/arch/arm/boot/dts/qcom/Makefile
@@ -23,6 +23,7 @@ dtb-$(CONFIG_ARCH_QCOM) += \
 	qcom-ipq4019-ap.dk04.1-c3.dtb \
 	qcom-ipq4019-ap.dk07.1-c1.dtb \
 	qcom-ipq4019-ap.dk07.1-c2.dtb \
+	qcom-ipq5018-linksys-jamaica.dtb \
 	qcom-ipq8064-ap148.dtb \
 	qcom-ipq8064-rb3011.dtb \
 	qcom-msm8226-microsoft-dempsey.dtb \
diff --git a/arch/arm/boot/dts/qcom/qcom-ipq5018-linksys-jamaica.dts b/arch/arm/boot/dts/qcom/qcom-ipq5018-linksys-jamaica.dts
new file mode 100644
index 000000000000..9a6ad767ebd7
--- /dev/null
+++ b/arch/arm/boot/dts/qcom/qcom-ipq5018-linksys-jamaica.dts
@@ -0,0 +1,2 @@
+// SPDX-License-Identifier: GPL-2.0+ OR BSD-3-Clause
+#include <arm64/qcom/ipq5018-linksys-jamaica.dts>
-- 
2.46.1


