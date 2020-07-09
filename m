Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D239521A150
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2020 15:55:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727949AbgGINy1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Jul 2020 09:54:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727856AbgGINy0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Jul 2020 09:54:26 -0400
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com [IPv6:2607:f8b0:4864:20::841])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EB2DC08E6DC
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2020 06:54:26 -0700 (PDT)
Received: by mail-qt1-x841.google.com with SMTP id e12so1666962qtr.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2020 06:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FoYroevO5aBBa1iVjvsDAiRUR6Hq4gmMuR8nLzos3mw=;
        b=Z6NRe/KH8bncXG4w++4ecKr3wqovwnlWL54aD5Nzi9+BB7vjICb9LcPIGeiPYFNJVo
         Y/AQ6/wFhrzsBGDSIqFehClvUY0W6XyunhSG+cdNJhm6FQ6Q0D1+GGGDV5SAGpGvs35X
         zAq7AyAI7DqKTEHXRzXPVTE56RnZj59V6uUK5lOM+IGn5tAhi9U6Cfyk5g2zpt3KZzaP
         gq+urnDQkd/kAar89rPeSp5ndT15f7TJwZSdPRcp74qc7i+aIjJ4YF9EFC+us5EiP/NV
         VX8vfcNp6enxaHd4lSfsIM+qpUnUMnXtYmEoWWC0nTXNwCHAjoB1sA5zEKiLDy2THgFB
         YG8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FoYroevO5aBBa1iVjvsDAiRUR6Hq4gmMuR8nLzos3mw=;
        b=jWe/U1mlPbNUXrXDauo2wbLhJiwaV8S6+CRfvn+RsUx/MUrEAk4GgZN7XTXFfGXDjL
         eZjEEX35t0ApguPIvZlJsdN1qTTbLdhmA+xC2a9ru9LOQ97Fbh7aEGyVVuux2PYW289s
         gHsZ22Cz2eRvTbgc1st54lNf+9CuP7+9FxWyisN+UDbqzQRnpeFdDwo5SVmxR+LuExyU
         bOSxPkc4FTiDsIjFYjRAcAUJxshLa1jH35JV1XOBBDpLLGcnVTfzmvUeR3/ikgZBlK5n
         A+vaVBe0LbciAsmCnDxAAA05OBS+tFRTqNs1j42TM3jsdM91yX+J2FKzJh4fzHMaL28N
         an6g==
X-Gm-Message-State: AOAM530Ti7MTd3qiG6NhUtph/dZmaXmikNuA5+Q7LFwD08lzFZt5CzJm
        4S71pNUHu0v/eHHVvkJGzQTCathtOwA=
X-Google-Smtp-Source: ABdhPJxhiX3tijNbdyq0oIUQJC6u0JCpsZSHVAijeTfA7RTEUJdj+vBHVcFpY3YlG+naGt9YwyptvA==
X-Received: by 2002:ac8:7208:: with SMTP id a8mr68813599qtp.355.1594302865515;
        Thu, 09 Jul 2020 06:54:25 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id 130sm3632735qkn.82.2020.07.09.06.54.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2020 06:54:25 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Deepak Katragadda <dkatraga@codeaurora.org>,
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS),
        linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
        linux-kernel@vger.kernel.org (open list),
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <tdas@codeaurora.org>, Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v3 00/14] Enable GPU for SM8150 and SM8250
Date:   Thu,  9 Jul 2020 09:52:31 -0400
Message-Id: <20200709135251.643-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series adds the missing clock drivers and dts nodes to enable
the GPU on both SM8150 and SM8250.

Note an extra drm/msm patch [1] is required for SM8250.

As noted by Dmitry, GMU init fails with newer firmware, needs this patch [2].

[1] https://patchwork.freedesktop.org/series/78968/
[2] https://git.linaro.org/landing-teams/working/qualcomm/kernel.git/commit/?h=tracking-qcomlt-sm8250&id=01331f2ccbe7e6c4719dbe038a5fb496db32646d

Changes in V2:
* Added "clk: qcom: gcc: fix sm8150 GPU and NPU clocks" to fix the newly added
  SM8150 GPU gcc clocks
* Added "Fixes:" tag to "clk: qcom: clk-alpha-pll: remove unused/incorrect PLL_CAL_VAL"
* Added yaml schemas to gpucc dt-bindings patches
* Added "clk: qcom: add common gdsc_gx_do_nothing_enable for gpucc drivers" and changed
  gpucc patches to use it.
* Removed CLK_IS_CRITICAL from gpu_cc_ahb_clk
* Added missing rpmh regulator level for sm8250 GPU clock levels
* Use sm8150/sm8250 iommu compatibles in dts
* Add gcc_gpu_gpll0_clk_src/gcc_gpu_gpll0_div_clk_src to gpucc clocks in dts

Changes in V3:
* Combined gpucc yaml bindings into one
* Removed some unused clocks from gpucc drivers to move closely match other gpucc
* Use parent_data instead of parent_names

Jonathan Marek (14):
  clk: qcom: gcc: fix sm8150 GPU and NPU clocks
  clk: qcom: clk-alpha-pll: remove unused/incorrect PLL_CAL_VAL
  clk: qcom: clk-alpha-pll: same regs and ops for trion and lucid
  clk: qcom: clk-alpha-pll: use the right PCAL_DONE value for lucid pll
  clk: qcom: gcc: remove unnecessary vco_table from SM8150
  dt-bindings: clock: combine qcom,sdm845-gpucc and qcom,sc7180-gpucc
  dt-bindings: clock: add SM8150 QCOM Graphics clock bindings
  dt-bindings: clock: add SM8250 QCOM Graphics clock bindings
  clk: qcom: add common gdsc_gx_do_nothing_enable for gpucc drivers
  clk: qcom: Add graphics clock controller driver for SM8150
  clk: qcom: Add graphics clock controller driver for SM8250
  dt-bindings: power: Add missing rpmpd rpmh regulator level
  arm64: dts: qcom: add sm8150 GPU nodes
  arm64: dts: qcom: add sm8250 GPU nodes

 ...qcom,sdm845-gpucc.yaml => qcom,gpucc.yaml} |  18 +-
 .../bindings/clock/qcom,sc7180-gpucc.yaml     |  74 ----
 arch/arm64/boot/dts/qcom/sm8150.dtsi          | 136 +++++++
 arch/arm64/boot/dts/qcom/sm8250.dtsi          | 143 +++++++
 drivers/clk/qcom/Kconfig                      |  16 +
 drivers/clk/qcom/Makefile                     |   2 +
 drivers/clk/qcom/clk-alpha-pll.c              |  70 ++--
 drivers/clk/qcom/clk-alpha-pll.h              |  15 +-
 drivers/clk/qcom/gcc-sm8150.c                 |  26 +-
 drivers/clk/qcom/gdsc.c                       |  25 ++
 drivers/clk/qcom/gdsc.h                       |   1 +
 drivers/clk/qcom/gpucc-sc7180.c               |  27 +-
 drivers/clk/qcom/gpucc-sdm845.c               |  27 +-
 drivers/clk/qcom/gpucc-sm8150.c               | 320 ++++++++++++++++
 drivers/clk/qcom/gpucc-sm8250.c               | 348 ++++++++++++++++++
 include/dt-bindings/clock/qcom,gpucc-sm8150.h |  33 ++
 include/dt-bindings/clock/qcom,gpucc-sm8250.h |  34 ++
 include/dt-bindings/power/qcom-rpmpd.h        |   1 +
 18 files changed, 1128 insertions(+), 188 deletions(-)
 rename Documentation/devicetree/bindings/clock/{qcom,sdm845-gpucc.yaml => qcom,gpucc.yaml} (75%)
 delete mode 100644 Documentation/devicetree/bindings/clock/qcom,sc7180-gpucc.yaml
 create mode 100644 drivers/clk/qcom/gpucc-sm8150.c
 create mode 100644 drivers/clk/qcom/gpucc-sm8250.c
 create mode 100644 include/dt-bindings/clock/qcom,gpucc-sm8150.h
 create mode 100644 include/dt-bindings/clock/qcom,gpucc-sm8250.h

-- 
2.26.1

