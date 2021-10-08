Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89470426C6A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Oct 2021 16:09:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231576AbhJHOLT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Oct 2021 10:11:19 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:10135 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230060AbhJHOLT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Oct 2021 10:11:19 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1633702163; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=ofR11yMDOlkHDVdmdh43pIntKPcc0GstUuYkCrBEDho=; b=JNp+QlhaYtKtGlMDHUQRUNPkdK93cG+dbKJIq6eTobW+/yZLFJPFCRO8t1PjY4ofDqx9WW+y
 H+CtK2rEoqsXGwetxFuRH7oGWnF8IKaGrY8wFbijOfo9qBHP9/1ORmE2qjdMuOLRMYZZo4IC
 aA/19IS0ZqPpf8vyWS5biqHAiEk=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 6160511303355859c8fbe9ee (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 08 Oct 2021 14:09:23
 GMT
Sender: srivasam=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 2CE24C43617; Fri,  8 Oct 2021 14:09:23 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from hu-srivasam-hyd.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: srivasam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 96A27C4360C;
        Fri,  8 Oct 2021 14:09:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 96A27C4360C
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
Subject: [PATCH v3 0/5] Update Lpass digital codec macro drivers
Date:   Fri,  8 Oct 2021 19:38:59 +0530
Message-Id: <1633702144-19017-1-git-send-email-srivasam@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch set is to add support for lpass sc7280 based targets.
Upadate compatible name and change of bulk clock voting to optional
clock voting in digital codecs va, rx, tx macro drivers.
Changes Since V2:
    -- Add Tx macro deafults for lpass sc7280
Changes Since V1:
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

 .../bindings/sound/qcom,lpass-rx-macro.yaml        |  4 +++-
 .../bindings/sound/qcom,lpass-tx-macro.yaml        |  4 +++-
 .../bindings/sound/qcom,lpass-va-macro.yaml        |  4 +++-
 .../bindings/sound/qcom,lpass-wsa-macro.yaml       |  4 +++-
 sound/soc/codecs/lpass-rx-macro.c                  |  3 ++-
 sound/soc/codecs/lpass-tx-macro.c                  | 25 +++++++++++++++++++---
 sound/soc/codecs/lpass-va-macro.c                  |  3 ++-
 sound/soc/codecs/lpass-wsa-macro.c                 |  1 +
 8 files changed, 39 insertions(+), 9 deletions(-)

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

