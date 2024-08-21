Return-Path: <linux-arm-msm+bounces-29199-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6031959AFB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Aug 2024 13:59:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 15DA81C2296A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Aug 2024 11:59:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29750199FBC;
	Wed, 21 Aug 2024 11:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="On+GWy28"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6472019259A;
	Wed, 21 Aug 2024 11:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724240973; cv=none; b=gNYpUCuq525ITb47KVVmTwPPlcOAI9NL2bKmJqM6nDYhe8n30dQrnxg26wKc0w43vIrD5elhF87YM8wmzsxF06GALLOLmFC8AqQ5sS0j1tJItJ4v99Uk2RGZk6hhWeUxVMY8FbcFdNBiGsM/f98NjfUoCPVoZQ0eR4z4wbPdFkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724240973; c=relaxed/simple;
	bh=ZNOIiksq+oIvdQ6nChxSzgVj3WAtiicwlWk2MzXMfF8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=ftiVi/HZszCEfxRnlvxP4rOJ02tgxbOd4gR7Lkbsrmkiv4Z7TiJfM9Wn2bpsqNW8k0ueq6uYYZB7zdUOkWS+ct3b88hgAJ6mZ8rKL2SYUvqP3SJ+uFxTFwnvH0ZpB+R2Ef/F6FYmva8v8yxs0w9YAhETcaOmZgZ5egrRXWYOT7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=On+GWy28; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-533462b9428so2109285e87.3;
        Wed, 21 Aug 2024 04:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724240969; x=1724845769; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MuMMiFy/GV/lo8qvjkEdntUASLQW+h7BP1y0eXqQ2Fk=;
        b=On+GWy28spkefp1kxyhb8ci3UmCdA7uos/e34JEbPlNGvO3VibxHnV+QPRdeAlbD8j
         ujuKRVZvwupv4RpaaI7W0TOaE6rFL6mX8FXWWcYYpAgvBAsEAFcKH1mZiJOxq8fRxd9I
         +P/LsOvU0/Xhf6P1luQmum5VNsuI4RSY7INNllf72AYSEFaWma9H/ynbVWW3nnuO8X9o
         bqEPsmIB0eVIvwATgUaGhf0EThrCEOKdek/8DUStVU0neXDbBB6ffIcacP2ZIdOoWw7w
         kkgKYVPxanqLzoXctLYNrkpYk+BUfxFr9K9Gp2DKJTmBhSZg+0lK7pJiLRMS5e30lGte
         Lk7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724240969; x=1724845769;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MuMMiFy/GV/lo8qvjkEdntUASLQW+h7BP1y0eXqQ2Fk=;
        b=nd+mDTOrn9m78YGvOOAswY69Tu1S5pxRlwgOldPDS2YpSWpD3+JrAXYkIqZHogzGk3
         kXnj+mKBwhqAM3k9O+7jyOyyeQXq2WhEI2c+GE1MweFYoihVdlDQpgU4pObw6CPYuc1J
         5kU7lVBde5zhMMqucWnd5RTVKDPL5r+DvoPT+XpTLTTwXvb3iNVDaqipGn5+nSXUNFmw
         Bwr1JWT5bxE0Sdw37QHcnRl+P3ADpdckOOUxyLbQsLg7RzJ7vfT40BtDK0QjLgYncqhL
         6OQ9gGHzadPfJOSmDrT5HuBCC4gfk+8Kw5dN9vQ2Vj7YMYmBLEOcB6yOHXjva5oTOkjP
         Y/Ew==
X-Forwarded-Encrypted: i=1; AJvYcCUgcabg/EhPBeDCUL/rAXl+7WcqBmGDckc2tj1KHOacjEbYCG0udaixAgyqS9SbVxw0ecsLlLO9E1ilGfcr@vger.kernel.org, AJvYcCXaeL4AWosMUnOld6EXa8NXyqv04RtoqGb+CgK2OC+D/ORo30mLA9BEun6WB+Orxik+rgc/GFg3xDwhBn4=@vger.kernel.org, AJvYcCXmdVyXlfBm4J0ctPZv8TCPMS/wDyfxOxiRj9daMym4DevyEF/u3/N8WhBpSnex0KpZ0NC19coB4hf1nPYw@vger.kernel.org
X-Gm-Message-State: AOJu0YwxPRb+xVEZwhCMZecZSTsANDymhU5og8haLnEeC88sqekyi/mE
	WkVShB6SOdvzLxElA6iBulzCURiEZO1/L2LEQAv/Ew+EA6zJTjsz
X-Google-Smtp-Source: AGHT+IERUWWgK3HBz7H/4+znx84XAekugvyQB1GyHzWt3CJXUdgvULEOKqQjl6jNQIER3p0yxeZlVg==
X-Received: by 2002:a05:6512:1256:b0:533:324a:9df6 with SMTP id 2adb3069b0e04-533485928cdmr2036535e87.29.1724240969163;
        Wed, 21 Aug 2024 04:49:29 -0700 (PDT)
Received: from localhost (craw-09-b2-v4wan-169726-cust2117.vm24.cable.virginm.net. [92.238.24.70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a86702ad43fsm89820966b.136.2024.08.21.04.49.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 04:49:28 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: codecs: wcd934x: make read-only array minCode_param static const
Date: Wed, 21 Aug 2024 12:49:27 +0100
Message-Id: <20240821114927.520193-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Don't populate the read-only array minCode_param on the stack at
run time, instead make it static const.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 sound/soc/codecs/wcd934x.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wcd934x.c b/sound/soc/codecs/wcd934x.c
index 291d0c80a6fc..910852eb9698 100644
--- a/sound/soc/codecs/wcd934x.c
+++ b/sound/soc/codecs/wcd934x.c
@@ -2643,8 +2643,8 @@ static void wcd934x_mbhc_get_result_params(struct wcd934x_codec *wcd934x,
 	s16 c1;
 	s32 x1, d1;
 	int32_t denom;
-	int minCode_param[] = {
-			3277, 1639, 820, 410, 205, 103, 52, 26
+	static const int minCode_param[] = {
+		3277, 1639, 820, 410, 205, 103, 52, 26
 	};
 
 	regmap_update_bits(wcd934x->regmap, WCD934X_ANA_MBHC_ZDET, 0x20, 0x20);
-- 
2.39.2


