Return-Path: <linux-arm-msm+bounces-83008-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 84846C7F1D5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 07:50:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id B3B73345ACC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 06:50:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4929B36D516;
	Mon, 24 Nov 2025 06:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b="Ns6/PiE5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 856D02DF709
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 06:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763967033; cv=none; b=FO308oD9/V1VAuxT6CElENf5P3Pf7HecaQ096U1lPt3Zbh53IRgM0ajsqOTmOaMW74ufikPSuWdlu0LzJUF+GKP0SrOD8XO0bpt5JEOGLu56dw/bv8+LmUNtkrdvWmCaxjrEx+MMBG6x/iVDBjoD2XktiuEebKhYxIWct/EDL4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763967033; c=relaxed/simple;
	bh=y+w5e6c2MgXTXncp0nIxoBYjb2mIvHERbbgy2ayAB34=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=snaVOy+ERkqtPIauGSCJ0dgwpjTzirQmasQdkLa7ZgyvdaEzGCpiOxwS566g4Es4GLDXogCxD/3M1R4tkCbmRxTJoZ5Ef6vzRxfFwNHa1Ziiqb0Y+BQlvC5IDoaWuHvGO5ppSWPWKLTtDqPoeWstiX1u97oMbeN69tM9S/Fhr60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca; spf=pass smtp.mailfrom=marek.ca; dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b=Ns6/PiE5; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marek.ca
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-8b1b8264c86so397005585a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 23 Nov 2025 22:50:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek.ca; s=google; t=1763967030; x=1764571830; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cNc5rm4ZQfDfDh2+JFNbnMFh6W80bhd4YB2ckWPITEU=;
        b=Ns6/PiE5fSmX10BmZgz26GEQURqpEjbaikkZbHi5uoxKCMvUHcFbCWDXRFN3xcKteZ
         SZNAybJImA0sk5CJhWRpqtVSZVHh+HmSwLLamULxkk9gRpqUPuO6WdB317whWVrm1+rO
         +yZm7R5RRh7ee8dmjAG0rrXsm1xIh1owbseHPPuniLfVyhsnRX/DvTkfOky0vZD30Skl
         SxFyMtNFrEen0PT78Ac8kh0+YUrLKJvDcu5lUeJ5VjYgG/xvh9G1UCBDkN9xXq7YUmqu
         T2eXvdf0ChAzRyLRakIHkkLdDnug9DhiV0H/nJe/5j850syOS8y6iJZxeC3NfACi8ZYl
         6ttw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763967030; x=1764571830;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cNc5rm4ZQfDfDh2+JFNbnMFh6W80bhd4YB2ckWPITEU=;
        b=W3yeeZnJ3QWyvPwS6ZwiKrh6tJg/rL/XvM05YsVmeVC6X1BZIXIXKVyNDmlAICz05F
         9X34V39HSYE++KYgLfRvBADWzMqFA1blKOQXEzICtUwpP59ueFyqolRLrC/cp+jcpQ/a
         UD2S2h3il7KKlnoVeeEsTaJSI+MBbptkJHYB3cCHtS376Pc1TGq7kR7bCHbdsKuZUIy+
         zC6w9zmJlkLFj8RU9bEunGFMEv1CCiuwFoAmYnWBRMUutgN2KrpjCmepwk1ywtswl7GU
         5zjtBq6Rn7beoA/eCgPkhfVxafarw8/++DhCtwxZzWqDWaXsIRHaQQ3oob1OyhYw8/fz
         lN0Q==
X-Gm-Message-State: AOJu0YwqKpYZJPU7JN/ST6EpjDvzD9ZIpVrUAnyse30I0CzvcBdMZs4H
	gY2qxkgqINVHaCAuQl6vQsncCEUgPKd/DS6a5HKjsHFuQQTj5n7PIQoDQHJxUui4ZjaA3j3SooK
	y9MYO
X-Gm-Gg: ASbGncsTe2LOwzS5LxBtqhAzeetP9Pwfy/fuZt2bX3p/6BRqQ3hdLCefwCtM1jS1nE1
	bxrXTogzlD1gVHUjxCMAwvujLheWFGSU7yVflNYSvYf3GIFgtHkGO4KoVPOAMP8A1jxl4+6A6Fl
	GsLY5VP3Dxy4qgr7+K4lU1DdgoQkh/b38K2xMDpUgVCM6LGjcq/3ox8gbIa/wst4ExlBwCdj+ZE
	6q6EQUvrHUFIq7X78Lt40YBs7zQo8O2xsX+80u3nsqM3ij9H73cPI+N9vc3kpNUuTSsaSGcReHJ
	SokGnc0GpwOfj4aCc5OAMg3ci4uTORIB6biFnX8Y5Y2Y7NdbB3Z+YsrRwsSRsRD5eQdUlUfUhtE
	2UIPRXbc01VTt+kGT94S81uKYoP46J0YcrlXFTAN8Qvs3Hj5exKfA7NotFCIFN0/knuWTp4qnhu
	vB0MH4a3LIN0KPG1jTaTTPk9rDeiTFbjtyWklWfw1jUM5zdvuPiu8z8vJxvNYwzuMLJw==
X-Google-Smtp-Source: AGHT+IGU/FNHTOpS2yw+2Y59vhT9ZGPR417V7So6rHGQ64fdNxkG1gK7Ti5iS3OB77llaVwIvljXOg==
X-Received: by 2002:a05:620a:4549:b0:8a2:6690:2417 with SMTP id af79cd13be357-8b33d46b1e6mr1429722785a.67.1763967029957;
        Sun, 23 Nov 2025 22:50:29 -0800 (PST)
Received: from localhost.localdomain (modemcable125.110-19-135.mc.videotron.ca. [135.19.110.125])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b3295db8b1sm889075185a.40.2025.11.23.22.50.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Nov 2025 22:50:28 -0800 (PST)
From: Jonathan Marek <jonathan@marek.ca>
To: linux-arm-msm@vger.kernel.org
Cc: Jaroslav Kysela <perex@perex.cz>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-kernel@vger.kernel.org (open list),
	linux-sound@vger.kernel.org (open list:QCOM AUDIO (ASoC) DRIVERS),
	Mark Brown <broonie@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 0/6] wcd938x/wcd939x fixes
Date: Mon, 24 Nov 2025 01:45:53 -0500
Message-ID: <20251124064850.15419-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes for two major issues I encountered
- pop/click
- not being able to enable both left/right channels

And a fix for an issue I noticed in the wsa codecs.

Jonathan Marek (6):
  ASoC: codecs: wsa884x: remove mute_unmute_on_trigger
  ASoC: codecs: wsa883x: remove mute_unmute_on_trigger
  ASoC: codecs: wcd939x: fix headphone pop/click sound
  ASoC: codecs: wcd938x: fix headphone pop/click sound
  ASoC: codecs: wcd939x: fix get_swr_port behavior
  ASoC: codecs: wcd938x: fix get_swr_port behavior

 sound/soc/codecs/wcd938x.c | 85 +++++++++++++++++------------------
 sound/soc/codecs/wcd938x.h |  1 -
 sound/soc/codecs/wcd939x.c | 92 ++++++++++++++++++--------------------
 sound/soc/codecs/wcd939x.h |  1 -
 sound/soc/codecs/wsa883x.c |  1 -
 sound/soc/codecs/wsa884x.c |  1 -
 6 files changed, 84 insertions(+), 97 deletions(-)

-- 
2.51.0


