Return-Path: <linux-arm-msm+bounces-25070-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69FCA925762
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 11:52:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9C1951C257A9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 09:52:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4516A173323;
	Wed,  3 Jul 2024 09:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZjusZYfZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9407D171679;
	Wed,  3 Jul 2024 09:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720000240; cv=none; b=B+7Iu8ujKgZZvIm3eYB673GMdtHIJORU4YJmz7WiCTiH1EEFQkz5qgrNG9ZudrVZgGoz26hQnLM6CjoKISG8WsCdB1mrPs18Ged+RUKwSTM+tdQsQ5IQXNOQqD1UrNzhS4tUb6lYqQShNMmoYVuOab3wbO1uwmS+3hYlW1xdMUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720000240; c=relaxed/simple;
	bh=y/2i9xAdynMCIKKj977aVCl8uDEeFBvS+ERij24gH3E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CuH5UfBNgqPS5W0lqlVDawCNtSsQOQ3ePTbqh2Ksah2+w/FyT96179CoA21+vQ8JDum3rANj6+4DWRBbaeCNhFkoZQMW9NGORETFeBuofWYMzZwZzWvgD9u7KpN8QC6rIuNYEjECqol4RUpMpZoXE5snjHOebjtr9Vx+47lt90U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZjusZYfZ; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-57cd26347d3so3344834a12.1;
        Wed, 03 Jul 2024 02:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720000237; x=1720605037; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k/v+B5h2PH1m+q96jJ+7IvzomlXuROk3OZZLA8dWAec=;
        b=ZjusZYfZpVqlfA9DmEoF37QlVqlBeQITzOiIJmY3lFLKaRFfQ9t1Ip0k8GMQ2U3GLv
         +B+6Ma5PO0HJacbYcDoUufEdfpMpKm4LctzJYXo+cbC8rb4FZkD/vJOsD79rG+mGjCfl
         ghJqBpVR5StzwLLingDWwiG03gT0f2q9HzXLxFW5wRatTaK8IkYu4Mcn8pmQ8Cvj04W2
         fXDI+XUMv1cj97ALtu8/zZGjUf4qo2xLmx1TGFp+/wDWBzO5ofb0Zghvuqk3urMhS0og
         xaQZ3gV9MWftpRcyf7zoVYOP1UEOlPAWRPLh7xcVS5C92gyZurHKRlHBJ9b8nOvwHu3d
         3HJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720000237; x=1720605037;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k/v+B5h2PH1m+q96jJ+7IvzomlXuROk3OZZLA8dWAec=;
        b=sbe5GLG3Bx8umH8fb/cw0Fxl9otv/zg5qTTXpNuxbEaWk7zwmWwKkSIwg7T/oAGm3T
         lkJNNgJei8uAhG3WVdn2BuA3LlZRzSEE4nO+TEbvYWf//Iq8shVUbTBUW+5d3UZ9lXXf
         AWxYNDBxezyEUv+9YLMgZNAUg8PwLH/jSHaq5JdazYI5HMiFwdwmzedzP7D5bH4KdjMU
         WJFSHwAKjUD18UZ3jAKh9EWUAoZcbX+SG9nzmPFllVXXPF1onFUGDRa6ogGE2+bwjBTg
         1ZEu/PDM2lZI2Ob1S40/rv6iEtnLlEFbv4sVGEZHxxWHfIKSGbxnbW7Vx2neq/HmzhsI
         iBOw==
X-Forwarded-Encrypted: i=1; AJvYcCVUgtceTP/UmloN5PLjzuTIbL16SNP/h794Va+3IFBNQsAMqD1sG9c4eCn7xbLVtNwN1h5t6BLc2selYNMknkamlPyQBO7Ug5yD0meLIwkzzxvFP944Dt/fo8+JX1i1si0FKeAXPDFK2G1R9Z1Oxo0/rnDTjwwvYjqM3/tzw8QNg58SX/Dt1A==
X-Gm-Message-State: AOJu0YxY3qS0a7HXG69mmAIV931rpXBIvl+2urF5Tx640C5GqNP1Jbpo
	aCjQD2F23lLavo7PEffVrRN4vqo0DxzNSTg5phAlNstZ3VktNUes
X-Google-Smtp-Source: AGHT+IEIY4dIoxPJludnffZYVCFFdIx0eviJTJj2qywdu4egDu5miCN1B1+FWYpxH8LMM6MLKJZmaQ==
X-Received: by 2002:a05:6402:35c3:b0:58a:e810:227d with SMTP id 4fb4d7f45d1cf-58ae81f67dfmr3569556a12.21.1720000236940;
        Wed, 03 Jul 2024 02:50:36 -0700 (PDT)
Received: from [127.0.1.1] (91-118-163-37.static.upcbusiness.at. [91.118.163.37])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-58b4a97b1f3sm2082130a12.18.2024.07.03.02.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 02:50:36 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Wed, 03 Jul 2024 11:50:20 +0200
Subject: [PATCH 07/10] clk: lpc32xx: Constify struct regmap_config
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240703-clk-const-regmap-v1-7-7d15a0671d6f@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720000225; l=760;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=y/2i9xAdynMCIKKj977aVCl8uDEeFBvS+ERij24gH3E=;
 b=Mp1Bzj4pQqStVgM8m4kQKFq4aJg6t4Fn7Xr88JURvNcy0mwlGzsq289eVMQClPqQGE4zzTNJQ
 l76GeFFivBFAiHCY1+doTXdXhw5oYcuQ9gGfIgcLZeBm7FzaG8Rz0MV
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

`lpc32xx_scb_regmap_config` is not modified and can be declared as const
to move its data to a read-only section.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/clk/nxp/clk-lpc32xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/nxp/clk-lpc32xx.c b/drivers/clk/nxp/clk-lpc32xx.c
index d0f870eff0d6..e00f270bc6aa 100644
--- a/drivers/clk/nxp/clk-lpc32xx.c
+++ b/drivers/clk/nxp/clk-lpc32xx.c
@@ -61,7 +61,7 @@
 #define LPC32XX_USB_CLK_CTRL		0xF4
 #define LPC32XX_USB_CLK_STS		0xF8
 
-static struct regmap_config lpc32xx_scb_regmap_config = {
+static const struct regmap_config lpc32xx_scb_regmap_config = {
 	.name = "scb",
 	.reg_bits = 32,
 	.val_bits = 32,

-- 
2.40.1


