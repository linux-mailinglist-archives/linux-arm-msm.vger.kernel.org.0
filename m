Return-Path: <linux-arm-msm+bounces-61148-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7310BAD7D62
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 23:25:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 55901189893F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 21:25:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0716029B227;
	Thu, 12 Jun 2025 21:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JTPKirrs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B6151531E3;
	Thu, 12 Jun 2025 21:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749763497; cv=none; b=h+yTC3hsGr8lJiomZv7c48i55ANwYwXivq2PmZ0qKQd6W4SZZuP9xmrYHJ1/K+fzd/ZGWruv9PLRmG1vLuw6DAs8dYOkQvTvd+EUb+fOW8tR99MY51Tupy/YRqYaGXgdPqReKfy6+MdgpmYtu/9y4d+Dr9AbKw+SW/xGIPmcp7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749763497; c=relaxed/simple;
	bh=DHH8hkBqSA7Q7Nmp5dlwHqT6uJlwMcmjTvWINT+5pXA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=UTfz6UaipLhvED9UO1/8CPZgBplSU7fBmSRLseuVZ3p/kTZY2Nh0I0llRXurqiiFHI5tjOQjRzY/H6e4SCcoH1N5OjFsgKJmf2h1cJx4tMHhPNolcS4O4k4ouPmbxH2vEUtLfJU+8dHWRSn5RCvuyxgZHZGDcOEdhDzVfZRAO6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JTPKirrs; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a50fc819f2so1251984f8f.2;
        Thu, 12 Jun 2025 14:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749763494; x=1750368294; darn=vger.kernel.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nCdRQGm7H/a7r2fssPG4pEF+V61SawrKuUSAco8WEoo=;
        b=JTPKirrsVTH4K28jhGc2czjVfLWPuJAqfuFdSbqEZRXIRHQXIGxk7feiFHpAjWtTGl
         94V5IGYuT1QzZZl9l6Q+9P0bh1pUXK9mMrj5s0fhqi5U58yoOe/6y3EF3/fZiBRBg/GY
         482tyYpzCQtooznglNrrn+YCLvl3N4tj3W4Kdn6abtjfObTocBBLFua/tOLeBA5rEdQM
         LwlM1+iWHv4wJOX6zAUFuC/8gpIdTgIT5GvGwlEF22Q5aSXO9wXLwXULyT+bcJXsu7zk
         I/GF2wAuys4Usza831PN6rLGsBashTj73wASTmRCMxLT52ZpfTQzMYWSfEBpt09BGLlk
         ZBgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749763494; x=1750368294;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nCdRQGm7H/a7r2fssPG4pEF+V61SawrKuUSAco8WEoo=;
        b=rfC/N2M43WFYzxFFdo91j96EarfhdL0xzoLoCTMmj51yZa24rkYn3x5lfUhXLf0VDw
         vO1M35T5VvJ4vKD2hR+CaqZRxPVU03IeuLEugc2YZ33pZhHSBxZuv3etDuHSoM0yxAv8
         NJX3JaDExSmu9ubMwbk4v4SLeCe/gGKG9pf0zpRT7WAFfMWMReF4gxuuqTje+huV23uy
         v5FS7TUXOMOo/Bgpe8qH4LQXo4v38+L7LkpCY8Q5jn/Gi1wmBsv7iahHt4LtE6pxlyGz
         1Bxu+OulvIchHQfLu0hoWsIG4GYdT4+dradDSVEzNXrB0C6NnSGrfoZSeJ+T1w4vj/Fj
         KT/g==
X-Forwarded-Encrypted: i=1; AJvYcCWfw9xjm0ziHHoPHcUhmBJ4f6aUaqJREbQVbUkwiRASkEtLzv4LPYOHlPj3n9C4U3Zkhwxs0Ew/Ym9twg/s@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4R6yg36p1ThxnwMPwYq0cfShYxBiT3ZEEIRdWbFwcIjFNdtWP
	9jtOPUBKh4RGUGkMgGQj/085XFzU+vqhgb3aTjaI/W6aNQ2qcb9Q48E8B5gItQ==
X-Gm-Gg: ASbGnctNlXNPNGQcNrrGEbHHhXgkUdvCqS2pGxvZr+RoI+M0F/zKV3KR71SjFTRdpYX
	cfETd6RwEsO5mI2hYJ2uOPflBPwuohRy+fmBGD9PqzJkSXEGBxXgR4YBDqTW+ELWDNnaGIQEpum
	stX5d6JPyjfWYEpYXFlg7IZZOJ81MkLnaHEqpbLNDUwIFiFll+sWSsFlBrxUvcjsYp+9RTAin/G
	9fHn6oKya+U/aVCj6pzsIF5NVPLF28oWpVuHFj6VQtuWK/Sv4OB/ZuIHuwh96sB8ZH2LI/cxwhq
	g/TwD2XjV0K2AHvHwghJfnlAndsTV2s9TG2I+1t4pPJmDIsn1mMF+X8gtalTBPlZQNF3mt+7viP
	RybZ5X0Mcts05L7VqlLizNvtlB/nUsKc9evzNX1lwQMHVY7ZwtdajUNRlIPfiqBBPZugVG4/j2K
	q9szdlxwRRZ/V5VfxKdhyHH69Vjw==
X-Google-Smtp-Source: AGHT+IEDyjt+W1tVeHRtL0gQRYPwvvU0pqeB3cicRl1P7ymc3YBPCaOz2r95S5pJzpgpTXILBSi7mg==
X-Received: by 2002:a5d:64ee:0:b0:3a4:f50a:bd5f with SMTP id ffacd0b85a97d-3a56871b319mr609716f8f.31.1749763494281;
        Thu, 12 Jun 2025 14:24:54 -0700 (PDT)
Received: from ?IPV6:2003:ea:8f22:3f00:7533:d8b1:ff14:6fe5? (p200300ea8f223f007533d8b1ff146fe5.dip0.t-ipconnect.de. [2003:ea:8f22:3f00:7533:d8b1:ff14:6fe5])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4532de8f2e0sm32004255e9.8.2025.06.12.14.24.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 14:24:53 -0700 (PDT)
Message-ID: <eec346a4-e903-48af-8150-0191932a7a0b@gmail.com>
Date: Thu, 12 Jun 2025 23:25:00 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH net-next 0/3] net: phy: make phy_package a separate module
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
Content-Language: en-US
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Only a handful of PHY drivers needs the PHY package functionality,
therefore make it a separate module which is built only if needed.

Heiner Kallweit (3):
  net: phy: move __phy_package_[read|write]_mmd to phy_package.c
  net: phy: make phy_package a separate module
  net: phy: add Kconfig symbol PHY_PACKAGE

 drivers/net/phy/Kconfig           |  6 +++
 drivers/net/phy/Makefile          |  3 +-
 drivers/net/phy/mediatek/Kconfig  |  1 +
 drivers/net/phy/phy-core.c        | 75 +++----------------------------
 drivers/net/phy/phy_package.c     | 71 ++++++++++++++++++++++++++++-
 drivers/net/phy/phylib-internal.h |  6 ++-
 drivers/net/phy/qcom/Kconfig      |  1 +
 7 files changed, 91 insertions(+), 72 deletions(-)

-- 
2.49.0




