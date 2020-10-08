Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98751286DF7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Oct 2020 07:19:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728418AbgJHFRp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Oct 2020 01:17:45 -0400
Received: from m42-4.mailgun.net ([69.72.42.4]:23618 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728353AbgJHFRk (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Oct 2020 01:17:40 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1602134259; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=kxK9LtfCElRb3WIXIcnYrmIbewkkXrexPQfvtxTLWR8=; b=Y079hlHJkcb2romwmuaZ2sVfFYUuOMlc5bvbSM8Tz3D5ifpxDmEnoWUC1A7TW4LP94iMkI3b
 GJBkdMzKd9TPhKprIxKV6XgTg/Wd6cR7/ZxxkPM2RfYcc0xz+v71SevQXmgDVdqOTev0JcV6
 F8kBW8zn+Fsuaxva4H0xk5VIYGA=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 5f7ea0f3ad37af35ece6f156 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 08 Oct 2020 05:17:39
 GMT
Sender: srivasam=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 757B2C433AF; Thu,  8 Oct 2020 05:17:39 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from hyd-lnxbld210.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: srivasam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 32D1DC433CA;
        Thu,  8 Oct 2020 05:17:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 32D1DC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=srivasam@codeaurora.org
From:   Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
        bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
        srinivas.kandagatla@linaro.org, rohitkr@codeaurora.org,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     V Sujith Kumar Reddy <vsujithk@codeaurora.org>,
        Srinivasa Rao <srivasam@codeaurora.org>
Subject: [PATCH v11 3/7] Asoc:qcom:lpass-cpu:Update dts property read API
Date:   Thu,  8 Oct 2020 10:46:59 +0530
Message-Id: <1602134223-2562-4-git-send-email-srivasam@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1602134223-2562-1-git-send-email-srivasam@codeaurora.org>
References: <1602134223-2562-1-git-send-email-srivasam@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: V Sujith Kumar Reddy <vsujithk@codeaurora.org>

Update dts property read API call with platform get property
by name, as it make code more readable and avoid conflicts
when array of properties to be used.

Signed-off-by: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Srinivasa Rao <srivasam@codeaurora.org>
---
 sound/soc/qcom/lpass-cpu.c      | 2 +-
 sound/soc/qcom/lpass-platform.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
index 0718a0f..12950d2 100644
--- a/sound/soc/qcom/lpass-cpu.c
+++ b/sound/soc/qcom/lpass-cpu.c
@@ -575,7 +575,7 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
 
 	of_lpass_cpu_parse_dai_data(dev, drvdata);
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "lpass-lpaif");
 
 	drvdata->lpaif = devm_ioremap_resource(dev, res);
 	if (IS_ERR((void const __force *)drvdata->lpaif)) {
diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
index 7ac2629..e7cf4e5 100644
--- a/sound/soc/qcom/lpass-platform.c
+++ b/sound/soc/qcom/lpass-platform.c
@@ -621,7 +621,7 @@ int asoc_qcom_lpass_platform_register(struct platform_device *pdev)
 	struct lpass_variant *v = drvdata->variant;
 	int ret;
 
-	drvdata->lpaif_irq = platform_get_irq(pdev, 0);
+	drvdata->lpaif_irq = platform_get_irq_byname(pdev, "lpass-irq-lpaif");
 	if (drvdata->lpaif_irq < 0)
 		return -ENODEV;
 
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

