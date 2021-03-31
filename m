Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5103134FFF2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Mar 2021 14:07:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235014AbhCaMHA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 Mar 2021 08:07:00 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:8168 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235347AbhCaMGd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 Mar 2021 08:06:33 -0400
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 31 Mar 2021 05:06:32 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 31 Mar 2021 05:06:31 -0700
X-QCInternal: smtphost
Received: from c-skakit-linux.ap.qualcomm.com (HELO c-skakit-linux.qualcomm.com) ([10.242.51.242])
  by ironmsg01-blr.qualcomm.com with ESMTP; 31 Mar 2021 17:35:59 +0530
Received: by c-skakit-linux.qualcomm.com (Postfix, from userid 2344709)
        id 76AB426F7; Wed, 31 Mar 2021 17:35:57 +0530 (IST)
From:   satya priya <skakit@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, rnayak@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kgunda@codeaurora.org,
        satya priya <skakit@codeaurora.org>
Subject: [PATCH V3 0/5] Add PM7325/PM8350C/PMR735A regulator support 
Date:   Wed, 31 Mar 2021 17:35:34 +0530
Message-Id: <1617192339-3760-1-git-send-email-skakit@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series is dependent on below series which adds DT files for SC7280 SoC
https://lore.kernel.org/patchwork/project/lkml/list/?series=488871

satya priya (5):
  regulator: qcom-rpmh: Add pmic5_ftsmps520 buck
  regulator: qcom-rpmh: Add PM7325/PMR735A regulator support
  arm64: dts: qcom: sc7280: Add RPMh regulators for sc7280-idp
  dt-bindings: regulator: Convert RPMh regulator bindings to YAML
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

