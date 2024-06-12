Return-Path: <linux-arm-msm+bounces-22479-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D82905886
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 18:21:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 136D6283F86
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 16:21:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23842195F3D;
	Wed, 12 Jun 2024 16:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TeHcD1kD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C7B194A6B
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jun 2024 16:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718208980; cv=none; b=aVDj+Bli4TdEhndZf46wMd6u/7SKPXsOF3YU9Fi9Tc9D+oPwenbV0jD3NXDHi82iANoAd3HnYGSlbi+TSdJH6SO9QJArpPQECtkBoRchHacaf0TWb9e07rd7JqvOC5KMWODpjp0ygdTxxIzYs78L3yNsRTbLn9LxKiOfsUZ64Bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718208980; c=relaxed/simple;
	bh=kdpxzyNuweZKr0aRSDH2rz6ZRs35AU6E2D86EkplPOk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Uy09y1B4sl9Ep7NsSeJvpmAFlgrk1whDn5ejdq6D3niaiLxrfPgzQSxrsRG4rbL7ooZ4gFgSfJNOu3ghIgXzrcrk1Ak7R2nOsC6w3vFhc/aYMOa2bjsr0UTCP/ZQSgaCeA6y5OyDnTcdtm1Vflce5X/UoVJaiewZeJMH5kXS2Kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TeHcD1kD; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-57c75464e77so3208577a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jun 2024 09:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718208977; x=1718813777; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HZaOcybsRppKpT5g6NO45LPBfW4VWvjoUX43728185g=;
        b=TeHcD1kDvc9yiwSDdTi04Z1dL2dyXvXa1LrI5BsOeS28je5K08Cp7Uvn5+fxm0tAu0
         KCCtDU7Nq8w4DpVviLjyu7WPt4WG4XxkVHWqFPNvIsEPKcE8qEtlxNTBdTLaor0WoUZf
         s++YN7DrmRFnETBesFK9sbBEpAVBZ3HUjRUV9wGIUz0PDJ009ViZI/tZBgOxUhmfrTwM
         IC5M814Zn2wzLyp+an2CyJr8/sy8nwA12TsaEZsM4KlSgkb6VDPJ3q0RRVJT6OUuRfB1
         AOFA47VbI9hT7i5gmOov/iaFNUytSPzLDcsSypQ54Hgbti2DXjNto3jhDJBvOVjTEAij
         SYBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718208977; x=1718813777;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HZaOcybsRppKpT5g6NO45LPBfW4VWvjoUX43728185g=;
        b=AITOHkLpWc5tjL93vUYAW08mlGSgBi+zVVEdU1qOSUOvEcIHYlXt8FUAPvTYxTtlzW
         HgMsDn8MaKkSgzK+ftv5zDSW0mlncOwGKWAAN0bdV91rY3MDzwbkiLXd09RBx6G4oc8l
         xM9oHiMKVgctvHVo6g0UAhcm68aB303NrhrTEOKoQq+cJqlbGwqCwuc6coi6iKHrhWwW
         dBpvfeSce38RjXpxLpDjyK0XZKbftAuTyQZqmeIiOpu52JuwKUiFyxorCXUGcy6T2HKX
         J+f5m8NlGcoNu/ULjPZ/iuU7CfyWB+10ihZojFmUHrE/DE9dXL0JAqSRsHzabt4XuWR0
         /6uQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6Y9iIVza8LEDgkO9lT13bTi80xvHziVOFL4kqKqT9uZZmx0KOsvvXIM5H6T+fvSeCBjRNd05MI+EnqnzWc02/Ey3DKPi2eXcfyo7SYg==
X-Gm-Message-State: AOJu0YyvsYx6hlU/7AfqGRcIF6C/PVJL7Un24+aOc59iigCU0TIqJY7m
	ZUYq9Kv9JkE8jd3TZYvovz0CwF1MWkWByWHMheUYvb78P6lw6sYferdAva0AryY=
X-Google-Smtp-Source: AGHT+IGBStgBwHDaeCOJIdElnx3jY9hewrQLo1+/oRczrEHocXLAooxE3WopQIuwsEkaMPbx5CZtUw==
X-Received: by 2002:a17:906:1ccf:b0:a6e:d339:c095 with SMTP id a640c23a62f3a-a6f47d56e10mr143448266b.47.1718208976945;
        Wed, 12 Jun 2024 09:16:16 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6efd6cfb74sm624815866b.20.2024.06.12.09.16.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 09:16:16 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 12 Jun 2024 18:15:35 +0200
Subject: [PATCH 22/23] ASoC: codecs: wcd939x: Drop unused RX/TX direction
 enum
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240612-asoc-wcd9xxx-wide-cleanups-v1-22-0d15885b2a06@linaro.org>
References: <20240612-asoc-wcd9xxx-wide-cleanups-v1-0-0d15885b2a06@linaro.org>
In-Reply-To: <20240612-asoc-wcd9xxx-wide-cleanups-v1-0-0d15885b2a06@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=623;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=kdpxzyNuweZKr0aRSDH2rz6ZRs35AU6E2D86EkplPOk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmacmqTiI7/MPDpOR/QPOCYLLqnTtbJ9lWR7mV2
 wJ7BGfzhXeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZmnJqgAKCRDBN2bmhouD
 13e4D/0ZkltMoAyKX0mzksxtBOvUUWkNcgLlpCvNqdmlMIhR/r8kKBSwdJQOS7fvCxRSbJXVPjC
 m/7fMpyDfcF5VUMWPlZzObRfzr8W/odYj0k1t0TmXbAEUE5AG+/XqjQfv5VSJnlz9AlEFemViYR
 THjQKv2vWpVBVtWPfcQktJBaM56Tg+uN4uix+o4fccx2ZgmtV2fTn83UkubIbS7zRqQLIw0n21b
 qg77mcw7AdaW2uhqZjeo/NdlzsdyQxAR4gGfSmGIhq+OwP6xSd1CGDCknjPwVuWjK9XBso3qpdr
 NaTolQ9xCwPFpHERkFINSC+klwCJwlz25ESPB5SWzAFXC+W6ZvM3RNYjA5Tu1ZbhHXYDT0M/Qfs
 OhbPOuGRRUljpD1Z5pfwRR6kJhl/Toaj+UTz/VD4uGwnvUeFbnCgL3ftsmdOqJjG3hLwKoGJmSM
 RtRQCqxWIv/WvcOyG9c3qD2HnBsg6JYn/zIM539PqLbXzq2sui7zNaPY8NnzYwBZVdBAqCY6ity
 ceczjgqxXDBIbm7Cd+DUHClBXhgurZiEeRRHTzzlh3Gvk4/Rc9X3wD7MtBrk5/bsBNo+9ue5zfS
 NHK5FKcXGJlddS0XtxjxoSaXHaAbQwSHpGCsFyQnas6U36X3Wv0C2vARmWWXlEQEYT1q5DGBTgv
 KRWlakkVEDkoy2w==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

The enum with RX/TX soundwire direction is not used.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/wcd939x.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/sound/soc/codecs/wcd939x.h b/sound/soc/codecs/wcd939x.h
index a6c9c6cee056..0aa4d9d542c6 100644
--- a/sound/soc/codecs/wcd939x.h
+++ b/sound/soc/codecs/wcd939x.h
@@ -903,11 +903,6 @@ enum wcd939x_rx_sdw_channels {
 	WCD939X_HIFI_PCM_R,
 };
 
-enum {
-	WCD939X_SDW_DIR_RX,
-	WCD939X_SDW_DIR_TX,
-};
-
 struct wcd939x_priv;
 struct wcd939x_sdw_priv {
 	struct sdw_slave *sdev;

-- 
2.43.0


