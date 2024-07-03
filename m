Return-Path: <linux-arm-msm+bounces-25071-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0428F925765
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 11:52:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A4C2D1F26A36
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 09:52:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB65F1741CE;
	Wed,  3 Jul 2024 09:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZW9lM1tF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FA4E172BCE;
	Wed,  3 Jul 2024 09:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720000241; cv=none; b=BzdP44cy/K8BP/kWju4EagqR77CCRrjUjdZmkYJM4/EGuL3tVZUjMLpMDbzS+HGJcL4ZHCfSwT8Vxt9xZhuJVyCPrKIIhGEbcCj/k+Q6kQ7Q+QnE6TZ+/nGTTl4kdeOPpbmuKARCvl34TPifQGuuKhLEhvel7sLC/VqqLAmlmFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720000241; c=relaxed/simple;
	bh=r9UG0iaRfl1edz0iDrKl1TCA7udEuIQIOzcFOl/X/K4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aM8mkW+tNS0/d7bWbK8refrmXnfELKJqIVKzApqEXKiHdhMaoEviyi0H0iZ6Lq1k9Blg3uhqd7pXUDkIsaqaLhny1/TIPuv8kyBxEhZH+gA46yJCf0X66h0SUQEHeWfa8p5sBhAgecXPXJfjf/HriiPeRg5DT6cxmkEjG2Dk8VI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZW9lM1tF; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-57ccd1111aeso3563741a12.0;
        Wed, 03 Jul 2024 02:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720000238; x=1720605038; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wLgsGqmc7BPqHMYWncG3lDrLlsc7ZfRJcAq4ykKg8iQ=;
        b=ZW9lM1tFTgzOV3EICwEov/SvbvgcwYBIyBEyb+8XNUw2beOQ4x8BjniOn2/8c7w0ka
         jXAk9yzCSmBmohkIlhzBy0Q9hSbPKw0zT3++x0fjImnrbYj30cbQfBBrtun8luZvViAk
         IxRR1QykXozn89T2pFVDCKn70SzNEyvCb1alcANQSpP7GIVKKsH6CPblo0ZTrj52vgsC
         kEtaCGUhlBGHhTR1n/A+ukqR6oyqpR+ibY8CWJriJk+89kNPmdakTr8ngZz+7BTtcWgn
         QcZOmNJkItfE7TCLopl86WsfJJ7vBLO6c694Mv0o6DQ2KYDGk35b54vHid8v2dOahQUt
         beIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720000238; x=1720605038;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wLgsGqmc7BPqHMYWncG3lDrLlsc7ZfRJcAq4ykKg8iQ=;
        b=pQJZbrC/hWs/YR8akkCX89/pPKfLPtmirWj7MtJx4p6jKVmA5Oxszevo6pRK9Emo7/
         XhCtIQeS/+nidZdsL/e8ouq+cEPoUYThncS3OOVqI/7rD101ARAkH3xm/Zrnmoogc46+
         ZkwBgV154ZVThMQLquKrn3piQDsH+l1gPaLRcbWPXJl++IZ1YzR5YhmE+eCFX7TS+Wut
         eOJAHOgZmp7KL2Ddwg8fnLZlTuwgQCIlIL0t2wdahrZN+Kr5H4L98oj2bPy5c/2toKvf
         xLT+BB2ALwRMa8E6F8ZQod5GZielArjj5SdOFXQF9VrB0tU2P72ei7h5hTXuuJPBqIps
         K6HA==
X-Forwarded-Encrypted: i=1; AJvYcCU9LksQImPAU1fDEslGg9zD2qQwzfmoPjNHD8CoSieZIpxUURy7URF6JxCi/fgo8rN7gJ4l3q1VGr9E1n8CZqgMcrm/sZgCv9K+xL2ooVjCAXdipFbI2apTlmkd1dR91252qUw5tHsbBhbh5syucmrDRHEy+kuh3PtieKilLWsHR3keKfo7Yw==
X-Gm-Message-State: AOJu0YzJtCWXq9YSZJxYTt+UJNPylh0kPoD7/quHoZ32Y+/wNJxcsIjp
	d8T1fs0fZ6D6PuO36DIhrLJpiE2p+6EOhbVYpLIadrE2zNRB/Xcm
X-Google-Smtp-Source: AGHT+IHDBJT3Q4Laj/q87YJoetkDqI5ofUOXbXiuW/rDGosGYXbLBVOAupqJHnTVnz6rBOrgARQkAQ==
X-Received: by 2002:a05:6402:27ce:b0:572:4fc3:3a28 with SMTP id 4fb4d7f45d1cf-5879f982ffamr8309648a12.23.1720000238458;
        Wed, 03 Jul 2024 02:50:38 -0700 (PDT)
Received: from [127.0.1.1] (91-118-163-37.static.upcbusiness.at. [91.118.163.37])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-58b4a97b1f3sm2082130a12.18.2024.07.03.02.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 02:50:37 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Wed, 03 Jul 2024 11:50:21 +0200
Subject: [PATCH 08/10] clk: qcom: lpasscc-sc8280xp: Constify struct
 regmap_config
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240703-clk-const-regmap-v1-8-7d15a0671d6f@gmail.com>
References: <20240703-clk-const-regmap-v1-0-7d15a0671d6f@gmail.com>
In-Reply-To: <20240703-clk-const-regmap-v1-0-7d15a0671d6f@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Vladimir Zapolskiy <vz@mleia.com>, Bjorn Andersson <andersson@kernel.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Michal Simek <michal.simek@amd.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720000225; l=1251;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=r9UG0iaRfl1edz0iDrKl1TCA7udEuIQIOzcFOl/X/K4=;
 b=B7jdNvHm/5Mt3ktcfDeM9c8KninOBlgFk8K0PVOq+LB2WsKsc0vbO7U/7APUKe4yiJSNoyh1i
 HlwYoMOYWxNBOUay+b6kvtC6NNAQ4xpzKMHyksGClZZg3Nd+T/kDVWb
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

`lpass_audiocc_sc8280xp_regmap_config` and `lpasscc_sc8280x_regmap_config`
are not modified and can be declared as const to move their data to a
read-only section.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/clk/qcom/lpasscc-sc8280xp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/lpasscc-sc8280xp.c b/drivers/clk/qcom/lpasscc-sc8280xp.c
index 3693e47d548e..9fd9498d7dc8 100644
--- a/drivers/clk/qcom/lpasscc-sc8280xp.c
+++ b/drivers/clk/qcom/lpasscc-sc8280xp.c
@@ -23,7 +23,7 @@ static const struct qcom_reset_map lpass_audiocc_sc8280xp_resets[] = {
 	[LPASS_AUDIO_SWR_WSA2_CGCR] =  { 0xd8, 1 },
 };
 
-static struct regmap_config lpass_audiocc_sc8280xp_regmap_config = {
+static const struct regmap_config lpass_audiocc_sc8280xp_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
 	.val_bits = 32,
@@ -41,7 +41,7 @@ static const struct qcom_reset_map lpasscc_sc8280xp_resets[] = {
 	[LPASS_AUDIO_SWR_TX_CGCR] = { 0xc010, 1 },
 };
 
-static struct regmap_config lpasscc_sc8280xp_regmap_config = {
+static const struct regmap_config lpasscc_sc8280xp_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
 	.val_bits = 32,

-- 
2.40.1


