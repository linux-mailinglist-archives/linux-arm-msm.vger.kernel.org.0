Return-Path: <linux-arm-msm+bounces-21891-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 71FF88FE49C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 12:50:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0043728825D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 10:50:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95E6B19581C;
	Thu,  6 Jun 2024 10:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="J5y9E9Js"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B8719539E
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Jun 2024 10:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717670975; cv=none; b=sNy0YR6rxmgjZbhlWMetMvuZ1gmDdHv3hoteyHpBT28/g996IbcyOkEVCmF1Pl5BORKnYRHlDkIFXQi8r+lJmi0+z617DBJ22EH+QkCwvOzyHuj4Upj63x390+LH40bDq43g0JVNy/lePCwfBTc6XmPI8A6sdIrNPqGyNNP+/7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717670975; c=relaxed/simple;
	bh=I+6UZi7puKUhYGtPeWzvnTaY52v4RHJIizpINfnLSYM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MjrrMI/eu1FIYy36+6gwvATk+8sfNKpbnzKotX1ObWWL0pFUIC/CT8t22IkyERcFEV0Wz/g4cAT2KLgkdK6sW2NFP2nfo/LBqWy4MbowlRKjgDf9RyhDDDA/lnZlR1TklmG8L/ZcwLSgIwNNi72QAO9/OeGXfeKZp/BfDOCg9WM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=J5y9E9Js; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-354b722fe81so800466f8f.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jun 2024 03:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717670972; x=1718275772; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KotxQBLtmDzRH6QGny55WAgb9csIi+0GRil2s7zETak=;
        b=J5y9E9JsW/9b5GZLkXIoSOhH8lfOvA9NOonPKiYEAO9pmhToBVACHaXBv1ZAwbKn7b
         2riQsD96L9gty7tagAqQ1u1zk7iMPASWcIMocBUGGqZUTqWcprWks596VWffBz3mQyTw
         gelrc3W7rKgIjyWbxphu3KkzdCCfM+56DnJpY0gPViKKY6zrVzyRH6zcdB3e9D4Yi2Up
         4rMExAWkWTQax6jOSNPPCW/PDfLaLjPiMIxUFMhdkSz2hYEpO9plc7mZJ+MwV9bFjiCx
         1FwfIsOU5N5ms+wSoZtIy9KsIhZqJ4Z/l4Zwad7EdjvFOmw4o2zW7PtwQ1U6UJpgj4gg
         1KSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717670972; x=1718275772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KotxQBLtmDzRH6QGny55WAgb9csIi+0GRil2s7zETak=;
        b=pv72beMemQwt8cdIJc4xUImdXSle8BlRQA9cctZ08WcKF1ZYKjjxx9z6wX/kQ+eDe9
         ZwRuYbmPyrpzfSJ/RL4e6KtSl+gDOCa93Qri3aSCjx9suAViH3zmSrpa0NercQegXl1x
         lB35rbg7DzDhePkA5lovJTneaz8zYZbxsqwF3m6KOBU9k/tINborpJNXHpedc42HPP0A
         PFYJIGN9fDiq8idCStaqPC567+HH2TpSOF5pkLz3oWeMOyTAiVyr3xMZPrxfvuyzmzBP
         8W5FlhbMtk1eQRZD/pP8PZMXtO/FnCUXcBgvh8mbfPex8OYXT2WJo8NgfAXtmbntLJX9
         Zd4w==
X-Forwarded-Encrypted: i=1; AJvYcCWHMpkeD98LTFY9Pgcp0qhQDP/HbeT6vLB65fmUb3xHdkTDgZ+ix2J43XmiE7GYBs4Uc+gGAR2Bkh4BwEGk9WALQG5sLeP3JBnG7ciR9g==
X-Gm-Message-State: AOJu0YyuKXmoHd7Gk9CMK2Zg0OFdIf/SErhRCW9206iOul9fhJGlG8ZG
	l6lD/4nUpba3azIn15c1xdpeb7wXgUgGi/RV2Looieh6IN/n3MjtvvmxNPen9JQ=
X-Google-Smtp-Source: AGHT+IGSCQvrfLW6lE08ifHKvN4Un/+EhdFM2F5Aprg72ymHaQ2v3OqZe8dulDUIdlz+hHyK3pMwDg==
X-Received: by 2002:a05:6000:2aa:b0:355:161:b7e3 with SMTP id ffacd0b85a97d-35e8ef7ea4dmr4949893f8f.48.1717670972249;
        Thu, 06 Jun 2024 03:49:32 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35ef5e95bcesm1223185f8f.77.2024.06.06.03.49.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 03:49:31 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
To: broonie@kernel.org
Cc: perex@perex.cz,
	lgirdwood@gmail.com,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	krzk+dt@kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v3 3/4] ASoC: qcom: sc8280xp: add Display port Jack
Date: Thu,  6 Jun 2024 11:49:21 +0100
Message-Id: <20240606104922.114229-4-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240606104922.114229-1-srinivas.kandagatla@linaro.org>
References: <20240606104922.114229-1-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1694; i=srinivas.kandagatla@linaro.org; h=from:subject; bh=TUQWW37BE+q1mcU0pxnwMPllf5GS98Hiri3+qX4bwus=; b=owEBbQGS/pANAwAKAXqh/VnHNFU3AcsmYgBmYZQxDaK2PB42LioKGSzptd4+OTAK4jxQS4jwi DlhPDmFu/eJATMEAAEKAB0WIQQi509axvzi9vce3Y16of1ZxzRVNwUCZmGUMQAKCRB6of1ZxzRV NxfBCACAAfrzfsr30IYlz/hLdxCQonofqYtWX6I8ONji38oi22ss31ptXN0pbuEYDSPe2RdSqiC DAlRv6829tTjTaalLZXL7aKaxgFqo1stJ17dLbmJ+Z+m7ZJ4rIN1ZWobe29FG+OcI8T2ibz/DHN of4UIqGvxRS3xZYLu1bPelt/PvKB/x+7j+NB23W4815+wDLqkbOaS475xslL6hbrHSVXnLtI0c2 lRrFAMR5Y4LGVfqjipp8sMtL7yLUZhV2v/n/TATY3GssQ91wgO6UZ4xdERIEPZddcInsNtS72Ag xrXug3OgfXaAwYh+J8kaPIUVct08OZ6SqhacKTVtryk9NwaC
X-Developer-Key: i=srinivas.kandagatla@linaro.org; a=openpgp; fpr=ED6472765AB36EC43B3EF97AD77E3FC0562560D6
Content-Transfer-Encoding: 8bit

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

Add support for Display Port Jack events.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/sc8280xp.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index 06fd47c4178f..922ecada1cd8 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -19,6 +19,7 @@ struct sc8280xp_snd_data {
 	struct snd_soc_card *card;
 	struct sdw_stream_runtime *sruntime[AFE_PORT_MAX];
 	struct snd_soc_jack jack;
+	struct snd_soc_jack dp_jack[8];
 	bool jack_setup;
 };
 
@@ -27,6 +28,8 @@ static int sc8280xp_snd_init(struct snd_soc_pcm_runtime *rtd)
 	struct sc8280xp_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct snd_soc_card *card = rtd->card;
+	struct snd_soc_jack *dp_jack  = NULL;
+	int dp_pcm_id = 0;
 
 	switch (cpu_dai->id) {
 	case WSA_CODEC_DMA_RX_0:
@@ -41,10 +44,22 @@ static int sc8280xp_snd_init(struct snd_soc_pcm_runtime *rtd)
 		snd_soc_limit_volume(card, "SpkrLeft PA Volume", 17);
 		snd_soc_limit_volume(card, "SpkrRight PA Volume", 17);
 		break;
+	case DISPLAY_PORT_RX_0:
+		/* DISPLAY_PORT dai ids are not contiguous */
+		dp_pcm_id = 0;
+		dp_jack = &data->dp_jack[dp_pcm_id];
+		break;
+	case DISPLAY_PORT_RX_1 ... DISPLAY_PORT_RX_7:
+		dp_pcm_id = cpu_dai->id - DISPLAY_PORT_RX_1 + 1;
+		dp_jack = &data->dp_jack[dp_pcm_id];
+		break;
 	default:
 		break;
 	}
 
+	if (dp_jack)
+		return qcom_snd_dp_jack_setup(rtd, dp_jack, dp_pcm_id);
+
 	return qcom_snd_wcd_jack_setup(rtd, &data->jack, &data->jack_setup);
 }
 
-- 
2.43.0


