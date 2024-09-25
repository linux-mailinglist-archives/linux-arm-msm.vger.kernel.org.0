Return-Path: <linux-arm-msm+bounces-32426-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56702985212
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2024 06:38:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8E1531C233D5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2024 04:38:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D0191509A5;
	Wed, 25 Sep 2024 04:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MAoUc2lk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C30814C5A3
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Sep 2024 04:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727239113; cv=none; b=IAm78hmSAvETA84LRNsmiercE0a73LnixDFkS8hUNRWLleaUKq4d25ttgCYw9ypCvhxaDrx8WzKaUkSll+l292B7xfAOtnAIljhmShjdTZ9Xf9Eh6C7zDBdhi7fxMKkxCCwK8ompIj167MyW4ZhzKRakfw4H262W7aXHIhwjlto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727239113; c=relaxed/simple;
	bh=ciTImMBS0p6wks5mQK0mcllczL97Z3Zssq9pfQWx3xs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b9Y7NkkvOJZxD8SnWp21kasvcac33RUT7XC7FHXvaGrKxe1i9eKvCGkBUTeIE5veUNlgbGzPQUY777od/AC2R2miROdJr/JSPpjSSwDQESCmCvlA/97CluqwaKZhLaMLRZD7geUmZ+Vk9nu5vERY1Ep10oxYVZYxOd3b3C0OvBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MAoUc2lk; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a910860e4dcso421260966b.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Sep 2024 21:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727239108; x=1727843908; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eqcG1Y/DqvLJS0U3eydB1IqD9oVuSGX+UlV/1xSIyT0=;
        b=MAoUc2lkIfHSanC/k/VTS3tfcLqGjtvLOJ1vBgdk5XSOQikocbEsybcfvdR2zvCkvm
         XtZqCSLnazE7kbatmo4zRCmqW8FBjZmTPq/mRAhC4gWkDhs7mcNfVVV5F9TnDlegGmSV
         tM0SOOtePdpFqIjqreVW+FeJI/NzpflmK8ygXDVScD+jJa5keRXS7s4ApsCIshjeWu6e
         GOL0sg+AxDW3KnKsYb7v8c9WhT1FTeF8li864PJqYUBRaW7/QUhGFy4l+k1VnmlXcGbh
         aUULabtyx7TtJDXRA8vEsZb7AHgeSEnBugAx4Ca+o294BD6ak9OgVVTIuZcYz5k4JR7l
         adoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727239108; x=1727843908;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eqcG1Y/DqvLJS0U3eydB1IqD9oVuSGX+UlV/1xSIyT0=;
        b=rUj81HtqsPECNbHToteoQbdbKTSpPEbcZ049pb+CCnXQB2jbIOX2W5jl24pvGBRADJ
         74Y6p3xO0Az6nlX8Zbb7mmk47A435KGGylAbmjaYrMb5bAue5qItK1Imzi8545EbjvDk
         Ghb20PBx81P8W2DveEKn8GUccRQMafSVMMNT4VRRJ4a8WdG8vYj2RqqpOhptG98EJdwo
         qNe0Oaq8924HqV8bLBp2huDyFwKsVhkfYWazO6p38+H3QjZv5XT7hO7DjZmrBLylZm2j
         358zfMVGXoM2uhMgNYW8ogun5BMH4xKdBBaW1EkuM+kvVtgRQOvZJolLB/5ynAmeX3F2
         Y+AA==
X-Forwarded-Encrypted: i=1; AJvYcCVLhzRv5GxkQJfJKfm8Z3yxP/w/ljkod6Rfv5KsTjU15BN/BUreaQmb2lV/QBPGrnIBNq+SGDbdu9h5CVCt@vger.kernel.org
X-Gm-Message-State: AOJu0YwgvCZySaD/Ug8J1PJmcJorwW4YqtT2fC46ctEQw6QysitqqvPj
	WNFWOz5UAKNC+J0Ykg5LgRZBOeQ1WuKKmWIXs3fb7WXXuh1d/6mCBslaDOtVimw=
X-Google-Smtp-Source: AGHT+IGxDWA9Bpt+Vo+5NwY4exmWH9AugLbSR05W212S951aBgbB3SXoz6SBoMQb7pJmFGUWWMTH7w==
X-Received: by 2002:a17:907:f14d:b0:a8b:6ee7:ba26 with SMTP id a640c23a62f3a-a93a0322a63mr119177866b.1.1727239108517;
        Tue, 24 Sep 2024 21:38:28 -0700 (PDT)
Received: from localhost.localdomain ([2.125.184.148])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9392f346casm164857466b.24.2024.09.24.21.38.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 21:38:27 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
To: srinivas.kandagatla@linaro.org,
	a39.skl@gmail.com,
	linux-sound@vger.kernel.org
Cc: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	krzysztof.kozlowski@linaro.org,
	vkoul@kernel.org,
	klimov.linux@gmail.com
Subject: [PATCH REVIEW 2/2] ASoC: codecs: lpass-rx-macro: add missing CDC_RX_BCL_VBAT_RF_PROC2 to default regs values
Date: Wed, 25 Sep 2024 05:38:23 +0100
Message-ID: <20240925043823.520218-2-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240925043823.520218-1-alexey.klimov@linaro.org>
References: <20240925043823.520218-1-alexey.klimov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

CDC_RX_BCL_VBAT_RF_PROC1 is listed twice and its default value
is 0x2a which is overwriten by its next occurence in rx_defaults[].
The second one should be missing CDC_RX_BCL_VBAT_RF_PROC2 instead
and its default value is expected 0x0.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 sound/soc/codecs/lpass-rx-macro.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index 9288ddb705fe..2f6699c0a643 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -961,7 +961,7 @@ static const struct reg_default rx_defaults[] = {
 	{ CDC_RX_BCL_VBAT_PK_EST2, 0x01 },
 	{ CDC_RX_BCL_VBAT_PK_EST3, 0x40 },
 	{ CDC_RX_BCL_VBAT_RF_PROC1, 0x2A },
-	{ CDC_RX_BCL_VBAT_RF_PROC1, 0x00 },
+	{ CDC_RX_BCL_VBAT_RF_PROC2, 0x00 },
 	{ CDC_RX_BCL_VBAT_TAC1, 0x00 },
 	{ CDC_RX_BCL_VBAT_TAC2, 0x18 },
 	{ CDC_RX_BCL_VBAT_TAC3, 0x18 },
-- 
2.45.2


