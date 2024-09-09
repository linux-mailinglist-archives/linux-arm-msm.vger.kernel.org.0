Return-Path: <linux-arm-msm+bounces-31333-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 083D1971BC2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 15:54:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 332721C2327B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 13:54:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F2C51BB685;
	Mon,  9 Sep 2024 13:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lqZRw2KQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D5891BC081
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Sep 2024 13:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725889916; cv=none; b=udmtOs/KDTSqbLYwxhkFwvoHPXoe1e9YCJG+5R6cXhs87R5SQOZ4KT0FVASh+9iMin/U6bV/+nXtP9x2SgMDimr3ry/6xQnneYjEL4T+RGg9RLEYuEJlmLHPYV2poOyYSIib9xM8757K97rsXyjomG+lprTKinBhA6GML6USqJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725889916; c=relaxed/simple;
	bh=795en8GaERiwJn6rOfhvPyay4QNcnSep7UjxTkcJ3Mc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AkJJpU7Ji51StUaSPH+F9a6SqTF+aNKdeV2eR7zuFqUJoko/OR4F0abImEiXZPlHHEvQ00IIth2FVBFbdOjlQ0zsPPZD+3C5dGEVHj8lPVvXbMUIpfSylMb6TZMYQVKKUn4N1p/DudzH7riBV1CMEAQj9Cetu61bZUPz/ZKQa6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lqZRw2KQ; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a8a7dddd2c3so30092866b.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Sep 2024 06:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725889913; x=1726494713; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=44T3QUDlrtSOShQgg80wGa+L2spfOTUwB+D2KVKSm5A=;
        b=lqZRw2KQPVtSyqT7p/Q10J937GAaFzEpQY0WRPvCcBSiAIADGJrvXLP+wfiyxg0vJh
         JPC2EnO/T73TdYcHH+J3vkntmF0UbSqDLEQf8WDZOfk8sP1CWV7aZfbxsUopJc1z+KP2
         vAvh/+0acoHGYxuUbG/QtuoC6o070A7wCiG+jTANRWm3obwWmH/mxTAMgXjG88w3msa1
         bi9w0n3nOSbUeh4RQBGUTMRZXou+k36bYIfrMWwd+53nBRr7Jv+tQ0Q1CMXOHX5o3qAZ
         m6cDSulZ9KTZ9S2JiM6zvl723sBo75RsuYQpGH3TgwEnkV9WhdPpWO9cDAACoLUbApve
         v4kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725889913; x=1726494713;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=44T3QUDlrtSOShQgg80wGa+L2spfOTUwB+D2KVKSm5A=;
        b=OqWpc6CHIozaOwcR+xO7MqTM7hFrlplAGx1aOXk1lSmN/jgAefnIXnOE7dEp2Pa3EX
         P8ZnVNJVmIfMDYH/MomwDBOzOvRqcAzzsxO4+aB+Ls2p+WsG5YSdlO5BHV6R4vL+Rgyf
         YmiLwRnhiPAf85vLRxXHdspwfWImTt0kpQ/rCEo1I9pJZ/U6bHnt7G/uyk6YLA8lgpN6
         spAqn8th/Dy1KvtrNATUUZOColJIW1W1kvELJPX42zFU27jLDAvcdMCaH94Zgr2VO87q
         ZwJjONgvhFiS9iRd1aKraCFUhFlQtoDyg6gsm73+wYMvN8Q8rDi+dXLAJW+Qbi+3wY3y
         o4Dg==
X-Forwarded-Encrypted: i=1; AJvYcCX40FC3DGYvWMeeaD7h8tCa1/sKYWz5ZjQN+6pxjZo5yO562Pb15/X2Z04o3XArRJb1YGirAoeowigFBx3R@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1DmCtDuDR7jKCRqCk8MT3bYHSJoc7erkU0NZhpFPthLp1eYQl
	61FNA9ITHhXiWAcx0F0w0Ega+AI0BqIiB3dIWqEBoOsYaoRlY+U0kQX0ZaN+ukQ=
X-Google-Smtp-Source: AGHT+IGk9hZB0pHua/chSXERPAQ5CN/NBt3Z65k1DtKhjg05ctc2/lMYUaXmWILfKfO+QjhqrWN6NA==
X-Received: by 2002:a17:907:7f24:b0:a8d:2624:1a81 with SMTP id a640c23a62f3a-a8d262425b1mr217028666b.12.1725889912561;
        Mon, 09 Sep 2024 06:51:52 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25cf3ad6sm345344566b.148.2024.09.09.06.51.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 06:51:52 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 09 Sep 2024 15:51:21 +0200
Subject: [PATCH 10/17] regulator: max77826: Constify static data
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240909-regulator-const-v1-10-8934704a5787@linaro.org>
References: <20240909-regulator-const-v1-0-8934704a5787@linaro.org>
In-Reply-To: <20240909-regulator-const-v1-0-8934704a5787@linaro.org>
To: Support Opensource <support.opensource@diasemi.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=890;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=795en8GaERiwJn6rOfhvPyay4QNcnSep7UjxTkcJ3Mc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBm3v1hg8AgiknaqdgK+QeL6eWRxLilY4eGOB9I7
 VzqfGreegyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZt79YQAKCRDBN2bmhouD
 14XnD/4oSkc1OBYURG8FgVQJOiazLpoxduGRxjx7OGJtTLWiqLTszBmdOLY4L9bw/jZtrnwGiem
 UMtSHu2H3c4kCyG4oYsD+TWiP2xIa+fey3CAghooYlxJ1kgI/mAEL0UlGpA7byTHEjNPhrIyC/T
 lA1XLi2juHLKbC5/oP0WoLbgC70kGC9fqGOjfh3vrrMKhdIKlX5FHAYtDJ1/8RtTx7j023w5lSV
 RAlGBJgndI/7dx61sFHF0DL+TJEala5Jpyger5lPv7njuQc3gPajk248CejWqWC8pH/eiEqgtyO
 URIftNm8SfINoOR0YD3oDdfRmj2/l5vsymPjloXDOFvj2LF/1yPZ6JK3evtL49z6O2z6s8eeJXS
 Zi2tdu0vA32j4A6pDEXTm0i5bD5qIVQldM86sMTaqgCB9RHU+qfQ1AytvB3TQzdMhHxI4tJ8OMw
 bFRL7zbMZNGwyYXJaxjQA3wiOU7pBOR61M3QOwjOJG1Uv2c87S0uepNcJ+okq+CfyXUsSNSNbYQ
 aKgvis/E5bOVarcjmnES6UZqvirYOIHfNUo+HN130bcwEGOY80BZ1rUiYLk4wZSv7JTDDTijoqH
 EU4nwqNhX3QBsv0K0G669sjpLHX0fovxwLYrxg1hgUPGH3TMmU9KNmlTYoK8TXGlk6vMPJ2pz3C
 pGegNyy+hIMcnyw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Driver does not modify static data with regulator description (struct
regulator_desc), so make it const for code safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/regulator/max77826-regulator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/max77826-regulator.c b/drivers/regulator/max77826-regulator.c
index 4b656a694108..310bc8ee7af8 100644
--- a/drivers/regulator/max77826-regulator.c
+++ b/drivers/regulator/max77826-regulator.c
@@ -186,7 +186,7 @@ static const struct regulator_ops max77826_buck_ops = {
 	.set_voltage_time_sel	= max77826_set_voltage_time_sel,
 };
 
-static struct regulator_desc max77826_regulators_desc[] = {
+static const struct regulator_desc max77826_regulators_desc[] = {
 	MAX77826_LDO(1, NMOS),
 	MAX77826_LDO(2, NMOS),
 	MAX77826_LDO(3, NMOS),

-- 
2.43.0


