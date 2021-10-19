Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FB47432D22
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Oct 2021 07:29:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229649AbhJSFcJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Oct 2021 01:32:09 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:40351 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229521AbhJSFcI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Oct 2021 01:32:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1634621397; x=1666157397;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=3KXJipwBT5wM0QpPKt1Aur/nMl/J6f6HBWrRGQ/gVn4=;
  b=nXzb0GR5EEILJS29dbl34DeDnCbOpllaGZQ7YzAyDRAhfSMOz9Kp+q52
   RZA8TnJssq8goUaRp8zCi0JPq0K16S7PkDe7K5ylY/gBzN+tQxJGi934y
   BbbdmlMCacD0NVh4VdbzqvlPJy6zp7n1Gp1RnF0yNLueRaeSpWtb9wHl5
   U=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 18 Oct 2021 22:29:57 -0700
X-QCInternal: smtphost
Received: from nalasex01c.na.qualcomm.com ([10.47.97.35])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2021 22:29:56 -0700
Received: from fenglinw-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Mon, 18 Oct 2021 22:29:53 -0700
From:   Fenglin Wu <quic_fenglinw@quicinc.com>
To:     <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <sboyd@kernel.org>
CC:     <collinsd@codeaurora.org>, <subbaram@codeaurora.org>,
        <quic_fenglinw@quicinc.com>, <tglx@linutronix.de>,
        <maz@kernel.org>, "Fenglin Wu" <fenglinw@codeaurora.org>
Subject: [PATCH v2 00/10] A bunch of fix and optimization patches in spmi-pmic-arb.c
Date:   Tue, 19 Oct 2021 13:29:11 +0800
Message-ID: <1634621361-17155-1-git-send-email-quic_fenglinw@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Fenglin Wu <fenglinw@codeaurora.org>

This change series includes some fixes and optimizations in spmi-pmic-arb.c.
Following changes are made in v2 patches comparing to v1:
  In [v2 01/10], added code to handle spurious interrupt.
  In [v2 03/10], adressed minor comments to update the code logic.
  In [v2 04/10], minor update to detect spurious interrupt.
  In [v2 05/10], added Fixes tag.
  In [v2 07/10], added Fixes tag and updated commit text to explain the problem.
  In [v2 08/10], added binding change to make interrupt properties as optional.
  In [v2 09/10], updated to check presence of "interrupt-controller" property.

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

Subbaraman Narayanamurthy (1):
  spmi: pmic-arb: do not ack and clear peripheral interrupts in
    cleanup_irq

Yimin Peng (1):
  spmi: pmic-arb: clear unexpected interrupt trigger type

 .../bindings/spmi/qcom,spmi-pmic-arb.txt           |   2 +
 drivers/spmi/spmi-pmic-arb.c                       | 148 +++++++++++++++------
 2 files changed, 107 insertions(+), 43 deletions(-)

-- 
2.7.4

