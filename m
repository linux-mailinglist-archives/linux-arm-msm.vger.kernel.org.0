Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5505714E7F7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Jan 2020 05:43:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727981AbgAaEnt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Jan 2020 23:43:49 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:40564 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728005AbgAaEnt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Jan 2020 23:43:49 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1580445828; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=Ll0wcKc1k7IzcI6Q0ZHQPG6BHe+VN/nY0QZPu5GmLGY=; b=kBN2T6XTaIW43e+mNE5Nb4494r4H7yZAzewy5zVaiqrpWcNW+zVDUOER97ZiRXe0wtuCqLsk
 tVbzXJLaR7yo82Tn2lBGhjrnYgW8yW0ZBNWu+lMzx49XJaTZrD4HUZ6dDU449Fr5msieIfOa
 BgwMad295hRXN2e4eJ5W8Rar2M4=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e33b082.7f8d58e4b180-smtp-out-n02;
 Fri, 31 Jan 2020 04:43:46 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B7A2DC433A2; Fri, 31 Jan 2020 04:43:46 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.0
Received: from akdwived-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akdwived)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C87ADC43383;
        Fri, 31 Jan 2020 04:43:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C87ADC43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=akdwived@codeaurora.org
From:   Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
To:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, ckadabi@codeaurora.org,
        tsoni@codeaurora.org, bryanh@codeaurora.org,
        psodagud@codeaurora.org, rnayak@codeaurora.org,
        satyap@codeaurora.org, pheragu@codeaurora.org,
        Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
Subject: [PATCH v4 0/2] Add Embedded USB Debugger (EUD) driver
Date:   Fri, 31 Jan 2020 10:13:29 +0530
Message-Id: <1580445811-15948-1-git-send-email-akdwived@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This is a series of patches that implements a driver for the control
peripheral, EUD (Embedded USB Debugger). The EUD is a mini-USB hub 
implemented on chip to support the USB-based debug and trace capabilities.
Apart from debug capabilities, EUD has a control peripheral. Control 
Peripheral is on when EUD is on and gets signals like USB attach, pet EUD,
charge phone etc. EUD driver listens to events like USB attach or detach 
and charger enable or disable and then notifies the USB driver or PMIC 
driver respectively about these events via EXTCON. At regular intervals, 
the EUD driver receives an interrupt to pet the driver indicating that 
the software is functional.

Changes since v3:
- Remove power supply type check in the enable path of EUD
- Use default attribute group to create sysfs attribute
- Updated the dt-binding
Changes since v2:
- Remove module_param and add sysfs support instead
- Simplify if-else condition
- Change if-elseif to switch case
- Return -ENOMEM
- Got rid of unnecessary checks in sysfs store function
- Updated the dt-binding
Changes since v1:
- Remove EUD_NR as it is an unused macro
Changes since v0:
- Remove select SERIAL_CORE from Kconfig as this patch doesn't involve
  anything related to serial console
- Changed the dt-bindings to remove extcon and replace it with graphs
  to represent a connection with client

Avaneesh Kumar Dwivedi (2):
  dt-bindings: Documentation for qcom,eud
  Embedded USB Debugger (EUD) driver

 Documentation/ABI/stable/sysfs-driver-msm-eud      |   5 +
 .../devicetree/bindings/soc/qcom/qcom,msm-eud.txt  |  43 +++
 drivers/soc/qcom/Kconfig                           |  12 +
 drivers/soc/qcom/Makefile                          |   1 +
 drivers/soc/qcom/eud.c                             | 329 +++++++++++++++++++++
 5 files changed, 390 insertions(+)
 create mode 100644 Documentation/ABI/stable/sysfs-driver-msm-eud
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,msm-eud.txt
 create mode 100644 drivers/soc/qcom/eud.c

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project.
