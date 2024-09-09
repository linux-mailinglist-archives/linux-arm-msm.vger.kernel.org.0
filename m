Return-Path: <linux-arm-msm+bounces-31329-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 78909971BB8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 15:52:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9B57C1C231EB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 13:52:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B95961BAEF8;
	Mon,  9 Sep 2024 13:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ir+6nr/c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F9F81BAED1
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Sep 2024 13:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725889909; cv=none; b=QjdlBJcNITB9kfNVa35Hg6C2IIDHBK7lghgqaEJoB4Af+qalx4us2dQQwleJxpZ4pwaai5ATFXPJeqK3TT1jrQhJaAhcb5iGSDy2DGBODijUH39+CRNPhFAdXqH/wVHR12RFdbvbdfD9lj7XR/NW4IBBjBQxwD/HPPqRPpK8ncs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725889909; c=relaxed/simple;
	bh=qvFB37UNy0FXUjxrG9GIJ3EDRLNkuyXGb5mp950Q39M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ajPysBUDk5vSNiOgmEuxvOSPm84eSwJ1qCLDqRwpHlmnkilG2I5A/MDTm3Eb+hyGnfFDSxO291UxzlEECPyZARkcBDRMoCfzrtwlh7U9uJ2Gs9KxWMnB0ap8l5sBW+pL6ZzHmlxAbS9wSwOmAxHE3NikMaiUVt/+9M76xhHFrUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ir+6nr/c; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a8d302b6b30so8521166b.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Sep 2024 06:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725889906; x=1726494706; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ebiwwBtqKdnptnl4wd8GBFDK3ZgfnRMWFyATVPqygk8=;
        b=ir+6nr/cTmo6hs2l+weMJp6VJ6+580jC3Lv1yeiNO26oT1SCjw4uyejTROc4QcuQKJ
         WuFJisoG5lRtmurf/eId1/oazcPvOTgFuZu8mEY7iKHq9k2tj3SwpqME54ca3pMXb0bQ
         SF1Z6ZUSK6VCj/cyOBo0xcO+h1kGQAJtQiaWCxdhc9PKUplWAQCYX08bxFYegq5jotys
         ZKwKAUVI1CH0q0Yw4j9HIC6SEX018NHIotm5qkzrMjZJP6DTTedPrHYIBV1prTMOK8pL
         VHLaADp5/BM4+fInEcLoEGMOgrh0Rwt/MSQkCayjWpHDzxCiVbemX30DkpunrHmPOnV7
         2oGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725889906; x=1726494706;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ebiwwBtqKdnptnl4wd8GBFDK3ZgfnRMWFyATVPqygk8=;
        b=H6rF/ICQxN/JQ+At+0IZ4Z0N0M/UKNYUUS74zzNsI5FQhjQ6L/NwyRe3vrlKyRWCVb
         3eKouuyJ1A9AnlCzu7sKnrdvsXxrI9THjV9I3lS0BULTqupJmZXGq3JZJbY9ksHBnFTP
         2iWvchI1zCNWUhojn0dAa2yOLJDW3KDmh5NjIUUKjLP3i4R3Pd/fBQ4bJdcyHl+kqW9b
         GNdLSR7eCWoBRI4gSxEfWn0txzNaluzOJHqne74+h8GScnS2cGQeyZLLsdXceozUxRwR
         g3oh46RjQgm6IEe/PkkUaC3nDGxODxsY80c/rj3Zy3/yF1BqTgh9Nbev8twnsg+n1s+a
         2NXA==
X-Forwarded-Encrypted: i=1; AJvYcCUK9zMdcGkNmFQlW9xSdxO6MuBgHl+XixjZl8GBYsYlyeaIvKOTm+zfyr5M/DmpRTYq6BlotXg0k76SS6J3@vger.kernel.org
X-Gm-Message-State: AOJu0YzEsJ9joEI8H4YHFzWjYN0Em5hexLji34gIkTiS15Pl5mDXmwwL
	ArHOK2FvcE5DPzEqZL5U+p/N4v2wxeOUPcmo3RSXVCbtBkX/06uRjeZ+32KVe18=
X-Google-Smtp-Source: AGHT+IHitMS1cWRj6WUaeP05stoqvUkgN1+30cQ8Qjo2wMMatVr+SQ+ogFBaSLtp79Pcj8lputkU3w==
X-Received: by 2002:a17:907:3da7:b0:a8a:81ec:f731 with SMTP id a640c23a62f3a-a8a885c3265mr378363266b.2.1725889905496;
        Mon, 09 Sep 2024 06:51:45 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25cf3ad6sm345344566b.148.2024.09.09.06.51.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 06:51:45 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 09 Sep 2024 15:51:16 +0200
Subject: [PATCH 05/17] regulator: da9211: Constify static data
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240909-regulator-const-v1-5-8934704a5787@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=819;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=qvFB37UNy0FXUjxrG9GIJ3EDRLNkuyXGb5mp950Q39M=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBm3v1cXH5mO890K3vAeJUuv0AtSmRWejCS85Vei
 fX3f8LzbhCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZt79XAAKCRDBN2bmhouD
 11ChD/4yh9ctCFV0lMqYOZv20i4KdgYa2NLHUN4pjlhvUeE7bNRx3gvPpT3oVHy6TYPDGYd5xo3
 qjMOhlaWM98n4j3kvYr2n4bj+STEKZbYNUGMiSvU/lGDNdaGlcMDA41KdZS2+dtZPIXiYXTXoy4
 /XrGKA5vm9X/3c1vlsz1D4SnBOFXPARuDCy0e0zAa21CsIe3ymWRvgkWPPJSDNewvsrYGT/+n8p
 luKgHx2DD/MLwnhTHKNCVJ4ZoGW/Ze2TO4/2MVkHu8KoXY0Oza+VL2cjhcDxfrQJiuegsVR7pjE
 pYOLDyEJ/13cTDHX4CEjygyGVrVPolQOJuG0LDOd75YSZMTpsNLxb7A5o+/pkKzT6+23qHWSOsF
 F9ELpIwY6vQyXC8KxYXtgaePWfY9pJIWkXfYEX7+OM9U2yu0Tf/DYoYCpd8RLqyI0YChNH73f/Y
 7GM5HG1jaUjTcqDnKB1AK14fBS9qyMZOSiAtykpZEWGBAuV5jhBKo7APsx0Qf3XkXQWgRx07qyy
 +xlJz1udRGESQ79PA8s7uWN6tyGr+pVk/qfIhnSQYt4c3K4hcFFBXoiHwbNVRvaVU65qpe8uL64
 nwtioO7ua6RiqxYui6Yc/8tCc9hGvBoC+DgR8RYhkAsvp5qYbsP0GYjBvYtKMeNqtXkGMc3hUe1
 MI4gi9DFb78nIkw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Driver does not modify static data with regulator description (struct
regulator_desc), so make it const for code safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/regulator/da9211-regulator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/da9211-regulator.c b/drivers/regulator/da9211-regulator.c
index d8b39ea3de0e..d4f14d7ea8cf 100644
--- a/drivers/regulator/da9211-regulator.c
+++ b/drivers/regulator/da9211-regulator.c
@@ -264,7 +264,7 @@ static const struct regulator_ops da9211_buck_ops = {
 	.of_map_mode = da9211_map_buck_mode,\
 }
 
-static struct regulator_desc da9211_regulators[] = {
+static const struct regulator_desc da9211_regulators[] = {
 	DA9211_BUCK(BUCKA),
 	DA9211_BUCK(BUCKB),
 };

-- 
2.43.0


