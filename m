Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A5D3251E03
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Aug 2020 19:17:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726551AbgHYRQ5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Aug 2020 13:16:57 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:23617 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726471AbgHYRQz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Aug 2020 13:16:55 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1598375814; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=KLK4RTTuf3ksuy/5zrVG85yqJucbVICT8rtcZnGayM0=; b=tE2luUpLcW81GEoNjkugNl+8CKkXqVLDAtFTT8uxskHrnsNtpvJ8cBdh2MUFJi79ZTZX4bX9
 D54FRrZOwOuNt+1IKLwEIWNXYPDtVTk2vqm27H+m9J8H8RtPPHHuyZhdmP8K8ufOf+5/oKwt
 aLqCTW9UxfSN2uyfPNiNPvtlNAs=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 5f454785f558dbf280451a78 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 25 Aug 2020 17:16:53
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id EEA04C43387; Tue, 25 Aug 2020 17:16:52 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from hyd-lnxbld210.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: srivasam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C939FC433C6;
        Tue, 25 Aug 2020 17:16:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C939FC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=srivasam@codeaurora.org
From:   Srinivasa Rao <srivasam@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
        bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
        srinivas.kandagatla@linaro.org, rohitkr@codeaurora.org,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Srinivasa Rao <srivasam@codeaurora.org>
Subject: [PATCH 0/5]: Qualcomm's lpass-hdmi ASoC driver to support audio over dp port
Date:   Tue, 25 Aug 2020 22:46:23 +0530
Message-Id: <1598375788-1882-1-git-send-email-srivasam@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

These patches are to support audio over DP port on Qualcomm's SC7180 LPASS Asoc.
It includes machine driver, cpu driver, platform driver updates for HDMI path support, 
device tree documention, lpass variant structure optimization and configuration changes.
These patches depends on the DP patch series 
https://patchwork.kernel.org/project/dri-devel/list/?series=332029

vsujithk (5):
  dt-bindings: Add sc7180-lpass HDMI header define
  dt-bindings: Add dts entry for lpass-hdmi dp audio
  ASoC: qcom: add support for lpass hdmi driver
  ASoC: qcom: Add support for audio over DP
  Optimise lpass variant structure

 .../devicetree/bindings/sound/qcom,lpass-cpu.yaml  |  42 ++
 include/dt-bindings/sound/sc7180-lpass.h           |   1 +
 sound/soc/qcom/Kconfig                             |   5 +
 sound/soc/qcom/Makefile                            |   2 +
 sound/soc/qcom/lpass-apq8016.c                     |  25 +-
 sound/soc/qcom/lpass-cpu.c                         |  92 ++-
 sound/soc/qcom/lpass-hdmi.c                        | 685 +++++++++++++++++++++
 sound/soc/qcom/lpass-hdmi.h                        | 129 ++++
 sound/soc/qcom/lpass-ipq806x.c                     |  25 +-
 sound/soc/qcom/lpass-lpaif-reg.h                   |  51 +-
 sound/soc/qcom/lpass-platform.c                    | 287 +++++++--
 sound/soc/qcom/lpass-sc7180.c                      | 147 ++++-
 sound/soc/qcom/lpass.h                             | 123 +++-
 13 files changed, 1467 insertions(+), 147 deletions(-)
 create mode 100644 sound/soc/qcom/lpass-hdmi.c
 create mode 100644 sound/soc/qcom/lpass-hdmi.h

-- 
2.7.4

