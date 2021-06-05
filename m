Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD9C639C7EB
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Jun 2021 13:38:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230169AbhFELkT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 5 Jun 2021 07:40:19 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:61027 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229933AbhFELkT (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 5 Jun 2021 07:40:19 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1622893111; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=I9mTsoSll4PU6WpX6xvp32UhW4o+I4xgxF3zmKj0BYo=; b=Od+kioVS/0nwM+qPCtm0vaNDN9XjL8M3NwXb5iwUI90OfGCqW/1VYVSHqEu5dzHTeq4MVOGs
 Jp+IUs2wZF2+f3KDsVt1/0OWGL2zu6LJONEtH1St4zGniX8RxxhHxBxrtS3uwTYJeRRxvHcq
 qMyzp75wpOX97byQvl4sD3Za95w=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 60bb62376ddc3305c492e3b6 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 05 Jun 2021 11:38:31
 GMT
Sender: srivasam=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 082DEC433F1; Sat,  5 Jun 2021 11:38:30 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from hyd-lnxbld210.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: srivasam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 00B5DC433F1;
        Sat,  5 Jun 2021 11:38:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 00B5DC433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=srivasam@codeaurora.org
From:   Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
        bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
        srinivas.kandagatla@linaro.org, rohitkr@codeaurora.org,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        swboyd@chromium.org, judyhsiao@chromium.org
Cc:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Subject: [PATCH v2] ASoC: qcom: Fix for DMA interrupt clear reg overwriting
Date:   Sat,  5 Jun 2021 17:08:09 +0530
Message-Id: <20210605113809.26584-1-srivasam@codeaurora.org>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The DMA interrupt clear register overwritten during
simultaneous playback and capture in lpass platform
interrupt handler. It's causing playback or capture stuck
in similtaneous plaback on speaker and capture on dmic test.
Update appropriate reg fields of corresponding channel instead
of entire register write.

Fixes: commit c5c8635a04711 ("ASoC: qcom: Add LPASS platform driver")

Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
---
 sound/soc/qcom/lpass-platform.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
index 0df9481ea4c6..f220a2739ac3 100644
--- a/sound/soc/qcom/lpass-platform.c
+++ b/sound/soc/qcom/lpass-platform.c
@@ -526,7 +526,7 @@ static int lpass_platform_pcmops_trigger(struct snd_soc_component *component,
 			return -EINVAL;
 		}
 
-		ret = regmap_write(map, reg_irqclr, val_irqclr);
+		ret = regmap_update_bits(map, reg_irqclr, val_irqclr, val_irqclr);
 		if (ret) {
 			dev_err(soc_runtime->dev, "error writing to irqclear reg: %d\n", ret);
 			return ret;
@@ -650,7 +650,7 @@ static irqreturn_t lpass_dma_interrupt_handler(
 	struct lpass_variant *v = drvdata->variant;
 	irqreturn_t ret = IRQ_NONE;
 	int rv;
-	unsigned int reg = 0, val = 0;
+	unsigned int reg, val, val_clr, val_mask;
 	struct regmap *map;
 	unsigned int dai_id = cpu_dai->driver->id;
 
@@ -676,8 +676,9 @@ static irqreturn_t lpass_dma_interrupt_handler(
 	return -EINVAL;
 	}
 	if (interrupts & LPAIF_IRQ_PER(chan)) {
-
-		rv = regmap_write(map, reg, LPAIF_IRQ_PER(chan) | val);
+		val_clr = LPAIF_IRQ_PER(chan) | val;
+		val_mask = LPAIF_IRQ_ALL(chan);
+		rv = regmap_update_bits(map, reg, val_mask, val_clr);
 		if (rv) {
 			dev_err(soc_runtime->dev,
 				"error writing to irqclear reg: %d\n", rv);
@@ -688,7 +689,9 @@ static irqreturn_t lpass_dma_interrupt_handler(
 	}
 
 	if (interrupts & LPAIF_IRQ_XRUN(chan)) {
-		rv = regmap_write(map, reg, LPAIF_IRQ_XRUN(chan) | val);
+		val_clr = (LPAIF_IRQ_XRUN(chan) | val);
+		val_mask = LPAIF_IRQ_ALL(chan);
+		rv = regmap_update_bits(map, reg, val_mask, val_clr);
 		if (rv) {
 			dev_err(soc_runtime->dev,
 				"error writing to irqclear reg: %d\n", rv);
@@ -700,7 +703,9 @@ static irqreturn_t lpass_dma_interrupt_handler(
 	}
 
 	if (interrupts & LPAIF_IRQ_ERR(chan)) {
-		rv = regmap_write(map, reg, LPAIF_IRQ_ERR(chan) | val);
+		val_clr = (LPAIF_IRQ_ERR(chan) | val);
+		val_mask = LPAIF_IRQ_ALL(chan);
+		rv = regmap_update_bits(map, reg, val_mask, val_clr);
 		if (rv) {
 			dev_err(soc_runtime->dev,
 				"error writing to irqclear reg: %d\n", rv);
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

