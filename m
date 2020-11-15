Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA01A2B322B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Nov 2020 05:57:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726552AbgKOE52 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 14 Nov 2020 23:57:28 -0500
Received: from z5.mailgun.us ([104.130.96.5]:38280 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726537AbgKOE5W (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 14 Nov 2020 23:57:22 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1605416242; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=DHZQrIgHGobEqfrhC8jO9oXKDIMrd9L7WeOf8QdR/wg=; b=r9tvNCFvETQyQv6biXlmgH32/+pHyuam90NRLSYbTA4ado28uZU+T4RCwSPQ/Ydfli3dPRgg
 CLLXgR/Sr+1pVUYM5qHcImMaQh7zNKBuM54QT4w2oUV+rGAjjdc7/58Akh3VX6aRouTqSUy+
 4dsTl+3egnDxPHJN4d1EHik5WyA=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 5fb0b52937ede2253b5b654c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sun, 15 Nov 2020 04:57:13
 GMT
Sender: srivasam=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 6C88FC43464; Sun, 15 Nov 2020 04:57:13 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from hyd-lnxbld210.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: srivasam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id DB9F2C433C6;
        Sun, 15 Nov 2020 04:57:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org DB9F2C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=srivasam@codeaurora.org
From:   Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
        bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
        srinivas.kandagatla@linaro.org, rohitkr@codeaurora.org,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        Pavel Machek <pavel@ucw.cz>,
        V Sujith Kumar Reddy <vsujithk@codeaurora.org>
Subject: [PATCH] Asoc: qcom: lpass-platform: Fix memory leak
Date:   Sun, 15 Nov 2020 10:26:50 +0530
Message-Id: <1605416210-14530-1-git-send-email-srivasam@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

lpass_pcm_data is not freed in error paths. Free it in
error paths to avoid memory leak.

Fixes: 022d00ee0b55 ("ASoC: lpass-platform: Fix broken pcm data usage")

Signed-off-by: Pavel Machek <pavel@ucw.cz>
Signed-off-by: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
---
 sound/soc/qcom/lpass-platform.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
index 36d1512..7a3fdf8 100644
--- a/sound/soc/qcom/lpass-platform.c
+++ b/sound/soc/qcom/lpass-platform.c
@@ -122,8 +122,10 @@ static int lpass_platform_pcmops_open(struct snd_soc_component *component,
 	else
 		dma_ch = 0;
 
-	if (dma_ch < 0)
+	if (dma_ch < 0) {
+		kfree(data);
 		return dma_ch;
+	}
 
 	if (cpu_dai->driver->id == LPASS_DP_RX) {
 		map = drvdata->hdmiif_map;
@@ -147,6 +149,7 @@ static int lpass_platform_pcmops_open(struct snd_soc_component *component,
 	ret = snd_pcm_hw_constraint_integer(runtime,
 			SNDRV_PCM_HW_PARAM_PERIODS);
 	if (ret < 0) {
+		kfree(data);
 		dev_err(soc_runtime->dev, "setting constraints failed: %d\n",
 			ret);
 		return -EINVAL;
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

