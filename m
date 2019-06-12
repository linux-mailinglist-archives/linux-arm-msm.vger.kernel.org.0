Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31F9C42339
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2019 13:01:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406604AbfFLLBH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Jun 2019 07:01:07 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:37988 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727992AbfFLLBH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Jun 2019 07:01:07 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 26CCC60769; Wed, 12 Jun 2019 11:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1560337266;
        bh=lzpHdLUEUqtwXqGtqgm9oTsDgX5Kg8aW/R4ibVuLnco=;
        h=From:To:Cc:Subject:Date:From;
        b=HTu1YrNvmB4O7ZGF7koUANRNxNSS6KSWNx7c+84tYaet02uzPK0DnWGZZXJO6ZFEN
         Nr0VNRdhkCCHzsPDZElgAA5ZBN9Zznu29qmA7dY2bTuNwa+pM1vGSGRutuRdsS1guJ
         rgWlrohVO1RNLGpZngtZ1+0h8j3/wU70lwJamQfM=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from blr-ubuntu-288.qualcomm.com (blr-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: nishakumari@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 982ED602F3;
        Wed, 12 Jun 2019 11:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1560337265;
        bh=lzpHdLUEUqtwXqGtqgm9oTsDgX5Kg8aW/R4ibVuLnco=;
        h=From:To:Cc:Subject:Date:From;
        b=PITdNvAl3B0HTbps14aPOcbv5Y/YN9ZA2yPFfyICoNRpzCN0JqEWphObWdeJRXIvO
         eDNq8SyR9t4yTg9Ckjxnx+4fqd9bPoVu3Op7OROqNUvH3m87w2e0JEC1Mx+iFfl3u6
         1dOnwtiVHMIWqwiIqDcsDN8uq9W5iHN/ZKsaW2Fo=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 982ED602F3
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=nishakumari@codeaurora.org
From:   Nisha Kumari <nishakumari@codeaurora.org>
To:     bjorn.andersson@linaro.org, broonie@kernel.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        agross@kernel.org
Cc:     lgirdwood@gmail.com, mark.rutland@arm.com, david.brown@linaro.org,
        linux-kernel@vger.kernel.org, kgunda@codeaurora.org,
        rnayak@codeaurora.org, Nisha Kumari <nishakumari@codeaurora.org>
Subject: [PATCH 0/4] Add labibb regulator support for LCD display mode
Date:   Wed, 12 Jun 2019 16:30:48 +0530
Message-Id: <1560337252-27193-1-git-send-email-nishakumari@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch series adds the labibb regulator for supporting LCD display mode
on SDM845.

Nisha Kumari (4):
  dt-bindings: regulator: Add labibb regulator
  arm64: dts: qcom: pmi8998: Add nodes for LAB and IBB regulators
  regulator: Add labibb driver
  regulator: adding interrupt handling in labibb regulator

 .../bindings/regulator/qcom-labibb-regulator.txt   |  57 ++
 arch/arm64/boot/dts/qcom/pmi8998.dtsi              |  22 +
 drivers/regulator/Kconfig                          |  10 +
 drivers/regulator/Makefile                         |   1 +
 drivers/regulator/qcom-labibb-regulator.c          | 599 +++++++++++++++++++++
 5 files changed, 689 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/qcom-labibb-regulator.txt
 create mode 100644 drivers/regulator/qcom-labibb-regulator.c

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

