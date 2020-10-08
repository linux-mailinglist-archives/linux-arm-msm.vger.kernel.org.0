Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C786286DED
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Oct 2020 07:17:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726148AbgJHFR0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Oct 2020 01:17:26 -0400
Received: from m42-4.mailgun.net ([69.72.42.4]:23618 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726216AbgJHFRZ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Oct 2020 01:17:25 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1602134244; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=ckz42tFStxh5B1luhWfn73wl9mbtBZnzWuXQ/lOTgG4=; b=bJt+l+T4V2YFJcu7s+KdjZTN8GnvklWmnhyt2OvizO3lSe2uvUCN+MB/550FjGm1ElLsHAG8
 IqlWRHkZniUuqWMtlLngIxG8r2ZXrYt7ndJNHNCTa6y4JYVLT+bMd3GqH0yNJ0HXVb47DcNo
 /YUZafS+yQd2TdN/w3D8L4iSfLQ=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 5f7ea0e242f9861fb16ccd7b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 08 Oct 2020 05:17:22
 GMT
Sender: srivasam=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id DB409C43391; Thu,  8 Oct 2020 05:17:22 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from hyd-lnxbld210.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: srivasam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A1478C433CB;
        Thu,  8 Oct 2020 05:17:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A1478C433CB
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
Subject: [PATCH v11 0/7] Qualcomm's lpass-hdmi ASoC driver to support audio over dp port
Date:   Thu,  8 Oct 2020 10:46:56 +0530
Message-Id: <1602134223-2562-1-git-send-email-srivasam@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

These patches are to support audio over DP port on Qualcomm's SC7180 LPASS
Asoc. It includes machine driver, cpu driver, platform driver updates for 
HDMI path support, device tree documention, lpass variant structure 
optimization and configuration changes.
These patches depends on the DP patch series
https://patchwork.kernel.org/project/dri-devel/list/?series=332029
https://lore.kernel.org/patchwork/project/lkml/list/?series=464856

changes since V10:
    -- Moved hdmi regmap functions from lpass-hdmi.c to lpass-cpu.c
    -- Moved QCOM_REGMAP_FIELD_ALLOC macro from lpass-hdmi.c to lpass.h
changes since V9:
    -- Removed unused structures lpass_hdmi.h
changes since V8:
    -- Removed redundant structure wrapper for reg map field memebrs
    -- Updated lpass_hdmi_regmap_volatile API with appropriate registers as true
       and others as false.
changes since V7:
    -- Fixed typo errors
    -- Created Separate patch for buffer size change 
changes since V6:
    -- Removed compile time define flag, which used for enabling
     HDMI code, based on corresponding config param is included.
    -- Updated reg map alloc API with reg map bulk API.
    -- Removed unnecessary line splits
changes since V5:
    -- Removed unused struct regmap *map in lpass_platform_alloc_hdmidmactl_fields.
    -- DMA alloc and free API signature change in lpass-apq8016.c, lpass-ipq806x.c 
    -- Keeping API "irqreturn_t lpass_platform_hdmiif_irq" under ifdef macro
Changes Since v4:
    -- Updated with single compatible node for both I2S and HDMI.
Changes Since v3:
    -- Removed id in lpass variant structure and used snd_soc_dai_driver id.
Changes Since v2:
    -- Audio buffer size(i.e. LPASS_PLATFORM_BUFFER_SIZE) in lpass-platform.c increased.
Changes Since v1:
    -- Commit messages are updated
    -- Addressed Rob Herring review comments

V Sujith Kumar Reddy (7):
  ASoC: Add sc7180-lpass binding header hdmi define
  ASoC: dt-bindings: Add dt binding for lpass hdmi
  Asoc:qcom:lpass-cpu:Update dts property read API
  Asoc: qcom: lpass:Update lpaif_dmactl members order
  ASoC: qcom: Add support for lpass hdmi driver
  Asoc: qcom: lpass-platform : Increase buffer size
  ASoC: qcom: sc7180: Add support for audio over DP

 .../devicetree/bindings/sound/qcom,lpass-cpu.yaml  |  74 ++--
 include/dt-bindings/sound/sc7180-lpass.h           |   1 +
 sound/soc/qcom/Kconfig                             |   5 +
 sound/soc/qcom/Makefile                            |   2 +
 sound/soc/qcom/lpass-apq8016.c                     |   4 +-
 sound/soc/qcom/lpass-cpu.c                         | 249 ++++++++++++-
 sound/soc/qcom/lpass-hdmi.c                        | 258 ++++++++++++++
 sound/soc/qcom/lpass-hdmi.h                        | 102 ++++++
 sound/soc/qcom/lpass-ipq806x.c                     |   4 +-
 sound/soc/qcom/lpass-lpaif-reg.h                   |  49 ++-
 sound/soc/qcom/lpass-platform.c                    | 395 +++++++++++++++++----
 sound/soc/qcom/lpass-sc7180.c                      | 116 +++++-
 sound/soc/qcom/lpass.h                             | 124 ++++++-
 13 files changed, 1240 insertions(+), 143 deletions(-)
 create mode 100644 sound/soc/qcom/lpass-hdmi.c
 create mode 100644 sound/soc/qcom/lpass-hdmi.h

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

