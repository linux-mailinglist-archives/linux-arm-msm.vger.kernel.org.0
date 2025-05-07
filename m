Return-Path: <linux-arm-msm+bounces-57115-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E74AAD9FA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 10:19:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D3997B23081
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 08:08:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BB83226D1C;
	Wed,  7 May 2025 08:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="KIEYl/vv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47C5D224AF8
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 May 2025 08:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746604930; cv=none; b=Jpq2b35Kpez1snsobIebVyCok+S7wooAAHLWLepTR5exGx9jkqEqzIdFGNJBUCRsiptT6SMKPn9eB94gYXNp5M6Fp3objyqhf7ul/Cehmji4q2EHZoCidqzib4EH/mPemfXtH8jxWYTxPTHS7JQCJ6nZabrOkFMuWiZtVHk0A7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746604930; c=relaxed/simple;
	bh=dtOaJQoNaf+2+Orucnur3ieXlStFPrTYojY1S++i2ns=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WtKpNnsfjfbqz6ztXv2DjnE8SwFgS+H5bgorEoxAy62dJa2yjsmBagmJivwn/PEyBA6FLeKL0i+3nMLZmIq1FkPPoAvbzqHNxIpFEBgeObzT9t7aW8ZdqNq11/Pn4jim00e4JC/25z9DsJJfHUxFN+KQCJcE4W/4U9mJ3VQRaNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=KIEYl/vv; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5e5e22e6ed2so10393683a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 May 2025 01:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1746604926; x=1747209726; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ymrf5p3qgNDjGKRM25KEk8X6NW8oIyoL8sa280xKMjs=;
        b=KIEYl/vvjsTAvME2DGC9v5Hze68RxQkz8z3j6ec1I9XntyH0PXvECNa+0nB8YPAuIT
         gNu9vXwTxE3NFxIBSzbhZa9USFl3F1xcKgCKTB6NPgeL1d38i/adgD2OssDWl7HaAXMF
         33L+396jIYeQF0kGlsRIHeC+5rnc/Dwtj+XN9t/kkwOM3vMi1r2KRQBw2Nx3n5XLhpIT
         Cb0pJfyzmwwV6IA1uu55rE1TynCxHdWLKJXRXefEF7j584Bod804rmPnUuprJu4gkfP/
         rN3HKcs3ITnQBd5abTkDNf31MuXF4wd3QQDZOXRyMMTBXUaq3QGz+1pd93D/AdDd6tyW
         uH9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746604926; x=1747209726;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ymrf5p3qgNDjGKRM25KEk8X6NW8oIyoL8sa280xKMjs=;
        b=e6x1hkq+SiqOos8LCkyhZCdeBFG9iwE1Gcvy0ff5fE7vgYFfBBeTawbYNkEOFytnWr
         sydGzDd5SRq65lGJVQiRtN7lJt1Q6RHE37OClZf5iGl/aUsB+SfRBs/DJjIFgKFqI+PX
         cD0CT/3EJ1PuIJJT0gLIWhjWCol1PHC6xgX5zs0u7D1KcOVrpAwkAxNpcH6su/9p+huD
         lve3yYwPhc7uf227nxrsjJaWF8TZml+PxgSHZHbsJT62ezGJnFYc+bSd5tNcoTaEwf6p
         r2qFMDKog8YTzSrsXxyJWcr4aLyVqLkagPqac4QJnr5fQ/sY+nZDGSsXrAIw/fGczmtI
         lHog==
X-Forwarded-Encrypted: i=1; AJvYcCVRbPJ9gAzkQcjhrQIOMvCjmnaHIQLOt8cgqEXBdm05gNTdl5sqzylxyVg06/MlkB7VIUihmRkdq5x9lYJa@vger.kernel.org
X-Gm-Message-State: AOJu0YzkXMH3zwuhCyT8Xpz4Sd5+B7kDoSVz5+/AnzfTGSMe7RlCBYr8
	alzILugAKJt25i4ljzcM7ZqXIsqt+UfjmOk0oOccDuwfq7i5Yrru8/g+vAz9tR0=
X-Gm-Gg: ASbGnctCVF7mhAUoilW4te5a8mYO/ynXgc470v5Jkz1NsylJ/YrGEwKehIWJP6t6IMu
	Y5kzsxept83QysjuHR6YQqhEGrJvZ9Yxef2HEPFKxy3v/lTdQxChjrkC4bxYakFz8gnk+MuSzTP
	dVODaxQ7i53j/R7ZrGRzMiD2m4ldFsZaBSdgRf1CM/KWeNLg+m7I/AZg1sbYJPW/UF4Vn5Kdies
	29iGSggIKmDvdIEfR8Raw1tIzrdi7TS9kVO0WAb0iqnIChtDE1IeihUsnQ8IwTxc+XCcWtJEgei
	UL9BSCXUS6oortjovkVt0v2IzAbkB+iCbXlLWi/SHBe4lU0OJV9hHwKIiFxTqiz0YwQPFoTFS9C
	468ie5RsTSw0jww==
X-Google-Smtp-Source: AGHT+IGAPyH7HbVPqCuUPV9BaAjaKKOy0NfeuaFEjKeL5N0COS2GXXpBkjPupozhJr/p6eoyikdoYQ==
X-Received: by 2002:a17:906:730d:b0:acb:b9ab:6d6f with SMTP id a640c23a62f3a-ad1e8e3556amr228314466b.38.1746604926286;
        Wed, 07 May 2025 01:02:06 -0700 (PDT)
Received: from [100.64.0.4] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1894c0310sm855236066b.88.2025.05.07.01.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 01:02:05 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 07 May 2025 10:01:38 +0200
Subject: [PATCH v4 2/5] ASoC: qcom: sm8250: set card driver name from match
 data
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250507-fp5-dp-sound-v4-2-4098e918a29e@fairphone.com>
References: <20250507-fp5-dp-sound-v4-0-4098e918a29e@fairphone.com>
In-Reply-To: <20250507-fp5-dp-sound-v4-0-4098e918a29e@fairphone.com>
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
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2

Sound machine drivers for Qualcomm SoCs can be reused across multiple
SoCs. But user space ALSA UCM files depend on the card driver name which
should be set per board/SoC.

Allow such customization by using driver match data as sound card driver
name. The QRB4210 RB2 gets its name set to "sm4250" as requested by
Srinivas Kandagatla, and since no (known) UCM has been written yet this
should not break anything.

Also while we're already touching these lines, sort the compatibles
alphabetically.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 sound/soc/qcom/sm8250.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
index b70b2a5031dfbf69024666f8a1049c263efcde0a..f0d83a843765d8dcdd51569e7cbc95eb72292497 100644
--- a/sound/soc/qcom/sm8250.c
+++ b/sound/soc/qcom/sm8250.c
@@ -16,7 +16,6 @@
 #include "usb_offload_utils.h"
 #include "sdw.h"
 
-#define DRIVER_NAME		"sm8250"
 #define MI2S_BCLK_RATE		1536000
 
 struct sm8250_snd_data {
@@ -200,15 +199,15 @@ static int sm8250_platform_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	card->driver_name = DRIVER_NAME;
+	card->driver_name = of_device_get_match_data(dev);
 	sm8250_add_be_ops(card);
 	return devm_snd_soc_register_card(dev, card);
 }
 
 static const struct of_device_id snd_sm8250_dt_match[] = {
-	{.compatible = "qcom,sm8250-sndcard"},
-	{.compatible = "qcom,qrb4210-rb2-sndcard"},
-	{.compatible = "qcom,qrb5165-rb5-sndcard"},
+	{ .compatible = "qcom,qrb4210-rb2-sndcard", .data = "sm4250" },
+	{ .compatible = "qcom,qrb5165-rb5-sndcard", .data = "sm8250" },
+	{ .compatible = "qcom,sm8250-sndcard", .data = "sm8250" },
 	{}
 };
 

-- 
2.49.0


