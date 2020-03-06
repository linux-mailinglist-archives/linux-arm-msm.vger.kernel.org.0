Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1DCBE17B753
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2020 08:24:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726185AbgCFHYA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Mar 2020 02:24:00 -0500
Received: from mail27.static.mailgun.info ([104.130.122.27]:30412 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725855AbgCFHX7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Mar 2020 02:23:59 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1583479439; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=pNuHrGqCUbPfbsklbXCwMeTwekc6NKw2ZW7iJ5WEbXo=; b=caRAlL5hZQGrwOYyUF19UA2M9hpKEl2cHtj5vOt5w46KeHLXVs/FS4cHOd8zlinkNiD/+gWK
 oZoJd2ArwpWpeQqJFbdgu1sDlyk4DhOsgG1bBQXW7tYkXGYUu4W9ernlEFMVMsk8P4bIuSIm
 nwaV5sl/XN5bcZRgbungafqibUw=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e61fa7d.7fe2763b8998-smtp-out-n04;
 Fri, 06 Mar 2020 07:23:41 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 57317C43637; Fri,  6 Mar 2020 07:23:40 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mkshah-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 00450C433D2;
        Fri,  6 Mar 2020 07:23:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 00450C433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
From:   Maulik Shah <mkshah@codeaurora.org>
To:     swboyd@chromium.org, mka@chromium.org, evgreen@chromium.org,
        bjorn.andersson@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        agross@kernel.org, dianders@chromium.org, rnayak@codeaurora.org,
        ilina@codeaurora.org, lsrao@codeaurora.org,
        Maulik Shah <mkshah@codeaurora.org>
Subject: [PATCH v3 0/4] Introduce SoC sleep stats driver
Date:   Fri,  6 Mar 2020 12:53:28 +0530
Message-Id: <1583479412-18320-1-git-send-email-mkshah@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Changes in v3:
- Address stephen's comments from v2 in change 1 and 2.
- Address bjorn's comments from v2 in change 3 and 4.
- Add Rob and bjorn's Reviewed-by on YAML change.

Changes in v2:
- Convert Documentation to YAML.
- Address stephen's comments from v1.
- Use debugfs instead of sysfs.
- Add sc7180 dts changes for sleep stats
- Add defconfig changes to enable driver
- Include subsystem stats from [1] in this single stats driver.
- Address stephen's comments from [1]
- Update cover letter inline to mention [1]

Qualcomm Technologies, Inc. (QTI)'s chipsets support SoC level low power
modes. SoCs Always On Processor/Resource Power Manager produces statistics
of the SoC sleep modes involving lowering or powering down of the rails and
the oscillator clock.

Additionally multiple subsystems present on SoC like modem, spss, adsp,
cdsp maintains their low power mode statistics in shared memory (SMEM).

Statistics includes SoC sleep mode type, number of times LPM entered, time
of last entry, exit, and accumulated sleep duration in seconds.

This series adds a driver to read the stats and export to debugfs.

[1] https://lore.kernel.org/patchwork/patch/1149381/

Mahesh Sivasubramanian (2):
  dt-bindings: Introduce soc sleep stats bindings for Qualcomm SoCs
  soc: qcom: Add SoC sleep stats driver

Maulik Shah (2):
  arm64: dts: qcom: sc7180: Enable soc sleep stats
  arm64: defconfig: Enable SoC sleep stats driver for Qualcomm

 .../bindings/soc/qcom/soc-sleep-stats.yaml         |  47 ++++
 arch/arm64/boot/dts/qcom/sc7180.dtsi               |   5 +
 arch/arm64/configs/defconfig                       |   1 +
 drivers/soc/qcom/Kconfig                           |  10 +
 drivers/soc/qcom/Makefile                          |   1 +
 drivers/soc/qcom/soc_sleep_stats.c                 | 279 +++++++++++++++++++++
 6 files changed, 343 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/soc-sleep-stats.yaml
 create mode 100644 drivers/soc/qcom/soc_sleep_stats.c

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
