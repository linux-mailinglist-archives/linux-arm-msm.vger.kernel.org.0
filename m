Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 675294148E5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Sep 2021 14:32:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235924AbhIVMdf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Sep 2021 08:33:35 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:37208 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235955AbhIVMdc (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Sep 2021 08:33:32 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1632313923; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=wnjSjUzhn9Vc43/imQhWwvve2fhb7MUsRdjHreJ8z0s=; b=iVudqzVAnaCD2S0ixF4vLq5QEs7n2y/3Tvo1P1Q7dVV8oE/5FPnUio+ZKXbZG3Av0tpiqZhR
 aoZSKvfkG6AdlOKaGaJ57vA4zop3mrsuwE8/RakphfI9PDPGW2Jj2WkxjDmxTeFWSCisFBwQ
 fHj4gcC70ESwsb8v9niZEBSvuTM=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 614b2230bd6681d8ed047de3 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 22 Sep 2021 12:31:44
 GMT
Sender: srivasam=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id EF178C4360D; Wed, 22 Sep 2021 12:31:43 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from hu-srivasam-hyd.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: srivasam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 96A24C4338F;
        Wed, 22 Sep 2021 12:31:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 96A24C4338F
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
Subject: [PATCH v2 0/5] Update Lpass digital codec macro drivers
Date:   Wed, 22 Sep 2021 18:01:13 +0530
Message-Id: <1632313878-12089-1-git-send-email-srivasam@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <agross@kernel.org; bjorn.andersson@linaro.org; lgirdwood@gmail.com; broonie@kernel.org;robh+dt@kernel.org; plai@codeaurora.org; bgoswami@codeaurora.org; perex@perex.cz; tiwai@suse.com;srinivas.kandagatla@linaro.org; rohitkr@codeaurora.org; linux-arm-msm@vger.kernel.org; alsa-devel@alsa-project.org; devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; swboyd@chromium.org; judyhsiao@chromium.org;>
References: <agross@kernel.org; bjorn.andersson@linaro.org; lgirdwood@gmail.com; broonie@kernel.org;robh+dt@kernel.org; plai@codeaurora.org; bgoswami@codeaurora.org; perex@perex.cz; tiwai@suse.com;srinivas.kandagatla@linaro.org; rohitkr@codeaurora.org; linux-arm-msm@vger.kernel.org; alsa-devel@alsa-project.org; devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; swboyd@chromium.org; judyhsiao@chromium.org;>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch set is to add support for lpass sc7280 based targets.
Upadate compatible name and change of bulk clock voting to optional
clock voting in digital codecs va, rx, tx macro drivers.
Chnages Since V1:
    -- Removed individual clock voting and used bulk clock optional.
	-- Removed volatile changes and fixed default values.
	-- Typo errors.

Srinivasa Rao Mandadapu (5):
  ASoC: qcom: Add compatible names in va,wsa,rx,tx codec drivers for
    sc7280
  ASoC: qcom: dt-bindings: Add compatible names for lpass sc7280 digital
    codecs
  ASoC: codecs: tx-macro: Enable tx top soundwire mic clock
  ASoC: codecs: tx-macro: Update tx default values
  ASoC: codecs: Change bulk clock voting to optional voting in digital
    codecs

 .../devicetree/bindings/sound/qcom,lpass-rx-macro.yaml        |  4 +++-
 .../devicetree/bindings/sound/qcom,lpass-tx-macro.yaml        |  4 +++-
 .../devicetree/bindings/sound/qcom,lpass-va-macro.yaml        |  4 +++-
 .../devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml       |  4 +++-
 sound/soc/codecs/lpass-rx-macro.c                             |  3 ++-
 sound/soc/codecs/lpass-tx-macro.c                             | 11 +++++++----
 sound/soc/codecs/lpass-va-macro.c                             |  3 ++-
 sound/soc/codecs/lpass-wsa-macro.c                            |  1 +
 8 files changed, 24 insertions(+), 10 deletions(-)

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

