Return-Path: <linux-arm-msm+bounces-46558-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC6FA2259D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 22:24:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0CA5E1887601
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 21:24:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 921621946A1;
	Wed, 29 Jan 2025 21:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="dQ4+MkRR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-175.mta0.migadu.com (out-175.mta0.migadu.com [91.218.175.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD8901E1A20
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jan 2025 21:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738185885; cv=none; b=XkI8/4mic4ovS57UUb80ykwoihWo0COuLaXQ+W3B9FbIWA8v404FCu9lVt7CQ4fY8xZxuB/xc1RyV3gVgP69DIjTkrmB48NsuDY7SpE7G1T0zABpBHhBg8rA7NXtPgH7tAw3B0C9VJWuTmHSurpzsN0VkfazoAl1sg7VQ0rNnos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738185885; c=relaxed/simple;
	bh=FW/GI43N5p3BtB1D64rBvqr5odB3+1/4Ea0iYxTd780=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OGPtLtokSM18fmzO48I9lxqgMsfWwh7nPndC+HEfRty0IIErrYZlcag6WKu6FlglAG9PsQh683c7ywfMrUQwd7xGRb1+gFGjLsJcP01Vui5cx/c1GyR7nzGuFv4+Qt9IaRh4ngyBCUkfGxXU31A1bnXLgOsKDPCxK8tzYqqZV7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=dQ4+MkRR; arc=none smtp.client-ip=91.218.175.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1738185877;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m8dAhViTZBchMGhqpRD9jGMu8g0CRLVsIwsVjBG5aSo=;
	b=dQ4+MkRRBxQSBfoVVGIDP4JEyg/hfzUBmdP1unT+/qGRtW+ngU4EQ2ZRevX11o0mBVVYCR
	v0/kFJL8fntI1flFeV8qwOcGrwvUVIcX3hFx9GAzAskwYhcvDjZYS9fDRRpZrMAXNghK3U
	hGM7Fye5tHO1ITzT2068Iw60HLf+54Uiqt9gk7wLZbPYWT81dNlMB4vlxt8XNKtftunHvT
	EjYIjyAmnuKnmvi/U2Sek6VtMSCfG2+H/2oiMtknZj7B/KtBJqy19j/8I4MRMLmnY0dFcR
	hATbDS5qnZxDe6JrK7c5wVKwazie25/MF+rxxOenaHCbl2k3pOQj2SuH7Hu9pQ==
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
Subject: [PATCH v2 3/3] arm64: dts: qcom: sdm630: Add missing resets to mmc blocks
Date: Thu, 30 Jan 2025 00:23:27 +0300
Message-ID: <20250129212328.1627891-3-alexeymin@postmarketos.org>
In-Reply-To: <20250129212328.1627891-1-alexeymin@postmarketos.org>
References: <20250129212328.1627891-1-alexeymin@postmarketos.org>
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


