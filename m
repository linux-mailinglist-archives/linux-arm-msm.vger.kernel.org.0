Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22BBC2C6255
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Nov 2020 10:58:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727232AbgK0J4t (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Nov 2020 04:56:49 -0500
Received: from m42-4.mailgun.net ([69.72.42.4]:62733 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727303AbgK0J4t (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Nov 2020 04:56:49 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1606471008; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=uh97Z0sQ4kcYvO9iLWdWG4UvbvTzslMqDnQZy4L6frI=; b=XuPw0WjBYE7rKB6ClQ77vZcQZW/0yMt6M2nNVC6lwJax1SyIcC7LO61hKw7ID5Qlvwi6D3ud
 AxhIP7A33xLIzbLOMP+Bv3qrGI5DganNnvUnjhH//eaoQT6CEqTQWLudG3zSmwo7eI6PqfN7
 RJFKMYjHbBXvEFBNHJlxDUJ92KM=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 5fc0cd5fa5c560669c7e6839 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 27 Nov 2020 09:56:47
 GMT
Sender: srivasam=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id BB43AC4346A; Fri, 27 Nov 2020 09:56:46 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from hyd-lnxbld210.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: srivasam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 860B9C4346A;
        Fri, 27 Nov 2020 09:56:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 860B9C4346A
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
Subject: [PATCH v3] ASoC: qcom: Fix playback recover problem in suspend resume
Date:   Fri, 27 Nov 2020 15:26:28 +0530
Message-Id: <1606470988-26965-1-git-send-email-srivasam@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

To support playback continuation after hard suspend(bypass powerd)
 and resume:
Prepare device in  platform trigger callback.
Make I2s and DMA control registers as non volatile.

Signed-off-by: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
---
Changes Since v1 and v2:
  -- Subject lines changed

 sound/soc/qcom/lpass-cpu.c      | 8 ++------
 sound/soc/qcom/lpass-platform.c | 5 +++--
 2 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
index af684fd..c99be03 100644
--- a/sound/soc/qcom/lpass-cpu.c
+++ b/sound/soc/qcom/lpass-cpu.c
@@ -454,20 +454,16 @@ static bool lpass_cpu_regmap_volatile(struct device *dev, unsigned int reg)
 	struct lpass_variant *v = drvdata->variant;
 	int i;
 
-	for (i = 0; i < v->i2s_ports; ++i)
-		if (reg == LPAIF_I2SCTL_REG(v, i))
-			return true;
 	for (i = 0; i < v->irq_ports; ++i)
 		if (reg == LPAIF_IRQSTAT_REG(v, i))
 			return true;
 
 	for (i = 0; i < v->rdma_channels; ++i)
-		if (reg == LPAIF_RDMACURR_REG(v, i) || reg == LPAIF_RDMACTL_REG(v, i))
+		if (reg == LPAIF_RDMACURR_REG(v, i))
 			return true;
 
 	for (i = 0; i < v->wrdma_channels; ++i)
-		if (reg == LPAIF_WRDMACURR_REG(v, i + v->wrdma_channel_start) ||
-			reg == LPAIF_WRDMACTL_REG(v, i + v->wrdma_channel_start))
+		if (reg == LPAIF_WRDMACURR_REG(v, i + v->wrdma_channel_start))
 			return true;
 
 	return false;
diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
index 80b09de..2b0a7c1 100644
--- a/sound/soc/qcom/lpass-platform.c
+++ b/sound/soc/qcom/lpass-platform.c
@@ -481,8 +481,9 @@ static int lpass_platform_pcmops_trigger(struct snd_soc_component *component,
 		return -ENOTRECOVERABLE;
 	}
 	switch (cmd) {
-	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_RESUME:
+		lpass_platform_pcmops_prepare(component, substream);
+	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
 		ret = regmap_fields_write(dmactl->enable, id,
 						 LPAIF_DMACTL_ENABLE_ON);
@@ -592,7 +593,7 @@ static int lpass_platform_pcmops_trigger(struct snd_soc_component *component,
 		break;
 	}
 
-	return 0;
+	return ret;
 }
 
 static snd_pcm_uframes_t lpass_platform_pcmops_pointer(
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

