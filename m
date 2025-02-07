Return-Path: <linux-arm-msm+bounces-47155-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E9DA2C709
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2025 16:28:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 776F516B4DE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2025 15:28:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91FC81EB1AD;
	Fri,  7 Feb 2025 15:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UvSJg/SQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5FD61EB195
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Feb 2025 15:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738942086; cv=none; b=KRI6BRSu0T0TIOj3rqw0bQSGY3GDwG/wlbZDtzfLtkp8gGOlppr7LMPNBTHPVb2fMJ8pl71O3xxYBsEAFtwXhH3znvPU2JhUO13IL+IhI1F3zTQ4qHKqMsA85DoxHAlp5BHVqrPFNZJbZ8n0AwYdgJss/i+pyqZtKB3AxfxjgA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738942086; c=relaxed/simple;
	bh=Q7U4e/3ZAqomUz5s/MfeWRrjkA+9nTAGxKwFub8kOn0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P/mROVUyQTqPt1fIEfC+OpTa6i1Hm3wufq1E/DLqnUzu2mRlMtch3SNqwGWOPA+mfpWpIU32v7fX5b1X5HBkuRw+rEr8g9PyulsPrsdTddRLNRSW29KFeB+YvkN7VelF2nsBpursUZK1t6CTX8RT18Z/F9bUudpBbp5uuHCY9AU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UvSJg/SQ; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43675b1155bso24037635e9.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Feb 2025 07:28:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738942083; x=1739546883; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8R6ZmKIy8powAjSYsUDUo38qzhstaaaTVILoNs+rNp4=;
        b=UvSJg/SQ9oynYYgt+oDHsAmYdepz+d0p528dJWfPSPEgGiqnqClNB3b3+Qr25RbgbM
         i3gZnXAnJLH1tVrXCXWZ26Y1M9oy/7yW7WIWSCt1XU6m/sYqf1KNFjnnYTidCLsYOb5P
         XvgD+t05pRg1C74WRlhhJFw4vAIbzbjHBBMIsNXosR8DKSR2kl+bYw9D6ATUkalpNeiv
         iiDpHMhAN7HFteDuqcVOhLFeyY14j6gVyjdq13WSS+Hgh2iNUCStk2BqHTB+B8hxHMFP
         EAUCkAK69pFx+aZzt2GnThbFnZgnxW3ko7V8UE0mOWIjzQvsbjn6fS4MmjmJwNb0uLbK
         3A9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738942083; x=1739546883;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8R6ZmKIy8powAjSYsUDUo38qzhstaaaTVILoNs+rNp4=;
        b=JJqNLRGPRxVttCCiAdgWLb/rPBMU+p+nxDMqEsEsWuTgUF/ir3sdxyq3GzpkWq6nu5
         DeaAMFzqQOaPqV3d9Y+RQ2Kl92OdaIBR71DpZi95XxrcRzuQcSIB0NRzAVuXPnAVnwcY
         4Ch2FGuOR56+Fjto3AoN40D1A5zZoE3lwhyaJrX18OXLWZp8hweSggTmrhdXLkYzJPLn
         3sSDKP8BH9OwZdl01OlhnW3733bFP3kY4crY3dAX5WwS/EpqYVI+zN76Jz7/1+Lk4/hf
         1xBQdTpZhySZaLlQ25EdE8A60LhRlmZle2u8fKm0Zac0cwX5VDEK4Vu2BeQFt0ZFkVkc
         YMZw==
X-Forwarded-Encrypted: i=1; AJvYcCVgn5v+rSu7S9EpIYDKhJlf771TB0hep3wH7MPv/YKRNfdN77BgX5A7miVOc698PJf32QdbCfyqgIK7T3Pr@vger.kernel.org
X-Gm-Message-State: AOJu0YyqG2GDzy7vfFLe5Y/gi9jiO9kreQfPXJ9wrrKKrNOaHf21eRKr
	Q2b/SUsmiT2JOmRXo3v4wb78/VwGqPyLmWYj/ORr9rxy/7zRiAdQodTvYJ7wZPM=
X-Gm-Gg: ASbGnctYHoLk+z0W2OGokRhWBP0SNEvbdE0HgpRWQ+y8lUPpnVRg5abPEkBDZ4Feuav
	TEgt9zBUA0VKskpwk2++bciaw5tcilb1lEGFcLl4BPSQaAmpqlYQoc9WJyw3BF1t9/oOahTHRIp
	R8rpQi7sDfYuXY27OowzaAiDcEnOnwLrfdOETP3099GWl8s0tWRt7+xXoCP2CsGLj5vwIlhaZKa
	SZ2ETWhf1RXO4zPH+xHDVZ41Fylq/VQ6j6AVbN5/q9adBmQ6cDXjEfmioEL4pdFHRzUesAGCYPu
	wIA6mZ4Ml/QP9zsKwUIV9LJrF2+/
X-Google-Smtp-Source: AGHT+IHTq5Gq6yAvA2qXZ1HWUGWrBJcM5rHY/xgBUWYVkXor56+zuLwsDV+i4iKaqHwtQyItHJRynw==
X-Received: by 2002:a05:600c:1c0e:b0:434:f218:e1a8 with SMTP id 5b1f17b1804b1-439249a8455mr30649435e9.19.1738942083021;
        Fri, 07 Feb 2025 07:28:03 -0800 (PST)
Received: from toyger.powerhub ([2a0a:ef40:1d11:ab01:88:c96c:f11d:1729])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391dcae841sm56972275e9.21.2025.02.07.07.28.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 07:28:02 -0800 (PST)
From: Caleb Connolly <caleb.connolly@linaro.org>
To: Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Takashi Iwai <tiwai@suse.com>
Cc: "Dr. Git" <drgitx@gmail.com>,
	Caleb Connolly <caleb.connolly@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: [PATCH] ASoC: qcom: sdm845: set quaternary MI2S codec DAI to I2S format
Date: Fri,  7 Feb 2025 16:27:45 +0100
Message-ID: <20250207152754.49897-1-caleb.connolly@linaro.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. Git" <drgitx@gmail.com>

We configure the codec DAI format for primary and secondary but not the
quaternery MI2S path. Add the missing configuration to enable speaker
codecs on the quaternary MI2S like the MAX9827 found on the OnePlus 6.

Signed-off-by: "Dr. Git" <drgitx@gmail.com>
Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
---
 sound/soc/qcom/sdm845.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/qcom/sdm845.c b/sound/soc/qcom/sdm845.c
index fcc7df75346f..4d8e00907b40 100644
--- a/sound/soc/qcom/sdm845.c
+++ b/sound/soc/qcom/sdm845.c
@@ -368,12 +368,14 @@ static int sdm845_snd_startup(struct snd_pcm_substream *substream)
 		snd_soc_dai_set_fmt(cpu_dai, fmt);
 		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
 		break;
 	case QUATERNARY_MI2S_RX:
+		codec_dai_fmt |= SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S;
 		snd_soc_dai_set_sysclk(cpu_dai,
 			Q6AFE_LPASS_CLK_ID_QUAD_MI2S_IBIT,
 			MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
 		snd_soc_dai_set_fmt(cpu_dai, fmt);
+		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
 		break;
 
 	case QUATERNARY_TDM_RX_0:
 	case QUATERNARY_TDM_TX_0:
-- 
2.48.1


