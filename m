Return-Path: <linux-arm-msm+bounces-49894-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42DA9A4A558
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 22:49:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C53BD17177C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 21:49:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F7651DE2A6;
	Fri, 28 Feb 2025 21:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KI/Wijha"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CB591CCEDB;
	Fri, 28 Feb 2025 21:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740779357; cv=none; b=dpLWzabNYAtuAD3vFTZXrnKQcIcOgLtR23ghYBmyNLuhYvuc2QEKkRZHZTcEhqTKNE2AZrvChK1wMMQS3CbLguihsnEZ5OhwpD3V43Fm4P6aTVlKRvUpUfaMCtfiQIYx/RUzmwI1P23M4M8F6eRXOs4af/t/e6bwESPjnZxn9dI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740779357; c=relaxed/simple;
	bh=9YIlMHckwHi3J4IY4KKmxJlUxoiEM2/e16JP9LPu9JA=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Y2yQMbvNC982LpkMsYZY3W8hoyA/5dMobeBtjjFOQ9D0KTOwOtcbvKiof2jqWEO/UFxJW6/B594L38es7bZqIedl3Dg8DZfKVVk2M63fugGs5eVMLbypOKPIz5P8TpL5/nz4bevH4u+q3jrq2AopuTgNgnIL5/VdqpoPdlScqPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KI/Wijha; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5e4cbade42aso3516539a12.1;
        Fri, 28 Feb 2025 13:49:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740779354; x=1741384154; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vQhsG9cL8t6XLRwybgTrsHxaRynMsLOxVdLp6vkX61M=;
        b=KI/WijhaQZAF4PAA210Rwut0nWTtMQB5DeibFZ06eucRet4rZwqTMVvUeEtkkF+Oiw
         XTmWnbifhjlo4dbXHSJDNyCNngiQQfKFtr3k+0B2FQBOUblECWTQvJQBRTpdS3PjnvYN
         xGyERvmuLZfCMe90eraaZP3CXVh7kpipEv2Cv5/+cnX7r3oEzzcioiPGTvYbt5pt5wV1
         g+940ciJY7wxoKNfr3wOrsgauTZyZF/mm2m8VXZJS2kfgzeTolRmvzEKX1jYXANlC9A5
         IEZjEbmN7ryBJdlSBuAgpWM6nbem/rn6yrt/Sc+GQEmg9HsG8JtSfJ9XAiapR6EvPEbo
         JzLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740779354; x=1741384154;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vQhsG9cL8t6XLRwybgTrsHxaRynMsLOxVdLp6vkX61M=;
        b=V8IwMvRaRSExrhgv/eGz59bLMS8O1ijKQZ2ZzTG1yCrMYyjdsj3+LUErF29Q47heeb
         8jPfGg0xq+I7M5X2f98ofTwI0gAk+G412+8q5NVk6E5pltgxmfZzXp76bNpGAeInZCAR
         Tdn7YIA+LXWyn070fFJLEl/Uex0S6s5KS0lGicBkfh5uaPeaVM34OSA9xr37FDV8DpUQ
         0RTAPIh7xzaOhUEznGTERyyDUQAB9btB98oAyWmF5Hig3tO9ufPM4xqwE0Jw39HgYnCz
         /mJc/v+Dq0dYaSH0Jfw+yySGckFWjQoMf4fnQucYXoUAKlYTBi+bVOtWC/kwPcaRK/MX
         2n1g==
X-Forwarded-Encrypted: i=1; AJvYcCUndyDqe+9nwMy5yzRk3rg/tQMWZ8+UeVktjco/J496vQHtG3ofNY61nWWaOzhEOkPJxcRXe3Z49nVgcoQy@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0G0T8PrksjaApR+ir4Ri5hyN7c+3qFQkGLLqzJ/mKqTf4ORmF
	E9lD5OQTYJP9OykmDDMe9YgtV2A8RQU6Rzmho76yKSbG9A3znK2k
X-Gm-Gg: ASbGncv80xzZs/58Iv+RtyJcb4XJffo4Q1e5nGhSr1saeaBIVL2VUskoAQ/XrJHtcg2
	ozjABQM/8PWRRgIORzaS6pacIX3/nPmswpsM9HyUXaEcRPAQBAD2AS0TIkGN40GjkUVKMjbo5Ud
	YsI/h1ZydqoxGY/iDFQMP983H6ERwkcQoKXfhasPeETuEEez+uU2W5+pHVqXofxwkzMhHpwaU8x
	dBaVZdMJC/Pf4WTN+hsOjuaY55RqhhmlcnMRmE31a29NZ9st5RYv8BHKDejhi+zGLwXECsPM4aS
	UsQ5ochj6reDaTBSo6k4KDuq73JftsC6sFYE1fmbEsP2w7Wygit4JgThEJBTO4F8TizJLLiU1Sd
	lK+ZWaM2tZVo9Zg/HKd5U8F1BVXk/U7BjLCzlaVY1SKeo/m7otDjsIdGmxXe4qM2SlCuZWzpVhw
	KYwBp3mNx5Zgm1UAoKGA==
X-Google-Smtp-Source: AGHT+IHfENdhnDDbvIXUNqMQRcVe5dORm4uQA352jlk3tqJUcuFLr7u/SHH2IJZc279hHWVfavJNVg==
X-Received: by 2002:a17:907:6d17:b0:ab7:d1d0:1a84 with SMTP id a640c23a62f3a-abf26204a1cmr407627266b.4.1740779353696;
        Fri, 28 Feb 2025 13:49:13 -0800 (PST)
Received: from ?IPV6:2a02:3100:af43:5200:e57d:90a4:e6b5:1175? (dynamic-2a02-3100-af43-5200-e57d-90a4-e6b5-1175.310.pool.telefonica.de. [2a02:3100:af43:5200:e57d:90a4:e6b5:1175])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-abf0c75feffsm348354166b.153.2025.02.28.13.49.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Feb 2025 13:49:13 -0800 (PST)
Message-ID: <d45f159c-d37b-47e7-bece-0e58782818e1@gmail.com>
Date: Fri, 28 Feb 2025 22:50:15 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH net-next v2 6/8] net: phy: mscc: use new phy_package_shared
 getters
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Eric Dumazet <edumazet@google.com>, David Miller <davem@davemloft.net>,
 Daniel Golle <daniel@makrotopia.org>, Qingfang Deng <dqfext@gmail.com>,
 SkyLake Huang <SkyLake.Huang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Richard Cochran <richardcochran@gmail.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, Robert Marko <robimarko@gmail.com>,
 =?UTF-8?Q?K=C3=B6ry_Maincent?= <kory.maincent@bootlin.com>
References: <8b290ccf-ca0c-422f-b853-6fc7af045f99@gmail.com>
Content-Language: en-US
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <8b290ccf-ca0c-422f-b853-6fc7af045f99@gmail.com>
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



