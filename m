Return-Path: <linux-arm-msm+bounces-57117-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF90AAAD9F4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 10:18:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 72421B24D0F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 08:08:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FA5A227EAF;
	Wed,  7 May 2025 08:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="ko17DMo6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D80E220F2D
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 May 2025 08:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746604932; cv=none; b=SVOitEKuWk6cvI2SFbBFR2IwhqRNim2uN+IGI3vOJrb/bwBpnh9JGx65+N7WfG/2Av4gMll6e+pwRZQs+2dUIEDlM3snvC5BNk61IW1V63S0r21L6urlz6ZB+PkG0c4b0L4LSq2ohC0OZwufCOpontzlzkwNLIbZu13BpDAqGJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746604932; c=relaxed/simple;
	bh=uXV98Zrpl4il+ECjXyEhMPhF7ON9sgsXksffGaRdVHA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UcfUTtqtti1On3fGohpNx2VZXmDHUZhOkFy5e3Xh/KZUIRZbulgMiSfEWjJwcCri0ytlrheeMTTPM7940CGd/7GZKCWY5Q7FOWlFm1QEg2bQ+bXChoDt48GVZeVAAnDURu6ZQBvbzklm3IEipZBST+mpmQcGq7w/fK9ewUTdzlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=ko17DMo6; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-acb2faa9f55so870769766b.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 May 2025 01:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1746604928; x=1747209728; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JdSfmOpjUf+n+Gt/wFek20I3+645i1PcH5llUxC+XYk=;
        b=ko17DMo6O+JSSVkFQO3Q0E+eIKhkfFGP/URYLW+dNHcqLVoH291C4djxftBeDjWJmj
         A8/5L7gZc6r/6/P5zYwjUAAf1TVd1TdRpHgXKt15I9stZ1X0wKYNkm8nXHVdC7ONDZ3Y
         zFpHFAG04ZIH52lEeK+iF2AnN6GuFPBv+xoRve+62/iLuZqNDvJwySGD/PumPWCSqFPA
         M6A8K6jhseTDOJn80AQhE9yvjnuDOSk6VtpU3ebQjirBjMq/CztibZTAmjWovWBoXdxs
         FPaQvWmPrarAHALQAYaVNlD7IPGRKoj9zkdErp/j1l0zZlOiqmZXYH0GhfcE2LNp1hfX
         AsxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746604928; x=1747209728;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JdSfmOpjUf+n+Gt/wFek20I3+645i1PcH5llUxC+XYk=;
        b=LqbtevZ8YFNn12AyC9DoATGuLvHxog2HlbiaSH30rjQL0UxKQFU7tNeHeONjjyk7ki
         89YYofev/Qhz6cMQS5u/gZBmDySgfANNd1gqHLx7bo38ShIdcGS7H5hleDaYfOOm2DKy
         9lBSlWBI503K2maM57essW7I03ddSAcA7l76gCnJXDB0cy5EOTwxzDRKW7uvwJT56/oE
         RJ8sBbe7df0DGPE5gCT0EGC+NpGspFrrG0Tn7VZkxQh1/r3IjoQlBazCP4sMgfx/TzCA
         0aSLJCt7czE38hXFPrirFoyDaT/7JylKEHa6ObXdkENJ1jAjp2lix8mQCw7bRu9TxEm2
         lrfA==
X-Forwarded-Encrypted: i=1; AJvYcCVlvRq82ORwY05oenjUIIwTX7L18m1uDKJmdCQc69xVpa2LNAs29FyxgyOWhdV5+QBv7bi5QteH6RKXobnW@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+qHP/CMplS16mgcC7GpsccsGViFGAAe1j4NImn6+z+ADgTOZ7
	nzI1Rl7zV4OTSL020+wxTTPqfo9YSYXgqfogbkNgQdS3FtoTuPJM2LrZtFJyLCA=
X-Gm-Gg: ASbGnctbdy/7/Jj6FyXiHHjFOAvHr4hWclT/wWf69dti8i8Y2MWylsCMqARqRH12VHg
	jx3NEU27fclAFgotTIf9OxLRbsjg/kRwashLau7tFyFFK7jqsTZkW3G+ly7C1wuG5OYra77dEQe
	nmPIpxPcPbNn/MMA0JeVGzNqt476NFK3Z6IYecgbLGXcZqTOwrUzKadbg9yoe80ohwFgXs2M1i2
	hWQuG+aAdW0n3p6BZRx3yKaVQZ5HDTetmRDa3oXPoUvMb26Yp8su0nRA7K6JvumtJrMSnNALA4L
	TxwbiIrkqf038an3p6+nIeRTryG/gDkUbwOhjGdWK98eyM2XtPNm7AfG0MiaFvFe7nDXNEdXYV7
	RQNwmfdlSeSmg6w==
X-Google-Smtp-Source: AGHT+IGAPRmQLx7xnwBq815f2zYCjZM2sBf1I1fFBdjt+vGkM/lX/FAon8S0MIUZj4B3CeheWCktWg==
X-Received: by 2002:a17:907:6e94:b0:acb:5f9a:7303 with SMTP id a640c23a62f3a-ad1e8c93689mr249348866b.35.1746604928202;
        Wed, 07 May 2025 01:02:08 -0700 (PDT)
Received: from [100.64.0.4] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1894c0310sm855236066b.88.2025.05.07.01.02.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 01:02:07 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 07 May 2025 10:01:40 +0200
Subject: [PATCH v4 4/5] ASoC: qcom: sm8250: Add Fairphone 5 soundcard
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250507-fp5-dp-sound-v4-4-4098e918a29e@fairphone.com>
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

Add a compatible for the QCM6490-based Fairphone 5 which can use this
machine driver.

As a note, QCM6490 RB3 board is using audioreach architecture while
Fairphone 5 uses pre-audioreach.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 sound/soc/qcom/sm8250.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
index 2317fe285ee7d41689d7fac453164fbe706744ff..69c514fad0b1babafae4b61bb5ac944c6b4906dd 100644
--- a/sound/soc/qcom/sm8250.c
+++ b/sound/soc/qcom/sm8250.c
@@ -208,6 +208,7 @@ static int sm8250_platform_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id snd_sm8250_dt_match[] = {
+	{ .compatible = "fairphone,fp5-sndcard", .data = "qcm6490" },
 	{ .compatible = "qcom,qrb4210-rb2-sndcard", .data = "sm4250" },
 	{ .compatible = "qcom,qrb5165-rb5-sndcard", .data = "sm8250" },
 	{ .compatible = "qcom,sm8250-sndcard", .data = "sm8250" },

-- 
2.49.0


