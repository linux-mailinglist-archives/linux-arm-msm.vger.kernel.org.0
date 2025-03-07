Return-Path: <linux-arm-msm+bounces-50648-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB9AA56EC9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Mar 2025 18:12:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 10FE71891EE5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Mar 2025 17:12:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15D3223F424;
	Fri,  7 Mar 2025 17:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RsGws+3d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCBCB23E35E;
	Fri,  7 Mar 2025 17:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741367559; cv=none; b=UojIrcykq8cJDx7GUwHkAmVUwQTNlbNXkXDY7oE/SbbeHEjHOJTEwqRJjxZ+ln0FddWKNmAUj5OcdpgiDFlhjS6jbaM14TapXHWAR4Hw4PpL48ra+MYwT3eGmhCJBe/A37atpQnBeeWJXuDWP77jTKwIa4M3ltnbEsTmUN21+vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741367559; c=relaxed/simple;
	bh=vc9W2PPHFjBogq36NXiLeq1XT509RZs91JP+ttvuR4w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B6Z6AB7rcApmxuct4Awp1fnhBr4XcT49ieYV40kOfmcRd59kTWaOftZOLVdUTYHsBEik/ZEy7q1+pGhF6CtzSMJVBj13WB2zO9dd95N+NsyifBclRcUHi9iM8fzuxkxooFcCxPV8qKgIEZp2lgp5y30IPG0VP/yqS/PPyZSSEqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RsGws+3d; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 664A5C4CEE2;
	Fri,  7 Mar 2025 17:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741367558;
	bh=vc9W2PPHFjBogq36NXiLeq1XT509RZs91JP+ttvuR4w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RsGws+3dUeKVCxWLoesHt/hNW/SKXzLlFoBnGpBfUQ3LCNLravsv6YL3iRQIO9RcV
	 NCby+tUnIwTMEzqhg9PMo5ZAVLs4VXF5e4icLPg9/PXdp/C29vnfszpSfOYQW3Hmeu
	 qnuLrS3vcjxqCemY1ypVEj+UsSQgH5YdmS5xyjW5QwinffwFPwQuVnLBNQKjL7bKUL
	 4vlzqY6qx8vbTZlK/UXzedktZDAAQCdgWin7OKGtrqMIrfaXDH50gn6fyf+JvU2ZmN
	 1PeDiRWAWGw+ErWXDZgpjacf0kgd2NZPfJdPfSrOTaMSIQGoCVmg7tGuN2pP63gbLC
	 xKf3ZsLP44t+Q==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1tqbFV-000000001x7-14qc;
	Fri, 07 Mar 2025 18:12:37 +0100
From: Johan Hovold <johan+linaro@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 1/2] arm64: dts: qcom: x1e80100-crd: add support for volume-up key
Date: Fri,  7 Mar 2025 18:12:21 +0100
Message-ID: <20250307171222.7470-2-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.45.3
In-Reply-To: <20250307171222.7470-1-johan+linaro@kernel.org>
References: <20250307171222.7470-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the keypad volume-up key on the debug extension board.

This is useful to have when testing PMIC interrupt handling, and the key
can also be used to wake up from deep suspend states (CX shutdown).

Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 arch/arm64/boot/dts/qcom/x1-crd.dtsi | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/x1-crd.dtsi b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
index 296b41409ad1..0b62fdc85478 100644
--- a/arch/arm64/boot/dts/qcom/x1-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
@@ -52,9 +52,16 @@ chosen {
 	gpio-keys {
 		compatible = "gpio-keys";
 
-		pinctrl-0 = <&hall_int_n_default>;
+		pinctrl-0 = <&hall_int_n_default>, <&kypd_vol_up_n>;
 		pinctrl-names = "default";
 
+		key-vol-up {
+			label = "volume_up";
+			gpios = <&pm8550_gpios 6 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEUP>;
+			wakeup-source;
+		};
+
 		switch-lid {
 			gpios = <&tlmm 92 GPIO_ACTIVE_LOW>;
 			linux,input-type = <EV_SW>;
@@ -876,6 +883,16 @@ &pcie6a_phy {
 	status = "okay";
 };
 
+&pm8550_gpios {
+	kypd_vol_up_n: kypd-vol-up-n-state {
+		pins = "gpio6";
+		function = "normal";
+		power-source = <1>; /* 1.8 V */
+		bias-pull-up;
+		input-enable;
+	};
+};
+
 &pm8550ve_8_gpios {
 	misc_3p3_reg_en: misc-3p3-reg-en-state {
 		pins = "gpio6";
-- 
2.45.3


