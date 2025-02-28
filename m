Return-Path: <linux-arm-msm+bounces-49887-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5320BA4A52D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 22:43:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 20F9B3B1166
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 21:43:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28D6C1D8E12;
	Fri, 28 Feb 2025 21:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l2RHKjny"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D8551CCEDB;
	Fri, 28 Feb 2025 21:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740779032; cv=none; b=ta/HZuFJr6S7aGjiPAC74+BBqlvJuXlpDB6wS55S/cBvpVzRrDdRU6CpLfeNBuOC/rTYQFtTHtIcpqcDcmCg3Nrjek7gTDOM2ufop4GylTVkQSegancRHMXamv/UtPR9xfFPxfhQuDusnP17b+VHSEkj4QhjiAD0dwDf3JfvS3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740779032; c=relaxed/simple;
	bh=osZ2l2EvbwthQ7gH+hPUJxHdG1pM8foefts5h1rhtMY=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=OVswtfaQ8xM6RvF4jTupFPV7ISYcZWcEjH4sDBQ4YVJQhsAPs6FrLJ2frL7LR+bfe+pOuM8PVjNaNT3jn70Vtte/t4Xa5T1mW9vQqWlQfasEyWdgrJ2BouLoCwUwjNyeBi1Ollg5UECLfL0yssz1QO2qdQIkE9rPk3Uv8CNgX30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l2RHKjny; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ab7430e27b2so422706766b.3;
        Fri, 28 Feb 2025 13:43:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740779028; x=1741383828; darn=vger.kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YQ9naudC/on4WzCtDGdTRGdiQOMULgcsLU3+45gGqVc=;
        b=l2RHKjnyzgzjL82okjp/wYQ4kSiERIjG5At4wmLcMKjjExvKV5OTXCq94cwm3WzvmG
         cPUjG3uz2f3WjntZp6/iiiWAsJUX/KjoE1UyFO4qxS6judnkdfvop8Bug6end1AY+byI
         Eom1M0dDdUM6LEBp4gqzXx+WHxc3ZGdc6jpz3L7ZGhQET0/iGwP6uMD1ryCgeEISaVym
         RuXZUjVv7fvITym2UelZl93yXf4GeSUZm0VZ1mWCE+uU6B4qrDRqMdXJavQYqYWPznoD
         Ahpd/xOnbyPKnxdvX0Bxzwq7vPVi6LnZEb5EK5dAs4VRVTibgoaa4BPOlxCPUNrLEWQG
         3Q6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740779028; x=1741383828;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YQ9naudC/on4WzCtDGdTRGdiQOMULgcsLU3+45gGqVc=;
        b=m9UGZTjCWkUl3YWg2jre0EQ+V5mMQWlgaFd47ZUTaLHX+QLqW/dibDWmKZ7BSDPNwr
         uQv3EIVFonHydjfBY9NWuDhaa1DATm6OvAlHkt5c/99WNdynF4cNvRulXKOat8V5MnMK
         CsXrHamRe9+9R5r2sH9tcUAyKpafHdWERQ6u7ODw7TEzWFVpTj5uxWZtt+ppMY7nVHMM
         xGmVgngWfXQz7S5bH1W74EBm96RtZNKWyxG4KyaqYDkUB3lCk8GEGv0NqJ6kMScWEOfp
         BOgqVBUh4siboi8f39q7Qv3qB1EVSKB5RUwN+rE1EmcpfLBIn9JuUqf7wfbEbhOQHuQY
         cO7A==
X-Forwarded-Encrypted: i=1; AJvYcCWjc2HAmz30+GZ1VtdaKUCSuICyiHT7cFe31oxwXbK2jgjUE0yptqQipUtgvK3DnDbJJA2QYH93JWTc7RSQ@vger.kernel.org
X-Gm-Message-State: AOJu0YyKpJbVhh7q2YQd0D9HVt2Pq3iNCnp3ucGrQUbSOekaHmArMZg4
	C1ZWgJE5Qj25m1ACkXa1En3M+udbZwFDlxA2W9XVCwt6z5ja7+WR
X-Gm-Gg: ASbGncsO7x6VbIozcvYhsRBorn4FO2f9CaxeG8Lf38APBYMtxJIz87DXeupcsr4CgOf
	6xu3BPy8YNv/Pui3YBYVL6gyOR3zPZBJiOE3GO7Y5RNGJFXR4eq9IwQn+4QRDqpd+xtfglkUK+c
	HrnWQBoO4uHHuaI5XgwjjCMzhbgD/ItlzUOideYFfeeB228CZs7TBQMeRkDYIJuCzZlRYkSZaA9
	v43ORuFKecSlCT9ZDDxnmPlTFELtGCSbivJrhCJMc+1uqqTSQhSmOR9OTBhuMzvqY3gys17XtmS
	EZwonFdfxmivsAQyGU1h5oswUxqC6+k8y/91gjEq2fEw6KWA6xbezjrE1D9Fxxs2qlpMp8LtBW+
	5Gzva1e0XQLwflOq0pFOVv5TfLSVISnbCPqXONUUHxm6zhd0Yr8Qv6X0jm3BWh9tey6uvuqdKdG
	JgSmHc2K3Qu90BFnrVGw==
X-Google-Smtp-Source: AGHT+IG5iFke5XB4ntF031uTNe8NcrPeox+FQU6eea3I3LTL1bU5Lup/jLn3XOE5UjC7zZR2cc4mkQ==
X-Received: by 2002:a17:907:3d88:b0:abb:a88d:ddaf with SMTP id a640c23a62f3a-abf2682f907mr539780266b.55.1740779028317;
        Fri, 28 Feb 2025 13:43:48 -0800 (PST)
Received: from ?IPV6:2a02:3100:af43:5200:e57d:90a4:e6b5:1175? (dynamic-2a02-3100-af43-5200-e57d-90a4-e6b5-1175.310.pool.telefonica.de. [2a02:3100:af43:5200:e57d:90a4:e6b5:1175])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-abf0c0b98d5sm356092666b.11.2025.02.28.13.43.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Feb 2025 13:43:47 -0800 (PST)
Message-ID: <8b290ccf-ca0c-422f-b853-6fc7af045f99@gmail.com>
Date: Fri, 28 Feb 2025 22:44:50 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
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
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH net-next v2 0/8] net: phy: move PHY package code to its own
 source file
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

This series contributes to cleaning up phylib by moving PHY package
related code to its own source file.

v2:
- rename the getters
- add a new header file phylib.h, which is used by PHY drivers only

Heiner Kallweit (8):
  net: phy: move PHY package code from phy_device.c to own source file
  net: phy: add getters for public members in struct phy_package_shared
  net: phy: qca807x: use new phy_package_shared getters
  net: phy: micrel: use new phy_package_shared getters
  net: phy: mediatek: use new phy_package_shared getters
  net: phy: mscc: use new phy_package_shared getters
  net: phy: move PHY package related code from phy.h to phy_package.c
  net: phy: remove remaining PHY package related definitions from phy.h

 drivers/net/phy/Makefile              |   3 +-
 drivers/net/phy/mediatek/mtk-ge-soc.c |   7 +-
 drivers/net/phy/micrel.c              |   9 +-
 drivers/net/phy/mscc/mscc_main.c      |   2 +
 drivers/net/phy/mscc/mscc_ptp.c       |  14 +-
 drivers/net/phy/phy-core.c            |   1 +
 drivers/net/phy/phy_device.c          | 237 -----------------
 drivers/net/phy/phy_package.c         | 350 ++++++++++++++++++++++++++
 drivers/net/phy/phylib-internal.h     |   2 +
 drivers/net/phy/phylib.h              |  28 +++
 drivers/net/phy/qcom/qca807x.c        |  16 +-
 include/linux/phy.h                   | 124 ---------
 12 files changed, 409 insertions(+), 384 deletions(-)
 create mode 100644 drivers/net/phy/phy_package.c
 create mode 100644 drivers/net/phy/phylib.h

-- 
2.48.1


