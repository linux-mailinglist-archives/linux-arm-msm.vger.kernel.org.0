Return-Path: <linux-arm-msm+bounces-17466-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B9EE8A5ABE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Apr 2024 21:36:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 84DE31C22EAA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Apr 2024 19:36:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72232159201;
	Mon, 15 Apr 2024 19:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="BRrz7r2a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FFEA156960
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Apr 2024 19:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713209672; cv=none; b=Vsc//VEp7huUjNtjRyA/MuIotwYLHpgOcZmSodNVH1MPR6zoNfoLn95vHSKXozoBQ30u8+USEo1u5cJkNM6NH8r6nQ7E9tlb95EwlOkEG5rsD5/mSeyR05XzwwSLAj1ywCimGsqn6JFomZjrfvVc8rKrFYgZJ9CtNt3Ypy+0+yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713209672; c=relaxed/simple;
	bh=32n42m9fdIyR+hNVCJy47MhHZfKMG1kvIiYpYvj18tM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h6o/4JDit1inGEew6cHB44O8KR8XLk7pF5TnAFG5feigy7iT+IaoU6yxjHdIBl0PcjzwC490rzpdXSC0ZedlaEkZ4LuEgpWD4DkvI1uaznECwv78nhlnaYAU48GhGB3iz3cMkAjg4k8IoH7BbcP99FcWSenqnPE60SQ0mX60rN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=BRrz7r2a; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-78d6bc947aeso294356785a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Apr 2024 12:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713209669; x=1713814469; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xRTXUwBhcFkchUD68etf7Ns4ncGhFtPLbimlhLL9HW4=;
        b=BRrz7r2aDK2PPekfkNvI8RRNowCL/eQjOyqwfG5qTX2qjmtuHB4WT2N7YxaV/xRrD9
         tYBGKKHTYdNYLEDISZigulVt/re7uYAfY20oeJC3hIShcTRrFW75p+Nvm7gZOwBpHmof
         +QkCyQRYkF9Ib7fIdEfpLgX5/Ihkk8zhQ/Unw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713209669; x=1713814469;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xRTXUwBhcFkchUD68etf7Ns4ncGhFtPLbimlhLL9HW4=;
        b=MwwYlBTStdGxgnk7U1M34BBkmRMXr0Gs4TFX/0MEgmsjSLiZWE5h6jSyZUbChJN67g
         y9x0sd9yLzSLfSCgZ+Q7OaY5p4G2/CBldjRHkSOfAlExQjuzkhwDeOVUxrFfB1X1zaiO
         T1pGrJJstclLd0twzsR45vp99I75HqsmE9HTbv5jDFRZzE8CIvsiJDpnCFGy/wVBbV6F
         o3LBgzP1XGAyxkAwy1WM0pdi85GlF8I2+NidYB/SJAps1TCaSEIxoZkP0F4ZzYE7qVie
         bYvsWLKPKe0vz4q7i590fAWjTj1ELx11DSShZtxSCfOR3cwdjkzbFa3DaoAYw2d0xXqS
         0fIA==
X-Forwarded-Encrypted: i=1; AJvYcCVS5Jb8L9Mq/+9Oi0b33c2LQry2x/W1Hq+LTW3439ypXcv9Pn0UIvG3gZDpPvoELhiPeb2H1b1lJlI4CBq81WDHlXl0+/5tzv7N/qWfyQ==
X-Gm-Message-State: AOJu0Yxf4Or/JPwc0YFx/hDzOD7GLJG3bkBE2Rk2eDW4fxsvmWiPNOOO
	XizBdlvO5cnx6vHn3txVtr6/XKSo91V/cIOc+leZ1ZtTuHsk3omeptYyoq7kTA==
X-Google-Smtp-Source: AGHT+IEcDB670miUV6x3+CTDpPjHVUs4fSa2Vf0AT5UVwIYIhxKgJdBP21+/uHglj+bsAouxmzkrbw==
X-Received: by 2002:a05:620a:370b:b0:78d:77f2:573b with SMTP id de11-20020a05620a370b00b0078d77f2573bmr14232523qkb.52.1713209669333;
        Mon, 15 Apr 2024 12:34:29 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id s26-20020ae9f71a000000b0078d3b54eb76sm6718055qkg.78.2024.04.15.12.34.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 12:34:28 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 15 Apr 2024 19:34:19 +0000
Subject: [PATCH 02/35] media: stb0899: Remove unreacheable code
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240415-fix-cocci-v1-2-477afb23728b@chromium.org>
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

chip_id is an unsigned number, it can never be < 0

Fixes cocci check:
drivers/media/dvb-frontends/stb0899_drv.c:1280:8-15: WARNING: Unsigned expression compared with zero: chip_id > 0

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/dvb-frontends/stb0899_drv.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/media/dvb-frontends/stb0899_drv.c b/drivers/media/dvb-frontends/stb0899_drv.c
index 2f4d8fb400cd..222b5476ebfd 100644
--- a/drivers/media/dvb-frontends/stb0899_drv.c
+++ b/drivers/media/dvb-frontends/stb0899_drv.c
@@ -1277,11 +1277,6 @@ static int stb0899_get_dev_id(struct stb0899_state *state)
 	dprintk(state->verbose, FE_ERROR, 1, "Demodulator Core ID=[%s], Version=[%d]", (char *) &demod_str, demod_ver);
 	CONVERT32(STB0899_READ_S2REG(STB0899_S2FEC, FEC_CORE_ID_REG), (char *)&fec_str);
 	fec_ver = STB0899_READ_S2REG(STB0899_S2FEC, FEC_VER_ID_REG);
-	if (! (chip_id > 0)) {
-		dprintk(state->verbose, FE_ERROR, 1, "couldn't find a STB 0899");
-
-		return -ENODEV;
-	}
 	dprintk(state->verbose, FE_ERROR, 1, "FEC Core ID=[%s], Version=[%d]", (char*) &fec_str, fec_ver);
 
 	return 0;

-- 
2.44.0.683.g7961c838ac-goog


