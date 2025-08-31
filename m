Return-Path: <linux-arm-msm+bounces-71325-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31094B3D54C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 Aug 2025 23:29:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E72EA3BAFD2
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 Aug 2025 21:29:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B300D2459DD;
	Sun, 31 Aug 2025 21:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f1mXpaj7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 755572356D9;
	Sun, 31 Aug 2025 21:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756675757; cv=none; b=baBUVA8nex4xd0zDt6lejgW59YQPwsO0J4gwCNkwznhvDEvXl2mGS6dAbxMnfUz/TNdrXmemfAuQH4OOQ+bHVHsQ3ppfvVpMiKYUAEXCBek5WxepoyHyA+hgmXkvJsyHjdtAsH/51uLaPVNv4R/RhfMOqSgW9rNy3jw1difKkFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756675757; c=relaxed/simple;
	bh=rHJpHbLqs7HCcg1fy2FP8+yiB/eBr3LkHYfnPJ/1s78=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fYWkZw9d43CXZsTHBDrZn4GLJB9q3NtFzVjJn+XaNhdADCRsPQCYVbcBJ0f06zFu3SZelGve/5vge47EjLl+Iu/R1MtF0h3xd447Is5WXlt9MOccUHwCe/8KWszWtG4IPcXHCchOYmj1dQz2p+SAX5jnRkznzDJW6JqFMV6+Hnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f1mXpaj7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5425C4CEF8;
	Sun, 31 Aug 2025 21:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756675757;
	bh=rHJpHbLqs7HCcg1fy2FP8+yiB/eBr3LkHYfnPJ/1s78=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=f1mXpaj7/dhotBdsnAFhRO8rF6CnDNl8mvfKvc4haiXE0n1ceumQxbNQpkLX2g1PG
	 0T3UcyKE8AW1cOixRV2MKyhUFUUvXrheNewTJJjeVW7FRUDsyxcpAMta+hK/LkDl7B
	 yoGWHuC1RpJVQPjmgP5qnfztI+Qp2JZbauhFity4GY/IU76OROLLXknG3XkY3fXgNp
	 Tjs3GWFeHUDmyoSQBNF+MJ1hkmijwyC7YFJ9W5XJPe6657CHtsX0Qb5E6+a/mPr/xw
	 LacPOdrSBqTDS4faBS/pE8RjfVuykHah6uUIouHQOKOLsok41roRdtpEi9PvV6GUY7
	 26rg+VpNES4Ug==
Received: by venus (Postfix, from userid 1000)
	id AF47A180FAC; Sun, 31 Aug 2025 23:29:14 +0200 (CEST)
From: Sebastian Reichel <sre@kernel.org>
Date: Sun, 31 Aug 2025 23:28:33 +0200
Subject: [PATCH 3/3] arm64: dts: qcom: x1e80100-t14s: add EC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250831-thinkpad-t14s-ec-v1-3-6e06a07afe0f@collabora.com>
References: <20250831-thinkpad-t14s-ec-v1-0-6e06a07afe0f@collabora.com>
In-Reply-To: <20250831-thinkpad-t14s-ec-v1-0-6e06a07afe0f@collabora.com>
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: "Derek J. Clark" <derekjohn.clark@gmail.com>, 
 Henrique de Moraes Holschuh <hmh@hmh.eng.br>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1396;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=rHJpHbLqs7HCcg1fy2FP8+yiB/eBr3LkHYfnPJ/1s78=;
 b=owEBbQKS/ZANAwAKAdju1/PIO/qaAcsmYgBotL6q0RGDixeSczWvia3U+iyyF6wzwqlkxAK9C
 znN1JlZ88eJAjMEAAEKAB0WIQTvZg0HRj+Lcmp5VBPY7tfzyDv6mgUCaLS+qgAKCRDY7tfzyDv6
 mlrQD/4sf3lKdmb9RzdJ0xZuLj1mJ5dY5hIOwC8uc712dmb/+PI0kjjTSvvDpjviKFZfrjyIyFw
 xNcw7qUFAK9xA0aEh9PXjVx0HCJWDRC3sl3MIl4JvTD4qXRrxOO8shTErVVI7BBFVeCHaiZbdJh
 VSKHVCELk6SlazKdOI8xxj7axFyKKj87RC+EEiyCUXpmWCDOsx6FwrNuq+9teLJaPd4wctUmSeh
 r5ezIkGCs+5IUkqWZpKehKIxHhsLxA84doWwshbNwT/s1+zF+qHx6cUVK/DjLUksUwFX03wZWjU
 FqnbPzPGFbuoQRyxPwjfCBiSPGAh4HO5aMCN63U3drOasn7CVo1D3ar3e6S3y/OuNHkui/abSG+
 5hWGqppUIoGEa8asGeA3+Lw3xU8udAyAPxJeFsWe1ro87Wvmx7n8njN6PIA/Bicg2eTSoTbYoUu
 dGozBawUAUdujBwOsMRTA9Id4p0/acHYOTwPzDN/dKT1ySG8GVsOj/fV7D0A1zVgvk4+PJ1w73B
 dYjgbREhnYjalxzrhNzugDaRYf+IUv7qZktWtieZicO8trTnZu+awSivj1kvJzgM2xbckrdkPMb
 mLp3HXgIADhcxNVgjMkmpiuuoOYAAwxCS1IqAxSQub6ien+2Hn0APxgz8Q8CQPEDOnKtbGFrpwE
 dn8hk0jcFLjNS3g==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Describe ThinkPad Embedded Controller in the T14s device tree,
which adds LED and special key support.

Signed-off-by: Sebastian Reichel <sre@kernel.org>
---
 .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi    | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
index ac1dddf27da30e6a9f7e1d1ecbd5192bf2d0671e..7a9ec0c33b3ca847c5496e3ec145c70ccb7a3fe3 100644
--- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
@@ -887,6 +887,23 @@ eusb6_repeater: redriver@4f {
 	};
 };
 
+&i2c6 {
+	clock-frequency = <400000>;
+	status = "okay";
+
+	ec@28 {
+		compatible = "lenovo,thinkpad-t14s-ec";
+		reg = <0x28>;
+
+		interrupts-extended = <&tlmm 66 IRQ_TYPE_LEVEL_LOW>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&ec_int_n_default>;
+
+		wakeup-source;
+	};
+};
+
 &i2c7 {
 	clock-frequency = <400000>;
 
@@ -1267,6 +1284,12 @@ &tlmm {
 			       <72 2>, /* Secure EC I2C connection (?) */
 			       <238 1>; /* UFS Reset */
 
+	ec_int_n_default: ec-int-n-state {
+		pins = "gpio66";
+		function = "gpio";
+		bias-disable;
+	};
+
 	eusb3_reset_n: eusb3-reset-n-state {
 		pins = "gpio6";
 		function = "gpio";

-- 
2.50.1


