Return-Path: <linux-arm-msm+bounces-59277-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5388AAC2E76
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 May 2025 11:19:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0FA264A44E8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 May 2025 09:19:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04AC517FAC2;
	Sat, 24 May 2025 09:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qAumzKzu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C889B72613;
	Sat, 24 May 2025 09:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748078354; cv=none; b=o2nsk9qaOYiQBTbMvWQq/16I1jZFdbBwFPvsBUs2V5x6dHia95GqXLx5wRHw4VJyr1b/FBv4SD4fn5SbKEfSKdqVDODhPzdLflhLy8N6iZahgotOSS8BqobH705MxAfEQtlRezhRHPB0spODkywFdnHDwNUWuar5lbYQed815Eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748078354; c=relaxed/simple;
	bh=eHBYIf5NbtgRccmvXhdOxhwbZsizTYF1aR36WSqYoS4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K+Z56p0Gj887jvXUVfg0CFWUkJR29XrmsVomRdSotgQMMxHojdjfQStAxCH1l2+ayg7k7rqxJteDKHf9YOivurb/7BUiTKH9q1sXbGGroZpldjFqReYrxMBzpdO9zXnqw+MCw9QlN/gyjELqUC2y1WdI2B9Ss47Sf9HrJBSPzn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qAumzKzu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4E8CAC4CEF0;
	Sat, 24 May 2025 09:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748078354;
	bh=eHBYIf5NbtgRccmvXhdOxhwbZsizTYF1aR36WSqYoS4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=qAumzKzuI2mNli2M2x3PM50oh3QmueA0YTKLjebBj5Xuy7duLBQadOZazIl0CyLRL
	 SeGYVqEv2AQuLIk21/h8WN/tsRL/0uM5XUX5pVOAzkdSbpW+ayAEJZ7Ic0IZZFojIq
	 URTSnaLFUC/YwfWhRmzveGxmH2764y+N3GaP7mA/irEQcZ9sgh2B2aN50JbfCeRvg7
	 GF9KKCvKxB+sgL2FoNG7n1u4qIerUZtmtKH60Jrt8TaUlO/A2voJ/bC2yuGlhhF8Js
	 mdtWACGCYdY2UDpZrH+f5HauvjoE5a0J35FQDFEcpVBqS7FtdZMTJGyfYVWs+wOa9a
	 b6bVDhbAyfxqg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FE57C54F32;
	Sat, 24 May 2025 09:19:14 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Date: Sat, 24 May 2025 11:19:10 +0200
Subject: [PATCH v3 3/6] usb: misc: onboard_usb_dev: Add Bison Electronics
 Inc. Integrated Camera
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250524-tb16-dt-v3-3-17e26d935e73@oldschoolsolutions.biz>
References: <20250524-tb16-dt-v3-0-17e26d935e73@oldschoolsolutions.biz>
In-Reply-To: <20250524-tb16-dt-v3-0-17e26d935e73@oldschoolsolutions.biz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Matthias Kaehlcke <mka@chromium.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Douglas Anderson <dianders@chromium.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>, 
 Aleksandrs Vinarskis <alex.vinarskis@gmail.com>, linux-usb@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748078352; l=2558;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=Nf3v/6LRLg57RjwhplrovE4DP5a0Ez2PkQJ5KdkIkUk=;
 b=UUu8T87PCvDBhSgrWhYhoqSLBjS1IjV17RIm4Y2zvhNig0caBaISic1YNMuiADtYri8xUToQ1
 4B/GJz1fh5GABzZdurD3YKJ7YtiwI5A4AOT30dg7vx6YvIFbBKDlkeV
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
index 1048e3912068ced166c76838cf7306d86e192fe4..17b1f345b6b65bf25e68e77b0a345936825e1d04 100644
--- a/drivers/usb/misc/onboard_usb_dev.c
+++ b/drivers/usb/misc/onboard_usb_dev.c
@@ -569,6 +569,7 @@ static struct platform_driver onboard_dev_driver = {
 #define VENDOR_ID_TI		0x0451
 #define VENDOR_ID_VIA		0x2109
 #define VENDOR_ID_XMOS		0x20B1
+#define VENDOR_ID_BISON		0x5986
 
 /*
  * Returns the onboard_dev platform device that is associated with the USB
@@ -677,6 +678,7 @@ static const struct usb_device_id onboard_dev_id_table[] = {
 	{ USB_DEVICE(VENDOR_ID_VIA, 0x0817) }, /* VIA VL817 3.1 HUB */
 	{ USB_DEVICE(VENDOR_ID_VIA, 0x2817) }, /* VIA VL817 2.0 HUB */
 	{ USB_DEVICE(VENDOR_ID_XMOS, 0x0013) }, /* XMOS XVF3500 Voice Processor */
+	{ USB_DEVICE(VENDOR_ID_BISON, 0x1198) }, /* Bison Electronics Inc. Integrated Camera */
 	{}
 };
 MODULE_DEVICE_TABLE(usb, onboard_dev_id_table);
diff --git a/drivers/usb/misc/onboard_usb_dev.h b/drivers/usb/misc/onboard_usb_dev.h
index e017b8e22f936be66da73789abb4f620e6af4d6a..816d9ce71eaddc7ab0cb4517558dd44a591d6c28 100644
--- a/drivers/usb/misc/onboard_usb_dev.h
+++ b/drivers/usb/misc/onboard_usb_dev.h
@@ -115,6 +115,13 @@ static const struct onboard_dev_pdata xmos_xvf3500_data = {
 	.is_hub = false,
 };
 
+static const struct onboard_dev_pdata bison_intcamera_data = {
+	.reset_us = 1000,
+	.num_supplies = 1,
+	.supply_names = { "vdd" },
+	.is_hub = false,
+};
+
 static const struct of_device_id onboard_dev_match[] = {
 	{ .compatible = "usb424,2412", .data = &microchip_usb424_data, },
 	{ .compatible = "usb424,2514", .data = &microchip_usb2514_data, },
@@ -144,6 +151,7 @@ static const struct of_device_id onboard_dev_match[] = {
 	{ .compatible = "usb2109,817", .data = &vialab_vl817_data, },
 	{ .compatible = "usb2109,2817", .data = &vialab_vl817_data, },
 	{ .compatible = "usb20b1,0013", .data = &xmos_xvf3500_data, },
+	{ .compatible = "usb5986,1198", .data = &bison_intcamera_data, },
 	{}
 };
 

-- 
2.48.1



