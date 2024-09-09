Return-Path: <linux-arm-msm+bounces-31339-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D4C9971BD0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 15:55:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1F9AC283D48
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 13:55:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F4601BDAAA;
	Mon,  9 Sep 2024 13:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Qtzg/w9G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 546B81BDA8C
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Sep 2024 13:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725889924; cv=none; b=P0pycOV8fD/6ym80efrvCKFPym+U5+oO5NfyRt+OUrJSlnXeXlbeCc+zCWayU0bggGl3PhUcIpIwerC1KTiDR1dE1cYOOxeUwd1ijOQ++K437ZxRC1315oOSCqSBSlIiaDbJwO0J8c3sfmHH1ioaebwzAS1tcq5QAWl8gUaYCaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725889924; c=relaxed/simple;
	bh=jNymqsckfanJHx8PSWuZFbKm3ihIGGZwBaMEOB5ZiE4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SJcShAIOWZh8ivrsu1tdVo9J+xV0J9qf5wGgpK218AdrIehfsZSiXSv+z4lGVunUWAehEn//QGVi4+D4/JeQ/A2SlYXUjdmtdncpJH+3sy/j7ZYu8048UrQMWAdH1nw57/X2qfnrPNVFpV+mxtOuGCGu3g7py/LkBWzSNYkF5T8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Qtzg/w9G; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-378a4091175so30324f8f.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Sep 2024 06:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725889921; x=1726494721; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G1O1uIOK/bGt5Fhn73NS6TTBd8QYB0uOT+v/12vxEjw=;
        b=Qtzg/w9GD9ZogwzvGQOc3EePSebfKer087IMXMs8iVoNQ3l33ueGz3Fo+3sAWHqYrk
         veSfrWA2WreSMmoROmWF5q2RqVxgrhcFEt2NPLxymGYzu6ma+rhhNYyi2/Pykn/zvOi1
         sUkR97ZIuQl+0pzGh+zYrAZEyZDkbzz3lQdPkvpFse1nP7AwCxUwxB1wE6/gCK2ukWqH
         9tw9bAZWlfGlygZa9CvOML73pzgIBRiqycUTc1Ptcg99gSvx46gkky0ezQXJ4hWAMtjF
         /tZHvFz3E1OjobE5rSQhhG1gI7WqPZftPkJzeiX9iiJM+kSeQn2y26bqdX3N+6JU8OW2
         CegA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725889921; x=1726494721;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G1O1uIOK/bGt5Fhn73NS6TTBd8QYB0uOT+v/12vxEjw=;
        b=F/vvxurOBz8hJM/J/KS0RhuTPopm02W1mHrXGIwqWMsj89XFLUAzn1+VHKq2wJjEPH
         LZKDW7jLtcyo8TXpeSfnpN8EtRl0Pg1QeAroBlOTYsD2fZYjf7D88/I0NDnspoEBR/ii
         dC7p8nhAPJCFG/HxfW8MawjqD0NfPA+wQpq5llhvnKw9S+pYzf0zduiGzS4pFaG08zdm
         54kVPm3dgaESQQvD+FGRwWxUMONK3KSltV/FzkdvlkMNsvZq5xGiP1SLa08BWWeQwkeW
         K3DoDSmGUidMBngkTaXRUyYsXIHvJhrlHlAzP082Jz+i4fsFM2+Z6TLhOuj6gGnTDAS6
         DRzg==
X-Forwarded-Encrypted: i=1; AJvYcCUctjA9mkrVK0rc7xtK1cgJrvBD7CCYT/wPs2OUity0TAhLs98yOb8d6Ei1mYf6z/OAy+bRmJu77LOOYb0N@vger.kernel.org
X-Gm-Message-State: AOJu0YxaTgTrwswKie5X2cF1ovEECiELQziQyVXFXya5gaN9DPL/frmx
	S8lmQNX69DuBdv8k3qABDvvyjkKBvZSM3ZXGmJSvZtPFV0fupIzvyvFraQbCU1+byGJYvIorBvi
	C
X-Google-Smtp-Source: AGHT+IHF9qEIEL7aBOQecIEY8snSJmeWruEEkmGazQ3LXdnM7BSgPBuUwn/lQUqBri+myGdOHukvlQ==
X-Received: by 2002:a17:906:f5aa:b0:a8d:2624:1a83 with SMTP id a640c23a62f3a-a8d2624256emr211094566b.14.1725889909620;
        Mon, 09 Sep 2024 06:51:49 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25cf3ad6sm345344566b.148.2024.09.09.06.51.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 06:51:49 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 09 Sep 2024 15:51:19 +0200
Subject: [PATCH 08/17] regulator: tps65023: Constify static data
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240909-regulator-const-v1-8-8934704a5787@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1273;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=jNymqsckfanJHx8PSWuZFbKm3ihIGGZwBaMEOB5ZiE4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBm3v1frgG8hVoi2NhgvfRQHtO4lcCjJkU+gw/QJ
 a+Co9CrL8+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZt79XwAKCRDBN2bmhouD
 16V+D/wIO0j0Z5ZUo4S3NVrBCrwGJwjcNjLMFw1+a6IDku9xFAt7zKjtyZ8CjKRUx5N47SBwAUd
 XRFalrY9n51RWZN+zZdJZGWegfZwJH8ii+Vo1LcgMN7EXNFQ+GAx8rj8BL9UhPMkbPjXKfTBDos
 zt/o/ZfRrRb/1WfdTmgMqM1Hxy+yrzi2QeBtr/zUp7nQVs2qWNdJZJscoexW3/Wgy0jCw3XaRGw
 D0qK1K/ByJAmToUC/X9VNvBvNwnPjjSKvJE+YwhGH3jRqhKdB0h9WnigXlMpZSDZtvam+ADLQnZ
 uyTLjQEt8qy/6r6X+oFC7qFKD4Q2r93Od6yBXge7eqYgLNr+A/0gj6v8FZnt8/mPEiEeOuGqI72
 VGuMSMFXxUPQyWxHvzNm9VCdrJOF5Oh2LdfMOV5+o9B4kynH0b3LCLw3wwt7dpHAaJO/94xJcTs
 5Z1L+GsPo0NqHx6zQ2WxviPQFrrTdXT1OyY+uXDQsQlG0SrV5w0/PFa+tpfXWt0mQ6xNFnq/8WH
 h+5uoRK5ESWAfHL6ZH/vBlKthPGBLgWTLh/eQ5jY2zgS+sKy/FF/0Ow7eNGn8UISr/+MB6BaFu7
 9MmfvCT98N2LNuX/IvslzkUrBlcfQ/ezRhYqU+boAGpkg/I57y1+yfKlgTexnJOsWkyq4R9PTxg
 28X/ar9rqEWZJTg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Driver does not modify static data with regulator description (struct
tps_driver_data), so make it const for code safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/regulator/tps65023-regulator.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/regulator/tps65023-regulator.c b/drivers/regulator/tps65023-regulator.c
index d5757fd9a65b..3334b5b7d907 100644
--- a/drivers/regulator/tps65023-regulator.c
+++ b/drivers/regulator/tps65023-regulator.c
@@ -242,17 +242,17 @@ static const struct regulator_desc tps65023_regulators[] = {
 	TPS65023_REGULATOR_LDO(2, TPS65023_LDO2_VSEL_table, 0x70),
 };
 
-static struct tps_driver_data tps65020_drv_data = {
+static const struct tps_driver_data tps65020_drv_data = {
 	.desc = tps65020_regulators,
 	.core_regulator = TPS65023_DCDC_3,
 };
 
-static struct tps_driver_data tps65021_drv_data = {
+static const struct tps_driver_data tps65021_drv_data = {
 	.desc = tps65021_regulators,
 	.core_regulator = TPS65023_DCDC_3,
 };
 
-static struct tps_driver_data tps65023_drv_data = {
+static const struct tps_driver_data tps65023_drv_data = {
 	.desc = tps65023_regulators,
 	.core_regulator = TPS65023_DCDC_1,
 };

-- 
2.43.0


