Return-Path: <linux-arm-msm+bounces-23059-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2363D90D38A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 16:07:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3BFC91C24B2B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 14:07:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B618A13D53F;
	Tue, 18 Jun 2024 13:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SedD39yC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16D5D2139DB
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jun 2024 13:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718718560; cv=none; b=q0xbnaFGsez4zUEY1l35e+EaMZ8VnHCe2OXIAEyUesgckkq5SQ2QFraQCFv5znW4EfaD81nf6eN+IfhzWO4nAFqVG2N7bKY2HaT6pwCjtw7m5z8YTEjOIDLymGJiSN5brIrWJ2xQu1PHfgHEVCI7EREO3P/Uat/RG6/igbUdmYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718718560; c=relaxed/simple;
	bh=0rziP/IoVXP3TfzQU7TMnmqKwrX7EBGqSRuKglqc2j8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZqlcdK9KQGZoe8vCY/Vpzxtaat6LVYrNylPOXL0iGxpXJjLGSI/ie0hJTBHGmJuv9qH5betufVuK2GcM9ewRoUeLZUewR0fRQQFIXq6iRV3BRLlZY0tRa9Yyy1jgxEC9cgJUeMjWxbykXI+MCcOyk00pZ0to9Sv2CQZ4LRRBgX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SedD39yC; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-57cce3bc8c6so3805975a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jun 2024 06:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718718557; x=1719323357; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BuVWP4GVK7L2zp39JVZyz0tyrIh2tPWyuf/GeYuNsvk=;
        b=SedD39yCp4/30+t68X5wAHZV6a5lI5K6ZYLk39vACUZNuCzRYb2p0E1PGdRO8Aq7XU
         lretK/jF87sR9nHPUF13P9NuHDtgCC3FmngrigZCJLjuxwLWjkGIGQdAB41ow7KyMQ4M
         dzF9kYExv5Upaq3RDJskBSDtq5xvtkrA0/zk6SxQn99jLPthmh1yxas7lRBy59MUEE5f
         xllJe0L81DVARq+v1hYBTXUm66tL0u851ddP2SMRMepoIn6dTmUvhp8BJmXNld11XM2b
         dj7ct2q8jee+tm/VLSoQZOW+7bAiljTnKaap+ZQodiTQRvGtHON9AupXgwosLFk/X3X1
         biSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718718557; x=1719323357;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BuVWP4GVK7L2zp39JVZyz0tyrIh2tPWyuf/GeYuNsvk=;
        b=gygwznFkCd+OeiX6/UJ25MGfvPiCGWZKqYr+aFvh5TDZ01VuF8HthjCPr/56i3sM/v
         M1rqdYyo0Gmcc3TKFA3edsK1pCdEeichJ/rCP1EjoOz5JNj4/OklRsmzHaqaukrXZlPY
         fLURv4mouVfqwDMWTlDVfd2q2l4ibgQvCRVmYf3M6TMa5V04gwMCoBLgXD6pXgM3NFik
         9me/yz9sSTOmAWDIssgra8AZ3xpklLUDT+qqJcXBz5yWdEsG4DoxI9pgNAlJ3XqEow8+
         +N5ANWum4HR8Zv8lXmz0cHc2myzPT1Hci+WUWeqA6bsTWVTCK3754FmBuFo6T6EPDjc8
         3Lpw==
X-Forwarded-Encrypted: i=1; AJvYcCWTXl+J1L+7OiHOP08aGMsO9UXbhobGVwooWdFSnsSsi6kEX5eXRwn0Og4L0TjpzeGD63ZYz1FEpttPelG/qUb9cEtjqmlHoEWJ9GJEPg==
X-Gm-Message-State: AOJu0YzaAeNNFuJT7Qxzu2ftuh+oLo3I95d3UsbVeP4/WRJ04tFNkMho
	bxZddNF2YnFfcUydrVd6ZKk292xivZCAIqIRUjPBMeoCu8Z+JbfFrADCioC5n5E=
X-Google-Smtp-Source: AGHT+IHtLz8KllMMtdCRU487RnyWpaHO2FxTL+sG63GWh7A5oH2EYJFnivoVxsZYulKG+Tu4+suuqA==
X-Received: by 2002:a50:9518:0:b0:57d:32d:cacd with SMTP id 4fb4d7f45d1cf-57d032dcc18mr773381a12.29.1718718557369;
        Tue, 18 Jun 2024 06:49:17 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57cbdfe1428sm6678397a12.27.2024.06.18.06.49.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jun 2024 06:49:16 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 0/2] ASoC: codecs: lpass-wsa: fix vi capture setup
Date: Tue, 18 Jun 2024 14:48:59 +0100
Message-Id: <20240618-lpass-wsa-vi-v1-0-416a6f162c81@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEuQcWYC/x2N0QqDMAwAf0XyvIBtt274K8OHVOMMbFUS0YH47
 6t7PI7jdjBWYYOm2kF5FZMpF3CXCrqR8otR+sLga3+to3vgeyYz3IxwFUwxhPtt8K6PAUqSyBi
 TUu7GM/qQLaynmJUH+f4/z/Y4fr9rHRN3AAAA
To: Banajit Goswami <bgoswami@quicinc.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Manikantan R <quic_manrav@quicinc.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=617;
 i=srinivas.kandagatla@linaro.org; h=from:subject:message-id;
 bh=0rziP/IoVXP3TfzQU7TMnmqKwrX7EBGqSRuKglqc2j8=;
 b=owEBbQGS/pANAwAKAXqh/VnHNFU3AcsmYgBmcZBchruVRYLTqV2qgDLV2m1brX+2D6w8mliGx
 nMEC4qHyT6JATMEAAEKAB0WIQQi509axvzi9vce3Y16of1ZxzRVNwUCZnGQXAAKCRB6of1ZxzRV
 NzZmB/0b1yOCj8uIGXSEGCFq9LTGF1SrtMQlN/XPPJMs3FCcUZsCVEaN73ZWsKI6sfct1WEIoOv
 HUkjDjBNHrYya09svQYDlJb31l6BOeRAvRd8a1sVqljMaULMQqYWvJopLkB9tS+EUbUErQ0ombC
 XjeM7CZoFGWK88W6r0RdK9M0iA5oSe8nhkABDjfsB4TFr+39znDjipnR7D/wJJmGbrGygNXzWgM
 24IoWC83QY3fhTzOaiNWL2wM4/HMQdtSR8EXKTQwqC5CTYNPPD9wjksR5hn9g3bgJI1Xj+mOsQm
 q0i8dbpSEfEdBDjRAgUthelIv93ynf5RvPmOwHuWEk8x3wo3
X-Developer-Key: i=srinivas.kandagatla@linaro.org; a=openpgp;
 fpr=ED6472765AB36EC43B3EF97AD77E3FC0562560D6

This two patches fixes issues with VI capture rate and path setup.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
Srinivas Kandagatla (2):
      ASoC: codecs:lpass-wsa-macro: Fix vi feedback rate
      ASoC: codecs:lpass-wsa-macro: Fix logic of enabling vi channels

 sound/soc/codecs/lpass-wsa-macro.c | 111 +++++++++++++++++++++++++++++--------
 1 file changed, 88 insertions(+), 23 deletions(-)
---
base-commit: 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0
change-id: 20240618-lpass-wsa-vi-b63375f21d63

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


