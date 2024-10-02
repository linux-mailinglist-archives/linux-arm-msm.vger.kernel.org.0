Return-Path: <linux-arm-msm+bounces-32934-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E729498D2D0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Oct 2024 14:10:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5B58EB23188
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Oct 2024 12:10:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D7341D0175;
	Wed,  2 Oct 2024 12:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=getgoogleoff.me header.i=@getgoogleoff.me header.b="ah6A3hrW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A9151D015F;
	Wed,  2 Oct 2024 12:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727870996; cv=none; b=PoniCFSO/3C+KK539Qc28vcmplYBhBd6epHQZsplLgiGYl7N2veY0YhFIKFg7u35CGwsXtBHork1wgJrjMUWolNApm1RsBDduMwG0ZgPKdrDWulJkC/aKI3LidX1vRl/sFomJQLZ3HubXxH9IoIQ9y8LnVpRtYKzEnJur9EexB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727870996; c=relaxed/simple;
	bh=JsGSJU00MTsZJFHy6awH6zQB3LFsQ79b2U+952KaTKc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KGXb6CXqusWYywh2UocI90AHve06NgBE3zFYbA99jKX570kDXJXTXpRx3n3dScJTNeL5uc8M9CSrzNV876+Z6HYjCv/sFoCAEbyO60B/HEzujMoybn5hmlmZQai6bZLnEKkJhwj8cXJ0GB0LfFQXUvqzFjG6TUNJjbpAoBY3iF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=getgoogleoff.me; spf=pass smtp.mailfrom=getgoogleoff.me; dkim=pass (2048-bit key) header.d=getgoogleoff.me header.i=@getgoogleoff.me header.b=ah6A3hrW; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=getgoogleoff.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=getgoogleoff.me
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 3039F23D33;
	Wed,  2 Oct 2024 14:09:53 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rYC1WiORMz17; Wed,  2 Oct 2024 14:09:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=getgoogleoff.me;
	s=mail; t=1727870992;
	bh=JsGSJU00MTsZJFHy6awH6zQB3LFsQ79b2U+952KaTKc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ah6A3hrW2yfRKfTmmBWVTWbFISDXYeH4zOcZKS3hyAGoQWO7EiM06uGpSW7t8PsNh
	 ham8Mz5mPhBoqvsbxZBb030pfoY0+BHOi4S/03ZOYAUojwzxJqKZujfLMG22wcAPrZ
	 esXui53/Ya/yk2iypdcaWMyeML1jNZfWHt57KejW2R3cOJDfOuFeqmRdM0+P7LZfRF
	 s8egfzNf3G2BwT0LFCobvJ4pCqPIC15j4AIwV37qB9+6c8o+6RCxZZyzmZW4L9Fkl6
	 6kBbMp0M8ah4SZ/LG7uFOIMFYr89h6SY5q991Kz5SKCkk06c5KFUN5+YqM/YXKD5Hs
	 DE/nFsb8Lt8Tw==
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
Subject: [PATCH 3/3] arm: dts: qcom-ipq5018-linksys-jamaica: Include dts from arm64 Build the Linksys EA9350 V3 device trees from the arm64 tree together with the ARM32 include to allow booting this device on ARM32.
Date: Wed,  2 Oct 2024 20:08:04 +0800
Message-ID: <20241002120804.25068-4-exxxxkc@getgoogleoff.me>
In-Reply-To: <20241002120804.25068-1-exxxxkc@getgoogleoff.me>
References: <20241002120804.25068-1-exxxxkc@getgoogleoff.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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


