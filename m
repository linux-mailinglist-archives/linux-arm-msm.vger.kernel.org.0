Return-Path: <linux-arm-msm+bounces-25064-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EFEA92574C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 11:51:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 407491C222BC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 09:51:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55954146A68;
	Wed,  3 Jul 2024 09:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JsRRTL70"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A329B1422BD;
	Wed,  3 Jul 2024 09:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720000233; cv=none; b=qfM0cpRdFDOZVO8UXZIsDIQN0O571oZnqGRQ0szyPmiJoo9eadUT+2VgqQPpn34ymv9z7pWLfXHpiRgfiREra+LN6YATOiig12RV9qyYDdVr7kyb5coTVfcTtx+LugdTAl36suRQTb5NA7jBQdyhJ11gApOOWcz3WKbvXCfKh/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720000233; c=relaxed/simple;
	bh=w1rOHhvKlNZR5V6gMM58fQeON2s1grhUcmwjN3eUzC4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HjaCv9DTXESWq6Ys2VEz+0c5el+qcejUganlYImeejJClAtHTZAmjBhXVhKbskPvBYft/29DrBSZd7MKHkY/8+A/ZwcXE+lCvdIwAOhB7RpmMrkB2gGYorFJeCNnIauM8BesKyEbT0czQAEes8hzUIuWlFdUH/HnLU8sFb/P/Rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JsRRTL70; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-57cc1c00ba6so3480933a12.1;
        Wed, 03 Jul 2024 02:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720000229; x=1720605029; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mYmIYCmqwVvji/gLlU74cbPYmKHONbdVpgfdzYyiV74=;
        b=JsRRTL70rCvAdkPLKcTnUh8mmAiJFBu6xvIsRMhR4oA/ulSrRVMDavn0NCwrrNvh3c
         Ylygbj9j8zpu3Wuzxiuh5KVyI3wl7jhs2YJESuCk58XhuAaNCRH6CsJpkIFFWe+ykOBD
         28tqDrNTK2LZFq/+Z0pqtV8Ja5m+3ZGYgRu7ud7/CW0ZIYFxLbbHaxsTPSULTHdztRn0
         Qd10jwCJfebQ0xaVqcQ0vH/q8c17F5Mv+hpTG6c4r7QlXeFqcgjOGsQWpNE/vV/dOm/V
         pcBZPMX5+oNFOci/HUpeDV1wEP6zlfazkKqpi33y2Ko30KrxOMsSaKNlbqu+l8M3y713
         KrrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720000229; x=1720605029;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mYmIYCmqwVvji/gLlU74cbPYmKHONbdVpgfdzYyiV74=;
        b=VdM4ZxdnobdmDCzuzgHy8cRxVhm0q14cSeKIu8Vjv/uSto97aO/oAYBQkDr7UGXPi2
         zaiOHIwRyo9S/vVaA9VIqmSZk01r7nnMBzEq9MNFvan/ZzJGAo69TDm19CB8IwfXJKS6
         3Rjhl3K7AQoqdkschJ9pDFfOZSLBAKNGzkysD6/GDyoRLyRdonsN4QX8OYms8rcwSi2j
         XoeKZsTFXVXKAyJzx4RcuqSd+9YeoedDACgIR4M7QFLRBI10Q1haiAWu1DMKy1HxQSD8
         8m10Tz5xDPvsP0tLH4/TosH8e0ln036wruitBZaIy0a/uyWQeSS7uTLlM5gQ65LLF0U5
         2ccA==
X-Forwarded-Encrypted: i=1; AJvYcCUwBhBYsv591gDcGCZaH4Wv59OiH45VE5gktPpfro2ZSlWRVlzDIXDagZPitbcd/El7ObQiaPPHvU2RA/XrrAXqzWmZ9t6RFenw6bVhw6bC1W1VcqHtZJ7GmEqme9j9/WKujCAPU7VwnuVgct9m3g0jHWl6IR0phajTkNFCi//dChkuLN5T6A==
X-Gm-Message-State: AOJu0YxvpaRa+x34Jqvu6Oh2u1ARQttFVE4n2b9vw+Nk4qBnUV8XXPB1
	qFLLB5MZSA2O/DjO1Pj4JO/mtEWGtTS3Wq4Kp0uy8N6kymos57YF
X-Google-Smtp-Source: AGHT+IEjqZP4O3mOUQ6GggXaD2dddoBtsXMh2gmEY3SRCb34lAPZsm7CE9jeeuYqrl4eCohJ0y9MQA==
X-Received: by 2002:a05:6402:4304:b0:57c:d237:4fd with SMTP id 4fb4d7f45d1cf-5879f0c6ab5mr8167310a12.4.1720000229439;
        Wed, 03 Jul 2024 02:50:29 -0700 (PDT)
Received: from [127.0.1.1] (91-118-163-37.static.upcbusiness.at. [91.118.163.37])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-58b4a97b1f3sm2082130a12.18.2024.07.03.02.50.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 02:50:28 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Wed, 03 Jul 2024 11:50:15 +0200
Subject: [PATCH 02/10] clk: meson: a1: pll: Constify struct regmap_config
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240703-clk-const-regmap-v1-2-7d15a0671d6f@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720000225; l=729;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=w1rOHhvKlNZR5V6gMM58fQeON2s1grhUcmwjN3eUzC4=;
 b=VJKr1FcizeZqWLivzNG3Thfjr+2RDK5PLLnFSUkzF90v7ziEIDUwgUNgPc80/Xsr3c6NTdsUv
 eaNxtmI5CINB3at14UF4KycZXJyoTf9I7pB/2nrA1YleMXLtogVfBdT
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

`a1_pll_regmap_cfg` is not modified and can be declared as const to
 move its data to a read-only section.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/clk/meson/a1-pll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/meson/a1-pll.c b/drivers/clk/meson/a1-pll.c
index a16e537d139a..4d0a6305b07f 100644
--- a/drivers/clk/meson/a1-pll.c
+++ b/drivers/clk/meson/a1-pll.c
@@ -295,7 +295,7 @@ static struct clk_regmap *const a1_pll_regmaps[] = {
 	&hifi_pll,
 };
 
-static struct regmap_config a1_pll_regmap_cfg = {
+static const struct regmap_config a1_pll_regmap_cfg = {
 	.reg_bits   = 32,
 	.val_bits   = 32,
 	.reg_stride = 4,

-- 
2.40.1


