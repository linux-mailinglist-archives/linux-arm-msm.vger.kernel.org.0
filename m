Return-Path: <linux-arm-msm+bounces-41027-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7929E920D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 12:21:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AC80C188530C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 11:21:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD5EB21A921;
	Mon,  9 Dec 2024 11:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D7b0x2Q+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A024421A43F;
	Mon,  9 Dec 2024 11:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733743237; cv=none; b=ED1M4QtW+xVdW1I1PA+21zYpq971LKAt/KD/7+3YRaiRVu9snlytzHzFWIA2tMUJQfkIXq3p6RdSEMQThMuWwpLQYw2F4NZIpbtL/mxUZlUTUUwLgg2mYNM5jzkFEymBgCtPovSPIWDjUmTq7171ncAI2OyQbdjyKTo1GIkMguE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733743237; c=relaxed/simple;
	bh=3N4d65t8tlhYSC9lPSzOeAEj9EIZZf5ZHkBDz8Cb1h4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r9Yl0EMpJ6DvsQTWmEspQErigPKjlGe6gkyyqc/u+V+uWg0/YOgFwZ/D7HDzJ+B5JSSjYZMX75st/aIBm95TRfxgDywgXm9FRB7ZKeLE42+P8RhcyiwrZALeac2DF64g1M+VVLRQ0Rb44M5tqZI+Vh77dY3WM/6cn1lPAJXdRpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D7b0x2Q+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1820DC4CEE6;
	Mon,  9 Dec 2024 11:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733743237;
	bh=3N4d65t8tlhYSC9lPSzOeAEj9EIZZf5ZHkBDz8Cb1h4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=D7b0x2Q+Fxpzs2aBXIahli02huv675iF4LEw99zGOmTykQFRCw7NJui1LwCiyH+aS
	 02717DdIJ/9NjAjXVdYBiMK21cA+yqoB0tqVMTnPQfAg07I5g19CNoztGoroXiV6ad
	 3adKoMcLdeXmGuTSpjgfko8zOCQvcW0WqYqnFKWxI0hyvSYlWedYvhBF48ZMI2UwoO
	 3EFqlluLvR6RyE2q/Y4N1iWlF3olc5vx+UvdgahUIwnoBHM+GPipr5NV11Bs5MK+pT
	 Fv+sEzfba3fkFFNpgUyv+5cDl49hCXOgfM2snxRp1wLH7yujFXk6eOU5KN19ysq9ld
	 5NRtYnYWIpuPw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1tKboc-0000000086B-2EEI;
	Mon, 09 Dec 2024 12:20:38 +0100
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
Subject: [PATCH v2 1/2] Revert "arm64: dts: qcom: x1e78100-t14s: enable otg on usb-c ports"
Date: Mon,  9 Dec 2024 12:19:04 +0100
Message-ID: <20241209111905.31017-2-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241209111905.31017-1-johan+linaro@kernel.org>
References: <20241209111905.31017-1-johan+linaro@kernel.org>
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


