Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5BF3D12B1E8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Dec 2019 07:38:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727050AbfL0Giv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Dec 2019 01:38:51 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:49553 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726265AbfL0Git (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Dec 2019 01:38:49 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1577428729; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=nq8/oRwBTL0CHWndYEmMuTpFlMH3x2xQLeaPRjlV7ek=; b=WomordFKcjyXUbfKt7Et+bpKY96J9A4qX8scWzoKssc5gfooYCDqSvUlOcr6royWqK2mOlNR
 E7t9QbhRYUB5gPAnfIUf+tmuoC67gxBITtVGto+6ueMczYtkxKU62E6+YAexdIjZD3kkbHhd
 NsT3KZcxeYhuTFJ5mCckT5jEWgA=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e05a6f7.7f080e93e960-smtp-out-n02;
 Fri, 27 Dec 2019 06:38:47 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 4D4C8C433A2; Fri, 27 Dec 2019 06:38:46 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.0
Received: from tdas-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B7335C43383;
        Fri, 27 Dec 2019 06:38:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B7335C43383
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
Subject: [PATCH v3 0/6] Add GPU & Video Clock controller driver for SC7180
Date:   Fri, 27 Dec 2019 12:08:28 +0530
Message-Id: <1577428714-17766-1-git-send-email-tdas@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

[v3]
 * Update the clock items in Documentation binding with the GPLL0 branch names.
 * Update gpu_cc_parent_data to remove .name for GCC GPLL0 source.
 * Mark video_cc_xo_clk clock critical from videocc probe.

[v2]
 * Split Fabia code cleanup and calibration code.
 * Few cleanups for GPU/Video CC are
    * header file inclusion, const for pll vco table.
    * removal of always enabled clock from gpucc.
    * compatibles added in sorted order.
    * move from core_initcall to subsys_initcall().
    * cleanup clk_parent_data for clocks to be provided from DT.

[v1]
 * Fabia PLLs could fail latching in the case where the PLL is not
   calibrated, so add support to calibrate in prepare clock ops.

 * Add driver support for Graphics clock controller for SC7180 and also
   update device tree bindings for the various clocks supported in the
   clock controller.

 * Add driver support for Video clock controller for SC7180 and also
   update device tree bindings for the various clocks supported in the
   clock controller.

Taniya Das (6):
  dt-bindings: clock: Add YAML schemas for the QCOM GPUCC clock bindings
  dt-bindings: clock: Introduce QCOM Graphics clock bindings
  clk: qcom: Add graphics clock controller driver for SC7180
  dt-bindings: clock: Add YAML schemas for the QCOM VIDEOCC clock
    bindings
  dt-bindings: clock: Introduce SC7180 QCOM Video clock bindings
  clk: qcom: Add video clock controller driver for SC7180

 .../devicetree/bindings/clock/qcom,gpucc.txt       |  24 --
 .../devicetree/bindings/clock/qcom,gpucc.yaml      |  72 ++++++
 .../devicetree/bindings/clock/qcom,videocc.txt     |  18 --
 .../devicetree/bindings/clock/qcom,videocc.yaml    |  62 +++++
 drivers/clk/qcom/Kconfig                           |  16 ++
 drivers/clk/qcom/Makefile                          |   2 +
 drivers/clk/qcom/gpucc-sc7180.c                    | 266 +++++++++++++++++++++
 drivers/clk/qcom/videocc-sc7180.c                  | 259 ++++++++++++++++++++
 include/dt-bindings/clock/qcom,gpucc-sc7180.h      |  21 ++
 include/dt-bindings/clock/qcom,videocc-sc7180.h    |  23 ++
 10 files changed, 721 insertions(+), 42 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/qcom,gpucc.txt
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gpucc.yaml
 delete mode 100644 Documentation/devicetree/bindings/clock/qcom,videocc.txt
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,videocc.yaml
 create mode 100644 drivers/clk/qcom/gpucc-sc7180.c
 create mode 100644 drivers/clk/qcom/videocc-sc7180.c
 create mode 100644 include/dt-bindings/clock/qcom,gpucc-sc7180.h
 create mode 100644 include/dt-bindings/clock/qcom,videocc-sc7180.h

--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.
