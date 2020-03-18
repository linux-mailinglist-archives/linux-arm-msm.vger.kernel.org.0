Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E92D21894E5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2020 05:29:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726586AbgCRE3o (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Mar 2020 00:29:44 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:45333 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726250AbgCRE3o (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Mar 2020 00:29:44 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1584505783; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=FIu1T3HMTZXt9ODBDrrZB2SocHW6vdKWod8Vtd9936o=; b=ayIBDgSA9vNxx3+ISH2/6LQhdWqwacz1xzoKN1D2rScFCqbVCJ8B5M3NZA1EEYbpqx+3lCwO
 UWqtOfKizmpW0pQol5VcHKjPTiJeFKGNtTIL+/jTguOKkdLKZgqXhTmijUqvZQb2J3QXcTHT
 IwWgY9kgu3L8xMsfUOF0oLiTfbA=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e71a3b6.7fc5722ff810-smtp-out-n01;
 Wed, 18 Mar 2020 04:29:42 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 00DF1C432C2; Wed, 18 Mar 2020 04:29:41 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mkshah-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B27BBC433CB;
        Wed, 18 Mar 2020 04:29:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B27BBC433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
From:   Maulik Shah <mkshah@codeaurora.org>
To:     swboyd@chromium.org, mka@chromium.org, evgreen@chromium.org,
        bjorn.andersson@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        agross@kernel.org, dianders@chromium.org, rnayak@codeaurora.org,
        ilina@codeaurora.org, lsrao@codeaurora.org,
        Maulik Shah <mkshah@codeaurora.org>
Subject: [PATCH v5 0/4] Introduce SoC sleep stats driver
Date:   Wed, 18 Mar 2020 09:59:14 +0530
Message-Id: <1584505758-21037-1-git-send-email-mkshah@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

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
 drivers/soc/qcom/Kconfig                           |   9 +
 drivers/soc/qcom/Makefile                          |   1 +
 drivers/soc/qcom/soc_sleep_stats.c                 | 244 +++++++++++++++++++++
 6 files changed, 307 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/soc-sleep-stats.yaml
 create mode 100644 drivers/soc/qcom/soc_sleep_stats.c

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
