Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33E0D2DCD66
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Dec 2020 09:11:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727346AbgLQIKI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Dec 2020 03:10:08 -0500
Received: from m43-15.mailgun.net ([69.72.43.15]:42738 "EHLO
        m43-15.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727304AbgLQIKH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Dec 2020 03:10:07 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1608192590; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=uALA5vt69EvBKnM4mrxYaYLyNN2UbFTgCbFexKaLycU=; b=t+SVtkVb9+na/7+uEqmtHkyYdauTdxqgfOJ/Nc0nRaEFFUUSr3YlyAdncmkBgn1m72ptjaTN
 CpverO6uB6/UPOIEW29NAWTgtqN5mWc6nz/ttOOSMlIULTb/v05PocQREkAWPqL8M7IlQG5z
 ZPRdz2rxigK4UfP0YqyEGtQ3HCc=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n09.prod.us-west-2.postgun.com with SMTP id
 5fdb1220065be8d835996314 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 17 Dec 2020 08:09:04
 GMT
Sender: srivasam=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 6EE61C43461; Thu, 17 Dec 2020 08:09:04 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from hyd-lnxbld210.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: srivasam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 984B8C433ED;
        Thu, 17 Dec 2020 08:08:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 984B8C433ED
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
        V Sujith Kumar Reddy <vsujithk@codeaurora.org>
Subject: [PATCH v6 2/2] ASoC: qcom: Add support for playback recover after resume
Date:   Thu, 17 Dec 2020 13:38:34 +0530
Message-Id: <1608192514-29695-3-git-send-email-srivasam@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1608192514-29695-1-git-send-email-srivasam@codeaurora.org>
References: <1608192514-29695-1-git-send-email-srivasam@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

To support playback continuation after hard suspend(bypass powerd)
and resume do regcache sync with component driver pm ops.

Signed-off-by: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Tested-by: Steev Klimaszewski <steev@kali.org>
---
 sound/soc/qcom/lpass-platform.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
index 232deee..d1c2485 100644
--- a/sound/soc/qcom/lpass-platform.c
+++ b/sound/soc/qcom/lpass-platform.c
@@ -823,6 +823,39 @@ static void lpass_platform_pcm_free(struct snd_soc_component *component,
 	}
 }
 
+static int lpass_platform_pcmops_suspend(struct snd_soc_component *component)
+{
+	struct lpass_data *drvdata = snd_soc_component_get_drvdata(component);
+	struct regmap *map;
+	unsigned int dai_id = component->id;
+
+	if (dai_id == LPASS_DP_RX)
+		map = drvdata->hdmiif_map;
+	else
+		map = drvdata->lpaif_map;
+
+	regcache_cache_only(map, true);
+	regcache_mark_dirty(map);
+
+	return 0;
+}
+
+static int lpass_platform_pcmops_resume(struct snd_soc_component *component)
+{
+	struct lpass_data *drvdata = snd_soc_component_get_drvdata(component);
+	struct regmap *map;
+	unsigned int dai_id = component->id;
+
+	if (dai_id == LPASS_DP_RX)
+		map = drvdata->hdmiif_map;
+	else
+		map = drvdata->lpaif_map;
+
+	regcache_cache_only(map, false);
+	return regcache_sync(map);
+}
+
+
 static const struct snd_soc_component_driver lpass_component_driver = {
 	.name		= DRV_NAME,
 	.open		= lpass_platform_pcmops_open,
@@ -835,6 +868,8 @@ static const struct snd_soc_component_driver lpass_component_driver = {
 	.mmap		= lpass_platform_pcmops_mmap,
 	.pcm_construct	= lpass_platform_pcm_new,
 	.pcm_destruct	= lpass_platform_pcm_free,
+	.suspend		= lpass_platform_pcmops_suspend,
+	.resume			= lpass_platform_pcmops_resume,
 
 };
 
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

