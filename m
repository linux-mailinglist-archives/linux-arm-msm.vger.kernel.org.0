Return-Path: <linux-arm-msm+bounces-40828-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E05BF9E771D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 18:27:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5D89816C6A9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 17:27:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 736EF1FFC55;
	Fri,  6 Dec 2024 17:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jazwbNVL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 453901F4E21;
	Fri,  6 Dec 2024 17:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733505854; cv=none; b=MLRegSwCAU7rb0JCel5dP3Z8yuugDGsl1A+cJ6iwm3TVLVaLdvPq35uK0WIPklDA69iOxTBGyEinRXQ+EA7ZCjzhGdoL/z4y0wPG+bz3ghrVHP7Qm7WG1Y5W5RdFBJAK0tD180CNqu216/tPC7oVM/bzGkAtclha5R6Tn6N/FbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733505854; c=relaxed/simple;
	bh=9BDcKEAhfhMZi3RjBnhUfLl8xU6wPyN7nhmV8t6I0vQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lhsdhKXOTTdTfXHWNBikZsbItg8x/8WScyqau6nOZPJ7B9t6grGn9tDoBuZGbv+thHv28bh8/pAO+LAn62+or4gCmCfeyUj9Af7PxbdsX80wdLlddVNt9zUYeDok40IHFcmPXO5jW+uObz+QYtUQ7TDFrQi7osnWjrs/bf/4kuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jazwbNVL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3777C4CEDE;
	Fri,  6 Dec 2024 17:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733505853;
	bh=9BDcKEAhfhMZi3RjBnhUfLl8xU6wPyN7nhmV8t6I0vQ=;
	h=From:To:Cc:Subject:Date:From;
	b=jazwbNVL8wgxmXqa7v94y4RXzWRAHjPxZOrK4pkCbQDWHZmmzKKGSGijD74i/G1Cq
	 0u+EDx4LXvUxlHr4r+Ms28LCb9GZ8Vz/oP4TKcW0drHs/IGWcxCdpGU3MS2iCdH4Ri
	 RAocRq+xv5FKF8Byrh6OObWnzYwDA2ruSWFZhAxiONU21zd1P9mPkjKS5SBVG2pXaC
	 lOavV2MAd8caiG4Ky2u/F0zxmiVG8ByDUohtLA4pdlED78yT+pMnoRClEjV/zCC7XS
	 qvXWxq33JyYQ4lKDvH4mvP94eOMUOUAW9Q/5V0Ebb93bRMnW6BH8D8cuL2+SgmNTTf
	 mfDkkZW+o2dnQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1tJc3q-000000005Oc-2blJ;
	Fri, 06 Dec 2024 18:24:15 +0100
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
Subject: [PATCH] Revert "arm64: dts: qcom: x1e78100-t14s: enable otg on usb-c ports"
Date: Fri,  6 Dec 2024 18:24:02 +0100
Message-ID: <20241206172402.20724-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.45.2
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

I have not been able to reproduce this on the (third port of) the CRD,
but I hit this constantly with the T14s so let's start with reverting
there.

Note that Stephan has already identified another problem with the
offending commit here:

	https://lore.kernel.org/all/ZxZO6Prrm2ITUZMQ@linaro.org/

Johan


#regzbot introduced: 1a48dd7b9ac8



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


