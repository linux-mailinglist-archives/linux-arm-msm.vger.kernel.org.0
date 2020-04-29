Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 988641BD12A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2020 02:30:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726618AbgD2AaP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Apr 2020 20:30:15 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:49937 "EHLO
        alexa-out-sd-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726386AbgD2AaP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Apr 2020 20:30:15 -0400
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 28 Apr 2020 17:30:13 -0700
Received: from gurus-linux.qualcomm.com ([10.46.162.81])
  by ironmsg01-sd.qualcomm.com with ESMTP; 28 Apr 2020 17:30:13 -0700
Received: by gurus-linux.qualcomm.com (Postfix, from userid 383780)
        id 37E194C85; Tue, 28 Apr 2020 17:30:13 -0700 (PDT)
From:   Guru Das Srinagesh <gurus@codeaurora.org>
To:     devicetree@vger.kernel.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Subbaraman Narayanamurthy <subbaram@codeaurora.org>,
        David Collins <collinsd@codeaurora.org>,
        linux-kernel@vger.kernel.org,
        Guru Das Srinagesh <gurus@codeaurora.org>
Subject: [PATCH v1 0/2] Introduce QTI I2C PMIC controller
Date:   Tue, 28 Apr 2020 17:30:10 -0700
Message-Id: <cover.1588115326.git.gurus@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add devicetree bindings and code for the Qualcomm Technologies, Inc. I2C PMIC
controller.

Guru Das Srinagesh (2):
  dt-bindings: mfd: Document QTI I2C PMIC controller
  mfd: Introduce QTI I2C PMIC controller

 .../devicetree/bindings/mfd/qcom,i2c-pmic.yaml     |  86 +++
 drivers/mfd/Kconfig                                |  11 +
 drivers/mfd/Makefile                               |   1 +
 drivers/mfd/qcom-i2c-pmic.c                        | 737 +++++++++++++++++++++
 4 files changed, 835 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/qcom,i2c-pmic.yaml
 create mode 100644 drivers/mfd/qcom-i2c-pmic.c

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

