Return-Path: <linux-arm-msm+bounces-57116-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C31E6AAD9B6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 10:09:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C58D01C22CC9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 08:09:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61AC7227EA0;
	Wed,  7 May 2025 08:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="sr2/yM6d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA75226188
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 May 2025 08:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746604932; cv=none; b=KjeMQmtiB4i9FoBx4Zk1i79ucYmilbN4pYrc0DrMoa3yjh5EXPAXniFWwnIXdUp8+MxQ/KtL1PRyY/rB768XU1d0u4cUvNw4cOrl1zdT/kCEkNaom5CAEr9kcb0sp+QrVfnspGYOiDBi2tlYoOR7Z4GjSLKu+FbbWQX0Kawb3L0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746604932; c=relaxed/simple;
	bh=+NkIa3tRR6OnKKuCWg/7/UZBXPY1qcvu5koCiqXLwVo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=glkgzMNtlKQ6a39fvdf0tqI0opxs+RafITARlMfCjTaRLWvpBAUlgAnGLUBPkS2+gBGJ2K/hddzT32yVtaRWJUK0bCAcp7kozZgGsNvaxPYrtYS0r3dJ06ylxwSFpnx/VhcWPNF8nTNup6kjRTJvX92ci24RVEcfGAQscyB4hWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=sr2/yM6d; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5f3f04b5dbcso9850520a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 May 2025 01:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1746604927; x=1747209727; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zEN0PXya3Y5YPAUDTh8Px+2+gU/KgrKVkv5tePKDfas=;
        b=sr2/yM6dnxNxPqEHg7gCYUuKwRBECOSfEJcdnvo8d6k3Y0fbTC+lzYN1ySoX+B9wFR
         OpwnnTJo6XCqDloc4AjkolinjkcOVJiEj+nVIA16RoxP9xaEyjp7UG8AIe2o0KsdPO7g
         5NO9D91cNCq9MHACcJzNuI7XhMgN2cAQLLd8qHi21JyUR4CiX9uOicZUo6thFNcjwoZ3
         UEz2P3pKTxRyaCA6C8DUojZkD/lvVBZ2425B6SxiXw3CWjZGG6yVzQjZ4N+C+9c9vdRQ
         sGPc/WNFNYc1julwKGKHXFyOW6LMRJ55b4PB+DCEUBdG6j1MmOo18o4VFCMBK3FGpBaL
         huvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746604927; x=1747209727;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zEN0PXya3Y5YPAUDTh8Px+2+gU/KgrKVkv5tePKDfas=;
        b=cuCf0h5uOYWyaVhbp6CIgP6pDv434LM2SLPLORnMoQ5CXbSVzPYn0X1B2Lie5QBHPW
         hqCvBjlCjJG0RJvTC0faH1b7ECcswj5sAI0FV0sHkMCEmUdPo+nondFMFhuaW/cc7aJ4
         9zrwjrc2RaXYuMGZCOvC/g9qRaNPH4juQrLPfDqVd2p96qfXvibrsAD8dFpT3id9IYmA
         ogFidn+PVm13201WNOYGF45xhZ7adGRfRSNp0C5A87bLNhcYOOCoku1DZigEE8BxGhIR
         TyVV1cpx2pFh9QHsG+7KSs/gnf+61oE5c+CNoSZmTlwW/pCS7kYA9XCtv6Q0QQEIiYsf
         7n1Q==
X-Forwarded-Encrypted: i=1; AJvYcCVWfmJVBO7mt303vS7V5SVWP5A/g09vL4M/6eMPadK6VlJl0QUuMLO4c0V0qKb0WZHuN1nL11eAVLQOkniK@vger.kernel.org
X-Gm-Message-State: AOJu0YwND/8It6iaFDEfXdzkXQ43BM7YC53Dz96en42Ti//M7wLt0fxy
	qVcu1HmbAX8pqwC1sUMUFkhG0Np7NcNIwYOimuneGEWcADAfIau6GP8PLgPGKzc=
X-Gm-Gg: ASbGncumytJsnYvY0TWV+4Yux9NJLii6stbgwY3aZaT/FAdMlezRATNreG+6MSSHndM
	iIR26Hg+rDHZIJW3WM+EwmkCSbvEVoblCFtCGaiHtKYTyIIonE3B3pm2xgImE6zH4KXcdHCTnRK
	GTnflTJLu7M/h7lGAZcvYhF+xcnf7LY0CzFf+e+xOZysyT6Jtpwy2JZaSVGEQP0A1WNizm3CEXY
	d1hCVtNZ8bTIgU96i2RJJQlWfT3YhA9I9jvwXwjP0hjH3fsQ7k5ByEjtP4r8YnT8ZMTUxd08E5Q
	aSNal1Zm5fYERos8/Tb8kw+y7U4FwqM8NGP/6SShYcBUhE3Y2xRjdXDiq6F3KgqyQjMVK+K0ow9
	t+uDOCndeJT2uhg==
X-Google-Smtp-Source: AGHT+IFM7Oq1Xn0VIuxfyz3KRNIFNY5cp5qjc6oWjmusZGZM8KjZIdX1ZYRy5EquRLMrIpwTTSPwwg==
X-Received: by 2002:a17:907:c28e:b0:acb:5f17:624d with SMTP id a640c23a62f3a-ad1e8d2ce68mr215405466b.57.1746604927193;
        Wed, 07 May 2025 01:02:07 -0700 (PDT)
Received: from [100.64.0.4] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1894c0310sm855236066b.88.2025.05.07.01.02.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 01:02:06 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 07 May 2025 10:01:39 +0200
Subject: [PATCH v4 3/5] ASoC: qcom: sm8250: add DisplayPort Jack support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250507-fp5-dp-sound-v4-3-4098e918a29e@fairphone.com>
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
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2

Add support for DisplayPort Jack events, so that user space can
configure the audio routing correctly.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 sound/soc/qcom/sm8250.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
index f0d83a843765d8dcdd51569e7cbc95eb72292497..2317fe285ee7d41689d7fac453164fbe706744ff 100644
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


