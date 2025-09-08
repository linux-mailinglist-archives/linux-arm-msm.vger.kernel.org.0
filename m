Return-Path: <linux-arm-msm+bounces-72665-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C58B49CE7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 00:36:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3F09C7A58D6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 22:35:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36E802ECEB9;
	Mon,  8 Sep 2025 22:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jTA4gPp+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA7F2E7F3A;
	Mon,  8 Sep 2025 22:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757370960; cv=none; b=udK2mB0dbWj+Eup7bfVTveEkpCI3YTJCOTbdEEzAbi03lfyE1d7lVE9nkqpLFhs5p486rT58D1EIXb7cRNXZDgax36gMT+3gSA92bNhO9GebzMv90dhw9vZG5N/CLxStMpq3KKyRwQxSTmySiIQ1fsZKxxx8ZJTgrKb90yE4HjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757370960; c=relaxed/simple;
	bh=dSo8PyCv5W3wiR8ABae/XBucYd73xpUbLl7qWfh1KCs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E/0gpl2OZmD4GQ0RAsEmoTaC1+BEqOV+G2i3VUCMLOxmFBvQZ9Ai4UsvGc14aJLA/5EHdfvCL+egXnpDQqA5uRAjU7LEZiSYjhZ3JQe3LngIIs3n9l1GusyhJ7OpIvIbDb87ahXWMHIx24ZUJBbpZSGgzDnXSHRlHtDPKJl6MH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jTA4gPp+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76309C4CEF9;
	Mon,  8 Sep 2025 22:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757370959;
	bh=dSo8PyCv5W3wiR8ABae/XBucYd73xpUbLl7qWfh1KCs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jTA4gPp+ocKNmBDCeGmINDHmBHy+lIHT3uhGbvYbyaNA0SGZXpZSvSwzGiJka5o/a
	 G6Gt0NwUQCqKj8iC311VexXJ9MrDU7jafO0ZEoZd0zEQhibJzVUNmBVMt93pZj3JlC
	 IKN351YNKJJvBv9ENA57y3/mgXaE8O6D85Ig/hzxlxLz85vUaLbgHOD27nXaZmspFO
	 iYL6qKaAeQRI4MNyAI4uLYNDYpAI3ACQFgkTrQdfi4sJAHD/WZQ5pNz92qYdIIZoLc
	 6wbn9w8yOdT26Rf9ChWBGcpJ4dWu5UJ83FYPVCpp6JraSKFBSOtVyA90UUDXRXaSSn
	 7UcD3Hj32LNiQ==
Received: by venus (Postfix, from userid 1000)
	id 930A5180B28; Tue, 09 Sep 2025 00:35:57 +0200 (CEST)
From: Sebastian Reichel <sre@kernel.org>
Date: Tue, 09 Sep 2025 00:35:52 +0200
Subject: [PATCH v4 3/3] arm64: dts: qcom: x1e80100-t14s: add EC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-thinkpad-t14s-ec-v4-3-caf6159daaee@collabora.com>
References: <20250909-thinkpad-t14s-ec-v4-0-caf6159daaee@collabora.com>
In-Reply-To: <20250909-thinkpad-t14s-ec-v4-0-caf6159daaee@collabora.com>
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: "Derek J. Clark" <derekjohn.clark@gmail.com>, 
 Henrique de Moraes Holschuh <hmh@hmh.eng.br>, 
 Neil Armstrong <neil.armstrong@linaro.org>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1616;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=dSo8PyCv5W3wiR8ABae/XBucYd73xpUbLl7qWfh1KCs=;
 b=owEBbQKS/ZANAwAKAdju1/PIO/qaAcsmYgBov1pN4xXXWqqAUYl/XplCfBRpZhO0iboVVnUyH
 84Ht5jLde2JAjMEAAEKAB0WIQTvZg0HRj+Lcmp5VBPY7tfzyDv6mgUCaL9aTQAKCRDY7tfzyDv6
 mieND/98CMoNikOQp2nJAi1uy5oRMwdxN+n/3m9Mp+qzQ3gPZtsIHOWQEGQrrqHFW4mbmqIEipY
 yraXvOEjkJFzFNWGoX8z/p3pnFzICyThSAddkTq84jXjWCwSKmRfx14QXtVHXsahGN2HVmXXVVx
 7DdSEUUyTW37BygroH05SZnaiyjzf5nY/AFYvQbED0lo4FIK7q1nasq4S073B+qJyYKuUMFbMko
 2obFwFvQZLc5Nc1s88tb0aP+ptjX0nb+67aEeYIwMJhylm7SujjUEWe5r3mYUtlFuCGTAwl0ONA
 me8jYmP6a4jY/svOkl2WSSbfMsodP9jacuOchKz94TYNCtccbeZyHcla5bt67t9GwLcgxKGerQr
 gnfbElfQ01aNnkz9utwHp+pYoveLBkDI4rNItKHc9/0hyBj8SH6ipgXE0g+UFBjyV3b5wT2wx7u
 8VEt3crPBZRLo2K7UavqTGCPSAojLjS+W5shGY01Bk1p59ydUlHW/ncFJlJcLfyB0ajwjyVD+ge
 CFqSAvPQB06fI0ic3LIQ80dZUGLTnVtuPUC0CRKWPnm08Fpm5UejClf/eNOVicPc/lvs2abjyt+
 OWq5yGClv4Wa2G1momMKTL3h2clzsYlU2skmvSu4F8V6npaCKUVBl/ofZQJZsW4Sw5Cr5YyV/8f
 rnrnLt7I81l1PgA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Describe ThinkPad Embedded Controller in the T14s device tree,
which adds LED and special key support.

Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on Thinkpad T14S OLED
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Sebastian Reichel <sre@kernel.org>
---
 .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi    | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
index ac1dddf27da30e6a9f7e1d1ecbd5192bf2d0671e..f70489aba870289edbcf84ec22fdb004e010868b 100644
--- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
@@ -887,6 +887,24 @@ eusb6_repeater: redriver@4f {
 	};
 };
 
+&i2c6 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	embedded-controller@28 {
+		compatible = "lenovo,thinkpad-t14s-ec";
+		reg = <0x28>;
+
+		interrupts-extended = <&tlmm 66 IRQ_TYPE_LEVEL_LOW>;
+
+		pinctrl-0 = <&ec_int_n_default>;
+		pinctrl-names = "default";
+
+		wakeup-source;
+	};
+};
+
 &i2c7 {
 	clock-frequency = <400000>;
 
@@ -1267,6 +1285,12 @@ &tlmm {
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
2.51.0


