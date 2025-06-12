Return-Path: <linux-arm-msm+bounces-61151-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D155AD7D98
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 23:29:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8ECB33B96EB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 21:28:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DEA92DCBFD;
	Thu, 12 Jun 2025 21:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cT2UR8KA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 761D42D4B58;
	Thu, 12 Jun 2025 21:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749763696; cv=none; b=MUPGX/I4dM30T67kmoJcTNFL5pAwLdWYsLajy38vKp1E1keB1w7nAOp2dWlPiiWXJ0m/lkBfs0ZAHRUDdt4/CAbp1zJQjvmcKayCmtK1k1NLZTcPb53mVHfspC3usAwkPS+DyCAjq1GgS8GZHHvl2eWLDe2sYE9401tJ4Q0AeAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749763696; c=relaxed/simple;
	bh=le1e1vor5r4yoJAN07ddNFHwCZWwRxAQNvcpbUCjIwg=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=jXN6DoitB+1eqrFuXURdUQmL7HNtCcs0JtsSrRgN8bPsi16MFsJT8cLFjw/Ko4B4Y7fc2cVt/tBXhFh043CTfg3MJ0QZ1KABVWEG3GtMPwdXGolt0q7mbl+AH+/Gq4vDct3OXA7Hf+ObFQcnwgkHeSmSyrwtvux4n9+8ItA+isc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cT2UR8KA; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a54700a46eso1217162f8f.1;
        Thu, 12 Jun 2025 14:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749763693; x=1750368493; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RtBm7dhzS7vdeIwSr3GhYSR7TMJjCHW8IHR7lAffLu0=;
        b=cT2UR8KAVzAJwl8DYK+4sdS0ZvcedKK6IxLXOkdErQ0jyVcFZQVfH44KwiPwRPIhEi
         BbgheBn3h3eIYoyj6gxr/XwLFVQEhPy1mpb1wU4VRb63CNY8jci7VHOA4rzoU4ieaasH
         8/w9JOVBYmEVAd4E5OEFsS+l4+ZM01SqPOd8t0lJdWipLiowSDoOkH6jRTRrxqqedyyp
         42liZETjCBgIkhspnyXZozH9Y2vDMS9mox2CgO3xOhRE97GiApJGz24wxayxxqJ7lfCm
         +aePqM+4UWs+e2iALZddSfEimLs3b7WDuHUDhdfUE+8J6neNVlnr/hrMQit30ZSctiIX
         0/YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749763693; x=1750368493;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RtBm7dhzS7vdeIwSr3GhYSR7TMJjCHW8IHR7lAffLu0=;
        b=YQIKOGDvR2NRQKNMs0sehh8rMx3voy5O6EqlUMqHQv3734GX0u4Hhs3azELeQfXJxd
         42nFv4aOebLXrTPZWz+C24NGfj8zaldDUUKT2YYZ9C6/jhvvoA/KYAJ95XHTVH4nNT7p
         82aul4OdSeoxc+kmoStIK6/qTQUOYLiZyQFEOZVtFgAjq6a3pJWztLKBKHbQAF5oA0dd
         OYJXwzEixMZiX+wBh4jv0sq9E7ZGGam5UbMHcT6TucZTfZn2rV9RpfwrTDrdWBwiexSg
         4RBswPGpsNKisT3X4i4+R10ZVHV4Yb/Kc+b9DHtiJEWdgdD7CdecaYbd4h+7xflSaRQy
         LfTA==
X-Forwarded-Encrypted: i=1; AJvYcCULViTCsGHjiBg7vozKTNhJqrU5+ZrnrzDhWIDoy/n2Wi6Uv4nx3Oknb3FnK1a/hq28DTc9SlsPHn2LYX5u@vger.kernel.org
X-Gm-Message-State: AOJu0Yxscnl7o4rq/W5KG8fSg3gFpb6CgOap2Eqsd9V7snh2gzZdJobj
	xyyfscqjBg4Gys8J4oUYjCzv3wjzrhs3EKIAaC/gbRB1kCylATaTn/L2
X-Gm-Gg: ASbGncvrXjy6hpoHX7/33RMd8LlF7yY3Q1jUVz/7MuorN8/05aUu5LzrdVkklPT2PUw
	1lP5GYEVhtrR3WlFG7Xs/D1eNyxZGbviJJhG/qXgIRbznUZ25l9upCePcJ3iaAT9htbwYNZ8O5W
	RyQinrfzfIRwiHIkU4KrbIajyjdMbmL1HaAW0Rhp5a5TDbJRL53XMfV/G1KB+y8HKKYkA5EWdI0
	GvD9oxYy4QCYr/RIpnJuGWE2s5/YQaS2bXB95LQVCzXF9BL+i/nN7SydYHBo58IGs6dtTz/bOaO
	nKcxgLheQ2YcrKynL7+qd08AUKCqo5j+X1Du1upH+W103lXIyXlt7QqJVUjdBqlyCNKLGeFtS9X
	aEAFNfvEZBl6w6alXxBi6l0Xxg9NLaAXISibxjyI0/NVKzYsnZj9UOJYPQ7Z6ZXLM5i4bm7KjdQ
	XsGJObm1kkGtOdUAh4uDtof4/96Q==
X-Google-Smtp-Source: AGHT+IE1XU4nO/VzkNo3ZuofzqheSkVfnICKLzbgowD//YuyvE9aSKTHQ8v90RNFDlyeUk68AvpS0w==
X-Received: by 2002:a05:6000:1acc:b0:3a5:2875:f986 with SMTP id ffacd0b85a97d-3a56871751cmr620856f8f.44.1749763692667;
        Thu, 12 Jun 2025 14:28:12 -0700 (PDT)
Received: from ?IPV6:2003:ea:8f22:3f00:7533:d8b1:ff14:6fe5? (p200300ea8f223f007533d8b1ff146fe5.dip0.t-ipconnect.de. [2003:ea:8f22:3f00:7533:d8b1:ff14:6fe5])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a568b2ca65sm413139f8f.77.2025.06.12.14.28.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 14:28:12 -0700 (PDT)
Message-ID: <42c05496-61b2-4b09-b853-3d99b3dfe95c@gmail.com>
Date: Thu, 12 Jun 2025 23:28:18 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH net-next 3/3] net: phy: add Kconfig symbol PHY_PACKAGE
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, Paolo Abeni <pabeni@redhat.com>,
 Jakub Kicinski <kuba@kernel.org>, David Miller <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Andrew Lunn <andrew@lunn.ch>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 linux-arm-msm@vger.kernel.org,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, linux-mediatek@lists.infradead.org
References: <eec346a4-e903-48af-8150-0191932a7a0b@gmail.com>
Content-Language: en-US
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <eec346a4-e903-48af-8150-0191932a7a0b@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Only a handful of PHY drivers needs the PHY package functionality,
therefore build the module only if needed.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/net/phy/Kconfig          | 6 ++++++
 drivers/net/phy/Makefile         | 2 +-
 drivers/net/phy/mediatek/Kconfig | 1 +
 drivers/net/phy/qcom/Kconfig     | 1 +
 4 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/net/phy/Kconfig b/drivers/net/phy/Kconfig
index 53dad2482..28acc6392 100644
--- a/drivers/net/phy/Kconfig
+++ b/drivers/net/phy/Kconfig
@@ -25,6 +25,9 @@ if PHYLIB
 config SWPHY
 	bool
 
+config PHY_PACKAGE
+	 tristate
+
 config LED_TRIGGER_PHY
 	bool "Support LED triggers for tracking link state"
 	depends on LEDS_TRIGGERS
@@ -157,6 +160,7 @@ config BCM54140_PHY
 	tristate "Broadcom BCM54140 PHY"
 	depends on HWMON || HWMON=n
 	select BCM_NET_PHYLIB
+	select PHY_PACKAGE
 	help
 	  Support the Broadcom BCM54140 Quad SGMII/QSGMII PHY.
 
@@ -292,6 +296,7 @@ source "drivers/net/phy/mediatek/Kconfig"
 config MICREL_PHY
 	tristate "Micrel PHYs"
 	depends on PTP_1588_CLOCK_OPTIONAL
+	select PHY_PACKAGE
 	help
 	  Supports the KSZ9021, VSC8201, KS8001 PHYs.
 
@@ -323,6 +328,7 @@ config MICROSEMI_PHY
 	depends on MACSEC || MACSEC=n
 	depends on PTP_1588_CLOCK_OPTIONAL || !NETWORK_PHY_TIMESTAMPING
 	select CRYPTO_LIB_AES if MACSEC
+	select PHY_PACKAGE
 	help
 	  Currently supports VSC8514, VSC8530, VSC8531, VSC8540 and VSC8541 PHYs
 
diff --git a/drivers/net/phy/Makefile b/drivers/net/phy/Makefile
index 4e69597f2..b4795aaf9 100644
--- a/drivers/net/phy/Makefile
+++ b/drivers/net/phy/Makefile
@@ -19,7 +19,7 @@ obj-$(CONFIG_MDIO_BUS)		+= mdio-bus.o
 obj-$(CONFIG_PHYLINK)		+= phylink.o
 obj-$(CONFIG_PHYLIB)		+= libphy.o
 obj-$(CONFIG_PHYLIB)		+= mdio_devres.o
-obj-$(CONFIG_PHYLIB)		+= phy_package.o
+obj-$(CONFIG_PHY_PACKAGE)	+= phy_package.o
 
 obj-$(CONFIG_NETWORK_PHY_TIMESTAMPING) += mii_timestamper.o
 
diff --git a/drivers/net/phy/mediatek/Kconfig b/drivers/net/phy/mediatek/Kconfig
index 9f30a91be..bb7dc8762 100644
--- a/drivers/net/phy/mediatek/Kconfig
+++ b/drivers/net/phy/mediatek/Kconfig
@@ -27,6 +27,7 @@ config MEDIATEK_GE_SOC_PHY
 	depends on ARCH_AIROHA || (ARCH_MEDIATEK && NVMEM_MTK_EFUSE) || \
 		   COMPILE_TEST
 	select MTK_NET_PHYLIB
+	select PHY_PACKAGE
 	help
 	  Supports MediaTek SoC built-in Gigabit Ethernet PHYs.
 
diff --git a/drivers/net/phy/qcom/Kconfig b/drivers/net/phy/qcom/Kconfig
index 570626cc8..bba14be8d 100644
--- a/drivers/net/phy/qcom/Kconfig
+++ b/drivers/net/phy/qcom/Kconfig
@@ -24,6 +24,7 @@ config QCA808X_PHY
 config QCA807X_PHY
 	tristate "Qualcomm QCA807x PHYs"
 	select QCOM_NET_PHYLIB
+	select PHY_PACKAGE
 	depends on OF_MDIO
 	help
 	  Currently supports the Qualcomm QCA8072, QCA8075 and the PSGMII
-- 
2.49.0



