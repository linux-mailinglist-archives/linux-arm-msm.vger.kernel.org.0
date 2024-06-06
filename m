Return-Path: <linux-arm-msm+bounces-21908-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7510D8FE57D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 13:36:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 96B1DB2379B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 11:36:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 480D819596D;
	Thu,  6 Jun 2024 11:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dGd402fG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40C0919596E
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Jun 2024 11:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717673770; cv=none; b=hgaTwpbyOy9NI+VUPmGjJ98EbMXX7vrrO1Ywc1yGo8jw4Icyehz/3ITcBKmhECoNQMI5dAfXWqgdpjleOaQIEuAdLOshOcaSpOhTZFpzYdl1UxXOBNotOcu64zL3OJ3rQNCG/AGhLT2Tvkk28NEceuCIX83TYNKqhozgsOSwGNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717673770; c=relaxed/simple;
	bh=/qpiheDuHQp2YaBAQ+Lb7FOLLyXtkg2hWH6UlH5R5zA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JO78DbFIpkDxNyAhhlZbp4a9mFF9zlVPI9GMmle5aBZMFr/z5/CszGlplNjUH6TtRHTqEf/50qf2GKPVHdfjLCTNZDfE1/OB0IsM/3NEK3ce9cXfF8UVT9qEUd+6mpCsC0tjBEctasmsTlh1kKpWhioFMA3c4D7S54bJH28iPCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dGd402fG; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a68e7538cfaso109836066b.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jun 2024 04:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717673766; x=1718278566; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BSnM/oZJbndKg9aMrgpLItXBoYBY1c6r3d9VAFK5xDQ=;
        b=dGd402fG9529ddAHpzxZW1wT0TkOU4jApJPXSILD81AVCaHzuAh86FqbZmSrfDiCd2
         ge2DXOqKUxtlUPCX7Geo3Y29lIHOkOeivaMMp4OnOv6w+CLQ+3+ijVUOzMGvXvxA+T1c
         Dv9aNuY0MghBfO8EkZzljpiCk4QI2yMUDOGE7Mc7YTGHaRlSFkoUKdUBEBZuZPja0+d/
         XqMOt6Xn8OxbN+OzHZ1Si5vK+6ntVQoloYcE7c4t8yRzVbXhkiVpk3Kki0PbIU/yPMP/
         C5/ykOysucGi2bdhn6k2uOeRZ/7WfDwCA/X+kSs0eWbW7FMuOeH6HeISQ+KpCbmn33Ob
         xHAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717673766; x=1718278566;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BSnM/oZJbndKg9aMrgpLItXBoYBY1c6r3d9VAFK5xDQ=;
        b=VCrYyjm5tkSiq02X0I96nwyY5yVjkxurP/pSUlTYhvcUcKi707mPGMho8hOmIEFYgW
         Av/aOPsFICIjJ9AgUARn7DisdKB/6Grn8cSrc3qdVQwULjVlYHOe6OEI79MvS6v2iQnM
         JSJtydzWt6hJ6lZ4sZ2v+TO0IH9DQgREmC/+5L+J0GU8NQaStyiTw6JDHeuRdczbxrQh
         2tkkiI1j6DhYfNKqhlL/2lN3Y+DF4Hm1BuvBHzrL2d9cHRnZPgNacJYB1SULajMN2NO8
         H52/NxSKEp3uBSP59AufGIk7S2Cx9kCprod6vzuWTsXF/B/Y4fKatlohfP81qhEra963
         hUSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWRYqHie65/32uZtynBrsv4dR6KbZDJivYlg8MBaY9wEmrCepIV2S31oM8YsUru5bbjYRchzSN76tCFqfVfw7hsKk+8osu7SVPJVwfJAg==
X-Gm-Message-State: AOJu0Yxn/BtF+16wTWBL8VXpF2SSUr9CXZE/XGjvdjRWyf+2YZAlpnpR
	s4d2FzNPYlVX1FU7NkkZZkF5B0cc1yhMgXG0cRoRLqXq3aA7jfnAWIsvFMifEOc=
X-Google-Smtp-Source: AGHT+IG8xikVZuweD3rhNVWlCVJ0Nl34MwZeFWaeQYyU9TiFrovwu5MglGA/y+cB5ZgrM1MbLvcKsw==
X-Received: by 2002:a17:906:380c:b0:a68:fe1f:c0bd with SMTP id a640c23a62f3a-a69a023b4f4mr357937966b.73.1717673766605;
        Thu, 06 Jun 2024 04:36:06 -0700 (PDT)
Received: from [192.168.128.139] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6c80581c05sm84014866b.7.2024.06.06.04.36.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 04:36:06 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Thu, 06 Jun 2024 13:36:01 +0200
Subject: [PATCH v4 2/5] clk: qcom: clk-alpha-pll: Add HUAYRA_2290 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240606-topic-rb1_gpu-v4-2-4bc0c19da4af@linaro.org>
References: <20240606-topic-rb1_gpu-v4-0-4bc0c19da4af@linaro.org>
In-Reply-To: <20240606-topic-rb1_gpu-v4-0-4bc0c19da4af@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1717673761; l=4384;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=/qpiheDuHQp2YaBAQ+Lb7FOLLyXtkg2hWH6UlH5R5zA=;
 b=I0Tu0zm0GJQ9wAY6hCkC5pb2eBz91xkdqluHUc+9wNOwFixJwEc8l50+kUXa/uitOpK4aETxU
 xJOOGym9oh9DGAtxY8Evnemf/Z5igWrl4ZNQjAzVKJgAg1R6sv0iykg
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Commit 134b55b7e19f ("clk: qcom: support Huayra type Alpha PLL")
introduced an entry to the alpha offsets array, but diving into QCM2290
downstream and some documentation, it turned out that the name Huayra
apparently has been used quite liberally across many chips, even with
noticeably different hardware.

Introduce another set of offsets and a new configure function for the
Huayra PLL found on QCM2290. This is required e.g. for the consumers
of GPUCC_PLL0 to properly start.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/clk-alpha-pll.c | 47 ++++++++++++++++++++++++++++++++++++++++
 drivers/clk/qcom/clk-alpha-pll.h |  3 +++
 2 files changed, 50 insertions(+)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index c51647e37df8..d87314042528 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -93,6 +93,19 @@ const u8 clk_alpha_pll_regs[][PLL_OFF_MAX_REGS] = {
 		[PLL_OFF_TEST_CTL] = 0x30,
 		[PLL_OFF_TEST_CTL_U] = 0x34,
 	},
+	[CLK_ALPHA_PLL_TYPE_HUAYRA_2290] =  {
+		[PLL_OFF_L_VAL] = 0x04,
+		[PLL_OFF_ALPHA_VAL] = 0x08,
+		[PLL_OFF_USER_CTL] = 0x0c,
+		[PLL_OFF_CONFIG_CTL] = 0x10,
+		[PLL_OFF_CONFIG_CTL_U] = 0x14,
+		[PLL_OFF_CONFIG_CTL_U1] = 0x18,
+		[PLL_OFF_TEST_CTL] = 0x1c,
+		[PLL_OFF_TEST_CTL_U] = 0x20,
+		[PLL_OFF_TEST_CTL_U1] = 0x24,
+		[PLL_OFF_OPMODE] = 0x28,
+		[PLL_OFF_STATUS] = 0x38,
+	},
 	[CLK_ALPHA_PLL_TYPE_BRAMMO] =  {
 		[PLL_OFF_L_VAL] = 0x04,
 		[PLL_OFF_ALPHA_VAL] = 0x08,
@@ -788,6 +801,40 @@ static long clk_alpha_pll_round_rate(struct clk_hw *hw, unsigned long rate,
 	return clamp(rate, min_freq, max_freq);
 }
 
+void clk_huayra_2290_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
+				   const struct alpha_pll_config *config)
+{
+	u32 val;
+
+	clk_alpha_pll_write_config(regmap, PLL_CONFIG_CTL(pll), config->config_ctl_val);
+	clk_alpha_pll_write_config(regmap, PLL_CONFIG_CTL_U(pll), config->config_ctl_hi_val);
+	clk_alpha_pll_write_config(regmap, PLL_CONFIG_CTL_U1(pll), config->config_ctl_hi1_val);
+	clk_alpha_pll_write_config(regmap, PLL_TEST_CTL(pll), config->test_ctl_val);
+	clk_alpha_pll_write_config(regmap, PLL_TEST_CTL_U(pll), config->test_ctl_hi_val);
+	clk_alpha_pll_write_config(regmap, PLL_TEST_CTL_U1(pll), config->test_ctl_hi1_val);
+	clk_alpha_pll_write_config(regmap, PLL_L_VAL(pll), config->l);
+	clk_alpha_pll_write_config(regmap, PLL_ALPHA_VAL(pll), config->alpha);
+	clk_alpha_pll_write_config(regmap, PLL_USER_CTL(pll), config->user_ctl_val);
+
+	/* Set PLL_BYPASSNL */
+	regmap_update_bits(regmap, PLL_MODE(pll), PLL_BYPASSNL, PLL_BYPASSNL);
+	regmap_read(regmap, PLL_MODE(pll), &val);
+
+	/* Wait 5 us between setting BYPASS and deasserting reset */
+	udelay(5);
+
+	/* Take PLL out from reset state */
+	regmap_update_bits(regmap, PLL_MODE(pll), PLL_RESET_N, PLL_RESET_N);
+	regmap_read(regmap, PLL_MODE(pll), &val);
+
+	/* Wait 50us for PLL_LOCK_DET bit to go high */
+	usleep_range(50, 55);
+
+	/* Enable PLL output */
+	regmap_update_bits(regmap, PLL_MODE(pll), PLL_OUTCTRL, PLL_OUTCTRL);
+}
+EXPORT_SYMBOL_GPL(clk_huayra_2290_pll_configure);
+
 static unsigned long
 alpha_huayra_pll_calc_rate(u64 prate, u32 l, u32 a)
 {
diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
index c7055b6c42f1..df8f0fe15531 100644
--- a/drivers/clk/qcom/clk-alpha-pll.h
+++ b/drivers/clk/qcom/clk-alpha-pll.h
@@ -16,6 +16,7 @@ enum {
 	CLK_ALPHA_PLL_TYPE_DEFAULT,
 	CLK_ALPHA_PLL_TYPE_HUAYRA,
 	CLK_ALPHA_PLL_TYPE_HUAYRA_APSS,
+	CLK_ALPHA_PLL_TYPE_HUAYRA_2290,
 	CLK_ALPHA_PLL_TYPE_BRAMMO,
 	CLK_ALPHA_PLL_TYPE_FABIA,
 	CLK_ALPHA_PLL_TYPE_TRION,
@@ -194,6 +195,8 @@ extern const struct clk_ops clk_alpha_pll_rivian_evo_ops;
 
 void clk_alpha_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
 			     const struct alpha_pll_config *config);
+void clk_huayra_2290_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
+				   const struct alpha_pll_config *config);
 void clk_fabia_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
 				const struct alpha_pll_config *config);
 void clk_trion_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,

-- 
2.45.2


