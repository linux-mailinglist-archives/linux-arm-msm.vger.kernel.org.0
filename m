Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB84B135407
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2020 09:05:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728267AbgAIIFk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Jan 2020 03:05:40 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:51963 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728333AbgAIIFj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Jan 2020 03:05:39 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1578557139; h=Content-Transfer-Encoding: Content-Type:
 MIME-Version: Message-Id: Date: Subject: To: From: Sender;
 bh=BuUdAvhMRovZFUB4BJ0UiwY2Y6k8o8mctzHNiqvFTHc=; b=Q6RVH8WN4REMDA4J4LCWSw2xR2U6Wp5gFSeKZ1oZnlCwSFWrLHVbvrgzGtlWuCpTG3jOgIhU
 Y8XJ0MdFh2MHGw1mm9fpyrfP2efeLy6gk42E195lbtO1TLt2VLaF6YWeJzaYjvLQRSzMZiAs
 iXGgEJg8fOiZaf7umOccCk+LtlQ=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e16ded1.7fc6d05c2148-smtp-out-n01;
 Thu, 09 Jan 2020 08:05:37 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E44E8C447A5; Thu,  9 Jan 2020 08:05:35 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from srichara1-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sricharan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id BD78EC4479C;
        Thu,  9 Jan 2020 08:05:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org BD78EC4479C
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sricharan@codeaurora.org
From:   Sricharan R <sricharan@codeaurora.org>
To:     agross@kernel.org, devicetree@vger.kernel.org,
        linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-soc@vger.kernel.org, robh+dt@kernel.org,
        sivaprak@codeaurora.org, sricharan@codeaurora.org, sboyd@kernel.org
Subject: [PATCH V2 0/2] Add Global clock controller support for IPQ6018
Date:   Thu,  9 Jan 2020 13:35:19 +0530
Message-Id: <1578557121-423-1-git-send-email-sricharan@codeaurora.org>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The IPQ6018 is Qualcomm’s 802.11ax/u2019s SoC for Routers,
Gateways and Access Points.

[V2]
 * Addressed sparse warnings reported by Kbuild test robot.

This series adds Global clock controller support for ipq6018.

Sricharan R (2):
  clk: qcom: Add DT bindings for ipq6018 gcc clock controller
  clk: qcom: Add ipq6018 Global Clock Controller support

 .../devicetree/bindings/clock/qcom,gcc.yaml        |    3 +-
 drivers/clk/qcom/Kconfig                           |    8 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/gcc-ipq6018.c                     | 4643 ++++++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-ipq6018.h       |  262 ++
 include/dt-bindings/reset/qcom,gcc-ipq6018.h       |  157 +
 6 files changed, 5073 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clk/qcom/gcc-ipq6018.c
 create mode 100644 include/dt-bindings/clock/qcom,gcc-ipq6018.h
 create mode 100644 include/dt-bindings/reset/qcom,gcc-ipq6018.h

-- 
1.9.1
