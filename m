Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38CE825B3ED
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Sep 2020 20:41:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728120AbgIBSkF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Sep 2020 14:40:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726426AbgIBSkD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Sep 2020 14:40:03 -0400
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com [IPv6:2607:f8b0:4864:20::842])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27246C061245
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Sep 2020 11:40:02 -0700 (PDT)
Received: by mail-qt1-x842.google.com with SMTP id t20so4378884qtr.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2020 11:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tBOlsZGCw+mt5EsIw2747Rf4oR5khHD7yhV5uOZZJhk=;
        b=SZk6h/IXcDfhZVTLKEv/8BckUYDoyZEmuvXW5KQ4cVlwRHO2r572YdoCrMpaEZIX0E
         Aji/bkgsr4uO+y+/OIn1gyUmCmesgu/iDqX/sT9eocKSj0LEODXh86YCqdpsNv6tS3kP
         eh2PZsYaWW+HzHOd/VETX512rpl5ekRBM/YDyzRlIWakOsiTCs3pPE/sYDbenHbgWRz4
         f3rciFEcMJQnqTpp5qFRj4chA0Su4yRt4MiorepPuA7jbUJom7rPDgiiDYC5SbDd79SP
         2Cd+m5YJeKvZx4KRfg2UDW7vLu/TclyyktuYeuLgziWehPVwclXNVoRX1I//OGBNOmeW
         5FfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tBOlsZGCw+mt5EsIw2747Rf4oR5khHD7yhV5uOZZJhk=;
        b=N7AEIegkHg5rbKhzxMU7gWHla5Sa47/SbJoPzOyTY9hQdKK//d4GZQYMyU0QpxhG7f
         dq/mKf1eWL0ZQX3NQzYtaGq8UQgsC0YlW73C6IRCW0ECvb+YPdouBec3LnBzv6PopR9T
         q9dJ0H2Z6vnja9yFTiJX9zQwyNqyDYBYdCLYWnobVk7e9VpeT0rTbS+DgwXKkSCKcDc3
         CXfsZlXI7Ik9WnV0n0QVHQcYOPVo5I1QKTd5DidWi6Axs0Owxf3UpBsWf4DZAo16ChSS
         zhUbVUrCNklDDTnCZbNWV/j815qyYv9XrdsZcpaG/KJz6DwwIIgBmqwoD5K9ze/GF0Mm
         LUGA==
X-Gm-Message-State: AOAM530U2eT7XXlyO+7HhIDEVNYZ2LdGHY/UtIlsgJBcqo8k6gu5epf4
        UUmu5+/ScUPyGKrKn4H1NXAVOnJ/NxzZ2cSY8yk=
X-Google-Smtp-Source: ABdhPJxjcAxr3hNhmfI14xnbcbYlgvn+tDmDZQ7L5rX4/7HDgwMHHnw4aI1xgsxoZeWDEn9cH77qJg==
X-Received: by 2002:aed:3b78:: with SMTP id q53mr8031576qte.195.1599072000158;
        Wed, 02 Sep 2020 11:40:00 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id s47sm208004qtb.13.2020.09.02.11.39.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2020 11:39:59 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS),
        linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
        linux-kernel@vger.kernel.org (open list),
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <tdas@codeaurora.org>
Subject: [PATCH 0/7] SM8150 and SM8250 dispcc drivers
Date:   Wed,  2 Sep 2020 14:38:40 -0400
Message-Id: <20200902183852.14510-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add display clock drivers required to get DSI and DP displays working on
SM8150 and SM8250 SoCs.

Derived from downstream drivers. Notable changes compared to downstream:
 - EDP clks removed (nothing uses these even in downstream it seems)
 - freq_tbl values for dp_link clk is in Hz and not kHz

Jonathan Marek (7):
  dt-bindings: clock: sdm845-dispcc: same name for dp_phy clocks as
    sc7180
  arm64: dts: qcom: sdm845-dispcc: same name for dp_phy clocks as sc7180
  dt-bindings: clock: combine qcom,sdm845-dispcc and qcom,sc7180-dispcc
  dt-bindings: clock: Introduce QCOM SM8150 display clock bindings
  dt-bindings: clock: Introduce QCOM SM8250 display clock bindings
  clk: qcom: Add display clock controller driver for SM8150
  clk: qcom: Add display clock controller driver for SM8250

 ...om,sdm845-dispcc.yaml => qcom,dispcc.yaml} |   26 +-
 .../bindings/clock/qcom,sc7180-dispcc.yaml    |   86 --
 arch/arm64/boot/dts/qcom/sdm845.dtsi          |    4 +-
 drivers/clk/qcom/Kconfig                      |   18 +
 drivers/clk/qcom/Makefile                     |    2 +
 drivers/clk/qcom/dispcc-sm8150.c              | 1152 +++++++++++++++++
 drivers/clk/qcom/dispcc-sm8250.c              | 1100 ++++++++++++++++
 .../dt-bindings/clock/qcom,dispcc-sm8150.h    |   69 +
 .../dt-bindings/clock/qcom,dispcc-sm8250.h    |   66 +
 9 files changed, 2426 insertions(+), 97 deletions(-)
 rename Documentation/devicetree/bindings/clock/{qcom,sdm845-dispcc.yaml => qcom,dispcc.yaml} (78%)
 delete mode 100644 Documentation/devicetree/bindings/clock/qcom,sc7180-dispcc.yaml
 create mode 100644 drivers/clk/qcom/dispcc-sm8150.c
 create mode 100644 drivers/clk/qcom/dispcc-sm8250.c
 create mode 100644 include/dt-bindings/clock/qcom,dispcc-sm8150.h
 create mode 100644 include/dt-bindings/clock/qcom,dispcc-sm8250.h

-- 
2.26.1

