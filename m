Return-Path: <linux-arm-msm+bounces-46532-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E4ECA222B6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 18:20:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ADD7E3A7A98
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 17:20:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB1CC1E0E0D;
	Wed, 29 Jan 2025 17:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="XqIGXxxq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA93B1E0DCE
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jan 2025 17:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738171200; cv=none; b=kvBjNVcTf3EBw4p//rL7q4mPIVcO+i5ta+OynC2eD39S7mjuihhj6tln0yZ8VGEOg2eBTx/rru3qBL5p+rpMBeFwag8QVHDQg2crrVd768R2ozH0QV/Ey30pWtJzVDlSSw2LaRv4ViCohNvHlu2RWJfnpjzrWVDlZwtbrC1dObw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738171200; c=relaxed/simple;
	bh=FW/GI43N5p3BtB1D64rBvqr5odB3+1/4Ea0iYxTd780=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n6A3LUhHoCdadwgKdTPscq7LKT5S8kIOkem/AdNr3sLTzP+c0LhLHmvjGFkAd40aFRnWAJ4v4/3euCDHWfr9yXsmT02llGvfFEesVKec1w06FxTLVE41FIBq9vkv8DJvtSJcwXNFt/TVh9OY/NuSxIhe7vdkh6rOyAnbD52pjDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=XqIGXxxq; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1738171192;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m8dAhViTZBchMGhqpRD9jGMu8g0CRLVsIwsVjBG5aSo=;
	b=XqIGXxxqfFGWikM3GD58Esh7FNvRaKbRYWOxWgqt6mhTtEAxATm0kXIDPdpzt+M429b11G
	azgxuDxoOdXMEjMOvATzrc8I5ZthPKknS7ZPhtX59r8LUmOz3odnFhvhkfbuDeaDYXl6mT
	ze/+sy9U6R1gN00VWdlj1cHmtxvt6pdE88H2fmvmAdTKgE3hc1wUwvgsLA1qFGmRmq/jRk
	qpE7U8rll01ACM/KNmOoLW0le5GzrDn9iOOzVqkYy+QfKGZS0/cTL78kilYpYX506KT5sB
	muTn/7vmeR3439edkBXDwVNhOLgIWJeb8AiWd606eUTkXTY1hj1So0wSRrmrbg==
From: Alexey Minnekhanov <alexeymin@postmarketos.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	Alexey Minnekhanov <alexeymin@postmarketos.org>
Subject: [PATCH 2/2] arm64: dts: qcom: sdm630: Add missing resets to mmc blocks
Date: Wed, 29 Jan 2025 20:18:41 +0300
Message-ID: <20250129171842.1588526-2-alexeymin@postmarketos.org>
In-Reply-To: <20250129171842.1588526-1-alexeymin@postmarketos.org>
References: <20250129171842.1588526-1-alexeymin@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Add resets to eMMC/SD card blocks so linux can properly reset
them during initialization.

Signed-off-by: Alexey Minnekhanov <alexeymin@postmarketos.org>
---
 arch/arm64/boot/dts/qcom/sdm630.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index a2c079bac1a7..3722e405a97c 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -1379,6 +1379,7 @@ sdhc_2: mmc@c084000 {
 					<&xo_board>;
 			clock-names = "iface", "core", "xo";
 
+			resets = <&gcc GCC_SDCC2_BCR>;
 
 			interconnects = <&a2noc 3 &a2noc 10>,
 					<&gnoc 0 &cnoc 28>;
@@ -1433,6 +1434,8 @@ sdhc_1: mmc@c0c4000 {
 				 <&gcc GCC_SDCC1_ICE_CORE_CLK>;
 			clock-names = "iface", "core", "xo", "ice";
 
+			resets = <&gcc GCC_SDCC1_BCR>;
+
 			interconnects = <&a2noc 2 &a2noc 10>,
 					<&gnoc 0 &cnoc 27>;
 			interconnect-names = "sdhc-ddr", "cpu-sdhc";
-- 
2.45.3


