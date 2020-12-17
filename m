Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2D2F2DCD61
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Dec 2020 09:11:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727167AbgLQIJ6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Dec 2020 03:09:58 -0500
Received: from so254-31.mailgun.net ([198.61.254.31]:34132 "EHLO
        so254-31.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727190AbgLQIJ5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Dec 2020 03:09:57 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1608192581; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=EggB7flYZ69QI0E4k3gpaLndzQcRQVNriX3sSPP+AFA=; b=Xdi3X1rx4lt8bm1nzOPb3tooEaUy8GNGTcxB1JK7/qhHPcAvj2XOJkaI4ynDnS117DLMPxpO
 EiHI6Y1x1aOcRp3VIX+DWSKz1XDDsJr2tZwEeS7tY0OFambaP4QWrIpgOJI34Gl859qlKh9D
 2KTcPu8Dwhpj8wLrrMWMmYkiqc0=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n10.prod.us-west-2.postgun.com with SMTP id
 5fdb121593a3d2b1cdac2f3a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 17 Dec 2020 08:08:53
 GMT
Sender: srivasam=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 3AF01C43465; Thu, 17 Dec 2020 08:08:53 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from hyd-lnxbld210.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: srivasam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 06C3FC433CA;
        Thu, 17 Dec 2020 08:08:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 06C3FC433CA
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
Subject: [PATCH v6 0/2] Platform driver update to support playback recover after resume
Date:   Thu, 17 Dec 2020 13:38:32 +0530
Message-Id: <1608192514-29695-1-git-send-email-srivasam@codeaurora.org>
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
Changes Since v5:
  -- Removed redundant initialization of map variable in lpass-platform.c

Srinivasa Rao Mandadapu (2):
  ASoC: qcom: Fix incorrect volatile registers
  ASoC: qcom: Add support for playback recover after resume

 sound/soc/qcom/lpass-cpu.c      | 20 ++---------------
 sound/soc/qcom/lpass-platform.c | 50 ++++++++++++++++++++++++++++-------------
 2 files changed, 37 insertions(+), 33 deletions(-)

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

