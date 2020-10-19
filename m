Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98C1229244C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Oct 2020 11:06:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730058AbgJSJGZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Oct 2020 05:06:25 -0400
Received: from m42-4.mailgun.net ([69.72.42.4]:30630 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727235AbgJSJGX (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Oct 2020 05:06:23 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1603098382; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=CSSINleGh6w/76KIFdxve8Idpf2dccGeHvGZNRQeQPU=; b=Tk6VTR3uwK1r+kSkmLI5x04QJPxH9qRGIgBNy7J2rLpSWkZz+MEUEzi65YP5lLcbhU3Kq/P2
 NguTOyHxl/TePaxUjUZVgoi/P+xX/Lm5iOH8QNmk4g1bHm445SQJfTgRzLpsn+DQex+V8NMu
 wQ8V541oLiimE1Ob4F4j0VW17HQ=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 5f8d570c3711fec7b1445055 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 19 Oct 2020 09:06:20
 GMT
Sender: srivasam=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 00D72C433FE; Mon, 19 Oct 2020 09:06:19 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from hyd-lnxbld210.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: srivasam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 60CBEC433CB;
        Mon, 19 Oct 2020 09:06:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 60CBEC433CB
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
        Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Subject: [PATCH v2] Asoc: qcom: lpass-cpu: Fix clock disable failure
Date:   Mon, 19 Oct 2020 14:36:03 +0530
Message-Id: <1603098363-9251-1-git-send-email-srivasam@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: V Sujith Kumar Reddy <vsujithk@codeaurora.org>

Disable MI2S bit clock from PAUSE/STOP/SUSPEND usecase instead of
shutdown time. Acheive this by invoking clk_disable API from
cpu daiops trigger instead of cpu daiops shutdown.
Change non-atomic API "clk_prepare_enable" to atomic API
"clk_enable" in trigger, as trigger is being called from atomic context.

Fixes: commit 7e6799d8f87d ("ASoC: qcom: lpass-cpu: Enable MI2S BCLK and LRCLK together")

Signed-off-by: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
---
 sound/soc/qcom/lpass-cpu.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
index 78de888..6001049 100644
--- a/sound/soc/qcom/lpass-cpu.c
+++ b/sound/soc/qcom/lpass-cpu.c
@@ -80,6 +80,12 @@ static int lpass_cpu_daiops_startup(struct snd_pcm_substream *substream,
 		dev_err(dai->dev, "error in enabling mi2s osr clk: %d\n", ret);
 		return ret;
 	}
+	ret = clk_prepare(drvdata->mi2s_bit_clk[dai->driver->id]);
+	if (ret) {
+		dev_err(dai->dev, "error in enabling mi2s bit clk: %d\n", ret);
+		clk_disable_unprepare(drvdata->mi2s_osr_clk[dai->driver->id]);
+		return ret;
+	}
 	return 0;
 }
 
@@ -88,9 +94,8 @@ static void lpass_cpu_daiops_shutdown(struct snd_pcm_substream *substream,
 {
 	struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
 
-	clk_disable_unprepare(drvdata->mi2s_bit_clk[dai->driver->id]);
-
 	clk_disable_unprepare(drvdata->mi2s_osr_clk[dai->driver->id]);
+	clk_unprepare(drvdata->mi2s_bit_clk[dai->driver->id]);
 }
 
 static int lpass_cpu_daiops_hw_params(struct snd_pcm_substream *substream,
@@ -303,10 +308,10 @@ static int lpass_cpu_daiops_trigger(struct snd_pcm_substream *substream,
 			dev_err(dai->dev, "error writing to i2sctl reg: %d\n",
 				ret);
 
-		ret = clk_prepare_enable(drvdata->mi2s_bit_clk[id]);
+		ret = clk_enable(drvdata->mi2s_bit_clk[id]);
 		if (ret) {
 			dev_err(dai->dev, "error in enabling mi2s bit clk: %d\n", ret);
-			clk_disable_unprepare(drvdata->mi2s_osr_clk[id]);
+			clk_disable(drvdata->mi2s_osr_clk[id]);
 			return ret;
 		}
 
@@ -324,6 +329,7 @@ static int lpass_cpu_daiops_trigger(struct snd_pcm_substream *substream,
 		if (ret)
 			dev_err(dai->dev, "error writing to i2sctl reg: %d\n",
 				ret);
+		clk_disable(drvdata->mi2s_bit_clk[dai->driver->id]);
 		break;
 	}
 
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

