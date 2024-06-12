Return-Path: <linux-arm-msm+bounces-22463-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C335890585C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 18:18:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3AA3EB2B1CC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 16:17:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB2F31822E7;
	Wed, 12 Jun 2024 16:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Gw+XV7AV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDAEE181D1A
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jun 2024 16:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718208953; cv=none; b=FV1IWJCtV/HRxiWv4Gf3GciJQ2IPJjdIqSDcoVO8yIlr62FOhWZiESikpO0Pz4dkk73k6MBYdfAfcGX97uHEuKQ7blvZthlq9egc0CjdLfWKxNP+6YXB084Zq+i+LWMsxabt0kHLHQZG5MO/eke3iTC/Ojgxj+FNAgkZC4eXmRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718208953; c=relaxed/simple;
	bh=u2prIGwh5jqmNbs4Jyq4LFMn7uSJkWnvV3kkEVVaI+M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Hsxqi+QX3mrvm7Zj8mEHpvI+7Q9SmpX9hpazuSfFfIc3COPTuOZ/CfnOkEdyVyee2rBPxgw78URN+zeg/RWM2n4uv8HRTHwi/lTwz5QPNEhZZlJGFriZVf7XeMIRwR5eXavQuzZz+sk5N5BvXybb2kcgr7xnz10s9xudUhPU4uU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Gw+XV7AV; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a6269885572so196025466b.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jun 2024 09:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718208950; x=1718813750; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eOJFJF+t6lUE1cjVVqmcWFg9bqxOoxHwGyxHu2Jt5/4=;
        b=Gw+XV7AVPWFzxFm1486YmTksv81z9ZG6wIwOoK/4GOC4vdXZGG5J4ncgDQf1mSSqKw
         /oN3wetbzM0MpHLxc9eogn8GKUDivBCMUlyS2A065nMn3+IuPoLhipW9nZSPXw6HkCJt
         VJibjNfkyTXYNApVhqevBPrNW6CNBufGOJ7aitrMj6lAGW65LA/6veKaO4FpSYkJDXIF
         Ri8m5I2qsy8C1C5gPbCXg8u0U1bAfLbexUal2xNG6Poa0/kxheRMF9d6gzUbPMmbSuvw
         frISyyRvcTYqysKIKehg5YlT6YfvuFxKR4KTxqBhfM2tpKrseyeNGduqDHJTVq7TN/wa
         OwMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718208950; x=1718813750;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eOJFJF+t6lUE1cjVVqmcWFg9bqxOoxHwGyxHu2Jt5/4=;
        b=GJdr4gQERi2T+QN46nTVUv9aGhqwjlgkjey+3SWZ8A4Iw4gZFYG+xT/3fEr9guPNoO
         JmubnVUtTGNfft86QWgH8whP0/4ps9E1rvpHoxs0soxQWMyjyZs39Lo1gda0louaEuNH
         qh8dOrfdrM5PbqkeYMT0alEU9VxmqSTkQrtXih8tlp2oYUDu2xoelXwCp2yG2EyH0z4U
         +aTEZJYde8A0bwx1A0QRlhCdZBbeo3HNJH+kmtZhFE+KhdZiCfhMfTv+46h4VnmYUsFL
         7UX0legfAi2eVOxZuTQcBcFIE1Wt5SgG46k5wzs8DBP/NdNOwUj1CGhcfw6WzEeN6aqM
         /Dzw==
X-Forwarded-Encrypted: i=1; AJvYcCUAklr4336P5kvDaASOxwESxWS0EF0HP+VzSC0ppbDsLsdlBAwYlGa/+ZltBVM/AqmdbVW/QnokwGzj8hWEBSD/n+AujWADSQlHRgApqw==
X-Gm-Message-State: AOJu0Yy/DW3WGY2n/QP0CW+W/KO8cm4PG3JiZPx+VOh+p+1fFWj87UAi
	94TRkXR3gz7TZFiFSFtCdeugN13Hl4sCu4ShfagIS/jsmV5QuMcqBLLWlEJZhrU=
X-Google-Smtp-Source: AGHT+IHUF0KmidhvpAnMl83vBdXTEssqSGLDlaWZMxVn1Dusd8E2ucNDNmW4b7weNZmhLGChKPIjNg==
X-Received: by 2002:a17:907:390:b0:a6e:f655:ef29 with SMTP id a640c23a62f3a-a6f52414220mr7988766b.17.1718208950323;
        Wed, 12 Jun 2024 09:15:50 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6efd6cfb74sm624815866b.20.2024.06.12.09.15.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 09:15:49 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 12 Jun 2024 18:15:19 +0200
Subject: [PATCH 06/23] ASoC: codecs: wcd9335: Drop unused dmic rate
 handling
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240612-asoc-wcd9xxx-wide-cleanups-v1-6-0d15885b2a06@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3095;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=u2prIGwh5jqmNbs4Jyq4LFMn7uSJkWnvV3kkEVVaI+M=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmacmcYazksfFeAD183iY592oj5Ey1hnxf+2W8n
 pqiTV4pmYiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZmnJnAAKCRDBN2bmhouD
 1yYVD/9xhjb8/1RHvXSBot2oW4imUHAfeV8TcbJ9t+iXnPPX9FAMldbq/LyJUFk2DfhjKJGMNFt
 SaWwA0cCxCSEAiHOfwP3I9obF3YXgm2XZKBRE+yYkdiuoEzZF66gXXHKwKTuuamcu/PPWERpGhw
 vpdXRPsyEu362gwv59jzNP38uQPZeuN3iipR8jomWaBwKH41B8muTgbo7H4FVF859fDgDPIa5fd
 ZLrvkYfXW6Nigr53w4oqLDO1iCu1KWDZZUZL+amAEI3rmr9RwD//+1eTdO2W4RPqtoGXW8VHoUw
 J9ROx43g3R3uEIsPj8A/5mWYtnU4gZaWpfWw9388o13h31KefPFFrwCT/ld9mCjRpshtOZ5yMuO
 lZB5gdQcxd2Bmz7bNujs4rVS/jl0wZNDroZnpF1oBftoFPj4VH4ocBB7zOr4FNFv0GsFb+JD7Hf
 TNB0Aef0wgTGOTOHuQloQ48Nb12NfRKR1xggnBLmHPCjwABUhfZWQtnWLHYq9kE0lobug3buf1R
 w+p5zF3v3PT99QqgQFsgYeeHFi8KVgztWZVDciFPHhXsb2v9dGR9ZT6QevnYrApTQTDYE0TC9wO
 ReXnwlyDpWIP0doK+LHywWZNaogywVzQclTIG2RjRK9lBJpLKATJwgmTD4lMET86Tco8Nbi6nzf
 6btju6azCzJ9Sfg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Driver was prepared to adjust DMIC microphone parameters according to
DMIC clock rate which is read from platform data or Devicetree.  The
latter part never happened, so the code is always called with
dmic_clk_rate=0, prints error and uses default/fallback values.  All
this part can be simplified by dropping dead parts of code.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/wcd9335.c | 52 +++-------------------------------------------
 1 file changed, 3 insertions(+), 49 deletions(-)

diff --git a/sound/soc/codecs/wcd9335.c b/sound/soc/codecs/wcd9335.c
index 6a1376b3b98c..f5fe2583b807 100644
--- a/sound/soc/codecs/wcd9335.c
+++ b/sound/soc/codecs/wcd9335.c
@@ -344,8 +344,6 @@ struct wcd9335_codec {
 	int dmic_0_1_clk_cnt;
 	int dmic_2_3_clk_cnt;
 	int dmic_4_5_clk_cnt;
-	int dmic_sample_rate;
-	int mad_dmic_sample_rate;
 };
 
 struct wcd9335_irq {
@@ -2844,52 +2842,15 @@ static int wcd9335_codec_enable_dec(struct snd_soc_dapm_widget *w,
 }
 
 static u8 wcd9335_get_dmic_clk_val(struct snd_soc_component *component,
-				 u32 mclk_rate, u32 dmic_clk_rate)
+				 u32 mclk_rate)
 {
-	u32 div_factor;
 	u8 dmic_ctl_val;
 
-	/* Default value to return in case of error */
 	if (mclk_rate == WCD9335_MCLK_CLK_9P6MHZ)
 		dmic_ctl_val = WCD9335_DMIC_CLK_DIV_2;
 	else
 		dmic_ctl_val = WCD9335_DMIC_CLK_DIV_3;
 
-	if (dmic_clk_rate == 0) {
-		dev_err(component->dev,
-			"%s: dmic_sample_rate cannot be 0\n",
-			__func__);
-		goto done;
-	}
-
-	div_factor = mclk_rate / dmic_clk_rate;
-	switch (div_factor) {
-	case 2:
-		dmic_ctl_val = WCD9335_DMIC_CLK_DIV_2;
-		break;
-	case 3:
-		dmic_ctl_val = WCD9335_DMIC_CLK_DIV_3;
-		break;
-	case 4:
-		dmic_ctl_val = WCD9335_DMIC_CLK_DIV_4;
-		break;
-	case 6:
-		dmic_ctl_val = WCD9335_DMIC_CLK_DIV_6;
-		break;
-	case 8:
-		dmic_ctl_val = WCD9335_DMIC_CLK_DIV_8;
-		break;
-	case 16:
-		dmic_ctl_val = WCD9335_DMIC_CLK_DIV_16;
-		break;
-	default:
-		dev_err(component->dev,
-			"%s: Invalid div_factor %u, clk_rate(%u), dmic_rate(%u)\n",
-			__func__, div_factor, mclk_rate, dmic_clk_rate);
-		break;
-	}
-
-done:
 	return dmic_ctl_val;
 }
 
@@ -2943,11 +2904,7 @@ static int wcd9335_codec_enable_dmic(struct snd_soc_dapm_widget *w,
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
-		dmic_rate_val =
-			wcd9335_get_dmic_clk_val(comp,
-					wcd->mclk_rate,
-					wcd->dmic_sample_rate);
-
+		dmic_rate_val = wcd9335_get_dmic_clk_val(comp, wcd->mclk_rate);
 		(*dmic_clk_cnt)++;
 		if (*dmic_clk_cnt == 1) {
 			snd_soc_component_update_bits(comp, dmic_clk_reg,
@@ -2959,10 +2916,7 @@ static int wcd9335_codec_enable_dmic(struct snd_soc_dapm_widget *w,
 
 		break;
 	case SND_SOC_DAPM_POST_PMD:
-		dmic_rate_val =
-			wcd9335_get_dmic_clk_val(comp,
-					wcd->mclk_rate,
-					wcd->mad_dmic_sample_rate);
+		dmic_rate_val = wcd9335_get_dmic_clk_val(comp, wcd->mclk_rate);
 		(*dmic_clk_cnt)--;
 		if (*dmic_clk_cnt  == 0) {
 			snd_soc_component_update_bits(comp, dmic_clk_reg,

-- 
2.43.0


