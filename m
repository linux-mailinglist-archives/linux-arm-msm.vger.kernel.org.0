Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B3E42EF14A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Jan 2021 12:34:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726251AbhAHLd0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Jan 2021 06:33:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725884AbhAHLdZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Jan 2021 06:33:25 -0500
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95845C0612F5
        for <linux-arm-msm@vger.kernel.org>; Fri,  8 Jan 2021 03:32:45 -0800 (PST)
Received: by mail-pj1-x1029.google.com with SMTP id m5so5986550pjv.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Jan 2021 03:32:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UddTypvAFtNZtjITEfi5tdG7IhoeX/KuNTe9q3YD6hM=;
        b=YAfl6bCar0QV3SIZXRZCg4lmu0Xq7BxUyjCnUcq0nbmSsR7Y8EHUBLlpm7r7mMU0i8
         FH/c0MFjXuyOel6aPCzolB9DtUvPvq61OTxWxWYlcIC0jMUCbOgaDjyoj+jqkoiA4hFd
         KgjOS9My4XRQYXWGL43B0rgzCBZAzoWqmoHlUzPxBiNam+HtJELEuVB+2o2CYk95HnRr
         U8a6kvjDD0PqfVOTokd5bgZtiQeP7cFHVBc6nvmx4HCG3h9TE0beDZFCgHigWYA+dYoq
         RRU5tHi6tHsH/9Vt1R8EGwCvGFMM6+t8SSPLMT7QZQPOyX/l2sQ7sog7/HbM63e/jvqf
         K9xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UddTypvAFtNZtjITEfi5tdG7IhoeX/KuNTe9q3YD6hM=;
        b=t2nIegYLkMAfvGhzLQhxdg+6F3dBMpPToYX8vsjUOu05jlV2iBXGHVrVRctK8DhvBl
         pq6DNV/JFQsFQQhFq8FPlwXJ4ga9X9lefupGK+qpWY3x5OMS3kNiyMJoMuHoPaWnw3qM
         hwsRn4Tj172JbcSex9OR/hxVL+VKccXC+l51Bk4chFccy0Z2n1ubmkPScZ7jNq8MEVrs
         ONqHnYhGz0e7SDnJYgzex9f8JBOF/9eMLZ/LGwmhb4rXinw34YJN57NL6WQHvNP2DGLk
         3CSxDxweE+fkIRn+NxyvYig+lw0CYkTCONrgpMmR7xMQJ0HpQLMxR9HScqFvIoGuYIql
         fL/g==
X-Gm-Message-State: AOAM530M6r/vvj3B1LmfCWTJw5+r/OdfyhLrAxEjnusYtVJkOh9YJK5G
        5b5Qrffnb5OY/1+SzjPZDYnz
X-Google-Smtp-Source: ABdhPJyuNSv7+8Npk3LGdiSGXQ8UlfQrUlzx9drwt456SXy51NDgIhlxQG+ieSCSBNGJUsxYBdDhoQ==
X-Received: by 2002:a17:90a:e60d:: with SMTP id j13mr3378624pjy.52.1610105564971;
        Fri, 08 Jan 2021 03:32:44 -0800 (PST)
Received: from localhost.localdomain ([103.77.37.188])
        by smtp.gmail.com with ESMTPSA id i25sm9261573pgb.33.2021.01.08.03.32.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jan 2021 03:32:43 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        jassisinghbrar@gmail.com
Cc:     viresh.kumar@linaro.org, ulf.hansson@linaro.org,
        bjorn.andersson@linaro.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 0/5] Add APCS support for SDX55
Date:   Fri,  8 Jan 2021 17:02:28 +0530
Message-Id: <20210108113233.75418-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello,

This series adds APCS mailbox and clock support for SDX55. The APCS IP
in SDX55 provides IPC and clock functionalities. Hence, mailbox support
is added to the "qcom-apcs-ipc-mailbox" driver and a dedicated clock
driver "apcs-sdx55" is added.

Also, the clock to the APCS block is coming from 3 different sources:

1. Board XO
2. Fixed rate GPLL0
3. A7 PLL

First source is from crystal osc, second is from GCC and third one is a
separate clock source. Hence, a dedicated clk driver is added for the A7
PLL as well.

Apart from the mailbox support, another intention of this series is to add
the CPUFreq support to SDX55 platform. Since there is no dedicated hardware
IP in SDX55 to do CPUFreq duties, this platform makes use of the clock and
regulators directly via cpufreq-dt driver.

The trick here is attaching the power domain to cpudev. Usually the power
domains for the target device is attached in the bus driver or in the
dedicated device drivers. But in this case, there is no dedicated CPUFreq
driver nor a bus driver. After discussing with Viresh, I concluded that
A7 PLL driver might be the best place to do this!

But this decision is subject to discussion, hence added Ulf and Viresh to
this series.

Thanks,
Mani

Changes in v2:

* Modified the max_register value as per the SDX55 IPC offset in mailbox
  driver.

Manivannan Sadhasivam (5):
  dt-bindings: mailbox: Add binding for SDX55 APCS
  mailbox: qcom: Add support for SDX55 APCS IPC
  dt-bindings: clock: Add Qualcomm A7 PLL binding
  clk: qcom: Add A7 PLL support
  clk: qcom: Add SDX55 APCS clock controller support

 .../devicetree/bindings/clock/qcom,a7pll.yaml |  51 ++++++
 .../mailbox/qcom,apcs-kpss-global.yaml        |  59 +++++--
 drivers/clk/qcom/Kconfig                      |  17 ++
 drivers/clk/qcom/Makefile                     |   2 +
 drivers/clk/qcom/a7-pll.c                     | 100 ++++++++++++
 drivers/clk/qcom/apcs-sdx55.c                 | 149 ++++++++++++++++++
 drivers/mailbox/qcom-apcs-ipc-mailbox.c       |   7 +-
 7 files changed, 375 insertions(+), 10 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,a7pll.yaml
 create mode 100644 drivers/clk/qcom/a7-pll.c
 create mode 100644 drivers/clk/qcom/apcs-sdx55.c

-- 
2.25.1

