Return-Path: <linux-arm-msm+bounces-35606-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3025D9ACA4F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 14:42:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B56FB1F229E9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 12:42:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C96D41ABEA1;
	Wed, 23 Oct 2024 12:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DETkIdaO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B3951AB51E
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Oct 2024 12:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729687319; cv=none; b=cIpGR9gaFOC11+WfNMWOw4OA69AGfe6enaUiHO7w0NBt80OP77xpEb6bEG/EdRJqsZMLC26az+9xJL4P79AExbeFPrJaFac6NPqjvr2Xp34HvHb9Bg3JDWHj+21m5AuxgxqsQ/VhhQDnLQMXjmq4Y1MzGb52N+0ZBjTKkEUBZm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729687319; c=relaxed/simple;
	bh=r4xQBSHSzqBbjSO15B6LqQBSJLlq/rBG7/qkg8UtW2c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=roc/cIGEZFnHD//pJSF1pYX/kyN5DBYPKGAuVEBw3bAOaqXn2rhkQO6xUKxoDFAcpWmzJdbGKAkjfvK3o50ENt5LWLpmt9jlMmDyvKKXK1jsAnRahS4OwrvkKfuTFtL+RIWZwewuqH/TQKGmYtcsE82lb788yjRxhmvOpag2J18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DETkIdaO; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43158124a54so9286445e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Oct 2024 05:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729687316; x=1730292116; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OC1GUo6u6ogIaP+998OmJFrdwx6E7b3ebTutyLvUJYE=;
        b=DETkIdaOHdOPQEuktXy6mDkM4t6rPm96scJ0FnLLCYiqmZeuDG3qeGPhm8TPL5FVvk
         XjzMvN+DlHX0VxbvxAYojxbgPmurKPdI8G7xz2M7QtujsqsAWFz9DHsNzBlBB89Urt3r
         ueZMuVp3ouN9X9zPaxsfeMeNxpj1oWWuMzJQgiLbkW1ym841/1ncgwm+8Yy1xMAiE9wT
         hLF1EPgXbvdImxdjOzU7m6eKMUlVuLmphMFKlBr27Z9T3O6hFGgB37BmDF2tchFCtzJq
         qfsqtJYrtgRp5ti4r2K8LQyKyycfYoJG/T57FK02ONWL7jaKpNL/Bvh/NAdNZ6/b6Uw8
         RRZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729687316; x=1730292116;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OC1GUo6u6ogIaP+998OmJFrdwx6E7b3ebTutyLvUJYE=;
        b=dphuBuUMagp7Xjr4pOL4jAW9cjTisKmCPF5y/qPn6opgq7m7YEM6knsZoIkn1gzpyA
         eyMHNdMag7MJxRsDSGqiamZxyNclF4A6g1ofx7NnHMFwpfav5ft85eKgh7CO4Ow+N64q
         uVDwrcgWg4SyoTTnpUaOZL1M4gdQ+Dra1r9k/oEftdJ1PjGCYi4EtOUxtyJDdV3P13m9
         xWIu2X9NXLQDBKNm5sRch/W8jL7PWiddbSkQIJ8zXLJWmD1rUz5wQZxDdBIK/51RZ4gt
         cH6ClLIqdIQL6x2Ua4yk9Pf4H2g+WJKz9BM4O3ZMe5abhnHwVCub4rZunbLyYXhgtz0g
         AzKQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1U9mIIwpqO/IMLy2s+PlepzztmmA7io/So10Q9FAsUxSDtw8keu0934fnMEf4zbrG64g2BNQTvHEiNWPf@vger.kernel.org
X-Gm-Message-State: AOJu0YwvDy4WHhFg+aAaq0ghyUWDLPVTxJFRD0qy2sZhpNsChsnHI7AC
	QhGCHwYwiubWA1WkdVcxYb1PODVoqayvtM0rSHbHBKhARD8d9Fx5BHjyVmPRABXZe7zPq1Lnzn0
	W
X-Google-Smtp-Source: AGHT+IGOOLD010FpGoIXn//GRg/EMY8PWXk1Rdw1ltM3+wHFz9aINxy6HV8Thsw/0R78Sp9Fi09moA==
X-Received: by 2002:a05:600c:1d06:b0:42c:bfd6:9d2f with SMTP id 5b1f17b1804b1-43184133ef0mr9814505e9.1.1729687316420;
        Wed, 23 Oct 2024 05:41:56 -0700 (PDT)
Received: from krzk-bin.. ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43186befc90sm15101675e9.26.2024.10.23.05.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 05:41:55 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] ASoC: qcom: x1e80100: Support boards with two speakers
Date: Wed, 23 Oct 2024 14:41:52 +0200
Message-ID: <20241023124152.130706-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some Qualcomm X1E laptops have only two speakers.  Regardless whether
this sound card driver is suitable for them (we could re-use one for
some older SoC), we should set reasonable channel map depending on the
number of channels, not always 4-speaker setup.

This change is necessary for bringing audio support on Lenovo Thinkpad
T14s with Qualcomm X1E78100 and only two speakers.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/qcom/x1e80100.c | 40 ++++++++++++++++++++++++++++++++++-----
 1 file changed, 35 insertions(+), 5 deletions(-)

diff --git a/sound/soc/qcom/x1e80100.c b/sound/soc/qcom/x1e80100.c
index 898b5c26bf1e..8eb57fc12f0d 100644
--- a/sound/soc/qcom/x1e80100.c
+++ b/sound/soc/qcom/x1e80100.c
@@ -95,23 +95,53 @@ static int x1e80100_snd_hw_params(struct snd_pcm_substream *substream,
 	return qcom_snd_sdw_hw_params(substream, params, &data->sruntime[cpu_dai->id]);
 }
 
+static int x1e80100_snd_hw_map_channels(unsigned int *ch_map, int num)
+{
+	switch (num) {
+	case 1:
+		ch_map[0] = PCM_CHANNEL_FC;
+		break;
+	case 2:
+		ch_map[0] = PCM_CHANNEL_FL;
+		ch_map[1] = PCM_CHANNEL_FR;
+		break;
+	case 3:
+		ch_map[0] = PCM_CHANNEL_FL;
+		ch_map[1] = PCM_CHANNEL_FR;
+		ch_map[2] = PCM_CHANNEL_FC;
+		break;
+	case 4:
+		ch_map[0] = PCM_CHANNEL_FL;
+		ch_map[1] = PCM_CHANNEL_LB;
+		ch_map[2] = PCM_CHANNEL_FR;
+		ch_map[3] = PCM_CHANNEL_RB;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static int x1e80100_snd_prepare(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct x1e80100_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
 	struct sdw_stream_runtime *sruntime = data->sruntime[cpu_dai->id];
-	const unsigned int rx_slot[4] = { PCM_CHANNEL_FL,
-					  PCM_CHANNEL_LB,
-					  PCM_CHANNEL_FR,
-					  PCM_CHANNEL_RB };
+	unsigned int channels = substream->runtime->channels;
+	unsigned int rx_slot[4];
 	int ret;
 
 	switch (cpu_dai->id) {
 	case WSA_CODEC_DMA_RX_0:
 	case WSA_CODEC_DMA_RX_1:
+		ret = x1e80100_snd_hw_map_channels(rx_slot, channels);
+		if (ret)
+			return ret;
+
 		ret = snd_soc_dai_set_channel_map(cpu_dai, 0, NULL,
-						  ARRAY_SIZE(rx_slot), rx_slot);
+						  channels, rx_slot);
 		if (ret)
 			return ret;
 		break;
-- 
2.43.0


