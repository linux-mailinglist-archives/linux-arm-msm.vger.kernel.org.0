Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE6CC331ECE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Mar 2021 06:53:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229929AbhCIFwj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Mar 2021 00:52:39 -0500
Received: from z11.mailgun.us ([104.130.96.11]:54565 "EHLO z11.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229872AbhCIFwR (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Mar 2021 00:52:17 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1615269136; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=GnXT3CMbghQtyRJZBgCfodavscSOdiLXWyQmtmjzkks=; b=Tko7x++ENGSpffCUEKycxx75XFPCx3eq7cDL/au1Z5ju0fm5OJMXUbuKCOVv4BorrGyoxFkM
 IdVLUIZitLr1gculZuyJINJmL1JJCv8aI4bPsao+FViFVMzlqiX/NP8wvpPMUBRIhMjBXSjm
 Hah2aZKFr13QS/9QLPfP7DQTQu8=
X-Mailgun-Sending-Ip: 104.130.96.11
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 60470d07c862e1b9fdd5806f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 09 Mar 2021 05:52:07
 GMT
Sender: sibis=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id AC30DC43462; Tue,  9 Mar 2021 05:52:07 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-87.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 38D3FC433CA;
        Tue,  9 Mar 2021 05:52:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 38D3FC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     p.zabel@pengutronix.de, robh+dt@kernel.org,
        bjorn.andersson@linaro.org
Cc:     agross@kernel.org, mani@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        sboyd@kernel.org, Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH 0/6] Enable miscellaneous hardware blocks to boot WPSS
Date:   Tue,  9 Mar 2021 11:21:45 +0530
Message-Id: <1615269111-25559-1-git-send-email-sibis@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series enables miscellaneous hardware blocks to boot Wireless
Processor Subsystem (WPSS) on SC7280 SoC.

[1] https://lore.kernel.org/patchwork/cover/1389010/
The series depends on ^^

Sibi Sankar (6):
  soc: qcom: smem: Update max processor count
  dt-bindings: mailbox: Add WPSS client index to IPCC
  dt-bindings: reset: aoss: Add AOSS reset controller binding
  dt-bindings: reset: pdc: Add PDC Global bindings
  reset: qcom: Add PDC Global reset signals for WPSS
  arm64: dts: qcom: sc7280: Add nodes to boot WPSS

 .../devicetree/bindings/reset/qcom,aoss-reset.yaml |   5 +
 .../devicetree/bindings/reset/qcom,pdc-global.yaml |   4 +
 arch/arm64/boot/dts/qcom/sc7280.dtsi               | 143 +++++++++++++++++++++
 drivers/reset/reset-qcom-pdc.c                     |  62 +++++++--
 drivers/soc/qcom/smem.c                            |   2 +-
 include/dt-bindings/mailbox/qcom-ipcc.h            |   1 +
 include/dt-bindings/reset/qcom,sdm845-pdc.h        |   2 +
 7 files changed, 207 insertions(+), 12 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

