Return-Path: <linux-arm-msm+bounces-31336-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2165A971BCB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 15:55:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CC014284A71
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 13:55:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53D6A1BD504;
	Mon,  9 Sep 2024 13:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QJxdMoJ3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 819B21BC9F0
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Sep 2024 13:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725889920; cv=none; b=jslHlMl2EPbODsqdOM9jlxAqSGPjB75mov8FlePd5AgfZ0XGQz0bn5FLW8eGB2lN34g+Ln7yiTm1rxISMHWR2UKbgxiPHy6NHwe+bRkcbQpu1gkmuqNvsknQrmVGDhlx+nI8z3Y7VIBlt0ovSkQB1Y3mB8HbIgNvStKwTE6vXuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725889920; c=relaxed/simple;
	bh=HRKyZjGM94NkFQ6StvG56VA5RTKeFKEABwUAsw2nTr0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mxPfJu1wDZkQJscQn9FSfMdqj2KuUGkINGGCSQVjX0UELGQxJerZcvYHZRtsvT7twmejHJvkJZsZLGrQfTVT2MANChlxJGIILYtHhhWXJZWunlf3+dQ8mP+OL+GVGDuJ5ga4FncKu22Ojv/ccZ+lxGDpHhpOa38CbgIbIYYQdMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QJxdMoJ3; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a8713b00219so23260566b.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Sep 2024 06:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725889917; x=1726494717; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AYJy8WgMUAn0VEuaq5aXmaoEnUqoMBjQF+74z8dXbcI=;
        b=QJxdMoJ3nCnO2tzHj6mQ5YmmlfSX/tSPZMS2OC39TUXix5sBO/ExUodH3qwElOAhGp
         SjqhFSJJTPlgI1C9ls7iqKtgPE1oPkFDkzoIwrEl2giG7wbWH3VvWUQ8DGepoq8Ir+wh
         i5hDMTXMNeBKZ/hSJpjAxqYEAE8EyY78SFOb3z4+B8r9cLb2zgcrLtvKqiBSCrfQmADd
         DdzVoEErotetD6vnoFhtDTSkNnGbRCxCEjf/RfKpQJCz6e51hOlGIz3fbuej1iYgwLcj
         stPsoVUa+M5ElxMK8FxkJvvSLeWje0cEdb2+5RzEQWyaKvQS3y2bJK0JpiGSLS7bBwNQ
         LSnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725889917; x=1726494717;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AYJy8WgMUAn0VEuaq5aXmaoEnUqoMBjQF+74z8dXbcI=;
        b=OIvVGhBaS8p16ejtrZAJlSQqfuyiQKpYevjEDRhdvt6ZdzyzsjGM4v+Rt5vT011ygs
         2XU6feM2Dmmuzz2t8d0iOYqonzIHOv7Ef5JEjBhm6VG8aPBT+nVe2mqY/F4if6I3xVeo
         O7R/kvIAUiv8Zyt1End5S3ReJ2iJ7HjkaUH+a2T09dH1WGBZEqL+NQXj8hJ386SEbah7
         QlUY9ePUyRanulWDMTphuPtind7eKjlBgsY/Ld0n1fDcuAvN7Gpd+CfvacULor5dwErX
         Dzuiv3XSgLN2NYkhkx1km0lXN1T2rPbHNv+U85XnTN9HirDIKZJjCKMoXpp8ocsaYjuy
         TrHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnPunyO5EnERvLoKpx+WOzAKxLLFQKeVH/Y6Eoo3qHHVhXRwEULOaycw+/mNhUxPHmhtpDi0Q7ckUQt+yc@vger.kernel.org
X-Gm-Message-State: AOJu0YyguLw/VN9r+01FBovrGziclY0T1EjMC1CSycaN+kh9V6CY7gr3
	M5XW42Kv2k4pU6JzloVPDUv8sW3tvVAETb7MnGhT/l2gbHabIP4JLr5fYaZI+/8=
X-Google-Smtp-Source: AGHT+IGzfXZ15lM7AABSl1WEEBoTSjYJRhQxhU3CuhHvNSnGY43koVrWg9eO+EQ6ZFAnE+Rywyd0Lw==
X-Received: by 2002:a17:907:da3:b0:a83:70d0:7a1e with SMTP id a640c23a62f3a-a8a888e61a0mr406855066b.9.1725889916851;
        Mon, 09 Sep 2024 06:51:56 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25cf3ad6sm345344566b.148.2024.09.09.06.51.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 06:51:56 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 09 Sep 2024 15:51:24 +0200
Subject: [PATCH 13/17] regulator: pfuze100: Constify static data
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240909-regulator-const-v1-13-8934704a5787@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2916;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=HRKyZjGM94NkFQ6StvG56VA5RTKeFKEABwUAsw2nTr0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBm3v1j85Ng6PdTzeDBq/rz5MGVUOdHrew/KeKhR
 UAfJ5DrtbyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZt79YwAKCRDBN2bmhouD
 1yq9D/9tEjTOPlkRyFze0AvTYAD9mQWQGKm7MqyAuFjex4vzWptpuDisJx4iUpkQGmRhr25LLQX
 oXu120pBSWEDyQFmdFWxvR1i6Xjdl9p8ssy7QiCXyXw9LWTDUxT2v26LV5QzupmqthvQ0mEH6ae
 Kk7gQmRAnIMnVliMEojJJ2KkwvVrye1X+xfnycZobF2ebIi82li/lQ5fDcEyLsm/g89FKLP723D
 en12o+9U4G6pVLlxeXMDXfxXojQtJzrkujgF6AMsRsuxZs6e6bZJck4wyPC1M2lbdFN7/Y9l4Wp
 xAIahb3R59XqJ1OMcHNHo897iLmXClURj3Q0ENgymMYfRcVdaqyUTRDal3wXBcfMdfAEwb6d47+
 miiThY7QV7kjifx3aZGRwEX6JnwRkw+BZqtTuTw90GwNDsSCEZI6DuHZWWvBPRYiPYqEBWBiTzL
 yrtKPWp0HEb138JnN1PW505GszshVpkyNd8ghcmPCrmrhOk9HZsVdBd5cU9CY2mv6xEwW+n6loy
 51xKnNZ/RYG+mu5B8VhF623N1mZPISanAnuYhEjXfbZI28dSOs75HHcrdVbfxcbjLsbJ0uPq/rj
 3p7t129yZIjYUXz4cGYDgLPis2PpWCshGD0TdTvKAqo3F/xR1Yw41HJD0E14ZzKfHxyBYo/1osg
 UG/PHCWPadpT4/w==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Driver does not modify static data with regulator description (struct
pfuze_regulator), so make it const for code safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/regulator/pfuze100-regulator.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/regulator/pfuze100-regulator.c b/drivers/regulator/pfuze100-regulator.c
index 7c04870442d3..7d56c22b5e40 100644
--- a/drivers/regulator/pfuze100-regulator.c
+++ b/drivers/regulator/pfuze100-regulator.c
@@ -76,7 +76,7 @@ struct pfuze_chip {
 	struct device *dev;
 	struct pfuze_regulator regulator_descs[PFUZE100_MAX_REGULATOR];
 	struct regulator_dev *regulators[PFUZE100_MAX_REGULATOR];
-	struct pfuze_regulator *pfuze_regulators;
+	const struct pfuze_regulator *pfuze_regulators;
 };
 
 static const int pfuze100_swbst[] = {
@@ -367,7 +367,7 @@ static const struct regulator_ops pfuze3000_sw_regulator_ops = {
 }
 
 /* PFUZE100 */
-static struct pfuze_regulator pfuze100_regulators[] = {
+static const struct pfuze_regulator pfuze100_regulators[] = {
 	PFUZE100_SW_REG(PFUZE100, SW1AB, PFUZE100_SW1ABVOL, 300000, 1875000, 25000),
 	PFUZE100_SW_REG(PFUZE100, SW1C, PFUZE100_SW1CVOL, 300000, 1875000, 25000),
 	PFUZE100_SW_REG(PFUZE100, SW2, PFUZE100_SW2VOL, 400000, 1975000, 25000),
@@ -386,7 +386,7 @@ static struct pfuze_regulator pfuze100_regulators[] = {
 	PFUZE100_COIN_REG(PFUZE100, COIN, PFUZE100_COINVOL, 0x7, pfuze100_coin),
 };
 
-static struct pfuze_regulator pfuze200_regulators[] = {
+static const struct pfuze_regulator pfuze200_regulators[] = {
 	PFUZE100_SW_REG(PFUZE200, SW1AB, PFUZE100_SW1ABVOL, 300000, 1875000, 25000),
 	PFUZE100_SW_REG(PFUZE200, SW2, PFUZE100_SW2VOL, 400000, 1975000, 25000),
 	PFUZE100_SW_REG(PFUZE200, SW3A, PFUZE100_SW3AVOL, 400000, 1975000, 25000),
@@ -403,7 +403,7 @@ static struct pfuze_regulator pfuze200_regulators[] = {
 	PFUZE100_COIN_REG(PFUZE200, COIN, PFUZE100_COINVOL, 0x7, pfuze100_coin),
 };
 
-static struct pfuze_regulator pfuze3000_regulators[] = {
+static const struct pfuze_regulator pfuze3000_regulators[] = {
 	PFUZE3000_SW_REG(PFUZE3000, SW1A, PFUZE100_SW1ABVOL, 0x1f, pfuze3000_sw1a),
 	PFUZE100_SW_REG(PFUZE3000, SW1B, PFUZE100_SW1CVOL, 700000, 1475000, 25000),
 	PFUZE3000_SW_REG(PFUZE3000, SW2, PFUZE100_SW2VOL, 0x7, pfuze3000_sw2lo),
@@ -419,7 +419,7 @@ static struct pfuze_regulator pfuze3000_regulators[] = {
 	PFUZE100_VGEN_REG(PFUZE3000, VLDO4, PFUZE100_VGEN6VOL, 1800000, 3300000, 100000),
 };
 
-static struct pfuze_regulator pfuze3001_regulators[] = {
+static const struct pfuze_regulator pfuze3001_regulators[] = {
 	PFUZE3000_SW_REG(PFUZE3001, SW1, PFUZE100_SW1ABVOL, 0x1f, pfuze3000_sw1a),
 	PFUZE3000_SW_REG(PFUZE3001, SW2, PFUZE100_SW2VOL, 0x7, pfuze3000_sw2lo),
 	PFUZE3000_SW3_REG(PFUZE3001, SW3, PFUZE100_SW3AVOL, 900000, 1650000, 50000),

-- 
2.43.0


