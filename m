Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF1C3411029
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Sep 2021 09:36:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231758AbhITHhm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Sep 2021 03:37:42 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:61700 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229529AbhITHhl (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Sep 2021 03:37:41 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1632123375; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=Ms+B2ZCcZVF2KlK5ntts5I/nDBBo3mTVg8pdBQFTWhE=; b=jKlABiq95oiDwdXwhxVU9PzM3dJMNvHGyjKdVBVCg1LPjLa6NhNjW0R9+Jg3bUxF2NcnIokX
 ZDlLwgK3stz7mXfB/AbT1UhFYHn3DoQ7R3YwkxwPjc0zHh+atx0mZ30LYjSxCV3++v3n0bgn
 h/X21M8SoHxFxs6zbPE4tmHkUek=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 614839d5ec62f57c9a9e5d6b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 20 Sep 2021 07:35:49
 GMT
Sender: srivasam=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 8443CC43619; Mon, 20 Sep 2021 07:35:48 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from hu-srivasam-hyd.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: srivasam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 78424C4338F;
        Mon, 20 Sep 2021 07:35:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 78424C4338F
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
Subject: [PATCH 0/7] Update Lpass digital codec macro drivers
Date:   Mon, 20 Sep 2021 13:05:24 +0530
Message-Id: <1632123331-2425-1-git-send-email-srivasam@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch set is to add support for lpass sc7280 based targets.
Upadate compatible name and change of bulk clock voting to individual
clock voting in digital codec va, rx, tx macro drivers.

Srinivasa Rao Mandadapu (7):
  ASoC: qcom: Add compatible names in va,wsa,rx,tx codec drivers for
    sc7280
  ASoC: qcom: dt-bindings: Add compatible names for lpass sc7280 digital
    codecs
  ASoC: codecs: tx-macro: Change mic control registers to volatile
  ASoC: codecs: lpass-va-macro: Change bulk voting to individual clock
    voting
  ASoC: codecs: lpass-rx-macro: Change bulk voting to individual clock
    voting
  ASoC: codecs: lpass-tx-macro: Change bulk voting to individual clock
    voting
  ASoC: codecs: lpass-va-macro: set mclk clock rate correctly

 .../bindings/sound/qcom,lpass-rx-macro.yaml        |  4 +-
 .../bindings/sound/qcom,lpass-tx-macro.yaml        |  4 +-
 .../bindings/sound/qcom,lpass-va-macro.yaml        |  4 +-
 .../bindings/sound/qcom,lpass-wsa-macro.yaml       |  4 +-
 sound/soc/codecs/lpass-rx-macro.c                  | 69 ++++++++++++------
 sound/soc/codecs/lpass-tx-macro.c                  | 81 ++++++++++++++++------
 sound/soc/codecs/lpass-va-macro.c                  | 49 ++++++++-----
 sound/soc/codecs/lpass-wsa-macro.c                 |  1 +
 8 files changed, 153 insertions(+), 63 deletions(-)

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

