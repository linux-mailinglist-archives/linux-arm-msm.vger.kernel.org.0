Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72C8A2C7059
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Nov 2020 19:18:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733094AbgK1Rzy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 28 Nov 2020 12:55:54 -0500
Received: from z5.mailgun.us ([104.130.96.5]:50063 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732707AbgK1FAF (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 28 Nov 2020 00:00:05 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1606539583; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=wcqjI/+rINfs3XtVEJAhIWB2xeJ2hiBW8kM8a+M17/w=; b=w3RgVVJcAw77gOAUSAhuD3lKzv/lcy3+uvAyCyIGzV85WDmELtrNM9RYPkMQSlC5q6tUCFSg
 jskDDQnJJlr9LfIx1UP+/Ok8+aoDvi+XC3bf8AfkaWrw/iGI4wD0cGI53D55O2DM3N4MPpDy
 QqiJT7cJrUlm+6yJ3I7XVjtELwk=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 5fc1d9391b731a5d9c7e61df (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 28 Nov 2020 04:59:37
 GMT
Sender: srivasam=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 0195EC43465; Sat, 28 Nov 2020 04:59:37 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from hyd-lnxbld210.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: srivasam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 8F938C433C6;
        Sat, 28 Nov 2020 04:59:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 8F938C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=srivasam@codeaurora.org
From:   Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
        bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
        srinivas.kandagatla@linaro.org, rohitkr@codeaurora.org,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Subject: [PATCH v4 0/2] Platform driver update to support playback recover after resume
Date:   Sat, 28 Nov 2020 10:29:17 +0530
Message-Id: <1606539559-4277-1-git-send-email-srivasam@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch set is to add support for playback recover after hard suspend and resume.
It includes:
1. Reverting part of previous commit, which is for handling registers invalid state
after hard suspend.
2. Adding pm ops in component driver and do regcache sync.

Srinivasa Rao Mandadapu (2):
  Partially revert ASoC: qcom: Fix enabling BCLK and LRCLK in LPAIF
    invalid state
  ASoC: qcom: Add support for playback recover after resume

 sound/soc/qcom/lpass-cpu.c      | 20 ++----------------
 sound/soc/qcom/lpass-platform.c | 46 +++++++++++++++++++++++++++++++----------
 2 files changed, 37 insertions(+), 29 deletions(-)

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

