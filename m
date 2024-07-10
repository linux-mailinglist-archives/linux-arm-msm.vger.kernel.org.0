Return-Path: <linux-arm-msm+bounces-25853-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D21CE92D373
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jul 2024 15:53:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8E225284D6D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jul 2024 13:53:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6583A1946AE;
	Wed, 10 Jul 2024 13:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XHcxNJ/j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B371940B5
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jul 2024 13:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720619570; cv=none; b=Q39ZZ9XfNxy2XiYO79JOSS2jF+x2tJmiajTNjR08Jtp0YC2OAQPsXZEbVK1RLn/ygWk6Va5XfiNx1D9YQYic2Es3ti6bK6aPqW5qSBkVTfVgmSW/pvTD/K1QbKMiKE8cdZg2wfHiUJukgbjw3t3jdIRMwoBRjfNFf7sR62xEk1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720619570; c=relaxed/simple;
	bh=WB7TReeuz9p2xJwiha6GQMNAWLN4DRCFhtae1ITPqrU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Nl8TSFSynXrQQMUwdiUpbmJaMVTff1FiIyWNbPpO1xdWU9H3KEFs2d00t6X0Ml9NVRCEjYnut1EBy5F5nk6N5VUtYSsaMSnj+pb/ZYiBqHvU603pjbyWvWVi5MF8Boqb31/q/Lo5kQwVqLkXuKZdeeIbyNNODGbe0wf25awKiNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XHcxNJ/j; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a77c080b521so732273466b.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jul 2024 06:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720619566; x=1721224366; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4OC8QeR0kGY9dWOXLH/zkl7I9eWhOVZEAFq6fczOPCU=;
        b=XHcxNJ/jGQnIGOKGtbyafjR0XuYMxxUhrsXsXHrj8sTuqoIatJErgNSKBLF8hy2pTq
         vgENq3VtA1SuMUx7ck0/b6cvbqLggzOudGnnm8Y8sSz7NCureGszQWLa4vB0ygZBo6tP
         gcf/ogn/j/BrOgS3oTHF1upUsS3Imj2VLKz2DO4qRj4koBWgEpOn20Q2c1T+mKglOEDK
         sK44IgMhhT4lEdni2UowTqNjhpFc1pLCHShRvPFCNZBr5vd4LhWJOsNKq9vypdnV6VRN
         ts8OYBnZkeLGICScjc0UK88wzNi6GxWtZIlNkuo/oG1ObFp6Yptt6O0mtIPwQdZ8oFul
         hpoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720619566; x=1721224366;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4OC8QeR0kGY9dWOXLH/zkl7I9eWhOVZEAFq6fczOPCU=;
        b=q3ttZZYRcUf4aGAzV8HlryPqq14Jvoy6H/JxoRIzRW3TMJ5tMqUc4EEdWI9kl0oy/d
         wIGRPsNb0WQChjwG3t/kv1QBMelTHw9qTSIECkG/wu3MlxwL8xDJORuISVr5emGm4YT1
         KtlaPmqxVqbj8bO35Guyh+76FHkGg19lHHW3RW0TV/aLwv69ek1yvMywBVVpuGj0bxGD
         LofqFKZaHjOGogrm5pDKlZD6VDPKQWvjlW/+6V45/lLe0Mi4PdQ5sZXJqA5BqQZYihN5
         iU9FEhfEpJbxTrSo2UseWbp+dJYTPMla5Vi7AKc8HOTBKtcz9bqgKR4cUAtks8VgzGq1
         ShyA==
X-Forwarded-Encrypted: i=1; AJvYcCVG17Dt1sqZuL9lGEVhhItYijUwlxHP8COy0yRx56Nadf7AZ0CWDWj1tqRSK/OjsgGrhfqcZlUjqGlzeb0ky70zFmwog/XUxTeaRQfmoQ==
X-Gm-Message-State: AOJu0YztH09tNPypX5pGF5lj1s+3cab2CDAM9QTNcqtEbkIrIDmojIpw
	hEo27tRwBJwxZGZbItQQ4R6YplYm5ykJ0tYIZggfuW0dsncgJEvdjmXNCqay1wQcuCjI0CkyhMx
	6
X-Google-Smtp-Source: AGHT+IHgtY+jl1RRnFIQyLNJ97fWPscsE9ZarFQHgaMGp518nrfXgsChqvgkK2KRYnMJVo21PLAlww==
X-Received: by 2002:a17:906:40e:b0:a77:c824:b4c5 with SMTP id a640c23a62f3a-a780b6b18ccmr394586466b.18.1720619566685;
        Wed, 10 Jul 2024 06:52:46 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a780a8551afsm160440366b.166.2024.07.10.06.52.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 06:52:46 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 10 Jul 2024 15:52:33 +0200
Subject: [PATCH 4/4] ASoC: codecs: wsa884x: Simplify handling variant
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240710-asoc-wsa88xx-version-v1-4-f1c54966ccde@linaro.org>
References: <20240710-asoc-wsa88xx-version-v1-0-f1c54966ccde@linaro.org>
In-Reply-To: <20240710-asoc-wsa88xx-version-v1-0-f1c54966ccde@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1636;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=WB7TReeuz9p2xJwiha6GQMNAWLN4DRCFhtae1ITPqrU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmjpIm7n6j5rSUbIfZVj7o449ncopexzUhu5/AH
 QhMa+YOvCOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZo6SJgAKCRDBN2bmhouD
 14ApEACN2oL1zIaMFQ6Ucxm9eW4neIeeG+DeSn0dTmGO/kaA7yYrMtBe2eKxURAmT+3Ijv1mPxY
 +P3cezRBgIYmjOZB9h1HC5sVa03qi8uxDTWEt/bS4Cv6MgiLCcO6PPDQ6x1soaa84/UnJTqhhQt
 O72gTTfh43MgNod0IdVxZwzKGSnszys0xnz8cFfV63ufqG15yAxEIxE7ZAY36AMD9X+9FiLZI/S
 uWJaUEikPGXGqgx+Wprq3XuRsfY2GiC0IrrUQ5WywC5tLMtT/mBusRx5qCGw6WFB1gzYq1n5RDP
 1Kgz+3i8DrXB82SmohXpH7+qct5J1JZr4hgdwQj4EwrCBLTP92RSUTtFdiYgIRvrxzTTr8xm72U
 mC++PSeRb3/5oW36Z0CODwjstoWljyXx2J0avKPzA4Ks+KSRX5CtrUPGmDABiK9lkphYDP8rKDd
 q1rOAebtS1VNdlqBMRpFxDm9xPpt7/scouggv/f5IJotxnzBK7nhm+WvcHUTfy323HcaGQLYhOJ
 sEcQ4B6nRfoHs89zpeu5NorK8TpaGtSxDr+1rClWFFSacX6/DlTqoU+vDvUi6XT4h24KTmrCcBm
 yvb8RG3sWBUu8KXRGmEPF4od0ljjHUy8mb/lHM4UONia/GzRWn6w7MT3t/OyIgDVCFrYcX5HeAd
 Ywz3QTiBnCWhrVg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Driver does not use detected variant variable past the init function, so
do not store it in the state container structure.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/wsa884x.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/wsa884x.c b/sound/soc/codecs/wsa884x.c
index a6034547b4f3..7b19df9c1728 100644
--- a/sound/soc/codecs/wsa884x.c
+++ b/sound/soc/codecs/wsa884x.c
@@ -703,7 +703,6 @@ struct wsa884x_priv {
 	struct reset_control *sd_reset;
 	bool port_prepared[WSA884X_MAX_SWR_PORTS];
 	bool port_enable[WSA884X_MAX_SWR_PORTS];
-	unsigned int variant;
 	int active_ports;
 	int dev_mode;
 	bool hw_init;
@@ -1465,7 +1464,7 @@ static void wsa884x_init(struct wsa884x_priv *wsa884x)
 	unsigned int variant = 0;
 
 	if (!regmap_read(wsa884x->regmap, WSA884X_OTP_REG_0, &variant))
-		wsa884x->variant = variant & WSA884X_OTP_REG_0_ID_MASK;
+		variant = variant & WSA884X_OTP_REG_0_ID_MASK;
 
 	regmap_multi_reg_write(wsa884x->regmap, wsa884x_reg_init,
 			       ARRAY_SIZE(wsa884x_reg_init));
@@ -1474,7 +1473,7 @@ static void wsa884x_init(struct wsa884x_priv *wsa884x)
 	wo_ctl_0 |= FIELD_PREP(WSA884X_ANA_WO_CTL_0_DAC_CM_CLAMP_EN_MASK,
 			       WSA884X_ANA_WO_CTL_0_DAC_CM_CLAMP_EN_MODE_SPEAKER);
 	/* Assume that compander is enabled by default unless it is haptics sku */
-	if (wsa884x->variant == WSA884X_OTP_ID_WSA8845H)
+	if (variant == WSA884X_OTP_ID_WSA8845H)
 		wo_ctl_0 |= FIELD_PREP(WSA884X_ANA_WO_CTL_0_PA_AUX_GAIN_MASK,
 				       WSA884X_ANA_WO_CTL_0_PA_AUX_18_DB);
 	else

-- 
2.43.0


