Return-Path: <linux-arm-msm+bounces-48388-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 664CFA3A12F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2025 16:29:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 59A293A5C84
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2025 15:29:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ED8326B96E;
	Tue, 18 Feb 2025 15:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="civ8LLFD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7F622309B5;
	Tue, 18 Feb 2025 15:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739892580; cv=none; b=rxPh8PrCRTM4mvDQ/Wntf2TKDIFUhLRjv61ZZgp+DzTCJQdUhnX283PJtd0K5XgQM/K1/ElRmkLjJcJ/PC6AUyBm1GWGfU4UxHYorbJy2wSSQuvEOG8NRiWdC3Kho4mcSJn/j6JA4x3xQ1oyh6LB0u42PFNdm3TZP32fOid15Y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739892580; c=relaxed/simple;
	bh=sGfbobmv+MO11TXcaAQCUU3566O6HBRy+Pat48SZLhI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NqOdmttlUvc/QbEtzGANnfU/QPResU1RCVeFykL3OS5G4tbMemjzBq6qTTo/ACI/tKYjMfV2wXP8e5xk1QwhD5vIEiMiavu23OAfa7UR/UsUvehlggkkOb3f3qDuVKNrFcV4fqFoBpnYqbYmv0brJ5wuTAaa/U2RTnFTSVypveA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=civ8LLFD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE822C4CEE7;
	Tue, 18 Feb 2025 15:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739892579;
	bh=sGfbobmv+MO11TXcaAQCUU3566O6HBRy+Pat48SZLhI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=civ8LLFDMzn6PYlTFI3a+5dJW2x+PVxdkmFF7ggR3rmQZpkbMOMbldDxK4+K1V6rM
	 gaaanN1/jLTddwY1/QjLrUMucL/xssJNoAAhUiTBFNOyoh3npBp9pma8Bxd0sdb4yK
	 dBDx2YCMYxtli+tthejl0aas8ECVl5Ic+J23shHHd63AwG/gxSJYXdus+ghrPnCWoH
	 O7JiZkckIxIn5hXZ2d9c1T0p6XjVFqwwGpqIn1FClMQWpshnSI/2iJp+twCwxEKKN8
	 Qj4cjSQOWpKxmEZpKdAdse4g1eG9GIXXypEaZIlyYJJMAEZqWP/kh3F3+Kvoddb1sK
	 pkmkpp/J0gB/A==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1tkPXg-000000005zI-122Y;
	Tue, 18 Feb 2025 16:29:48 +0100
From: Johan Hovold <johan+linaro@kernel.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Abel Vesa <abel.vesa@linaro.org>,
	Stephan Gerhold <stephan.gerhold@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 1/3] usb: typec: ps883x: fix registration race
Date: Tue, 18 Feb 2025 16:29:31 +0100
Message-ID: <20250218152933.22992-2-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.45.3
In-Reply-To: <20250218152933.22992-1-johan+linaro@kernel.org>
References: <20250218152933.22992-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make sure that the retimer is fully setup before registering it to avoid
having consumers try to access it while it is being reset.

Fixes: 257a087c8b52 ("usb: typec: Add support for Parade PS8830 Type-C Retimer")
Cc: Abel Vesa <abel.vesa@linaro.org>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/usb/typec/mux/ps883x.c | 31 ++++++++++++++++---------------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/drivers/usb/typec/mux/ps883x.c b/drivers/usb/typec/mux/ps883x.c
index ef086989231f..274de7abe585 100644
--- a/drivers/usb/typec/mux/ps883x.c
+++ b/drivers/usb/typec/mux/ps883x.c
@@ -346,6 +346,22 @@ static int ps883x_retimer_probe(struct i2c_client *client)
 		goto err_vregs_disable;
 	}
 
+	/* skip resetting if already configured */
+	if (regmap_test_bits(retimer->regmap, REG_USB_PORT_CONN_STATUS_0,
+			     CONN_STATUS_0_CONNECTION_PRESENT) == 1) {
+		gpiod_direction_output(retimer->reset_gpio, 0);
+	} else {
+		gpiod_direction_output(retimer->reset_gpio, 1);
+
+		/* VDD IO supply enable to reset release delay */
+		usleep_range(4000, 14000);
+
+		gpiod_set_value(retimer->reset_gpio, 0);
+
+		/* firmware initialization delay */
+		msleep(60);
+	}
+
 	sw_desc.drvdata = retimer;
 	sw_desc.fwnode = dev_fwnode(dev);
 	sw_desc.set = ps883x_sw_set;
@@ -368,21 +384,6 @@ static int ps883x_retimer_probe(struct i2c_client *client)
 		goto err_switch_unregister;
 	}
 
-	/* skip resetting if already configured */
-	if (regmap_test_bits(retimer->regmap, REG_USB_PORT_CONN_STATUS_0,
-			     CONN_STATUS_0_CONNECTION_PRESENT) == 1)
-		return gpiod_direction_output(retimer->reset_gpio, 0);
-
-	gpiod_direction_output(retimer->reset_gpio, 1);
-
-	/* VDD IO supply enable to reset release delay */
-	usleep_range(4000, 14000);
-
-	gpiod_set_value(retimer->reset_gpio, 0);
-
-	/* firmware initialization delay */
-	msleep(60);
-
 	return 0;
 
 err_switch_unregister:
-- 
2.45.3


