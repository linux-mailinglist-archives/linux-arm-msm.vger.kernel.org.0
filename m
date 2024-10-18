Return-Path: <linux-arm-msm+bounces-34834-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E69019A330D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 04:55:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 81410B22C6F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 02:55:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50210153803;
	Fri, 18 Oct 2024 02:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tl4AXo94"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DAE913AA3F
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Oct 2024 02:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729220099; cv=none; b=SU1qnFuNmucrpqrJBGwMNCfBUZDy62/DWVQTcMfC72YG4YRlktPJQ1tF0snqQjRnDtweOTErWFjG1TbtPEkG9iKXEuUTPmjyxJ7kcKCSQr3/MqpDZZ6zFmIMBaf80hftaW0xcd5ri2qXl4yUTc58/IjSy3f4tTSMJAs1qBoqNL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729220099; c=relaxed/simple;
	bh=VYOcc9RVqAC3xOcalVCeGB8TpM4JFvOp4HfDK7tCROM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iRVa3bLKYhD6MJkxb9EPI11WPly2Ljc5U+A+xhM+XoOkdHqdC68udgGpwj/ioOpxOhnMibmEtLs56+07qZWmZOVltx+Baa+vO0ZLF5MaTFXdpenNWd8U5Tob18NvkSJKw2dH43TEftAF99IWqrG9EI5536zAVMflcXRTGsprLxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tl4AXo94; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-37d5aedd177so1364186f8f.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Oct 2024 19:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729220096; x=1729824896; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IzDTogGhhkM8ckQfZ1srs6eHShvXoQY5Qk/joVtqUSk=;
        b=tl4AXo94JawXI4aZnlXIhYb/pp0FePYhsNY0KmihyfqQnkyoF2ULEze4OolmkPtN37
         rnEKWKuWOTMnj6XBvY9vg2xxmFKWsijfIFYoEGvxdoEDf9mAZKoXTjTRFB5hlQqdEqi+
         W8GwTADwHWF9tdkwxB+zA7skmV7Bapb9TlpMoQdoX+SWYEElDMXkbhsKlJzQ4IuDb6zb
         iZy0jKwWouvxEsfOeN+j2zMw0i67c0S/8UCQii/2y4aoyDRLVj1KxfCZan609u2uYSdg
         hmsLQPxKTmfnh7G3Io+dGWyf0EjBO3sY90evfQlSQVUFKcMEK3JdZ3J54M3wW2IRy20G
         wJNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729220096; x=1729824896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IzDTogGhhkM8ckQfZ1srs6eHShvXoQY5Qk/joVtqUSk=;
        b=Ymnn1JlsMjKiWW9InkH3KLoUWtIVfvokbYk2Ft6xJrOb+87h/DVy7GyyJ0s0tmWyTw
         qn0vur2wLbUGCWNO2TGWGq9hzt2FfXu1yYmcOnTT1IsaryfEDKFjk3CTU7D7VGvFj9gM
         PtZ+VJQPtUzhQyzNVOxsY73Ouy4j9LKlkacZk+VowEHGYAyd371Vmv2aoghLWhwa0urP
         lEGpXJMj+Lk6qwNQ9/Q0ffOy7ZOvOISFhC1czMHRpcgFTVIiPSLIZNeeS+OBU+9McLAc
         9L9KffKGEAOLnqmjjnJoKf4iK805QRXyKxYvk0nrX4Jj+mlS1PyJE+RaMp65ZO/XtIzO
         Ep+g==
X-Forwarded-Encrypted: i=1; AJvYcCX5GDR4fK9GAgzT6FRaLSN8p82OWcAeBPE/sDEl6OZkV+uxGfcrNDXxbVgiSsYa8r0oWPIh0fxIFAUeyvUE@vger.kernel.org
X-Gm-Message-State: AOJu0YyT64LNCJ2aVuQ3PeZI6UKynTlUkCwa5XM3agLNvlZDn2DAGjXh
	ESsvUYWEKa0FBnOA/bQyGFXwJWGh42kuF8SjE3k/KNGXLGdEjnJeSyasbAMcBsE=
X-Google-Smtp-Source: AGHT+IG3QrTDKAJwACMKKsazABlgr9tE3nlrIDdOrBRAbB1H3cVIrDGUpkSiHJ434J6s8XNZtjKUuA==
X-Received: by 2002:a5d:61c3:0:b0:37d:524e:9431 with SMTP id ffacd0b85a97d-37eab73368emr496858f8f.57.1729220095916;
        Thu, 17 Oct 2024 19:54:55 -0700 (PDT)
Received: from localhost.localdomain ([2.125.184.148])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ecf0ed599sm596135f8f.69.2024.10.17.19.54.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 19:54:55 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
To: linux-sound@vger.kernel.org,
	srinivas.kandagatla@linaro.org,
	broonie@kernel.org
Cc: lgirdwood@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	dmitry.baryshkov@linaro.org,
	krzysztof.kozlowski@linaro.org,
	caleb.connolly@linaro.org,
	linux-kernel@vger.kernel.org,
	a39.skl@gmail.com
Subject: [PATCH v3 1/5] ASoC: qcom: sm8250: add handling of secondary MI2S clock
Date: Fri, 18 Oct 2024 03:54:47 +0100
Message-ID: <20241018025452.1362293-2-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241018025452.1362293-1-alexey.klimov@linaro.org>
References: <20241018025452.1362293-1-alexey.klimov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add handling of clock related to secondary MI2S_RX in
sm8250_snd_startup().

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 sound/soc/qcom/sm8250.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
index 91e9bba192c0..45e0c33fc3f3 100644
--- a/sound/soc/qcom/sm8250.c
+++ b/sound/soc/qcom/sm8250.c
@@ -63,6 +63,14 @@ static int sm8250_snd_startup(struct snd_pcm_substream *substream)
 		snd_soc_dai_set_fmt(cpu_dai, fmt);
 		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
 		break;
+	case SECONDARY_MI2S_RX:
+		codec_dai_fmt |= SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S;
+		snd_soc_dai_set_sysclk(cpu_dai,
+			Q6AFE_LPASS_CLK_ID_SEC_MI2S_IBIT,
+			MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
+		snd_soc_dai_set_fmt(cpu_dai, fmt);
+		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
+		break;
 	case TERTIARY_MI2S_RX:
 		codec_dai_fmt |= SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S;
 		snd_soc_dai_set_sysclk(cpu_dai,
-- 
2.45.2


