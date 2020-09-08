Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D9132617DD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Sep 2020 19:44:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731689AbgIHRo1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Sep 2020 13:44:27 -0400
Received: from a27-18.smtp-out.us-west-2.amazonses.com ([54.240.27.18]:51578
        "EHLO a27-18.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726708AbgIHRoX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Sep 2020 13:44:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1599587063;
        h=From:To:Cc:Subject:Date:Message-Id;
        bh=3qPkkzUdtMV75S8+zuGzlHL+G4N4P1hrr2hLyHD6G3o=;
        b=dJnx4LoGDRu0RBvYpXFdmgZHOYbEGm+OqYs6emA0URw08xQj49mwkvBjResvib39
        xAsoj4ZGoWDwzbQrY1Ub0JQWU+tKzZ1RaLTKZBRkFxl89KiuH6bbhWBSyHTn8Nt0A3f
        /l/mtLGFMuTlrf4W8w3c7Et8XyEvuPhF+INt0oGk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1599587063;
        h=From:To:Cc:Subject:Date:Message-Id:Feedback-ID;
        bh=3qPkkzUdtMV75S8+zuGzlHL+G4N4P1hrr2hLyHD6G3o=;
        b=mHudq9vyVn71P9y259kCih7NBMxckldkk1PibBCguTz7yvn8vr1HPomIndoMKmaW
        nag75JEOgnu5QTY1FlkDAduDoFiwARMUaqEC8oeB4zZgXLy1GxHxIpmMwIvYoOXTWEm
        gHrCK6iqxLM1aqiHHryy2wQmjhfBR7jJdQoFvmD4=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 12781C433C6
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
Subject: [PATCH v4 0/5]  Qualcomm's lpass-hdmi ASoC driver to support audio over dp port
Date:   Tue, 8 Sep 2020 17:44:23 +0000
Message-ID: <010101746ed19510-5b13f6a5-e426-4034-9a14-1c752af30479-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 2.7.4
X-SES-Outgoing: 2020.09.08-54.240.27.18
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

These patches are to support audio over DP port on Qualcomm's SC7180 LPASS Asoc.
It includes machine driver, cpu driver, platform driver updates for HDMI path support, 
device tree documention, lpass variant structure optimization and configuration changes.
These patches depends on the DP patch series 
https://patchwork.kernel.org/project/dri-devel/list/?series=332029
Changes Since v3:
   -- Removed id in lpass variant structure and used snd_soc_dai_driver id

V Sujith Kumar Reddy (5):
  ASoC: Add sc7180-lpass binding header hdmi define
  ASoC: dt-bindings: Add dt binding for lpass hdmi
  ASoC: qcom: Add support for lpass hdmi driver
  ASoC: qcom: Add support for audio over DP
  ASoC: qcom: Optimise lpass variant structure

 .../devicetree/bindings/sound/qcom,lpass-cpu.yaml  |  51 +-
 include/dt-bindings/sound/sc7180-lpass.h           |   1 +
 sound/soc/qcom/Kconfig                             |   5 +
 sound/soc/qcom/Makefile                            |   2 +
 sound/soc/qcom/lpass-apq8016.c                     |  24 +-
 sound/soc/qcom/lpass-cpu.c                         |  93 ++-
 sound/soc/qcom/lpass-hdmi.c                        | 685 +++++++++++++++++++++
 sound/soc/qcom/lpass-hdmi.h                        | 129 ++++
 sound/soc/qcom/lpass-ipq806x.c                     |  24 +-
 sound/soc/qcom/lpass-lpaif-reg.h                   |  51 +-
 sound/soc/qcom/lpass-platform.c                    | 304 +++++++--
 sound/soc/qcom/lpass-sc7180.c                      | 146 ++++-
 sound/soc/qcom/lpass.h                             | 121 +++-
 13 files changed, 1486 insertions(+), 150 deletions(-)
 create mode 100644 sound/soc/qcom/lpass-hdmi.c
 create mode 100644 sound/soc/qcom/lpass-hdmi.h

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

