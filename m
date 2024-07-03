Return-Path: <linux-arm-msm+bounces-25135-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 410B2925FC7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 14:11:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C4F7B1F23831
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 12:11:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7745E173345;
	Wed,  3 Jul 2024 12:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Zqo7bfIY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95F1317083F
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jul 2024 12:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720008673; cv=none; b=PZeLk+7HvJBH6Ouiv2G9kCO5GasWFsS2pHOhX2wZhSvRodP2E3VNJM9feWTz+uzVdLnMSPPGJN3sHMWwLJrwvSzNC6GgSDyLFMA4zDJ2tdrPPjLBqkER6jOOhlEfcyTtAPkZb4zkNBLKrJTJBJVs4cQIj0PK3WpJihEVzvKyPIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720008673; c=relaxed/simple;
	bh=38E+3ou+E/LV2E8yp/WlqkpQYFuVfruI6m/kZhWQIwI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hUGgUXkfYrjdUW7jZurSfqF9ROGkmKljNyn0EXKShNMm6A0G3t7oJL8Ulrqrm1rjv/tzmjlHBd6t5Q3con/IC1Jk2q5WKlXgZLO3MeC0uleyzs5mQeMnfHpdfTy1PlnjlJmiQwMdyQs13XImyuR+7Z8qUtFhUUrF1NwWskkCl9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Zqo7bfIY; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2ee794ec046so15847511fa.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jul 2024 05:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720008669; x=1720613469; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cedFw99A7YSckyMyYKT6p5GP9raiQYHtK+ru95zornE=;
        b=Zqo7bfIYuJLILF9x5nS0UevjvV1VBhMwXL34SekIopuCp1WKRIoeNfnrOdxftsOGGZ
         oau//V+2bfHUOYXJkkOM5vjNLXWOt7vb9ctXO0drpA53HwlcILo5lX6LIl1lA6kK8mjo
         DkS6joNKGmhjwnCqVTbkQUL2il7d1Ebm82ppAXmN3rhUpKDutgnHCDddQSZ0D+gcOnYb
         DqVg7hfAabx/romHtZ+39UTPYATbN76SoGvm2rmBBO769yiSv23O5FfZz2OfJ/YLafmi
         hwCDTKn9/5cQS9zScLFsvrXRdPgrDRKfMntaSS1FLEpHMKm3zhdTVzMYWE900KxKM9AZ
         4lOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720008669; x=1720613469;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cedFw99A7YSckyMyYKT6p5GP9raiQYHtK+ru95zornE=;
        b=Q3zJ/WEdVDwIgHOj1fOMqLG5xnRAz4jKI/4HcuzVM1AgiI0CAvqKw/8Wdb+wzEQHop
         iz42lfsLtuszdWspDiFrSBd5rum4Lz387xlqc0c6bmzd+CwkUVOvLk7H7aawKy5x8kca
         QxF8KB3/HynQ+XCHHFOLa3gnJqi0ns4SnGTuU2lmcJjLtu1MfjBp5Y5R+ES40QW8+wRr
         /3Sqh8vOePmr2OO13zSJEAAuRPBIGG3UPgKUQ3oDif/cWkh+40qfHoTrN5Aa99mqJ99j
         bHURI/zYHWHQms1GVZUd3CDJN0CYL6TvXYFBhWAMfsPlASlfQyuv6nN8SqDtQCsPHeFW
         rzTg==
X-Forwarded-Encrypted: i=1; AJvYcCUJQ4IwnmoD/CaHcQoLDMCdv+VLsvQsGK/iHxZhGVQQfPhX6GRMyWdXyeEzXAb4UgdkWwbvzSitFbY13WdopnA2SKAUQLHe13+SM1SAAg==
X-Gm-Message-State: AOJu0Yyp5+gYECVKcZSE9Xg9x0RsCpenugP8qTeV1W/sVgRCzAWVWL10
	YcrKiAV0il0UmJPESep7NimmSHa5K/K3Vv+jFh9sPRc/TP7hGF0cb17IsuqxZhhekhg5Zam5iv3
	mt64=
X-Google-Smtp-Source: AGHT+IEfM0+Ld6ncT+ouSLf7osIs906r0Y0FWWGPtojIiKffNhJRaOyCEHrvJZ4Lf1JkvL2wmGUvJg==
X-Received: by 2002:a2e:a7c2:0:b0:2ec:5172:dbc4 with SMTP id 38308e7fff4ca-2ee5e393c8cmr73155651fa.12.1720008669249;
        Wed, 03 Jul 2024 05:11:09 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a10307bsm15716222f8f.94.2024.07.03.05.11.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 05:11:08 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 00/11] ASoC: Simplify code with cleanup.h
Date: Wed, 03 Jul 2024 14:10:54 +0200
Message-Id: <20240703-asoc-cleanup-h-v1-0-71219dfd0aef@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM8/hWYC/x3MQQqAIBBA0avIrBswC6WuEi3UxhwIC6UIorsnL
 d/i/wcKZaYCo3gg08WF91TRNgJ8tGkl5KUalFS9NLJDW3aPfiObzgMjUhi8C04bpzXU6MgU+P6
 H0/y+H1dRFIhgAAAA
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Banajit Goswami <bgoswami@quicinc.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1657;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=38E+3ou+E/LV2E8yp/WlqkpQYFuVfruI6m/kZhWQIwI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmhT/R5G66T/ENazdFQQUl8BkzHTGMOaqY5guUy
 WT86/WIaeKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZoU/0QAKCRDBN2bmhouD
 11luEACJdPtrllcn7nyU28iQn6ZABmnMGhwYKmPRCiJO9rGZe1Ua2bJ9Sa9uSvdYwL857338dsO
 rqc9dp62eIt/FJGnsUV+Q6pH9fav3duzuOv0S3efQBGskRG+4oSi0pF49z3Zr2srf52bq3o1j7w
 IYikBTMiLyvTXAKLoNmHrDOIGm7imjTUIw3+EcQH9iceHRv8cfgRflt5hZKVBxflZzivq6iSKGK
 Dymd0tsWzbYV46WL81f4Fq0nwR9q6Vi3/REU5qMPMNVJrzCZKGySs2UDYuDJw8GKJVgsv3DREWr
 ypsEU3uGoz/q9K42KSVB3DkjuEsZklahVLCjFjPHB9ImFVYZI4zAXovpT1XRtoob1PLdxnMkhvG
 LsBVtekE5MBYQ3UmQif88KWseLAE926zvHfIv7N/TjsjS09DP3cI8yx27hMmPBEOGYy9VjPiEPL
 isWmkWdzm+9gLZIFMP33igefnO/smk6xmBoY/gOsce3fHvn7loIhbTrWhHRI5rAmBkv+Dt1JWcS
 zq1nm8ZBUUIOSscNrXjiAChP/gxojbrHNYaJTBAcmvQqHuyQPMLNeLLjIBeuwvDf6jUhMv0Kwkj
 Za3LssnmMDG/fvG6+ZmvW/3KAOQ9ixu/1WK28FYb/bvYjR9MaFFuI4zlvQ7dJmACvrSzBE8oai9
 9dUOtBj+/gs/E/w==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Allocate the memory with scoped/cleanup.h to reduce error handling
(simpler error paths) and make the code a bit smaller.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (11):
      ASoC: codecs: audio-iio-aux: Simplify audio_iio_aux_add_dapms() with cleanup.h
      ASoC: codecs: audio-iio-aux: Simplify audio_iio_aux_probe() with cleanup.h
      ASoC: codecs: wcd9335: Simplify with cleanup.h
      ASoC: codecs: wcd934x: Simplify with cleanup.h
      ASoC: simple-card-utils: Simplify with cleanup.h
      ASoC: audio-graph-card: Use cleanup.h instead of devm_kfree()
      ASoC: audio-graph-card2: Use cleanup.h instead of devm_kfree()
      ASoC: simple-card: Use cleanup.h instead of devm_kfree()
      ASoC: ops: Simplify with cleanup.h
      ASoC: dapm: Simplify dapm_cnew_widget() with cleanup.h
      ASoC: dapm: Simplify snd_soc_dai_link_event_pre_pmu() with cleanup.h

 sound/soc/codecs/audio-iio-aux.c      | 83 ++++++++++++-----------------------
 sound/soc/codecs/wcd9335.c            | 22 ++++------
 sound/soc/codecs/wcd934x.c            | 22 ++++------
 sound/soc/generic/audio-graph-card.c  |  5 +--
 sound/soc/generic/audio-graph-card2.c |  5 +--
 sound/soc/generic/simple-card-utils.c | 13 +++---
 sound/soc/generic/simple-card.c       |  5 +--
 sound/soc/soc-dapm.c                  | 47 ++++++++------------
 sound/soc/soc-ops.c                   | 26 +++++------
 9 files changed, 87 insertions(+), 141 deletions(-)
---
base-commit: cf601827c51b0496f6bb8a1865f1bf69ebd246b7
change-id: 20240703-asoc-cleanup-h-ef9cbfb67b66

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


