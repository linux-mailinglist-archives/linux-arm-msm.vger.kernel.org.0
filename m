Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A96E337868
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Mar 2021 16:47:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234237AbhCKPqn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Mar 2021 10:46:43 -0500
Received: from z11.mailgun.us ([104.130.96.11]:52756 "EHLO z11.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234324AbhCKPqh (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Mar 2021 10:46:37 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1615477597; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=1VBjwvHlfoWkZSq2NKmHy22HPNe4Qn92KKp2+bBnXqE=; b=ImtBCIPmddS0EZ6kmFUBdB5UW6kOyaTnc9Gyr8nLvmUdRulXrB9uMhmOY03GnmzA5c+LBThk
 +qhZqv9pWG02ZvlFo4dSksmUap4/23MHTUchB+BAwSmqA/uUnL/kMFKmjmowgCW10OOIXC5E
 C5tZh1Y2b/iesRWVuVtvyfKCL38=
X-Mailgun-Sending-Ip: 104.130.96.11
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 604a3b46b2591bd5684c7651 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 11 Mar 2021 15:46:14
 GMT
Sender: srivasam=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 0AB62C43464; Thu, 11 Mar 2021 15:46:14 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from hyd-lnxbld210.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: srivasam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 587C2C433CA;
        Thu, 11 Mar 2021 15:46:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 587C2C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=srivasam@codeaurora.org
From:   Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
        bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
        srinivas.kandagatla@linaro.org, rohitkr@codeaurora.org,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        swboyd@chromium.org, judyhsiao@chromium.org
Cc:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Subject: [PATCH v2] ASoC: qcom: lpass-cpu: Fix lpass dai ids parse
Date:   Thu, 11 Mar 2021 21:15:57 +0530
Message-Id: <20210311154557.24978-1-srivasam@codeaurora.org>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The max boundary check while parsing dai ids makes
sound card registration fail after common up dai ids.

Fixes: cd3484f7f138 ("ASoC: qcom: Fix broken support to MI2S TERTIARY and QUATERNARY")

Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
---
Changes since v1:
  -- Fixes commit message chnaged.

 sound/soc/qcom/lpass-cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
index 4762286b33fe..c62d2612e8f5 100644
--- a/sound/soc/qcom/lpass-cpu.c
+++ b/sound/soc/qcom/lpass-cpu.c
@@ -739,7 +739,7 @@ static void of_lpass_cpu_parse_dai_data(struct device *dev,
 
 	for_each_child_of_node(dev->of_node, node) {
 		ret = of_property_read_u32(node, "reg", &id);
-		if (ret || id < 0 || id >= data->variant->num_dai) {
+		if (ret || id < 0) {
 			dev_err(dev, "valid dai id not found: %d\n", ret);
 			continue;
 		}
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

