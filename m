Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8ADB4148EF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Sep 2021 14:32:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235982AbhIVMd6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Sep 2021 08:33:58 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:17160 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236025AbhIVMdq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Sep 2021 08:33:46 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1632313937; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=ONfhviwd9VOib+IHTwvjYtTVT1j7IHHl6KkzeCNnwFM=; b=VA3A6PuDQxCkZKxLiafcUk9zLrH6tskVCVnnXVgIAnAvg25Qr1XoTbrXsBTzTkFOfFCkFBzN
 yMLoTcgRN/CgP/ykPKwEH1vc5zW0wleBMlxI0G+fL0IWDi/vDcD/jNRrEi3Kel9maNCAIo06
 m4zTUJm9vMHe7F4UrUt6cpVGSrw=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 614b224f648642cc1c97cceb (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 22 Sep 2021 12:32:15
 GMT
Sender: srivasam=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id ADC7CC43639; Wed, 22 Sep 2021 12:32:14 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from hu-srivasam-hyd.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: srivasam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7F8A4C43638;
        Wed, 22 Sep 2021 12:32:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 7F8A4C43638
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
        bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
        srinivas.kandagatla@linaro.org, rohitkr@codeaurora.org,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        swboyd@chromium.org, judyhsiao@chromium.org
Cc:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        Venkata Prasad Potturu <potturu@codeaurora.org>
Subject: [PATCH v2 5/5] ASoC: codecs: Change bulk clock voting to optional voting in digital codecs
Date:   Wed, 22 Sep 2021 18:01:18 +0530
Message-Id: <1632313878-12089-6-git-send-email-srivasam@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1632313878-12089-1-git-send-email-srivasam@codeaurora.org>
References: <agross@kernel.org; bjorn.andersson@linaro.org; lgirdwood@gmail.com; broonie@kernel.org;robh+dt@kernel.org; plai@codeaurora.org; bgoswami@codeaurora.org; perex@perex.cz; tiwai@suse.com;srinivas.kandagatla@linaro.org; rohitkr@codeaurora.org; linux-arm-msm@vger.kernel.org; alsa-devel@alsa-project.org; devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; swboyd@chromium.org; judyhsiao@chromium.org;>
 <1632313878-12089-1-git-send-email-srivasam@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Change bulk clock frequency voting to optional bulk voting in va, rx and tx macros
to accommodate both ADSP and ADSP bypass based lpass architectures.

Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
---
 sound/soc/codecs/lpass-rx-macro.c | 2 +-
 sound/soc/codecs/lpass-tx-macro.c | 2 +-
 sound/soc/codecs/lpass-va-macro.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index c2b9333..2bed5cf 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -3531,7 +3531,7 @@ static int rx_macro_probe(struct platform_device *pdev)
 	rx->clks[3].id = "npl";
 	rx->clks[4].id = "fsgen";
 
-	ret = devm_clk_bulk_get(dev, RX_NUM_CLKS_MAX, rx->clks);
+	ret = devm_clk_bulk_get_optional(dev, RX_NUM_CLKS_MAX, rx->clks);
 	if (ret) {
 		dev_err(dev, "Error getting RX Clocks (%d)\n", ret);
 		return ret;
diff --git a/sound/soc/codecs/lpass-tx-macro.c b/sound/soc/codecs/lpass-tx-macro.c
index 66c39fb..c288471 100644
--- a/sound/soc/codecs/lpass-tx-macro.c
+++ b/sound/soc/codecs/lpass-tx-macro.c
@@ -1794,7 +1794,7 @@ static int tx_macro_probe(struct platform_device *pdev)
 	tx->clks[3].id = "npl";
 	tx->clks[4].id = "fsgen";
 
-	ret = devm_clk_bulk_get(dev, TX_NUM_CLKS_MAX, tx->clks);
+	ret = devm_clk_bulk_get_optional(dev, TX_NUM_CLKS_MAX, tx->clks);
 	if (ret) {
 		dev_err(dev, "Error getting RX Clocks (%d)\n", ret);
 		return ret;
diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
index 70f09b4..11147e3 100644
--- a/sound/soc/codecs/lpass-va-macro.c
+++ b/sound/soc/codecs/lpass-va-macro.c
@@ -1408,7 +1408,7 @@ static int va_macro_probe(struct platform_device *pdev)
 	va->clks[1].id = "dcodec";
 	va->clks[2].id = "mclk";
 
-	ret = devm_clk_bulk_get(dev, VA_NUM_CLKS_MAX, va->clks);
+	ret = devm_clk_bulk_get_optional(dev, VA_NUM_CLKS_MAX, va->clks);
 	if (ret) {
 		dev_err(dev, "Error getting VA Clocks (%d)\n", ret);
 		return ret;
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

