Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E04F4459B19
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Nov 2021 05:30:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233384AbhKWEdc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Nov 2021 23:33:32 -0500
Received: from so254-9.mailgun.net ([198.61.254.9]:35717 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233289AbhKWEd2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Nov 2021 23:33:28 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1637641820; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=whmtLXvAQB0fIWyD4MRnrzokarPNCNaLn2AAiLNwSWc=; b=KLpZCTqCcCoQOIFf6qq8yNBpkLrSc795CfYfas+rm1Kv/EPouyLyDptcIeeqqBi8CHOiGXNe
 rQs/yjtwdEk5AHcAzXGq+6b7THhARvZPdzciz5Pm3z3UFliiYD8A4ZYjbaa5aaySD9aHi9v4
 XuafNmGdIgeDMipW4LN0wdEKSyA=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n08.prod.us-east-1.postgun.com with SMTP id
 619c6e5bdf12ba53c4f4b1c9 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 23 Nov 2021 04:30:19
 GMT
Sender: schowdhu=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 0458BC4361A; Tue, 23 Nov 2021 04:30:19 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-525.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: schowdhu)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 22DCDC4360C;
        Tue, 23 Nov 2021 04:30:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 22DCDC4360C
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Souradeep Chowdhury <schowdhu@codeaurora.org>
To:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, pure.logic@nexus-software.ie,
        bjorn.andersson@linaro.org, greg@kroah.com
Cc:     linux-kernel@vger.kernel.org, tsoni@codeaurora.org,
        psodagud@codeaurora.org, satyap@codeaurora.org,
        pheragu@codeaurora.org, rnayak@codeaurora.org,
        sibis@codeaurora.org, saiprakash.ranjan@codeaurora.org,
        quic_schowdhu@quicinc.com,
        Souradeep Chowdhury <schowdhu@codeaurora.org>
Subject: [PATCH V1 0/8] Add Embedded USB Debugger (EUD) driver
Date:   Tue, 23 Nov 2021 09:58:18 +0530
Message-Id: <cover.1637639009.git.schowdhu@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This is a series of patches that implements a driver for the control
peripheral, EUD (Embedded USB Debugger). The EUD is a mini-USB hub
implemented on chip to support the USB-based debug and trace capabilities.
Apart from debug capabilities, EUD has a control peripheral. Control
Peripheral is on when EUD is on and gets signals like USB attach, pet
EUD etc. EUD driver listens to events like USB attach or detach and then
informs the USB about these events via ROLE-SWITCH. At regular intervals,
the EUD driver receives an interrupt to pet the driver indicating that
the software is functional.

Changes in V1

* EUD has now been mapped as a separate DT node as it is an independent QCOM IP.

* EUD is attached to the connector child of dwc3 via port end point since EUD
  driver needs the connector for role-switching,

* EUD driver has been moved now to drivers/soc/qcom/qcom_eud.c.

* All the comments from version 0 of the patch has been implemented.

Souradeep Chowdhury (8):
  dt-bindings: Add the yaml bindings for EUD
  dt-bindings: connector: Add property for EUD type-C connector
  bindings: usb: dwc3: Update dwc3 properties for EUD connector
  usb: dwc3: drd: Register the eud connector child node for dwc3
  soc: qcom: eud: Add driver support for Embedded USB Debugger(EUD)
  arm64: dts: qcom: sc7280: Add EUD dt node and dwc3 connector
  arm64: dts: qcom: sc7280: Set the default dr_mode for usb2
  MAINTAINERS: Add maintainer entry for EUD

 Documentation/ABI/testing/sysfs-driver-eud         |   9 +
 .../bindings/connector/usb-connector.yaml          |   4 +
 .../devicetree/bindings/soc/qcom/qcom,eud.yaml     |  52 ++++
 .../devicetree/bindings/usb/snps,dwc3.yaml         |   6 +
 MAINTAINERS                                        |   8 +
 arch/arm64/boot/dts/qcom/sc7280-idp.dts            |   4 +
 arch/arm64/boot/dts/qcom/sc7280.dtsi               |  25 ++
 drivers/soc/qcom/Kconfig                           |  10 +
 drivers/soc/qcom/Makefile                          |   1 +
 drivers/soc/qcom/qcom_eud.c                        | 268 +++++++++++++++++++++
 drivers/usb/dwc3/drd.c                             |  26 ++
 11 files changed, 413 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-eud
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
 create mode 100644 drivers/soc/qcom/qcom_eud.c

--
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

