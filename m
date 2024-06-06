Return-Path: <linux-arm-msm+bounces-21892-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0E48FE49E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 12:50:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 213C32882C7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 10:50:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01EBD19597C;
	Thu,  6 Jun 2024 10:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TkisQcDZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37958195812
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Jun 2024 10:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717670976; cv=none; b=LwNrxiD8ct1WMa9hhZ86r0+4e7NiDxTgnYOUq1BWXY13eSFHZod2wgqmvgq8XnHQ1xArtGDV464nO1Xb1eN9ma0exC+ol+jmLJS7s66q2U2rTy+T2CTKSmDhCYz+zW8KUf3MEVzeRAC0YMKSf06sdm4wcSlFCIzVmg0kEg2R6GU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717670976; c=relaxed/simple;
	bh=qHWlxpFKIi4ZJRKhFJ6yviYELggHBICqrfli+fF5mFU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Dmlrg9wRJmpJRNdhkMWuAVAiVxLguCgKTk897NfQsBdhO9eyZLGI82lFi4i6W+AJ+xpy6/YZ9+9ow/5ZfaPvqCYJwdSA0nPTxF0YBYfPxYKHbP+ce9PIi03daGg3WaRF66qgSsyt6SAe62TIL01DvQY36RMqaffvVk7nc2asRlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TkisQcDZ; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-35dc984b3d2so565063f8f.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jun 2024 03:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717670973; x=1718275773; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YFjmjZCpuVMeVMSSZ9J5s/fgM9j+bExLlEMG9Wd+tX4=;
        b=TkisQcDZsl7zltFJQcgC4sKszUKGADkrskwPJXcfUq1vHaxKgYaK/G1F5TawdEJz83
         FDydauRoRgeImMdMrTPfE147oC4VTs5C1EvVXhUC38VdvD8yhdhlUJtwRHDz4NKEMqNf
         kz/3AMS07RguBP4q5nBVLHxaB+EAPh1V2HHce6hUSCeGxAA7qYU/VWubBVjhiPXo6zBj
         wOKo45IU9JDvEp1jixME3GV8VE8fo/fjTY0KA90AiL1Qz0q9lmAQquiq5lTxqkqERI7m
         2pMf/rTNzyyix4Oht8kdfrniX0qWsphUQKZe3emAOcny++stEsUBxQlX8gN7+e4PmnBK
         dG/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717670973; x=1718275773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YFjmjZCpuVMeVMSSZ9J5s/fgM9j+bExLlEMG9Wd+tX4=;
        b=H7vjikwuKM68KDWxzQ4qtB4BUJN9aNPog1pMp8t9JuFpXNhMc6zdo/u6Q3PDzADECA
         tRUv4f98F4cFL178E372Mr8P0yHJ9ty/ylj6S6as2vFnriXAiHke6/tj0itQgXTuZKDK
         PZxa6EGibZcnGQyT0HmBPblvn6/EW9DVpBh/hWwQq8b9r1R9wblpOksDtfb+OVhy+Q8D
         R/KhjhX/klf7JQXgGgd3q+t+HDm9MfqbZu3t/rSQPV1hR5vM9GPgTAIjcikxM7Lj/7lc
         LKObqPh3B93blyNQX49CwZdCS3fPwl2gyh2edT0v92WR8/nbmptXuwsgdChKPXNQeM5E
         ILLg==
X-Forwarded-Encrypted: i=1; AJvYcCUnKVOlB3KGE8XtpCYaABr8WDpgk2cRZ4dEdTR/3qCR+kbN4qX2LBulKymqSm75DCzSHkB2TR6OLN/SZG+ilwcm8sSX3OnUF2T57/FBng==
X-Gm-Message-State: AOJu0YzoqTGE7sB+uR/NMagflD1UCRXG5Ks9XxhSTXITQZAajn6IYCpj
	Y2/gcHQ7CHiqTjMz8pSQGvbb7rHB/jVGtJywDfQTt88lgo8Inn5qAGk+LlFYVgymvAwwcoOpj7P
	0
X-Google-Smtp-Source: AGHT+IFrJTWqZqxqkmRXJjiBbTJRhM5hctfxjX7aPSnP6H7xrVvbFZndee+upzSGoOZpViZqPllHig==
X-Received: by 2002:adf:f1cb:0:b0:35e:83f4:3e6c with SMTP id ffacd0b85a97d-35e84068663mr4179223f8f.1.1717670973671;
        Thu, 06 Jun 2024 03:49:33 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35ef5e95bcesm1223185f8f.77.2024.06.06.03.49.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 03:49:32 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
To: broonie@kernel.org
Cc: perex@perex.cz,
	lgirdwood@gmail.com,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	krzk+dt@kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v3 4/4] ASoC: qcom: x1e80100: Add USB DisplayPort plug support
Date: Thu,  6 Jun 2024 11:49:22 +0100
Message-Id: <20240606104922.114229-5-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240606104922.114229-1-srinivas.kandagatla@linaro.org>
References: <20240606104922.114229-1-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1439; i=srinivas.kandagatla@linaro.org; h=from:subject; bh=aELUqEAbcStwE5eRIXyqcVJh7MVh9ydfsnLQA9m5aQM=; b=owEBbQGS/pANAwAKAXqh/VnHNFU3AcsmYgBmYZQyleYwhYg7GUGgaJK8aE6/zw2kc1Ju8QTt5 ZQIM5rziDSJATMEAAEKAB0WIQQi509axvzi9vce3Y16of1ZxzRVNwUCZmGUMgAKCRB6of1ZxzRV NwZwCACWECAUPnMVqnsYVA8kkFJLMatOnY4Uo6a5LdtFl6yj+PfWPe/zTI3ZM2H26/l2nlZ3x48 SvMA3uJZRqUeh+VXApLea7IdpznQDLzMWq3nWXSHZMoOe/xrXPAcFIm26hndm/G9h8oeqKeQ0HD AR2+GI5TWtZn9nWvTYlSi3P5BMwxMFvVsOtAu57x48GVJP+OgG1pW0nNPYPuMl0nYk2jEyN+8x6 iFRGevvk5HZF8nXiREKEtLoIG/Xz+uoKDidFhrgajnFYmVcA7/2ZqmFwEYPz7pVg6R4lfAVmkeT qhN6Pmso/nRR3bl589QsGTVrxCcu7rawXUj4j9SYCQ4YSOl7
X-Developer-Key: i=srinivas.kandagatla@linaro.org; a=openpgp; fpr=ED6472765AB36EC43B3EF97AD77E3FC0562560D6
Content-Transfer-Encoding: 8bit

From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Add support for handling jack events of USB (DisplayPort).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/x1e80100.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/sound/soc/qcom/x1e80100.c b/sound/soc/qcom/x1e80100.c
index 0e0773a85809..789d833bcd2f 100644
--- a/sound/soc/qcom/x1e80100.c
+++ b/sound/soc/qcom/x1e80100.c
@@ -19,12 +19,32 @@ struct x1e80100_snd_data {
 	struct snd_soc_card *card;
 	struct sdw_stream_runtime *sruntime[AFE_PORT_MAX];
 	struct snd_soc_jack jack;
+	struct snd_soc_jack dp_jack[8];
 	bool jack_setup;
 };
 
 static int x1e80100_snd_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct x1e80100_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_jack *dp_jack = NULL;
+	int dp_pcm_id = 0;
+
+	switch (cpu_dai->id) {
+	case DISPLAY_PORT_RX_0:
+		dp_pcm_id = 0;
+		dp_jack = &data->dp_jack[dp_pcm_id];
+		break;
+	case DISPLAY_PORT_RX_1 ... DISPLAY_PORT_RX_7:
+		dp_pcm_id = cpu_dai->id - DISPLAY_PORT_RX_1 + 1;
+		dp_jack = &data->dp_jack[dp_pcm_id];
+		break;
+	default:
+		break;
+	}
+
+	if (dp_jack)
+		return qcom_snd_dp_jack_setup(rtd, dp_jack, dp_pcm_id);
 
 	return qcom_snd_wcd_jack_setup(rtd, &data->jack, &data->jack_setup);
 }
-- 
2.43.0


