Return-Path: <linux-arm-msm+bounces-59740-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6387BAC71E3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 22:05:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4E9261C04607
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 20:00:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5D9C22128A;
	Wed, 28 May 2025 20:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EcqMzV7b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E76221264
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 20:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748462414; cv=none; b=UCZWPUzNIZuHh0/JD0g8sRb/1osWSh8NKcW6sw3WmzUJetPnWziEQaMcnr/1UlpgP4ifKFMVoiy1pewuQzC+o7u3NOcxt8u0cP10Dxl+Sr3PhToHpgxEMDdAQD5rdUj/U9RtiHqDujytjWWaDXzdkc0Uh5fQFsBw1p1w0qkzQkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748462414; c=relaxed/simple;
	bh=CpYH823lP1gANgxKRTCYkC1iXZwcMTKwp/L88jc6Xws=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=csNO68V7osu3Lp0EjGG8GV3F5nAjYOy27D8S53XcrpUapUbhe2PKv2an+BagM2qFMYMEjFC5twjygjC978oZGy7wlGyTf3QzBeFSkUv8vfT1Yrw/+zLnLfdtO4Y/Wm9CMiaylTVYxKbMw9IJcH39elP44hbTpmHddoUOaP0LC98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EcqMzV7b; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-442e9c7cf0eso39775e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 13:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748462411; x=1749067211; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PDq0VVP4RBrXESa/PJeathjlPVt4SwgrUucxImBu+7c=;
        b=EcqMzV7bAeJT1vV4xfnJLSrs9E0OwVyz9EWvG/WxeBZCx33Lbehwn+dOvpGxdUVaU1
         OdJxlOX3FWh2ZryuF29StlKMQZ5l2c/s8QZf9c90NHm2v1z5ztyvgnwrns+9K9Jci++O
         zc15aX+dn0JOiLhvayOmBDaE3/DcnI8Xy+21Q/WPYDHimpeSpG5KuBoI/kJiJ+sp90X1
         JXGuKdYrN11aBForg3OicMNIy5u9CuyadSAyxgMajcVLUqP2DaYrYsKnUOFS7uNjtrJ9
         LNY1epowm5W+jaPf5VWa4vQVffTMgQ+R9VIZMSGAWsgSjUu0e9L6zBbkBOMf3OxfWSh0
         Wn8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748462411; x=1749067211;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PDq0VVP4RBrXESa/PJeathjlPVt4SwgrUucxImBu+7c=;
        b=QRfrIXMEYsClL9EDw+6uQag2A3tB04iA+6GBjJ7iNG0WbEzx2Jk7JDxNLeBdYCye2A
         zwN/QatqFqXLUqZ1eOBuT2QgmTvN6sTvEzc+/j0+EvaxGFRftqZ6iiWLEDYLkdbHVwOR
         t1bpNnEwnB97oSnqou4Ht5A/CcatweAvUy8iFNeESnm7KLdRCYZBdgCmCf5Mzlow2QB+
         Xkie4/FX1Si17lLS+LKEMelKh6Tikr5QKYY9ThZiQvFhkFLaiNXzMxaEgdqN9sX3bTWE
         JNZYr9xudia5VtFksbaaqWVxG3eOfZMtG7fC1uXjy2aj9CT72Eu0QJpvXnZMfXaVFl+M
         1KFg==
X-Forwarded-Encrypted: i=1; AJvYcCU1BkVvd0W1wOiQkalhoI7e5mZPiejhFLarWjx7tsnNoXVpNDcmColcN2l6Bxc0tHUAYgAmRke5rBFrNM40@vger.kernel.org
X-Gm-Message-State: AOJu0YwhmDmP28hoJSzSyPaWT17oudxACh9ifQxniQH8XsSGesukOUts
	5gocdL5lqDXFJWY0Y+yESVxlHB/RUh3wxjRZSVN9jw40oW5CWQJ2dJb68b/M/TSiPN1vm2qYG6+
	6jztu
X-Gm-Gg: ASbGncuLrleSlBwDFjOVkOjNej9c4DLzQUKT16y6o00kk87aXSxhI/xnbUNEamCodmZ
	DJuqlWfKYHd6+YnOKAYokFnTKmlOV+3ZBZOa+zIyfXAJmiNbVg3R2sSOXYZ4k2e50PW0EEWcTMO
	HSoLmTwXyvd8E0wp2RQFQtZldp9g/79N9vzE4MCzmHpeDK/V25ivPpGRuHCiWw1E/Ql7IspW5//
	+fm7VYP7etEtCB2m0Os2qyH3LuqbTPQbtvllrqbHhzjgRFbCaY3IUM1Z7orjuhb9je4nxy7Ge7t
	Pq17qw1iORTvFerLffv9RJhWMtqhOjgLlRAql0WRnLy+hWFMClIFx9xfigAIRXNa0sXNfNLOSZ7
	YHUvPsQ==
X-Google-Smtp-Source: AGHT+IHZUGUK6yTkOMly/UTCf5TfkRX+RuLMJ+zm0TaswuyyY5q5bbmG4zBXo05PBD4iH1y4pl+NdQ==
X-Received: by 2002:a05:600c:4752:b0:441:b397:e324 with SMTP id 5b1f17b1804b1-44c93caeb6amr61901665e9.9.1748462410755;
        Wed, 28 May 2025 13:00:10 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-44fcbd61553sm53347665e9.0.2025.05.28.13.00.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 13:00:10 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 28 May 2025 21:59:56 +0200
Subject: [PATCH 2/8] ASoC: fsl: Constify reg_default array
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250528-asoc-const-unused-v1-2-19a5d07b9d5c@linaro.org>
References: <20250528-asoc-const-unused-v1-0-19a5d07b9d5c@linaro.org>
In-Reply-To: <20250528-asoc-const-unused-v1-0-19a5d07b9d5c@linaro.org>
To: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Support Opensource <support.opensource@diasemi.com>, 
 Oder Chiou <oder_chiou@realtek.com>, Srinivas Kandagatla <srini@kernel.org>, 
 Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>
Cc: linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1754;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=CpYH823lP1gANgxKRTCYkC1iXZwcMTKwp/L88jc6Xws=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoN2s+XsqS9sFfoi0z9c+1UBE4EIIisHahFoDdV
 IQAKD8fYDSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaDdrPgAKCRDBN2bmhouD
 14HkEACFdeeKCanwIs9cv17+UMezTLZWq0x8/jrTebWUBqQqWOfNZFxDU6WjQcbXZ7dXF5S8wQ4
 7bLJBjpg/DGuUc+eS4RBF2PEZ6NX2WBqzoXpwQqGh5IU8mjJoaqnNFYzOQandX1OW//JzbLGrGO
 YFprEji4Oid03TG7/AgU/DvnN4+g+/8BtNMeq1G+VklfGrQKT49hUMNnST2geP66RYQwpi77ogY
 2s+J3a1eRLYcA04uRF54ZJyA2FLE6SMIm6kwzLmwGliMUbqO6w3bRbbwMTdizD3zn3aBPEEZtpG
 ++ayreX9g0cV5IzOIFqbVfycaLLHom3iO7dy3K4L8Pqz4Ozx5YGewOHbcb3G0kllU6sxYLgfkDX
 tXro/sl120J1X55bh9T2FwBWVNQuFhi6V8REO7tRcZj/cYwyfXrq3tbAWfH+/iUTKX7dFXCWIk4
 BafMN7HfrnzbHhhm0m4SrH57UsvnoLA9ZZhao+zwe5EerO0Wb0TKL7tgV3g1I/VdWKCRyHn9wM9
 jUvYBzaZqnoxLhtU0JcSwfNjwz5TKbJo0TnrJq35lqZOw+zKvpHlx7hqUiSyr088rslYMHZJXp6
 2RAFQfgHUZhqSe2i8GfEeRoanO/1RWmQOD3NOHWI1RbMqJObKGTgBWW3+LYWY5ssXczSr3oHcfu
 3MvwM/3z7gf87DQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Static 'struct reg_default' array is not modified so can be changed to
const for more safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/fsl/fsl_asrc.c | 2 +-
 sound/soc/fsl/fsl_sai.c  | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
index 677529916dc0e53a15952c53016930203c56dc9d..637260f306ecab109ed23b92a882cffce1c65421 100644
--- a/sound/soc/fsl/fsl_asrc.c
+++ b/sound/soc/fsl/fsl_asrc.c
@@ -930,7 +930,7 @@ static bool fsl_asrc_writeable_reg(struct device *dev, unsigned int reg)
 	}
 }
 
-static struct reg_default fsl_asrc_reg[] = {
+static const struct reg_default fsl_asrc_reg[] = {
 	{ REG_ASRCTR, 0x0000 }, { REG_ASRIER, 0x0000 },
 	{ REG_ASRCNCR, 0x0000 }, { REG_ASRCFG, 0x0000 },
 	{ REG_ASRCSR, 0x0000 }, { REG_ASRCDR1, 0x0000 },
diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index af1a168d35e379e24ce46715ba53b4a4dac65988..c84e3bb1290fd1188118b220adeb4f8e279a3372 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -1059,7 +1059,7 @@ static const struct snd_soc_component_driver fsl_component = {
 	.legacy_dai_naming	= 1,
 };
 
-static struct reg_default fsl_sai_reg_defaults_ofs0[] = {
+static const struct reg_default fsl_sai_reg_defaults_ofs0[] = {
 	{FSL_SAI_TCR1(0), 0},
 	{FSL_SAI_TCR2(0), 0},
 	{FSL_SAI_TCR3(0), 0},
@@ -1082,7 +1082,7 @@ static struct reg_default fsl_sai_reg_defaults_ofs0[] = {
 	{FSL_SAI_RMR, 0},
 };
 
-static struct reg_default fsl_sai_reg_defaults_ofs8[] = {
+static const struct reg_default fsl_sai_reg_defaults_ofs8[] = {
 	{FSL_SAI_TCR1(8), 0},
 	{FSL_SAI_TCR2(8), 0},
 	{FSL_SAI_TCR3(8), 0},

-- 
2.45.2


