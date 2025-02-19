Return-Path: <linux-arm-msm+bounces-48566-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 74BA6A3CB15
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 22:12:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3E04F189CFA7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 21:09:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3CD1253F13;
	Wed, 19 Feb 2025 21:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A8xLZQKQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13F07253F0B;
	Wed, 19 Feb 2025 21:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739999210; cv=none; b=tWjslxUZlJrYR0AmvzyRNMxbGzrV+TG7aXRO2PIJILr04/W3LbDJxCu5SoYn61e7iPtLS6kwjzneG50KFjgNL2e8D5LCuQH5IX25jb3CNAkXKoqSgH7+ZERlrm0w3L9uanLzVY0ETMfVU8DhJRZZz65hv7iPP4G7xQRdD16Am84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739999210; c=relaxed/simple;
	bh=hjpnTi4N47guyVdYhYYYQAn/UxFSdHZEDgOBDY7fSQo=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=kLnIJX+C781i+ocexosihM9ak8Yv10mnny2cXZ3ytpTQX5fmYqfsb3rrCCSfwZbp6WVYbIfYF/vgd2y4ZUcDLTl5j0VkhPVEgbJTVGhZQCPFGaqrmRhu5P4gSko63khMRzRgK2mDA8sdmHsKTk9lqeREopBGLl54tqLwAtArXTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A8xLZQKQ; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-abbac134a19so48060466b.0;
        Wed, 19 Feb 2025 13:06:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739999207; x=1740604007; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=sQOC6VBdO7JTZWJW4HQ8BotVjJhyczmNPNqI6tVh0A0=;
        b=A8xLZQKQi8A50stR7EojQhSwoxmCCZWimVNyk/DXH1OK4t/ALK/gJmgUQIWV2eGs4J
         jg64PCTepiATveH0ydvgfpEHJp1UvneGMEXeXB7nfT9Gtg/RhJcatEkeIT5GlfGb6DMJ
         cyDDgZvNt/pEpjnXeaNvqjraqZLvBuVpAjsCKe3gNrrt6TEbU9e+BMosxUnxC78uHZ6N
         nCpqQWrQPE2Ez5jtTPsiqXJgEK90SN4/JzMaSFI2QqeNlFr+TydC0BWRX8/APCYsXrD2
         PPL0Y+Z/EHb5Bl2AHjzVrzhlNvInTDi06QbK43waytxbbfkZinGtuCJDay2dE0yCU4HG
         47iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739999207; x=1740604007;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sQOC6VBdO7JTZWJW4HQ8BotVjJhyczmNPNqI6tVh0A0=;
        b=QqEAg/Cbn2yUjBImaNzd6/2dup+6DdDooqPQi+Xpb7+FVtDz5QmLHpA8pUUC5lTUpW
         r0yjNlNXwaXROCjkaTlD8FUSDRkjZJPyPLEMyqADlfMD5nwpljrW+t3h7n93UW4LnmfK
         kE+5Krzofjc1D23QVPeRSxF77u1r1t+SYsB1jNxVFAT+/s2f7g8LhAl6nMC2UYD7MLNP
         du+tyQIGRTE3QU0lklk2wteLIkXJ5Y6rFDhprlIOVeFY2xJlYeVRzX4Clucp/ssJBVlE
         CMakHxahZm9ya5+VQleJijpY9Sk7FicLDRg4iLjILl1w8fUuzwwVYZHkponZEeX//Lpz
         Je+A==
X-Forwarded-Encrypted: i=1; AJvYcCXqa4M5ne6A7iYnY+GS9hZDRIeD+t0sMHNkNxWS0LfxpJgJiavJAJLMqu+vckSsG2UodGp/UlPqqlvraCSu@vger.kernel.org
X-Gm-Message-State: AOJu0YyqYh3azwqE/HGhIm/pRw4X2Mmgk4Vq4dTOq8KqG2P6xQkaOmJ1
	uL4rdmEorBrbBjmCtHamChsLcvS/VvHVAGk5XjnHIQYy6bNs7B9T
X-Gm-Gg: ASbGncu5wPwSAAtNIov/dibO2ttN4dWEAYywqeIwKghHFkvszjPK4t0/uBWxwji1Tv4
	n2Yll8IQCPhclRa+PRoeuCHy952zpmOjRj6UgIdEmfB4QLfFHk6eKH5r/76TCdivGiWWZf7yHsx
	en3YVIf4VQV3+Me8PtyHOTdU16pHH0SoicICDUEy/ws1Kqke6JBpCCZnycFjwRg3wMVihYrbYn7
	VRmwqacbnAcGf2JjjBv3y0D/Xyn1hzYLPx10eR9o4sUMJmWWYsr5nj+ySq9oWkkcO/exEDNYapl
	ef1cLbxwqLc5Cb8+5LiXlVVVz3R/QcyaeMkm8OTGhwFuNWhrzCO9nao61T9kRSOPdwFX6nWRmaT
	YB9a7kuLDNl3WM2GZTO2HDljiq6kEnPl4ly/+WtRl0utcn2mPp3yMWQvfj1KwhfZZzSg4aZE+kS
	UFn34EXIo=
X-Google-Smtp-Source: AGHT+IGu7yDhimqarpn/Kul5ATaQYK3XNF+RsBue2iV/8jImfh2cK1HapM9OHJ5Cw2ex5dYQq6jdSw==
X-Received: by 2002:a17:907:9494:b0:aba:6385:b46d with SMTP id a640c23a62f3a-abb711c8145mr2105807966b.50.1739999207287;
        Wed, 19 Feb 2025 13:06:47 -0800 (PST)
Received: from ?IPV6:2a02:3100:a982:e400:6dd0:628c:981b:2783? (dynamic-2a02-3100-a982-e400-6dd0-628c-981b-2783.310.pool.telefonica.de. [2a02:3100:a982:e400:6dd0:628c:981b:2783])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-abb9553fbd0sm712082766b.84.2025.02.19.13.06.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Feb 2025 13:06:46 -0800 (PST)
Message-ID: <3ea191bd-7b59-40b4-b357-7fe7a9565420@gmail.com>
Date: Wed, 19 Feb 2025 22:07:30 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH net-next 7/8] net: phy: mscc: use new phy_package_shared
 getters
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 Eric Dumazet <edumazet@google.com>, David Miller <davem@davemloft.net>,
 Daniel Golle <daniel@makrotopia.org>, Qingfang Deng <dqfext@gmail.com>,
 SkyLake Huang <SkyLake.Huang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Richard Cochran <richardcochran@gmail.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org
References: <c02c50ab-da01-4cfa-af72-4bed109fa8e2@gmail.com>
Content-Language: en-US
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <c02c50ab-da01-4cfa-af72-4bed109fa8e2@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Use the new getters for members of struct phy_package_shared.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/net/phy/mscc/mscc_ptp.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/net/phy/mscc/mscc_ptp.c b/drivers/net/phy/mscc/mscc_ptp.c
index 738a8822f..ca4203d6a 100644
--- a/drivers/net/phy/mscc/mscc_ptp.c
+++ b/drivers/net/phy/mscc/mscc_ptp.c
@@ -645,11 +645,12 @@ static int __vsc85xx_gettime(struct ptp_clock_info *info, struct timespec64 *ts)
 {
 	struct vsc85xx_ptp *ptp = container_of(info, struct vsc85xx_ptp, caps);
 	struct phy_device *phydev = ptp->phydev;
-	struct vsc85xx_shared_private *shared =
-		(struct vsc85xx_shared_private *)phydev->shared->priv;
 	struct vsc8531_private *priv = phydev->priv;
+	struct vsc85xx_shared_private *shared;
 	u32 val;
 
+	shared = phy_package_shared_get_priv(phydev);
+
 	val = vsc85xx_ts_read_csr(phydev, PROCESSOR, MSCC_PHY_PTP_LTC_CTRL);
 	val |= PTP_LTC_CTRL_SAVE_ENA;
 	vsc85xx_ts_write_csr(phydev, PROCESSOR, MSCC_PHY_PTP_LTC_CTRL, val);
@@ -696,11 +697,12 @@ static int __vsc85xx_settime(struct ptp_clock_info *info,
 {
 	struct vsc85xx_ptp *ptp = container_of(info, struct vsc85xx_ptp, caps);
 	struct phy_device *phydev = ptp->phydev;
-	struct vsc85xx_shared_private *shared =
-		(struct vsc85xx_shared_private *)phydev->shared->priv;
 	struct vsc8531_private *priv = phydev->priv;
+	struct vsc85xx_shared_private *shared;
 	u32 val;
 
+	shared = phy_package_shared_get_priv(phydev);
+
 	vsc85xx_ts_write_csr(phydev, PROCESSOR, MSCC_PHY_PTP_LTC_LOAD_SEC_MSB,
 			     PTP_LTC_LOAD_SEC_MSB(ts->tv_sec));
 	vsc85xx_ts_write_csr(phydev, PROCESSOR, MSCC_PHY_PTP_LTC_LOAD_SEC_LSB,
@@ -1580,8 +1582,9 @@ int vsc8584_ptp_probe(struct phy_device *phydev)
 
 int vsc8584_ptp_probe_once(struct phy_device *phydev)
 {
-	struct vsc85xx_shared_private *shared =
-		(struct vsc85xx_shared_private *)phydev->shared->priv;
+	struct vsc85xx_shared_private *shared;
+
+	shared = phy_package_shared_get_priv(phydev);
 
 	/* Initialize shared GPIO lock */
 	mutex_init(&shared->gpio_lock);
-- 
2.48.1



