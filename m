Return-Path: <linux-arm-msm+bounces-55841-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E42A9E284
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Apr 2025 12:51:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C36643ADCA1
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Apr 2025 10:51:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 942502517B8;
	Sun, 27 Apr 2025 10:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l1NFKSuT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D34524E00D
	for <linux-arm-msm@vger.kernel.org>; Sun, 27 Apr 2025 10:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745751085; cv=none; b=pD/f0vbpNIh6K0XZuZxSQy0ftUPsWXR6AOAhvh23jDZDWwWxdLh801Kvpy60rLizozDzEBw3ppJsC3fntBEyXHpRHabQjQ2Y1Ej93rlfb1gXFXb/5tMUDVkvhVUXSFHN4Qo7xtQEE0UwvKZzH1cbneDSy76pisBXUUNZDbk9eS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745751085; c=relaxed/simple;
	bh=Uk35tE2qO25Ol/DPpUFiuym8i93OvRDohaSn1NmlUNU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WToZtkUOgN3qPDSx8N2HTR2AWJdZn35TS4oLLrH/6f66Qp3JVfSeZxRp0rfoM4CpsQAuxKJ4/41SHCFbFgaOQAvoZznYSEYbXog+w5bFjqbYL93OQHR1Q7y52aa3OF6Kv7FX96Cb8oC0vkBWkwA2neO2pNSNtH9QEKvueF6db7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=l1NFKSuT; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5edc468a7daso610209a12.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Apr 2025 03:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745751080; x=1746355880; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BrWWKZ5utl0kO8/6Sgtpal0J9i01h1Iy5zytxjONv8g=;
        b=l1NFKSuTSk4ij0SE2W2LPU72+EQw1ILVnaoIizHa8cyYWo1HZfzWFho4mUX62qKpFB
         HClr7nULiPTRVIN4LRe8Q8mpTwNV/5MPibFE2AM8z7u3PHj5MSey6IreruP9ly6P0NvP
         YHGvmcpact7SlmCCAQ5Bbzp0n0Q2rXQAcmuQ3AVeUpv/lrTWFa4aEb+ZyNOOGBT54UIQ
         x06iw2WGPGiiija0tivmcV0hQZfEvFOZALWOPXFCNGCuDkIIg9Um+XzWDFSAp3HDv0nB
         Dqkl5RiB/nErljTR+kOlhJ2xF/93Dh+2a2Ru5NPYO+5iml4LDzhTuZf5CLZayrN341Od
         dgfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745751080; x=1746355880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BrWWKZ5utl0kO8/6Sgtpal0J9i01h1Iy5zytxjONv8g=;
        b=O7pjLjDdWR1NmhqNfqLcq5bMBWTUM5uGzHwMzrxE63HYx36YmXSXQmMjwB2/rSX2yv
         BL/IYBodPZLVCxP/Fc11eoXR9JHwRDhhZUxQ9+TNMiHyYZN/lddTl7mFYvvQ2z1xX1fJ
         4CBgu/vetWbUZOfg0ZW3CLKnB1bI4DXV5czKyLHU+0iJqPQWHilJ1d9jHsX8ZF1kRhh6
         fDkalh2spiTenvsqtzl5c9Y/Xs2zD7a612aug7TwrpHxP+wrfkLC3TmDCV8BP5Pu4f1f
         Tj7q3TR2JvkaaSCA3cF8Z70LJhsZGctN/OoDd81tFtCcs4/KPj1hoZEovo/I5SiPKqcP
         Vf0g==
X-Forwarded-Encrypted: i=1; AJvYcCXPt/hNHaO6Ho/Hi932BLCnftqSLRRM8BYatxUxm8bTzrxffqHDGi2G96e/8bpEQKl0eQdJ8tSxaLW38tCN@vger.kernel.org
X-Gm-Message-State: AOJu0YyocuZUbMcwUEnIjMv++wx23hDGlCmSiJHxP2mFPM+yF3JcCA/I
	N+ZjvzTn22z3V1HwO8wuOadYRWmRuUc5k3kSMjdln7F0dj63/GcruqEw4uyxq/k=
X-Gm-Gg: ASbGncuOs1Xe10hwJ13StNWb5+AqHfw4MJcfP/Ta3/eID5Jjh5vMxoJlnAFNL6GWHo3
	qB1yY9VlmErTGjDZ49fpT61sOR2Id2PdDsWtGzYxBNL+5Ms8N0aIRb4AAdGWGCbIDj6MZt5bmmz
	ocSTWIbK8p/UPG+UUvjEw0dzU9Am0lEjvGSmpW+sOVp8sbaKB/DDejRDLW2cUsWIBPdRQ+0D6BM
	BXDzicAdwNLUgq7+1+1XakJvSBh0imRFgOk4L9ZmkitAiDZ5YyCMRYOFo6p63m+on3oAFStfvqd
	MrHYvlG+y7i4zniO9XvJM7evKos7Kl43tV8HlvRwKmHXFQ6d7Q==
X-Google-Smtp-Source: AGHT+IGUXQAnom5Q0EWJSItpVLYLtZk6UF1nj50XD++JXpYgnBPgROhaxvz7NIhI7DF5oF4HYgfXrQ==
X-Received: by 2002:a17:907:948a:b0:acb:6081:1507 with SMTP id a640c23a62f3a-ace713655c2mr240652566b.10.1745751080157;
        Sun, 27 Apr 2025 03:51:20 -0700 (PDT)
Received: from kuoka.. ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e5087e4sm425679266b.73.2025.04.27.03.51.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 03:51:19 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	llvm@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] ASoC: codecs: tas2764: Fix Wvoid-pointer-to-enum-cast warning
Date: Sun, 27 Apr 2025 12:51:07 +0200
Message-ID: <20250427105105.18164-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250427105105.18164-3-krzysztof.kozlowski@linaro.org>
References: <20250427105105.18164-3-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1222; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=Uk35tE2qO25Ol/DPpUFiuym8i93OvRDohaSn1NmlUNU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoDgwchoqo8qZ7tpRlydSzbLL5LHIcT5imcAQdh
 lmBJlaYMa+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaA4MHAAKCRDBN2bmhouD
 1zBvD/wMLwsj4jm0yAIY7dk4aMpXOmJG+Ltq3m/n8p9kRV5iNva1LvWrKSCPnUds8dCcXnYROgi
 MdUdgEsBa3kdCGUeRv5EUhyEM41jnBvWxl0z/ipgl3va5F0xZVRhRrUuegXkpQAJ37X0Zt56WYA
 9C4SZ91I3zR0K1s0nOGPg2SHv0eBt+ApXW1GVR366AB57TvkfnhPqLIHZ0lDxhXh+cBzCxKfSp4
 aGe1+NBUSQFDKg9MJWdP7yKsTRX0IHu5E4FKkRyiuti/uG/FfWg6kwDUt4J83lfm8RqB5Ne059A
 CLTJbHpxZAXMiyDZXcVph717ix3+L80SFy7RhGmgMZM+2BGGZA9FoHx5f5XbM8aWDENRp6L1rmi
 2acaOSY0QMJMXNmzgFwYKYvqNynMyqvRbdK1L5h0RNNKbsGE9lWFAgw21fCgujLpMvLvMxOg0Yx
 qG9unLzCUNU0Tqx+iMmypnYGVRVVI2wOj3/4mS+5AoElwxqiCDbX9KORuEEDXZwasur1m4/PzXg
 /3EQj1gkjSppcgSoDL3SLJh4yBvHJqyCme+JL7S7uhLCJiTh4bkPY+HUTwGe3T1xFyygKh08oVI
 0hTawH5Kve+sJPrul3RpSqYjNRzrtBhBeZwf40omUAdndG/ohII/3jUgIwsdw681nAZHnZkJzu9 9eJJWWpVw+haFVA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

'devid' is an enum, thus cast of pointer on 64-bit compile test with
clang and W=1 causes:

  tas2764.c:879:19: error: cast to smaller integer type 'enum tas2764_devid' from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]

One of the discussions in 2023 on LKML suggested warning is not suitable
for kernel.  Nothing changed in this regard for more than a year, so
assume the warning will stay and we want to have warnings-free builds.

Link: https://lore.kernel.org/all/20230814160457.GA2836@dev-arch.thelio-3990X/
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/tas2764.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tas2764.c b/sound/soc/codecs/tas2764.c
index 97968ee3af42..36e25e48b354 100644
--- a/sound/soc/codecs/tas2764.c
+++ b/sound/soc/codecs/tas2764.c
@@ -876,7 +876,7 @@ static int tas2764_i2c_probe(struct i2c_client *client)
 	if (!tas2764)
 		return -ENOMEM;
 
-	tas2764->devid = (enum tas2764_devid)of_device_get_match_data(&client->dev);
+	tas2764->devid = (kernel_ulong_t)of_device_get_match_data(&client->dev);
 
 	tas2764->dev = &client->dev;
 	tas2764->irq = client->irq;
-- 
2.45.2


