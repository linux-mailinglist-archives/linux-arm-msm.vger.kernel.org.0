Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 808354B012C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Feb 2022 00:26:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229899AbiBIXZs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Feb 2022 18:25:48 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:34952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229742AbiBIXZo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Feb 2022 18:25:44 -0500
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B841E0939E5
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Feb 2022 15:25:38 -0800 (PST)
Received: by mail-pj1-x1035.google.com with SMTP id v5-20020a17090a4ec500b001b8b702df57so6753814pjl.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Feb 2022 15:25:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cuDyqJtQkOZWq7GCqSKtM5Nekpy0WS9Wr09B0b+ZHEk=;
        b=mJUGs196QE4e+93P3XrLjGhPpdg6y+RWphSnf3Fr4PTAuc+HnrZgbhtvd06SXDn+gS
         GCqMgHjSLUhtpWCMI8WWXfqRS5edno6KEmX84YaoGfeDhvuzbjw7RdE7vhZFdoNXuEmA
         NEk2vKgifQiIGBMIiEdCXmVq6VOHYD3mph42Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cuDyqJtQkOZWq7GCqSKtM5Nekpy0WS9Wr09B0b+ZHEk=;
        b=AQClB6JAuJ1nWkxRHfObwfr7RX7N0w8uIVuqY4vPuLe7E4T/pfB75OJFDu4BFd3Ik6
         xaqnh4mgdzlO59/XjS/JE6ngxn3W51hAA72Xs5Fv8nuDxnRI+NfJPxzuBuKun6/hw0Bv
         j//5quBckVEJJsBReiMs1H1ynxNXgtAV/Vbea1qWRAtCK5E8sljA8N8l/Zd66y9NkHeO
         ErPwT4qWdzB66pmGV5k1kF/BxNWCazCLxgp/20653JXz3MhqNY5B0S0Dxtb9Ufg2lS04
         84cnwRKEuVbLAYoo8xbYHymdE5H1LZA/W4J39iSFAjKzSRAPxlaB9qg0Dp8NcOYRXH+g
         5BJA==
X-Gm-Message-State: AOAM5300tMjargkahdJLFFiremSG3k1xJZlDdg+Ub6169m5yIGgbAYC/
        nYHi3PczhhBaLqZiAaRJj1iVCg==
X-Google-Smtp-Source: ABdhPJyFlluWkTGxIDD8DAe+Rrtl/A4H7tmBZt3vNUZHOenuccFvdMBHj1zHh72rB0o4uWqYwAMcTw==
X-Received: by 2002:a17:90a:7083:: with SMTP id g3mr5220486pjk.209.1644449122551;
        Wed, 09 Feb 2022 15:25:22 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:201:5193:6865:e38e:3a5b])
        by smtp.gmail.com with ESMTPSA id u12sm22067162pfk.220.2022.02.09.15.25.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Feb 2022 15:25:22 -0800 (PST)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Mark Brown <broonie@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org,
        Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Subject: [PATCH] ASoC: qcom: Actually clear DMA interrupt register for HDMI
Date:   Wed,  9 Feb 2022 15:25:20 -0800
Message-Id: <20220209232520.4017634-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.35.1.265.g69c8d7142f-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In commit da0363f7bfd3 ("ASoC: qcom: Fix for DMA interrupt clear reg
overwriting") we changed regmap_write() to regmap_update_bits() so that
we can avoid overwriting bits that we didn't intend to modify.
Unfortunately this change breaks the case where a register is writable
but not readable, which is exactly how the HDMI irq clear register is
designed (grep around LPASS_HDMITX_APP_IRQCLEAR_REG to see how it's
write only). That's because regmap_update_bits() tries to read the
register from the hardware and if it isn't readable it looks in the
regmap cache to see what was written there last time to compare against
what we want to write there. Eventually, we're unable to modify this
register at all because the bits that we're trying to set are already
set in the cache.

This is doubly bad for the irq clear register because you have to write
the bit to clear an interrupt. Given the irq is level triggered, we see
an interrupt storm upon plugging in an HDMI cable and starting audio
playback. The irq storm is so great that performance degrades
significantly, leading to CPU soft lockups.

Fix it by using regmap_write_bits() so that we really do write the bits
in the clear register that we want to. This brings the number of irqs
handled by lpass_dma_interrupt_handler() down from ~150k/sec to ~10/sec.

Fixes: da0363f7bfd3 ("ASoC: qcom: Fix for DMA interrupt clear reg overwriting")
Cc: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 sound/soc/qcom/lpass-platform.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
index a59e9d20cb46..4b1773c1fb95 100644
--- a/sound/soc/qcom/lpass-platform.c
+++ b/sound/soc/qcom/lpass-platform.c
@@ -524,7 +524,7 @@ static int lpass_platform_pcmops_trigger(struct snd_soc_component *component,
 			return -EINVAL;
 		}
 
-		ret = regmap_update_bits(map, reg_irqclr, val_irqclr, val_irqclr);
+		ret = regmap_write_bits(map, reg_irqclr, val_irqclr, val_irqclr);
 		if (ret) {
 			dev_err(soc_runtime->dev, "error writing to irqclear reg: %d\n", ret);
 			return ret;
@@ -665,7 +665,7 @@ static irqreturn_t lpass_dma_interrupt_handler(
 	return -EINVAL;
 	}
 	if (interrupts & LPAIF_IRQ_PER(chan)) {
-		rv = regmap_update_bits(map, reg, mask, (LPAIF_IRQ_PER(chan) | val));
+		rv = regmap_write_bits(map, reg, mask, (LPAIF_IRQ_PER(chan) | val));
 		if (rv) {
 			dev_err(soc_runtime->dev,
 				"error writing to irqclear reg: %d\n", rv);
@@ -676,7 +676,7 @@ static irqreturn_t lpass_dma_interrupt_handler(
 	}
 
 	if (interrupts & LPAIF_IRQ_XRUN(chan)) {
-		rv = regmap_update_bits(map, reg, mask, (LPAIF_IRQ_XRUN(chan) | val));
+		rv = regmap_write_bits(map, reg, mask, (LPAIF_IRQ_XRUN(chan) | val));
 		if (rv) {
 			dev_err(soc_runtime->dev,
 				"error writing to irqclear reg: %d\n", rv);
@@ -688,7 +688,7 @@ static irqreturn_t lpass_dma_interrupt_handler(
 	}
 
 	if (interrupts & LPAIF_IRQ_ERR(chan)) {
-		rv = regmap_update_bits(map, reg, mask, (LPAIF_IRQ_ERR(chan) | val));
+		rv = regmap_write_bits(map, reg, mask, (LPAIF_IRQ_ERR(chan) | val));
 		if (rv) {
 			dev_err(soc_runtime->dev,
 				"error writing to irqclear reg: %d\n", rv);

base-commit: dfd42facf1e4ada021b939b4e19c935dcdd55566
-- 
https://chromeos.dev

