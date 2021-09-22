Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAC9C4148EC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Sep 2021 14:32:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235965AbhIVMdn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Sep 2021 08:33:43 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:39411 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235999AbhIVMdl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Sep 2021 08:33:41 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1632313931; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=gd9CIAgwqWfRYTCEFH89z24s5B6k8ycDJ78NCZG0Sj8=; b=hQ/VNN6NWch+6y3WEwk/9ji3N8PJG0W5cO0r8LCTEtDqhraRs3V5yC4z+pooBm/bPs+Rq/Ws
 jZVR3qucRGGTkQzwPJdq8Rb40HgBNnqesF8OiIkh24IznZv/XO0d5K7dwTlZDwU5NnXnhczr
 PhlmQREc21Vmlxk6dU4hFJZ33eY=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 614b224abd6681d8ed053dee (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 22 Sep 2021 12:32:10
 GMT
Sender: srivasam=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 05AD9C43637; Wed, 22 Sep 2021 12:32:09 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from hu-srivasam-hyd.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: srivasam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 1E53CC43635;
        Wed, 22 Sep 2021 12:32:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 1E53CC43635
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
Subject: [PATCH v2 4/5] ASoC: codecs: tx-macro: Update tx default values
Date:   Wed, 22 Sep 2021 18:01:17 +0530
Message-Id: <1632313878-12089-5-git-send-email-srivasam@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1632313878-12089-1-git-send-email-srivasam@codeaurora.org>
References: <agross@kernel.org; bjorn.andersson@linaro.org; lgirdwood@gmail.com; broonie@kernel.org;robh+dt@kernel.org; plai@codeaurora.org; bgoswami@codeaurora.org; perex@perex.cz; tiwai@suse.com;srinivas.kandagatla@linaro.org; rohitkr@codeaurora.org; linux-arm-msm@vger.kernel.org; alsa-devel@alsa-project.org; devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; swboyd@chromium.org; judyhsiao@chromium.org;>
 <1632313878-12089-1-git-send-email-srivasam@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Update mic control register default values to hardware reset values

Fixes: c39667ddcfc5 (ASoC: codecs: lpass-tx-macro: add support for lpass tx macro)

Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
---
 sound/soc/codecs/lpass-tx-macro.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/lpass-tx-macro.c b/sound/soc/codecs/lpass-tx-macro.c
index e980b2e..66c39fb 100644
--- a/sound/soc/codecs/lpass-tx-macro.c
+++ b/sound/soc/codecs/lpass-tx-macro.c
@@ -279,7 +279,7 @@ static const struct reg_default tx_defaults[] = {
 	{ CDC_TX_CLK_RST_CTRL_SWR_CONTROL, 0x00},
 	{ CDC_TX_TOP_CSR_TOP_CFG0, 0x00},
 	{ CDC_TX_TOP_CSR_ANC_CFG, 0x00},
-	{ CDC_TX_TOP_CSR_SWR_CTRL, 0x00},
+	{ CDC_TX_TOP_CSR_SWR_CTRL, 0x60},
 	{ CDC_TX_TOP_CSR_FREQ_MCLK, 0x00},
 	{ CDC_TX_TOP_CSR_DEBUG_BUS, 0x00},
 	{ CDC_TX_TOP_CSR_DEBUG_EN, 0x00},
@@ -290,8 +290,8 @@ static const struct reg_default tx_defaults[] = {
 	{ CDC_TX_TOP_CSR_SWR_DMIC1_CTL, 0x00},
 	{ CDC_TX_TOP_CSR_SWR_DMIC2_CTL, 0x00},
 	{ CDC_TX_TOP_CSR_SWR_DMIC3_CTL, 0x00},
-	{ CDC_TX_TOP_CSR_SWR_AMIC0_CTL, 0x00},
-	{ CDC_TX_TOP_CSR_SWR_AMIC1_CTL, 0x00},
+	{ CDC_TX_TOP_CSR_SWR_AMIC0_CTL, 0x0E},
+	{ CDC_TX_TOP_CSR_SWR_AMIC1_CTL, 0x0E},
 	{ CDC_TX_INP_MUX_ADC_MUX0_CFG0, 0x00},
 	{ CDC_TX_INP_MUX_ADC_MUX0_CFG1, 0x00},
 	{ CDC_TX_INP_MUX_ADC_MUX1_CFG0, 0x00},
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

