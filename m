Return-Path: <linux-arm-msm+bounces-22746-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D69909390
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jun 2024 23:00:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A284428865A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jun 2024 21:00:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AF69145A05;
	Fri, 14 Jun 2024 21:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="VKkGHVxY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B681EB25;
	Fri, 14 Jun 2024 21:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718398824; cv=none; b=bXd7twWq6PAlKS6bkHwjIVE3y350++BGMmby7byu4O5vlF41yCArRmgplPBGtylcK+O9YVKJVCxKBdhVhtZQPVpnaCG+/0Ym3vEd6OCNgtpx6UONjfiq2/ysuE3/7EU/76j1O3cIGD+XPEmDCzExRcddPWT5IbzqRvcCNrA9EEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718398824; c=relaxed/simple;
	bh=oQ6arAMIY4W8JlFuhCva0WASFpdOy6AaDFmh/dcfYng=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=nTvqXLYjzVDi/b5K4tTz1wfyUu54A099KY5OggHRi2/L4O9gNyTTgYl11Qu4ODdmq3Av9DnmAtwYANPUVcmhFgdHMEn5fJ716neVZ5UP3G35BGVGV/O7+rG/JDGFTk11prxIvLjQtVDWzCYW7mrjKOrgzzZ2NHY7JpilZiCdFCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=VKkGHVxY; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718398820;
	bh=oQ6arAMIY4W8JlFuhCva0WASFpdOy6AaDFmh/dcfYng=;
	h=From:Date:Subject:To:Cc:From;
	b=VKkGHVxY9SmUApWtxMiW8ZEBIhXb8eOgsRjdZAREYrvedg2cYTfIYkmILJwbKjyLB
	 CVB0uCFj5pR6xskzzJjI3h2qeng3CMg4+xRrfD5KZOtKlCt6MAY7+SyjyjWPwrOlSq
	 5lLerL0SDi4nQVKFDnIXEssz/om3YYhM9b4wgVi3OAChLuAsDVMDPBa+xdPlS6qwzX
	 vhCp3htC5Fb7GzP7GMHnkf9xNauu9tStyXf888EC2Iw5s9FvP3JxX+69jScrJKXzGD
	 9ywo3pHbpNb6he+j11iq7+AuNixKkIAn1wmZtsvySalgs3M6mi97A3AYKnhtDhNDQ3
	 pRhTuICunZZBg==
Received: from [192.168.1.207] (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id E00F337804CF;
	Fri, 14 Jun 2024 21:00:16 +0000 (UTC)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Fri, 14 Jun 2024 16:59:36 -0400
Subject: [PATCH] arm64: dts: qcom: sc7180-trogdor: Disable pwmleds node
 where unused
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240614-sc7180-pwmleds-probe-v1-1-e2c3f1b42a43@collabora.com>
X-B4-Tracking: v=1; b=H4sIADevbGYC/x3MTQqAIBBA4avErBtQMYuuEi0qxxroRxyoILp70
 vJbvPeAUGISaIsHEp0sfOwZuixgWoZ9JmSfDUYZq5y2KFOtG4Xx2lbygjEdI6FprKsrP4xBWch
 pTBT4/rdd/74fWbRaKWYAAAA=
To: cros-qcom-dts-watchers@chromium.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Rob Clark <robdclark@chromium.org>, 
 Douglas Anderson <dianders@chromium.org>, 
 Stephen Boyd <swboyd@chromium.org>
Cc: kernel@collabora.com, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.13.0

Currently the keyboard backlight is described in the common
sc7180-trogdor dtsi as an led node below a pwmleds node, and the led
node is set to disabled. Only the boards that have a keyboard backlight
enable it.

However, since the parent pwmleds node is still enabled everywhere, even
on boards that don't have keyboard backlight it is probed and fails,
resulting in an error:

  leds_pwm pwmleds: probe with driver leds_pwm failed with error -22

as well as a failure in the DT kselftest:

  not ok 45 /pwmleds

Fix this by controlling the status of the parent pwmleds node instead of
the child led, based on the presence of keyboard backlight. This is what
is done on sc7280 already.

While at it add a missing blank line before the child node to follow the
coding style.

Fixes: 7ec3e67307f8 ("arm64: dts: qcom: sc7180-trogdor: add initial trogdor and lazor dt")
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-kb.dts   | 2 +-
 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dts  | 2 +-
 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r10-kb.dts  | 2 +-
 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r10-lte.dts | 2 +-
 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dts   | 2 +-
 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dts  | 2 +-
 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-kb.dts   | 2 +-
 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-lte.dts  | 2 +-
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi              | 5 +++--
 9 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-kb.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-kb.dts
index 919bfaea6189..340cb119d0a0 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-kb.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-kb.dts
@@ -12,6 +12,6 @@ / {
 	compatible = "google,lazor-rev1-sku2", "google,lazor-rev2-sku2", "qcom,sc7180";
 };
 
-&keyboard_backlight {
+&pwmleds {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dts
index eb20157f6af9..d45e60e3eb9e 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dts
@@ -17,6 +17,6 @@ &ap_sar_sensor_i2c {
 	status = "okay";
 };
 
-&keyboard_backlight {
+&pwmleds {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r10-kb.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r10-kb.dts
index 45d34718a1bc..e906ce877b8c 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r10-kb.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r10-kb.dts
@@ -18,6 +18,6 @@ / {
 	compatible = "google,lazor-sku2", "qcom,sc7180";
 };
 
-&keyboard_backlight {
+&pwmleds {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r10-lte.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r10-lte.dts
index 79028d0dd1b0..4b9ee15b09f6 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r10-lte.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r10-lte.dts
@@ -22,6 +22,6 @@ &ap_sar_sensor_i2c {
 	status = "okay";
 };
 
-&keyboard_backlight {
+&pwmleds {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dts
index 3459b81c5628..a960553f3994 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dts
@@ -21,6 +21,6 @@ / {
 		"qcom,sc7180";
 };
 
-&keyboard_backlight {
+&pwmleds {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dts
index ff8f47da109d..82bd9ed7e21a 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dts
@@ -25,6 +25,6 @@ &ap_sar_sensor_i2c {
 	status = "okay";
 };
 
-&keyboard_backlight {
+&pwmleds {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-kb.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-kb.dts
index faf527972977..6278c1715d3f 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-kb.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-kb.dts
@@ -18,6 +18,6 @@ / {
 	compatible = "google,lazor-rev9-sku2", "qcom,sc7180";
 };
 
-&keyboard_backlight {
+&pwmleds {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-lte.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-lte.dts
index d737fd0637fb..0ec1697ae2c9 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-lte.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-lte.dts
@@ -22,6 +22,6 @@ &ap_sar_sensor_i2c {
 	status = "okay";
 };
 
-&keyboard_backlight {
+&pwmleds {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
index 4d33c3fbedff..74ab321d3333 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
@@ -356,10 +356,11 @@ max98360a: audio-codec-0 {
 		#sound-dai-cells = <0>;
 	};
 
-	pwmleds {
+	pwmleds: pwmleds {
 		compatible = "pwm-leds";
+		status = "disabled";
+
 		keyboard_backlight: led-0 {
-			status = "disabled";
 			label = "cros_ec::kbd_backlight";
 			function = LED_FUNCTION_KBD_BACKLIGHT;
 			pwms = <&cros_ec_pwm 0>;

---
base-commit: 6906a84c482f098d31486df8dc98cead21cce2d0
change-id: 20240614-sc7180-pwmleds-probe-284675dabf04

Best regards,
-- 
Nícolas F. R. A. Prado <nfraprado@collabora.com>


