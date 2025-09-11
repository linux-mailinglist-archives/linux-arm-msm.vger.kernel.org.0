Return-Path: <linux-arm-msm+bounces-73165-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 40639B53814
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 17:43:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F38BE16C94E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 15:43:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36F41352072;
	Thu, 11 Sep 2025 15:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="meVHTyeE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 598FA2D97A8
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 15:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757605426; cv=none; b=aK82z/E0DAwLUpSHTH45NwqPsI9gXRRQYzXXrjz3eY+ZuKmCt58H2q5G7h54wheuj0ghv+4h0YK9nldDu+7yyEDtyeKaLE3jtF/cqgdbRdvUlJOIgdm0odv3HnpJg1qQy1GxKqWW204mGsxOVZmczTYaf6svSljf+EIpvcvMt18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757605426; c=relaxed/simple;
	bh=mtYEVqFfYfhoSwbzEKp/cEepkdVMf6SyvuyKmyLLU8Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eiPXF8aS2QNGn3eaqt830U/ZhAHP+nKLOWDw5+fxDxvOtthLnfAaNLJFVB0TYTsE+U0WF0FM5fgiHDUSrC0hYfC2ykL9rcym2a5r6PX7UxF+UrR804/FcPtxSe9bq+w2TSNUyhaOz+MCxEv1YcgR698+CA8Q56XPktwgn+IPw0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=meVHTyeE; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3da4c14a5f9so1216156f8f.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 08:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757605422; x=1758210222; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=z0oQTNxrqqvW11nhsresLiX6PlYtqN+ZQ8oB9MyzMxA=;
        b=meVHTyeEELUoRUkVauw8teFM+wZQpnAa3NNlzlLfsB18EAfiNVETE7IepV7imAoV+0
         ujNYdcrqwXLOGiC2zgpCoHB1f9Q/Oeu/+QRCdosJ7B4/CoICarCezHgzW7wR3PnYXKzQ
         IzprcfLw9q39xGfkgKbHsRU9wQGcn2OV9qshdCUWsVKiMbTrRb15bSnU2fAf47HjyUYY
         FDMJz2Bv17XTkmyf7EIkAQ5QXFcBbhEvEaj3yci9GBoSrNArfjvBOHNRWUUrdjIhCDNm
         D2AmtoGy/xIcY4jK8MBURSQgpujsTJJwqHjt3/rQ7O8e+lPj6IJ85uneUL4jL2fBOS+G
         Gfvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757605422; x=1758210222;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z0oQTNxrqqvW11nhsresLiX6PlYtqN+ZQ8oB9MyzMxA=;
        b=GAO+gsRJkLoI3p6iTC4gohRvXyx01GVPnivdiUtlHUtG4v2wxrIFZgemHsTj17HI2Y
         v/wNTuS/pnEaSQVqPeHJXm0Xx6bsaMui4lVCKRt2/3lN/sNkdd4TCXcIrdMob7D4Id9Y
         qzEU2D7P4HGLF+CXhjqZK8HEQcAShZBeZxyQK+TvaHteNJAJabG1wNXAzKhJluwVc/mb
         CT241BGgkN4PY+eMGDzaTI6Z0ER4rUbxIhRDeQd5rXsZ5JirgwHqgG2H5wq1XXW07XT4
         1hSLdImf8ZoaXG59TdbSdCripwkj6g9UBP4JJua6GEqgoTULqMLff2u1URr9w43IUqth
         tFHQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+Ov8axAZbONzjF/4Am7PeULU02V12bhHCliSKkZYg22vk3CUR3DpgOzRMg65UWNQDmzHevlNsCSPGUBMd@vger.kernel.org
X-Gm-Message-State: AOJu0Yzqj1MZjkJnBcWmfcgyjZS8FPyt1C2926PXb86pnpo4EDnWghkW
	oxAeXJ2TtJePPMzsy+Skouh5/DzbwHdRLdwyzwr8dT+r4mKUzT3rF0if14geTIFzons=
X-Gm-Gg: ASbGncv67X+70kku+8y2DZrNf/eYpwlIT9Ui4NOMftdk/KSpOQABW99rKwHAuEV5AqP
	lsnfc6jbnshGMwj4lCWbr0pEfBghUpoPJnbLNUNVzoAT85BQdzlxOpR59H5Jx/YfNwtIwr92oub
	tMVgic11hdgf8kL0KyVDAKVagHQVSrluDjz+TOIsy8NGw1dk5CnHxCxHTioO7m2g4/BTRSA1H60
	fbdhn/Mb6v463ecFz7V/oJAncg/OToPsqPjDyizqW+SWMep3qmlAwDLcwALo+VsrUiuymz92QK0
	eo+iERdnD3xpZPC21vO9m4D2313RvDtlLLQn+2T56cb3aqUrKmjN04CkNHvKyta3SbG8G/eRJqK
	7yqYhciQY0Fd7qkh1MIoR6yl+QXVt5fBlDKvW1pE=
X-Google-Smtp-Source: AGHT+IFh15zztkJ1zOO4/RN3ASTtgLJC2rMLFG5k5RSkaslNY3P4anVKOXAQFo82PonNF26Qn1N8Xw==
X-Received: by 2002:a5d:5d06:0:b0:3bd:13d6:6c21 with SMTP id ffacd0b85a97d-3e75de70d33mr4111569f8f.0.1757605421647;
        Thu, 11 Sep 2025 08:43:41 -0700 (PDT)
Received: from orion.home ([2a02:c7c:7259:a00:8a3c:25ae:f06c:6781])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e0185be34sm16847985e9.4.2025.09.11.08.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 08:43:41 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
To: srini@kernel.org,
	broonie@kernel.org,
	lgirdwood@gmail.com
Cc: perex@perex.cz,
	tiwai@suse.com,
	srinivas.kandagatla@oss.qualcomm.com,
	neil.armstrong@linaro.org,
	krzysztof.kozlowski@linaro.org,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: qcom: sc8280xp: explicitly set S16LE format in sc8280xp_be_hw_params_fixup()
Date: Thu, 11 Sep 2025 16:43:40 +0100
Message-ID: <20250911154340.2798304-1-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Setting format to s16le is required for compressed playback on compatible
soundcards.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 sound/soc/qcom/sc8280xp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index 73f9f82c4e25..5d10b1c5909e 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -7,6 +7,7 @@
 #include <sound/soc.h>
 #include <sound/soc-dapm.h>
 #include <sound/pcm.h>
+#include <sound/pcm_params.h>
 #include <linux/soundwire/sdw.h>
 #include <sound/jack.h>
 #include <linux/input-event-codes.h>
@@ -82,8 +83,10 @@ static int sc8280xp_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 					SNDRV_PCM_HW_PARAM_RATE);
 	struct snd_interval *channels = hw_param_interval(params,
 					SNDRV_PCM_HW_PARAM_CHANNELS);
+	struct snd_mask *fmt = hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT);
 
 	rate->min = rate->max = 48000;
+	snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S16_LE);
 	channels->min = 2;
 	channels->max = 2;
 	switch (cpu_dai->id) {
-- 
2.47.2


