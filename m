Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EAB3E36E920
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Apr 2021 12:51:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240513AbhD2KwJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Apr 2021 06:52:09 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:48115 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240517AbhD2KwI (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Apr 2021 06:52:08 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1619693482; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=8qXYW7hWM6CxKFFg/DuOejDc4CJqfRKO67BQRsdjogs=; b=xXSjYskD9f4pYxOYtanHAFByHjAcFyoyID1Xmbo54cydrHqRGBsH2HytMmm57zO97uL1HnAg
 QG2PMB6PcFqCBVQBziCOrS3N4/nr7AU1EgQOvY8gR1rLOR/coNJxE/hPNVtrvaF02j/xE3jm
 eH7l9q+aUwV0CKZ8c6u7M0nXZXs=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 608a8fa787ce1fbb562ff975 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 29 Apr 2021 10:51:19
 GMT
Sender: sibis=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 61451C4323A; Thu, 29 Apr 2021 10:51:18 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-87.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 0885BC433D3;
        Thu, 29 Apr 2021 10:51:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0885BC433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     p.zabel@pengutronix.de, bjorn.andersson@linaro.org,
        sboyd@kernel.org
Cc:     agross@kernel.org, robh+dt@kernel.org, mani@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v3 0/5] Enable miscellaneous hardware blocks to boot WPSS
Date:   Thu, 29 Apr 2021 16:21:00 +0530
Message-Id: <1619693465-5724-1-git-send-email-sibis@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series enables miscellaneous hardware blocks to boot Wireless
Processor Subsystem (WPSS) on SC7280 SoC.

V3:
 * member placement and style changes [Philipp] 

V2:
 * place resets and num_resets adjacent to each other [Stephen]
 * drop incorrect useage of tcsr_mutex_regs [Bjorn]
 * Qualcomm is expected to drop master/slave naming from its mproc nodes
   in future SoCs.

Sibi Sankar (5):
  dt-bindings: mailbox: Add WPSS client index to IPCC
  dt-bindings: reset: aoss: Add AOSS reset controller binding
  dt-bindings: reset: pdc: Add PDC Global bindings
  reset: qcom: Add PDC Global reset signals for WPSS
  arm64: dts: qcom: sc7280: Add nodes to boot WPSS

 .../devicetree/bindings/reset/qcom,aoss-reset.yaml |   5 +
 .../devicetree/bindings/reset/qcom,pdc-global.yaml |   4 +
 arch/arm64/boot/dts/qcom/sc7280.dtsi               | 138 +++++++++++++++++++++
 drivers/reset/reset-qcom-pdc.c                     |  62 +++++++--
 include/dt-bindings/mailbox/qcom-ipcc.h            |   1 +
 include/dt-bindings/reset/qcom,sdm845-pdc.h        |   2 +
 6 files changed, 201 insertions(+), 11 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

