Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E72C43B235
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Oct 2021 14:20:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234330AbhJZMWY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Oct 2021 08:22:24 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:62680 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234541AbhJZMWX (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Oct 2021 08:22:23 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1635250800; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=lxambdPjjCTbsonlXAfW42PgjHSfRJVT1wXjJ/kn1go=; b=mJGdkXXrjKnX9LEs39mfnW9JAuZ2+dLhBMHAjVqookdkU/CeWfqw9u9feMSDU9x1VmxGi96P
 kgm+msPtcO/K2gAl29YO7muO7yRhykfH5wPdJd32bWi2BGK3C1uvFZ3x2CEM5icWEXR++vLl
 OtgFYLvUsYFolIEnQqLuclaHzjY=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 6177f25cdaa899cf74e64745 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 26 Oct 2021 12:19:40
 GMT
Sender: srivasam=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 5F6B5C43635; Tue, 26 Oct 2021 12:19:40 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from hu-srivasam-hyd.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: srivasam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A001BC43616;
        Tue, 26 Oct 2021 12:19:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org A001BC43616
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
Subject: [PATCH v4 0/3] Update SoundWire RX and TX cgcr register control
Date:   Tue, 26 Oct 2021 17:49:21 +0530
Message-Id: <1635250764-13994-1-git-send-email-srivasam@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch series is to add v1.6.0 compatable name for qcom soundwire
driver and to update soundwire RX and TX cgcr register control.

Changes Since V3:
    -- Add v1.6.0 compatable name and soundwire data structure.
    -- Change macro define name properly.
    -- Update bindings for new property.
    -- Change commit message description.
    -- Change signedoff by sequence.
Changes since v2:
    -- Update error check after ioremap.
Changes since v1:
    -- Add const name to mask value.
Srinivasa Rao Mandadapu (3):
  ASoC: qcom: soundwire: Disable soundwire rxtx cgcr hardware control
  dt-bindings: soundwire: qcom: Add bindings for RX and TX cgcr register
    control
  soundwire: qcom: Add compatible name for v1.6.0

 .../devicetree/bindings/soundwire/qcom,sdw.txt       |  9 +++++++++
 drivers/soundwire/qcom.c                             | 20 ++++++++++++++++++++
 2 files changed, 29 insertions(+)

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

