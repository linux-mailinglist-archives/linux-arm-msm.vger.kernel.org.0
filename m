Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD748390863
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 May 2021 20:02:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232027AbhEYSEM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 May 2021 14:04:12 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:6546 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231229AbhEYSEL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 May 2021 14:04:11 -0400
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 25 May 2021 11:02:41 -0700
X-QCInternal: smtphost
Received: from gurus-linux.qualcomm.com ([10.134.64.25])
  by ironmsg01-sd.qualcomm.com with ESMTP; 25 May 2021 11:02:41 -0700
Received: by gurus-linux.qualcomm.com (Postfix, from userid 383780)
        id EE64720EF9; Tue, 25 May 2021 11:02:40 -0700 (PDT)
From:   Guru Das Srinagesh <gurus@codeaurora.org>
To:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org
Cc:     Mark Brown <broonie@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-kernel@vger.kernel.org,
        Guru Das Srinagesh <gurus@codeaurora.org>
Subject: [RESEND PATCH v4 0/3] Add Qualcomm Technologies, Inc. PM8008 MFD driver
Date:   Tue, 25 May 2021 11:02:37 -0700
Message-Id: <cover.1621965146.git.gurus@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Changes from v3:
  - Addressed Lee's comments on v3 [1].

Changes from v2:
  - Collected Rob Herring's Acked-by for the IRQ listing patch
  - Addressed Rob's comments for the dt-bindings patch

Changes from v1:
  - Removed errant Change-Id from dt-bindings IRQ patch and gathered Bjorn's
    Reviewed-by
  - Fixed up YAML errors using make dt_binding_check

This patchset is based on mfd.git/for-mfd-next as the regmap-irq changes have
been pulled in now.  This driver have been tested and verified end-to-end on an
internal platform.

[1] https://lore.kernel.org/lkml/20210510233232.GA22593@codeaurora.org/

Guru Das Srinagesh (3):
  dt-bindings: mfd: pm8008: Add IRQ listing
  dt-bindings: mfd: pm8008: Add bindings
  mfd: pm8008: Add driver for QCOM PM8008 PMIC

 .../devicetree/bindings/mfd/qcom,pm8008.yaml       | 121 ++++++++++
 drivers/mfd/Kconfig                                |  14 ++
 drivers/mfd/Makefile                               |   1 +
 drivers/mfd/qcom-pm8008.c                          | 260 +++++++++++++++++++++
 include/dt-bindings/mfd/qcom-pm8008.h              |  19 ++
 5 files changed, 415 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
 create mode 100644 drivers/mfd/qcom-pm8008.c
 create mode 100644 include/dt-bindings/mfd/qcom-pm8008.h

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

