Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 277AC455BAB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Nov 2021 13:45:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344760AbhKRMse (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Nov 2021 07:48:34 -0500
Received: from so254-9.mailgun.net ([198.61.254.9]:33688 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344775AbhKRMsY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Nov 2021 07:48:24 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1637239523; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=spZbHw6G24KuggxBC20wvPlYUlMHVGrlzQZQFfA4yFA=; b=orCdCoS2q6/lDh2oIjzLMIelUlA092Dgmz489LcuNoWAVsOrKZIOdu19ubigIkbY59Bx2GXd
 lfDXq6QIPnE9pkn9MGoHtUTvOQUZUEnQj3SjYW/wWiWo+KBB8X9lEf8dRj0A1wjfceaqTlzy
 O5xnln6hGWbTjdSkJ6WweE32wuY=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 61964ae30a5410021be307d4 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 18 Nov 2021 12:45:23
 GMT
Sender: srivasam=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 7006BC43619; Thu, 18 Nov 2021 12:45:22 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from hu-srivasam-hyd.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: srivasam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A0A1DC4338F;
        Thu, 18 Nov 2021 12:45:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org A0A1DC4338F
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
Subject: [PATCH v6 0/2] Machine driver to support LPASS SC7280 sound card registration
Date:   Thu, 18 Nov 2021 18:15:04 +0530
Message-Id: <1637239506-9387-1-git-send-email-srivasam@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch set is to add support for SC7280 sound card registration and
to add dt-bindings documentation file.

Srinivasa Rao Mandadapu (2):
  ASoC: google: dt-bindings: Add sc7280-herobrine machine bindings
  ASoC: qcom: SC7280: Add machine driver

Changes Since V5:
    -- Add required properties to dt-bindings
Changes Since V4:
    -- Add COMPILE_TEST flag in sc7280 configuration.
    -- Remove redundant startup and shutdown callbacks of snd_soc_ops.
    -- Fix typo errors.
Changes Since V3:
    -- Change audio jack playpause key value.
Changes Since V2:
    -- updated required field in bindings
    -- updated Return type check with proper enum in sc7280.c
    -- Updated Header name and Typos in sc7280.c
Changes Since V1:
    -- Indentation changes and typo.

 .../bindings/sound/google,sc7280-herobrine.yaml    | 171 ++++++++++++
 sound/soc/qcom/Kconfig                             |  12 +
 sound/soc/qcom/Makefile                            |   2 +
 sound/soc/qcom/sc7280.c                            | 299 +++++++++++++++++++++
 4 files changed, 484 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/google,sc7280-herobrine.yaml
 create mode 100644 sound/soc/qcom/sc7280.c

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

