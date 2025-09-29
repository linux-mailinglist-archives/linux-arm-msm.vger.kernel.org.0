Return-Path: <linux-arm-msm+bounces-75458-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 98315BA7F89
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Sep 2025 07:07:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4923C17EA2B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Sep 2025 05:07:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24EB2239591;
	Mon, 29 Sep 2025 05:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="izZHhcTT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D33D23BCFD
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 05:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759122365; cv=none; b=SR9OtgKVAlQwdjXzCZuVK2vRJ3K+2vwG+iAfpjZnY0KoRBYS6WgpcgSTTkRh6AXnyb9hAhzS4hEfi9VW7VdqZD5CG2D27ErdP00xe31E/2N+tIDa6F46790nGGGDZXcer2EQfomPuykI/dAkwzNLnD+Qo7Ct2BJ/rJ85oRPHnik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759122365; c=relaxed/simple;
	bh=cl/E7ZXBAssDUGhGzoBCNSTKhHrLBOGtbcJNQFpU+5M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pk2Mtj5vjsOlgjTBU5t40K3G0BDAdgAupFEldfpQyr2G/9aOdYWKAE7brLS88DnMg07uE1jg3qCwxuiu6+Wu7dARNBe2bF8DJ2ulzLDn05R949rjsuK+sRMJzcj6X4Lj/wyOM1t9OZtOQJ+7E8UHlMiCCMkHVivGysPBhTuwriQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=izZHhcTT; arc=none smtp.client-ip=91.218.175.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1759122360;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J+iuN3ejpJiAhQuCV+hDZxAkXgGQNpawK6Kx6hgcIHs=;
	b=izZHhcTTQThsCNzVPEkk4G0w1aAvKRDG3q24AxKCMqiUTZS0jj4aWKzbbEO6/PNc3mVtwk
	PEn5wi1UvhHyflAJ+Vsr5OODUXO2UoifG/XX2P4DYCMeOZUVVdlqb0exwmT/L9Rd/CrAnl
	xoq+ZivAlSXB9aPkRHmEssfmjFr9/X8ZawiYe4/F0ebBalac1GB55IW6S4zkqd7mIPDivr
	KKkd50wuYGEmcpGUG5Nx81RgBWD3BwZHzonYNKgy3RLOephLN89cKqU05E8HG2wYHuRcRc
	YCYW2XxfLKCWOmtPgHtbP9mq5wuDFeh4BDmXNXiLvhJX19l0lAiW8TwtT7ukeg==
From: Paul Sajna <sajattack@postmarketos.org>
Date: Sun, 28 Sep 2025 22:05:32 -0700
Subject: [PATCH v3 09/11] arm64: dts: qcom: sdm845-lg-common: Add camera
 flash
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250928-judyln-dts-v3-9-b14cf9e9a928@postmarketos.org>
References: <20250928-judyln-dts-v3-0-b14cf9e9a928@postmarketos.org>
In-Reply-To: <20250928-judyln-dts-v3-0-b14cf9e9a928@postmarketos.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 Amir Dahan <system64fumo@protonmail.com>, 
 Christopher Brown <crispybrown@gmail.com>, 
 Paul Sajna <sajattack@postmarketos.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759122330; l=903;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=cl/E7ZXBAssDUGhGzoBCNSTKhHrLBOGtbcJNQFpU+5M=;
 b=VdEwediuNUnX5xcTpFKdS2Oo+mCrc+c15HjidFIJikvdVV7sLh+nzkcGzZw6/fJGjh9QtW6Fr
 cRUVpx8nDchAI5iTiuUn4FqI2sEq+9xQ7Fx3/wb9XhhLcQz3BkjsZYs
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=
X-Migadu-Flow: FLOW_OUT

So it can be used as a flashlight

Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
index a8c8706f2057d36d5ef4130f11d9ad417f93d575..f309e6ebc075a691c7a522238b4a93ba9e63f3c0 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
@@ -509,6 +509,19 @@ &pm8998_resin {
 	status = "okay";
 };
 
+&pmi8998_flash {
+	status = "okay";
+
+	led-0 {
+		function = LED_FUNCTION_FLASH;
+		color = <LED_COLOR_ID_WHITE>;
+		led-sources = <1>;
+		led-max-microamp = <850000>;
+		flash-max-microamp = <850000>;
+		flash-max-timeout-us = <500000>;
+	};
+};
+
 &pmi8998_lpg {
 	status = "okay";
 

-- 
2.51.0


