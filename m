Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 837033E8190
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Aug 2021 20:01:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237152AbhHJSAU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Aug 2021 14:00:20 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:49415 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234829AbhHJR4H (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Aug 2021 13:56:07 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1628618145; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=ThLxtpQqhdsL+CLD5jVyeXmDYchU5hAG9rZ/ctQ0Kx8=; b=ZhRHgPP+bRW6MvBmPFeaHn4EFqLNLYERuOu14YCcMg2UUBw2XCTHUSGsTyxcjUOdVrRCen1Q
 xQLNBUczxlTdMpumjqgOB6yRqWaxdx3xjp5IfLLnLsvj4A3lFISlfbjJdSYVxyQ815v/uB7Q
 SevmpwHl3DhzhkU1cr2lJgdrpsM=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 6112bd91b14e7e2ecb93a76f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 10 Aug 2021 17:55:29
 GMT
Sender: schowdhu=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D889CC2E869; Tue, 10 Aug 2021 17:55:28 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-525.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: schowdhu)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5A122C2E869;
        Tue, 10 Aug 2021 17:55:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5A122C2E869
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=schowdhu@codeaurora.org
From:   Souradeep Chowdhury <schowdhu@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>, vkoul@kernel.org,
        Souradeep Chowdhury <schowdhu@codeaurora.org>
Subject: [PATCH V6 0/7] Add driver support for Data Capture and Compare Engine(DCC) for SM8150,SC7280,SC7180,SDM845
Date:   Tue, 10 Aug 2021 23:24:36 +0530
Message-Id: <cover.1628617260.git.schowdhu@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

DCC(Data Capture and Compare) is a DMA engine designed for debugging purposes.In case of a system
crash or manual software triggers by the user the DCC hardware stores the value at the register
addresses which can be used for debugging purposes.The DCC driver provides the user with sysfs
interface to configure the register addresses.The options that the DCC hardware provides include
reading from registers,writing to registers,first reading and then writing to registers and looping
through the values of the same register.

In certain cases a register write needs to be executed for accessing the rest of the registers,
also the user might want to record the changing values of a register with time for which he has the
option to use the loop feature.

The options mentioned above are exposed to the user by sysfs files once the driver is probed.The
details and usage of this sysfs files are documented in Documentation/ABI/testing/sysfs-driver-dcc.

As an example let us consider a couple of debug scenarios where DCC has been proved to be effective
for debugging purposes:-

i)TimeStamp Related Issue

On SC7180, there was a coresight timestamp issue where it would occasionally be all 0 instead of proper
timestamp values.

Proper timestamp:
Idx:3373; ID:10; I_TIMESTAMP : Timestamp.; Updated val = 0x13004d8f5b7aa; CC=0x9e

Zero timestamp:
Idx:3387; ID:10; I_TIMESTAMP : Timestamp.; Updated val = 0x0; CC=0xa2

Now this is a non-fatal issue and doesn't need a system reset, but still needs
to be rootcaused and fixed for those who do care about coresight etm traces.
Since this is a timestamp issue, we would be looking for any timestamp related
clocks and such.

o we get all the clk register details from IP documentation and configure it
via DCC config syfs node. Before that we set the current linked list.

/* Set the current linked list */
echo 3 > /sys/bus/platform/devices/10a2000.dcc/curr_list

/* Program the linked list with the addresses */
echo 0x10c004 > /sys/bus/platform/devices/10a2000.dcc/config
echo 0x10c008 > /sys/bus/platform/devices/10a2000.dcc/config
echo 0x10c00c > /sys/bus/platform/devices/10a2000.dcc/config
echo 0x10c010 > /sys/bus/platform/devices/10a2000.dcc/config
..... and so on for other timestamp related clk registers

/* Other way of specifying is in "addr len" pair, in below case it
specifies to capture 4 words starting 0x10C004 */

echo 0x10C004 4 > /sys/bus/platform/devices/10a2000.dcc/config

/* Enable DCC */
echo 1 > /sys/bus/platform/devices/10a2000.dcc/enable

/* Run the timestamp test for working case */

/* Send SW trigger */
echo 1 > /sys/bus/platform/devices/10a2000.dcc/trigger

/* Read SRAM */
cat /dev/dcc_sram > dcc_sram1.bin

/* Run the timestamp test for non-working case */

/* Send SW trigger */
echo 1 > /sys/bus/platform/devices/10a2000.dcc/trigger

/* Read SRAM */
cat /dev/dcc_sram > dcc_sram2.bin

Get the parser from [1] and checkout the latest branch.

/* Parse the SRAM bin */
python dcc_parser.py -s dcc_sram1.bin --v2 -o output/
python dcc_parser.py -s dcc_sram2.bin --v2 -o output/

Sample parsed output of dcc_sram1.bin:

<hwioDump version="1">
        <timestamp>03/14/21</timestamp>
            <generator>Linux DCC Parser</generator>
                <chip name="None" version="None">
                <register address="0x0010c004" value="0x80000000" />
                <register address="0x0010c008" value="0x00000008" />
                <register address="0x0010c00c" value="0x80004220" />
                <register address="0x0010c010" value="0x80000000" />
            </chip>
    <next_ll_offset>next_ll_offset : 0x1c </next_ll_offset>
</hwioDump>

ii)NOC register errors

A particular class of registers called NOC which are functional registers was reporting
errors while logging the values.To trace these errors the DCC has been used effectively.
The steps followed were similar to the ones mentioned above.
In addition to NOC registers a few other dependent registers were configured in DCC to
monitor it's values during a crash. A look at the dependent register values revealed that
the crash was happening due to a secured access to one of these dependent registers.
All these debugging activity and finding the root cause was achieved using DCC.

DCC parser is available at the following open source location

https://source.codeaurora.org/quic/la/platform/vendor/qcom-opensource/tools/tree/dcc_parser

Changes in v6:

*Added support in the dcc driver to handle multiple Qualcomm SoCs including SC7180,SC7280,SDM845 
 along with existing SM8150.
 
*Added the support node in the respective device tree files for SC7180,SC7280,SDM845.

Souradeep Chowdhury (7):
  dt-bindings: Added the yaml bindings for DCC
  soc: qcom: dcc:Add driver support for Data Capture and Compare
    unit(DCC)
  MAINTAINERS: Add the entry for DCC(Data Capture and Compare) driver
    support
  arm64: dts: qcom: sm8150: Add Data Capture and Compare(DCC) support
    node
  arm64: dts: qcom: sc7280: Add Data Capture and Compare(DCC) support
    node
  arm64: dts: qcom: sc7180: Add Data Capture and Compare(DCC) support
    node
  arm64: dts: qcom: sdm845: Add Data Capture and Compare(DCC) support
    node

 Documentation/ABI/testing/sysfs-driver-dcc         |  114 ++
 .../devicetree/bindings/arm/msm/qcom,dcc.yaml      |   43 +
 MAINTAINERS                                        |    8 +
 arch/arm64/boot/dts/qcom/sc7180.dtsi               |    6 +
 arch/arm64/boot/dts/qcom/sc7280.dtsi               |    6 +
 arch/arm64/boot/dts/qcom/sdm845.dtsi               |    6 +
 arch/arm64/boot/dts/qcom/sm8150.dtsi               |    6 +
 drivers/soc/qcom/Kconfig                           |    8 +
 drivers/soc/qcom/Makefile                          |    1 +
 drivers/soc/qcom/dcc.c                             | 1549 ++++++++++++++++++++
 10 files changed, 1747 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-dcc
 create mode 100644 Documentation/devicetree/bindings/arm/msm/qcom,dcc.yaml
 create mode 100644 drivers/soc/qcom/dcc.c

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

