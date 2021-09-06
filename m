Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD0594015F2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Sep 2021 07:30:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239290AbhIFFaF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Sep 2021 01:30:05 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:10009 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239202AbhIFF3t (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Sep 2021 01:29:49 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1630906125; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=k/a18ZoONqVOFEAG/rgi7O88wIXQQL+eQLTocQIvD0U=; b=msL6Em8CIXdMBFxbOkD1yir+gjDhjuyqAylhbkJdSLUYqKy4EdPvzTNhgmVniqC4IPKZYjjh
 Y8VHn6BjT1J3QyxM6oVIHT679vIMgRADLdsxz2pUkbklR/cnUhWl81cUzNOWe2iP4A17INXM
 lKm3a1Da9uEWS2fmuFKxrL8vXxw=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 6135a6f31567234b8c02127c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 06 Sep 2021 05:28:19
 GMT
Sender: mkshah=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 64A19C43617; Mon,  6 Sep 2021 05:28:18 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from mkshah-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7E6FAC4338F;
        Mon,  6 Sep 2021 05:28:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 7E6FAC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Maulik Shah <mkshah@codeaurora.org>
To:     swboyd@chromium.org, mka@chromium.org, evgreen@chromium.org,
        bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        agross@kernel.org, dianders@chromium.org, linux@roeck-us.net,
        rnayak@codeaurora.org, lsrao@codeaurora.org,
        Maulik Shah <mkshah@codeaurora.org>
Subject: [PATCH v9 0/5] Introduce SoC sleep stats driver
Date:   Mon,  6 Sep 2021 10:57:58 +0530
Message-Id: <1630906083-32194-1-git-send-email-mkshah@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Changes in v9:
- Remove soft dependency on smem module
- Return -EIO to userspace in case of error
- Make struct sleep_stats *stat a const pointer
- Remove the driver from soc_sleep_stats_driver name
- Remove offset address and directly mention the msgram address in dtsi
- Use devm_platform_get_and_ioremap_resource() to ioremap dtsi address
- Update device node name to mention aop_msgram instead rpmh-sleep-stats
- Update dtsi and documentation accordingly but retain the reviews

Changes in v8:
- Addressed bjorn's comments in driver from v7
- Update aoss_qmp device node reg size for sc7280

Changes in v7:
- Fix example in bindings documentation as per #address/size-cells = <1>.
- Add comment in driver from where 'ddr' subsystems name is read.
- Update comment in driver to s/beside/besides and others from v6.
- Rename debugfs_create_entries() from v6.
- Drop use of memcpy_fromio() to find the name.
- Use sizeof(*prv_data) in devm_kzalloc().
- Add change to define readq() if its not yet defined for compile support.
- Add wpss subsystem in the list of subsystems.
- Add module soft dependency on smem module.
- Add new change to add device node for sc7280.

Changes in v6:
- Address stephen's comments from v5 which includes below
- Pad 0 in documentation example to make address 8 digit
- define macro to calculate offset in driver
- Add appended_stats_avail to prv_data instead of using entire stats_config
- make array subsystems[] as const
- Add comment for SSR case
- Use memcpy_fromio() and devm_kcalloc() during probe
- Change file permission mode from 444 to 400 

- Address guenter's comments to add depends on QCOM_SMEM

- Add adsp_island and cdsp_island subsystems
- Use strim() to remove whitespace in stat name

Changes in v5:
- Remove underscore from node name in Documentation and DTSI change
- Remove global config from driver change

Changes in v4:
- Address bjorn's comments from v3 on change 2.
- Add bjorn's Reviewed-by on change 3 and 4.

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
  dt-bindings: Introduce SoC sleep stats bindings
  soc: qcom: Add SoC sleep stats driver

Maulik Shah (3):
  arm64: dts: qcom: sc7180: Enable SoC sleep stats
  arm64: defconfig: Enable SoC sleep stats driver
  arm64: dts: qcom: sc7280: Enable SoC sleep stats

 .../bindings/soc/qcom/soc-sleep-stats.yaml         |  48 ++++
 arch/arm64/boot/dts/qcom/sc7180.dtsi               |   7 +-
 arch/arm64/boot/dts/qcom/sc7280.dtsi               |   7 +-
 arch/arm64/configs/defconfig                       |   1 +
 drivers/soc/qcom/Kconfig                           |  10 +
 drivers/soc/qcom/Makefile                          |   1 +
 drivers/soc/qcom/soc_sleep_stats.c                 | 241 +++++++++++++++++++++
 7 files changed, 313 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/soc-sleep-stats.yaml
 create mode 100644 drivers/soc/qcom/soc_sleep_stats.c

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

