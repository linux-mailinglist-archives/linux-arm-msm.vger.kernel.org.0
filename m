Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C15BB4382B9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Oct 2021 11:54:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230253AbhJWJ4t (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 23 Oct 2021 05:56:49 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:38587 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230104AbhJWJ4s (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 23 Oct 2021 05:56:48 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1634982869; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=C32ao50Oq7HoU0we0KKmIdCM4y3jX8SMjgIkGusdI1U=; b=fwFcC2E0gQ2jCL9F6pgBTOyElj9qbkOfbjgQwgXykI6zFd2ihEHg0wkEhywBSGZ4AvhpBOcn
 x9NCyKuJYwudBCr499LmudCnbVwUvGTYeLrLUJXkFigt5Li2puRXdp9Egez3jmhoJSOesZ8d
 u2tk/QqbPLIOfkYz/YINSJaPfbg=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 6173dbcc14914866fa55b5c9 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 23 Oct 2021 09:54:20
 GMT
Sender: srivasam=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id AE26AC43638; Sat, 23 Oct 2021 09:54:18 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from hu-srivasam-hyd.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: srivasam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A7F0AC43460;
        Sat, 23 Oct 2021 09:54:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org A7F0AC43460
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
Subject: [PATCH v3 00/10] Add support for audio on SC7280 based targets
Date:   Sat, 23 Oct 2021 15:23:52 +0530
Message-Id: <1634982842-7477-1-git-send-email-srivasam@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Changes Since V2:
	-- Split lpass sc7280 cpu driver patch and create regmap config patch.
    -- Create patches based on latest kernel tip.
    -- Add helper function to get dma control and lpaif handle.
    -- Remove unused variables.
Changes Since V1:
    -- Typo errors fix
    -- CPU driver readable/writable apis optimization.
    -- Add Missing config patch
    -- Add Common api for repeated dmactl initialization.

Srinivasa Rao Mandadapu (10):
  ASoC: qcom: Move lpass_pcm_data structure to lpass header
  ASoC: qcom: lpass: Add dma fields for codec dma lpass interface
  ASoC: qcom: Add register definition for codec rddma and wrdma
  ASoC: qcom: Add lpass CPU driver for codec dma control
  ASoC: qcom: Add helper function to get dma control and lpaif handle
  ASoC: qcom: Add support for codec dma driver
  ASoC: qcom: Add regmap config support for codec dma driver
  ASoC: dt-bindings: Add SC7280 sound card bindings
  ASoC: qcom: lpass-sc7280: Add platform driver for lpass audio
  ASoC: qcom: SC7280: Update config for building codec dma drivers

 .../devicetree/bindings/sound/qcom,lpass-cpu.yaml  |  69 ++-
 sound/soc/qcom/Kconfig                             |  13 +
 sound/soc/qcom/Makefile                            |   4 +
 sound/soc/qcom/common.c                            |  39 ++
 sound/soc/qcom/common.h                            |   1 +
 sound/soc/qcom/lpass-cdc-dma.c                     | 195 +++++++
 sound/soc/qcom/lpass-cpu.c                         | 245 ++++++++-
 sound/soc/qcom/lpass-lpaif-reg.h                   | 103 +++-
 sound/soc/qcom/lpass-platform.c                    | 513 +++++++++++++++---
 sound/soc/qcom/lpass-sc7280.c                      | 599 +++++++++++++++++++++
 sound/soc/qcom/lpass.h                             | 157 ++++++
 11 files changed, 1859 insertions(+), 79 deletions(-)
 create mode 100644 sound/soc/qcom/lpass-cdc-dma.c
 create mode 100644 sound/soc/qcom/lpass-sc7280.c

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

