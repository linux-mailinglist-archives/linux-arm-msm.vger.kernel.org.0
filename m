Return-Path: <linux-arm-msm+bounces-51195-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 892A1A5E458
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 20:27:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7A92B17BA78
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 19:27:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 761572594B4;
	Wed, 12 Mar 2025 19:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W3mltykU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C38B2257ACA
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Mar 2025 19:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741807658; cv=none; b=a037dd8FTEO6e7f/dlIhz68mAmRwTe4Zy6itrIkdKob11rqCIwjTU46THLdxLiSal/WZDOl70nikgnDohvkrK3Mp24V1KnI7TnTaENoJBcX1YajYqo2Bix7s4uF3yGSxscPm836GC4o/yj7LgphWWSVT0U7rZj1Fa13wbO6Lx9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741807658; c=relaxed/simple;
	bh=FKL/weB5CPeWneGPsiZ0VbwxQPs03W/Eqnc+Zbi9MsM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HUHhQNTuLJV6hfuTJqt6m4wtO+Uz1na7HO8J8yJ84BADhxVxuyBIgDK/FEqjILqC8XNjSNtqXPPkgkAgId+rkKtp2u4xJkZaFDMv0YuAG8dawoQJItW1q7QzLClz1XdB1vvyhxUHwnerHKw7hj+MYSaamgyPBhzzGY21ilplFTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W3mltykU; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cf861f936so206245e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Mar 2025 12:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741807654; x=1742412454; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5qbK7lmYRGi8wVIRtYM9Yu+84pO626UJc/Ub+6h4fj0=;
        b=W3mltykUTvkM/KyRQ/LxIpnNURuimCw4zne/kgt1XBdTTdX3RXc8HfKRSi6YNGgBUc
         E7L6ZUo5MKtKmuKIwX8iUhf4PvVxX7H1O5+evqVCA3gR/9NVuVNiCUiW0S0amWDkBPrf
         dJoFTXZ4Lg44H2Xi5fDz5C0H9QXaGZrEhUlnLb/kWeCbDCcBk7b5SP4+KE+ZFHiw4eyo
         qsBhzPq0aXvaXvRx1IDHTXzH0AbVN7F+j5xsoc1CN96/ieOybzqMfwJ7NEcUGWyFmCHx
         t4hP2iA1tsdR4IaorZyM2udlqPeeqKt9e7jOCZGf7rBCxGGXHRoipXjDUn5sqT7d5s1U
         ZPUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741807654; x=1742412454;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5qbK7lmYRGi8wVIRtYM9Yu+84pO626UJc/Ub+6h4fj0=;
        b=WeCErklzPxwWz7wj1nOYtxnGiQJgv0sD5L/jW4vzi7WlIu33hPA/llYnK5zQkxLlDz
         F+cIMSkDjHtDMJlhJPLoyT+4FXE/rEAjXamzGXy78PIDdyyNoqGxSCcwKErUn1Txl7nx
         66iX9jtQ9Smph47uNOwliWCdS0Rdw5/rVJn95y4vcybc7pGtyj9Ks+5LXIkEmzjFwAbR
         XnT/A/9cwJVqQUhIdYlu2VfJ9Npy0RHm1rg/gu+TB7L/Mr9aDUHjcwur/lyo/39gpv0B
         jWZwU28bza3uOPEUNb4JGn1BV0KuaC7RF2+diQtgKC525GP/F5A4XXQUv/LwucC//Zsq
         pZuw==
X-Forwarded-Encrypted: i=1; AJvYcCXNMgHNtOPbGsRTMe3097LaXgZ/yLZ5u8OhiGiQx9e6XgekVe4UWNhYX6MTs/Tp85PzJHzX+BlMEzGzvbiI@vger.kernel.org
X-Gm-Message-State: AOJu0YyM4NyuiHGY65Hmk0k8RqQ4+oMTPaMsuwr2Hn6glSAxlciKCtDh
	iBVmAd/koCo43Amfg8/srwV0GM5d9wIHmddzHbA5g/Wy37+QVVCOApmKov3TfuE=
X-Gm-Gg: ASbGncsuroSiQ80d7UsWzuS9TY6/aJCiRyIyKIA+EbQQoHfjAu1SayzdPJEKrUUmoq4
	j/m3lC4ZUEkVG+0uJr4U3utBqdgM8zhwy9+pIZRylKovG6TbpzMoC0p572juePQn7PObeb39hXo
	3P0esIFonccE3MG74e9FxCWOBYg0d6btQKeSbMUoG7JycBs6olhfWOzmSsfcWXQdsFWd7tSYv84
	Q9aKxMCXigFvk1LCBuYLUrMlMQDluZoyj3w59wjLWs6AurGzVwKQZjqy9B0K6BECpAo8KKjYirl
	szqbVFOmRG8UUm1kCdifrgBRGIu2Zd6QyUTzPe+q4U0CNFzYyUnVJmxlmes=
X-Google-Smtp-Source: AGHT+IFxBzA1CjBiytvmBHMoKUHzC09eJ11SY49j1nNlMfZkupbs5qfdSdty45s06t4JCu4IiJZMhQ==
X-Received: by 2002:a05:600c:5107:b0:43b:c844:a4ba with SMTP id 5b1f17b1804b1-43d01c12945mr37427075e9.3.1741807654092;
        Wed, 12 Mar 2025 12:27:34 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d0a7903fbsm29331995e9.32.2025.03.12.12.27.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 12:27:33 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 12 Mar 2025 20:24:59 +0100
Subject: [PATCH 1/2] ASoC: codecs: wsa883x: Correct VI sense channel mask
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250312-asoc-wsa88xx-visense-v1-1-9ca705881122@linaro.org>
References: <20250312-asoc-wsa88xx-visense-v1-0-9ca705881122@linaro.org>
In-Reply-To: <20250312-asoc-wsa88xx-visense-v1-0-9ca705881122@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=975;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=FKL/weB5CPeWneGPsiZ0VbwxQPs03W/Eqnc+Zbi9MsM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBn0eAh/LQoK52qOZjR6vj46xf8OTmRScxCMYReW
 EcB8rKjv9+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ9HgIQAKCRDBN2bmhouD
 1x/yD/9ksWN3WISxFG+1/n+g7hrVsU9+/hkl3RcDOUBH7L8fobh9sViifZ+wwB47z8g+TQZHu9U
 TDFSQv01YwbuGxG3y7iNLlIWN+nWgVkbY+HF6aJtPeLaHCCwdtDTmwmvrWFIUDL7Q1/O/h24yyj
 tJ2nE9mobn3O0ekv5kVuCVAQKMlAbZW5H2EYmyoU/Ii8oYsTRWe1dy0lT2uEDu5b/pGCKXyFTvh
 VfBR6tLGCjzJYtYQNdp94KPNqoGSh+ymH3nNNJ2EZgW5JSzGv32qSi2hQ70lD0qF3S+TjC+rx6c
 LsoCw/UBYYM275w8JE5vDLbqXLExxV4en/Hj2wJJcpNWSvI9qf0lr8wF7IvHrBPa60ADWwGw6+z
 cbI0X6UBuarq2S4ueeOwK8uDpXRycLLkoYdXkv1jtdQn9pv+dDyriHByVqTwN/8kz0MdCkUaH8Y
 QlZDK8BfPwZvDfVE0UzZ6qAnF46xOlbdB2J/yzsdt3s9NdOWjmjyBFbVhS+7jgnpMUandPZAtvU
 +Fbg3TBkp61qMISvb6MOuMmnJXfdJB5JpBQwI2CuLW7r99zN9fPOnj7J+bseOmn3HUZEyBT2Vlw
 +zRoxOECSunwhCMpVn5ROsJhQJ7EK2XTZbu3qFqV/MC21ZWhd+ScF+Wir2fxPB4BkCEkDkak6CN
 YO6Zsp3q2DhFjJA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

VI sense port on WSA883x speaker takes only one channel, so use 0x1 as
channel mask.  This fixes garbage being recorded by the speaker when
testing the VI sense feedback path.

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Srini,
I cannot get 0x3 as channel mask working, but I think it was fine in
your case?
---
 sound/soc/codecs/wsa883x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wsa883x.c b/sound/soc/codecs/wsa883x.c
index a5a6cb90bb43c83de2b498f163d23c52f164ecb9..238ddf0aac3b28f2d0d8b08a069aa2dadea01ff1 100644
--- a/sound/soc/codecs/wsa883x.c
+++ b/sound/soc/codecs/wsa883x.c
@@ -568,7 +568,7 @@ static const struct sdw_port_config wsa883x_pconfig[WSA883X_MAX_SWR_PORTS] = {
 	},
 	[WSA883X_PORT_VISENSE] = {
 		.num = WSA883X_PORT_VISENSE + 1,
-		.ch_mask = 0x3,
+		.ch_mask = 0x1,
 	},
 };
 

-- 
2.43.0


