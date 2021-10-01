Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41E4041E667
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Oct 2021 06:01:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240052AbhJAEDl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Oct 2021 00:03:41 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:22391 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237532AbhJAEDb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Oct 2021 00:03:31 -0400
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 30 Sep 2021 21:01:41 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA; 30 Sep 2021 21:01:39 -0700
X-QCInternal: smtphost
Received: from c-skakit-linux.ap.qualcomm.com (HELO c-skakit-linux.qualcomm.com) ([10.242.51.242])
  by ironmsg02-blr.qualcomm.com with ESMTP; 01 Oct 2021 09:31:17 +0530
Received: by c-skakit-linux.qualcomm.com (Postfix, from userid 2344709)
        id DCBA85412; Fri,  1 Oct 2021 09:31:15 +0530 (IST)
From:   Satya Priya <skakit@codeaurora.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Das Srinagesh <gurus@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mka@chromium.org,
        swboyd@chromium.org, collinsd@codeurora.org,
        subbaram@codeaurora.org, kgunda@codeaurora.org,
        Satya Priya <skakit@codeaurora.org>
Subject: [PATCH V2 0/4] Add Qualcomm Technologies, Inc. PM8008 regulator driver
Date:   Fri,  1 Oct 2021 09:30:55 +0530
Message-Id: <1633060859-22969-1-git-send-email-skakit@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Satya Priya (2):
  regulator: dt-bindings: Add pm8008 regulator bindings
  dt-bindings: mfd: pm8008: Add pm8008 regulator node

satya priya (2):
  regulator: Add a regulator driver for the PM8008 PMIC
  arm64: dts: qcom: sc7280: Add pm8008 regulators support for sc7280-idp

 .../devicetree/bindings/mfd/qcom,pm8008.yaml       |  24 ++
 .../bindings/regulator/qcom,pm8008-regulator.yaml  |  72 +++++
 arch/arm64/boot/dts/qcom/sc7280-idp.dtsi           | 103 +++++++
 drivers/regulator/Kconfig                          |   9 +
 drivers/regulator/Makefile                         |   1 +
 drivers/regulator/qcom-pm8008-regulator.c          | 320 +++++++++++++++++++++
 6 files changed, 529 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/qcom,pm8008-regulator.yaml
 create mode 100644 drivers/regulator/qcom-pm8008-regulator.c

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

