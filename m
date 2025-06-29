Return-Path: <linux-arm-msm+bounces-62985-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D72AECF13
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Jun 2025 19:25:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DD44F3AE4E7
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Jun 2025 17:25:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A08AE237A4F;
	Sun, 29 Jun 2025 17:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Okivh4Oo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D05C22539D;
	Sun, 29 Jun 2025 17:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751217925; cv=none; b=JbOHMXkYqTkIEcAeGcOTmVLnd8xFZdCFf/uhS53Joa7dcXVB9adoW4FDHCNIonPX04A0hbTGsda23OPychgngxfmKY2W7jJ4KTnx6qcQQ5X3/hSHITWhcNuvUJk+gopHVxJZ2b4gpM/AMTpUlRSsxkTzsTNFFLlASOMe1HYZ+JU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751217925; c=relaxed/simple;
	bh=XmyB1rNKO18anQqvORet8yta0PGu+2SWB9A7XrYcCqc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JArZRXbInVtoJDFqdUOM8zQIVfTWHQPo6FjNflbsvl9Ft8coxrvNpIdhvUUA9+80AVpLKYhSuQAPL0TiaI4B03MBvPC39G1zsftV2VlnngwEYjvSqmBQIFFsJSyyx7wPfOKimQKPihClaYQwgDBg3Xl1R9Slg3yBVwp1TUBKDUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Okivh4Oo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0B27DC4CEF1;
	Sun, 29 Jun 2025 17:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751217925;
	bh=XmyB1rNKO18anQqvORet8yta0PGu+2SWB9A7XrYcCqc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Okivh4OoqwO9yC1XpHbdVkBbWhf1A7/gaJJJcn5LMpE4zkVjlnma6VTSoXzg0PWTj
	 pNvxG9OZe0kGXkkGBpYqlVLYZmkPNqzWiNkRF+2873oBgsDFg2fQJ+yt1tUmjYMPYR
	 llRQIP6pP88/y8ZR9x8gBsmxnhWEXCcRPgDd5LetvRv1v5OW8z1su4/vV9FxrA/Zx7
	 8NfJ2hKjjCzLdxDMbuneDzjvWI8qPVDdUVnhrX2TH3aVA/sT9y11NrRtMLm6OzmtV6
	 jrT4OmV4BqXB07cyi4Ut+VBu+6/Tg/u8E8AwVWPKs1HxabxZkcWdT1aWZXo5NeU2RP
	 JhcwNa30h7QWQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1685C83029;
	Sun, 29 Jun 2025 17:25:24 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Date: Sun, 29 Jun 2025 19:25:23 +0200
Subject: [PATCH v7 2/4] usb: misc: onboard_usb_dev: Add Bison Electronics
 Inc. Integrated Camera
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250629-tb16-dt-v7-2-35276341338f@oldschoolsolutions.biz>
References: <20250629-tb16-dt-v7-0-35276341338f@oldschoolsolutions.biz>
In-Reply-To: <20250629-tb16-dt-v7-0-35276341338f@oldschoolsolutions.biz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Matthias Kaehlcke <mka@chromium.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751217923; l=2561;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=h6WO02MR6hkk/XKsY4jmKEhlAD1G0RpEeH0+I5ptKsI=;
 b=2tor+42QfbCfVyB+Q8WHGDfUN5y9UCl3Ed1zdbrRJXgrLrSZQR+yXll7CypgNQgTocdCe+MWg
 /ybSK5J4ZeLAGbCDHGEjE9XEih4y5OPYq8ejZZfZANYwHHR+fVEpVpZ
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

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
index e017b8e22f936be66da73789abb4f620e6af4d6a..c1462be5526d5c15de2493742d27155e6d1ad8ee 100644
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
@@ -144,6 +151,7 @@ static const struct of_device_id onboard_dev_match[] = {
 	{ .compatible = "usb2109,817", .data = &vialab_vl817_data, },
 	{ .compatible = "usb2109,2817", .data = &vialab_vl817_data, },
 	{ .compatible = "usb20b1,0013", .data = &xmos_xvf3500_data, },
+	{ .compatible = "usb5986,1198", .data = &bison_intcamera_data, },
 	{}
 };
 

-- 
2.48.1



