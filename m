Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 749C11A9848
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2020 11:19:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2895260AbgDOJSt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Apr 2020 05:18:49 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:32896 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2895256AbgDOJSs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Apr 2020 05:18:48 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1586942327; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=pWIsL9+BX5RenGIZyGa2avU6QthIkCiMCu6wFKZKjCw=; b=gG4jrSdW7UuRqIxnNwN1opI37Zx/BPlJ/tLunjJzZs0O0J+RxHE8JHvfTw707xXPEFoiokhX
 cAb6PSachbGPIuwAJyvNvwD4Bo/UbahW41KPMsYK3V6rE3B5qQnD62pGW26bTW7W/Pq7d4DS
 2WRkeSdg3q71CbT/mEcieExCXU0=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e96d16e.7f3975753688-smtp-out-n01;
 Wed, 15 Apr 2020 09:18:38 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 0F348C44788; Wed, 15 Apr 2020 09:18:37 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jprakash-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jprakash)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A9194C433CB;
        Wed, 15 Apr 2020 09:18:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A9194C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jprakash@codeaurora.org
From:   Jishnu Prakash <jprakash@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mka@chromium.org, linus.walleij@linaro.org,
        Jonathan.Cameron@huawei.com, smohanad@codeaurora.org,
        kgunda@codeaurora.org, aghayal@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org, linux-arm-msm-owner@vger.kernel.org,
        Jishnu Prakash <jprakash@codeaurora.org>
Subject: [PATCH V2 0/3] iio: adc: Add support for QCOM SPMI PMIC7 ADC
Date:   Wed, 15 Apr 2020 14:47:43 +0530
Message-Id: <1586942266-21480-1-git-send-email-jprakash@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The following changes are made in V2 for the three patches:

Added checks for the values of some ADC DT properties in the first patch,
wherever applicable. Also updated channel node regex and provided example.

Added the DT header files in the second patch, previously
added in third patch.

Removed the DT header files and made several recommended minor changes
in the third patch.

Jishnu Prakash (3):
  iio: adc: Convert the QCOM SPMI ADC bindings to .yaml format
  iio: adc: Add PMIC7 ADC bindings
  iio: adc: Add support for PMIC7 ADC

 .../devicetree/bindings/iio/adc/qcom,spmi-vadc.txt | 173 --------------
 .../bindings/iio/adc/qcom,spmi-vadc.yaml           | 214 +++++++++++++++++
 drivers/iio/adc/qcom-spmi-adc5.c                   | 257 ++++++++++++++++++--
 drivers/iio/adc/qcom-vadc-common.c                 | 258 +++++++++++++++++++++
 drivers/iio/adc/qcom-vadc-common.h                 |  15 ++
 include/dt-bindings/iio/qcom,spmi-adc7-pm8350.h    |  67 ++++++
 include/dt-bindings/iio/qcom,spmi-adc7-pm8350b.h   |  88 +++++++
 include/dt-bindings/iio/qcom,spmi-adc7-pmk8350.h   |  46 ++++
 include/dt-bindings/iio/qcom,spmi-adc7-pmr735a.h   |  28 +++
 include/dt-bindings/iio/qcom,spmi-adc7-pmr735b.h   |  28 +++
 include/dt-bindings/iio/qcom,spmi-vadc.h           |  78 ++++++-
 11 files changed, 1065 insertions(+), 187 deletions(-)
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
