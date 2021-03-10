Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6747334388
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Mar 2021 17:48:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229467AbhCJQry (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Mar 2021 11:47:54 -0500
Received: from m42-2.mailgun.net ([69.72.42.2]:31943 "EHLO m42-2.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232481AbhCJQru (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Mar 2021 11:47:50 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1615394869; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=JRrwp4oBqAjuW5tFklXbo7k7FGdzsyr8UOEC/iA20c8=; b=jSdtLgIgz7K/SxglhGVML4sQo0APIy0xooD/+oDCkpG8F2kdywqJOcGR3S/GzGV5+6awKC1F
 vV5nZ9KiLr6iYg707m5Wh58vZphztdjrWt6clFM3ssJVwNcqezfR/sHmRco2+1obz95ejVEy
 2/ci2/B7SyY+uwAr+KllqPS839U=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 6048f8280c7cf0f56c7d987c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 10 Mar 2021 16:47:36
 GMT
Sender: schowdhu=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E500FC433CA; Wed, 10 Mar 2021 16:47:35 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-525.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: schowdhu)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3F7A2C433C6;
        Wed, 10 Mar 2021 16:47:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3F7A2C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=schowdhu@codeaurora.org
From:   Souradeep Chowdhury <schowdhu@codeaurora.org>
To:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        sibis@codeaurora.org, saiprakash.ranjan@codeaurora.org,
        Rajendra Nayak <rnayak@codeaurora.org>, vkoul@kernel.org,
        Souradeep Chowdhury <schowdhu@codeaurora.org>
Subject: [PATCH V1 0/6] Add driver support for Data Capture and Compare Engine(DCC) for SM8150
Date:   Wed, 10 Mar 2021 22:16:31 +0530
Message-Id: <cover.1615393454.git.schowdhu@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

DCC(Data Capture and Compare) is a DMA engine designed for debugging purposes. In case of a system
crash or manual software triggers by the user the DCC hardware stores the value at the register
addresses which can be used for debugging purposes. The DCC driver provides the user with sysfs
interface to configure the register addresses. The options that the DCC hardware provides include
reading from registers, writing to registers, first reading and then writing to registers and looping
through the values of the same register.

In certain cases a register write needs to be executed for accessing the rest of the registers, also
the user might want to record the changing values of a particular register with time for which he has
the option to use the loop feature. The options mentioned above are exposed to the user by sysfs files
once the driver is probed. The details and usage of this sysfs files are documented in
Documentation/ABI/testing/sysfs-driver-dcc. As an example if a user wants to configure to store 100 words
starting from address 0x80000050 he should give inputs as following to the sysfs config file:-

echo  0x80000050 100 > /sys/bus/platform/devices/.../config

Similarly if the user wants to write to a register using DCC hardware he should give following input to
config_write sysfs file:-
echo 0x80000000 0xFF > /sys/bus/platform/devices/10a2000.dcc/config_write
All this read and write occurs at crash time or if the user manually invokes a software trigger.

Souradeep Chowdhury (6):
  dt-bindings: Added the yaml bindings for DCC
  soc: qcom: dcc: Add driver support for Data Capture and Compare
    unit(DCC)
  soc: qcom: dcc: Add the sysfs variables to the Data Capture and
    Compare driver(DCC)
  DCC: Added the sysfs entries for DCC(Data Capture and Compare) driver
  MAINTAINERS: Add the entry for DCC(Data Capture and Compare) driver
    support
  arm64: dts: qcom: sm8150: Add Data Capture and Compare(DCC) support
    node

 Documentation/ABI/testing/sysfs-driver-dcc         |   74 +
 .../devicetree/bindings/arm/msm/qcom,dcc.yaml      |   49 +
 MAINTAINERS                                        |    8 +
 arch/arm64/boot/dts/qcom/sm8150.dtsi               |    7 +
 drivers/soc/qcom/Kconfig                           |    8 +
 drivers/soc/qcom/Makefile                          |    1 +
 drivers/soc/qcom/dcc.c                             | 1551 ++++++++++++++++++++
 7 files changed, 1698 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-dcc
 create mode 100644 Documentation/devicetree/bindings/arm/msm/qcom,dcc.yaml
 create mode 100644 drivers/soc/qcom/dcc.c

--
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

