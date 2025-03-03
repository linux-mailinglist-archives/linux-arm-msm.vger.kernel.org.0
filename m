Return-Path: <linux-arm-msm+bounces-50054-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A18DA4CC93
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Mar 2025 21:16:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4EB7A1892199
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Mar 2025 20:17:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FA2B1EBFF8;
	Mon,  3 Mar 2025 20:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f2WEyQEd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A89F72B9AA;
	Mon,  3 Mar 2025 20:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741033010; cv=none; b=e3Jdz/doi8y0uB2krDWnV6Gguq0YysadlvN1uBiNf9CgfKc3w2MZ9K9gCJbJVsWV1ibVb1kIA6KVeKlUbECw4z/M4tWs9KXcanZ52oJJ8yR3ko7HPpmTS+SaA4KJ++QP8rLUkBEdTfFkyIytEhXqA0N0aheX5+H1PaiPTBOrR1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741033010; c=relaxed/simple;
	bh=9YIlMHckwHi3J4IY4KKmxJlUxoiEM2/e16JP9LPu9JA=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=QYXBuxLiiwrGP1IZIqpWc6oL9N6EdOcfnJQKRhiLf3sn7cjWlMjIayZKD2jCijWdYUaxntKhFLQ0j/q6tD78oowczH/K9OAg6/40WnwD19q6RnWvxsWzt38ZJA5taykX4kO6FqAyt2m/izg7IFGV64QNY8/l+8kFMOZg9V0M2Go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f2WEyQEd; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43bc4b1603fso7927795e9.0;
        Mon, 03 Mar 2025 12:16:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741033007; x=1741637807; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vQhsG9cL8t6XLRwybgTrsHxaRynMsLOxVdLp6vkX61M=;
        b=f2WEyQEdDgXHwdZJIcyBuwrKKjwLuZf1pwDDMRrl0F90WQp0Zu1qDWFyOravHQUjYd
         znoTfzU5O6Zh55FUlzNDOotmndwZBew8MHg/OsPtGO+M9Zjek19R91+msPk0cjf/KJn2
         spzTTdcr5DzOCB1MlfiWkqDMa50DAfzFvdySHOZqRwO+n3V3Krccvb/bs9gl4BRk1xt5
         vfyMqQeWHuw6VDnjk5crk8J9ZQhSAzaTrQMW45jKkEgpIk8Z4cHYcC+ZhDYer0Ieth94
         OrmpskPfhjXHmzblEN191xenzCswgFht/108Vo2IzNl5BnJsMKLjOoQ7SOCCGwgMCBKz
         k1LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741033007; x=1741637807;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vQhsG9cL8t6XLRwybgTrsHxaRynMsLOxVdLp6vkX61M=;
        b=LInLEFz+RPivEI7zFL56z9ghMwi3EZiwdrYq7lTMxm2UaBrK30AXilzjprqRtQsr+/
         Lk/PJfBEhM/a6Gqfe4EfIanT3nDCGffOOPXxdobs0ZGb0ed8dGokTjx3z3KwGuaVmWB9
         BICkW6F4H3/8J6qmBAM0ebL3nxtnX/GG0LJDHYl2hSiZYQCUiyxw6UpOesjqh0b4ixHK
         jk0kSQXsg1ZxU/ZtEoFIdNLnViKRmOGbMmvnFvTlT4W2LUmFsXcWPH1mXKCpsDejuusz
         tUa4bxPdcyrw+AKbk6S+u/WR0HwThxsJ1j3nbOwmdhg09BCZvT77hH702rTu6qVfVxJd
         SLgQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmw/hYlMm+SB1e8ing+41kMVHWmjNNOSDGuYQcEF5bSB0NRgvNfmR2+KM4MBa4vl1eSgNzmw/oLi2faH+w@vger.kernel.org
X-Gm-Message-State: AOJu0YzGRfsXTRFeQHw/Yg7839gQEpPQ8bwCnVGPF1iXFc9AnZU5efdF
	PHP7lTpQUQwz8o0dS3E0zmhM7Fd7kI3OR9KWHCt+hiUuh21w+Ed8
X-Gm-Gg: ASbGncsqxDynOw5ohY9tfU6lAqoxBlEKRujrUme3zNEZKAEegLvlaLW3nKnONXeCDNA
	rYb83KLwlZYOMwgsUwPX7Y5/WGZ3OzXxW+tCn/1qu81khXQRtYFm6zhIztBgbnEZwcbXcoweHvG
	otTeR1kU0PjolyAvkxYdpnusCH+VERQbD1XOUXZOZPvStYYm5xFiA3YcnDDM7HJm8oOtwplDWH/
	Gxe4vBQNfOIBkmDNgspU6Weylc7WHISYB2hFamQKrdkWbtEM8Tny5rvRpTv6mtRPAZJMoIudbKi
	qBH+1gocE2tlC8UTYC0wCXlb6jjpj/MPzaQ3VjhCeTfDbuf6Vvp2cjhllx9TUXdrGq1RHu+AHqs
	yCA/glQwMMIf3MUcD/9cyPEDkaZ+R0uZ3qLCj7jiz5c6Actk1dxptLg43HdKge3pKxe8s8mOlBU
	+QgKWoIazYM/e4CYq3BGp63ewwFgEcH2F9Z7zo
X-Google-Smtp-Source: AGHT+IE6K5QuPL0CYDavUECDApY4RUDAY7s25l+mTuSsN7chkj2mJAKPLCyG8n2b4/sGMgLXiSRYSQ==
X-Received: by 2002:a05:600c:1caa:b0:43b:c390:b77f with SMTP id 5b1f17b1804b1-43bc390b9ebmr29766695e9.26.1741033006923;
        Mon, 03 Mar 2025 12:16:46 -0800 (PST)
Received: from ?IPV6:2a02:3100:af60:7000:f08c:4f29:ab35:752a? (dynamic-2a02-3100-af60-7000-f08c-4f29-ab35-752a.310.pool.telefonica.de. [2a02:3100:af60:7000:f08c:4f29:ab35:752a])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43bbed8b26asm61412155e9.22.2025.03.03.12.16.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Mar 2025 12:16:46 -0800 (PST)
Message-ID: <61ee43ec-be20-4be1-bfad-d18d2a4fae2b@gmail.com>
Date: Mon, 3 Mar 2025 21:17:54 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH net-next v3 6/8] net: phy: mscc: use new phy_package_shared
 getters
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 David Miller <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Daniel Golle <daniel@makrotopia.org>, Qingfang Deng <dqfext@gmail.com>,
 SkyLake Huang <SkyLake.Huang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Richard Cochran <richardcochran@gmail.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, Robert Marko <robimarko@gmail.com>,
 =?UTF-8?Q?K=C3=B6ry_Maincent?= <kory.maincent@bootlin.com>,
 Rosen Penev <rosenp@gmail.com>
References: <5c5e60b3-0378-4960-8cf0-07ce0e219c68@gmail.com>
Content-Language: en-US
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <5c5e60b3-0378-4960-8cf0-07ce0e219c68@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Use the new getters for members of struct phy_package_shared.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/net/phy/mscc/mscc_ptp.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/net/phy/mscc/mscc_ptp.c b/drivers/net/phy/mscc/mscc_ptp.c
index 738a8822f..ed8fb14a7 100644
--- a/drivers/net/phy/mscc/mscc_ptp.c
+++ b/drivers/net/phy/mscc/mscc_ptp.c
@@ -17,6 +17,7 @@
 #include <linux/udp.h>
 #include <linux/unaligned.h>
 
+#include "../phylib.h"
 #include "mscc.h"
 #include "mscc_ptp.h"
 
@@ -645,11 +646,12 @@ static int __vsc85xx_gettime(struct ptp_clock_info *info, struct timespec64 *ts)
 {
 	struct vsc85xx_ptp *ptp = container_of(info, struct vsc85xx_ptp, caps);
 	struct phy_device *phydev = ptp->phydev;
-	struct vsc85xx_shared_private *shared =
-		(struct vsc85xx_shared_private *)phydev->shared->priv;
 	struct vsc8531_private *priv = phydev->priv;
+	struct vsc85xx_shared_private *shared;
 	u32 val;
 
+	shared = phy_package_get_priv(phydev);
+
 	val = vsc85xx_ts_read_csr(phydev, PROCESSOR, MSCC_PHY_PTP_LTC_CTRL);
 	val |= PTP_LTC_CTRL_SAVE_ENA;
 	vsc85xx_ts_write_csr(phydev, PROCESSOR, MSCC_PHY_PTP_LTC_CTRL, val);
@@ -696,11 +698,12 @@ static int __vsc85xx_settime(struct ptp_clock_info *info,
 {
 	struct vsc85xx_ptp *ptp = container_of(info, struct vsc85xx_ptp, caps);
 	struct phy_device *phydev = ptp->phydev;
-	struct vsc85xx_shared_private *shared =
-		(struct vsc85xx_shared_private *)phydev->shared->priv;
 	struct vsc8531_private *priv = phydev->priv;
+	struct vsc85xx_shared_private *shared;
 	u32 val;
 
+	shared = phy_package_get_priv(phydev);
+
 	vsc85xx_ts_write_csr(phydev, PROCESSOR, MSCC_PHY_PTP_LTC_LOAD_SEC_MSB,
 			     PTP_LTC_LOAD_SEC_MSB(ts->tv_sec));
 	vsc85xx_ts_write_csr(phydev, PROCESSOR, MSCC_PHY_PTP_LTC_LOAD_SEC_LSB,
@@ -1580,8 +1583,7 @@ int vsc8584_ptp_probe(struct phy_device *phydev)
 
 int vsc8584_ptp_probe_once(struct phy_device *phydev)
 {
-	struct vsc85xx_shared_private *shared =
-		(struct vsc85xx_shared_private *)phydev->shared->priv;
+	struct vsc85xx_shared_private *shared = phy_package_get_priv(phydev);
 
 	/* Initialize shared GPIO lock */
 	mutex_init(&shared->gpio_lock);
-- 
2.48.1



