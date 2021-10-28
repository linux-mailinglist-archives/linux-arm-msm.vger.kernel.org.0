Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAD0443E4BC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Oct 2021 17:14:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231382AbhJ1PRS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Oct 2021 11:17:18 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:53693 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231362AbhJ1PRP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Oct 2021 11:17:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1635434089; x=1666970089;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=wbpYo4VxGy+Lu1dQQvZjRYVBWzKkwHz/CV/1R0cTaNY=;
  b=ksFqCLEetsQhg/qkGnrm2ETMeFmgkjDUmmFaiexcpeOFvu0FTR97tmmn
   EKb37ogo1Qj036Tl0LUKYBCWuz+teASZAU7T1Lj1nziyDo8+gIR6JMN9Z
   ozVSHUpWPhufvnvhcj4ysKwEfeHFOE36j1t1AnGkv9tG0k6d46EfF6wa2
   U=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 28 Oct 2021 08:14:48 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg07-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2021 08:14:47 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Thu, 28 Oct 2021 08:14:46 -0700
Received: from c-skakit-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Thu, 28 Oct 2021 08:14:42 -0700
From:   Satya Priya <quic_c_skakit@quicinc.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
CC:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, <swboyd@chromium.org>,
        <collinsd@codeurora.org>, <subbaram@codeaurora.org>,
        Das Srinagesh <gurus@codeaurora.org>,
        <linux-arm-msm@vger.kernel.org>,
        "Lee Jones" <lee.jones@linaro.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Satya Priya <quic_c_skakit@quicinc.com>
Subject: [PATCH V3 0/4] Add Qualcomm Technologies, Inc. PM8008 regulator driver
Date:   Thu, 28 Oct 2021 20:44:28 +0530
Message-ID: <1635434072-32055-1-git-send-email-quic_c_skakit@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
 .../bindings/regulator/qcom,pm8008-regulator.yaml  |  74 ++++++
 arch/arm64/boot/dts/qcom/sc7280-idp.dtsi           | 103 ++++++++
 drivers/regulator/Kconfig                          |   9 +
 drivers/regulator/Makefile                         |   1 +
 drivers/regulator/qcom-pm8008-regulator.c          | 269 +++++++++++++++++++++
 6 files changed, 480 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/qcom,pm8008-regulator.yaml
 create mode 100644 drivers/regulator/qcom-pm8008-regulator.c

-- 
2.7.4

