Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEDF4204B1F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2020 09:30:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731227AbgFWHag (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Jun 2020 03:30:36 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:51582 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730830AbgFWHag (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Jun 2020 03:30:36 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1592897435; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=2Yi/lYn/6WQNSFr0HSiO3C0rw+Cv8ZwJDqYtP0XLOP8=; b=u4nnog5i7key5QKsciFugSIq0sdFONPexpdQLlkj7kKo1XFcORWZ5pf31L4G0oA+mvWVRuNk
 U9WMyNMxO98/fol2iGcLcd1N4zLLQbMPMk3o+u7DH8jZc0UjWGq4lUtgNMYYIsGX6edCPNnO
 OH56dmtz1vE/m+qQZqVP4aZz4qM=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n14.prod.us-west-2.postgun.com with SMTP id
 5ef1af87fe1db4db89b9bf81 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 23 Jun 2020 07:30:15
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C3651C43395; Tue, 23 Jun 2020 07:30:15 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jprakash-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jprakash)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 48A96C433C8;
        Tue, 23 Jun 2020 07:30:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 48A96C433C8
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
Subject: [PATCH V7 0/7] iio: adc: Add support for QCOM SPMI PMIC7 ADC
Date:   Tue, 23 Jun 2020 12:59:52 +0530
Message-Id: <1592897399-24089-1-git-send-email-jprakash@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The following changes are made in V7:

In the seventh patch, the function pointer is defined using typedef
instead of struct, to address a review comment.

There are no changes in any other patches, from V6.

Jishnu Prakash (7):
  iio: adc: Convert the QCOM SPMI ADC bindings to .yaml format
  iio: adc: Add PMIC7 ADC bindings
  iio: adc: Add info property under adc_data
  iio: adc: Add support for PMIC7 ADC
  iio: adc: Update return value checks
  iio: adc: Update debug prints
  iio: adc: Combine read functions for PMIC5 and PMIC7

 .../devicetree/bindings/iio/adc/qcom,spmi-vadc.txt | 173 -------------
 .../bindings/iio/adc/qcom,spmi-vadc.yaml           | 278 +++++++++++++++++++++
 drivers/iio/adc/qcom-spmi-adc5.c                   | 242 ++++++++++++++++--
 drivers/iio/adc/qcom-vadc-common.c                 | 262 +++++++++++++++++++
 drivers/iio/adc/qcom-vadc-common.h                 |  15 ++
 include/dt-bindings/iio/qcom,spmi-adc7-pm8350.h    |  67 +++++
 include/dt-bindings/iio/qcom,spmi-adc7-pm8350b.h   |  88 +++++++
 include/dt-bindings/iio/qcom,spmi-adc7-pmk8350.h   |  46 ++++
 include/dt-bindings/iio/qcom,spmi-adc7-pmr735a.h   |  28 +++
 include/dt-bindings/iio/qcom,spmi-adc7-pmr735b.h   |  28 +++
 include/dt-bindings/iio/qcom,spmi-vadc.h           |  78 +++++-
 11 files changed, 1109 insertions(+), 196 deletions(-)
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

