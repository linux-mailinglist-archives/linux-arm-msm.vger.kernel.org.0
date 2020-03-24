Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C5312191539
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2020 16:46:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727426AbgCXPp3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Mar 2020 11:45:29 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:11144 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727389AbgCXPp3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Mar 2020 11:45:29 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1585064728; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=v9dIb51/ZCmNlwPIwP3pchy18wJ6E/8T6dJA5ppS5pE=; b=XUwN+UDaw2R94v5YKNdFGus1MlJVfN71toc6baLdjfsSLKi6tcweAYRmT7/A1299x9C67/LH
 KCJX1GaCGRVfdURt0PxpkxJVjSgAR66HWyoN7+Ere73aHzL+VAcNwAEHcHrmxEjGuY0xet6y
 jm6+bNZ7YzwGeOfaNSdNKJr4dQo=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e7a2b09.7feefbb70f10-smtp-out-n04;
 Tue, 24 Mar 2020 15:45:13 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 6B241C433BA; Tue, 24 Mar 2020 15:45:13 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jprakash-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jprakash)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 881B0C433CB;
        Tue, 24 Mar 2020 15:45:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 881B0C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jprakash@codeaurora.org
From:   Jishnu Prakash <jprakash@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mka@chromium.org, linus.walleij@linaro.org, sboyd@codeaurora.org,
        Jonathan.Cameron@huawei.com, smohanad@codeaurora.org,
        kgunda@codeaurora.org, aghayal@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org, linux-arm-msm-owner@vger.kernel.org,
        Jishnu Prakash <jprakash@codeaurora.org>
Subject: [PATCH 0/3] iio: adc: Add support for QCOM SPMI PMIC7 ADC
Date:   Tue, 24 Mar 2020 21:14:07 +0530
Message-Id: <1585064650-16235-1-git-send-email-jprakash@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The first patch converts the ADC DT bindings from .txt to .yaml format.

The second patch updates the documentation, for PMIC7 ADC. The main
difference between PMIC5 and PMIC7 for ADC is that for PMIC7, SW requests to
ADCs (on any PMIC) need to go through the ADC on PMK8350, which communicates with
the ADCs on other PMICs through PBS. A SID register has been added for SW to specify
the PMIC with which it needs to communicate.

The third patch adds driver support for PMIC7 ADC. It also adds definitions for
PMIC7 ADC channels and virtual channel definitions per PMIC (made by combining ADC
channel number and PMIC SID), to be used by ADC clients for PMIC7.

Jishnu Prakash (3):
  iio: adc: Convert the QCOM SPMI ADC bindings to .yaml format
  iio: adc: Add PMIC7 ADC bindings
  iio: adc: Add support for PMIC7 ADC

 .../devicetree/bindings/iio/adc/qcom,spmi-vadc.txt | 173 --------------
 .../bindings/iio/adc/qcom,spmi-vadc.yaml           | 192 +++++++++++++++
 drivers/iio/adc/qcom-spmi-adc5.c                   | 239 ++++++++++++++++++-
 drivers/iio/adc/qcom-vadc-common.c                 | 260 +++++++++++++++++++++
 drivers/iio/adc/qcom-vadc-common.h                 |  14 ++
 include/dt-bindings/iio/qcom,spmi-adc7-pm8350.h    |  67 ++++++
 include/dt-bindings/iio/qcom,spmi-adc7-pm8350b.h   |  88 +++++++
 include/dt-bindings/iio/qcom,spmi-adc7-pmk8350.h   |  46 ++++
 include/dt-bindings/iio/qcom,spmi-adc7-pmr735a.h   |  28 +++
 include/dt-bindings/iio/qcom,spmi-adc7-pmr735b.h   |  28 +++
 include/dt-bindings/iio/qcom,spmi-vadc.h           |  78 ++++++-
 11 files changed, 1035 insertions(+), 178 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/iio/adc/qcom,spmi-vadc.txt
 create mode 100644 Documentation/devicetree/bindings/iio/adc/qcom,spmi-vadc.yaml
 create mode 100644 include/dt-bindings/iio/qcom,spmi-adc7-pm8350.h
 create mode 100644 include/dt-bindings/iio/qcom,spmi-adc7-pm8350b.h
 create mode 100644 include/dt-bindings/iio/qcom,spmi-adc7-pmk8350.h
 create mode 100644 include/dt-bindings/iio/qcom,spmi-adc7-pmr735a.h
 create mode 100644 include/dt-bindings/iio/qcom,spmi-adc7-pmr735b.h

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
