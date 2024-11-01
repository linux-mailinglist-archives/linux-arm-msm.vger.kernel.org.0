Return-Path: <linux-arm-msm+bounces-36643-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BB319B8800
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 01:59:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CA092281B72
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 00:59:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF34520328;
	Fri,  1 Nov 2024 00:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SSa0rUuG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4502AD23
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Nov 2024 00:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730422774; cv=none; b=rELlVjWxZIepP0+/2/0CKQ98LdNsTAtR0suAAXkMqoYdgRXbCBmLQsGYCBx7n1Bn7+snubVZkYkYrUUpRKOsnQ2+KFP++9t/EMKD81yKGmlgaMO+RaOWzOeNExd8qoLqy6K9iE14StW1s7bgVhNREYzsB+IwWTt7QYUM47MJ6lM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730422774; c=relaxed/simple;
	bh=VYOcc9RVqAC3xOcalVCeGB8TpM4JFvOp4HfDK7tCROM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tKwwOHfUqaaWucuPh2Oj5XW3tnUGJtcOWYw3pvMMgSKoQ1G0inj4qUosLjfeuWat3bzCrazFnqkFVUR09re8Kun/1N0fFiQmKWtLAAZiQhSxa+4lqhcsvw/ArmiJRul/dJIxKnmkQ4GGXnUtqe8OjEFeL1a4RUOKGgAKxvap1U4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SSa0rUuG; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4314fa33a35so12033575e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Oct 2024 17:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730422767; x=1731027567; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IzDTogGhhkM8ckQfZ1srs6eHShvXoQY5Qk/joVtqUSk=;
        b=SSa0rUuG3kyfgmXynKvpjaS0Os6tYfJiCOza2JlBCpmuffMmkWAbtAsL8xHJ8wAakY
         pVfFeDXaBhnoKS8FB3bp2crYmUx5OFIKecnX+9kDoNDmCR6COIsRgMpKnTU8EfsieI5L
         Sa9TG6L1eHcl1w8u/38EMRZJCZdokI/3/eYMiJg6AYvTldluIzCQd0BzoaQBlDagYS4D
         F0LNb654NkP+OeCZfPlWsbFj2aN7iGNlpkxlJWcp2P5LwM9y03PvTW0O22LbuOyh9599
         NYCIsq5b1kO2ym2XrHAz57zLjyZ6t1gIYjcPVastvmFy/e+A3RGSIyNCyF4BioVHK7kj
         U9RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730422767; x=1731027567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IzDTogGhhkM8ckQfZ1srs6eHShvXoQY5Qk/joVtqUSk=;
        b=fdyuxqiZAZFnwDDgs9CyxoNeA9Bh6yC7kUkhZwvnq3wdG3HdYHZ6gz2AmgL4x0Byzw
         Rqc+nKXxLlaJC/4MfvwTbJdrO9HWQftxW0v3D6Y84yVl/uYbrTMmubPUp8aQK5/zwx/O
         BHaQbLUUFw4TFrSW4sixHFgz7GUhXSL1V1fKybunS0qIR3OEkOrM4ttXhjbLV9SaKzJB
         B548EQ5hI03BAWzjDjxBvYV2iMzV2HqAodKcjWp56u2NS6vF/Kr+a/uZbpgASpIxujd/
         9K14swNRIMSzyoLoxgpptCHjJLJpPjZEnbpN8mM37w/v/TIbwW0RYcx1a37k5hR14lv2
         6rSQ==
X-Forwarded-Encrypted: i=1; AJvYcCVA7TmF//luGaMMFC67To2p7OfkwQyLI4IZVmNz1JmM6K+EuRiho/25Vxlh2RTZmEbcWWF2YRksUS79OF4d@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2XngHvV6iRtT68e58CnZputYN63ibcM47JiA/C61b+OKvTPfh
	xQpIKGfA2FQPFj1+GUynNxIRqqRks92EpwvQHAhGOiEiNKy9FYhTxvm0zXiHwcI=
X-Google-Smtp-Source: AGHT+IGoo1Wx0x9GicVS6Lf8vGvXGXy7SteUPJXzc0hWHa1ePvPlZLE7pqw6+/D43PB2BhmqrBjLvw==
X-Received: by 2002:a05:600c:3c8d:b0:431:58cd:b260 with SMTP id 5b1f17b1804b1-431bb9d0bdemr85023455e9.25.1730422767291;
        Thu, 31 Oct 2024 17:59:27 -0700 (PDT)
Received: from localhost.localdomain ([2.222.231.247])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd947a9fsm74208035e9.22.2024.10.31.17.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 17:59:26 -0700 (PDT)
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
Subject: [PATCH v4 1/5] ASoC: qcom: sm8250: add handling of secondary MI2S clock
Date: Fri,  1 Nov 2024 00:59:21 +0000
Message-ID: <20241101005925.186696-2-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241101005925.186696-1-alexey.klimov@linaro.org>
References: <20241101005925.186696-1-alexey.klimov@linaro.org>
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


