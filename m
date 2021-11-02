Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83BA4442B22
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Nov 2021 10:57:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229770AbhKBJ7m (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Nov 2021 05:59:42 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:41010 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229823AbhKBJ7m (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Nov 2021 05:59:42 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1635847027; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=ypwr1C5T8vrdqdnIUZMTfV2NLbUn1Huykf7qeMaq0oM=; b=asmIMZ1w2q2rwzHA92FWs0HQgtjzb1a6vZ8NPEtJid8Ba9M5U4KEpqhsToQL3ZizhrF3mYDD
 iZlJLDEI1ou5ARxPWptvVoZOZazn/3bikbu96dR+Zg+BZSaHqLhCgPKits3qANWQccl/4rav
 /nnEt49yZtJ1e4moo/9FbJzEHck=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 61810b732e144ac4d3c41dc1 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 02 Nov 2021 09:57:07
 GMT
Sender: tdas=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 1D447C43460; Tue,  2 Nov 2021 09:57:05 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from tdas-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E8D07C4338F;
        Tue,  2 Nov 2021 09:57:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org E8D07C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Taniya Das <tdas@codeaurora.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?q?Michael=20Turquette=20=C2=A0?= <mturquette@baylibre.com>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org, robh+dt@kernel.org,
        Taniya Das <tdas@codeaurora.org>
Subject: [PATCH v1 0/4] Add support for LPASS Core and Audio Clock for SC7280
Date:   Tue,  2 Nov 2021 15:26:49 +0530
Message-Id: <1635847013-3220-1-git-send-email-tdas@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patchset supports the following.
- Few PLLs might require to a higher time to detect lock, thus increase the
  polling time.
- GDSC which require clocks to be explicitly enabled before access.
- LPASS core and audio clock driver support for SC7280.

Taniya Das (4):
  clk: qcom: clk-alpha-pll: Increase PLL lock detect poll time
  clk: qcom: gdsc: Add support for clock voting from GDSC
  dt-bindings: clock: Add YAML schemas for LPASS clocks on SC7280
  clk: qcom: lpass: Add support for LPASS clock controller for SC7280

 .../bindings/clock/qcom,sc7280-lpasscorecc.yaml    | 137 ++++
 drivers/clk/qcom/Kconfig                           |   9 +
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/clk-alpha-pll.c                   |   2 +-
 drivers/clk/qcom/gdsc.c                            |  45 +-
 drivers/clk/qcom/gdsc.h                            |   3 +
 drivers/clk/qcom/lpassaudiocc-sc7280.c             | 831 +++++++++++++++++++++
 drivers/clk/qcom/lpasscorecc-sc7280.c              | 491 ++++++++++++
 .../dt-bindings/clock/qcom,lpassaudiocc-sc7280.h   |  43 ++
 .../dt-bindings/clock/qcom,lpasscorecc-sc7280.h    |  26 +
 10 files changed, 1581 insertions(+), 7 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscorecc.yaml
 create mode 100644 drivers/clk/qcom/lpassaudiocc-sc7280.c
 create mode 100644 drivers/clk/qcom/lpasscorecc-sc7280.c
 create mode 100644 include/dt-bindings/clock/qcom,lpassaudiocc-sc7280.h
 create mode 100644 include/dt-bindings/clock/qcom,lpasscorecc-sc7280.h

--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.

