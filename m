Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D74EF1CA403
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2020 08:34:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726365AbgEHGeg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 May 2020 02:34:36 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:43030 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727051AbgEHGef (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 May 2020 02:34:35 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1588919674; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=MSkTBpyv6SDcq2wuoajThkNs/mXxqNppGp1Bv7EIaQM=; b=OrBw5lSMyREHPIwf6pkT7/SrEHjm+vKz0GdKdwoE/1zGq3TLSRla36WLK9NRtrBXHus9x0r4
 InWlNqVLjYAscNOOBulc0hvD8Bg+qb5RzAG1MI/z1hVrvht6Pu9vLThhODA0SQBC9or8DuGz
 b7Z2y9/0r0K/hPaoxTxRzw0pluE=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5eb4fd55.7f50568ea7a0-smtp-out-n05;
 Fri, 08 May 2020 06:33:57 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 055F6C432C2; Fri,  8 May 2020 06:33:56 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from akashast-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 976B2C433D2;
        Fri,  8 May 2020 06:33:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 976B2C433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=akashast@codeaurora.org
From:   Akash Asthana <akashast@codeaurora.org>
To:     gregkh@linuxfoundation.org, agross@kernel.org,
        bjorn.andersson@linaro.org, wsa@the-dreams.de, broonie@kernel.org,
        mark.rutland@arm.com, robh+dt@kernel.org
Cc:     linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, swboyd@chromium.org,
        mgautam@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, mka@chromium.org,
        dianders@chromium.org, evgreen@chromium.org,
        georgi.djakov@linaro.org, Akash Asthana <akashast@codeaurora.org>
Subject: [PATCH V5 0/7] Add interconnect support to QSPI and QUP drivers
Date:   Fri,  8 May 2020 12:03:32 +0530
Message-Id: <1588919619-21355-1-git-send-email-akashast@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

V5 depend on below patches. 
 - https://lore.kernel.org/patchwork/patch/1237642/ [Add helpers
   for enabling/disabling a path]
 - https://patchwork.kernel.org/patch/11491027/ [Add devm_of_icc_get()
   as exported API for users ]

dt-binding patch for QUP drivers.
 - https://patchwork.kernel.org/patch/11534149/ [Convert QUP bindings
        to YAML and add ICC, pin swap doc]

High level design:
 - QUP wrapper/common driver.
   Vote for QUP core on behalf of earlycon from probe.
   Remove BW vote during earlycon exit call

 - SERIAL driver.
   Vote only for CPU/CORE path because driver is in FIFO mode only
   Vote/unvote from qcom_geni_serial_pm func.
   Bump up the CPU vote from set_termios call based on real time need

 - I2C driver.
   Vote for CORE/CPU/DDR path
   Vote/unvote from runtime resume/suspend callback
   As bus speed for I2C is fixed from probe itself no need for bump up.

 - SPI QUP driver.
   Vote only for CPU/CORE path because driver is in FIFO mode only
   Vote/unvote from runtime resume/suspend callback
   Bump up CPU vote based on real time need per transfer.

 - QSPI driver.
   Vote only for CPU path
   Vote/unvote from runtime resume/suspend callback
   Bump up CPU vote based on real time need per transfer.

Changes in V2:
 - Add devm_of_icc_get() API interconnect core.
 - Add ICC support to common driver to fix earlyconsole crash.

Changes in V3:
 - Define common ICC APIs in geni-se driver and use it across geni based
   I2C,SPI and UART driver.

Changes in V4:
 - Add a patch to ICC core to scale peak requirement
   as twice of average if it is not mentioned explicilty.

Changes in V5:
 - As per Georgi's suggestion removed patch from ICC core for assuming
   peak_bw as twice of average when it's not mentioned, instead assume it
   equall to avg_bw and keep this assumption in ICC client itself.
 - As per Matthias suggestion use enum for GENI QUP ICC paths.

Akash Asthana (7):
  soc: qcom: geni: Support for ICC voting
  soc: qcom-geni-se: Add interconnect support to fix earlycon crash
  i2c: i2c-qcom-geni: Add interconnect support
  spi: spi-geni-qcom: Add interconnect support
  tty: serial: qcom_geni_serial: Add interconnect support
  spi: spi-qcom-qspi: Add interconnect support
  arm64: dts: sc7180: Add interconnect for QUP and QSPI

 arch/arm64/boot/dts/qcom/sc7180.dtsi  | 127 ++++++++++++++++++++++++++++
 drivers/i2c/busses/i2c-qcom-geni.c    |  29 ++++++-
 drivers/soc/qcom/qcom-geni-se.c       | 155 ++++++++++++++++++++++++++++++++++
 drivers/spi/spi-geni-qcom.c           |  32 ++++++-
 drivers/spi/spi-qcom-qspi.c           |  59 ++++++++++++-
 drivers/tty/serial/qcom_geni_serial.c |  38 ++++++++-
 include/linux/qcom-geni-se.h          |  44 ++++++++++
 7 files changed, 478 insertions(+), 6 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project
