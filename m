Return-Path: <linux-arm-msm+bounces-19531-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A4BD88C05BD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2024 22:34:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D62B31C20EC7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2024 20:34:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0011D130AF7;
	Wed,  8 May 2024 20:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="heGND9F5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 511D212A17F;
	Wed,  8 May 2024 20:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715200473; cv=none; b=mvEPxaNnncBy10JVaWOrzsTmUI4goab/U2A8F4jUAXCoh27ZSJycdaL2lqzczzfioP/iF08qvOz5Xt5DQxMW/ritnwfOli0TFG9PQiCPmBMtJTKPboVw1ORg66KO88d5RrF5VoFxb3d7ekftbJldbZj+9mRNRCoowvHLsEm7N/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715200473; c=relaxed/simple;
	bh=TvcqRI5iA0Z7Bk1l+OWXxKVFjors/ms85nxBW0rJi3o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=HW7sUwbPXzf4YjQ5Ib9Bg9EycNjVQ4oKMz8a50YGa0se4F30cnKgLJQ9HvZDWft/LwPl2CnM4xaY1ni62fMTxdO9bINs5B4lFX3Syl5tSpYjzckZj0oF37OAb7B6VYjTW5MCv20a5y2gE/HvCBzD94qGxfMTRAZpNPrrJzLZ4I0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=heGND9F5; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a5a0013d551so14623166b.2;
        Wed, 08 May 2024 13:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715200469; x=1715805269; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4D/wsR/nZF2oU4cRe7wiG2sNbWufWK+ynmZknuVoK+I=;
        b=heGND9F5cCt8hzhsSstCs7P7peuS3mQ0KWSOCXkBO+FSL0mmhTkDEzF7bdqFfSZPrW
         7DKu7whf8FkPmPOUacZ++xXGQcaGRy2p42aiMqGDTyudkn674EL1K2wNvO96hPNBJIWH
         wP1MjulOXPS0XpiywaOjdQoqmxFazgYflaaDoeGWzUeFyxk4OMwLXJkDq+JTYYO+RdAx
         c1ZaH7j1AdNYlKgP/jtroQVM/JnjDw4ZasjgurKgbAmN8Nc8tpeb3zijY+k2slGqG45d
         MUyPLZy5XvpH81t5b51KDzrVv2wEs/dC9NP9wvgb/jyQXSqzG/zTtQMj1PV9WVU2ML2w
         w0Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715200469; x=1715805269;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4D/wsR/nZF2oU4cRe7wiG2sNbWufWK+ynmZknuVoK+I=;
        b=TGUySa2IHzpUiWnBBU56vhNuBQmwGDtIP5stZoavoiYq6OV8gKmxyQRCIN9MjryYhs
         gdTHSa38Gya4obrWoTbyUE6lNAq5B3SOXL6lLsPzZlojNxHozZew9ugVPLR7V9MKKgcB
         JNCpEFq8QXNrQrVbYCCVbeZ5O1NHzprOX9C+xkCh3H2JSt6rnIcQVpPy/B+XmgfzU2j1
         BSBJAHz5ERBWQYKApl5gmJ613oWPibFq13Zrq44U+fwXYxN9ix7c4CFRjiqQJ3xPJnwj
         rM6qBlPyBzpfJ7FCi0W35JaYWGvhSzTfp8CAUpnc4a2Y6cDaEjM2Lg9xbMCH9CXKa7O8
         caiQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgUht1d7OxQyYd1O6/HU8DiroLjYCRyIviZk1ReLoKR631Tst2zK/ToavpNzFJh2/YA6SqQCINcoCVzVnNUJ4oQpl4S8TaeaRFpP5qHPPicl7vfdRWUf7WAw4M349wPk/rqHQHdaKl
X-Gm-Message-State: AOJu0Yzk4GcBIL1hIYO04+hdU2t4qLZjPXQY7M5raSItnlDZohiA7CcD
	rxHaqV+J2/XUfOth1UamenGc4p23GoQvokrMqqtqgpUVa3V4GAwnfaNUWGpc
X-Google-Smtp-Source: AGHT+IGFdtRQoEDrS8EJZco1r9vOO7Jg+6Qm71hlZoviI+PSpW5TJeyzzley9AaHCQAAbfB7oOEXJw==
X-Received: by 2002:a50:9353:0:b0:572:9d22:eb8c with SMTP id 4fb4d7f45d1cf-5731d9b62c4mr3334708a12.15.1715200469501;
        Wed, 08 May 2024 13:34:29 -0700 (PDT)
Received: from [169.254.60.140] (57657817.unconfigured.pool.telekom.hu. [87.101.120.23])
        by smtp.googlemail.com with ESMTPSA id x2-20020a056402414200b00572cf08369asm7128233eda.23.2024.05.08.13.34.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 13:34:29 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Wed, 08 May 2024 22:34:14 +0200
Subject: [PATCH] clk: qcom: clk-alpha-pll: set ALPHA_EN bit for Stromer
 Plus PLLs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240508-stromer-plus-alpha-en-v1-1-6639ce01ca5b@gmail.com>
X-B4-Tracking: v=1; b=H4sIAMXhO2YC/x3MwQqDMAyA4VeRnA3UUofsVWSHUNM14GpJpgzEd
 1/x+B3+/wRjFTZ4dicoH2KylYah7yBmKm9GWZrBOx/c6Ca0r24fVqzrbkhrzYRc0FGgEB9L8lO
 E1lblJL/7O7+u6w+44sh4ZwAAAA==
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kathiravan T <quic_kathirav@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.13.0

The clk_alpha_pll_stromer_plus_set_rate() function does not
sets the ALPHA_EN bit in the USER_CTL register, so setting
rates which requires using alpha mode works only if the bit
gets set already prior calling the function.

Extend the function to set the ALPHA_EN bit in order to allow
using fractional rates regardless whether the bit gets set
previously or not.

Fixes: 84da48921a97 ("clk: qcom: clk-alpha-pll: introduce stromer plus ops")
Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
Based on 'qcom-clk-for-6.10'
---

---
 drivers/clk/qcom/clk-alpha-pll.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index d4227909d1fe..c51647e37df8 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -2574,6 +2574,9 @@ static int clk_alpha_pll_stromer_plus_set_rate(struct clk_hw *hw,
 	regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL_U(pll),
 					a >> ALPHA_BITWIDTH);
 
+	regmap_update_bits(pll->clkr.regmap, PLL_USER_CTL(pll),
+			   PLL_ALPHA_EN, PLL_ALPHA_EN);
+
 	regmap_write(pll->clkr.regmap, PLL_MODE(pll), PLL_BYPASSNL);
 
 	/* Wait five micro seconds or more */

---
base-commit: 3c5b3e17b8fd1f1add5a9477306c355fab126977
change-id: 20240508-stromer-plus-alpha-en-0a4a4c6df28c

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>


