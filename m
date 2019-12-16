Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E5F1711FE3E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2019 06:59:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726252AbfLPF7H (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Dec 2019 00:59:07 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:60592 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726281AbfLPF7G (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Dec 2019 00:59:06 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1576475946; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=8Io2eg18C7RfxfqAc0O5GDr86IKpDfJ5kmqvGH0Ij6k=; b=YuEFn9uHp9W/SXcPLKbGkk55PxUZDjC2a32ppDR/RfBFCZF6nTaYHKQWQz45VveDo2soRHhk
 FIaYVLD8lRsrv7vSH/bKfV/Keu+1vJjKbnACyqc2tp4EegjIFYow8EoM9cNuzMZ6ShEVtHTl
 6VfaZgEUFWmH4Sgd4m+TA90UT1A=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5df71d25.7fa449e9a420-smtp-out-n02;
 Mon, 16 Dec 2019 05:59:01 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id BF24CC4479C; Mon, 16 Dec 2019 05:59:01 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from davidai-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: daidavid1)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 909FFC43383;
        Mon, 16 Dec 2019 05:59:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 909FFC43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=daidavid1@codeaurora.org
From:   David Dai <daidavid1@codeaurora.org>
To:     georgi.djakov@linaro.org, bjorn.andersson@linaro.org,
        robh+dt@kernel.org
Cc:     David Dai <daidavid1@codeaurora.org>, evgreen@google.com,
        sboyd@kernel.org, ilina@codeaurora.org, seansw@qti.qualcomm.com,
        elder@linaro.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org
Subject: [PATCH v1 0/4] Split SDM845 interconnect nodes and consolidate RPMh support
Date:   Sun, 15 Dec 2019 21:58:41 -0800
Message-Id: <1576475925-20601-1-git-send-email-daidavid1@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

While there are no current consumers of the SDM845 interconnect device in
devicetree, take this opportunity to redefine the interconnect device nodes
as the previous definitions of using a single child node under the apps_rsc
device did not accurately capture the description of the hardware.
The Network-On-Chip (NoC) interconnect devices should be represented in a
manner akin to QCS404 platforms[1] where there is a separation of NoC devices
and its RPM/RPMh counterparts.

The bcm-voter devices are representing the RPMh devices that the interconnect
providers need to communicate with and there can be more than one instance of
the Bus Clock Manager (BCM) which can live under different instances of Resource
State Coordinators (RSC). There are display use cases where consumers may need
to target a different bcm-voter (Some display specific RSC) than the default,
and there needs to be a way to represent this connection in devicetree.

This patches series extends the discussions[2][3] involving the SDM845
interconnect bindings by adding accompanying driver implementations
using the split NoC devices. Some of the code used to support the SDM845
provider driver are refactored into common modules that can used by other
RPMh based interconnect providers such as SC7180[4]. The first patch also
updates existing sdm845 binding documentation to DT schema format using
json-schema.

[1]: https://lkml.org/lkml/2019/6/13/143
[2]: https://lkml.org/lkml/2019/7/19/1063
[3]: https://lkml.org/lkml/2019/10/16/1793
[4]: https://lkml.org/lkml/2019/11/26/389

David Dai (4):
  dt-bindings: interconnect: Update Qualcomm SDM845 DT bindings
  interconnect: qcom: Consolidate interconnect RPMh support
  interconnect: qcom: sdm845: Split qnodes into their respective NoCs
  arm64: dts: sdm845: Redefine interconnect provider DT nodes

 .../bindings/interconnect/qcom,bcm-voter.yaml      |   45 +
 .../bindings/interconnect/qcom,sdm845.txt          |   24 -
 .../bindings/interconnect/qcom,sdm845.yaml         |  108 ++
 arch/arm64/boot/dts/qcom/sdm845.dtsi               |   61 +-
 drivers/interconnect/qcom/Kconfig                  |    8 +
 drivers/interconnect/qcom/Makefile                 |    6 +
 drivers/interconnect/qcom/bcm-voter.c              |  356 +++++++
 drivers/interconnect/qcom/bcm-voter.h              |   28 +
 drivers/interconnect/qcom/icc-rpmh.c               |  158 +++
 drivers/interconnect/qcom/icc-rpmh.h               |  150 +++
 drivers/interconnect/qcom/sdm845.c                 | 1122 ++++++++------------
 include/dt-bindings/interconnect/qcom,sdm845.h     |  263 ++---
 12 files changed, 1523 insertions(+), 806 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/interconnect/qcom,bcm-voter.yaml
 delete mode 100644 Documentation/devicetree/bindings/interconnect/qcom,sdm845.txt
 create mode 100644 Documentation/devicetree/bindings/interconnect/qcom,sdm845.yaml
 create mode 100644 drivers/interconnect/qcom/bcm-voter.c
 create mode 100644 drivers/interconnect/qcom/bcm-voter.h
 create mode 100644 drivers/interconnect/qcom/icc-rpmh.c
 create mode 100644 drivers/interconnect/qcom/icc-rpmh.h

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
