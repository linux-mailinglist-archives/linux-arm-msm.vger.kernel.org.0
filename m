Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95B7E425085
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Oct 2021 11:58:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240540AbhJGKAB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Oct 2021 06:00:01 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:38220 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234934AbhJGKAB (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Oct 2021 06:00:01 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1633600688; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=6hC+rPfJS1lHtqn1RaKYzz4YiMXdF5CwInQW6kXzIRA=; b=VpwOxgxu8huVgeWGnFZeWN4mO/LQExN4vyLKybBW1FQ2moo87wzTG31M5mmsjP2RkpkfxRCv
 ewC5HbnO7huq9OsyXne2aIkm4Gti+E+SGXJwD08K4HjRSTJmnjGVDJpRHCaBJHIUU+cQ6Mnd
 YLMd55wRL7SJI5GMEpE4I68FPWM=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 615ec4a08ea00a941f601198 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 07 Oct 2021 09:57:52
 GMT
Sender: mkshah=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id ACC85C43617; Thu,  7 Oct 2021 09:57:52 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from mkshah-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 124FBC4338F;
        Thu,  7 Oct 2021 09:57:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 124FBC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Maulik Shah <mkshah@codeaurora.org>
To:     swboyd@chromium.org, mka@chromium.org, evgreen@chromium.org,
        bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        agross@kernel.org, dianders@chromium.org, linux@roeck-us.net,
        rnayak@codeaurora.org, lsrao@codeaurora.org,
        Maulik Shah <mkshah@codeaurora.org>
Subject: [PATCH v11 0/5] Introduce SoC sleep stats driver
Date:   Thu,  7 Oct 2021 15:27:24 +0530
Message-Id: <1633600649-7164-1-git-send-email-mkshah@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Changes in v10:
- Address Bjorn's comments from v10
- Add a case for RPM based targets dynamic offset in driver
- Update commit messages to use qcom sleep stats instead of soc sleep stats
- Drop individual target dtsi changes for sc7180 and sc7280
- Add single change to enable sleep stats for RPMh based targets
- Add single change to enable sleep stats for RPM based targets

Changes in v10:
- Updated device node name to use memory instead of aop_msgram
- Remove Lina's email from maintainers 
- Rename driver to qcom_sleep_stats. Update makefile, Kconfig accordingly
- Address Bjorn's comments from v9

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
  dt-bindings: Introduce QCOM Sleep stats bindings
  soc: qcom: Add Sleep stats driver

Maulik Shah (3):
  arm64: defconfig: Enable Sleep stats driver
  arm64: dts: qcom: Enable RPMh Sleep stats
  arm64: dts: qcom: Enable RPM Sleep stats

 .../bindings/soc/qcom/qcom-sleep-stats.yaml        |  47 ++++
 arch/arm64/boot/dts/qcom/msm8996.dtsi              |   5 +
 arch/arm64/boot/dts/qcom/msm8998.dtsi              |   5 +
 arch/arm64/boot/dts/qcom/qcs404.dtsi               |   5 +
 arch/arm64/boot/dts/qcom/sc7180.dtsi               |   7 +-
 arch/arm64/boot/dts/qcom/sc7280.dtsi               |   7 +-
 arch/arm64/boot/dts/qcom/sdm630.dtsi               |   5 +
 arch/arm64/boot/dts/qcom/sm6125.dtsi               |   5 +
 arch/arm64/boot/dts/qcom/sm8150.dtsi               |   7 +-
 arch/arm64/boot/dts/qcom/sm8250.dtsi               |   7 +-
 arch/arm64/boot/dts/qcom/sm8350.dtsi               |   7 +-
 arch/arm64/configs/defconfig                       |   1 +
 drivers/soc/qcom/Kconfig                           |  10 +
 drivers/soc/qcom/Makefile                          |   1 +
 drivers/soc/qcom/qcom_sleep_stats.c                | 259 +++++++++++++++++++++
 15 files changed, 373 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom-sleep-stats.yaml
 create mode 100644 drivers/soc/qcom/qcom_sleep_stats.c

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

