Return-Path: <linux-arm-msm+bounces-48559-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B68A3CAB3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 22:02:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 637253A4794
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 21:01:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ACDA253F13;
	Wed, 19 Feb 2025 21:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L2Pu5f+2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4217A253345;
	Wed, 19 Feb 2025 21:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739998872; cv=none; b=d+QiCIBdNAMS7tObSs/6ubVA58nU1CA32tHI7SwUngGDPWuebI88kVrJ+Nejpz8UyKARSB5H699JEbvMCLxLgkxfthPKyuRNHCIhWVjZZ6VOVfZsZywUj6skeAnihu+AOyozSmnJguD/a5kEcFfTETwUclF6Lz8cjOdDZQ+FDdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739998872; c=relaxed/simple;
	bh=5tuFDmpLvrB9efTDBdJXXM3zDVl7im2uMUcvPPKT44s=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=JMJrUU2uxvbBCTvwOQpa5q8gkhd6BQ4ZABzyzvAM++RTi6L5x9/iNV9c/fKBbb/wF/obQTqv8ITNEThNxE0PX2Ez5vf+hTkj4isHMTmC4nyrAdeA915MBfzmk7roDwe5K0X7oOIp/2BxRrfhT/GPTIiyMWzVsw+56W5l5/4hneY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L2Pu5f+2; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5dccaaca646so507941a12.0;
        Wed, 19 Feb 2025 13:01:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739998868; x=1740603668; darn=vger.kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n/HcLc1vBRDNLkVs/ylW8/ztC8KcpMW5l5ZyrlNLue4=;
        b=L2Pu5f+2HPQFbeMv84IVVuO8r5s7eVv9NQ/pbtg6ixLpWFSWCQ95JwAmLiRHEtVOez
         B4HXLOvVzHNsWYAgsobteGgJxqrvzY5j8sC6QyyAcfrkXgpOoeX9YP09ooNg0XtKgDBM
         rITpzTAgOLhvLNfTFlW5Db2XG2itdrfip9otMXs5OTGI363JdLzvUHeQVrwGyi+gj6Nl
         wGmmw3aOR5Dokc/4fip5esT3PohsD8f9XMTk/6ylLPI8pyD1IE8H7HsiHULk1eyr8Ra5
         eIoRezPkbC8o2t+iGBSOBfkstOKEmvDkvUz40W2HxZD7KCUDhiPJ0w52V2EobHW0ROqV
         6Byg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739998868; x=1740603668;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n/HcLc1vBRDNLkVs/ylW8/ztC8KcpMW5l5ZyrlNLue4=;
        b=FKJ7BCcDWqQo5MgSbExMdtpUJqohW4+6rHKrroON2mn5Y+eyGd6tCNpmwAofib6siX
         I86+95g/HP6+qpASjw3P76TqiAoofL5kmI6hzoh+42niOyZK56zJBJLoXpdpwjuSoE8l
         B8QC40XszZ4Tv2wATclporSjraUijP1ptXfD8uyRRBL3cuUC7WXGPwyVXzr8U3ou99aq
         oRyp9rW1U7dzl4SzWKaOsqtFGTdNR+BminBkOvUhMRnVJPEeTN/KotoOVW8OS3FykP4L
         uMzr/O3KcnTPA/zmZ5/UegKDzbr4L0dt+RXvqnmdi/iZlbmWK5U0DqCGaYjtwISrGnVF
         Ro6w==
X-Forwarded-Encrypted: i=1; AJvYcCW1S5R+vjmu8KDvWKgrljQSz5nbAu0YKoPrMPg2Jfipzoif6PFE2Tvnp9Y00atTo4AqA3vCYQQFTR9JBa8c@vger.kernel.org
X-Gm-Message-State: AOJu0YwAO3in4Mv6KW63P1U0sWaiu5C1hBaevTcfKiHQKZg6rKLTqASc
	/ifqLZ0cJUDhSYnHpITIc+xHAOx85nWknlSgxY/IeHJP0JTQsCEi
X-Gm-Gg: ASbGncvgI1JzZjBTB7gY0CB5AebVrpdQf5xw3wK0Hn1tfoYfGCymqjnJwpUR351F+9z
	ueRq4dkjZijClk8I246RrZLPfRufKl9ierBkELJfmB5BSa/WL4ITY/k/5BwQ1vjHDgwnJlGcK1t
	lDtSzGvbNwSnKHwLMJM/kbBnIX5i7oFaYnxwG2v8Cxbu2cqls96HzXbb3mH7DxuCZj5MadvKB/I
	RuH3rsapDWCmPzHKMQ5WVl6xglfUxc3YIGFtm0XmG0pfyA74AxUO8oEbZlJRcb6qK0KNte5+/dn
	vknYEmUrGBlqZ0dNkkVuOeVdA5DDcL3lJKTf1rH2EBlbUnjhoMvOqNPB2byfxcUTpCNw7mFj9XI
	ztz+XpQ0VbZe/kBYQ+00YMTaU+Nc8JTenj57XmXUI57h+K3ZYosXk46i2Ony+ZEYfzF8C4HfVQE
	B+58XF5v0=
X-Google-Smtp-Source: AGHT+IH9ZMq8ky2erXIOhsHzCfqhRS36ZUg26/HaCIV4syGcJuFX40SQztd94cUQWV3y4A8uHd5E5g==
X-Received: by 2002:a05:6402:1d4f:b0:5de:d932:a54c with SMTP id 4fb4d7f45d1cf-5e0a1200077mr873058a12.2.1739998868275;
        Wed, 19 Feb 2025 13:01:08 -0800 (PST)
Received: from ?IPV6:2a02:3100:a982:e400:6dd0:628c:981b:2783? (dynamic-2a02-3100-a982-e400-6dd0-628c-981b-2783.310.pool.telefonica.de. [2a02:3100:a982:e400:6dd0:628c:981b:2783])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5dece28808fsm10877033a12.75.2025.02.19.13.01.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Feb 2025 13:01:07 -0800 (PST)
Message-ID: <c02c50ab-da01-4cfa-af72-4bed109fa8e2@gmail.com>
Date: Wed, 19 Feb 2025 22:01:51 +0100
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
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH net-next 0/8] net: phy: move PHY package code to its own
 source file
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

This series contributes to cleaning up phylib by moving PHY package
related code to its own source file.

Heiner Kallweit (8):
  net: phy: move PHY package code from phy_device.c to own source file
  net: phy: move PHY package related code from phy.h to phy_package.c
  net: phy: add getters for public members in struct phy_package_shared
  net: phy: qca807x: use new phy_package_shared getters
  net: phy: micrel: use new phy_package_shared getters
  net: phy: mtk-ge-soc: use new phy_package_shared getters
  net: phy: mscc: use new phy_package_shared getters
  net: phy: make struct phy_package_shared private to phylib

 drivers/net/phy/Makefile              |   3 +-
 drivers/net/phy/mediatek/mtk-ge-soc.c |  10 +-
 drivers/net/phy/micrel.c              |  12 +-
 drivers/net/phy/mscc/mscc_ptp.c       |  15 +-
 drivers/net/phy/phy_device.c          | 237 ------------------
 drivers/net/phy/phy_package.c         | 348 ++++++++++++++++++++++++++
 drivers/net/phy/qcom/qca807x.c        |  20 +-
 include/linux/phy.h                   | 125 +--------
 8 files changed, 396 insertions(+), 374 deletions(-)
 create mode 100644 drivers/net/phy/phy_package.c

-- 
2.48.1


