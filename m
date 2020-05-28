Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 615AF1E669D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2020 17:47:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404672AbgE1PrC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 May 2020 11:47:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404511AbgE1PrA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 May 2020 11:47:00 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34E0BC08C5C8
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2020 08:47:00 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id e11so12744555pfn.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2020 08:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8bzFkEpeMiuczNpVrGeVDfJTOaYxKHg+WzWEH40XhWE=;
        b=HLcs+9vbHgcJOleOjvkmnddOoWOENq1ApNFuKlsvL7Fhqhv+BZzqph1mjN9eSJWnvs
         D9SThGRtoBtovGAknlmhY5N0KECznIyDjSsgIH1TapbLnIs40D69D6HewwtcKGLDcRJc
         E6gj14FTp3OUmF8uVng6h30QlcDJtl6e1+qzUlSLtma1s5D/3Qs/fDfOYvH96k2/kJJy
         5eRkjrMUmRJWuPb7EwTPnrR/tvxjgtNvlir084wxB+aIncgTYgfIeuBT7J94B8ut56JZ
         32PEY6R6IJhjvOe79CHMLjx/B/soPDWjGp5C+xWPmwpU0VncfaIhreWCoipx7QKZQxXF
         u80w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8bzFkEpeMiuczNpVrGeVDfJTOaYxKHg+WzWEH40XhWE=;
        b=teT1gt+NNfL1ENlJZcaU44feRNmINoA9fXlOYStVtrlsxAI3QzelDqosQyAvCFCJjf
         NpHd1Pav7IOJQHdbapSyLTTNuMroAc/lyXJEZ/FvjrPQE4VfNWOp9tochi4DS6Rstc66
         2odlw1AcUvfwR4yxsYaHFiTTiZKxN1CdPYnCy59ZzIliwfw6KtVAYBDKOK9VG5ityPbV
         0RRFixOBwMvnUbsWKhK/dIZ1B+a9H+Vgu0/eQezm++vt+Nk0e3dZYd+OPOPQ6L3qJNzT
         xxKeAro4mdNzoi7ze9jpVtjcLUwbcfS60aC9HTz7zUUBol979xjFMJFF4ZI7OjzmTDye
         QwLw==
X-Gm-Message-State: AOAM530bddMbYaqy9A73RnozOVWAtdMYLwrEd+FA6r91Ce3rr3pegexs
        OtYR2ET/6fc4d8lBPOpGyOT2NA==
X-Google-Smtp-Source: ABdhPJzqKkm7zM1Q9nJmBlgmD27dvX4y5zG//O+pRAV+bthX0R54UHNlVgcsDY/Rc/HWan7HktwORw==
X-Received: by 2002:a63:c846:: with SMTP id l6mr3474336pgi.197.1590680819568;
        Thu, 28 May 2020 08:46:59 -0700 (PDT)
Received: from nagraj.local ([49.206.21.239])
        by smtp.gmail.com with ESMTPSA id y22sm5212551pfc.132.2020.05.28.08.46.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2020 08:46:58 -0700 (PDT)
From:   Sumit Semwal <sumit.semwal@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org
Cc:     nishakumari@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        kgunda@codeaurora.org, rnayak@codeaurora.org,
        Sumit Semwal <sumit.semwal@linaro.org>
Subject: [PATCH v3 0/5] Qualcomm labibb regulator driver
Date:   Thu, 28 May 2020 21:16:20 +0530
Message-Id: <20200528154625.17742-1-sumit.semwal@linaro.org>
X-Mailer: git-send-email 2.26.2
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

Nisha Kumari (4):
  dt-bindings: regulator: Add labibb regulator
  arm64: dts: qcom: pmi8998: Add nodes for LAB and IBB regulators
  regulator: qcom: Add labibb driver
  regulator: qcom: labibb: Add SC interrupt handling

Sumit Semwal (1):
  regulator: Allow regulators to verify enabled during enable()

 .../regulator/qcom-labibb-regulator.yaml      |  63 ++++
 arch/arm64/boot/dts/qcom/pmi8998.dtsi         |  14 +
 drivers/regulator/Kconfig                     |  10 +
 drivers/regulator/Makefile                    |   1 +
 drivers/regulator/core.c                      |  28 ++
 drivers/regulator/qcom-labibb-regulator.c     | 316 ++++++++++++++++++
 include/linux/regulator/driver.h              |   5 +
 7 files changed, 437 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/qcom-labibb-regulator.yaml
 create mode 100644 drivers/regulator/qcom-labibb-regulator.c

-- 
2.26.2

