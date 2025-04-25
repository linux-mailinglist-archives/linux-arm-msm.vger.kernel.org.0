Return-Path: <linux-arm-msm+bounces-55568-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 88566A9C068
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 10:08:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 79F4F1BA2ECC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 08:08:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B15752356A4;
	Fri, 25 Apr 2025 08:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="3r4Iwxtv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE2E23373D
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 08:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745568458; cv=none; b=Sl1THJojYeB9Aum6KSk6Zqb6w312mV8Zzws2Wz34CP5Yo5iMETL5UmzgmE5ZgkXeyWR3jS41k6fEOINJ+EmUoS/v9fq6kZ51jh9uuzqtMhc0kOTm0XCA2B1OfesJ4NryTeYWN8KlpWhS3wzqvJZQRW9Tr+G9HDlE2WAcuEfEBMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745568458; c=relaxed/simple;
	bh=0Tu7c/55MLpVHgNQHr6rjQgjyskQ0bSBrdifeMj848A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GFMlkBa/mM44amLL2lslkP9lFEiB9Dhg5M6NMIcvd8C1rXDBZF+C2tXlCoYtEW8zUJZe1dCdzF/nz066RCM5xfgN86MYzrsxQNinFJxdMlTZozlnpQi++UbtEPfGDk58EAvVVKscJDJoIwBQcDWLEc46bCYg6cl2qRHOsXWwfXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=3r4Iwxtv; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-39ee5ac4321so1979439f8f.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 01:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1745568455; x=1746173255; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E/5LsCgffLwJC40iP8PJSPd6pyxub1HE/XdBIbu8y+o=;
        b=3r4IwxtvoEAls5z8rgeT4GYq9RM+ebzqM9NWWv55SkxOgf/eAMA/oUFh3CogGAyxOJ
         qaQ6BpAN4/PULiSNNS8cY7ttpkqFh1KROe2m8Txd/KJKylJd8Ysq1iYljOOBM2pTnQQI
         jzddHh8t1K/y7OR29iVGSV1FnjAYNS9HTJ/sg6aw/cyJ8/DkGRS+ayANKllXWQY0VXF0
         MEEhSywxxyKyD1fvYUf6vqe9uOT/Rfz8Q7f6HxypG3NyyFegpvyYoUz9fKS15Yt/Ma0K
         DzvmCYMUbCO87Uf8UBIwFVUkvRHF9lxTnKQ3yjq3aHklywOLw/oC5e60mjXsYXfJNKJN
         VdHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745568455; x=1746173255;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E/5LsCgffLwJC40iP8PJSPd6pyxub1HE/XdBIbu8y+o=;
        b=jDEPgzlYNj9/nH347NchRiplT5CIGmBu3ORS1Ew8R4Youmh/heKqVn2ZZCL1OjHOnG
         6PQEQG0MWHMyCAsgpWDrOKr3yDckXYSaaXLosXg5NdgwdFd+NRD53qcotRqy6MSkp1KS
         qf7W7AEJWObfjPW+OOoqag49naxjUvjS4vcz5GROsZpei8h2GkQLJ5t2N0mJEq+uiNA1
         lKlsoIHzEwhjeJlsu8HJFVkCVWvj6qCzIINZDYlgbkaUaiR4gjpGg4oPzACUhBf/0/ch
         xwHyzPydfe7yP2NTVCtmIfp8Oi7IogPQgx3wG2Hv6uYFQKvcU9ceuN0yRlZFFauoRUx4
         7Kiw==
X-Forwarded-Encrypted: i=1; AJvYcCWhvfZZsVN7XRSwp8tCq9knxXxbh5NK3xyOxWiPukmDLMnRSkqkmjzZHDUGu4akLtV3QrImqd6JBLOkRZ1f@vger.kernel.org
X-Gm-Message-State: AOJu0Yzz5/91gg/0/CnoqsKTY/2mDWorm4EvotkqjgQcQ0EYa+vJSrkq
	/jJX5ZC+Ly3xDDZ3qTNawXjIl3OW+WoTw8DhNNd7qMSoYRHowWVX0hRurn9MP90=
X-Gm-Gg: ASbGncuGOo4QbusuGWL6TYAtVrnOsP0vCHqew1+1R8ZRFOIK8QGalpLTiYJZsX/Xwjy
	u8qRTnZ46q3Khp0pem2s4oHfj7GNJisVLDN1XuGBGY+INcVtZBjpQTPbCtpgIOhXBja+nrS7B43
	hQi4ZZq93qFmkCl4cj8gNxfK7+t1c27UaadnkjLcydKvKt+S+/ke+BjSrwym8gGSa+3Hl4xlIHN
	ZlN+BdW7rOKcPoiBNPPfdw/a1vy8/vAWIRZ3vtxeiYCk4L35wklfeXFUrxKG7JcMTU6KeE0QNQI
	TZKvXTihbcZaBX7atMbtjm+b2HH3PmtLd+h5LPjaNYW8W/kEo+M+VhAoFTLQae6b67E/cuiwMSa
	VdVwx+NFrhbIcgLcbxiFAJpTer9sgI4jNjtkzdi0LWAcEKd059yx0i4J0
X-Google-Smtp-Source: AGHT+IGnsZ1b2dFNba8xAUTuBj3bQrZzqkheFyeShJZeV/m9/iuVWWISzbszqwiJOzfRZPRZ+u6F+w==
X-Received: by 2002:a5d:5983:0:b0:39e:cbef:c071 with SMTP id ffacd0b85a97d-3a074e2f521mr936972f8f.22.1745568454883;
        Fri, 25 Apr 2025 01:07:34 -0700 (PDT)
Received: from [100.64.0.4] (2a02-8388-6584-6400-d322-7350-96d2-429d.cable.dynamic.v6.surfer.at. [2a02:8388:6584:6400:d322:7350:96d2:429d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e461casm1593513f8f.74.2025.04.25.01.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 01:07:34 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 25 Apr 2025 10:07:27 +0200
Subject: [PATCH v3 3/5] ASoC: qcom: sm8250: add DisplayPort Jack support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-fp5-dp-sound-v3-3-7cb45180091b@fairphone.com>
References: <20250425-fp5-dp-sound-v3-0-7cb45180091b@fairphone.com>
In-Reply-To: <20250425-fp5-dp-sound-v3-0-7cb45180091b@fairphone.com>
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
 sound/soc/qcom/sm8250.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
index e920b413b762c803cfcc4049f35deba828275478..a4bf6eff811ea3e2b005071cf3410e5a0410f5d8 100644
--- a/sound/soc/qcom/sm8250.c
+++ b/sound/soc/qcom/sm8250.c
@@ -25,6 +25,7 @@ struct sm8250_snd_data {
 	struct snd_soc_jack jack;
 	struct snd_soc_jack usb_offload_jack;
 	bool usb_offload_jack_setup;
+	struct snd_soc_jack dp_jack;
 	bool jack_setup;
 };
 
@@ -32,14 +33,16 @@ static int sm8250_snd_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct sm8250_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
-	int ret;
 
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
+		return qcom_snd_wcd_jack_setup(rtd, &data->jack, &data->jack_setup);
+	}
 }
 
 static void sm8250_snd_exit(struct snd_soc_pcm_runtime *rtd)

-- 
2.49.0


