Return-Path: <linux-arm-msm+bounces-61150-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 799F4AD7D8A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 23:28:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7D23A3A54DD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 21:28:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60FCB2DECDD;
	Thu, 12 Jun 2025 21:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lbpvlZ6H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C5FD2D8DB1;
	Thu, 12 Jun 2025 21:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749763610; cv=none; b=KGvNBZN4RG+WP2f+oLuL3fEM8n+d9GFWmXfTTLpDkW5H+drd2eb3QQVC1xoRZnyHud77qyQ+eIdGvpV2O3GpbiHgFnk1Z4wFhnMPbJIzNIyeKPIUDX7sItvE1t/MShUlKntmt1qiliwuHRaOZ2p+CBAWdXAcYYZp7GjN5qPSkxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749763610; c=relaxed/simple;
	bh=US16q34C7zX6uKKctpq06uDvmccIaBfy2iK6ItBYqkE=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=EXCg7ZwSu4Gh3TzZoDvq81ci0sslo9RcoLXBDCyzXnENsmHPKDucj3yAkeGzF+RBpxuexOxsVnERCVv4nK8SblJUyhi5nebsU3LNKz2F+4fyCbpY7JvcJM5Kk/vco9ZsJZRZ0t6mhjFYi6EWaAYT3BYrdsUmx/FtRzL2V7J8+i4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lbpvlZ6H; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a5257748e1so1173133f8f.2;
        Thu, 12 Jun 2025 14:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749763607; x=1750368407; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Fo9wzmPugQy46hcPSYpcUoW3QHliUX1AUw5rA3sdlD0=;
        b=lbpvlZ6H+R3WiOpKrbbjZFWzZmsUT3pAOa6xkry1qL1sxYRt0dcCRfrd2HjYFo4+Um
         ovXkIlEWlGYFgfwcQ+EtyXB5NjLiX2CVpuHJwv+2t4UFFuhLTkKuEchCrzxBhDgkk+yq
         aCQaMAJJl5M6nemIX+VTXLsruoq1HsJ4pG/zZusg0d8UpI0+5cPjH3t+6BLyPVDFMZ+p
         8qbbjFc77EiY/RsL+dapyMMOGaO8kZEv738kEWh3ZJZswElQIm4GXRaAe3FPyJeWeuaS
         lIytffx7+ZwWmIrYkqiaPuNEXJIlgazU99URALM7ydvfFmA0iL3Tmidt8wCFq1daLaE1
         TsyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749763607; x=1750368407;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fo9wzmPugQy46hcPSYpcUoW3QHliUX1AUw5rA3sdlD0=;
        b=vgrxDJqE2WRUR8NP48x9kh3aVu+dGyUoYkoRA743Sm8rooO4neRpVJ7pFGDkP92mG6
         CXvHCCuW7XAHG8GeCDwwEdA8z4YQ45+9m7Vw6fWLZvhc9jKe1t3bXZgeKASt5g2qPIZT
         /mG3/En7mGSCXcWEtX/hsyzW3sKMvvTlRw6KQ8ozI9DhiDZtqitq4QHFRNsetgY/+D4k
         xeP5V8FPXbMuk7u1HoxIM00+b4GP0PDKvrDx+QZNrCGR7FSnPgEYiZw0D2bvjYC8HFUW
         NjZm0Yc6pI+OjY1wG58qMYTikMk8tkKLVP1ZjmRc7BvmvTZ34UN8vJOfnWS9ly4pJ8XB
         4oTg==
X-Forwarded-Encrypted: i=1; AJvYcCUbcu1ORqmQjPJGX0YLG4XJzreEc1x9IK376WvIYeCd7bIEG+MQfYGq25fbaYlwpPJI7t4a0oASTqMHniXd@vger.kernel.org
X-Gm-Message-State: AOJu0YwjnmACGmRVxOWIoPfCMGDyH8e2PwDuas3gYyADYEa8O+SBXWqf
	IPT/sxvWlOrdoN4KW1W0KCagMgwW9u5bYrOA5TwlkH4hbIyHsvSbZf35
X-Gm-Gg: ASbGncsw5Nl8F3jSUkPaEsyaxanmj8dsnK+zl7ovsNXd2qLHhZuBbewTcCfR8auH1VW
	rVvCjHLzq30iI+CQ1GJnB6jKN07TrYTaiK52SL67c30Qumgr27zCnR9V2TlqCreB8rFlihCn5hn
	z6qsTS4rCEjwPa6REnpyLF7vShNDo5I8amHYX37jUPCLDEZc1UF/5HizRinUH0CiT8seltIVfAL
	bTAgFk0frHPyPxCaq6w3bhCMbcAZk92v0mgZRhZgzsREJi/l/EmlfPkOwfZpqa6JsxlKjSOrOQ0
	r895Nnxipp8K0dzZ7ykowlQSx4N69bD30CqmFwFhlLftyoOSJjcJZSD6vknbjNXgaF+TSrbgqyR
	QIKM6d+nSKEXcNq7UZIFIO1UTprCy/qabWC2Pv205EM3tThd7TVvBrgLd58XMG1RCNmrTDayQwt
	GuWCfAjtgWcuiiRMzuOYUA8pEviQ==
X-Google-Smtp-Source: AGHT+IGjhaPDdiFgN2xGS7Y5o5eCrajDG/RKgkSt5hb2yP8w38zJXvf9AZOqP79PpvYJ+nGTlwFQqA==
X-Received: by 2002:a05:6000:4313:b0:3a4:f7db:6ff7 with SMTP id ffacd0b85a97d-3a56878834emr701000f8f.52.1749763606594;
        Thu, 12 Jun 2025 14:26:46 -0700 (PDT)
Received: from ?IPV6:2003:ea:8f22:3f00:7533:d8b1:ff14:6fe5? (p200300ea8f223f007533d8b1ff146fe5.dip0.t-ipconnect.de. [2003:ea:8f22:3f00:7533:d8b1:ff14:6fe5])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a568b5bfefsm388520f8f.88.2025.06.12.14.26.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 14:26:46 -0700 (PDT)
Message-ID: <66bb4cce-b6a3-421e-9a7b-5d4a0c75290e@gmail.com>
Date: Thu, 12 Jun 2025 23:26:52 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH net-next 2/3] net: phy: make phy_package a separate module
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

Make phy_package a separate module, so that this code is only loaded
if needed.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/net/phy/Makefile      | 3 ++-
 drivers/net/phy/phy_package.c | 3 +++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/phy/Makefile b/drivers/net/phy/Makefile
index 7827609e9..4e69597f2 100644
--- a/drivers/net/phy/Makefile
+++ b/drivers/net/phy/Makefile
@@ -3,7 +3,7 @@
 
 libphy-y			:= phy.o phy-c45.o phy-core.o phy_device.o \
 				   linkmode.o phy_link_topology.o \
-				   phy_package.o phy_caps.o mdio_bus_provider.o
+				   phy_caps.o mdio_bus_provider.o
 mdio-bus-y			+= mdio_bus.o mdio_device.o
 
 ifdef CONFIG_PHYLIB
@@ -19,6 +19,7 @@ obj-$(CONFIG_MDIO_BUS)		+= mdio-bus.o
 obj-$(CONFIG_PHYLINK)		+= phylink.o
 obj-$(CONFIG_PHYLIB)		+= libphy.o
 obj-$(CONFIG_PHYLIB)		+= mdio_devres.o
+obj-$(CONFIG_PHYLIB)		+= phy_package.o
 
 obj-$(CONFIG_NETWORK_PHY_TIMESTAMPING) += mii_timestamper.o
 
diff --git a/drivers/net/phy/phy_package.c b/drivers/net/phy/phy_package.c
index 5dd5db7e8..3024da0bb 100644
--- a/drivers/net/phy/phy_package.c
+++ b/drivers/net/phy/phy_package.c
@@ -414,3 +414,6 @@ int devm_of_phy_package_join(struct device *dev, struct phy_device *phydev,
 	return ret;
 }
 EXPORT_SYMBOL_GPL(devm_of_phy_package_join);
+
+MODULE_DESCRIPTION("PHY package support");
+MODULE_LICENSE("GPL");
-- 
2.49.0



