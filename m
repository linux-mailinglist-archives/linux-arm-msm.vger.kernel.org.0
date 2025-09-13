Return-Path: <linux-arm-msm+bounces-73414-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E761B563DA
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Sep 2025 01:59:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5DC8017C54B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Sep 2025 23:59:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C47F2D2493;
	Sat, 13 Sep 2025 23:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="ZPbBYRjI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com [95.215.58.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB282D23A8
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Sep 2025 23:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757807868; cv=none; b=JnJhwJBzN11djwzk2zQHJt3kE2PUcMI6+4jdOR04yG4FyjwCYK0e2pedGkxo3JpApi6nCribxenndBNit06WWZrjY48Y9t0/j7aRc4Ll/wcZzkqfjITg5raFBV4z7gaORZE5A22rQczUnE3dZfAMFjmv8OZvXBg22KpFiZ/kd1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757807868; c=relaxed/simple;
	bh=nc3KwC99PQpwiEvMm3m99tdXfMWVJFmazLtTj4VXfoA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BcGmXSo5Tq9f3NJUPemXdNfKh8aGTiLV+2u0uo1S9wNBBPZdIVAZygjjIG6/tW/Zqppe3gsI9qSHiZCI+thXoVW586tqgFaGDO7Bo53GoHr+XphNicqkiu6PwHCV9Onnsh/WyLjEvZOQhwHV8AkNu5iikGdXWH5ecHFYFplHit8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=ZPbBYRjI; arc=none smtp.client-ip=95.215.58.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1757807865;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Pz0bVOlJENyckv6F1/kIhYXCcAwo1ST7820qsrcK3PM=;
	b=ZPbBYRjId6dk12G/xo5VSRuVk4k2VoOoZYLbxx5OLWJwNsJ5v0AQC1vo8K0QV3mShGyWMV
	59oirL6mzQa0irPJ+0MYYfLUgDqxCt1N/N0LOcWwh30lwAAV71nXvrzgctmJoul/lAZ0FB
	Wtbj87SNAS6IOewXhon/s5xQ5TkfUWXZwIepzNB65UOZTYPWgH7QswHbZzAXFLaM/hIBp1
	Mt0BxpuT/B3HmO1Co0d4ViMH6faWd1uCkswpSljfxO/fB+03P6zNh7BAMeJyNLhQs7QjyC
	rwW5zsCb9qv7h9o+kyxVmpKhQWGpxdfwxwEiRt2CXDW6v/lYOrEJ/rrgvccIvA==
From: Paul Sajna <sajattack@postmarketos.org>
Date: Sat, 13 Sep 2025 16:56:41 -0700
Subject: [PATCH 08/11] arm64: dts: qcom: sdm845-lg-common: Add qcom id
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250913-judyln-dts-v1-8-23b4b7790dce@postmarketos.org>
References: <20250913-judyln-dts-v1-0-23b4b7790dce@postmarketos.org>
In-Reply-To: <20250913-judyln-dts-v1-0-23b4b7790dce@postmarketos.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Amir Dahan <system64fumo@protonmail.com>, 
 Christopher Brown <crispybrown@gmail.com>, 
 Paul Sajna <sajattack@postmarketos.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757807839; l=1485;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=nc3KwC99PQpwiEvMm3m99tdXfMWVJFmazLtTj4VXfoA=;
 b=rjlc1+08+7gVXG4vt1ShKeDW4/09CIRNia0v6BuDC2se0k6X93RMYVJtxyD6capLsYD24hwYg
 6LeIhqzH+7SAJ2VV1kpG0LIpJqIZhe3ez/Vr125dOSRorzxjuA6Az9x
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=
X-Migadu-Flow: FLOW_OUT

SDM845 msm-id and board-id added

Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 3 +++
 arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts  | 1 +
 2 files changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
index cc1c78162eedd50d30a70810ac3790efe6c0492f..3853f0e5d89ca87b6fe7882e50ab9421a42efb0d 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
@@ -5,6 +5,7 @@
  * Copyright (c) 2022, The Linux Foundation. All rights reserved.
  */
 
+#include <dt-bindings/arm/qcom,ids.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/leds/common.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
@@ -28,6 +29,8 @@
 /delete-node/ &wlan_msa_mem;
 
 / {
+	qcom,msm-id = <QCOM_ID_SDM845 0x20001>;
+
 	chosen {
 		#address-cells = <2>;
 		#size-cells = <2>;
diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
index 1596a3408659323d60f1b7c395098ed628782dfa..467aa0fd0ef3938e4a8c08b2240d4dca2f74dbcd 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
@@ -12,6 +12,7 @@
 / {
 	model = "LG G7 ThinQ";
 	compatible = "lg,judyln", "qcom,sdm845";
+	qcom,board-id = <0x020C0008 0>;
 
 	chosen {
 		framebuffer@9d400000 {

-- 
2.51.0


