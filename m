Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4AA8295FFD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Oct 2020 15:27:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2895175AbgJVN1W (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Oct 2020 09:27:22 -0400
Received: from m42-4.mailgun.net ([69.72.42.4]:63119 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2894635AbgJVN1V (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Oct 2020 09:27:21 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1603373241; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=zyk+rmaPFWFn8X4EommTKBeeayYl4rYBD+sOjpF0y08=; b=cWgoRH+SlCmoj57JL7GS+z+O3YK+GitWI6cfau9uybc7AYuqFRpz3iDjz175kVVnlyrE6p6W
 Nn6V5sVx3iUQCXxiXDTl07IBj6/Zinh7u/MJzWakTDrVqm81sa2LJS46xqvp9nfc/pqxjucm
 ENwhU7o9jKuDFO4ERO56j+/cnd0=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 5f9188b4ef891f1ee2621207 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 22 Oct 2020 13:27:16
 GMT
Sender: srivasam=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id AE909C433FF; Thu, 22 Oct 2020 13:27:15 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from hyd-lnxbld210.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: srivasam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 03427C433C9;
        Thu, 22 Oct 2020 13:27:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 03427C433C9
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
Subject: [PATCH] Asoc: qcom: lpass-sc7180: Fix MI2S bitwidth field bit positions
Date:   Thu, 22 Oct 2020 18:56:59 +0530
Message-Id: <1603373219-19374-1-git-send-email-srivasam@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: V Sujith Kumar Reddy <vsujithk@codeaurora.org>

Update SC7180 lpass_variant structure with proper I2S bitwidth
field bit positions, as bitwidth denotes 0 to 1 bits,
but previously used only 0 bit.

Fixes: commit cba62c8b49bead ("Merge series "ASoC: qcom: Add support for SC7180 lpass variant" from Rohit kumar <rohitkr@codeaurora.org>:")

Signed-off-by: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
---
 sound/soc/qcom/lpass-sc7180.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/qcom/lpass-sc7180.c b/sound/soc/qcom/lpass-sc7180.c
index c6292f9e..bc998d5 100644
--- a/sound/soc/qcom/lpass-sc7180.c
+++ b/sound/soc/qcom/lpass-sc7180.c
@@ -188,7 +188,7 @@ static struct lpass_variant sc7180_data = {
 	.micmode		= REG_FIELD_ID(0x1000, 4, 8, 3, 0x1000),
 	.micmono		= REG_FIELD_ID(0x1000, 3, 3, 3, 0x1000),
 	.wssrc			= REG_FIELD_ID(0x1000, 2, 2, 3, 0x1000),
-	.bitwidth		= REG_FIELD_ID(0x1000, 0, 0, 3, 0x1000),
+	.bitwidth		= REG_FIELD_ID(0x1000, 0, 1, 3, 0x1000),
 
 	.rdma_dyncclk		= REG_FIELD_ID(0xC000, 21, 21, 5, 0x1000),
 	.rdma_bursten		= REG_FIELD_ID(0xC000, 20, 20, 5, 0x1000),
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

