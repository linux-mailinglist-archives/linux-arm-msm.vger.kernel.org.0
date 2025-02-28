Return-Path: <linux-arm-msm+bounces-49893-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 27889A4A555
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 22:48:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E3325189BC8F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 21:48:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDB051DE2A4;
	Fri, 28 Feb 2025 21:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z183p9dP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 375DA1DC197;
	Fri, 28 Feb 2025 21:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740779320; cv=none; b=EsrG26bqbio8Si/24i2z9tMaHG54lFZNl5u3FQUk8b8vFgAtv08yYe23+Mv7tYxO2OsCpM+8PXT+cu03YbUAQXPoHKXhebbhSb4w+aUVDqTUaF8APW9Hz2xTHiLsP23gqOd/hjqDg+C6PMl0mqWp4DsvPwXnxmTQuxC9N4zVV+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740779320; c=relaxed/simple;
	bh=nGdrqzmYBWLlIyKySsbXmwHw//4YoXKMbTDVFXoHdSU=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=qeCZEQTLdolbPIQvZs3AcryoZ81W43GRF9/JjMEtzduPzgByXreebA6pzux9SYECFwg+pYECyXPAN2FYJKu4lVdAMuLzGqMp2zY4l9f1kvJmu88b9is/NV9AdnSKVTYBly5KivrI6LcVourenOQ2iNfXzOFfK95q/JnutdXBJ68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z183p9dP; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-abec8b750ebso422039166b.0;
        Fri, 28 Feb 2025 13:48:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740779317; x=1741384117; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BdFnhhzQEC3jcbLOShIpWKd9ImN69zhVCCxS6xvU9/c=;
        b=Z183p9dPS6nfQQneoVoeizW2vngPQaQMf1P3JlcDnRQEVJG0b3x5q3SniKiS6k8PjA
         CFT1A1vgRcE0fJn3px1NqFfLS8Tu6QDBIJBXLw7EYFoQsTCvgRAsT3Rmm1p7s8+D/0Xv
         BajS5VRGVbgc4kxs/xiqhrSbenMzz3ZDgwK0TAcN03cuWzrogTv8SdCo9/SWrtmjU+YM
         EUh2g+yrFTPFIKXrWBzvxBuzpS82xO3bZurdZN7N30/h9s+0k431iMo8Ja0r8Ro1BYzt
         UqfsSI7uMoBp99ZD/4STWN5D0O6CSaXaWy4sU1nXTk2GK8B9+gi7wyX1s6Sg2rljFbhI
         lFuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740779317; x=1741384117;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BdFnhhzQEC3jcbLOShIpWKd9ImN69zhVCCxS6xvU9/c=;
        b=RG00843w33Ht96kSpCCas0dLMbPuwHydfPE0JtXYXf/5eP2aSReRoJr9HBUvO6SBdx
         l+4atRQbjLX2qWy8SiX16v8iOcE7GhK0FiDvInE8hV/IKGjcLszl5ZXT3mLdJUV9gU3n
         tzZgKTjwROVbCb+OgYXPngPWdAUj6UIrB3/ZXYb76U0rXfbYejFdcOaW9FEh1Wb03uko
         Hm22xTVyEfQgOtolOJA0OD/B4ezV5HH/5O1xjFRMkokWQ+FQg5u99ADiGMSux2umP6cY
         vBv9X6w/gGt15tavrZxnYuvvvFpv9tqLx79EsVV8yRgCwO+NCNIcpqiExsNsgJJ4dGOI
         Omyw==
X-Forwarded-Encrypted: i=1; AJvYcCUSBsK3Vg7Ss7p/yDgTP0a45JgidSNuSA6lNLidUh0ST4VKnGF5jeFSczkKTQDws76wKNI1N+qHPe7l9Wax@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6mbWQ+goZSk8/5hrUz+N+jZH6iqPlebnmXGguyco/TP0gXCR7
	IkJ/cQTHj2TmCQCpbDKCg1nsFhRTQiAgGshhYEMpCdxqHKE8MkqD
X-Gm-Gg: ASbGnct0bf3O/NU9Z7muF0RfD1e+fBRFD3c5vGyKEWh5WixikChJQr264CCVUUx6d1H
	VHW4vuUCs1CSCNf36SSbcS9ejiftj1kFGZSkAFeJpzW1Hay3Ul9zPwcumktDbbQ9y6+wauilNMF
	vxRGYiRJaDPUGXouIss3Hk0IW3Q+O4miy6gDbFz+9ihiHS3Hto98+ziaQQIp65FcPisxf6Bd0b6
	+I0o+f9Z2oa5x+uOJ6gx33ZupwMPYRAF9s3v0QWZllObjVono4aYGh4N7iwSaKe9xIv2POLVhJk
	nvV/NHtbMTNO4RgK7haCRjG/omLrcSi3fcqTQ2t/T/pXLBlxPKrrLZt3PGjyA+fTKnF3YPiAVwq
	P+DNLExNWZWnUIoG4DahTDhM7d1LC0MGPN4F1dxeSb8fyqif90WXq/nEOET8cECw5CJD0x/A7LB
	hPCaPpe8m28mmHjdUNcQ==
X-Google-Smtp-Source: AGHT+IGuc7T5ZPUaJlrjeMMzg7I4sdxgXUWWoxuE3TuzE3PG9L1NUSegwaSuEsT0oIrc2J6ogPxZTA==
X-Received: by 2002:a17:906:c108:b0:abb:eec3:394b with SMTP id a640c23a62f3a-abf26822d5fmr478801666b.46.1740779317355;
        Fri, 28 Feb 2025 13:48:37 -0800 (PST)
Received: from ?IPV6:2a02:3100:af43:5200:e57d:90a4:e6b5:1175? (dynamic-2a02-3100-af43-5200-e57d-90a4-e6b5-1175.310.pool.telefonica.de. [2a02:3100:af43:5200:e57d:90a4:e6b5:1175])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-abf4b7385ebsm42461666b.106.2025.02.28.13.48.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Feb 2025 13:48:36 -0800 (PST)
Message-ID: <0edd6489-ecf8-451b-b175-6d6bbc6b9a1f@gmail.com>
Date: Fri, 28 Feb 2025 22:49:39 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH net-next v2 5/8] net: phy: mediatek: use new
 phy_package_shared getters
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
 xsFNBF/0ZFUBEAC0eZyktSE7ZNO1SFXL6cQ4i4g6Ah3mOUIXSB4pCY5kQ6OLKHh0FlOD5/5/
 sY7IoIouzOjyFdFPnz4Bl3927ClT567hUJJ+SNaFEiJ9vadI6vZm2gcY4ExdIevYHWe1msJF
 MVE4yNwdS+UsPeCF/6CQQTzHc+n7DomE7fjJD5J1hOJjqz2XWe71fTvYXzxCFLwXXbBiqDC9
 dNqOe5odPsa4TsWZ09T33g5n2nzTJs4Zw8fCy8rLqix/raVsqr8fw5qM66MVtdmEljFaJ9N8
 /W56qGCp+H8Igk/F7CjlbWXiOlKHA25mPTmbVp7VlFsvsmMokr/imQr+0nXtmvYVaKEUwY2g
 86IU6RAOuA8E0J5bD/BeyZdMyVEtX1kT404UJZekFytJZrDZetwxM/cAH+1fMx4z751WJmxQ
 J7mIXSPuDfeJhRDt9sGM6aRVfXbZt+wBogxyXepmnlv9K4A13z9DVLdKLrYUiu9/5QEl6fgI
 kPaXlAZmJsQfoKbmPqCHVRYj1lpQtDM/2/BO6gHASflWUHzwmBVZbS/XRs64uJO8CB3+V3fa
 cIivllReueGCMsHh6/8wgPAyopXOWOxbLsZ291fmZqIR0L5Y6b2HvdFN1Xhc+YrQ8TKK+Z4R
 mJRDh0wNQ8Gm89g92/YkHji4jIWlp2fwzCcx5+lZCQ1XdqAiHQARAQABzSZIZWluZXIgS2Fs
 bHdlaXQgPGhrYWxsd2VpdDFAZ21haWwuY29tPsLBjgQTAQgAOBYhBGxfqY/yOyXjyjJehXLe
 ig9U8DoMBQJf9GRVAhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEHLeig9U8DoMSycQ
 AJbfg8HZEK0ljV4M8nvdaiNixWAufrcZ+SD8zhbxl8GispK4F3Yo+20Y3UoZ7FcIidJWUUJL
 axAOkpI/70YNhlqAPMsuudlAieeYZKjIv1WV5ucNZ3VJ7dC+dlVqQdAr1iD869FZXvy91KhJ
 wYulyCf+s4T9YgmLC6jLMBZghKIf1uhSd0NzjyCqYWbk2ZxByZHgunEShOhHPHswu3Am0ftt
 ePaYIHgZs+Vzwfjs8I7EuW/5/f5G9w1vibXxtGY/GXwgGGHRDjFM7RSprGOv4F5eMGh+NFUJ
 TU9N96PQYMwXVxnQfRXl8O6ffSVmFx4H9rovxWPKobLmqQL0WKLLVvA/aOHCcMKgfyKRcLah
 57vGC50Ga8oT2K1g0AhKGkyJo7lGXkMu5yEs0m9O+btqAB261/E3DRxfI1P/tvDZpLJKtq35
 dXsj6sjvhgX7VxXhY1wE54uqLLHY3UZQlmH3QF5t80MS7/KhxB1pO1Cpcmkt9hgyzH8+5org
 +9wWxGUtJWNP7CppY+qvv3SZtKJMKsxqk5coBGwNkMms56z4qfJm2PUtJQGjA65XWdzQACib
 2iaDQoBqGZfXRdPT0tC1H5kUJuOX4ll1hI/HBMEFCcO8++Bl2wcrUsAxLzGvhINVJX2DAQaF
 aNetToazkCnzubKfBOyiTqFJ0b63c5dqziAgzsFNBF/0ZFUBEADF8UEZmKDl1w/UxvjeyAeX
 kghYkY3bkK6gcIYXdLRfJw12GbvMioSguvVzASVHG8h7NbNjk1yur6AONfbUpXKSNZ0skV8V
 fG+ppbaY+zQofsSMoj5gP0amwbwvPzVqZCYJai81VobefTX2MZM2Mg/ThBVtGyzV3NeCpnBa
 8AX3s9rrX2XUoCibYotbbxx9afZYUFyflOc7kEpc9uJXIdaxS2Z6MnYLHsyVjiU6tzKCiVOU
 KJevqvzPXJmy0xaOVf7mhFSNQyJTrZpLa+tvB1DQRS08CqYtIMxRrVtC0t0LFeQGly6bOngr
 ircurWJiJKbSXVstLHgWYiq3/GmCSx/82ObeLO3PftklpRj8d+kFbrvrqBgjWtMH4WtK5uN5
 1WJ71hWJfNchKRlaJ3GWy8KolCAoGsQMovn/ZEXxrGs1ndafu47yXOpuDAozoHTBGvuSXSZo
 ythk/0EAuz5IkwkhYBT1MGIAvNSn9ivE5aRnBazugy0rTRkVggHvt3/7flFHlGVGpBHxFUwb
 /a4UjJBPtIwa4tWR8B1Ma36S8Jk456k2n1id7M0LQ+eqstmp6Y+UB+pt9NX6t0Slw1NCdYTW
 gJezWTVKF7pmTdXszXGxlc9kTrVUz04PqPjnYbv5UWuDd2eyzGjrrFOsJEi8OK2d2j4FfF++
 AzOMdW09JVqejQARAQABwsF2BBgBCAAgFiEEbF+pj/I7JePKMl6Fct6KD1TwOgwFAl/0ZFUC
 GwwACgkQct6KD1TwOgxUfg//eAoYc0Vm4NrxymfcY30UjHVD0LgSvU8kUmXxil3qhFPS7KA+
 y7tgcKLHOkZkXMX5MLFcS9+SmrAjSBBV8omKoHNo+kfFx/dUAtz0lot8wNGmWb+NcHeKM1eb
 nwUMOEa1uDdfZeKef/U/2uHBceY7Gc6zPZPWgXghEyQMTH2UhLgeam8yglyO+A6RXCh+s6ak
 Wje7Vo1wGK4eYxp6pwMPJXLMsI0ii/2k3YPEJPv+yJf90MbYyQSbkTwZhrsokjQEaIfjrIk3
 rQRjTve/J62WIO28IbY/mENuGgWehRlTAbhC4BLTZ5uYS0YMQCR7v9UGMWdNWXFyrOB6PjSu
 Trn9MsPoUc8qI72mVpxEXQDLlrd2ijEWm7Nrf52YMD7hL6rXXuis7R6zY8WnnBhW0uCfhajx
 q+KuARXC0sDLztcjaS3ayXonpoCPZep2Bd5xqE4Ln8/COCslP7E92W1uf1EcdXXIrx1acg21
 H/0Z53okMykVs3a8tECPHIxnre2UxKdTbCEkjkR4V6JyplTS47oWMw3zyI7zkaadfzVFBxk2
 lo/Tny+FX1Azea3Ce7oOnRUEZtWSsUidtIjmL8YUQFZYm+JUIgfRmSpMFq8JP4VH43GXpB/S
 OCrl+/xujzvoUBFV/cHKjEQYBxo+MaiQa1U54ykM2W4DnHb1UiEf5xDkFd4=
In-Reply-To: <8b290ccf-ca0c-422f-b853-6fc7af045f99@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Use the new getters for members of struct phy_package_shared.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/net/phy/mediatek/mtk-ge-soc.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/net/phy/mediatek/mtk-ge-soc.c b/drivers/net/phy/mediatek/mtk-ge-soc.c
index 9de6fbb45..175cf5239 100644
--- a/drivers/net/phy/mediatek/mtk-ge-soc.c
+++ b/drivers/net/phy/mediatek/mtk-ge-soc.c
@@ -8,6 +8,7 @@
 #include <linux/phy.h>
 #include <linux/regmap.h>
 
+#include "../phylib.h"
 #include "mtk.h"
 
 #define MTK_GPHY_ID_MT7981			0x03a29461
@@ -1278,7 +1279,7 @@ static int mt798x_phy_led_hw_control_set(struct phy_device *phydev, u8 index,
 
 static bool mt7988_phy_led_get_polarity(struct phy_device *phydev, int led_num)
 {
-	struct mtk_socphy_shared *priv = phydev->shared->priv;
+	struct mtk_socphy_shared *priv = phy_package_get_priv(phydev);
 	u32 polarities;
 
 	if (led_num == 0)
@@ -1317,7 +1318,7 @@ static int mt7988_phy_fix_leds_polarities(struct phy_device *phydev)
 static int mt7988_phy_probe_shared(struct phy_device *phydev)
 {
 	struct device_node *np = dev_of_node(&phydev->mdio.bus->dev);
-	struct mtk_socphy_shared *shared = phydev->shared->priv;
+	struct mtk_socphy_shared *shared = phy_package_get_priv(phydev);
 	struct regmap *regmap;
 	u32 reg;
 	int ret;
@@ -1368,7 +1369,7 @@ static int mt7988_phy_probe(struct phy_device *phydev)
 			return err;
 	}
 
-	shared = phydev->shared->priv;
+	shared = phy_package_get_priv(phydev);
 	priv = &shared->priv[phydev->mdio.addr];
 
 	phydev->priv = priv;
-- 
2.48.1



