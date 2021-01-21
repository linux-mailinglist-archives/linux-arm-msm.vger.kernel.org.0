Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 172AD2FE1C4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Jan 2021 06:35:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726456AbhAUFfL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Jan 2021 00:35:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727067AbhAUFdx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Jan 2021 00:33:53 -0500
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECC86C061757
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Jan 2021 21:33:11 -0800 (PST)
Received: by mail-pj1-x1030.google.com with SMTP id lw17so4275804pjb.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Jan 2021 21:33:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PHlzH0Ourl1mu7oe7NxeEbG4XHfC6NVL5g1u9VF/oMA=;
        b=uZuc/rNvyqGSYV8PEbuyrvYpt1fd4IwmupPpl6az7+KBxHPx0bRKkBNejfZPA7TwQm
         pZu3lQ/SpNpE+oJcJl+nvNjW7aj+WY7j6iiBmjNYYB7c8k/ykrHwyR7JQrn2KiXoelxb
         GUdkydoQLBDkfNO5gFyC0UDOlTJbupc0ReshgbxrtW4WrkcnWCXozcdBW2t2Ilz8Px8E
         EO024M0CPeBx7hebVYzJiZ+njciNpZsfIrdsm7FCDpFls2QbQb0/KYCjm9A+IztIgbml
         XtkdQaxoqIpvEx7dlzILt+QHbvcLILb14yKzKNWMo3EcrPwPKK8ltUgT0WjSxneX8SU6
         EohA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PHlzH0Ourl1mu7oe7NxeEbG4XHfC6NVL5g1u9VF/oMA=;
        b=kjq6i6eL1WAU3B8iLcjH28gJ8QaOjqL/4h2mvA9ptCeVAEmRzlkMhAm5bozUamew+B
         KtC6lvqPL8VdYJL+kvEkzcjtUyFOBeCeMdEePFs6fSKT5OrGMeNV7mqN0wwK+36IhYMr
         t7qBaDtmGK49tXGjHwjkd4xX0deI8o665POdQ5K7cGegGvZEieUnlPS6UuwrchfK15T9
         GNs8thmKDQcHnBSihlgPVbJ+SLeH2JUgzekIyWK8FEHFxG+WDC1EvPtvghMso439X+ng
         cssXT42Zf6X6Zj/nukWVUFHjdA+BWP/3NNxTY1Od1zm5kCPB6L8P9S+6D+hUXKxvLRwZ
         v7XQ==
X-Gm-Message-State: AOAM530fZX42ob+mOx1/TfD3CBaOqPXYuw/LrQ9JqaK+6FR1nnNAho6e
        ECK84c0OAeDnMjOVZz4o+0hE
X-Google-Smtp-Source: ABdhPJyEXBsa5cIQ6433QxYClwHOsGn90ME+c0KidCIQJJlsNxIEjP1pX7vMvv7mmE9guQzppIqlPg==
X-Received: by 2002:a17:90a:5501:: with SMTP id b1mr9450580pji.7.1611207191416;
        Wed, 20 Jan 2021 21:33:11 -0800 (PST)
Received: from localhost.localdomain ([2409:4072:6182:23c4:4d5:e6d9:fc7e:c8e2])
        by smtp.gmail.com with ESMTPSA id o14sm4332850pgr.44.2021.01.20.21.33.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jan 2021 21:33:10 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     georgi.djakov@linaro.org, robh+dt@kernel.org
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        okukatla@codeaurora.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 0/2] Add interconnect driver for SDX55
Date:   Thu, 21 Jan 2021 11:02:52 +0530
Message-Id: <20210121053254.8355-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello Georgi,

This small series adds interconnect driver support for SDX55 platform for
scaling the bandwidth requirements over RPMh. The driver has been tested
on SDX55-MTP and gives below DDR metrics using mbw [1] tool:

Src port: SDX55_MASTER_AMPSS_M0
Dest port: SDX55_SLAVE_EBI_CH0

Command: mbw 100

With bandwidth 500000:
AVG     Method: MEMCPY  Elapsed: 0.59058        MiB: 100.00000  Copy: 169.324 MiB/s
With bandwidth 700000:
AVG     Method: MEMCPY  Elapsed: 0.29267        MiB: 100.00000  Copy: 341.678 MiB/s
With bandwidth 900000:
AVG     Method: MEMCPY  Elapsed: 0.19608        MiB: 100.00000  Copy: 510.005 MiB/s

The copy speed seems to be the same for all bandwidth less than 500000 and
greater than 900000.

Note: The CPUFreq governer needs to be set to something other than schedutil to
see the difference. Otherwise the speed seems to be the same for all bandwidth.

Thanks,
Mani

[1] https://github.com/raas/mbw

Changes in v2:

* Changed the copyright year to 2021, fixed Kconfig dependency and constified
  provider struct definitions.

Manivannan Sadhasivam (2):
  dt-bindings: interconnect: Add Qualcomm SDX55 DT bindings
  interconnect: qcom: Add SDX55 interconnect provider driver

 .../bindings/interconnect/qcom,rpmh.yaml      |   4 +
 drivers/interconnect/qcom/Kconfig             |   9 +
 drivers/interconnect/qcom/Makefile            |   2 +
 drivers/interconnect/qcom/sdx55.c             | 356 ++++++++++++++++++
 drivers/interconnect/qcom/sdx55.h             |  70 ++++
 include/dt-bindings/interconnect/qcom,sdx55.h |  76 ++++
 6 files changed, 517 insertions(+)
 create mode 100644 drivers/interconnect/qcom/sdx55.c
 create mode 100644 drivers/interconnect/qcom/sdx55.h
 create mode 100644 include/dt-bindings/interconnect/qcom,sdx55.h

-- 
2.25.1

