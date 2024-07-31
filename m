Return-Path: <linux-arm-msm+bounces-27582-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C68A4943706
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 22:18:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 53384B23C85
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 20:18:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBB0B1684BB;
	Wed, 31 Jul 2024 20:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Op72e/4e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1CF81607B6;
	Wed, 31 Jul 2024 20:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722457046; cv=none; b=mmO+M4dnocnmOJ3iakMAgcQGG1u93/1vU2p6UNx4yMGh2VOFc4fMVXgjVhgtfQCBYuxmwNmkjsnROHPmYedR/t9LPGlxUwjuBaP8dEe4/Rlazzq7fX7DdJBcoOetL3z/6vU5GUP9XtB+bYJ2US4paatHuwOF/oOd92q8MJmRAYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722457046; c=relaxed/simple;
	bh=NpKqk1XmCVOrCE1ZUbg2FqAEOp2/vYAMzkjm5/5cpvA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aV/eeNih/rtbHgueFTsKVNdNU3JC3okppt1zpG+di83xQIFx2Tgub5rASXFCUEzoGM99z8XckoB+6Ura6NUHCzSm3QJFfoKMGh72qWVEH0w8GtbJrw4TrHIZFAI9J5VTfc10ktR1WOOmFeluD0fM82ixlEA0C8aApEy8of2454M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Op72e/4e; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B08AC116B1;
	Wed, 31 Jul 2024 20:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722457045;
	bh=NpKqk1XmCVOrCE1ZUbg2FqAEOp2/vYAMzkjm5/5cpvA=;
	h=From:To:Cc:Subject:Date:From;
	b=Op72e/4eGmuPhdZyyIRxLbLThEErzT/AH9ug4xmIUbxF4qfsd18SEV3QKv2YnJVuK
	 TXzgtpFyhOyXu97UqLn0ElyBIxQNF1EtBNQJwTFLJ0lh8em81RO9+w6BYgy7CqGNoq
	 C2G6nm/NwDAMFU2r+p2e0uHASN1oeDy3WPyzz16NvOAjXP3Jp5YmIH1QyOdsaPp4+R
	 xQvAqVi5zjNzLBrVnYZ5L5kLi3M6h8CVsMPeXb7EnaZbwhzzAX/NXlt7Knikbp3734
	 h1HRwLAO9B9WBwXsteeMS5YXWt00E5DWBhjQbeqGS3d1eMNP/GTljJWj0pT/260fxC
	 +1CQVh+O8v9Pw==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: linux-arm-msm@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next] net: phy: qca807x: Drop unnecessary and broken DT validation
Date: Wed, 31 Jul 2024 14:17:03 -0600
Message-ID: <20240731201703.1842022-2-robh@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The check for "leds" and "gpio-controller" both being present is never
true because "leds" is a node, not a property. This could be fixed
with a check for child node, but there's really no need for the kernel
to validate a DT. Just continue ignoring the LEDs if GPIOs are present.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 drivers/net/phy/qcom/qca807x.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/net/phy/qcom/qca807x.c b/drivers/net/phy/qcom/qca807x.c
index 672c6929119a..ba558486c72f 100644
--- a/drivers/net/phy/qcom/qca807x.c
+++ b/drivers/net/phy/qcom/qca807x.c
@@ -733,16 +733,6 @@ static int qca807x_probe(struct phy_device *phydev)
 								     "qcom,dac-disable-bias-current-tweak");
 
 #if IS_ENABLED(CONFIG_GPIOLIB)
-	/* Make sure we don't have mixed leds node and gpio-controller
-	 * to prevent registering leds and having gpio-controller usage
-	 * conflicting with them.
-	 */
-	if (of_find_property(node, "leds", NULL) &&
-	    of_find_property(node, "gpio-controller", NULL)) {
-		phydev_err(phydev, "Invalid property detected. LEDs and gpio-controller are mutually exclusive.");
-		return -EINVAL;
-	}
-
 	/* Do not register a GPIO controller unless flagged for it */
 	if (of_property_read_bool(node, "gpio-controller")) {
 		ret = qca807x_gpio(phydev);
-- 
2.43.0


