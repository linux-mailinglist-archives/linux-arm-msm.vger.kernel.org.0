Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCADB456C8D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Nov 2021 10:44:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234564AbhKSJqH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 Nov 2021 04:46:07 -0500
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:50295 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232120AbhKSJqH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 Nov 2021 04:46:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1637314986; x=1668850986;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=077sNQNiT9cC7M+BbedQt0mGxXl85KHz706MQffmVeQ=;
  b=RdKotskw6ID2Qd22Wn4v3p3WypWU1R/oXieFAhIUKkmhBr89cGQmmttV
   wDrhfREbfPGJ775iEYKQ7u8SEMDU2Upm4f3V+EEcIXFcObmeNcs2X7Mf3
   09U/MwnUb+y8d4dhwHgsAw87dzhRcBKUN9mnUpELi0WBIbNBdr/lr28m2
   U=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 19 Nov 2021 01:43:05 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2021 01:43:04 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Fri, 19 Nov 2021 01:43:04 -0800
Received: from c-skakit-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Fri, 19 Nov 2021 01:43:00 -0800
From:   Satya Priya <quic_c_skakit@quicinc.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
CC:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, <swboyd@chromium.org>,
        <collinsd@codeaurora.org>, <subbaram@codeaurora.org>,
        Das Srinagesh <gurus@codeaurora.org>,
        <linux-arm-msm@vger.kernel.org>,
        "Lee Jones" <lee.jones@linaro.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Satya Priya <quic_c_skakit@quicinc.com>
Subject: [PATCH V4 0/6] Add Qualcomm Technologies, Inc. PM8008 regulator driver
Date:   Fri, 19 Nov 2021 15:12:27 +0530
Message-ID: <1637314953-4215-1-git-send-email-quic_c_skakit@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Satya Priya (6):
  dt-bindings: regulator: Add "regulator-min-dropout-voltage-microvolt"
  dt-bindings: regulator: Add pm8008 regulator bindings
  dt-bindings: mfd: pm8008: Add pm8008 regulator node
  regulator: Add a regulator driver for the PM8008 PMIC
  arm64: dts: qcom: pm8008: Add base dts file
  arm64: dts: qcom: sc7280: Add pm8008 regulators support for sc7280-idp

 .../devicetree/bindings/mfd/qcom,pm8008.yaml       |  24 ++
 .../bindings/regulator/qcom,pm8008-regulator.yaml  |  68 ++++++
 .../devicetree/bindings/regulator/regulator.yaml   |   4 +
 arch/arm64/boot/dts/qcom/pm8008.dtsi               |  57 +++++
 arch/arm64/boot/dts/qcom/sc7280-idp.dtsi           |  73 ++++++
 drivers/regulator/Kconfig                          |   9 +
 drivers/regulator/Makefile                         |   1 +
 drivers/regulator/qcom-pm8008-regulator.c          | 258 +++++++++++++++++++++
 8 files changed, 494 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/qcom,pm8008-regulator.yaml
 create mode 100644 arch/arm64/boot/dts/qcom/pm8008.dtsi
 create mode 100644 drivers/regulator/qcom-pm8008-regulator.c

-- 
2.7.4

