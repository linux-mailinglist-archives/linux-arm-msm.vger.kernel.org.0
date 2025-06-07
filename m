Return-Path: <linux-arm-msm+bounces-60524-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A19AD0F06
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Jun 2025 21:19:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 956393AE48F
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Jun 2025 19:19:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2DEC215043;
	Sat,  7 Jun 2025 19:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pWFzioDf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63710156C40;
	Sat,  7 Jun 2025 19:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749323980; cv=none; b=s2mprmD3R6NZxjuk2QiKRQdbwsoSayYc2luhoFTVssd3uKYGMMWjD3Jum05XkIOzG/VPYiTqV/tSGdaKGm7Gr1sIMzJyTRsE4HabGjjV5JcWSEKxhWjP5kaLjzatckIqx5vzGpy47BlL94APcKOOmmndDxjLrZKBo641Gi4qeUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749323980; c=relaxed/simple;
	bh=pZ40dvcgy1Iojqw1+7qpiys0ZFgdHWgMOfcvPB2SjqY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=usXhIr6tHMSDkcYjCxwNhsFTyubEiV1HN7FW4rGUcB803AhoO43F2aS+Ql5jbd2HopLQF3QERZUN3YXjHEgqaPlwO7C+f5aUyPJA1A+stRrk8DdsqCPMJcymYzaVE0+24AHFrmpf2KVPxWvYOG8a/P0B8AX76mlXk3e4jOof8PM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pWFzioDf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id EC560C4CEF0;
	Sat,  7 Jun 2025 19:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749323980;
	bh=pZ40dvcgy1Iojqw1+7qpiys0ZFgdHWgMOfcvPB2SjqY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=pWFzioDf9SYey1QSEkOz6HVjgikK8izN8bXFxqZj96zXVWK05Bwmw0I5Nz8wWvIQf
	 uAfCqsbUBJniHZH+o0RpVCZbk8QH2QcAPghDNWZT6pW9pC4BuPjwIv8Sv6p9JE0owm
	 mHNHj018hJ1N2ABYmci9tAcLtVq6PLpbaHXW0+PvnXV9O+/5DvTBGWv8VpPCrceWFj
	 IzgrENWAKlvBuVo6dIbjX2KyW2WPL8A8ipPYJmHfsNt+XU4wTfyGP7ea6Vb22jcj4N
	 LIAUDp/H8yp2ZeLItsHhinJ0EE8q7zf+CpH3EGs3WivbZKD2PBGLKvFqoE3r7qMSqJ
	 0nMWl4shVULTQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCC19C677C4;
	Sat,  7 Jun 2025 19:19:39 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Date: Sat, 07 Jun 2025 21:19:37 +0200
Subject: [PATCH v6 2/4] usb: misc: onboard_usb_dev: Add Bison Electronics
 Inc. Integrated Camera
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250607-tb16-dt-v6-2-61a31914ee72@oldschoolsolutions.biz>
References: <20250607-tb16-dt-v6-0-61a31914ee72@oldschoolsolutions.biz>
In-Reply-To: <20250607-tb16-dt-v6-0-61a31914ee72@oldschoolsolutions.biz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Matthias Kaehlcke <mka@chromium.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749323978; l=2669;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=SV/p7KDSyWL9rkQIFy/TOjIl8HBAh1upgaaKIpkGrwc=;
 b=dvNFU3rgMtgqVKBf8Q0zDyYaEkN58mDHbPCAcmt4ixQawSTSoelflsucHRtH1NIwRR3oluu82
 vRXopo1dkjJDgWF1BaW2yHSceyqCuUOg7TsIxb1xrAdTHC2OJdNFN3s
X-Developer-Key: i=jens.glathe@oldschoolsolutions.biz; a=ed25519;
 pk=JcRJqJc/y8LsxOlPakALD3juGfOKmFBWtO+GfELMJVg=
X-Endpoint-Received: by B4 Relay for
 jens.glathe@oldschoolsolutions.biz/20240919 with auth_id=216
X-Original-From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Reply-To: jens.glathe@oldschoolsolutions.biz

From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

The Camera is built into the Thinkbook 16 G7 QOY and directly attached on the
usb_2 controller (dwc3 USB2 only). It has a separate power supply that needs
to be controlled for PM.

Add the support for this device for the power supply.

Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
---
 drivers/usb/misc/onboard_usb_dev.c | 2 ++
 drivers/usb/misc/onboard_usb_dev.h | 8 ++++++++
 2 files changed, 10 insertions(+)

diff --git a/drivers/usb/misc/onboard_usb_dev.c b/drivers/usb/misc/onboard_usb_dev.c
index 5b481876af1b2c10ce625fcf0fb8bfbe8905aa8c..41360a7591e56b2b1fe973ff1c42e68707fff54d 100644
--- a/drivers/usb/misc/onboard_usb_dev.c
+++ b/drivers/usb/misc/onboard_usb_dev.c
@@ -564,6 +564,7 @@ static struct platform_driver onboard_dev_driver = {
 
 /************************** USB driver **************************/
 
+#define VENDOR_ID_BISON		0x5986
 #define VENDOR_ID_CYPRESS	0x04b4
 #define VENDOR_ID_GENESYS	0x05e3
 #define VENDOR_ID_MICROCHIP	0x0424
@@ -647,6 +648,7 @@ static void onboard_dev_usbdev_disconnect(struct usb_device *udev)
 }
 
 static const struct usb_device_id onboard_dev_id_table[] = {
+	{ USB_DEVICE(VENDOR_ID_BISON, 0x1198) }, /* Bison Electronics Inc. Integrated Camera */
 	{ USB_DEVICE(VENDOR_ID_CYPRESS, 0x6500) }, /* CYUSB330x 3.0 HUB */
 	{ USB_DEVICE(VENDOR_ID_CYPRESS, 0x6502) }, /* CYUSB330x 2.0 HUB */
 	{ USB_DEVICE(VENDOR_ID_CYPRESS, 0x6503) }, /* CYUSB33{0,1}x 2.0 HUB, Vendor Mode */
diff --git a/drivers/usb/misc/onboard_usb_dev.h b/drivers/usb/misc/onboard_usb_dev.h
index e017b8e22f936be66da73789abb4f620e6af4d6a..b95ac757868e7cd3f23eb4b80eb595a2c18e9613 100644
--- a/drivers/usb/misc/onboard_usb_dev.h
+++ b/drivers/usb/misc/onboard_usb_dev.h
@@ -73,6 +73,13 @@ static const struct onboard_dev_pdata ti_tusb8041_data = {
 	.is_hub = true,
 };
 
+static const struct onboard_dev_pdata bison_intcamera_data = {
+	.reset_us = 1000,
+	.num_supplies = 1,
+	.supply_names = { "vdd" },
+	.is_hub = false,
+};
+
 static const struct onboard_dev_pdata cypress_hx3_data = {
 	.reset_us = 10000,
 	.num_supplies = 2,
@@ -127,6 +134,7 @@ static const struct of_device_id onboard_dev_match[] = {
 	{ .compatible = "usb451,8142", .data = &ti_tusb8041_data, },
 	{ .compatible = "usb451,8440", .data = &ti_tusb8041_data, },
 	{ .compatible = "usb451,8442", .data = &ti_tusb8041_data, },
+	{ .compatible = "usb5986,1198", .data = &bison_intcamera_data, },
 	{ .compatible = "usb4b4,6504", .data = &cypress_hx3_data, },
 	{ .compatible = "usb4b4,6506", .data = &cypress_hx3_data, },
 	{ .compatible = "usb4b4,6570", .data = &cypress_hx2vl_data, },

-- 
2.48.1



