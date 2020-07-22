Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A002229644
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jul 2020 12:34:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731930AbgGVKer (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Jul 2020 06:34:47 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:47322 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731876AbgGVKer (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Jul 2020 06:34:47 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1595414087; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=q5WENp3kjcHbBxRcJZBOwyNNWkqciF+ASgb0ZS4e2Sc=; b=cCChnOPOkWwEOkKpw9ujKYyjf67xH5d0neLsbNv3qTTRhBV24qtmA2A2IPFTIAlvJwDIrqj7
 nfRu4wIy2Vmh4sCOgVlQRFLS3qvKM8MZcp+E/Af8VYx4QVqR+kPUmgHjDq1dlwN27LD67Kqx
 iXSfxtQSSoigj1QYh5NaE7jZU7A=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n13.prod.us-west-2.postgun.com with SMTP id
 5f1816448e9b2c49c6ac8924 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 22 Jul 2020 10:34:44
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 9ECF9C433A0; Wed, 22 Jul 2020 10:34:44 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from rohkumar-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rohitkr)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E9FDBC433C6;
        Wed, 22 Jul 2020 10:34:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E9FDBC433C6
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
Subject: [PATCH v4 11/12] ASoC: qcom: lpass-platform: Use platform_get_irq
Date:   Wed, 22 Jul 2020 16:01:54 +0530
Message-Id: <1595413915-17867-12-git-send-email-rohitkr@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1595413915-17867-1-git-send-email-rohitkr@codeaurora.org>
References: <1595413915-17867-1-git-send-email-rohitkr@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

platform_get_irq_byname() is used when there is list
of interrupts in the device node. As lpass-platform
has only one interrupt entry, use platform_get_irq()
instead.

Signed-off-by: Rohit kumar <rohitkr@codeaurora.org>
---
 sound/soc/qcom/lpass-platform.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
index 249c7e6..45da06b 100644
--- a/sound/soc/qcom/lpass-platform.c
+++ b/sound/soc/qcom/lpass-platform.c
@@ -638,7 +638,7 @@ int asoc_qcom_lpass_platform_register(struct platform_device *pdev)
 	struct lpass_variant *v = drvdata->variant;
 	int ret;
 
-	drvdata->lpaif_irq = platform_get_irq_byname(pdev, "lpass-irq-lpaif");
+	drvdata->lpaif_irq = platform_get_irq(pdev, 0);
 	if (drvdata->lpaif_irq < 0)
 		return -ENODEV;
 
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

