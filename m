Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8188230F4DD
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Feb 2021 15:24:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236710AbhBDOYH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Feb 2021 09:24:07 -0500
Received: from so15.mailgun.net ([198.61.254.15]:37068 "EHLO so15.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236704AbhBDOXf (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Feb 2021 09:23:35 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1612448584; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=7wJpQUhUKdisJi/nBL0j602/BJmGi54/LgyG/xEEfh8=; b=nphfgAWquaLUtlb4LDeL6JVFsOrYw+B5nDCJvt1IOUgLkxGFxxe9d6AQpM0BWEbdkket/GWF
 caAWl0lnlrFhU83b6OkMq4MY5TlabQ4CxQo/MlrmqFvL7/QJRLGo15yPUS2cKBL/YVd99Nfp
 AK/cndVW01WA2XILaSWJU/OqFFI=
X-Mailgun-Sending-Ip: 198.61.254.15
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 601c03168e43a988b7d9acad (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 04 Feb 2021 14:22:14
 GMT
Sender: mkshah=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 76E11C43466; Thu,  4 Feb 2021 14:22:14 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from mkshah-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C163FC433C6;
        Thu,  4 Feb 2021 14:22:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C163FC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=mkshah@codeaurora.org
From:   Maulik Shah <mkshah@codeaurora.org>
To:     swboyd@chromium.org, mka@chromium.org, evgreen@chromium.org,
        bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        agross@kernel.org, dianders@chromium.org, linux@roeck-us.net,
        rnayak@codeaurora.org, ilina@codeaurora.org, lsrao@codeaurora.org,
        Maulik Shah <mkshah@codeaurora.org>
Subject: [PATCH v6 0/4] Introduce SoC sleep stats driver
Date:   Thu,  4 Feb 2021 19:51:44 +0530
Message-Id: <1612448508-9179-1-git-send-email-mkshah@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

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

Maulik Shah (2):
  arm64: dts: qcom: sc7180: Enable SoC sleep stats
  arm64: defconfig: Enable SoC sleep stats driver

 .../bindings/soc/qcom/soc-sleep-stats.yaml         |  46 ++++
 arch/arm64/boot/dts/qcom/sc7180.dtsi               |   7 +-
 arch/arm64/configs/defconfig                       |   1 +
 drivers/soc/qcom/Kconfig                           |  10 +
 drivers/soc/qcom/Makefile                          |   1 +
 drivers/soc/qcom/soc_sleep_stats.c                 | 258 +++++++++++++++++++++
 6 files changed, 322 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/soc-sleep-stats.yaml
 create mode 100644 drivers/soc/qcom/soc_sleep_stats.c

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

