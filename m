Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B226933B5E1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Mar 2021 14:56:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231697AbhCONzo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 Mar 2021 09:55:44 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:52991 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231722AbhCONzL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 Mar 2021 09:55:11 -0400
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 15 Mar 2021 06:55:11 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 15 Mar 2021 06:55:09 -0700
X-QCInternal: smtphost
Received: from c-skakit-linux.ap.qualcomm.com (HELO c-skakit-linux.qualcomm.com) ([10.242.51.242])
  by ironmsg01-blr.qualcomm.com with ESMTP; 15 Mar 2021 19:24:34 +0530
Received: by c-skakit-linux.qualcomm.com (Postfix, from userid 2344709)
        id 324FB36CC; Mon, 15 Mar 2021 19:24:33 +0530 (IST)
From:   satya priya <skakit@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, mka@chromium.org,
        rnayak@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        kgunda@codeaurora.org, David Collins <collinsd@codeaurora.org>,
        satya priya <skakit@codeaurora.org>
Subject: [PATCH V2 0/5] Add PM7325/PM8350C/PMR735A regulator support
Date:   Mon, 15 Mar 2021 19:24:09 +0530
Message-Id: <1615816454-1733-1-git-send-email-skakit@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Below patches are already picked
[3/7] regulator: qcom-rpmh: Correct the pmic5_hfsmps515 buck
[6/7] regulator: qcom-rpmh: Use correct buck for S1C regulator

Sending V2 with remaining patches after few corrections/comments answered.

This series is dependent on below series which adds DT files for SC7280 SoC
https://lore.kernel.org/patchwork/project/lkml/list/?series=488871

satya priya (5):
  regulator: qcom-rpmh: Add pmic5_ftsmps520 buck
  regulator: qcom-rpmh: Add PM7325/PMR735A regulator support
  arm64: dts: qcom: sc7280: Add RPMh regulators for sc7280-idp
  dt-bindings: regulator: Convert regulator bindings to YAML format
  dt-bindings: regulator: Add compatibles for PM7325/PMR735A

 .../bindings/regulator/qcom,rpmh-regulator.txt     | 180 -----------------
 .../bindings/regulator/qcom,rpmh-regulator.yaml    | 162 ++++++++++++++++
 arch/arm64/boot/dts/qcom/sc7280-idp.dts            | 212 +++++++++++++++++++++
 drivers/regulator/qcom-rpmh-regulator.c            |  62 +++++-
 4 files changed, 435 insertions(+), 181 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.txt
 create mode 100644 Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

