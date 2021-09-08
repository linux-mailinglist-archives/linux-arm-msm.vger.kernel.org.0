Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F349C403EC7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Sep 2021 20:01:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347093AbhIHSCq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Sep 2021 14:02:46 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:34702 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235630AbhIHSCp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Sep 2021 14:02:45 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1631124097; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=PD5w0gwZgw/z6dtz286EeWtx6NtA8j3fPZbrJnknja4=; b=HZVrBszC6zEPgZ9ATIFtpUYwwkDnMhEGqS/Qg/i5U1tyH9IOZgMc7hlOWmKqgddiI7BETYcx
 hLbwlEdJotMW7nwA0aukZo0Dql2Sw0YE/boq6RAf5paxEY8T1Ky6gxR8QdMliQDDllbhvQ4O
 KVNo0E3UTkylPlf5RrzpWxy3y4k=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 6138fa6d506910c01b026a79 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 08 Sep 2021 18:01:17
 GMT
Sender: srivasam=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 77594C4361A; Wed,  8 Sep 2021 18:01:17 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from hu-srivasam-hyd.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: srivasam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3CD85C4338F;
        Wed,  8 Sep 2021 18:01:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 3CD85C4338F
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
Subject: [PATCH 0/2] Machine driver to support LPASS SC7280 sound card registration
Date:   Wed,  8 Sep 2021 23:30:55 +0530
Message-Id: <1631124057-17155-1-git-send-email-srivasam@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch set is to add support for SC7280 sound card registration and
to add dt-bindings documentation file.

These patches depends on the dt-bindings header patch
  -- https://patchwork.kernel.org/project/alsa-devel/list/?series=543829

Srinivasa Rao Mandadapu (2):
  ASoC: google: dt-bindings: Add sc7280-herobrine machine bindings
  ASoC: qcom: SC7280: Add machine driver

 .../bindings/sound/google,sc7280-herobrine.yaml    | 169 ++++++++++
 sound/soc/qcom/Kconfig                             |  12 +
 sound/soc/qcom/Makefile                            |   2 +
 sound/soc/qcom/sc7280.c                            | 347 +++++++++++++++++++++
 4 files changed, 530 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/google,sc7280-herobrine.yaml
 create mode 100644 sound/soc/qcom/sc7280.c

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

