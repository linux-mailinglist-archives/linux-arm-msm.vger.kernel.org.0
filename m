Return-Path: <linux-arm-msm+bounces-36203-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 64FBE9B398C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 19:49:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2A510282CED
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 18:49:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BD441E00AF;
	Mon, 28 Oct 2024 18:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tu/IewWd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E141DFE23;
	Mon, 28 Oct 2024 18:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730141310; cv=none; b=j1dnvl0ca6AUDu1wX8CmhlhFsQO4UQfo6euC52ddBMKtBiEs5ooIhCZ9XA28sk+vf6IZUbtmuOsL3kzsbQQOA0UY/yjjkizVH8qGhbRwvHn8//9lGLAc/URto64TXIAIZLoVH/1PtSL56JLVFICINcxNnmE27Qtm7psPC6iB+IM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730141310; c=relaxed/simple;
	bh=yM0OWmtAcDKn2FuZk6in24tAsAFJrfmMDU9dm2pIGiU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sNVl1scrsX/wy9kLyI4cGVRlNPvRkesz2I8qSvN6SlAosyIy0cO9uUO03Njxo601IThe/Jn+x4MrsPwA+CgAZcUcCDuB6tbx4lDgJpXvubMomUYvdB9YtepP9t5tfB3K1dDmPOP4aIJQfR7RuUVBWTgdVpaV27SpdaabHZ0A9pA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tu/IewWd; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a9a16b310f5so725249166b.0;
        Mon, 28 Oct 2024 11:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730141307; x=1730746107; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IBKU3i7B0mk4YfvFEK4QQaKbeBZNcN9N7bMX66oe7cQ=;
        b=Tu/IewWdjbJ96/TeQNG2PMvEUTX25ATDQm9alOo5dXUJjqBa3Lw8F90liYvqn5JhEm
         yg+//pjRbAl6NW5GgkTXotGUAPfLJE9g16JMzAjrgnx3OXEyFBimzQkx5M+GBz+ZBooq
         VlLh56yClbJ0mTGS408OIqBBvZbWSTKRfiwRpyEGYmRAc14U2gfYYeb/FhvAmUfY4HH6
         n0RfRSzdJLUSlo9BwlIDE0TGjZsGSzXXVP59zGAH7luEUnWfZ1/Mczvz9ArAMBdOG/XM
         aFuCUnV9YOkQ1Wy5vlYu/RjRl/Gwr3YpQ1V8pD/rF7DINxAKB9BPdDRL1uKm9OcmXw/3
         ZqcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730141307; x=1730746107;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IBKU3i7B0mk4YfvFEK4QQaKbeBZNcN9N7bMX66oe7cQ=;
        b=MTN+ZFGTtwk5A8zndSnGCxA2N8JiGjdUxx5sWKK3VqMZbZajANTXfzeEXJZE3S2z9x
         OGWH/MCVCNQGM08ppN/EHv8P4aGsUpIxASiLtp70Exe8Se0AhsgnxfmndIxMVsGx3pE4
         YaJ2dXT5HtJcL3euSw/mDx+go7mkmS4vDxKCPCyPNN6Rigch93MWFR/IvHIgWhTlreCu
         RRFHgnNnwuEB0w6SI4N+TY98IkPz60C+z5qC5R4EiWqrCL9SO+6+aXxqQvYic/WVSl1U
         aL9cu0UbdM0Nuyp3ydZBktyPMsWNYSla/tQCJStXy+yDEVxVpCdfpWpBGVGgAw97hYJE
         t65Q==
X-Forwarded-Encrypted: i=1; AJvYcCURq2RCNV7633pdFqijX4iVT0VrqP3JQAmBbE+wQThZ6588HmXfuoEIahjvwnxyFni+SepFelsXsBTlTLOo@vger.kernel.org, AJvYcCWZ7zySTxcwFzlpNezWS1aox1p2oZXgOIDBgutrml96ddFXTa0h0E3au+6g0QawqdXmXqWgAonRHCs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4agj4nkrPk80ZKeXTSDnfGmjT25jzYoupNK7FOsFmO9yBWt3Q
	ZKcUE9lwytLcvN7EI7mlGrO+P5WLclegAOQgK2aEfkblksOaJE99WShvHg==
X-Google-Smtp-Source: AGHT+IHvbm0YXq5I5z7ls6NUwBrW0g1B7TNGWLeHRTUpyQ8rJAobLexARTglStPKazAs2xEKKpnWwQ==
X-Received: by 2002:a17:907:7ea2:b0:a99:f4c3:580d with SMTP id a640c23a62f3a-a9de61a0042mr658100166b.42.1730141306868;
        Mon, 28 Oct 2024 11:48:26 -0700 (PDT)
Received: from [192.168.0.2] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a9b1f029617sm397585166b.81.2024.10.28.11.48.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 11:48:26 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Mon, 28 Oct 2024 19:48:17 +0100
Subject: [PATCH v2 3/5] clk: qcom: gcc-ipq6018: remove alpha values from
 NSS Crypto PLL's config
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241028-alpha-mode-cleanup-v2-3-9bc6d712bd76@gmail.com>
References: <20241028-alpha-mode-cleanup-v2-0-9bc6d712bd76@gmail.com>
In-Reply-To: <20241028-alpha-mode-cleanup-v2-0-9bc6d712bd76@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.2

Since both the 'alpha' and 'alpha_hi' members of the configuration is
initialized with zero values, the output rate of the PLL will be the
same whether alpha mode is enabled or not.

Remove the initialization of the alpha* members to make it clear that
alpha mode is not required to get the desired output rate.

Despite that enabling alpha mode is not needed for the initial
configuration, the set_rate() op might require that it is enabled
already. In this particular case however, the clk_alpha_pll_set_rate()
function will get reset the ALPHA_EN bit when the PLL's rate changes,
so dropping 'alpha_en_mask' is safe.

While at it, also add a comment to indicate the frequency the PLL runs
at with the current configuration.

No functional changes, the PLL runs at 1.2 GHz both before and after
the change.

Tested on Xiaomi Mi Router AX1800 (IPQ6018, out-of-tree board).

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
Changes in v2:
  - extend the commit message to indicate that dropping 'alpha_en_mask' is safe
  - add RB tag from Dmitry
  - Link to v1: https://lore.kernel.org/r/20241021-alpha-mode-cleanup-v1-3-55df8ed73645@gmail.com
---
 drivers/clk/qcom/gcc-ipq6018.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/gcc-ipq6018.c b/drivers/clk/qcom/gcc-ipq6018.c
index ab0f7fc665a9790dd8edba0cf4b86c5c672a337d..d861191b0c85ccc105ac0e62d7a68210c621fc13 100644
--- a/drivers/clk/qcom/gcc-ipq6018.c
+++ b/drivers/clk/qcom/gcc-ipq6018.c
@@ -4194,10 +4194,9 @@ static const struct alpha_pll_config ubi32_pll_config = {
 	.test_ctl_hi_val = 0x4000,
 };
 
+/* 1200 MHz configuration */
 static const struct alpha_pll_config nss_crypto_pll_config = {
 	.l = 0x32,
-	.alpha = 0x0,
-	.alpha_hi = 0x0,
 	.config_ctl_val = 0x4001055b,
 	.main_output_mask = BIT(0),
 	.pre_div_val = 0x0,
@@ -4206,7 +4205,6 @@ static const struct alpha_pll_config nss_crypto_pll_config = {
 	.post_div_mask = GENMASK(11, 8),
 	.vco_mask = GENMASK(21, 20),
 	.vco_val = 0x0,
-	.alpha_en_mask = BIT(24),
 };
 
 static struct clk_hw *gcc_ipq6018_hws[] = {

-- 
2.47.0


