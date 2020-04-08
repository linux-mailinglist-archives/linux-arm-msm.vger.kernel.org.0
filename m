Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B03721A234C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2020 15:47:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728479AbgDHNrM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Apr 2020 09:47:12 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:28358 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728334AbgDHNrM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Apr 2020 09:47:12 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1586353631; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=L5xpox2lN8nnwfmr1duFKti9PxP0zsx/bxVltZmGuQI=; b=Q9yMEdkcB0+Uio0p4ACcoAy5azPmE6AWPFmyHYNBsI6+QNMiv/nq0oDzYOM6oXqUAIwVLGez
 oUK2f2Om3KsMeqOXcQHvx92kg2xTO3VnNxVDCeUZm/0+HouUbha2RdGXLv8E8LLvjDMEJ/wj
 2+rPCnI+E8blO37i2Wq74o9RyGc=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e8dd5df.7fec9b1727d8-smtp-out-n03;
 Wed, 08 Apr 2020 13:47:11 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id F079DC433F2; Wed,  8 Apr 2020 13:47:09 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-173.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id DA57FC433D2;
        Wed,  8 Apr 2020 13:47:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org DA57FC433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
From:   Rajendra Nayak <rnayak@codeaurora.org>
To:     viresh.kumar@linaro.org, sboyd@kernel.org,
        bjorn.andersson@linaro.org, agross@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH 00/21] DVFS for IO devices on sdm845 and sc7180
Date:   Wed,  8 Apr 2020 19:16:26 +0530
Message-Id: <1586353607-32222-1-git-send-email-rnayak@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

We have had support added in the OPP core for a while now to support
DVFS for IO devices, and this series uses that infrastructure to
add DVFS support for various IO devices in sdm845 and sc7180 SoCs.

Rajendra Nayak (21):
  opp: Manage empty OPP tables with clk handle
  tty: serial: qcom_geni_serial: Use OPP API to set clk/perf state
  spi: spi-geni-qcom: Use OPP API to set clk/perf state
  arm64: dts: sdm845: Add OPP table for all qup devices
  arm64: dts: sc7180: Add OPP table for all qup devices
  scsi: ufs: Add support to manage multiple power domains in
    ufshcd-pltfrm
  scsi: ufs: Add support for specifying OPP tables in DT
  arm64: dts: sdm845: Add ufs opps and power-domains
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

 arch/arm64/boot/dts/qcom/sc7180.dtsi           | 199 ++++++++++++++++-
 arch/arm64/boot/dts/qcom/sdm845.dtsi           | 287 ++++++++++++++++++++++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c  |   3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c        |   6 +
 drivers/gpu/drm/msm/dsi/dsi.h                  |   2 +
 drivers/gpu/drm/msm/dsi/dsi_cfg.c              |   4 +-
 drivers/gpu/drm/msm/dsi/dsi_host.c             |  48 +++++
 drivers/media/platform/qcom/venus/core.c       |  16 ++
 drivers/media/platform/qcom/venus/core.h       |   4 +
 drivers/media/platform/qcom/venus/pm_helpers.c |  37 +++-
 drivers/mmc/host/sdhci-msm.c                   |  20 +-
 drivers/opp/core.c                             |  14 ++
 drivers/scsi/ufs/ufshcd-pltfrm.c               |  58 ++++-
 drivers/scsi/ufs/ufshcd.c                      |  17 +-
 drivers/scsi/ufs/ufshcd.h                      |   3 +
 drivers/spi/spi-geni-qcom.c                    |  14 +-
 drivers/spi/spi-qcom-qspi.c                    |  10 +-
 drivers/tty/serial/qcom_geni_serial.c          |  20 +-
 include/linux/qcom-geni-se.h                   |   2 +
 19 files changed, 735 insertions(+), 29 deletions(-)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
