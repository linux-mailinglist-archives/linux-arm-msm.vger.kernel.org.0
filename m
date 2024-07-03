Return-Path: <linux-arm-msm+bounces-25065-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E01F2925750
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 11:51:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A2AD0289370
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 09:51:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65E26158871;
	Wed,  3 Jul 2024 09:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gCMUeLc6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0D9A143C52;
	Wed,  3 Jul 2024 09:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720000234; cv=none; b=O4ABFAM8xJekWVYKFtT8x16KO5IRUdAdXME0+xN3VWUEKXkXOZrH4dnrV4ALfj61VWyQs93yhtlPkRJe3oyp83NXUjWSoqtbDyVXgWnJZnNCobHW5Ol2ufD60JbCDIV9CM/mwLbb6d8CUtrNZzHU/EdUbyx55b0husOaN7hWQok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720000234; c=relaxed/simple;
	bh=TxADEvEEBX/TothZVxPgAJ7RkXfQpn93WbFswKz2wf8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=emy1/Pu/tHynZwQRqSMOTjqeZnxPAo8tP+6264O4axoaEJxDSUhDKcKTPBQtLRu4Ptg/COkS4Q+5gp+vnEPMMrbLhuM3w0N7utDc6zQC6M2UMOk6c6IIMacbDFy33DsR+E3QkN4z9tQwqn/nZRPQ1rKspzLuYkzxrnaBkPgLxdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gCMUeLc6; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5854ac817afso3158039a12.2;
        Wed, 03 Jul 2024 02:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720000231; x=1720605031; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nvMEinijEwgsKZDsBmGm/iKxTFLThMpGobnSIWlzUFc=;
        b=gCMUeLc6ZSRT2nYpqXde7mp7rfirujtgQcFaJfmDZUJQx0NEfiqE/7EZUMIuz85Ohm
         UQarvbjQLJkQQ36cHnscIzRVEYPMDrQc8WYSZFw2qaLBIM8QbjjwVJ8vojBu0vNt6a3h
         q46C7yVZdPQGr+/4l+EQQo3uX/wj3On4KM0A79HmXH7bG77un/dwjBPCEbBdtr4A+c4/
         lLAth4DLnWXSXS6hYU95ZZC2+AzgdsFFtgQhnPFheMOkxFya6QAcmzRZxC+medxqSH/B
         Uybixz/Z75qDcSeIJN/0x3WJfc80ioF4db7WgDeQIHZBSxLna9i7x4OGiJqBuAIwZGDU
         jSlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720000231; x=1720605031;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nvMEinijEwgsKZDsBmGm/iKxTFLThMpGobnSIWlzUFc=;
        b=qdO7o4KzZg8vDJ56yHsBvmvKBsMQcJnRgIKLYc2uez7edDCjbNmqY47edFHkWDiNJX
         T4KlhdYCflC257rhJ2TONrgXsaOXpj3fQanyF5s+v7KoPzGT7Z/iTqH39XkTX0XAn+8r
         7IKtPE12ozp8DZm4mx/EFdV8JjZ9gjkY6FuW2v2YtE66Xpp3yNXNp80h3Qkxu7hQUSvo
         sCE9Kxphd45S64G/a0bJuCQaMtQFpwXdXPCwuKlF4q+H5EokszVZkFF4uF18bIV5p1r2
         y+LtDTYIkExZWba5b8INx1mRyqr/BsOrdx0DJ/sY4c+yuZD+0zvDJVS7pmyL2jmUNzdA
         f46w==
X-Forwarded-Encrypted: i=1; AJvYcCVQSInqns8MGsvxLFIXOvWHkypYhfcXHnmuROGy0f/yrJz+TVIH7xYCj6J2WHvfVUX8xmC4pLZlqdo+UcKDi1B4Qc64y9VL+QdkYBa60EP+OR0D3UyCTsUuDxdxd5bjIh5wtuqk/zEBa9khwf3XakF9jtiSEz7ib1egUImolhxT84Gr+2VApg==
X-Gm-Message-State: AOJu0YwfR3YaPx0Hxw4Ma1GoZj0q12XLjPoI0ZKCeV8IQuX9Oh9/CDH+
	6sRFG4jFm/NE/kihpWSBDwuLFWkBU7R5mpgWjcquMOV3ww4MLHnv
X-Google-Smtp-Source: AGHT+IHqO0NeW0hYgOS++CrB+maws1bAp/Jb+zrdkccIaJUBHpnIHgiVuw0F79kfyt8XXwzzdBrjHg==
X-Received: by 2002:a05:6402:90e:b0:57c:abf9:e6ab with SMTP id 4fb4d7f45d1cf-587a0bfc706mr8446988a12.31.1720000231004;
        Wed, 03 Jul 2024 02:50:31 -0700 (PDT)
Received: from [127.0.1.1] (91-118-163-37.static.upcbusiness.at. [91.118.163.37])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-58b4a97b1f3sm2082130a12.18.2024.07.03.02.50.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 02:50:30 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Wed, 03 Jul 2024 11:50:16 +0200
Subject: [PATCH 03/10] clk: meson: c3: peripherals: Constify struct
 regmap_config
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240703-clk-const-regmap-v1-3-7d15a0671d6f@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720000225; l=790;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=TxADEvEEBX/TothZVxPgAJ7RkXfQpn93WbFswKz2wf8=;
 b=ZRDeYsd4qQkFOSJF/zfGi7N72RpeUf69oTYxSsNrKIIUNBXaLyo9mTarnDmlHNHfjp8M5XoMO
 P5IZN9S7rqXB/deiDxd3FbCvxgerParLlTFa3YYJek2EV5ur4YeuUNQ
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

`clkc_regmap_config` is not modified and can be declared as const to
 move its data to a read-only section.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/clk/meson/c3-peripherals.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/meson/c3-peripherals.c b/drivers/clk/meson/c3-peripherals.c
index 56b33d23c317..cfa573262bf1 100644
--- a/drivers/clk/meson/c3-peripherals.c
+++ b/drivers/clk/meson/c3-peripherals.c
@@ -2296,7 +2296,7 @@ static struct clk_regmap *const c3_periphs_clk_regmaps[] = {
 	&vapb,
 };
 
-static struct regmap_config clkc_regmap_config = {
+static const struct regmap_config clkc_regmap_config = {
 	.reg_bits       = 32,
 	.val_bits       = 32,
 	.reg_stride     = 4,

-- 
2.40.1


