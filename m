Return-Path: <linux-arm-msm+bounces-54739-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F3FCA937AF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Apr 2025 15:14:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5D21F462990
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Apr 2025 13:14:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40536278143;
	Fri, 18 Apr 2025 13:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="vXG3U9ER"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36755277029
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Apr 2025 13:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744982044; cv=none; b=MuZRAgmuhworQ0NOtFBYxLtZLF0CP7hn3tXQJKzrc7b4c9ZP6+jivCggoAj/Y6WcEd2ubsP7rckSKRLwDqhyT28xfKXrC48hH4O9WtmNi/01vc/rWLQd1A2iVw0VuY8Tcft/f1oErIwDNwYr8Gz4cUFx3R831OTFsdZI+OJaRw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744982044; c=relaxed/simple;
	bh=YzHH+rPNmlCw7nAjTMSEOMMyWvfPWgugAOZbphqTg0U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gPqyBv8tEWK8NSDjK3mD+RwuQaKbcI2zZNbw3mnONAHnRzapecMh0e5IDcUIttng1wFn0KUortClHC9ILL2Me+SXSS2SxgcKMQaUate1cNEq7h5HIE631JiV4FkXrxJeiTpnntIjkzCyn/hhEFPjLQHbpCLF/IqvpwBp9LLwlg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=vXG3U9ER; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ac2bb7ca40bso342065866b.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Apr 2025 06:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1744982040; x=1745586840; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8+iXn1oW4dzOU1w6dTTVa2iMvBmWei5kk2HA1UjOPDk=;
        b=vXG3U9ERiw+gC5ee8RwFhcBpnEsu9oKkfl9Bjrp/STu1WBM2yM4TNzZhwWvCYBkRgE
         nrAocFoK9oqj1zSglBMf3P9OGIwlb9xVq/yVAcrPmcIuYowihDt0VqwXVo3H+jxF6duY
         BUxP8+4EHZYLVsO8l7ylAJMJ2a+GxRMZcomqkz4mnCFPo9h/OBXm4DBbhUJ+6R60ZhtH
         9s7pb+LKYvLoL3gonwJYKVKaAlJxF8fuDkhny83cFwLBNHQ9pwMM/NO2S8MJhnAMx4YE
         H4Hd2uCCvfhGzrgGljqH7fBMfIAz8JnYTSVllcf6X2ZpqxG/83Qbvuu5+sILdFwMXB0N
         LXZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744982040; x=1745586840;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8+iXn1oW4dzOU1w6dTTVa2iMvBmWei5kk2HA1UjOPDk=;
        b=ReXIjWgUfwcsKXACoozq3DnTatELyeI2t1SUjCrjaDngg1f5Uj7WqkI5q/pfgGfKQJ
         gy/fvJFyzLro5uXH3gegHtoeQeQtM7mV3DIDY2seInlY7qOVe/P3NOQDPjvfuVyY0yOv
         Dvnht7u7BgdvHx2tBHM1Pe/xC+DzYwUjTu4AkYX6G72+H5bZOW+iU3Cqb3Z8pe9whH6f
         S9lg7uQUAniMQuhEwea8NUfl9/7oz6j7ZfOTI69vZk6Tt4lhC7TjlUKpgBVEweYqPl2T
         HJVplMQM8G92DdRv5XV8LnfbWHPeYW5RpJ3d5llMPL9wqzsNlsub/iOErgvAQ8exCO+J
         CClA==
X-Forwarded-Encrypted: i=1; AJvYcCW81USp+mBgJ9jAyQsSGCVdm5hH1q8crrn40uXfgk+kpCfYMaKjZZAoQqnUoxZksxi2jwhboMUCF90qK0rI@vger.kernel.org
X-Gm-Message-State: AOJu0Yzy0rgqXYVkF7GknlOjJy4J5doBszg5zusWG7GSPTg3bNFJnZIr
	NfI8mueIMMDhj3oIiRD62UYdQ/j8eN+E5YQWR3AhbeYT8xJ0j0H+Dy4qG4dQNig=
X-Gm-Gg: ASbGncvy8WMV3KRw3mkajl2M3IMZbJHTn8JIhk96B1mWj256LLzee2PSXOuyXWMknTM
	n+hRWTw9E9Jw+CmUjYxHT8vr2hyBnL7Fr6uYdPgJPKxZHN/mUE2sFXNP3baILru+LCL5Jp36fL1
	6uuA+zOCcaTurv6eWUR7knTtfoMi3vIXhK/hYarqubCcGeUTpQBlaz7JRHeka1J4gt5PtpyqpEs
	UhxBmSy7kHseEp7Yky7iUwLMW9N71cOOV2HPSCHZ4zFV9Du2s6pe3NEJFnktiGNQPPY5WubdZGZ
	h0JpkE4H3oFlsy8PP5mQP4sCAZZVjre/bDmjvTasWXk/X6Y32UfHYYzfSo275XCnXvXaGEnP1dE
	hxs601vJpAlUI6g==
X-Google-Smtp-Source: AGHT+IEvyHMxyvjGL4iGOJh/qfXqtVq90WdGbNIlyJO0slfHahtv2sJybNJICOISqOrAqVq+TJLnEg==
X-Received: by 2002:a17:907:6d19:b0:ac7:33d0:dbe with SMTP id a640c23a62f3a-acb74b8e568mr220791766b.33.1744982040350;
        Fri, 18 Apr 2025 06:14:00 -0700 (PDT)
Received: from [100.64.0.4] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ef41605sm115901966b.124.2025.04.18.06.13.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 06:13:59 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 18 Apr 2025 15:13:43 +0200
Subject: [PATCH v2 2/5] ASoC: qcom: sm8250: set card driver name from match
 data
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250418-fp5-dp-sound-v2-2-05d65f084b05@fairphone.com>
References: <20250418-fp5-dp-sound-v2-0-05d65f084b05@fairphone.com>
In-Reply-To: <20250418-fp5-dp-sound-v2-0-05d65f084b05@fairphone.com>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, 
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2

Sound machine drivers for Qualcomm SoCs can be reused across multiple
SoCs. But user space ALSA UCM files depend on the card driver name which
should be set per board/SoC.

Allow such customization by using driver match data as sound card driver
name.

Also while we're already touching these lines, sort the compatibles
alphabetically.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 sound/soc/qcom/sm8250.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
index b70b2a5031dfbf69024666f8a1049c263efcde0a..e920b413b762c803cfcc4049f35deba828275478 100644
--- a/sound/soc/qcom/sm8250.c
+++ b/sound/soc/qcom/sm8250.c
@@ -16,7 +16,6 @@
 #include "usb_offload_utils.h"
 #include "sdw.h"
 
-#define DRIVER_NAME		"sm8250"
 #define MI2S_BCLK_RATE		1536000
 
 struct sm8250_snd_data {
@@ -200,15 +199,15 @@ static int sm8250_platform_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	card->driver_name = DRIVER_NAME;
+	card->driver_name = of_device_get_match_data(dev);
 	sm8250_add_be_ops(card);
 	return devm_snd_soc_register_card(dev, card);
 }
 
 static const struct of_device_id snd_sm8250_dt_match[] = {
-	{.compatible = "qcom,sm8250-sndcard"},
-	{.compatible = "qcom,qrb4210-rb2-sndcard"},
-	{.compatible = "qcom,qrb5165-rb5-sndcard"},
+	{ .compatible = "qcom,qrb4210-rb2-sndcard", .data = "sm8250" },
+	{ .compatible = "qcom,qrb5165-rb5-sndcard", .data = "sm8250" },
+	{ .compatible = "qcom,sm8250-sndcard", .data = "sm8250" },
 	{}
 };
 

-- 
2.49.0


