Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B27094209D1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Oct 2021 13:16:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232885AbhJDLSi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Oct 2021 07:18:38 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:25348 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232200AbhJDLSh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Oct 2021 07:18:37 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1633346209; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=dFJdz5wggW2QI/TWt9kk369Y/MZGXDdLuBGlDz/FLD0=; b=gHwHq4kA9g9yteM4FvJlqGTEn4NSLlIalg5DO+Ebdff29vKgMza8AqC98wJujDfXxz/Trsph
 9TudGrjAtki2jCw5dvvqNqlcQbGtlYUTisU/3MAX5QA4vp46AA/htnM/taYFaqG8p5lzs6fq
 48wTQC0WUjQdaQzbF8liQbvRezA=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 615ae29d8578ef11ed7d557c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 04 Oct 2021 11:16:45
 GMT
Sender: schowdhu=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id F0EDBC43619; Mon,  4 Oct 2021 11:16:44 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-525.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: schowdhu)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 8FE13C4338F;
        Mon,  4 Oct 2021 11:16:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 8FE13C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Souradeep Chowdhury <schowdhu@codeaurora.org>
To:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org,
        Bryan O'Donoghue <pure.logic@nexus-software.ie>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg KH <greg@kroah.com>
Cc:     linux-kernel@vger.kernel.org, ckadabi@codeaurora.org,
        tsoni@codeaurora.org, bryanh@codeaurora.org,
        psodagud@codeaurora.org, satyap@codeaurora.org,
        pheragu@codeaurora.org, Rajendra Nayak <rnayak@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Souradeep Chowdhury <schowdhu@codeaurora.org>
Subject: [PATCH V0 0/7] Add Embedded USB Debugger (EUD) driver
Date:   Mon,  4 Oct 2021 16:46:18 +0530
Message-Id: <cover.1633343547.git.schowdhu@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This is a series of patches that implements a driver for the control
peripheral, EUD (Embedded USB Debugger). The EUD is a mini-USB hub
implemented on chip to support the USB-based debug and trace capabilities.
Apart from debug capabilities, EUD has a control peripheral. Control
Peripheral is on when EUD is on and gets signals like USB attach, pet
EUD etc.EUD driver listens to events like USB attach or detach and then
informs the USB about these events via ROLE-SWITCH. At regular intervals,
the EUD driver receives an interrupt to pet the driver indicating that
the software is functional.

Souradeep Chowdhury (7):
  dt-bindings: connector: Add property for eud type c connector
  dt-bindings: usb: dwc3: Update dwc3 properties for EUD connector
  usb: dwc3: drd: Register the eud connector child node for dwc3
  usb: common: eud:Added the driver support for Embedded USB
    Debugger(EUD)
  arm64: dts: qcom: sc7280: Add EUD connector node
  arm64: dts: qcom: sc7280: Set the default dr_mode for usb2
  MAINTAINERS: Add maintainer entry for EUD

 Documentation/ABI/testing/sysfs-driver-eud         |   7 +
 .../bindings/connector/usb-connector.yaml          |  15 ++
 .../devicetree/bindings/usb/snps,dwc3.yaml         |  15 ++
 MAINTAINERS                                        |   7 +
 arch/arm64/boot/dts/qcom/sc7280-idp.dts            |   4 +
 arch/arm64/boot/dts/qcom/sc7280.dtsi               |  12 +
 drivers/usb/common/Kconfig                         |   9 +
 drivers/usb/common/Makefile                        |   1 +
 drivers/usb/common/qcom_eud.c                      | 256 +++++++++++++++++++++
 drivers/usb/dwc3/drd.c                             |  25 ++
 10 files changed, 351 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-eud
 create mode 100644 drivers/usb/common/qcom_eud.c

--
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

