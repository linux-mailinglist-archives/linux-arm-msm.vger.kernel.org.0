Return-Path: <linux-arm-msm+bounces-23258-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4B090F656
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 20:46:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7985C1F23C73
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 18:46:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9956158D7A;
	Wed, 19 Jun 2024 18:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="gAL+o4vV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02E5C1586F2
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Jun 2024 18:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718822766; cv=none; b=YwB9A3+fi0Gebj0mh5NiSAnQpHXnYoXaWBR/58nknwWMw+X9vJOBZoGgZq9wyi3/WaohC3pOqkZsUR3KB0ZEE39lyK9FrSACtdDXFkjePJ2DxRB8SUPRMhqSxcFGFXRsAJddx4HjixKSkLPfnoh4A4QETocx9SQjL59/oROK9C0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718822766; c=relaxed/simple;
	bh=xQZfBrjg8Y1IyEOd4VaZKMauy6Z5Ydh+j9RZPVg6KZk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nKLMFkZHuJVvQA0shj7/ku0tsPYZOXNIru2QWCuzfPZGMqpMNL8H7rUh/UAA8thwi3HmeF4r+vIw2tivANd6zoZmjAmmaYEJWKU9QygXmBq4maLDzj2wy/GvdgiBpPuO9af2JRRNh+Uzum8a+8I+5yh6Q0jpiNxyEeXk1a1zCgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=gAL+o4vV; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-42172ed3487so1050875e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Jun 2024 11:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1718822763; x=1719427563; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Of1uWBxSEjvKTQJleea6ZxhN8mHuCcwxXxdGI9uF93A=;
        b=gAL+o4vVw3jcnhq4PUbRpC74aZANSxP2sHepAl477+dHyw3hIiYtKS9iQYOzNR/aZl
         7jG7iLmV3Eq2lBLWWUnK6mwdZDiAlv/bi52N9kVh0HgIjWYLsLw9y/CplYlywGk3vr6y
         jbwWpbF3OYq7oBGO3aLvdLCbprYHWo+51G/sASidqzssMBKA+L8kkhB6GGuyGhS9xZVE
         JSaetH0dSnfHCJDTFQf5ZtPdDY0xzTK2pTGGYRjhj1zHxTUF4OPeFToRxOpMpNMHNNyK
         pOO33h0IRjazGywi2++BR6mrtBlZK+3jLdtOMH6cxOopJbiuilV4xGuNYqMzbTENJT2D
         5ItQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718822763; x=1719427563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Of1uWBxSEjvKTQJleea6ZxhN8mHuCcwxXxdGI9uF93A=;
        b=AR2zP+BaKKcT4WfjSVxKLAZ3hnPuSj6fRfXjC62y/FJKZXbJ0CUzaGAZ1mD2pA4vKo
         gAgRrIh8cYteAcEYOPNgb3TkHEjXokZMn5ch5afJQ30mBLNYwoXc3oR3FImm5ym9+3AH
         dqTclRw+vCTnL1pJgBLNCxKVqbmhgbKHdDIswbrTJ6Qjj7py2iqH2ayoWtjvl0/xWcML
         vDFNrD67mTw6Jna7PRM9YQoAhzGDRylsgk+BzNNEz6cjjjOaFvYKuZo5Mf/13pgKMsiU
         R/7T8M34UFhIb6o8JMeZf6H5wYUYJ3+tUkEaPDfov4Lz52EXAWuHb8BqYd7ABLbRwElX
         WxnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfnkIhHg4vC2h1/MtgBVD+cuVk5OC/M/yXGBTkenotNnmfIxn2VVq9vdnJVFZVt4hHViS6MVa1KUTknUQtMoDQQR4qIYXEDZJ8SvSYhA==
X-Gm-Message-State: AOJu0Yxbmh6tx9gddUOfW9RQ5RrniPKc0AlMuTjXomlQKhFgGzd/IWtB
	CYzMxvLbyeuLBBhPoeMeoJdK1e+amW0xI1iPoXT9SLNbIiStj/Q3VgvhjPVMw8g=
X-Google-Smtp-Source: AGHT+IG94KmlBI+1kAFW/XzI6UK2YpoCtdBNr/zZ39tySmt8Nx0B1Rz4PfJT6D+Bu6Uwl7ILTiqtkg==
X-Received: by 2002:a7b:cc13:0:b0:424:784c:b13b with SMTP id 5b1f17b1804b1-424784cb209mr15137645e9.13.1718822763293;
        Wed, 19 Jun 2024 11:46:03 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:991f:deb8:4c5d:d73d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36098c8c596sm7594156f8f.14.2024.06.19.11.46.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 11:46:02 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Vinod Koul <vkoul@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>
Cc: netdev@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH net-next 1/8] net: phy: add support for overclocked SGMII
Date: Wed, 19 Jun 2024 20:45:42 +0200
Message-ID: <20240619184550.34524-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240619184550.34524-1-brgl@bgdev.pl>
References: <20240619184550.34524-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The Aquantia AQR115C PHY supports the Overlocked SGMII mode. In order to
support it in the driver, extend the PHY core with the new mode bits and
pieces.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/net/phy/phy-core.c |  1 +
 drivers/net/phy/phylink.c  | 13 ++++++++++++-
 include/linux/phy.h        |  4 ++++
 3 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/net/phy/phy-core.c b/drivers/net/phy/phy-core.c
index 15f349e5995a..7cf87cae11f0 100644
--- a/drivers/net/phy/phy-core.c
+++ b/drivers/net/phy/phy-core.c
@@ -138,6 +138,7 @@ int phy_interface_num_ports(phy_interface_t interface)
 	case PHY_INTERFACE_MODE_RXAUI:
 	case PHY_INTERFACE_MODE_XAUI:
 	case PHY_INTERFACE_MODE_1000BASEKX:
+	case PHY_INTERFACE_MODE_OCSGMII:
 		return 1;
 	case PHY_INTERFACE_MODE_QSGMII:
 	case PHY_INTERFACE_MODE_QUSGMII:
diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 02427378acfd..ce07d41a233f 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -128,6 +128,7 @@ static const phy_interface_t phylink_sfp_interface_preference[] = {
 	PHY_INTERFACE_MODE_5GBASER,
 	PHY_INTERFACE_MODE_2500BASEX,
 	PHY_INTERFACE_MODE_SGMII,
+	PHY_INTERFACE_MODE_OCSGMII,
 	PHY_INTERFACE_MODE_1000BASEX,
 	PHY_INTERFACE_MODE_100BASEX,
 };
@@ -180,6 +181,7 @@ static unsigned int phylink_interface_signal_rate(phy_interface_t interface)
 	switch (interface) {
 	case PHY_INTERFACE_MODE_SGMII:
 	case PHY_INTERFACE_MODE_1000BASEX: /* 1.25Mbd */
+	case PHY_INTERFACE_MODE_OCSGMII:
 		return 1250;
 	case PHY_INTERFACE_MODE_2500BASEX: /* 3.125Mbd */
 		return 3125;
@@ -231,6 +233,7 @@ static int phylink_interface_max_speed(phy_interface_t interface)
 		return SPEED_1000;
 
 	case PHY_INTERFACE_MODE_2500BASEX:
+	case PHY_INTERFACE_MODE_OCSGMII:
 		return SPEED_2500;
 
 	case PHY_INTERFACE_MODE_5GBASER:
@@ -515,6 +518,10 @@ static unsigned long phylink_get_capabilities(phy_interface_t interface,
 		caps |= MAC_1000HD | MAC_1000FD;
 		fallthrough;
 
+	case PHY_INTERFACE_MODE_OCSGMII:
+		caps |= MAC_2500FD;
+		fallthrough;
+
 	case PHY_INTERFACE_MODE_REVRMII:
 	case PHY_INTERFACE_MODE_RMII:
 	case PHY_INTERFACE_MODE_SMII:
@@ -929,6 +936,7 @@ static int phylink_parse_mode(struct phylink *pl,
 		case PHY_INTERFACE_MODE_10GKR:
 		case PHY_INTERFACE_MODE_10GBASER:
 		case PHY_INTERFACE_MODE_XLGMII:
+		case PHY_INTERFACE_MODE_OCSGMII:
 			caps = ~(MAC_SYM_PAUSE | MAC_ASYM_PAUSE);
 			caps = phylink_get_capabilities(pl->link_config.interface, caps,
 							RATE_MATCH_NONE);
@@ -1357,7 +1365,8 @@ static void phylink_mac_initial_config(struct phylink *pl, bool force_restart)
 
 	case MLO_AN_INBAND:
 		link_state = pl->link_config;
-		if (link_state.interface == PHY_INTERFACE_MODE_SGMII)
+		if (link_state.interface == PHY_INTERFACE_MODE_SGMII ||
+		    link_state.interface == PHY_INTERFACE_MODE_OCSGMII)
 			link_state.pause = MLO_PAUSE_NONE;
 		break;
 
@@ -3640,6 +3649,7 @@ void phylink_mii_c22_pcs_decode_state(struct phylink_link_state *state,
 		break;
 
 	case PHY_INTERFACE_MODE_SGMII:
+	case PHY_INTERFACE_MODE_OCSGMII:
 	case PHY_INTERFACE_MODE_QSGMII:
 		phylink_decode_sgmii_word(state, lpa);
 		break;
@@ -3715,6 +3725,7 @@ int phylink_mii_c22_pcs_encode_advertisement(phy_interface_t interface,
 			adv |= ADVERTISE_1000XPSE_ASYM;
 		return adv;
 	case PHY_INTERFACE_MODE_SGMII:
+	case PHY_INTERFACE_MODE_OCSGMII:
 	case PHY_INTERFACE_MODE_QSGMII:
 		return 0x0001;
 	default:
diff --git a/include/linux/phy.h b/include/linux/phy.h
index e6e83304558e..73da0983d631 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -128,6 +128,7 @@ extern const int phy_10gbit_features_array[1];
  * @PHY_INTERFACE_MODE_10GKR: 10GBASE-KR - with Clause 73 AN
  * @PHY_INTERFACE_MODE_QUSGMII: Quad Universal SGMII
  * @PHY_INTERFACE_MODE_1000BASEKX: 1000Base-KX - with Clause 73 AN
+ * @PHY_INTERFACE_MODE_OCSGMII: Overclocked SGMII
  * @PHY_INTERFACE_MODE_MAX: Book keeping
  *
  * Describes the interface between the MAC and PHY.
@@ -168,6 +169,7 @@ typedef enum {
 	PHY_INTERFACE_MODE_10GKR,
 	PHY_INTERFACE_MODE_QUSGMII,
 	PHY_INTERFACE_MODE_1000BASEKX,
+	PHY_INTERFACE_MODE_OCSGMII,
 	PHY_INTERFACE_MODE_MAX,
 } phy_interface_t;
 
@@ -289,6 +291,8 @@ static inline const char *phy_modes(phy_interface_t interface)
 		return "100base-x";
 	case PHY_INTERFACE_MODE_QUSGMII:
 		return "qusgmii";
+	case PHY_INTERFACE_MODE_OCSGMII:
+		return "ocsgmii";
 	default:
 		return "unknown";
 	}
-- 
2.43.0


