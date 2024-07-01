Return-Path: <linux-arm-msm+bounces-24778-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C25A91D92F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jul 2024 09:41:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CBCCE285B8D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jul 2024 07:41:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 173D483CDE;
	Mon,  1 Jul 2024 07:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wNj5/uXr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D710839F4
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Jul 2024 07:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719819597; cv=none; b=tL/6OKioqwv/LwscVDlnr185fD0WMJpseboex87OC+evqcnUQn/N9kSy1vTh/BDsRyZl3AVwGmhp6sAel3my03zL1rTPYhOvV6qOdZoljoc/7Iv8uM79ncm+1S2PDsB+Irh4LWlyxR053NNi0nS4c7Rir4STT/XWGsAGfhHhLMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719819597; c=relaxed/simple;
	bh=x29wiXWpg6jxb2D1xLhsOVHl1vLxmaL7w/bv/sExbXA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gVLGrLJ1mtQB/KwSleq1MiJ4CmZBkY0E+JFxhaNm3fDIzRQGZb8OHm/TUJBuB91jfCmyBeuSTKGQatUKo7IwgCw3GSeqgc3/MGX/FldTkFv0+bc07fhSbRwrLbpvUkMSNKV5/D/nAg/rjLJgBUxsyVmOjo8rYjpuNQfH7buFJHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wNj5/uXr; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-424acfff613so24149045e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jul 2024 00:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719819592; x=1720424392; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JlFPWXG6JCmSDQcnpPbHIJV1hXvd50IYEdMdlRm8NpE=;
        b=wNj5/uXr4Symqe79zf+Tw1xUY5rayAtkc1NCLs6OiYE/y3nmiNOFZ79Q040cozoRz0
         x9utJdKhDfuPuWV8KToHh+CE2K5TtkDUtgOIcnLK0y0EKwpxqP2umiZASdTGS8dw7mjO
         syiiDfLjd3DNusumHesQnqM4lZeW4uEVcSQsJSw/PxPZp2PKlQA0l7vFu2+X6GgQHvyN
         OXZM1HiD9o+JnkfWp2UCmiI87nQBvvgf0I3d4/2856s1JaGmxW4KkLkDnBPXNoJVzCYD
         HnYF2JJSRWJ5W0zl/JEEc/XEHzJY/TkiLkkDwn/42+/4ZfhHIMlMNWO8BDacEK6taJQ4
         j8OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719819592; x=1720424392;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JlFPWXG6JCmSDQcnpPbHIJV1hXvd50IYEdMdlRm8NpE=;
        b=o+E1AqnqI7iSNchOjcszWE8n5SfamAyKdTiQl/QSesKgAuMpULw34Q+FW96vRQ7AfL
         Lsco+SrfB8bdILyVWeUtb90jfnL6TMCfSF4TMc0D16qxBXi8lMQHBZFTUQJ0Nr6K+uMF
         ylU5jBxXhULmngQC+4iibIyAqKg5sbxnCDYFfyw2CcXwbjkJgoJbNVxluepTYHBbi27Y
         Rx91oSJXX0fXVHx0FGG4lkHZYhTiKCFuqeGFImYNAm2mx4KIi0OA8CRRwbS4yxV7OkmW
         jf82qLTxU7f2wlpaeY/Vbuf+LfqTrYJQbE0m+W1kauTKMWmOCV7g4IBqfLT2bMEKo6Uz
         NHjw==
X-Forwarded-Encrypted: i=1; AJvYcCXybsR1rtzYy9t+PTtcr30uBwkF4Nx87G3f8WhXuNemdFU9URfMGa85uJns6NgPsjECyKoWBqndg4k5u9DbI1g0JmFoSIqpPrN/SVbsZw==
X-Gm-Message-State: AOJu0YycIU/VD1vD/apOpek3wR0OpFG0r+A2Qh6Spr2TRHCZydHdO4RI
	zUKRN4eJ242ErC6UxdqfR+QJjz42rmEzPhvUx++K9Gt1cAvKyHTatWZPBzQ4djE=
X-Google-Smtp-Source: AGHT+IHHtHxDqWdH128hQmSA0cf68mmpNc9DRTecEH9In5YhAxmj+nZy5eqG4zRev1smLhlwMVcEcg==
X-Received: by 2002:adf:ce0a:0:b0:364:29ce:b14e with SMTP id ffacd0b85a97d-367757307aemr4223694f8f.69.1719819592610;
        Mon, 01 Jul 2024 00:39:52 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a0fb9absm9279936f8f.80.2024.07.01.00.39.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 00:39:52 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 01 Jul 2024 09:39:37 +0200
Subject: [PATCH v3 5/6] ASoC: codecs: lpass-rx-macro: Use unsigned for
 number of widgets
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240701-b4-qcom-audio-lpass-codec-cleanups-v3-5-6d98d4dd1ef5@linaro.org>
References: <20240701-b4-qcom-audio-lpass-codec-cleanups-v3-0-6d98d4dd1ef5@linaro.org>
In-Reply-To: <20240701-b4-qcom-audio-lpass-codec-cleanups-v3-0-6d98d4dd1ef5@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1007;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=x29wiXWpg6jxb2D1xLhsOVHl1vLxmaL7w/bv/sExbXA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmgl0/b6W/jgS8oAl3i/WUq1uwI+lyOS8exPUTa
 7WelHm2nIOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZoJdPwAKCRDBN2bmhouD
 17wJD/4nCEib+5DqPEHKrWFzzhh4Pm8WGZESnEx+zYlUmkRVYwHgyrsI4Mx532DRm3x1JpagKWI
 NNv5xvIOQARUI82dK92tuAaNW1qkThmKV6PIVa+Du38dXD0izYl7MYjaX+uJhODQwLiHXDioanX
 KpTfALvKiVIxq0CV19/BTcBNozPiWxCsCDd2TpnhKcCxes6uHEuU+5+5duoAh9YSqvOc+aOvl2J
 k+JTKgo7R4nN21KhbN+1I9KcV4CsLI/ctn5ck0fMzA0u8qs3dvDI2WbunOPZ5HDm8mPEO6K4Pyt
 CHe+AMqDcnb7v2LAwoD1HcXcGkKPFkBkKQ3JNZtBUB1Eqgrs889RAjPURnmPg56a0Frp261pnKb
 lx05CvmKdZ/BlXGt5Uig+hIaIB7HR45/DLoweL8UVXsZlUlDwhTneAwC9T34dCksGINAGffk3OP
 Q40wmTWZ4CS5nMZQoogd9DKazRdeQ165EUe4eBh+FUJOpJ1NQLPoJE5fkxvCYxrehrZCuAwB0ny
 0GBdeBEWnA9t76TFcHt1c9HajeZ/57VAj6tprxMXq+It1J5C4UPp1zLaqss1o6ifvwVn1JELSJy
 fu38XyflpmvvHQra2o8VTeRd3BIHJ1bWKIQJXt4Em0MHDhTlXrnKEIasb5IYpDW7pwRQ0Xs9j9U
 CnbTb6iGmhl1w4g==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Driver uses ARRAY_SIZE() to get number of widgets later passed to
snd_soc_dapm_new_controls(), which is an 'unsigned int'.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/lpass-rx-macro.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index d4d7e02db83f..ce42749660c8 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -3612,8 +3612,8 @@ static int rx_macro_component_probe(struct snd_soc_component *component)
 	struct rx_macro *rx = snd_soc_component_get_drvdata(component);
 	const struct snd_soc_dapm_widget *widgets;
 	const struct snd_kcontrol_new *controls;
-	unsigned int num_controls;
-	int ret, num_widgets;
+	unsigned int num_controls, num_widgets;
+	int ret;
 
 	snd_soc_component_init_regmap(component, rx->regmap);
 

-- 
2.43.0


