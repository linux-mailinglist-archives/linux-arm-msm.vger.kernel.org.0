Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 762472CC390
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Dec 2020 18:27:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389091AbgLBRXk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Dec 2020 12:23:40 -0500
Received: from a2.mail.mailgun.net ([198.61.254.61]:36920 "EHLO
        a2.mail.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388396AbgLBRXj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Dec 2020 12:23:39 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1606929798; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=du06zc/jHcGsUafhmo+6BZJPLrel+MajZ6mJGJKue0w=; b=mo+Eg2ZWff9RtZcC6o2l3G3cR/5Tc9KTU/BgfMQ4spnafDiT6/TPIUsDIRa0GKG2g4dbnzCQ
 k6oUEM5/ZAO2wmFEWa4g3EQMz3pNuLHsTMkMJqaYoQS5VvPrPA0cfxdMHTItSP+DSJLovDun
 WXiuiPSNXTtlWFZAZwKZK7ZvB3w=
X-Mailgun-Sending-Ip: 198.61.254.61
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 5fc7cd6691ec4b75c2a89762 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 02 Dec 2020 17:22:46
 GMT
Sender: srivasam=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id EF272C43466; Wed,  2 Dec 2020 17:22:45 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from hyd-lnxbld210.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: srivasam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C30DDC43460;
        Wed,  2 Dec 2020 17:22:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C30DDC43460
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
Subject: [PATCH v5 0/2] Platform driver update to support playback recover after resume
Date:   Wed,  2 Dec 2020 22:52:26 +0530
Message-Id: <1606929748-16828-1-git-send-email-srivasam@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch set is to add support for playback recover after hard suspend and resume.
It includes:
1. Reverting part of previous commit, which is for handling registers invalid state
after hard suspend.
2. Adding pm ops in component driver and do regcache sync.
Changes Since v1 and v2:
  -- Subject lines changed
Changes Since v3:
  -- Patch is splitted into 2 patches
Changes Since v4:
  -- Subject lines changed

Srinivasa Rao Mandadapu (2):
  ASoC: qcom: Fix incorrect volatile registers
  ASoC: qcom: Add support for playback recover after resume

 sound/soc/qcom/lpass-cpu.c      | 20 ++----------------
 sound/soc/qcom/lpass-platform.c | 46 +++++++++++++++++++++++++++++++----------
 2 files changed, 37 insertions(+), 29 deletions(-)

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

