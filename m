Return-Path: <linux-arm-msm+bounces-54740-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D9A0A937B1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Apr 2025 15:14:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D4BC57AAD6F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Apr 2025 13:13:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D916278173;
	Fri, 18 Apr 2025 13:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="SyiuupG7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27EA5277807
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Apr 2025 13:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744982045; cv=none; b=tEdl5rnLa9CR4DG4ZtTKX4oGWY1+9T5e7juCi9Cpf4GzxIyKYi9cLXzWy4mhul4OjamBGWLfTFTVAdVN1d+fufchAph5tHpcDyHPhVcdsI9YVK8xLd8Ti26aTmKTQM3tV7Iwb1NFjt53BT1iGnD56QtW2XcECFvwIah62/N4tIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744982045; c=relaxed/simple;
	bh=6LWWCl+fw76HY+PZdOokf+xdGWSBmr74emQwtZNOoaw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i95MDyHVAGr8x5cL2u8/t6tPvMkLoSNCTZA+L5rW7Du1Fw0UwI8zUKCNh7xtk/iarRIfDHJ/CGxtQlNZniK4ibIWouAmOilIDLUm9/URelKVxdSUGYHELhNLjgK3/wC2fpDZLUGbpVzL/d9QFcQC9YmmzwE+Z9ZeRMtiucrUBvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=SyiuupG7; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5f4d0da2d2cso42771a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Apr 2025 06:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1744982041; x=1745586841; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ih9KqGuWJ1rc0JvwhZbwATHF/82WoHzu4xe2IRdIO6A=;
        b=SyiuupG7H306YWVn0b4dY0TBaDmRtwIL6sVFw4/ennSWl1NemCLouC80dO3bUVG9Um
         5M/dfjs/DRX5qDbpVBdQpLP1xQsr8pxzAZFgxyTRCmaQVwQc67Rso8gQedp4lsJiBnpH
         kMLuz0gB851OwXqYcAQw7KMa47CZrLt8c0e/WZwmkWTvYK4xGWTQtja1tBUSnf8bzHrY
         H4VWnrlbLy7K4TQ4qxq/w1L+Qw4zGb2DVJzmL6SvpPm+13fTrsbvW+H/FBZ++BMqJa4a
         TwuEzCX82+WpaikrPTmMnHehN5DtBl6feHHLoAF7v5WD7Ewk8p2KFaxAYRXpS7c28OQZ
         apXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744982041; x=1745586841;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ih9KqGuWJ1rc0JvwhZbwATHF/82WoHzu4xe2IRdIO6A=;
        b=sg/dqlgPQFj4ecBIe0bjFPaMM7n6lyhU7xu28BLPqUMnfgxJeBYJ3kf2diu2BY29pf
         DqYiwgFLCpKXS8mz/4xzIdfRj0wSI5aans8BPtfLgm1Y7kPFxg3eZTbNOQpmYVgDkd0m
         I6e9SuIg8P0SO435nOxsH21gSuI2oioklZOm5Ejm03fSu5YLpBhpZ1V9DCpnsFStTb69
         ++mN7XmDH2PdWL98QTCXxL1G7+EyXu+gNaMu/2sXvmqxNVwEICTyfOhSxVDu+09cbihC
         OpJTEhsg9tJvyyhFCWbl4GVioYOM4ySIkxjblwnCYlTb/McTuPpZWfbXv0X24ZRzEduY
         Za/g==
X-Forwarded-Encrypted: i=1; AJvYcCUfyiF/AgAjvcF1lpjZEiP+WDu51zaIWjbhAPwGd1kXLJr2r4fipU5bDZEekgaLlWo3FZZ0+eaX0vR6XbtM@vger.kernel.org
X-Gm-Message-State: AOJu0Yypg5nJ69m9jAWtrQwqC7+3G7MpcLkbWGPQU3wDhdZeqYCoOP3h
	fFRlZvjjWkpHwvny3793MwVPvX9xCC39cxJasgXBvlYMUktR2qXPPMFqNY61mcE=
X-Gm-Gg: ASbGnctJNACJ4tbJEg26t17fZLMml2lFLHHHPZband3+epWEDrjzGT01htgZaES4SfA
	AcXhyjaEwrepo5fonAzTRAeMHYhohlfEHg9vsfcs85NEHCU0d51hO73NtJN4PR3/2txI2B8zYD1
	y8db4VgkKVYSSfA+Il0tcTmSyyrq0Crt/SBQa8/PcmVGFfrwj4Txq3by7hWQ15KXKC5NgQjXNJH
	XI1UItTbhk240OC+LWBjzd77MrdTsSuDpz9cLp0eUg1UeFITj2srUSB/jriAqfRHyy+b5TCde0V
	m8z/VW5Np18DRnzWGpTZfN3u7LVBVTrryWR/HZ6szWFB1TRzngwJ8CCduNM8nmFjpC3VIf08BTe
	YIPIm9amKY/TJ5Q==
X-Google-Smtp-Source: AGHT+IEQnUcQbXMaqk61okzrXh46x/KQ61UJQzrcCrJS6MAJvzXtug796hcDtEBAuUVns86R4gHd4w==
X-Received: by 2002:a17:906:6a23:b0:ac7:391a:e158 with SMTP id a640c23a62f3a-acb74dda17dmr237991466b.59.1744982041377;
        Fri, 18 Apr 2025 06:14:01 -0700 (PDT)
Received: from [100.64.0.4] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ef41605sm115901966b.124.2025.04.18.06.14.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 06:14:00 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 18 Apr 2025 15:13:44 +0200
Subject: [PATCH v2 3/5] ASoC: qcom: sm8250: add DisplayPort Jack support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250418-fp5-dp-sound-v2-3-05d65f084b05@fairphone.com>
References: <20250418-fp5-dp-sound-v2-0-05d65f084b05@fairphone.com>
In-Reply-To: <20250418-fp5-dp-sound-v2-0-05d65f084b05@fairphone.com>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, 
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2

Add support for DisplayPort Jack events, so that user space can
configure the audio routing correctly.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 sound/soc/qcom/sm8250.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
index e920b413b762c803cfcc4049f35deba828275478..aa3b4bc3fcc7b8a8dccc75ef1309bb26a2a8105a 100644
--- a/sound/soc/qcom/sm8250.c
+++ b/sound/soc/qcom/sm8250.c
@@ -25,6 +25,7 @@ struct sm8250_snd_data {
 	struct snd_soc_jack jack;
 	struct snd_soc_jack usb_offload_jack;
 	bool usb_offload_jack_setup;
+	struct snd_soc_jack dp_jack;
 	bool jack_setup;
 };
 
@@ -34,12 +35,17 @@ static int sm8250_snd_init(struct snd_soc_pcm_runtime *rtd)
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	int ret;
 
-	if (cpu_dai->id == USB_RX)
-		ret = qcom_snd_usb_offload_jack_setup(rtd, &data->usb_offload_jack,
-						      &data->usb_offload_jack_setup);
-	else
-		ret = qcom_snd_wcd_jack_setup(rtd, &data->jack, &data->jack_setup);
-	return ret;
+	switch (cpu_dai->id) {
+	case DISPLAY_PORT_RX:
+		return qcom_snd_dp_jack_setup(rtd, &data->dp_jack, 0);
+	case USB_RX:
+		return qcom_snd_usb_offload_jack_setup(rtd, &data->usb_offload_jack,
+						       &data->usb_offload_jack_setup);
+	default:
+		break;
+	}
+
+	return qcom_snd_wcd_jack_setup(rtd, &data->jack, &data->jack_setup);
 }
 
 static void sm8250_snd_exit(struct snd_soc_pcm_runtime *rtd)

-- 
2.49.0


