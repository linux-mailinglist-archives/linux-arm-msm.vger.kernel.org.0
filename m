Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CA6924486B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Aug 2020 12:55:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727939AbgHNKzT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 Aug 2020 06:55:19 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:30825 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727963AbgHNKzO (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 Aug 2020 06:55:14 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1597402513; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=b0dYmhKKcDCDez9X8B6Esf7dbjUavDc5SmdewD798cs=; b=PPpkWhS+br+bcM+BeHCx16Tkm7XxaDYkBj/TWoPCttApIglpgvZsIJo8QGT6z0bAPy2gS88r
 JceaCWitLURZRmAZpqlVs3DdjHgqfrINmj9VN6LHmZ3wGlzxHLkwc8RJKk3fttYEXu25CeWb
 dCo9gjyH4awHO42NUck94+C5gko=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n08.prod.us-east-1.postgun.com with SMTP id
 5f366d7dd48d4625ca508f16 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 14 Aug 2020 10:54:53
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 32939C433B7; Fri, 14 Aug 2020 10:54:51 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from rohkumar-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rohitkr)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7ED75C433A0;
        Fri, 14 Aug 2020 10:54:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7ED75C433A0
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
Subject: [PATCH v6 11/12] ASoC: qcom: lpass-platform: Use platform_get_irq
Date:   Fri, 14 Aug 2020 16:23:07 +0530
Message-Id: <1597402388-14112-12-git-send-email-rohitkr@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1597402388-14112-1-git-send-email-rohitkr@codeaurora.org>
References: <1597402388-14112-1-git-send-email-rohitkr@codeaurora.org>
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
index 35aead1..df692ed 100644
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

