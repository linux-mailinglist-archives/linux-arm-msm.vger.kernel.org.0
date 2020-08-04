Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 502B323B662
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Aug 2020 10:08:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728163AbgHDIIf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Aug 2020 04:08:35 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:47524 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729515AbgHDIIe (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Aug 2020 04:08:34 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1596528514; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=+p4L5HepHVfNwEYZ4Wgv6SMrX9rmY/Y0hwfHhSk9YaY=; b=nBWcONNqL+g/MpQ1RJKLsJoO6JWNYuQEgY/KL1NfLUkDD6wqm92nbPfetSX/7gqZjiCJ+Mo7
 SAf03laxqULF1YOPhdVrsJdy20VZRFsBSD+0Teb8FM4PqyomTbNsXU+mLZnSONnojPVk74Da
 OWJmGc6QzRGSFhDW17/02PSbYNQ=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 5f291776a8da23d867d857d3 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 04 Aug 2020 08:08:22
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id AC5E2C433A1; Tue,  4 Aug 2020 08:08:22 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from rohkumar-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rohitkr)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9AA2EC433A0;
        Tue,  4 Aug 2020 08:08:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9AA2EC433A0
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
Subject: [PATCH v5 04/12] ASoC: qcom: lpass-platform: fix memory leak
Date:   Tue,  4 Aug 2020 13:37:25 +0530
Message-Id: <1596528453-11437-5-git-send-email-rohitkr@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1596528453-11437-1-git-send-email-rohitkr@codeaurora.org>
References: <1596528453-11437-1-git-send-email-rohitkr@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

lpass_pcm_data is never freed. Free it in close
ops to avoid memory leak.

Fixes: 022d00ee0b55 ("ASoC: lpass-platform: Fix broken pcm data usage")
Signed-off-by: Rohit kumar <rohitkr@codeaurora.org>
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/lpass-platform.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
index 3697f4e..315feda 100644
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

