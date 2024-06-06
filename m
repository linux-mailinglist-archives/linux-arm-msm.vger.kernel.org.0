Return-Path: <linux-arm-msm+bounces-21890-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AEF78FE499
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 12:49:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AB07E288348
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 10:49:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 344CB1957F8;
	Thu,  6 Jun 2024 10:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ioC6nXik"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C541953A8
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Jun 2024 10:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717670974; cv=none; b=W5pjFnrqdeF6WB2WYtqnhYtMjsy4Ssm35WbghBoo2IiBVT+sNFZ4joJ88aiG4egYA8HvkWNjMdL8BmrIWWyRE8BWR4vzeLy4VIJkh8MYVFbjr4yILSZxtLMTI2Cfih9EDD5bBII387FiqisZabH5Xzdr35KlJ+bM18H4a7v98Q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717670974; c=relaxed/simple;
	bh=lI2Wr+WdCGDlmOKaaq/1DavWKIHY7PEWV8jOUjaMVnY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SK9IhctTHzNTOaZMarkwech7To1TtpzvZqNhBY81GHBtyp4acHR9fnIX/xtx2wYEDxDen4r1srbK4oc7rL1aBxOx9S8zlDhFUgaV8DG6C5xWjyk/Ne7/OcwscUA+V26NyqrYNmyhUKef2L5Sh9v4EwLo4qTq8m+q8KbLdfz0Gwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ioC6nXik; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-354be94c874so592844f8f.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jun 2024 03:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717670971; x=1718275771; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PsLfgr3Xi6vscety5X2K0IsqtXVqaphhFy37TP99Jgk=;
        b=ioC6nXikL2EWG/mvScj7D3ZA8PskI58nTszkIurzpiP4rXETB7Q3qa+BItKKDOemna
         iGUbYSY3y1lla1E4zhMs7Z3WY9dsXLYcEPKySHtZe0SWKBqgNNIqhp4th6XHULUWVNod
         MiOmwM89GRJ2UNE/RPQ1jEtdB8wqab+4Norc3rkvv/wmXM8pku1kVJ4nOKvp0Ozxn2P5
         y/6WIkrbpj2DX3nphqx2kvdwUsMQTBDb08CDurI9mn8Nxe7RqLfhbCoz7Gpoyl59uly0
         E8mTVgOCdLMyI2jqnF50Q5F1aEoFjMfbxNrKfKI3BvLslS0GLReN1is5PbdOMLkRm8lJ
         8l1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717670971; x=1718275771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PsLfgr3Xi6vscety5X2K0IsqtXVqaphhFy37TP99Jgk=;
        b=LyjZHancNivgmXmNuV6cYkRuJZR5ve1hi83U/CGKHdW9HMiO3kSihJn2BAnM9n+kjk
         IJXKI69Of/dGGFAS6jQpmwGbdcoFL2qSrmTC6rWlDSOh9JXqTqGnBFLNC8OSa0RS684W
         IjveWIuoPSp18CP+KDcgEJd7SYNmwW1F7/7Z1MQD4yBlWwulU6Ikhd4kpnM6LKP9jObP
         1H7ItaaWc8gW4Q/15WTzP9fWUd6yJief2qkMvl0EoXZHtCMxmDXMkGFaWD3E7GWcc2IL
         ElsXRw0IITK4oimd9FAXPqLRYB3iKu79Bn43byCCeYGXDXcQANgdEumu8VrGGpR9v6LU
         Whlw==
X-Forwarded-Encrypted: i=1; AJvYcCUaQhFAjsjTQkhHjH/Cslkqu7LuDLJiJ/IWqikcBY7oFQqW0+vPMZb0EwXhgGaxZAOfLy1aaFYnRxZNzar4XOzkTcetBnWwO6Oegd+LOQ==
X-Gm-Message-State: AOJu0YzWy8a4vNsDJrcQ3ySHfyKekr4zYRjjGspXTkwaU27WENH6btuv
	pzuJmCRWjq6e/Fe8JyIE/R7BmZ7beAkbJ6xvJDkOrGVCgGkLHqCP/u/GKwn+cLF78kdwAp024+8
	4
X-Google-Smtp-Source: AGHT+IGFWMaUquMnVfZp3UMZFdvZP9pMC5U96cQtmVXdFBaIGSzynEYzdADNTXephojkOl4Dp7zQiA==
X-Received: by 2002:adf:a1d5:0:b0:34c:f507:84b6 with SMTP id ffacd0b85a97d-35e8ef1b8dcmr4182580f8f.41.1717670970844;
        Thu, 06 Jun 2024 03:49:30 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35ef5e95bcesm1223185f8f.77.2024.06.06.03.49.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 03:49:29 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
To: broonie@kernel.org
Cc: perex@perex.cz,
	lgirdwood@gmail.com,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	krzk+dt@kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v3 2/4] ASoC: qcom: common: add Display port Jack function
Date: Thu,  6 Jun 2024 11:49:20 +0100
Message-Id: <20240606104922.114229-3-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240606104922.114229-1-srinivas.kandagatla@linaro.org>
References: <20240606104922.114229-1-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2545; i=srinivas.kandagatla@linaro.org; h=from:subject; bh=0xU05ks6euG6v2ZrWI75v4FiGnhWGBYPQDcPdDGOsmw=; b=owEBbQGS/pANAwAKAXqh/VnHNFU3AcsmYgBmYZQxQDX4PXA+5exUK/ygVrKmwpjaWWHAxm69M qofEzm+QaGJATMEAAEKAB0WIQQi509axvzi9vce3Y16of1ZxzRVNwUCZmGUMQAKCRB6of1ZxzRV N0RUB/0UByxBo38zMz7xEXFAgYCc7m6SkHWnWqEk85cHJRTF4UvdMRTpdmKgawEmhSM3BBqWzZZ LilAuQ4/TlKP/M4j/ahCdkGDUUuUQVMC97IK+6DjhoA3+b8PyZgI1luoQWogoKF/mMNlSHV8DNO Dpl8ZgJicd4yE2jzNFslCg8uoOwIIZ4xsi1EIcNXN56Ep56U+Sk93mDSlHOExGpSm6xzfr/zmJx 7hxjXz+I5bqk0N+WXKLvEZppv5NW29z+6NK5k3ONnR+h3MCx9oDjOv348ckD3kfXx++H0Km5azk QkITat4rhsNn7wpF9GLuuxubkjoNwPVoATee/bOo4f93KpND
X-Developer-Key: i=srinivas.kandagatla@linaro.org; a=openpgp; fpr=ED6472765AB36EC43B3EF97AD77E3FC0562560D6
Content-Transfer-Encoding: 8bit

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

Add a common function to add Display port jack.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/common.c | 35 +++++++++++++++++++++++++++++++++++
 sound/soc/qcom/common.h |  3 +++
 2 files changed, 38 insertions(+)

diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
index 3d02aa3844f2..56b4a3654aec 100644
--- a/sound/soc/qcom/common.c
+++ b/sound/soc/qcom/common.c
@@ -8,9 +8,19 @@
 #include <linux/input-event-codes.h>
 #include "common.h"
 
+#define NAME_SIZE	32
+
 static const struct snd_soc_dapm_widget qcom_jack_snd_widgets[] = {
 	SND_SOC_DAPM_HP("Headphone Jack", NULL),
 	SND_SOC_DAPM_MIC("Mic Jack", NULL),
+	SND_SOC_DAPM_SPK("DP0 Jack", NULL),
+	SND_SOC_DAPM_SPK("DP1 Jack", NULL),
+	SND_SOC_DAPM_SPK("DP2 Jack", NULL),
+	SND_SOC_DAPM_SPK("DP3 Jack", NULL),
+	SND_SOC_DAPM_SPK("DP4 Jack", NULL),
+	SND_SOC_DAPM_SPK("DP5 Jack", NULL),
+	SND_SOC_DAPM_SPK("DP6 Jack", NULL),
+	SND_SOC_DAPM_SPK("DP7 Jack", NULL),
 };
 
 int qcom_snd_parse_of(struct snd_soc_card *card)
@@ -240,5 +250,30 @@ int qcom_snd_wcd_jack_setup(struct snd_soc_pcm_runtime *rtd,
 }
 EXPORT_SYMBOL_GPL(qcom_snd_wcd_jack_setup);
 
+int qcom_snd_dp_jack_setup(struct snd_soc_pcm_runtime *rtd,
+			   struct snd_soc_jack *dp_jack, int dp_pcm_id)
+{
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
+	struct snd_soc_card *card = rtd->card;
+	char jack_name[NAME_SIZE];
+	int rval, i;
+
+	snprintf(jack_name, sizeof(jack_name), "DP%d Jack", dp_pcm_id);
+	rval = snd_soc_card_jack_new(card, jack_name, SND_JACK_AVOUT, dp_jack);
+	if (rval)
+		return rval;
+
+	for_each_rtd_codec_dais(rtd, i, codec_dai) {
+		rval = snd_soc_component_set_jack(codec_dai->component, dp_jack, NULL);
+		if (rval != 0 && rval != -ENOTSUPP) {
+			dev_warn(card->dev, "Failed to set jack: %d\n", rval);
+			return rval;
+		}
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(qcom_snd_dp_jack_setup);
+
 MODULE_DESCRIPTION("ASoC Qualcomm helper functions");
 MODULE_LICENSE("GPL");
diff --git a/sound/soc/qcom/common.h b/sound/soc/qcom/common.h
index d7f80ee5ae26..1b8d3f90bffa 100644
--- a/sound/soc/qcom/common.h
+++ b/sound/soc/qcom/common.h
@@ -9,5 +9,8 @@
 int qcom_snd_parse_of(struct snd_soc_card *card);
 int qcom_snd_wcd_jack_setup(struct snd_soc_pcm_runtime *rtd,
 			    struct snd_soc_jack *jack, bool *jack_setup);
+int qcom_snd_dp_jack_setup(struct snd_soc_pcm_runtime *rtd,
+			   struct snd_soc_jack *dp_jack, int id);
+
 
 #endif
-- 
2.43.0


