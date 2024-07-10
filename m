Return-Path: <linux-arm-msm+bounces-25850-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DFFF92D36A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jul 2024 15:53:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D6282B24277
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jul 2024 13:53:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5E81193461;
	Wed, 10 Jul 2024 13:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dDDsyaTF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6760193095
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jul 2024 13:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720619566; cv=none; b=AFJixsuCBdcdyl9ASNGf+pjymVJME4q/0Llmd1b/+2XdbPVQMtdNJXigtJ9gimhEcQMn14NFL2X2QJGSqTxJHKetVtX1DvWJM1EvoERX/KcRU2p/PIqCkhc9bQkXic7ltK80EgCpHTjp5qCYU4inSyEqBqAllQnmywycq5iFmh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720619566; c=relaxed/simple;
	bh=+8JLB/iozDF8e+w8VM/0NLmlF4J+t2rdpXXcSD/AIOA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tYQjSIfiSjeNTK4AzQMv6U8ncvNZvVO3w92na81RKj0JIldc9EALQ9ZAwmunAeGfN2IsOPyCoq9N46XcClwj2ZFcl42XOPlTGycF4B2iZR24jSAMOVP3f8BhxC5+JCrA96gngrV9OyD/2lSoosSPHED5YUouMy2tKBKG9Ixccro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dDDsyaTF; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2eea8ea8bb0so57137921fa.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jul 2024 06:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720619562; x=1721224362; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8uHg8nYQlfxcs66nXgVo70Ul5Ax0CFj0CeSrnoDDNAc=;
        b=dDDsyaTFdctg+TjADLzQwAstTYQrCNOjD1OOpbXwjEV/zMihQei/fOA0rrxhApa9h/
         XatdWNHQKFZkLylnXg8ToSsKiu+tuSvxuumSCWOkxiZaU5XvaRr60tE65E6qy2W0+AfM
         /L+iwYkAHZvevVyRAIS9H/Ri8MnHG+6N7DOZbEszH3LRSw9XqFbZPfTF8+y+GTRslMpa
         7vTukgxDNbnMwdV7SqfL9lDVtXhufRtjuqYsb4+jmg6F/2RVL0gY7FhOzNSB8d2TJ+Vr
         WKF08Q6TtMoQd7lh2dXM5/Za/lgDBNTrR8e1KoTFaJ7pGU8vBOivoriOgjdsIN3GFI8Z
         Pj0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720619562; x=1721224362;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8uHg8nYQlfxcs66nXgVo70Ul5Ax0CFj0CeSrnoDDNAc=;
        b=xFc5s3IDrhJyAhEQWYNe+fFmwMcy7KNgzjmQAGFYlrqqfR7dErrKRCh00POrklqGDu
         UMoeSVEdtCMLo3nIAmjIc/RKwk+KR4Z0TLO7UJb8EAptTT2qdAKN6ieo1ldKx1pGCj2u
         BAOZ391nYIBh9vyfPmatPw/he2j5RZg+8i3OWbADNG96Nh7qrWPzKD2Ay1nY7P0ICCKJ
         02FcpEtvGHxZXUF6SI3ghVwhOnbQL4CNEnu0cxHGnoNVvYP4tK2xGaanMTiLAOFnVMzW
         mNhJkW0F4fvvxcZ3fDb2l1xjaXTF9ocOF3GdPoH8OmPynM8HBob2K2iOqIUbBncJcU87
         nuZg==
X-Forwarded-Encrypted: i=1; AJvYcCW1TsHnuQgBaTRsnlR8nhLxDU3vbB6D3QSnbFLwBEbyvajrv06x6H4OSGpzc8iC3EOPNa2zXPWRmBTEzmPVwlFhUSTjFihX4sTWF8WVWQ==
X-Gm-Message-State: AOJu0Yy09nWAu/In2FNQP/Q5DPFgRpgRanP2UzRa+L9VBA+AiaPh8A9M
	l75y98WcXYs0+Cv4kWZ3EM07c9m4zUlpb1ZzCS3qSiV8OBN69zx3nXgxVTnCrjBtZjpxWckhjB8
	5
X-Google-Smtp-Source: AGHT+IHQ3wTw06WNOicBulp0LREDgkQYwv8xz/Jvw664H5KQ2mPhohhSVRmLd/HfsG+DjZXAvFB4aQ==
X-Received: by 2002:a2e:9852:0:b0:2ec:5843:2fb8 with SMTP id 38308e7fff4ca-2eeb316affamr46824141fa.42.1720619562504;
        Wed, 10 Jul 2024 06:52:42 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a780a8551afsm160440366b.166.2024.07.10.06.52.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 06:52:41 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 10 Jul 2024 15:52:30 +0200
Subject: [PATCH 1/4] ASoC: codecs: wsa881x: Drop unused version readout
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240710-asoc-wsa88xx-version-v1-1-f1c54966ccde@linaro.org>
References: <20240710-asoc-wsa88xx-version-v1-0-f1c54966ccde@linaro.org>
In-Reply-To: <20240710-asoc-wsa88xx-version-v1-0-f1c54966ccde@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1000;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=+8JLB/iozDF8e+w8VM/0NLmlF4J+t2rdpXXcSD/AIOA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmjpIkusTqm9cHV9sziB2w+LwJj8kGVAW/ZbhjT
 NACmdqp9yaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZo6SJAAKCRDBN2bmhouD
 1ymCD/9iwi9TkwR7xPLUX40Mlnv4dq9p3GKVP1NC0C2tDNGbYpr7aM/EGwdodgWD5CWNsZnw9BT
 gxDyZ1xojOFS1zTZGyfCfkPrK1S2rBM1nn+h0oyGVWZ4JUZMAq6TMqVkOSY5ugS/Aq2JIzGc1Lf
 9Oea9NGDKvvVxnY5t85fRmHhiUbSSjpIpdu67FVamw1fO7hzJ8Fz1mqcoyrkuqG5RCqgRCimvC1
 FPbOOSrkL9GElTjBP59MN2rR1W84dg5JtV+LLetvzb3B2mWSvNofgqovM6U6/gov4Zmqz+FbeCb
 cx6T3OOBWFjn3iamR+JzoRtyWNugjagb4+qafu1ANK9p6HI5igQH4Vs+QSgOQFTEWKn39WDUSVO
 Ozj1vUoNPw5IjqScYXaGAVWMUsRis0tMN/jQTdGowWj3HEQSfgRckDQDSoDE0m3G0MqFTEzB3LB
 lEE+GJk/Ud52A6DQ757eWlBPXzWIY/uQVhwx0mgSH9uVBzHp8QTxj1ZqhGQqwiIlJgq+7P2QwAY
 XQ8YMa9kPSDjwrBqiZq4kc652/WHJxEHQ+vPqJF1MTh6QLOnR5Uijo5xmBaJg9iSUwS7CVaoZHP
 hY/d4ilfUNOLFu1LWv6C8NNROB08OLpNYQyQSO2k5FLsRPTPQzNaMseS6U0C7rw5ipF2AwrLYM/
 F6RWcahzYIK+4Fg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Driver does not use the device version after reading it from the
registers, so simplify by dropping unneeded code.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/wsa881x.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/codecs/wsa881x.c b/sound/soc/codecs/wsa881x.c
index 1253695bebd8..22df50041104 100644
--- a/sound/soc/codecs/wsa881x.c
+++ b/sound/soc/codecs/wsa881x.c
@@ -680,7 +680,6 @@ struct wsa881x_priv {
 	 * For backwards compatibility.
 	 */
 	unsigned int sd_n_val;
-	int version;
 	int active_ports;
 	bool port_prepared[WSA881X_MAX_SWR_PORTS];
 	bool port_enable[WSA881X_MAX_SWR_PORTS];
@@ -691,7 +690,6 @@ static void wsa881x_init(struct wsa881x_priv *wsa881x)
 	struct regmap *rm = wsa881x->regmap;
 	unsigned int val = 0;
 
-	regmap_read(rm, WSA881X_CHIP_ID1, &wsa881x->version);
 	regmap_register_patch(wsa881x->regmap, wsa881x_rev_2_0,
 			      ARRAY_SIZE(wsa881x_rev_2_0));
 

-- 
2.43.0


