Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48DA546FA13
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Dec 2021 06:19:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229997AbhLJFWu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Dec 2021 00:22:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229984AbhLJFWu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Dec 2021 00:22:50 -0500
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80E25C061746
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Dec 2021 21:19:13 -0800 (PST)
Received: by mail-pj1-x1029.google.com with SMTP id f18-20020a17090aa79200b001ad9cb23022so6597208pjq.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Dec 2021 21:19:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1n5pw55TMAAP+SKn+79BLK8ytK8/fOHPCl2GwuSHIGk=;
        b=IHdhVUZRyIP1kDwF23TNlIYr6AflXGTL2Qhb9EsRD1szNGl8+dGgQ5n1MhRenEftjk
         Xwkz7FuxaLl0mJCgdMdD33+Kgb5Uh3THJ/6L9xAKMBCoL1ND/sQXakUU1Xd+DJvB6Qnz
         693i9PEsie4ilayw7bYnX/sVTT+U+AsT8yAcI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1n5pw55TMAAP+SKn+79BLK8ytK8/fOHPCl2GwuSHIGk=;
        b=W9/Qhv7MuCaD5mqFTnfyZd6/2hpaizQAnblbmUucxWa6Qh11SsPJWPIvdXzbb9L9Du
         1Mm4/VnGVc/5tuGzNclPPrjr2fzCzXTzdHUj4hIespD8ytfyeNLOkPQ2OKHwXkM3Nr3e
         96x3znhPUEEgmVxEqsbwDLbFpOU9pXOw+s+lVfsjqbVIe8hpumeWD/S7UMEUoQBXvkdS
         LCrht3ZVXfyY9OidwzuWCT21+bGuWXPHnwg0ZZaCTZHn2jo9PDFXCMK/ft2IDawXElvR
         upKRolo3eqKwpAysY5T+gTUdEFSmFcqiTjCzOEVmBIShfaMU8/KRh/D/0XwCtseJOmNE
         VvhA==
X-Gm-Message-State: AOAM530Srzu0PEvY9mcTkEasTpr2K4zqvjVeZ1WOMP9T41ottzYZcJhK
        c5ZZ0Mo1s2H6koB1h5MgNtNCHw==
X-Google-Smtp-Source: ABdhPJz5InQ30owmtXBOEYTl9rLRYViCgmknbgMPnXE21LrK5AmdsKgwgw42dmFnbwrS3kjE08um9A==
X-Received: by 2002:a17:90b:50c:: with SMTP id r12mr21177490pjz.71.1639113553400;
        Thu, 09 Dec 2021 21:19:13 -0800 (PST)
Received: from judyhsiao-p920.tpe.corp.google.com ([2401:fa00:1:10:ac18:fa:d4fe:57bf])
        by smtp.gmail.com with ESMTPSA id f3sm1197853pgv.51.2021.12.09.21.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 21:19:12 -0800 (PST)
From:   Judy Hsiao <judyhsiao@chromium.org>
To:     broonie@kernel.org
Cc:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, dianders@chromium.org,
        cychiang@google.com, judyhsiao@google.com, swboyd@chromium.org,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        Judy Hsiao <judyhsiao@chromium.org>
Subject: [PATCH] SoC: qcom: Distinguish headset codec by codec_dai->name
Date:   Fri, 10 Dec 2021 13:19:07 +0800
Message-Id: <20211210051907.3870109-1-judyhsiao@chromium.org>
X-Mailer: git-send-email 2.34.1.173.g76aa8bc2d0-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Distinguish which headset codec is on the board by codec_dai->name
instead of card->name.

Fixes: 425c5fce8a03 ("ASoC: qcom: Add support for ALC5682I-VS codec")
Signed-off-by: Judy Hsiao <judyhsiao@chromium.org>
---
 sound/soc/qcom/sc7180.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/sc7180.c b/sound/soc/qcom/sc7180.c
index 2fff764a00a7..37225ef2563a 100644
--- a/sound/soc/qcom/sc7180.c
+++ b/sound/soc/qcom/sc7180.c
@@ -131,13 +131,13 @@ static int sc7180_snd_startup(struct snd_pcm_substream *substream)
 	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
 	int pll_id, pll_source, pll_in, pll_out, clk_id, ret;
 
-	if (!(strcmp(card->name, "sc7180-rt5682-max98357a-1mic"))) {
+	if (!strcmp(codec_dai->name, "rt5682-aif1")) {
 		pll_source = RT5682_PLL1_S_MCLK;
 		pll_id = 0;
 		clk_id = RT5682_SCLK_S_PLL1;
 		pll_out = RT5682_PLL1_FREQ;
 		pll_in = DEFAULT_MCLK_RATE;
-	} else if (!(strcmp(card->name, "sc7180-rt5682s-max98357a-1mic"))) {
+	} else if (!strcmp(codec_dai->name, "rt5682s-aif1")) {
 		pll_source = RT5682S_PLL_S_MCLK;
 		pll_id = RT5682S_PLL2;
 		clk_id = RT5682S_SCLK_S_PLL2;
-- 
2.34.1.173.g76aa8bc2d0-goog

