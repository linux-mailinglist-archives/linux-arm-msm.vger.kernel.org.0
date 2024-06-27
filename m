Return-Path: <linux-arm-msm+bounces-24500-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D5091AB35
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 17:26:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DCC8728A96C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 15:26:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7661C198E89;
	Thu, 27 Jun 2024 15:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PbUwnP7O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A481C199228
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jun 2024 15:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719501836; cv=none; b=sIy4KLxP6DwxhX0LP+vCiwczd9WZRlD9XgHyZCemV0jwKNMN9YEjL1zgyDkXSTOzUxkLuqrh4elWiV8406GDvA9/62BFsmIYsr+gcjuY0lgFuWYwHxgCtR4f2Kymw2mVLXUMwikX6kHUa5Eqobws8NQHLjpdUGb29+wsmPfGz9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719501836; c=relaxed/simple;
	bh=aBdsa363wYorx7OqK8Nq8RDf9xf/aTP7aoUD8NTcA04=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EB8t1aKfju2QACLfd8ZQFQA32pehDWX5VxDADKD8iqG1aAktasv+FStDp4YJCXMCLEEWN7oZbOr9TSlbCIKA9LOCsHKOgCC+I1I2Y8OzmAE6GdhNY8RA5kH4/27Iy/NilyFe66day0xy4pW6yk2gwOT61vgniQzSvFgwGrmeBKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PbUwnP7O; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-42565697036so4868055e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jun 2024 08:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719501833; x=1720106633; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z+Qye23XNNbt3oIc75EavUvJnN6rEV1YtqVZ+ai5H9w=;
        b=PbUwnP7OdGv6EQQjfdCnR1Sii9pV7BAgleXyDcbAO0LXZhEYQoFMQ5frZH/IXYgoJ8
         NlHqMjQ1qLYdSyjRiggs2e64Ef0N3Kru3iPOozcCClItpKcJOU7s4vHGGZ1dLBhi1nZ9
         mUH2ZjwqtRTn6++LQM/j30vAwXMog32mhexMcoReuF1T9E5m1AknwqkYJCKqaqx78nJm
         uZlYzyC87oC/XlZ626V+lzXM/1zJQrI1oUoZfgs9LiH/vZOLwHDMgsngTUv8OBcCVRB7
         zRxFVqGQ0MsCHjfSj+L4eQemzBUW4myDxvVo5V1MbEZNmDaRgnkLt8qJi/Y9hyqBb4gF
         w2Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719501833; x=1720106633;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z+Qye23XNNbt3oIc75EavUvJnN6rEV1YtqVZ+ai5H9w=;
        b=LHa6mvgMVJsFaju+oDywYO7eJ/UDO4VC4hiL68fh130rI3SmZxLdK8u0bhtmKcl2Wj
         FLUmmWkCPIGowYknttJJKt638kywCRBZxKDjmHQM3jrgoojZQ/K8PaodpwoyQLqj/jCo
         yJIHCqYmx0fxFYIYiqySsQi8xJlBl32iTHp6jAFYifYIR1+4mjp7jZhMbuwD3blKF2Xl
         dnVqMR6611xp1oV/iaXOP+OBrgmY8wj02IyAKPPiCibYblWY0vQeFu2HkPYieTzl8i4+
         yKGGqPx8LYU8HpHDgrHZrC+tYvh6iQNQG39ZXpdNEn+2WuL8np87NaInI44qLcBLgni+
         qO8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWxTOiJL+Bn6aovP4eN8PAudZ4K92rHEErWnHVziHCybHfIvKNwGE6NOsRS1gnRbHwNaD6i/Z6+M55GL1px9vf+WmttZD3eMPGca0ZZ/A==
X-Gm-Message-State: AOJu0YwyXNqwjr5o8i/J+eLlVE1PHPR+9E/cNE+gL9K37Qn1Idu2tcVp
	i0cIBA+WR67rhY9hM3duIcYjgWURnLhCbn1drY4iPkOPq3TtU77EGfnWUbN68I0=
X-Google-Smtp-Source: AGHT+IEbhmY2QIczH1le+6f1QjH9zMOlmpjfYaMsVN+8XQHIvad2N1tVs+Oa3zO8On+XqmYI5s4aEw==
X-Received: by 2002:a05:600c:3c8b:b0:424:8a34:9890 with SMTP id 5b1f17b1804b1-4256450c71cmr23818275e9.7.1719501833143;
        Thu, 27 Jun 2024 08:23:53 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42564bb59b7sm32783185e9.34.2024.06.27.08.23.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 08:23:52 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 27 Jun 2024 17:23:45 +0200
Subject: [PATCH 3/4] ASoC: dapm: Use unsigned for number of widgets in
 snd_soc_dapm_new_controls()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240627-b4-qcom-audio-lpass-codec-cleanups-v1-3-ede31891d238@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1586;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=aBdsa363wYorx7OqK8Nq8RDf9xf/aTP7aoUD8NTcA04=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmfYQC2DaMhs+zDgAaWx2Kzj30we//VkAvaxY8i
 WfJkJ5viuOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZn2EAgAKCRDBN2bmhouD
 1z6GD/93ndHokDVXfI34SLvxVyQePq57WTmIum2zcV1FB4uydLnPOanizt/2hF+tlqvJ7hfpG0X
 cQDCkUvB6uFUTlDKz0hwjnkFknvQHlwXopBbmk6x8G38HyRPrgF18YWhcQxLl+hoB/nyTFzoW9B
 VfS8Cgr5LU1YNElJ1agEmd4kpewhiCflZ7yJ9lJJb9g/HiW7dwOR+X09UNi7OgmQ0DkutH+qRha
 b5S0uRxDQ0JRMdE0o8PZryhVfyVfEqYbn4YCuBiTYgMqcFENyhqda31Pt0wNgmjXgdfvRsCcWf5
 eq3QJ10MJ5wVXNLPYtu3B4lh/35ZulFxNG3ciTRxBMkJhI7D+o1SATbtN+0Rt5ERFStCc4mz8+0
 XZGt8sUVcG0Y458AHWuviebgAd3+6x/Xq6BhAK/MiJeT1X20wtFfXtPAXOqRKONEAdTlip+Cl4t
 4BY5/5URrVRz+GqeiTN4MWDnW5MbKXZ5XIgLmjZmu54QxPdH6UFQtsT+PbitrZp4y9Pjo/C7UNB
 w1DzVlmS7ukcP/DlQtuvwQeoEqAUqcoERhSZWTAC0rqed91oWvcbq7D90NGWgqeNz/+1atwP34t
 F5osG8x7tGBQjbnCXtiRk7XgTM1FR6Nhx7otPlcy9TVeNPgfQP62/lMDheoaFyhdEKNEduUnXKp
 /PswNYJwN2P+U2A==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Number of widgets in array passed to snd_soc_dapm_new_controls() cannot
be negative, so make it explicit by using 'unsigned int', just like
snd_soc_add_component_controls() is doing.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 include/sound/soc-dapm.h | 2 +-
 sound/soc/soc-dapm.c     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/sound/soc-dapm.h b/include/sound/soc-dapm.h
index 667ecd4daa68..12cd7b5a2202 100644
--- a/include/sound/soc-dapm.h
+++ b/include/sound/soc-dapm.h
@@ -457,7 +457,7 @@ int snd_soc_dapm_get_pin_switch(struct snd_kcontrol *kcontrol,
 int snd_soc_dapm_put_pin_switch(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *uncontrol);
 int snd_soc_dapm_new_controls(struct snd_soc_dapm_context *dapm,
-	const struct snd_soc_dapm_widget *widget, int num);
+	const struct snd_soc_dapm_widget *widget, unsigned int num);
 struct snd_soc_dapm_widget *snd_soc_dapm_new_control(struct snd_soc_dapm_context *dapm,
 		const struct snd_soc_dapm_widget *widget);
 struct snd_soc_dapm_widget *snd_soc_dapm_new_control_unlocked(struct snd_soc_dapm_context *dapm,
diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 16dad4a45443..32cc90d09bc2 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -3857,7 +3857,7 @@ EXPORT_SYMBOL_GPL(snd_soc_dapm_new_control);
  */
 int snd_soc_dapm_new_controls(struct snd_soc_dapm_context *dapm,
 	const struct snd_soc_dapm_widget *widget,
-	int num)
+	unsigned int num)
 {
 	int i;
 	int ret = 0;

-- 
2.43.0


