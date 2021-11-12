Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CC3C44E107
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Nov 2021 05:25:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230031AbhKLE2D (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Nov 2021 23:28:03 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:54457 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229770AbhKLE2A (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Nov 2021 23:28:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1636691110; x=1668227110;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=U74oTn3YiWljquhRYz897S7wfraIcS+MTY2aLMzvIv8=;
  b=in5KELDg+jowxzZ4wEcKD2t8CuPI6z2mZ+Gbs7gZLNCGgty4rdFlZ/fH
   AU5DdX71PZWZL2vdtq9jtHokPaIwB5Z0AlTQj7WtomzB39wsWe3lERiVF
   HuIP+GfIyITmUci54esGJ0m+WA/KPVsJXWtM4CHse3S5brhTuwzTICxI1
   4=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 11 Nov 2021 20:25:10 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2021 20:25:09 -0800
Received: from nalasex01c.na.qualcomm.com (10.47.97.35) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Thu, 11 Nov 2021 20:25:09 -0800
Received: from fenglinw-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Thu, 11 Nov 2021 20:25:06 -0800
From:   Fenglin Wu <quic_fenglinw@quicinc.com>
To:     <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <sboyd@kernel.org>
CC:     <collinsd@codeaurora.org>, <subbaram@codeaurora.org>,
        <quic_fenglinw@quicinc.com>, <tglx@linutronix.de>, <maz@kernel.org>
Subject: [RESEND PATCH v2 00/11] A bunch of fix and optimization patches in spmi-pmic-arb.c
Date:   Fri, 12 Nov 2021 12:24:08 +0800
Message-ID: <1636691059-4305-1-git-send-email-quic_fenglinw@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This change series includes some fixes and optimizations in spmi-pmic-arb.c.
Following changes are made in v2 patches comparing to v1:
  In [v2 01/11], added code to handle spurious interrupt.
  In [v2 03/11], adressed minor comments to update the code logic.
  In [v2 04/11], minor update to detect spurious interrupt.
  In [v2 05/11], added Fixes tag.
  In [v2 07/11], added Fixes tag and updated commit text to explain the problem.
  In [v2 08/11], added binding change to make interrupt properties as optional.
  In [v2 09/11], updated to check presence of "interrupt-controller" property.
  In [v2 11/11], convert spmi-pmic-arb binding to YAML format.

Abhijeet Dharmapurikar (1):
  spmi: pmic-arb: handle spurious interrupt

Ashay Jaiswal (1):
  spmi: pmic-arb: add support to dispatch interrupt based on IRQ status

David Collins (6):
  spmi: pmic-arb: check apid against limits before calling irq handler
  spmi: pmic-arb: correct duplicate APID to PPID mapping logic
  spmi: pmic-arb: block access for invalid PMIC arbiter v5 SPMI writes
  bindings: spmi: spmi-pmic-arb: mark interrupt properties as optional
  spmi: pmic-arb: make interrupt support optional
  spmi: pmic-arb: increase SPMI transaction timeout delay

Fenglin Wu (1):
  dt-bindings: convert qcom,spmi-pmic-arb binding to YAML format

Subbaraman Narayanamurthy (1):
  spmi: pmic-arb: do not ack and clear peripheral interrupts in
    cleanup_irq

Yimin Peng (1):
  spmi: pmic-arb: clear unexpected interrupt trigger type

 .../bindings/spmi/qcom,spmi-pmic-arb.txt           |  65 ---------
 .../bindings/spmi/qcom,spmi-pmic-arb.yaml          | 122 +++++++++++++++++
 drivers/spmi/spmi-pmic-arb.c                       | 148 +++++++++++++++------
 3 files changed, 227 insertions(+), 108 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/spmi/qcom,spmi-pmic-arb.txt
 create mode 100644 Documentation/devicetree/bindings/spmi/qcom,spmi-pmic-arb.yaml

-- 
2.7.4

