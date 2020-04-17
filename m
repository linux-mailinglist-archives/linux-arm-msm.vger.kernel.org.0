Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4968F1ADF24
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2020 16:10:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730935AbgDQOFS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Apr 2020 10:05:18 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:57714 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730914AbgDQOFM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Apr 2020 10:05:12 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1587132312; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=jOasTJk8TBKsg8tFnzipV3s1efilzTH1QAd2yaXELsc=; b=EQdrGWtMC14QoZJ6xoALMErjccaHDNUCfN3blKRRrM3HFToyfcyVsLuHNQRc7qAe9UjYpGtI
 A/UzjeGshsdTmjChTOzaAAyNEgDcILoCA4prbiVhlD57/8YMWN+J/se5m15MBJDaM0mCckxQ
 sCnwu19jX/J5GyZI6n/Ot2OAgLc=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e99b795.7f3ea85c0c38-smtp-out-n04;
 Fri, 17 Apr 2020 14:05:09 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B2AEAC44799; Fri, 17 Apr 2020 14:05:08 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-173.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id EE401C4478C;
        Fri, 17 Apr 2020 14:05:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org EE401C4478C
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
From:   Rajendra Nayak <rnayak@codeaurora.org>
To:     viresh.kumar@linaro.org, sboyd@kernel.org,
        bjorn.andersson@linaro.org, agross@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mka@chromium.org,
        Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH v2 00/17] DVFS for IO devices on sdm845 and sc7180
Date:   Fri, 17 Apr 2020 19:34:22 +0530
Message-Id: <1587132279-27659-1-git-send-email-rnayak@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Changes in v2:
1. Added error handling for dev_pm_opp_set_clkname()
and dev_pm_opp_of_add_table()
2. Used dev_pm_opp_put_clkname() in the cleanup path
3. Dropped the OPP patch pulled in by Viresh [1]
4. Dropped the UFS patches since they had some major rework
needed because of changes that were merged in the merge window
and I don't have a UFS device currently to validate the changes.

We have had support added in the OPP core for a while now to support
DVFS for IO devices, and this series uses that infrastructure to
add DVFS support for various IO devices in sdm845 and sc7180 SoCs.

[1] https://lkml.org/lkml/2020/4/14/98 

Rajendra Nayak (17):
  tty: serial: qcom_geni_serial: Use OPP API to set clk/perf state
  spi: spi-geni-qcom: Use OPP API to set clk/perf state
  arm64: dts: sdm845: Add OPP table for all qup devices
  arm64: dts: sc7180: Add OPP table for all qup devices
  drm/msm/dpu: Use OPP API to set clk/perf state
  drm/msm: dsi: Use OPP API to set clk/perf state
  arm64: dts: sdm845: Add DSI and MDP OPP tables and power-domains
  arm64: dts: sc7180: Add DSI and MDP OPP tables and power-domains
  mmc: sdhci-msm: Use OPP API to set clk/perf state
  arm64: dts: sdm845: Add sdhc opps and power-domains
  arm64: dts: sc7180: Add sdhc opps and power-domains
  media: venus: core: Add support for opp tables/perf voting
  arm64: dts: sdm845: Add OPP tables and power-domains for venus
  arm64: dts: sc7180: Add OPP tables and power-domains for venus
  spi: spi-qcom-qspi: Use OPP API to set clk/perf state
  arm64: dts: sdm845: Add qspi opps and power-domains
  arm64: dts: sc7180: Add qspi opps and power-domains

 arch/arm64/boot/dts/qcom/sc7180.dtsi           | 199 +++++++++++++++++-
 arch/arm64/boot/dts/qcom/sdm845.dtsi           | 266 ++++++++++++++++++++++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c  |   3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c        |  20 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h        |   4 +
 drivers/gpu/drm/msm/dsi/dsi.h                  |   2 +
 drivers/gpu/drm/msm/dsi/dsi_cfg.c              |   4 +-
 drivers/gpu/drm/msm/dsi/dsi_host.c             |  53 +++++
 drivers/media/platform/qcom/venus/core.c       |  21 ++
 drivers/media/platform/qcom/venus/core.h       |   5 +
 drivers/media/platform/qcom/venus/pm_helpers.c |  37 +++-
 drivers/mmc/host/sdhci-msm.c                   |  34 +++-
 drivers/spi/spi-geni-qcom.c                    |  22 +-
 drivers/spi/spi-qcom-qspi.c                    |  24 ++-
 drivers/tty/serial/qcom_geni_serial.c          |  30 ++-
 include/linux/qcom-geni-se.h                   |   2 +
 16 files changed, 700 insertions(+), 26 deletions(-)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
