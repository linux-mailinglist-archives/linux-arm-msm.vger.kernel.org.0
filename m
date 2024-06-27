Return-Path: <linux-arm-msm+bounces-24501-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5476091AB36
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 17:27:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7FE341C21D59
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 15:27:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B55C19B593;
	Thu, 27 Jun 2024 15:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="O4jRsBdD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C0119AD46
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jun 2024 15:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719501838; cv=none; b=adS4u4GFoapTBr9v18NDkmBpAVkim+O4//MMRf+M1gCvcXtF0clNwWOk4nZQw/h157CKr33ehH2F4ugit4ZFx0E7YA5KgtsT5xVu7kh9bgDuTTkPCKOJ4tuRrWKYn7PVfl10n/5byaXpnMch1xdTpjUKK7kejVoIsFvPATrnLhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719501838; c=relaxed/simple;
	bh=l8Fs7uNm1FChU4HgNrAzvxr0CjT3lQ1EHDABQ5Se0aU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M+EN8D1NdjJZvplROb1Y8Rgake/3eplCYSHvi7T3vJQKM4e6832kp/WklCS2HYl/u8ipo83103W/8s3Q/F/noxcB2nMf4FKhKabg/dhB3WM2DRJO76Jz/ZcV5SJvW28qe+GAT1FMW0eyqIoQQC2JxUpVM6tSRqgCkt6CQ8mxfFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=O4jRsBdD; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-42138eadf64so68782255e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jun 2024 08:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719501834; x=1720106634; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x7JX1Bcmrsym1bUeGPwa5YrFI0Ft58jDDZJ4/xxAojk=;
        b=O4jRsBdDbdPuc0npGe19bnuyXA1/w/07VlJDYFLJM/gWfacPamIwZ8N5RCO/dxnGK+
         Bk0OVOhlPqUonBPLnK6sH/edy2B/Pa7t5nKPm1Eww308OS3e8zVAsyOQ43f9S1haSZD4
         hgXBGLFp82y5T5sagbEwU05RGW+gTDv6lDyZfQ9MXPbWb4uutOshYX7L0r+7Y9qaW2MY
         AABZ7RsKuGrOBkue919t40UQx2BGGCDhcPjzCWb66cNPvthITai6EegzAr/aauNtPv4w
         HFDwGQQ0eVElN7TLdj+XhHiLcT/K2FCygEnRHSTcdkQ/ySZPjKMpIfQaycwXff/Hic1b
         rhgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719501834; x=1720106634;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x7JX1Bcmrsym1bUeGPwa5YrFI0Ft58jDDZJ4/xxAojk=;
        b=vXTzM6y3bGepvWWzlvNmGUwnVyJK3978/oIwkO4i3bEqcuexI6dKTf8UuZiHKkA8t4
         Ve+dsvejMumrAfFDgKTsRKLj+P3wYxx3pVyuxIqOKT+iQzwVxSC/AcuUhHcBo8FFfAqy
         RbCC6jpfRsrwkKym0brbyjdqxD2V8k+stAexd4GxT6FkfsPIWUOBrE4xhdKcsG4+lFdY
         gYDZv+G1d0PN0ntL9WDXfe6U8qoJb3c3FJAhfqs1kr9L+sKwx8ewz6o4mzwBxLTAyyj+
         gg5rCw7cY5vfLUbaZaFvFqnCBL5AdQSNp/7vKkopnu3vQ2DYIMHlniYXJKzrtJTyT3Sx
         92cQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2oYGvbWpWoMZrxxGNLht8PonWiWnJJ0sseIcpQbUITUnWG2rOWmeI6hmcncOKrQ7oKRQsZ68U/McnYepEr+YsIEUxnByOKTAcHGA/Zw==
X-Gm-Message-State: AOJu0Yz+E/tRIxPBM0eI0PZRvtNrgYMAbjBuIY73wcap0qGMTHZnWjG7
	JiwwJFjKauF5byziojQdcfmbsh16h8PO3yOBL5dYc0E3UBVjUHD/BWZnAQpMbWU=
X-Google-Smtp-Source: AGHT+IHU0uHfAgbvO3wWQFz4VkorLowhWrH3I6Q0ilQ6xxfYkyzq0SbVy9LBPiGmf7/YXOrhPlwUkw==
X-Received: by 2002:a05:600c:4451:b0:422:62db:5a02 with SMTP id 5b1f17b1804b1-4248cc586ddmr102982145e9.32.1719501834317;
        Thu, 27 Jun 2024 08:23:54 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42564bb59b7sm32783185e9.34.2024.06.27.08.23.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 08:23:53 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 27 Jun 2024 17:23:46 +0200
Subject: [PATCH 4/4] ASoC: codecs: lpass-rx-macro: Use unsigned for number
 of widgets
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240627-b4-qcom-audio-lpass-codec-cleanups-v1-4-ede31891d238@linaro.org>
References: <20240627-b4-qcom-audio-lpass-codec-cleanups-v1-0-ede31891d238@linaro.org>
In-Reply-To: <20240627-b4-qcom-audio-lpass-codec-cleanups-v1-0-ede31891d238@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=946;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=l8Fs7uNm1FChU4HgNrAzvxr0CjT3lQ1EHDABQ5Se0aU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmfYQD7NGFlFAPZPk5oxOO2+MovrmCbj4uOIsyP
 e/OfXBPY16JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZn2EAwAKCRDBN2bmhouD
 15n/D/9qgH86TgweMDT2rs2qJsT1XmlVEPhyqpMP/R9xme0SJMtfcuduTkwsrgdmqKSINPbIQf9
 u3d/5f8FCg8Eb9FhBU9vJJC5JYMLnU1gTKMoGG/DVrc28B4nTWP+FtO3VMEoYagqUJK/h9Z73RP
 HAUXqZ+R+Naqh4KBkVy5HW2m773Y7w2QRH0DdDHOC+hLjjL3nSr29P3ymYl0IBzza5eevLAxmx1
 /bJLceFRg8tedElAOIyRliiJq/z9V/zM0WKHyeVrxea90Jq2bnJ0c/KyKQpigZlyJjHRa+N6wa+
 Hr/aWoCzC1t599cRI3v+lROegFbtmpv6IgC1XPPoW8UwUNZk7JY+wy0PLBLwyvaQaEg8xLE+WmM
 HN6C6+dAz9zhak70UZ/oGbaSTx5UhcO/SVeTOteIzaxSyGF/BSwxy+b3R/hfKk0ORfgzBLUxMEh
 aJMTnkAnYopE185qHVVsSd7zNktFrNBouS33h5HPi7DSi6+Qs3RFHwjI5D+6x/pdKa0UpCpk8ot
 KFEIUX8fyfloTZrs0gvzm336tjIiuJohOp9kh0z2+VJ8kTlxd0deYc8BpqPbQFAtNiortgQZvnK
 p+CWP1afNQhnCiliM1vaAutzd21oORxUBoRQD9s2auCRtUilOI26FPIi8ULQvPAgBEz23+vLVan
 j8qaYgqDZPJsEaQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Driver uses ARRAY_SIZE() to get number of widgets later passed to
snd_soc_dapm_new_controls(), which is an 'unsigned int'.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/lpass-rx-macro.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index 3d8149665439..bfcbfbe8b086 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -3611,8 +3611,8 @@ static int rx_macro_component_probe(struct snd_soc_component *component)
 	struct rx_macro *rx = snd_soc_component_get_drvdata(component);
 	const struct snd_soc_dapm_widget *widgets;
 	const struct snd_kcontrol_new *controls;
-	unsigned int num_controls;
-	int ret, num_widgets;
+	unsigned int num_controls, num_widgets;
+	int ret;
 
 	snd_soc_component_init_regmap(component, rx->regmap);
 

-- 
2.43.0


