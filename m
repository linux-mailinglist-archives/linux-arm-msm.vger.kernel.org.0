Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 541621D66C4
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2020 11:23:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727799AbgEQJXG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 17 May 2020 05:23:06 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:52318 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727051AbgEQJXF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 17 May 2020 05:23:05 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1589707385; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=7yZLqS3F5Nzsu+HaL8O8wbWHFVkyKXVYVqGcLcTtlgg=; b=hUcWcQuSFxRHIIfOMicM8lDBOW8krIhuTKDanB3pIoYTQVadq+VDDlwEreVLr+NCsrzX/8nw
 aUarv/6AucZIK2al0T67USBROs4eB5rZ+me8qK4HgCudgf2cts46XBbV4D7FAm3sRJhorkpv
 KqaxlBxVt1g0ApcokDaenLpyiYk=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 5ec10263057563ff3930b7a9 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sun, 17 May 2020 09:22:43
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B78D8C43637; Sun, 17 May 2020 09:22:42 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from tdas-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 31B4FC433F2;
        Sun, 17 May 2020 09:22:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 31B4FC433F2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=tdas@codeaurora.org
From:   Taniya Das <tdas@codeaurora.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?q?Michael=20Turquette=20=C2=A0?= <mturquette@baylibre.com>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        robh@kernel.org, robh+dt@kernel.org,
        Taniya Das <tdas@codeaurora.org>
Subject: [PATCH v2 0/4] clk: qcom: Support for Low Power Audio Clocks on SC7180
Date:   Sun, 17 May 2020 14:52:20 +0530
Message-Id: <1589707344-8871-1-git-send-email-tdas@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

[v2]
 * Update retention macro name.
 * Update the register description in the documentation.

[v1]
 * Add support for Retention of GDSCR.
 * Add YAML schema for LPASS clocks and clock IDs for LPASS.
 * Add clock driver for LPASS core clocks and GCC LPASS clock.

Taniya Das (4):
  clk: qcom: gdsc: Add support to enable retention of GSDCR
  dt-bindings: clock: Add YAML schemas for LPASS clocks on SC7180
  clk: qcom: gcc: Add support for GCC LPASS clock for SC7180
  clk: qcom: lpass: Add support for LPASS clock controller for SC7180

 .../bindings/clock/qcom,sc7180-lpasscorecc.yaml    | 101 +++++
 drivers/clk/qcom/Kconfig                           |   9 +
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/gcc-sc7180.c                      |  14 +
 drivers/clk/qcom/gdsc.c                            |  12 +
 drivers/clk/qcom/gdsc.h                            |   1 +
 drivers/clk/qcom/lpasscorecc-sc7180.c              | 479 +++++++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-sc7180.h        |   1 +
 .../dt-bindings/clock/qcom,lpasscorecc-sc7180.h    |  29 ++
 9 files changed, 647 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sc7180-lpasscorecc.yaml
 create mode 100644 drivers/clk/qcom/lpasscorecc-sc7180.c
 create mode 100644 include/dt-bindings/clock/qcom,lpasscorecc-sc7180.h

--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.

