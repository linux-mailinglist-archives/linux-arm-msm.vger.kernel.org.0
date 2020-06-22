Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F8DF2036FC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2020 14:41:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728189AbgFVMlY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Jun 2020 08:41:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726652AbgFVMlX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Jun 2020 08:41:23 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDD0CC061795
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2020 05:41:21 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id j4so7529854plk.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2020 05:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fq5dVVlXW8qg+ASmc5eHI9qkJpaHLFgd8jV55IoO3ds=;
        b=wcSTbWr12KM0AKzvczAYGpY8oNBlPcfTlSqXSviRt6OVkzWhCDYP9/vasBpxVa159T
         vZMShpuchPupvThg/UKN4QPPDmfiT1u7wmr3KcRRsd8+9ZzOLxdvwSYoiYH0M0ITVWIp
         AEIqdLRy2K0grOOM48kvK15Np7sRxIjAz85bJKWF0mOFTFGhw6D80NKy8xkZQd4/1QzT
         xPKuFKJQ7UKYWCA50gU9EcDEdbOMRxt86AZ9SH8u+auHNZsoUbF9YDee4c7i10JsZUqU
         4tHiNTvD1eLzQbXCpmq19w5ln2UemzsLBWF0ThxGAFg581DionEgeCstmoE5U29SWFlh
         bcuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fq5dVVlXW8qg+ASmc5eHI9qkJpaHLFgd8jV55IoO3ds=;
        b=R+jLl7sP6dhRBRAhER1F/MiCAgly791cgo1ofqNMtubENqhEp/6E6oO0vXj3sSSEKI
         32YyuwO0GPQDSpiMU4QQgHHwOelC6BUIbxDbImFvdV33MMMlUDtZQo8GSeDvbC9/Tuhf
         FljkNOfyO7cYQLxTkpt0ZWBykRMprz7D7trRwOaOrLoGdtGsQ7AcIySjr6OKf20xG5uy
         qHaNVjtBrE1tUgbLPzMncWeX5QAUrcTPQIsWmhxN4ummVmbgE5fqmencYVoPTc+dY9/A
         e4r+gOvSg3oB/gkMytARh4zocr99oRzsM9ljsOtqzMIYaLsVXbGV86g6hVLAWePJuCrn
         eeuA==
X-Gm-Message-State: AOAM530dzgh4CKGxN1mkwjWwQBmcMLIDwuGgsjgenpBxIhqLDT+soHLg
        QhU0iQ7n/3FtDpiqHiQneGw99A==
X-Google-Smtp-Source: ABdhPJwjlbEAiUJF8l5uuQoy02B2OXMWAyP1HFiJcPrgxtCoWUakvFFTfhJvx+tjDSCep+YvLypuKg==
X-Received: by 2002:a17:90a:36d0:: with SMTP id t74mr16600778pjb.27.1592829680949;
        Mon, 22 Jun 2020 05:41:20 -0700 (PDT)
Received: from nagraj.local ([49.206.21.239])
        by smtp.gmail.com with ESMTPSA id i62sm14590581pfg.90.2020.06.22.05.41.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 05:41:19 -0700 (PDT)
From:   Sumit Semwal <sumit.semwal@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org
Cc:     nishakumari@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        kgunda@codeaurora.org, rnayak@codeaurora.org,
        Sumit Semwal <sumit.semwal@linaro.org>
Subject: [PATCH v5 0/4] Qualcomm labibb regulator driver
Date:   Mon, 22 Jun 2020 18:11:06 +0530
Message-Id: <20200622124110.20971-1-sumit.semwal@linaro.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series adds a driver for LAB/IBB regulators found on some Qualcomm SoCs.
These regulators provide positive and/or negative boost power supplies
for LCD/LED display panels connected to the SoC.

This series adds the support for pmi8998 PMIC found in SDM845 family of SoCs.

Changes from v4:
- v4 Review comments incorporated
  - simplified the driver: removed of_get_child_by_name(); use ENABLE_CTL
    register and switch over to use the regulator_*_regmap helpers
  - improved kerneldoc
  - From the dt-bindings, removed interrupt-names, changed to dual license,
    added unevaluatedProperties: false, removed interrupt-names, since there
    is only one interrupt per node
  - Since the Short Circuit handling needs more details from QC engineers,
    drop the SC handling patch from this series, to submit it later

Changes from v3:
- Handled review comments from v3
- In core, swapped the meaning of enable_time and poll_enabled_time; so we
   wait for total enable_time delay, and poll in-between at poll_enabled_time
   interval now.
- fixed dt_bindings_check issues in dt-bindings patch.
- Cleanup of register_labibb_regulator(), and adapted to updated meaning of
   poll_enabled_time.

Changes from v2:
- Review comments from v2
- Moved the poll-to-check-enabled functionality to regulator core.
- Used more core features to simplify enable/disable functions.
- Moved the devicetree binding to yaml.
- Updated interrupt-names and simplified handling.

Changes from v1:
- Incorporated review comments from v1
- Changed from virtual-regulator based handling to individual regulator based
  handling.
- Reworked the core to merge most of enable/disable functions, combine the
  regulator_ops into one and allow for future variations.
- is_enabled() is now _really_ is_enabled()
- Simplified the SC interrupt handling - use regmap_read_poll_timeout,
  REGULATOR_EVENT_OVER_CURRENT handling and notification to clients.

Nisha Kumari (3):
  dt-bindings: regulator: Add labibb regulator
  arm64: dts: qcom: pmi8998: Add nodes for LAB and IBB regulators
  regulator: qcom: Add labibb driver

Sumit Semwal (1):
  regulator: Allow regulators to verify enabled during enable()

 .../regulator/qcom-labibb-regulator.yaml      |  70 +++++++
 arch/arm64/boot/dts/qcom/pmi8998.dtsi         |  12 ++
 drivers/regulator/Kconfig                     |  10 +
 drivers/regulator/Makefile                    |   1 +
 drivers/regulator/core.c                      |  63 ++++++-
 drivers/regulator/qcom-labibb-regulator.c     | 175 ++++++++++++++++++
 include/linux/regulator/driver.h              |   5 +
 7 files changed, 335 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/regulator/qcom-labibb-regulator.yaml
 create mode 100644 drivers/regulator/qcom-labibb-regulator.c

-- 
2.27.0

