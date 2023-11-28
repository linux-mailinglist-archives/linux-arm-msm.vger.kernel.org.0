Return-Path: <linux-arm-msm+bounces-2291-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 99DF57FBFCB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Nov 2023 17:56:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 39828B21545
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Nov 2023 16:56:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E92C46BD;
	Tue, 28 Nov 2023 16:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k1/7oWDO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BE00D51
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Nov 2023 08:56:48 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-50bbb78efb5so1187174e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Nov 2023 08:56:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701190606; x=1701795406; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KlvtVgcoH+Cr5quxDgXdgueDoRBrewPBnFO4wuUANns=;
        b=k1/7oWDO8Upg20YhSnrFid6v51+cWhjhqEWchgKnlaAZMZZwiBjGPsIiyh87yseYB8
         7aBkj8UwvhoxixH4lCmZbCpD670cakYgtM0zqYzmg7oDPadfojbCyt863PHGizN33nQ6
         JP9Of5rOgZjAQ1MYnIPaSP1jcnF6ArfKRu8XGDSDy0uxAaOlj8GOcSOMlkFZlDtraC5Q
         8syP7pL+2JMZawfz4aAhLLvJelgDqoIyEKSlQXwEuAmjQlzLbJ//TP3lQ3R2KK/KOhLt
         A7KEWhunRnZCzj9xxiNPjmSUGD3BD8emRkL1SSQqBYrnH9EkXpkfIAUSWBvi3CQf9+HI
         tNWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701190606; x=1701795406;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KlvtVgcoH+Cr5quxDgXdgueDoRBrewPBnFO4wuUANns=;
        b=OdI/jy6Z/+scwRed4d/ri6BM6LLZYo4o4R6J8smsjAkGWAzzVXvFWQZFPW0DQlnsD6
         QOvUPV/hXS4mVzy5sSuWQk+fPULYq1ZVGDACrnhd/U6ju3nYUZ9bdv5wBV6tUCHKlsJS
         A8mrTs/T1QWscTzdxbUvNyGXaVKGpazfLHr8Al+goRRYDp4h3zMzJjOaV8dW7mrD55jt
         aQ4oOWBRioTwT7Gh2rDficqxwYp8YXg8NxIui/eU03hlCfzR0osRcJiGrhhZ90aPkILT
         kp5STcIYVonYIZ211BKsFWQMwAYwn3VmswpKwKOmE1LNcEP2Jv4iksLHOL2UF7yoMBvV
         nMqQ==
X-Gm-Message-State: AOJu0YyPgs8kJNeO4zugUmW6q25qEb5Q1u59h+fFKP/ObfLQK8oRjAsj
	HbwxsBuYVa6REowv8Ibz2omYKA==
X-Google-Smtp-Source: AGHT+IF3hUBfKX//GdxpAzLW32DtoinveGYlCmLpmAQLjqtDChB2bMM64TERz8Kx5aYwPkRWwl/Ifw==
X-Received: by 2002:a05:6512:ea1:b0:50b:c102:a65d with SMTP id bi33-20020a0565120ea100b0050bc102a65dmr1112291lfb.9.1701190605996;
        Tue, 28 Nov 2023 08:56:45 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.109])
        by smtp.gmail.com with ESMTPSA id cw18-20020a170906c79200b009bf7a4d591csm7126252ejb.11.2023.11.28.08.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 08:56:45 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Sanyog Kale <sanyog.r.kale@intel.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] ASoC: qcom: Add helper for allocating Soundwire stream runtime
Date: Tue, 28 Nov 2023 17:56:37 +0100
Message-Id: <20231128165638.757665-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Newer Qualcomm SoC soundcards will need to allocate Soundwire stream
runtime in their startup op.  The code will be exactly the same for all
soundcards, so add a helper for that.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/qcom/sdw.c | 45 +++++++++++++++++++++++++++++++++++++++++++-
 sound/soc/qcom/sdw.h |  1 +
 2 files changed, 45 insertions(+), 1 deletion(-)

diff --git a/sound/soc/qcom/sdw.c b/sound/soc/qcom/sdw.c
index dd275123d31d..77dbe0c28b29 100644
--- a/sound/soc/qcom/sdw.c
+++ b/sound/soc/qcom/sdw.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
-// Copyright (c) 2018, Linaro Limited.
+// Copyright (c) 2018-2023, Linaro Limited.
 // Copyright (c) 2018, The Linux Foundation. All rights reserved.
 
 #include <dt-bindings/sound/qcom,q6afe.h>
@@ -7,6 +7,49 @@
 #include <sound/soc.h>
 #include "sdw.h"
 
+/**
+ * qcom_snd_sdw_startup() - Helper to start Soundwire stream for SoC audio card
+ * @substream: The PCM substream from audio, as passed to snd_soc_ops->startup()
+ *
+ * Helper for the SoC audio card (snd_soc_ops->startup()) to allocate and set
+ * Soundwire stream runtime to each codec DAI.
+ *
+ * The shutdown() callback should call sdw_release_stream() on the same
+ * sdw_stream_runtime.
+ *
+ * Return: 0 or errno
+ */
+int qcom_snd_sdw_startup(struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	struct sdw_stream_runtime *sruntime;
+	struct snd_soc_dai *codec_dai;
+	int ret, i;
+
+	sruntime = sdw_alloc_stream(cpu_dai->name);
+	if (!sruntime)
+		return -ENOMEM;
+
+	for_each_rtd_codec_dais(rtd, i, codec_dai) {
+		ret = snd_soc_dai_set_stream(codec_dai, sruntime,
+					     substream->stream);
+		if (ret < 0 && ret != -ENOTSUPP) {
+			dev_err(rtd->dev, "Failed to set sdw stream on %s\n",
+				codec_dai->name);
+			goto err_set_stream;
+		}
+	}
+
+	return 0;
+
+err_set_stream:
+	sdw_release_stream(sruntime);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(qcom_snd_sdw_startup);
+
 int qcom_snd_sdw_prepare(struct snd_pcm_substream *substream,
 			 struct sdw_stream_runtime *sruntime,
 			 bool *stream_prepared)
diff --git a/sound/soc/qcom/sdw.h b/sound/soc/qcom/sdw.h
index d74cbb84da13..392e3455f1b1 100644
--- a/sound/soc/qcom/sdw.h
+++ b/sound/soc/qcom/sdw.h
@@ -6,6 +6,7 @@
 
 #include <linux/soundwire/sdw.h>
 
+int qcom_snd_sdw_startup(struct snd_pcm_substream *substream);
 int qcom_snd_sdw_prepare(struct snd_pcm_substream *substream,
 			 struct sdw_stream_runtime *runtime,
 			 bool *stream_prepared);
-- 
2.34.1


