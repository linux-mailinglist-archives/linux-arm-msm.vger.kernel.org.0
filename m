Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9444B41102E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Sep 2021 09:36:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234990AbhITHhq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Sep 2021 03:37:46 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:15040 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235004AbhITHhq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Sep 2021 03:37:46 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1632123379; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=ARWmDUS1BQfW3Wt0HGtbI5gxsj+hTnNK8YF8Gmx8ZcM=; b=bcMzoZvzcNR2nJP3m0iZT0IaPTSAispMEuukiN3p+cHfsJdKATU1qfOORhH8Uz1ooBKW8NVt
 SHY5owHBVQzw21OgEOU99Z5wg7Cay223Lc1Ep6nfWChK1I9gJS4LhGXSaE7zn2jo3Bp8R81P
 vmofQR5vn0+om3Nulz4NN8xI7S4=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 614839dae0f78151d6ca4449 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 20 Sep 2021 07:35:54
 GMT
Sender: srivasam=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A27BCC43616; Mon, 20 Sep 2021 07:35:54 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from hu-srivasam-hyd.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: srivasam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7F14AC4360C;
        Mon, 20 Sep 2021 07:35:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 7F14AC4360C
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
Subject: [PATCH 1/7] ASoC: qcom: Add compatible names in va,wsa,rx,tx codec drivers for sc7280
Date:   Mon, 20 Sep 2021 13:05:25 +0530
Message-Id: <1632123331-2425-2-git-send-email-srivasam@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1632123331-2425-1-git-send-email-srivasam@codeaurora.org>
References: <1632123331-2425-1-git-send-email-srivasam@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add compatible names for sc7280 based targets in digital codec drivers
va,wsa,rx and tx.

Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
---
 sound/soc/codecs/lpass-rx-macro.c  | 1 +
 sound/soc/codecs/lpass-tx-macro.c  | 1 +
 sound/soc/codecs/lpass-va-macro.c  | 1 +
 sound/soc/codecs/lpass-wsa-macro.c | 1 +
 4 files changed, 4 insertions(+)

diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index 196b068..520c760 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -3578,6 +3578,7 @@ static int rx_macro_remove(struct platform_device *pdev)
 
 static const struct of_device_id rx_macro_dt_match[] = {
 	{ .compatible = "qcom,sm8250-lpass-rx-macro" },
+	{ .compatible = "qcom,sc7280-lpass-rx-macro" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, rx_macro_dt_match);
diff --git a/sound/soc/codecs/lpass-tx-macro.c b/sound/soc/codecs/lpass-tx-macro.c
index 27a0d5d..9273724 100644
--- a/sound/soc/codecs/lpass-tx-macro.c
+++ b/sound/soc/codecs/lpass-tx-macro.c
@@ -1844,6 +1844,7 @@ static int tx_macro_remove(struct platform_device *pdev)
 
 static const struct of_device_id tx_macro_dt_match[] = {
 	{ .compatible = "qcom,sm8250-lpass-tx-macro" },
+	{ .compatible = "qcom,sc7280-lpass-tx-macro" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, tx_macro_dt_match);
diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
index 56c93f4..d312a14 100644
--- a/sound/soc/codecs/lpass-va-macro.c
+++ b/sound/soc/codecs/lpass-va-macro.c
@@ -1473,6 +1473,7 @@ static int va_macro_remove(struct platform_device *pdev)
 
 static const struct of_device_id va_macro_dt_match[] = {
 	{ .compatible = "qcom,sm8250-lpass-va-macro" },
+	{ .compatible = "qcom,sc7280-lpass-va-macro" },
 	{}
 };
 MODULE_DEVICE_TABLE(of, va_macro_dt_match);
diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index d3ac318..cc0071e 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -2446,6 +2446,7 @@ static int wsa_macro_remove(struct platform_device *pdev)
 
 static const struct of_device_id wsa_macro_dt_match[] = {
 	{.compatible = "qcom,sm8250-lpass-wsa-macro"},
+	{.compatible = "qcom,sc7280-lpass-wsa-macro"},
 	{}
 };
 MODULE_DEVICE_TABLE(of, wsa_macro_dt_match);
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

