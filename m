Return-Path: <linux-arm-msm+bounces-76166-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A137ABC047B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Oct 2025 07:57:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E497B3C60F5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Oct 2025 05:56:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BB3C227EA7;
	Tue,  7 Oct 2025 05:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ARIclD/7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B204226541;
	Tue,  7 Oct 2025 05:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759816549; cv=none; b=VF5uU8sM2aHLjYhz3v0hLssKSeU9KiBKs0MekblOYYd+NsJ/OENILVdpVW+mBMXyVpUqraop11lbk0Qf2xv/PdZkU6OGv4JUdOa8KsghYZ30j7k4ak0Nayi97ySrGtyBjbHJkEtdlX5fRVpv8m9SZkYhu1O19YAQq8gA0FKzDFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759816549; c=relaxed/simple;
	bh=tMwh0QHl8Hu2JecD1WtzMDyQHfSdOnSqC0ACkO9sSko=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D/0TSZGvZPpzq7nUTaXyPc4wb6kwBS3N4ZsWs+iJFkeA5Tkrl2QXdw4W+C0Eg7/ioBUoGCb51ex5XuCexEYzzhRsSK+jtrK0zXpScbRm+0qqJOKqkDEvhcQqSiq+we9eIphzcjrp17xrIR6fOtjWRBrkQD3s6Ha6NUYg2VurLm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ARIclD/7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id F0A75C4CEF7;
	Tue,  7 Oct 2025 05:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759816549;
	bh=tMwh0QHl8Hu2JecD1WtzMDyQHfSdOnSqC0ACkO9sSko=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ARIclD/71sg5Ya2R2lZSqueQ5161gxrLHffSgOKOuk+ULdmF6gVNxEonHOD+pg4VJ
	 sKgJ7Y0uImiIvFy/xF83ucORwPTiJxPApvHwGj86V4k1EAx0LvAI7idw2dvW8M7IVE
	 lMeV5sRW8pmqlhCIYZy1i9mLFIDMqhx7R84HBvNbgizoHaYLl73+Zt/tvCG4Ij8Cl1
	 obD4485xvLN2g6LD12ofEzpCcILovY8xHKT55p1p68XcoQ5h+nEZfRiXD5vFV6QEfN
	 CtbZhXFB4w/0jcWuoOfC3HDUcBxGaCU3kY1a/qFQAlxRGBe9BGzCdQnVYI6tugo7yh
	 CZNWnYtJEP3aw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4D16CCA470;
	Tue,  7 Oct 2025 05:55:48 +0000 (UTC)
From: Alexandre Messier via B4 Relay <devnull+alex.me.ssier.org@kernel.org>
Date: Tue, 07 Oct 2025 01:55:42 -0400
Subject: [PATCH 1/4] ARM: dts: qcom: msm8974pro-htc-m8: add status LEDs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251007-m8-dts-additions-v1-1-53d7ab3594e7@me.ssier.org>
References: <20251007-m8-dts-additions-v1-0-53d7ab3594e7@me.ssier.org>
In-Reply-To: <20251007-m8-dts-additions-v1-0-53d7ab3594e7@me.ssier.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Luca Weiss <luca@lucaweiss.eu>, linux-arm-kernel@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexandre Messier <alex@me.ssier.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759816548; l=1141;
 i=alex@me.ssier.org; s=20240603; h=from:subject:message-id;
 bh=SD/8uvnSr2d+2HzDqbM9fG8xyKZ/sbIt2qlYS8ZUIlw=;
 b=ayzUpHLzZDtFDSLQFCgmQwsof3hOVov+Hc3pyvAr5CeWtT7F7NPP3fm36Bi76I5/DawD96nHd
 /0DyfTMD93KByNS4LQbX1th9EaO9m9MX76vy3QjObJkqeM86uUEFa+h
X-Developer-Key: i=alex@me.ssier.org; a=ed25519;
 pk=JjRqVfLd2XLHX2QTylKoROw346/1LOyZJX0q6cfnrKw=
X-Endpoint-Received: by B4 Relay for alex@me.ssier.org/20240603 with
 auth_id=168
X-Original-From: Alexandre Messier <alex@me.ssier.org>
Reply-To: alex@me.ssier.org

From: Alexandre Messier <alex@me.ssier.org>

Add support for the notification LEDs on the HTC One M8.

Two LEDs are available, one amber and one green.

Signed-off-by: Alexandre Messier <alex@me.ssier.org>
---
 arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts b/arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts
index b896cc1ad6f7..9c3859069aba 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts
@@ -3,6 +3,7 @@
 #include "pm8841.dtsi"
 #include "pm8941.dtsi"
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
 
 / {
 	model = "HTC One (M8)";
@@ -64,6 +65,24 @@ vreg_vph_pwr: vreg-vph-pwr {
 	};
 };
 
+&pm8941_lpg {
+	qcom,power-source = <1>;
+
+	status = "okay";
+
+	led@6 {
+		reg = <6>;
+		color = <LED_COLOR_ID_GREEN>;
+		function = LED_FUNCTION_STATUS;
+	};
+
+	led@7 {
+		reg = <7>;
+		color = <LED_COLOR_ID_AMBER>;
+		function = LED_FUNCTION_STATUS;
+	};
+};
+
 &pm8941_vib {
 	status = "okay";
 };

-- 
2.51.0



