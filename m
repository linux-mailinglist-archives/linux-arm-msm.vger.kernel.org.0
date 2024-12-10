Return-Path: <linux-arm-msm+bounces-41295-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B459EAFA6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 12:17:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 02DCA28EC9D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 11:17:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A267223E81;
	Tue, 10 Dec 2024 11:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S4mlVDAb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E9671BEF97;
	Tue, 10 Dec 2024 11:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733829333; cv=none; b=qFHr1GwVjgmXRe2edfI9I0E4jsxUL9ie67JVO6/KiMkb0N6dz4tIAq+PaQSHB3DEqlD/S1Z+AqfKka43oyETPmZ2vL0o38R3+T9qWY8nyynOGKtBJGtWikXexaX7aU6LoD0unTnRZkmTZzEQeXI0omEr/ljHah3qj0HKe/ny51w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733829333; c=relaxed/simple;
	bh=3N4d65t8tlhYSC9lPSzOeAEj9EIZZf5ZHkBDz8Cb1h4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a+e/W/upcXRWrzmcG+cDJoA1O8MdSoIoe2xerMb1trhHe54YC/g00PYW5Vt+Wm2zfmubHG5YjSbl93sfw1sjKCYaVHuXM2/bjvNlx7PEMHPOB6uE35gzcrNPVC04/iFaEKCjs3UJndLvUVqzqiFBq1xyPvUHrt7JksRbQ2pnxPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S4mlVDAb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A608C4CEE2;
	Tue, 10 Dec 2024 11:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733829333;
	bh=3N4d65t8tlhYSC9lPSzOeAEj9EIZZf5ZHkBDz8Cb1h4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=S4mlVDAbH9KdjdnOoIkt1/GRuhhKdbR4qtQ3aDhQoqWpMflIsDBJjAnG5egKtNADH
	 Yu0xwA/WN4PFyyxs1avV9rdtlyDd1UdbiAKETgR1DLenVMBdZGcuBD+FpwbgjogEBh
	 F8teBHEMogfv6EilsM6UOxf6VbiDWgToTC4iJxNWA3YeeGcuOlOciFOJ5LS2EE27ur
	 Wk8IDaRRkiBqzqvS9pSAMCEnOSmXxeyxpgb5milZR+04cy4NIA9uEQbOOmPDP51uwk
	 sR6HOS3XYSMzUzPHGEvErEu7tZABdreF9/sUGj9HhJWMEYK3tEEX9rPRnkoGjO97Zv
	 5rJG7xOJXJuww==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1tKyDH-000000006qm-1I55;
	Tue, 10 Dec 2024 12:15:35 +0100
From: Johan Hovold <johan+linaro@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Jonathan Marek <jonathan@marek.ca>,
	Stephan Gerhold <stephan.gerhold@linaro.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH v3 1/3] Revert "arm64: dts: qcom: x1e78100-t14s: enable otg on usb-c ports"
Date: Tue, 10 Dec 2024 12:14:42 +0100
Message-ID: <20241210111444.26240-2-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241210111444.26240-1-johan+linaro@kernel.org>
References: <20241210111444.26240-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reverts commit 1a48dd7b9ac809d1bd0fd2fef509abba83433846.

A recent change enabling OTG mode on the Lenovo ThinkPad T14s USB-C
ports can break SuperSpeed device hotplugging. The host controller is
enumerated, but the device is not:

	xhci-hcd xhci-hcd.5.auto: xHCI Host Controller
	xhci-hcd xhci-hcd.5.auto: new USB bus registered, assigned bus number 3
	xhci-hcd xhci-hcd.5.auto: hcc params 0x0110ffc5 hci version 0x110 quirks 0x000080a000000810
	xhci-hcd xhci-hcd.5.auto: irq 247, io mem 0x0a800000
	xhci-hcd xhci-hcd.5.auto: xHCI Host Controller
	xhci-hcd xhci-hcd.5.auto: new USB bus registered, assigned bus number 4
	xhci-hcd xhci-hcd.5.auto: Host supports USB 3.1 Enhanced SuperSpeed
	hub 3-0:1.0: USB hub found
	hub 3-0:1.0: 1 port detected
	hub 4-0:1.0: USB hub found
	hub 4-0:1.0: 1 port detected

Once this happens on either of the two ports, no amount of disconnecting
and reconnecting makes the SuperSpeed device be enumerated, while
FullSpeed device enumeration still works.

With retimer (and orientation detection) support not even merged yet,
let's revert at least until we have stable host mode in mainline.

Fixes: 1a48dd7b9ac8 ("arm64: dts: qcom: x1e78100-t14s: enable otg on usb-c ports")
Cc: Jonathan Marek <jonathan@marek.ca>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 .../arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
index 5a4a72a030d4..b4b6260c670c 100644
--- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
+++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
@@ -1515,6 +1515,10 @@ &usb_1_ss0 {
 	status = "okay";
 };
 
+&usb_1_ss0_dwc3 {
+	dr_mode = "host";
+};
+
 &usb_1_ss0_dwc3_hs {
 	remote-endpoint = <&pmic_glink_ss0_hs_in>;
 };
@@ -1543,6 +1547,10 @@ &usb_1_ss1 {
 	status = "okay";
 };
 
+&usb_1_ss1_dwc3 {
+	dr_mode = "host";
+};
+
 &usb_1_ss1_dwc3_hs {
 	remote-endpoint = <&pmic_glink_ss1_hs_in>;
 };
-- 
2.45.2


