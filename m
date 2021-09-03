Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CA1C3FFDD5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Sep 2021 12:05:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349005AbhICKGU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Sep 2021 06:06:20 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:11344 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1349039AbhICKFw (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Sep 2021 06:05:52 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1630663492; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=bcI92IfWvkqEpmqf6n3xiJ0u7hLOLwmK0IWLJzP+5Ms=; b=lk3JlhnqI0w+85uuSQ9cDYL27crqfjrYRUgGynKWaVdZZiDH0NN6AHqX5jsGpxQLfOdv1vFJ
 U2/OcIeiEPPg8OnoMpkLScPAmtsAWi+oldcb25N7t2qi3qQrE+TUCVNALnSbeEMU7WE4pqgG
 d8KhL27sV7OjIx/w+yLIm4sr6sA=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 6131f2b3cd680e8969532511 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 03 Sep 2021 10:02:27
 GMT
Sender: srivasam=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 3FAD8C4361A; Fri,  3 Sep 2021 10:02:26 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from hyd-lnxbld210.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: srivasam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 1BFFAC4360D;
        Fri,  3 Sep 2021 10:02:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 1BFFAC4360D
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
Cc:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Subject: [PATCH] ASoC: qcom: lpass-platform: Reset irq clear reg post handling interrupts
Date:   Fri,  3 Sep 2021 15:31:53 +0530
Message-Id: <20210903100153.9137-1-srivasam@codeaurora.org>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Update interrupt clear register with reset value after addressing
all interrupts. This is to fix playback or capture hanging issue in
simultaneous playback and capture usecase.

Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
---
 sound/soc/qcom/lpass-platform.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
index f9df76d37858..1a0a4b0b1a03 100644
--- a/sound/soc/qcom/lpass-platform.c
+++ b/sound/soc/qcom/lpass-platform.c
@@ -749,6 +749,12 @@ static irqreturn_t lpass_platform_lpaif_irq(int irq, void *data)
 		}
 	}
 
+	rv = regmap_write(drvdata->lpaif_map, LPAIF_IRQCLEAR_REG(v, LPAIF_IRQ_PORT_HOST), 0x0);
+	if (rv) {
+		pr_err("error writing to irqstat reg: %d\n", rv);
+		return IRQ_NONE;
+	}
+
 	return IRQ_HANDLED;
 }
 
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

