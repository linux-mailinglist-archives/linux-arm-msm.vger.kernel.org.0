Return-Path: <linux-arm-msm+bounces-36676-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63DA39B8A8D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 06:33:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 24D0528334C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 05:33:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9429015665C;
	Fri,  1 Nov 2024 05:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jBnIAPX0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A218D14A4E9
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Nov 2024 05:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730439134; cv=none; b=Jz2AUqy90yVn3II/KAdFrO1qx00nXd0VQApXf1uebS1V6QjS2w/ON09XcrBtA5BtOZHwRwqUuFIAOaNdRnoMo1uEE1g6DBqi150atWFVofPxXJBMjT7BgcP3CEN/un3IQEZ/ZhM8HIJhEMKREPc74zJlvRz9HfTB1YqM0smolJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730439134; c=relaxed/simple;
	bh=7t6SY/A5qJfgXLXrqRp6mPVqti3WBAnSq+LngHcAwxg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gnewa1Nl6J83EJRvC9dFmtufl2qZbtQDa4urpz5xxEAg/ZaBQKnDa8tYaXSkTYOwWjzMEp924QCNLv0n6CrAqHlqgLbL9cWPtwWroH3PafQoFpnio2d2lcYT8AntPB05RX6uhAes4vZZSYuBXCjn6TpKqUMm9w3bCV0kQZzHkAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jBnIAPX0; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4314f38d274so17811775e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Oct 2024 22:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730439130; x=1731043930; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0qZ+GHMqA1XdG2ZoQPqbFp+pFaFwbLJtnfQPgYvvEGs=;
        b=jBnIAPX0nwf4+J5NjJXxJlmJeGQ3TUhXGyA7YGSD1EcuDQu5x7HI6aBmsOggLeHe94
         cNYKXwaeaAD+B9y11dwB7LzT19RGhTDxcha4GB4vtH30bhMFSbYgZjQQ/xP2DSeOCN2V
         Gm/nB0P6gPbKmgv3qJPZA8FK2zT6GuZ51xFbJbCqyYpgqCbAnkq2352M+aPUzWiT8N2y
         VP4/sAElk3xqK6T/N6GD2q1pjJ3yVCnysin/PxHLjabKHi4eQnZbOnc9oXkYNPQcq4H9
         VbTTAoB01h0mK0unwTeXG0K7+9Ppj3RRydEjDO1FL3fIXP6nS8ca6HHrO8rYAowezkfU
         wsvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730439130; x=1731043930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0qZ+GHMqA1XdG2ZoQPqbFp+pFaFwbLJtnfQPgYvvEGs=;
        b=h7wvV7CJ5OrwaE7o71XjtLG47umVF9K+N38G6XpNpfXZX+oou4rvavnTEQICNa1q3R
         VSFC0jTMr8XusnAbCQf3mzrfZSW7jPslUvKfOEd1+XWGbZJNZY2Takv4KkaT5eoltcDF
         ZZFPbZ+gpJg7n3O7prqNCM9KnMPdcF6Mb+RptBP0i9AOS3y2m5gN9PgcdAZNIScNqpxw
         k75F5FIfPI+U3p5CDeN/djel2owJdLXb7h3k3S/YxOflEknU2cJd/5iM7afTqJm7UTr7
         L6gW1HRp1OrkGK/KpRYSz1ja9wxgmb0fHjzWMgFvgSaZX7p/w0Qo1DlkDlfdPQLEf7o0
         iLXA==
X-Forwarded-Encrypted: i=1; AJvYcCU7pno/sPX/k+4O3zTxVCgH27qIzYuG9XzUBkJE9jbHq5rqq4rHeel+yNnnFqQsCQvELeEX1k7HPqQtiO5U@vger.kernel.org
X-Gm-Message-State: AOJu0YwJGrUSTPf/pKdyZyYROEW05FnvY+FBhMJotELvBW4IH7+1a8NG
	48q1EC/a3+p2erScJ0bUuqHtytkDo5xqkULPOUc8c82oZgOt/GFVYXlnNwq7ib8=
X-Google-Smtp-Source: AGHT+IGf6ar6VexZK13JhCW0Tfya9l6kv+PZwdcvXJwTsfxhD1kd0t2KZRYLapS6J/eWQ4atw7TETw==
X-Received: by 2002:a05:600c:4e8a:b0:431:54f3:11ab with SMTP id 5b1f17b1804b1-43283296051mr20804705e9.33.1730439129894;
        Thu, 31 Oct 2024 22:32:09 -0700 (PDT)
Received: from localhost.localdomain ([2.222.231.247])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4327d6852fdsm46960505e9.34.2024.10.31.22.32.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 22:32:09 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
To: broonie@kernel.org,
	konradybcio@kernel.org,
	konrad.dybcio@oss.qualcomm.com,
	andersson@kernel.org,
	srinivas.kandagatla@linaro.org
Cc: tiwai@suse.com,
	lgirdwood@gmail.com,
	perex@perex.cz,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dmitry.baryshkov@linaro.org,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 10/10] ASoC: qcom: sm8250: force single channel via RX_1 output
Date: Fri,  1 Nov 2024 05:31:54 +0000
Message-ID: <20241101053154.497550-11-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241101053154.497550-1-alexey.klimov@linaro.org>
References: <20241101053154.497550-1-alexey.klimov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In case of mono configurations we need to enforce single channel
output. This is required for audio playback on QRB4210 RB2 board.

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 sound/soc/qcom/sm8250.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
index 45e0c33fc3f3..7994488d7998 100644
--- a/sound/soc/qcom/sm8250.c
+++ b/sound/soc/qcom/sm8250.c
@@ -39,10 +39,20 @@ static int sm8250_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 					SNDRV_PCM_HW_PARAM_RATE);
 	struct snd_interval *channels = hw_param_interval(params,
 					SNDRV_PCM_HW_PARAM_CHANNELS);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 
 	rate->min = rate->max = 48000;
 	channels->min = channels->max = 2;
 
+	/* Maybe should be moved to driver data variant */
+	switch (cpu_dai->id) {
+	case RX_CODEC_DMA_RX_1:
+		channels->min = channels->max = 1;
+		break;
+	default:
+		break;
+	}
+
 	return 0;
 }
 
-- 
2.45.2


