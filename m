Return-Path: <linux-arm-msm+bounces-74214-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92570B8A1B2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 16:55:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0855A587C4A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 14:53:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3A35315D4A;
	Fri, 19 Sep 2025 14:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gerhold.net header.i=@gerhold.net header.b="atNMxuBZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88761313264;
	Fri, 19 Sep 2025 14:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=85.215.255.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758293584; cv=pass; b=cTTC43lkMh0LC08iVAHEwFBmDg0n+E+PqW/c2aYiAPblw6el4SInx4qFHBwl/JzBc6Xc6Pyhw6Cm7cHWuSL15ATFMqMsGMK/YxdCoTX+MlnaMo4X1pVl9uelrOkXEaeXGVIW+MHYwmRuiXfTTd8PNEp4DAkWsHuY55Slm7v2s/M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758293584; c=relaxed/simple;
	bh=NPU6R/xcCQOM1ggUhPE7hD61oLKixNf8wkoXcLLLXeY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Qbn593kK0IxECxpPn3kJ+7vE7Mil6ktk5HCQocBDIt/+Ln5StVegBBguWj1i2zZKAEZ2yr3PvQmO49g2IB6S163dqaY2u81ElvTQUNZP2lK8S1V/kONLC0gYw1kuwn0oaIoY83Tt48pQs8SGaNvozl/fAXDe9L6BhHP6HN6DWDc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gerhold.net; spf=none smtp.mailfrom=gerhold.net; dkim=pass (2048-bit key) header.d=gerhold.net header.i=@gerhold.net header.b=atNMxuBZ; arc=pass smtp.client-ip=85.215.255.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gerhold.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=gerhold.net
ARC-Seal: i=1; a=rsa-sha256; t=1758293394; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=acv5eugD5Gq4KPFEfWtA3/fTqwmKOIsFvg1B+hJkTnk0vgRmqFNqjkOkuMbir2or3Z
    8bjOZ2qOPQ6QwrAFXi2JuKNQBwiNSPN/PyrZIOl/p6cUj62XtbjSu3XaGFy/GQoqQd54
    ohqvLSaMitlWMEC4KKrWYAM7jX3qqaa67oyaPRJPmZRHIwNfDxqKCYi+zdcS0LNcxYB1
    q+lM7S4wa9aieaSE1ua8XZbBXnK7RMmMogAdDyMh2pk8zIBvatStL4rSTcEanO9CFTOE
    ZwZlBc+zHVVDdfeGrOaY3XEtEVJglU9e7PdpP7KlQPhulUGXdNbbICqdP49GBAnAT+1+
    61ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1758293394;
    s=strato-dkim-0002; d=strato.com;
    h=Cc:To:Message-Id:Subject:Date:From:Cc:Date:From:Subject:Sender;
    bh=61bwaMcPRWuSXCmHhvg6GAB4rPUgzrAWmuHTQsPRxU0=;
    b=cHcEmvNS+eK0791m83j75JlC7Y4usGSsN9VQZjXSGnPdocITcJ3de8dvAKKyU3YiQH
    6nGMKfm4O9aoaKhZOVW/zsgMVEDA20lAwXiX52EXB7l5KRDYiBe4CeGsFXu3Qp8v0Mz9
    k13AzTKfJX8aiFiSSXmgTG8EHz/NwGSGphe/EoObCbo73nqTMRUzcrdNPd7x3cARdr5u
    LR3d596JN2KOv6zxj7CacF2UlVSdeKOVce1WJkgE4mAQNZC6FXsW4/E/9nQl7hNvHA2q
    88H/P4znlE3iW+z1OkYQJGe9C0mz3DR0TKFMMuZvs3NRd4pZBqBf/Ro77QLsPGiCWqzJ
    etIA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1758293394;
    s=strato-dkim-0002; d=gerhold.net;
    h=Cc:To:Message-Id:Subject:Date:From:Cc:Date:From:Subject:Sender;
    bh=61bwaMcPRWuSXCmHhvg6GAB4rPUgzrAWmuHTQsPRxU0=;
    b=atNMxuBZcv/q+MRebWRNd+obdkHIWmFDCKBqPm45j0nhkkg/Qbfm47kRKtlus6ZmXG
    lwgen8AJxHYjZkotjqHik9VyIfnL/eODWZDDfR1sCjxENcQ3xNi3Gzwebwqt9N8Ij346
    k+x9buYOdOs20+SJRt4CBwIUugS8sBR4e6a5QHX3pieUyCJ4fwosL9NjdFkfDWRxz4qE
    7QMgWXq3k7V0SKDf2fD9kAdf8uvtrkrFs/VbWmuuMXSFvBNvC5DJz9XlrKzeffE8UBLO
    cyDsY77m/vrediVTYn/896NNOFKfiLx9G04eMRNzTujuvrvsYm2vtlvXFeFO+tX/fE4B
    5DVw==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXSOYQGpRtZhZnncGoRCMFriGKY/zxVJ2QgPDtEteoYvgoAn2AACU="
Received: from [127.0.0.2]
    by smtp.strato.de (RZmta 52.1.2 AUTH)
    with ESMTPSA id R027cc18JEnsOGm
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Fri, 19 Sep 2025 16:49:54 +0200 (CEST)
From: Stephan Gerhold <stephan@gerhold.net>
Date: Fri, 19 Sep 2025 16:49:32 +0200
Subject: [PATCH] arm64: dts: qcom: msm8916-longcheer-l8910: Add touchscreen
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250919-msm8916-l8910-touchscreen-v1-1-c46e56ec0a3b@gerhold.net>
X-B4-Tracking: v=1; b=H4sIAHttzWgC/x2MywqEMAwAf0Vy3kAqvuqvLHvQNmpAqzSrCOK/W
 7wMzGHmAuUorNBmF0Q+RGUNScwnAzd1YWQUnxxyykuyxuKiS2NNhXMi4X/d3aQuMgesuSipMH1
 F3kPqt8iDnO/7+7vvB1E9UUBrAAAA
X-Change-ID: 20250919-msm8916-l8910-touchscreen-7e45041b60dd
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jonathan Albrieux <jonathan.albrieux@gmail.com>, 
 Stephan Gerhold <stephan@gerhold.net>
X-Mailer: b4 0.14.2

From: Jonathan Albrieux <jonathan.albrieux@gmail.com>

The BQ Aquaris X5 (Longcheer L8910) has a Himax HX852x-ES touchscreen,
which can now be described with the bindings recently added to linux-next.
Add it to the device tree to allow using the touchscreen.

Signed-off-by: Jonathan Albrieux <jonathan.albrieux@gmail.com>
Co-developed-by: Stephan Gerhold <stephan@gerhold.net>
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 .../boot/dts/qcom/msm8916-longcheer-l8910.dts      | 46 ++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8910.dts b/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8910.dts
index 887764dc55b21a5892510f822004b054eb65fa0a..93d5ea279cff1eaf929d2bf0673e02819225d88a 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8910.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8910.dts
@@ -79,6 +79,19 @@ led-0 {
 		};
 	};
 
+	reg_ts_vcca: regulator-vcca-ts {
+		compatible = "regulator-fixed";
+		regulator-name = "regulator-vcca-ts";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&tlmm 78 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&ts_vcca_default>;
+		pinctrl-names = "default";
+	};
+
 	usb_id: usb-id {
 		compatible = "linux,extcon-usb-gpio";
 		id-gpios = <&tlmm 110 GPIO_ACTIVE_HIGH>;
@@ -176,6 +189,25 @@ imu@68 {
 	};
 };
 
+&blsp_i2c5 {
+	status = "okay";
+
+	touchscreen@48 {
+		compatible = "himax,hx8527e", "himax,hx852es";
+		reg = <0x48>;
+
+		interrupts-extended = <&tlmm 13 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&tlmm 12 GPIO_ACTIVE_LOW>;
+		vcca-supply = <&reg_ts_vcca>;
+		vccd-supply = <&pm8916_l6>;
+
+		pinctrl-0 = <&ts_int_reset_default>;
+		pinctrl-names = "default";
+
+		linux,keycodes = <KEY_BACK KEY_HOMEPAGE KEY_APPSELECT>;
+	};
+};
+
 &blsp_uart2 {
 	status = "okay";
 	pinctrl-0 = <&blsp_uart2_console_default>;
@@ -338,6 +370,20 @@ spk_ext_pa_default: spk-ext-pa-default-state {
 		bias-disable;
 	};
 
+	ts_int_reset_default: ts-int-reset-default-state {
+		pins = "gpio12", "gpio13";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	ts_vcca_default: ts-vcca-default-state {
+		pins = "gpio78";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
 	usb_id_default: usb-id-default-state {
 		pins = "gpio110";
 		function = "gpio";

---
base-commit: 8f7f8b1b3f4c613dd886f53f768f82816b41eaa3
change-id: 20250919-msm8916-l8910-touchscreen-7e45041b60dd

Best regards,
-- 
Stephan Gerhold <stephan@gerhold.net>


