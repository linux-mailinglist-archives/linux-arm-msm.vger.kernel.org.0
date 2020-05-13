Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D69151D0BE8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2020 11:22:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727924AbgEMJWg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 May 2020 05:22:36 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:54487 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726891AbgEMJWg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 May 2020 05:22:36 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1589361755; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=KL8q0qHaN0LMU/5PVv/5GqlNmJerHkWI+Gi3mhaXNzk=; b=sHGl2rGXLJLRVDBnMpnXJK9KGjUmK2Rubizir9rvoe9StfFk29tANaYfH94IB15xvO6tn8BM
 qYW24ZSZCmeqfXIEvshr01Dvm9tHxE8U/znvyl0LzbTuKZpnNOrJxjeLMRhFRCKFuwpACT4N
 JKuP+aQcaX3Fh1QsCd9wLDXVUCs=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ebbbc5b.7efc2372afb8-smtp-out-n04;
 Wed, 13 May 2020 09:22:35 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 4CB84C432C2; Wed, 13 May 2020 09:22:34 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jprakash-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jprakash)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 33B32C433D2;
        Wed, 13 May 2020 09:22:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 33B32C433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jprakash@codeaurora.org
From:   Jishnu Prakash <jprakash@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mka@chromium.org, linus.walleij@linaro.org,
        Jonathan.Cameron@huawei.com, andy.shevchenko@gmail.com,
        amit.kucheria@verdurent.com, smohanad@codeaurora.org,
        kgunda@codeaurora.org, aghayal@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org, linux-arm-msm-owner@vger.kernel.org,
        Jishnu Prakash <jprakash@codeaurora.org>
Subject: [PATCH V4 0/5] iio: adc: Add support for QCOM SPMI PMIC7 ADC
Date:   Wed, 13 May 2020 14:52:11 +0530
Message-Id: <1589361736-816-1-git-send-email-jprakash@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The following changes are made in V4:

Made some recommended minor changes in the third patch. Removed
the info member from adc5_data, and adc exit function, to be
added back in fifth patch.

Added a fifth patch to clean up code common to PMIC5 and PMIC7 ADC.

Jishnu Prakash (5):
  iio: adc: Convert the QCOM SPMI ADC bindings to .yaml format
  iio: adc: Add PMIC7 ADC bindings
  iio: adc: Add support for PMIC7 ADC
  iio: adc: Update error checks and debug prints
  iio: adc: Clean up ADC code common to PMIC5 and PMIC7

 .../devicetree/bindings/iio/adc/qcom,spmi-vadc.txt | 173 -------------
 .../bindings/iio/adc/qcom,spmi-vadc.yaml           | 278 +++++++++++++++++++++
 drivers/iio/adc/qcom-spmi-adc5.c                   | 266 ++++++++++++++++++--
 drivers/iio/adc/qcom-vadc-common.c                 | 260 +++++++++++++++++++
 drivers/iio/adc/qcom-vadc-common.h                 |  15 ++
 include/dt-bindings/iio/qcom,spmi-adc7-pm8350.h    |  67 +++++
 include/dt-bindings/iio/qcom,spmi-adc7-pm8350b.h   |  88 +++++++
 include/dt-bindings/iio/qcom,spmi-adc7-pmk8350.h   |  46 ++++
 include/dt-bindings/iio/qcom,spmi-adc7-pmr735a.h   |  28 +++
 include/dt-bindings/iio/qcom,spmi-adc7-pmr735b.h   |  28 +++
 include/dt-bindings/iio/qcom,spmi-vadc.h           |  78 +++++-
 11 files changed, 1134 insertions(+), 193 deletions(-)
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
