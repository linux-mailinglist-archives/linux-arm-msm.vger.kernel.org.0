Return-Path: <linux-arm-msm+bounces-25069-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E170925760
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 11:52:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F238828C4D2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 09:52:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1708171E68;
	Wed,  3 Jul 2024 09:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cK9uN7wU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1673F16F857;
	Wed,  3 Jul 2024 09:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720000238; cv=none; b=VOVwQRq1NLLN509N8BTvmnmum6Ey5vbi2Nrf/JTUlNQE1F62V1HtkczBjBVvZX7uFyHvYJE/dVmbNo3l+4CcZqf5X+0uM8pRaMR/Eyt13z1jjLX3ULvxREDuYqeoIRVW2sXgJtVHFN5xlwqB1ERkQMLiUNJ12GqI91E2zjuvg0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720000238; c=relaxed/simple;
	bh=QjI2XZ6DpFgtcs0s52itimxDAtU+za0z6ETKz2I5xKg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BdyKJ0IzWPBDw77g1rrxfW8MTusBs34bkuwc19PItqtrbp9yN/kixoTsglKfVe+H8ZDRa2C0O4xv5zFQFho6MU5LVkLBVgAG2Q32nVLo/R4GJ2z+aiW8sDhgoLH0UBQXHv1UaQQLehrBVp+sqDhusTIm07Z9azPrvItNLYt1010=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cK9uN7wU; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-58be2b8b6b2so1988617a12.3;
        Wed, 03 Jul 2024 02:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720000235; x=1720605035; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q5sGY1MHMh4vP9RTlfTXcp30OvUGJ6Up0VGY07imbb4=;
        b=cK9uN7wUHjeVzqpg52szBiGfCV14WUQnrMTOMsF83o7HDKuIQ93AgxAUQPZCIYHHvb
         HqrptZHM8cjpJeGkFyt9jd5vLGKWmCcbi8+fCMl+bgIxjx8gXYb3AL/foISjyXbKZYuq
         nEAP6g5unl0ZzvpGja7WFb+McXMxYR/KbNBqSkXJE4iJRlhYgHYYXajmG+wk+5kdsL5D
         nxb+w9YAscVlPwDIyy3ZGJTy0WUjaqDTr+RMt/Yj8lFOAQFrC494vM7f7BnvpZWXy0J8
         fazQn3cnvfguaxX4Z/46KabB5MZbEwt56XlL8b98hl01Kohm1jPFUT5wW53uQgiyKUIS
         BJsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720000235; x=1720605035;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q5sGY1MHMh4vP9RTlfTXcp30OvUGJ6Up0VGY07imbb4=;
        b=k98X2W8+5ZHFEdNwzo2GGgYEP9tULcLbvGqbAoLo8bADN0JxwhY6sV3Bif5GM86cvH
         bgOoaaY8nV1h3LQt1MzSy0xx9b6jyaEbl/r/hVBhZPkuAfyS2hRh/gL96w55t40YbZ6o
         c6zvYh3XKUPMln5Lj9mOUl0OTRnaZRTgdI1ATtzbxHHj6XTJffnNdqyleetNfRAV/zxM
         hIWdBJQCyyar4rTJneR8Lxh9yvLgPARFenvebxAPzVRVUbi7oMfSVcdVj7fYb/+c77pm
         xA44U8dkqEmIFFLrScw+WjSQ7mniKmNzfyG8f2Xuzdql0HcpQpItzu8PbZcO2C8+MJDi
         a9yg==
X-Forwarded-Encrypted: i=1; AJvYcCWDT4CNBHNwiGstTvn6fSxjrbw+Gku6bhEfynqXw+PNPAOCiE+ixL8g1dbTmOxvaDdNS0fsQ4RELe6MTtsg3wsrJzZEtOI8HBG+Iuwv9jlR00v9JJWAPnBQcCIKC8XhkQurgII7hRTNYpi1SOAm089hdZcOsQL6KANiT60OzPjbu+eUiW6ciQ==
X-Gm-Message-State: AOJu0YykYlG1dgAI9Y0gUXy9c7U0uwAz4ysIsGpJhM6/X5WaXT28jTyC
	ZJ5B9yKq+Rzpd3OenYdEoz4nHZ5wluUZEGp11lKlDT1Ra3sca+3y
X-Google-Smtp-Source: AGHT+IHJvWuVEjeg7jS3YGWzwBblEC1aBEjiRtx7Wx+1gkXGABMGiz68aiczGU0eMJw/KYhEPM88eA==
X-Received: by 2002:a05:6402:34c5:b0:57d:4cbc:cb59 with SMTP id 4fb4d7f45d1cf-5879f984a22mr7916813a12.25.1720000235436;
        Wed, 03 Jul 2024 02:50:35 -0700 (PDT)
Received: from [127.0.1.1] (91-118-163-37.static.upcbusiness.at. [91.118.163.37])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-58b4a97b1f3sm2082130a12.18.2024.07.03.02.50.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 02:50:34 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Wed, 03 Jul 2024 11:50:19 +0200
Subject: [PATCH 06/10] clk: meson: s4: pll: Constify struct regmap_config
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240703-clk-const-regmap-v1-6-7d15a0671d6f@gmail.com>
References: <20240703-clk-const-regmap-v1-0-7d15a0671d6f@gmail.com>
In-Reply-To: <20240703-clk-const-regmap-v1-0-7d15a0671d6f@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Vladimir Zapolskiy <vz@mleia.com>, Bjorn Andersson <andersson@kernel.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Michal Simek <michal.simek@amd.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720000225; l=782;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=QjI2XZ6DpFgtcs0s52itimxDAtU+za0z6ETKz2I5xKg=;
 b=shXXui07Vv0SxzDWgmKblWiiO/F6QjUD3Gg2XbBPFxNeKr/3DO+TzrHVENvorbTe6ULfqDHDp
 pgzaktXTA0kAf2uTyPcMVNSPw+MBMfrFC59IJ9aaKMY+q4QO4+9Fx/x
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

`clkc_regmap_config` is not modified and can be declared as const to
 move its data to a read-only section.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/clk/meson/s4-pll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/meson/s4-pll.c b/drivers/clk/meson/s4-pll.c
index c2afade24f9f..27c10fc499be 100644
--- a/drivers/clk/meson/s4-pll.c
+++ b/drivers/clk/meson/s4-pll.c
@@ -799,7 +799,7 @@ static const struct reg_sequence s4_init_regs[] = {
 	{ .reg = ANACTRL_MPLL_CTRL0,	.def = 0x00000543 },
 };
 
-static struct regmap_config clkc_regmap_config = {
+static const struct regmap_config clkc_regmap_config = {
 	.reg_bits       = 32,
 	.val_bits       = 32,
 	.reg_stride     = 4,

-- 
2.40.1


