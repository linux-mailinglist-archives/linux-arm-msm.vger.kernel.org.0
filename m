Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7896229628
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jul 2020 12:33:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730296AbgGVKdF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Jul 2020 06:33:05 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:60094 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732133AbgGVKdE (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Jul 2020 06:33:04 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1595413984; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=jFEH/klEFM7iLKxsLI52FYANe4hYTHts+9ASRhyaPS4=; b=HWIMpuWFcxsJqh4AjQsSLuOuJhUf32XzwXdX0E+UGI3Fin2MKWLKo8nWgTt+4uvms/FeAFT8
 YggjngHvt4Hy09fYKvQFRSn0WbolwxcePbzPwjG5D6oPs+BvNfqB+iwbg8GUsrIM9T9qXkRB
 6iiZabsN8WFnw9jgj8vENrUNrsI=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n13.prod.us-east-1.postgun.com with SMTP id
 5f1815d7427cd5576611a84a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 22 Jul 2020 10:32:55
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 43339C433BA; Wed, 22 Jul 2020 10:32:53 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from rohkumar-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rohitkr)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2A622C43391;
        Wed, 22 Jul 2020 10:32:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 2A622C43391
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rohitkr@codeaurora.org
From:   Rohit kumar <rohitkr@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
        bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
        srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Rohit kumar <rohitkr@codeaurora.org>
Subject: [PATCH v4 04/12] ASoC: qcom: lpass-platform: fix memory leak
Date:   Wed, 22 Jul 2020 16:01:47 +0530
Message-Id: <1595413915-17867-5-git-send-email-rohitkr@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1595413915-17867-1-git-send-email-rohitkr@codeaurora.org>
References: <1595413915-17867-1-git-send-email-rohitkr@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

lpass_pcm_data is never freed. Free it in close
ops to avoid memory leak.

Fixes: 022d00ee0b55 ("ASoC: lpass-platform: Fix broken pcm data usage")
Signed-off-by: Rohit kumar <rohitkr@codeaurora.org>
---
 sound/soc/qcom/lpass-platform.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
index fb9acfd..b195f3d 100644
--- a/sound/soc/qcom/lpass-platform.c
+++ b/sound/soc/qcom/lpass-platform.c
@@ -61,7 +61,7 @@ static int lpass_platform_pcmops_open(struct snd_soc_component *component,
 	int ret, dma_ch, dir = substream->stream;
 	struct lpass_pcm_data *data;
 
-	data = devm_kzalloc(soc_runtime->dev, sizeof(*data), GFP_KERNEL);
+	data = kzalloc(sizeof(*data), GFP_KERNEL);
 	if (!data)
 		return -ENOMEM;
 
@@ -118,6 +118,7 @@ static int lpass_platform_pcmops_close(struct snd_soc_component *component,
 	if (v->free_dma_channel)
 		v->free_dma_channel(drvdata, data->dma_ch);
 
+	kfree(data);
 	return 0;
 }
 
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

