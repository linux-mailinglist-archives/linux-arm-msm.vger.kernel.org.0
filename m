Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DADC0319A83
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Feb 2021 08:35:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229989AbhBLHdz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Feb 2021 02:33:55 -0500
Received: from mail29.static.mailgun.info ([104.130.122.29]:40667 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230001AbhBLHca (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Feb 2021 02:32:30 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1613115124; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=3v3ZhZyvPV4gNNZepTL3KW5IERlBcmTdatZAmlQNn4U=; b=THjs1oJEpO5lS7U0WFLRlSWzB1+J8f7eUivJkWbhHgRVxj6iCNRLY8OI0r9ysQfy9CgukieY
 FcEaGdqbLouWNG514HhNjdklLOJaxZVpqnNp0iSVLkApKTWuNDAf0Ul8BCmxMYwX5sn48txn
 6ZkPet4owqCBIXJ5gT5l1SAsqp4=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 60262ec581f6c45dce9b2dce (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 12 Feb 2021 07:31:17
 GMT
Sender: rnayak=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id CD811C433C6; Fri, 12 Feb 2021 07:31:16 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-173.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 01EC2C433CA;
        Fri, 12 Feb 2021 07:31:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 01EC2C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=rnayak@codeaurora.org
From:   Rajendra Nayak <rnayak@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH 00/13] Add binding updates and DT files for SC7280 SoC
Date:   Fri, 12 Feb 2021 12:58:37 +0530
Message-Id: <1613114930-1661-1-git-send-email-rnayak@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series includes a few minor binding updates and base device tree
files (to boot to shell) for SC7280 SoC and the IDP board using this SoC.

The series is dependent on a few driver patches to merge first, for
gcc, rpmhcc and pinctrl
https://lore.kernel.org/patchwork/project/lkml/list/?series=484517
https://lore.kernel.org/patchwork/project/lkml/list/?series=484489
https://lore.kernel.org/patchwork/patch/1379831/

Maulik Shah (3):
  arm64: dts: qcom: sc7280: Add RSC and PDC devices
  arm64: dts: qcom: Add reserved memory for fw
  arm64: dts: qcom: sc7280: Add cpuidle states

Rajendra Nayak (5):
  dt-bindings: arm: qcom: Document SC7280 SoC and board
  dt-bindings: firmware: scm: Add SC7280 support
  arm64: dts: sc7280: Add basic dts/dtsi files for SC7280 soc
  dt-bindings: qcom,pdc: Add compatible for sc7280
  arm64: dts: qcom: SC7280: Add rpmhcc clock controller node

Sai Prakash Ranjan (4):
  dt-bindings: arm-smmu: Add compatible for SC7280 SoC
  arm64: dts: qcom: sc7280: Add device node for APPS SMMU
  dt-bindings: watchdog: Add compatible for SC7280 SoC
  arm64: dts: qcom: sc7280: Add APSS watchdog node

satya priya (1):
  arm64: dts: qcom: sc7280: Add SPMI PMIC arbiter device for SC7280

 Documentation/devicetree/bindings/arm/qcom.yaml    |   6 +
 .../devicetree/bindings/firmware/qcom,scm.txt      |   1 +
 .../bindings/interrupt-controller/qcom,pdc.txt     |   1 +
 .../devicetree/bindings/iommu/arm,smmu.yaml        |   1 +
 .../devicetree/bindings/watchdog/qcom-wdt.yaml     |   1 +
 arch/arm64/boot/dts/qcom/Makefile                  |   1 +
 arch/arm64/boot/dts/qcom/sc7280-idp.dts            |  47 ++
 arch/arm64/boot/dts/qcom/sc7280.dtsi               | 596 +++++++++++++++++++++
 8 files changed, 654 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sc7280-idp.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7280.dtsi

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

