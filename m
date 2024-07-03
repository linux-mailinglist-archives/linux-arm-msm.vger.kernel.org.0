Return-Path: <linux-arm-msm+bounces-25067-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B81925759
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 11:51:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8426028AA93
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 09:51:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4F9416C6BE;
	Wed,  3 Jul 2024 09:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VaMCRLnj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A6B9156F28;
	Wed,  3 Jul 2024 09:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720000235; cv=none; b=lB6gJxNx7GY8ErbWGUA1d2jPmc36FEo/FkW9fokoKzF0s8OlfixlnZKtRL3zNWe4ckGYzi2bO0WiZGP8rz81dhTnFiLSnAA6qMeQO8Gn5EkC0i/tBOZRh/5Hv8iGRmCux0eLphU7WQi9fguNSb1yvve0rjKhJuzgchhnaBauyjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720000235; c=relaxed/simple;
	bh=87EEyGDhqMM4XSc2dnrLtfdRuLpnYLj4dPXzZjLB2bE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=itYbCUJWY6LeEtc75gFQuvi7nJe76wXBHj3lzG43I4hUME5BkaGgy5zutTABcuU6y9+2TTsK4phEe2v2gPOK9ZH2nYs2UXqOMBfksFgi7dYFdiqp62m9u3N3ZFwsODOLX3J7bm/ZGJlQO24K2uuUpIK12Tzl5Y/tsr7YDk1Dmdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VaMCRLnj; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-57d046f4afdso1495188a12.1;
        Wed, 03 Jul 2024 02:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720000232; x=1720605032; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kd/sgJHBXOe9fs3qrhdvMpUQXrTXNMFaR6+MycDuFVo=;
        b=VaMCRLnjSFAmCJxeE6GFgMg6azNYQggJhWKo5o290Tr/T1HF97RKBS9isr2JkQTeUW
         JP4JqDN90KlfLTcPK+Pfs2Jx0UQo7Ee4DLXpwVeiCfnm22iSXYieEGMQ4Jg/k9f+Lywm
         Rn2eMZ6KheBwsHE5XtC3cF9qp3ECrDiH3Ou7J+otTlOm8cjeEPPV78jdIKuw966vDYDa
         7q1fLt2GZ6FAXFW3qnzXHbK4hAMGE/Eqj0R7Uce/mrW5cVpq7TRtCrlZ8AfiFFjgApcb
         ObGgA7OSqocLu5/SBM9KtMzSgH961urSg3vNIgjznbzWv4OM9hHCwk1RbYLp4lZ+jcR+
         fLzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720000232; x=1720605032;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kd/sgJHBXOe9fs3qrhdvMpUQXrTXNMFaR6+MycDuFVo=;
        b=dN8d3WMmzAsxQWo4wLSof0c8XQPMuf6Rpoq6irWx060OH4PDi9wbuA4zgWuEOiGOsP
         u6v40Wtx4Zz0i9B7TCsacQU1l8hAe56JN8vC+C9cL7pQvZm2M8cOix2loed62L93u8kg
         QZr/DUpe84457s/B2lLO4bcwXymfOD80FmvoS9i+z9ZMdT3kIcpOW0mpA7a+5TxoHKoY
         r8TpJ6/FMO/r6Xx89Qs4jlSgfyipLzqV0Y4g9qwyn7SVR91cv92l9j1uV3e8aCyZ58Ym
         wy/a/2ApKeOEyZmfH+IDAKm8y45/K0F9SvNFJYJas8DOMyLXLncgqYaCa7WJGd6a1M/J
         bSrg==
X-Forwarded-Encrypted: i=1; AJvYcCUVWB2AfFTyxSpjGWlHLjCA5KQt4uHHoumJcTUedp+fnF0WBB20ibgVpaGVt/l6/EucuL/yfMHH6C8CkIwzJmVAqtxy4MMIZBJ5PbNFMqbMF9Si1S5DMBrAxEVQgTxZ4Nw4sjk+/UvDeNf3cz4zZTZb5Rs8GLXRRPWEWgGcyw9vq0eAewT9QA==
X-Gm-Message-State: AOJu0YyUXEb2XyhzsAz01WWIlyvOv8eRa7WYU59ECTHQCYlF94rh01mo
	ICQsX9cMA2pkzfIss+SLUtEi/or5L7Xfy/NJAhz4i7oDVxyo8aHm
X-Google-Smtp-Source: AGHT+IGs/WDtbZIXTR4T3vygKaznx3++FpGKeIUBPGN/fnT9vd+Uc+Jd45wPLlvNWdhc0V3hB+BFGQ==
X-Received: by 2002:a05:6402:1cc1:b0:57c:7c44:74df with SMTP id 4fb4d7f45d1cf-587a0822c1dmr7791768a12.29.1720000232375;
        Wed, 03 Jul 2024 02:50:32 -0700 (PDT)
Received: from [127.0.1.1] (91-118-163-37.static.upcbusiness.at. [91.118.163.37])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-58b4a97b1f3sm2082130a12.18.2024.07.03.02.50.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 02:50:31 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Wed, 03 Jul 2024 11:50:17 +0200
Subject: [PATCH 04/10] clk: meson: c3: pll: Constify struct regmap_config
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240703-clk-const-regmap-v1-4-7d15a0671d6f@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720000225; l=745;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=87EEyGDhqMM4XSc2dnrLtfdRuLpnYLj4dPXzZjLB2bE=;
 b=RRDOpnPm8XSIvDMG7UScdHDXqikzkMcrNLmY1ueozOmyEoM6oRCDBKdS0sxGWYXstfh9vXJrP
 yRZGKhFD/fLAt32CCD3d5+xukZJvqb/EN1KQc39Rdh40+W9lXA4SAtY
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

`clkc_regmap_config` is not modified and can be declared as const to
 move its data to a read-only section.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/clk/meson/c3-pll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/meson/c3-pll.c b/drivers/clk/meson/c3-pll.c
index 6d5271c61d14..f09f4f7b46fe 100644
--- a/drivers/clk/meson/c3-pll.c
+++ b/drivers/clk/meson/c3-pll.c
@@ -678,7 +678,7 @@ static struct clk_regmap *const c3_pll_clk_regmaps[] = {
 	&mclk1,
 };
 
-static struct regmap_config clkc_regmap_config = {
+static const struct regmap_config clkc_regmap_config = {
 	.reg_bits       = 32,
 	.val_bits       = 32,
 	.reg_stride     = 4,

-- 
2.40.1


