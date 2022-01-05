Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9005485649
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jan 2022 16:57:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241743AbiAEP5M (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Jan 2022 10:57:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241744AbiAEP5J (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Jan 2022 10:57:09 -0500
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78BD1C061245
        for <linux-arm-msm@vger.kernel.org>; Wed,  5 Jan 2022 07:57:09 -0800 (PST)
Received: by mail-ot1-x332.google.com with SMTP id w19-20020a056830061300b0058f1dd48932so51226190oti.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Jan 2022 07:57:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VCJBYYI0XOfkbPfR3OfFSe/LRlBtpYWtrO5Ec4v0RdE=;
        b=vLp9bIX3erQ+cywi/Z48I1iAurtKM8tJZGAAOmwFoOq4J0l2IxRNZp5//45m6rO+Np
         9ztcWG6ZLPeF+f8U8GbNhEH2uIQKwi3kGP35xyPT3imW19eCttBrPtk4qzerq94j5+p+
         0g9T1oys4J1ZLvt72z9eMe0BIOJZsHig82+LumtkIpZssbgDd19jnzhkFwpX4+GVhJDH
         YXZUxst5dyqqz0804dpFzyO6AmIW6S6mI5XyERn9FqPLwJu5lDuddF05pZOfqHxHNw15
         4I9fi+vZAHuYlxdVKYee3cvywCxsts+6+IB1mWFvKTAxvvUzRDfVr8tj5zjclvP9/VcQ
         MjHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VCJBYYI0XOfkbPfR3OfFSe/LRlBtpYWtrO5Ec4v0RdE=;
        b=kRSRwsUnRjFEyY9wqreRppL+GmAaWq3qCUeamD94vj9lZXh3jqAyk+z2vHHMq4ainz
         +II0O91cKws4k52WI1caBDQa7WInnPqz3CZSfkatqDUDqB4MkRDCk6L4rQTeZzIEA044
         bBDx+YGO0gkVue0irM6Zd2yb37WQOGh4kAuIrAome6hny1pyLTiYZhGXU0Gu4rsqTxN6
         kumYahqSRMD/QTKvA9XOkwwQ2ayDvCLVuk4H/D3MB5zkXH/1+R04WOT9+CobF32wq2T5
         ToYxcDTCd9KQgWsGTmowEys4+1yFOm4xig40QH0xGSDpIMajr/LaKFFg/TnYk1eaSXSr
         BIkg==
X-Gm-Message-State: AOAM531Z+4JsagZch8JTOAJMndvv9Z2pPE6DuBN46L9Qa6P8IsgT3Pf1
        SLctrfUexwlqcvJ9QNiHFJGfUbxFZu8udw==
X-Google-Smtp-Source: ABdhPJwj3QaCvOkyXBKS2RhiyrQckV062zea/AZGBelPxoMcLf++E1Dkwis9B80pxrp9LoRJvBcFeQ==
X-Received: by 2002:a05:6830:1e25:: with SMTP id t5mr41141182otr.291.1641398228693;
        Wed, 05 Jan 2022 07:57:08 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id q19sm627989otk.34.2022.01.05.07.57.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jan 2022 07:57:08 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org
Subject: [GIT PULL] Qualcomm clock updates for v5.17
Date:   Wed,  5 Jan 2022 09:57:05 -0600
Message-Id: <20220105155705.698463-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:

  Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-clk-for-5.17

for you to fetch changes up to 96ea2a4291343613a7c2da03c03f23dc259171ff:

  clk: qcom: turingcc-qcs404: explicitly include clk-provider.h (2021-12-20 23:14:50 -0600)

----------------------------------------------------------------
Qualcomm clock updates for v5.17

This introduces bindings and drivers for the global clock controllers
found in SDX65, SM8450 and MSM8976, as well as RPMh clock support for
SDX65 and SM8450.

It cleans up the SMD RPM clock driver and it adds includes for
clk-provider.h throughout the clock providers that was lacking this.

----------------------------------------------------------------
AngeloGioacchino Del Regno (1):
      clk: qcom: Add MSM8976/56 Global Clock Controller (GCC) driver

Bjorn Andersson (3):
      MAINTAINERS: Add entry for Qualcomm clock drivers
      Merge tag 'e15509b2b7c9b600ab38c5269d4fac609c077b5b.1638861860.git.quic_vamslank@quicinc.com' into clk-for-5.17
      Merge tag '20211207114003.100693-2-vkoul@kernel.org' into clk-for-5.17

Marijn Suijten (1):
      dt-bindings: clk: qcom: Document MSM8976 Global Clock Controller

Shawn Guo (3):
      clk: qcom: smd-rpm: Drop MFD qcom-rpm reference
      clk: qcom: smd-rpm: Drop the use of struct rpm_cc
      clk: qcom: smd-rpm: Drop binary value handling for buffered clock

Vamsi Krishna Lanka (2):
      clk: qcom: Add LUCID_EVO PLL type for SDX65
      clk: qcom: Add SDX65 GCC support

Vamsi krishna Lanka (3):
      dt-bindings: clock: Introduce RPMHCC bindings for SDX65
      clk: qcom: Add support for SDX65 RPMh clocks
      dt-bindings: clock: Add SDX65 GCC clock bindings

Vinod Koul (12):
      dt-bindings: clock: Add RPMHCC bindings for SM8450
      clk: qcom: rpmh: add support for SM8450 rpmh clocks
      dt-bindings: clock: Add SM8450 GCC clock bindings
      clk: qcom: Add clock driver for SM8450
      clk: qcom: gcc-sm8350: explicitly include clk-provider.h
      clk: qcom: gcc-msm8994: explicitly include clk-provider.h
      clk: qcom: gcc-sm6350: explicitly include clk-provider.h
      clk: qcom: lpasscc-sc7280: explicitly include clk-provider.h
      clk: qcom: lpasscc-sdm845: explicitly include clk-provider.h
      clk: qcom: mmcc-apq8084: explicitly include clk-provider.h
      clk: qcom: q6sstop-qcs404: explicitly include clk-provider.h
      clk: qcom: turingcc-qcs404: explicitly include clk-provider.h

 .../bindings/clock/qcom,gcc-msm8976.yaml           |   97 +
 .../devicetree/bindings/clock/qcom,gcc-sdx65.yaml  |   80 +
 .../devicetree/bindings/clock/qcom,gcc-sm8450.yaml |   85 +
 .../devicetree/bindings/clock/qcom,rpmhcc.yaml     |    2 +
 MAINTAINERS                                        |    9 +
 drivers/clk/qcom/Kconfig                           |   24 +
 drivers/clk/qcom/Makefile                          |    3 +
 drivers/clk/qcom/clk-alpha-pll.c                   |  164 +-
 drivers/clk/qcom/clk-alpha-pll.h                   |    3 +
 drivers/clk/qcom/clk-rpmh.c                        |   52 +
 drivers/clk/qcom/clk-smd-rpm.c                     |   31 +-
 drivers/clk/qcom/gcc-msm8976.c                     | 4155 ++++++++++++++++++++
 drivers/clk/qcom/gcc-msm8994.c                     |    1 +
 drivers/clk/qcom/gcc-sdx65.c                       | 1611 ++++++++
 drivers/clk/qcom/gcc-sm6350.c                      |    1 +
 drivers/clk/qcom/gcc-sm8350.c                      |    1 +
 drivers/clk/qcom/gcc-sm8450.c                      | 3304 ++++++++++++++++
 drivers/clk/qcom/lpasscc-sc7280.c                  |    1 +
 drivers/clk/qcom/lpasscc-sdm845.c                  |    1 +
 drivers/clk/qcom/mmcc-apq8084.c                    |    1 +
 drivers/clk/qcom/q6sstop-qcs404.c                  |    1 +
 drivers/clk/qcom/turingcc-qcs404.c                 |    1 +
 include/dt-bindings/clock/qcom,gcc-msm8976.h       |  240 ++
 include/dt-bindings/clock/qcom,gcc-sdx65.h         |  122 +
 include/dt-bindings/clock/qcom,gcc-sm8450.h        |  244 ++
 25 files changed, 10202 insertions(+), 32 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-msm8976.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-sdx65.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-sm8450.yaml
 create mode 100644 drivers/clk/qcom/gcc-msm8976.c
 create mode 100644 drivers/clk/qcom/gcc-sdx65.c
 create mode 100644 drivers/clk/qcom/gcc-sm8450.c
 create mode 100644 include/dt-bindings/clock/qcom,gcc-msm8976.h
 create mode 100644 include/dt-bindings/clock/qcom,gcc-sdx65.h
 create mode 100644 include/dt-bindings/clock/qcom,gcc-sm8450.h
