Return-Path: <linux-arm-msm+bounces-17472-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 374A08A5AD4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Apr 2024 21:37:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5A1C91C20CA4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Apr 2024 19:37:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7528715ADB0;
	Mon, 15 Apr 2024 19:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PqHHu7Rm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F48115AAA0
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Apr 2024 19:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713209678; cv=none; b=fECylgX+hG6Ju1am27dSWUjkmQ24L944RUxSyvue5vvI44DM0WalUZwTNW1YX6YyDqtAZNBwW5FWhqRTVQS4HWsLypYHCzEoV9ck9rwYZqi0ozvF7tqwarMJw9QwK0r8c9awEyGdQqmtfbvXeRhfSwdPaftDMDChE+iQefNhNRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713209678; c=relaxed/simple;
	bh=Vt+H5ZpqsJCiF9cU1Vjk0O2CGGQ8VmqV+GtNWpgDBmE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TT1kJ8/FQUsVn/TEHAoaTKYWNdXZqds0VH8oKHW24H6jUdwWfV739eTuEIl/ZL+YXyuAnh/ii4Fpy1LUM2KCPWJE27bJYCp5yiEdeTCDsbpgtoeY/OQfUMrbPV8AdjdbUirBtlmyuIE1tY1prRy0fOJ+rjRCQRLP0YwY0I5jpqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=PqHHu7Rm; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-78d555254b7so293823185a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Apr 2024 12:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713209675; x=1713814475; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ISUo+c+Z6d9jp43vDna7WArpy0Bh/pUYqJP92YgrR0w=;
        b=PqHHu7RmgCAD1Sr6qGyZWedulmMJOF+HjBZ+05IojvtMGTnBpMUrUN3yKg9wo4WpcX
         VtU8n0qcp+fV8oERGRlLFWaXkYod9FFHMPQChDDMX/4eq0dBiST1wSGtOYYAjLPVi+J9
         6tGu7PpvVN8EN+Uy10VEOKX8HZFuIfgWM70Mc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713209675; x=1713814475;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ISUo+c+Z6d9jp43vDna7WArpy0Bh/pUYqJP92YgrR0w=;
        b=FhokjoxIx1s69lKjPlB4bm1tsWAwqep9WxqDQjkEApBzTaR1qTzMKeyzReIZxI11Nu
         ZfcsR8F55CYaCOIFeuZ4PA/og4hyYVdTJDGVFvFwhZ92KQuLjoVL04l3mfC34Yg1wiHV
         QbRbxCkGrevyRBlfSI9kelQpDju4zcTirnWAm9SZnWdzHHra/ROEvLnv2jWJK0g+vUxB
         kzkczCEn/umi6RANuDbjqAUUL2n3KHInRQSA0hmMaStCuRE1yTcK9fzft0mrNcG8QAuT
         4mT/p/ETcq3Sg6xMKQPxHRhbFCW+WVEzT4OIopgmnWagnkc9cEnraRXzgyQM7T50Clrp
         /S6A==
X-Forwarded-Encrypted: i=1; AJvYcCU1B2pPpIcofVJkZ4U+J/tR9IKvWTLHGsM1u8xKMjUH+gLjsvKweHht1Hs/snomT/AQMqPKXV9Hslad4SwhIL7Lh+Kyk2MhSePzBZa+MQ==
X-Gm-Message-State: AOJu0Yx29Iz6XB+YFmBiOGsc6iZ319aCfbAuhU8bTSumgp4neNZ6jTfR
	8nfDHJV+X8KbWGYq8qUrIPS5EwZIuizgWABU9+OONx/FcsGeAkQ6y2tP4anY/Q==
X-Google-Smtp-Source: AGHT+IHNEVyzd3evramKoXF4voaYnhuPvr7ES/TUx15oMijuB+fT7oxPAB5JZ66ego178FVyftQu6Q==
X-Received: by 2002:a05:620a:470f:b0:78d:3b55:21c8 with SMTP id bs15-20020a05620a470f00b0078d3b5521c8mr1321999qkb.24.1713209675268;
        Mon, 15 Apr 2024 12:34:35 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id s26-20020ae9f71a000000b0078d3b54eb76sm6718055qkg.78.2024.04.15.12.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 12:34:34 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 15 Apr 2024 19:34:25 +0000
Subject: [PATCH 08/35] media: dvb-frontends: tda18271c2dd: Remove casting
 during div
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240415-fix-cocci-v1-8-477afb23728b@chromium.org>
References: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
In-Reply-To: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
To: Martin Tuma <martin.tuma@digiteqautomotive.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Hugues Fruchet <hugues.fruchet@foss.st.com>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Sowjanya Komatineni <skomatineni@nvidia.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Sergey Kozlov <serjk@netup.ru>, 
 Abylay Ospan <aospan@netup.ru>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Dmitry Osipenko <digetx@gmail.com>, 
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
 Sylvain Petinot <sylvain.petinot@foss.st.com>, 
 Jacopo Mondi <jacopo+renesas@jmondi.org>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Pavel Machek <pavel@ucw.cz>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev, 
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4

do_div() divides 64 bits by 32. We were adding a casting to the divider
to 64 bits, for a number that fits perfectly in 32 bits. Remove it.

Found by cocci:
drivers/media/dvb-frontends/tda18271c2dd.c:355:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead.
drivers/media/dvb-frontends/tda18271c2dd.c:331:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/dvb-frontends/tda18271c2dd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/dvb-frontends/tda18271c2dd.c b/drivers/media/dvb-frontends/tda18271c2dd.c
index a34834487943..fd928787207e 100644
--- a/drivers/media/dvb-frontends/tda18271c2dd.c
+++ b/drivers/media/dvb-frontends/tda18271c2dd.c
@@ -328,7 +328,7 @@ static int CalcMainPLL(struct tda_state *state, u32 freq)
 
 	OscFreq = (u64) freq * (u64) Div;
 	OscFreq *= (u64) 16384;
-	do_div(OscFreq, (u64)16000000);
+	do_div(OscFreq, 16000000);
 	MainDiv = OscFreq;
 
 	state->m_Regs[MPD] = PostDiv & 0x77;
@@ -352,7 +352,7 @@ static int CalcCalPLL(struct tda_state *state, u32 freq)
 	OscFreq = (u64)freq * (u64)Div;
 	/* CalDiv = u32( OscFreq * 16384 / 16000000 ); */
 	OscFreq *= (u64)16384;
-	do_div(OscFreq, (u64)16000000);
+	do_div(OscFreq, 16000000);
 	CalDiv = OscFreq;
 
 	state->m_Regs[CPD] = PostDiv;

-- 
2.44.0.683.g7961c838ac-goog


