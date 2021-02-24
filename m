Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AE303238B7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Feb 2021 09:35:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234460AbhBXIfQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Feb 2021 03:35:16 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:47054 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234455AbhBXIfG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Feb 2021 03:35:06 -0500
Received: from ironmsg07-lv.qualcomm.com (HELO ironmsg07-lv.qulacomm.com) ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 24 Feb 2021 00:34:00 -0800
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg07-lv.qulacomm.com with ESMTP/TLS/AES256-SHA; 24 Feb 2021 00:33:58 -0800
X-QCInternal: smtphost
Received: from c-skakit-linux.ap.qualcomm.com (HELO c-skakit-linux.qualcomm.com) ([10.242.51.242])
  by ironmsg01-blr.qualcomm.com with ESMTP; 24 Feb 2021 14:03:32 +0530
Received: by c-skakit-linux.qualcomm.com (Postfix, from userid 2344709)
        id 1BDC13C9C; Wed, 24 Feb 2021 14:03:31 +0530 (IST)
From:   satya priya <skakit@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, rnayak@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kgunda@codeaurora.org,
        satya priya <skakit@codeaurora.org>
Subject: [PATCH 0/7] Add PM7325/PM8350C/PMR735A regulator support
Date:   Wed, 24 Feb 2021 14:03:05 +0530
Message-Id: <1614155592-14060-1-git-send-email-skakit@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series is dependent on below series which adds DT files for SC7280 SoC
https://lore.kernel.org/patchwork/project/lkml/list/?series=484757

satya priya (7):
  dt-bindings: regulator: Convert regulator bindings to YAML
  dt-bindings: regulator: Add compatibles for PM7325/PMR735A
  regulator: qcom-rpmh: Correct the pmic5_hfsmps515 buck
  regulator: qcom-rpmh: Add pmic5_ftsmps520 buck
  regulator: qcom-rpmh: Add PM7325/PMR735A regulator support
  regulator: qcom-rpmh: Use correct buck for S1C regulator
  arm64: dts: qcom: sc7280: Add RPMh regulators for sc7280-idp

 .../bindings/regulator/qcom,rpmh-regulator.txt     | 180 ------------------
 .../bindings/regulator/qcom,rpmh-regulator.yaml    | 151 +++++++++++++++
 arch/arm64/boot/dts/qcom/sc7280-idp.dts            | 211 +++++++++++++++++++++
 drivers/regulator/qcom-rpmh-regulator.c            |  68 ++++++-
 4 files changed, 426 insertions(+), 184 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.txt
 create mode 100644 Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

