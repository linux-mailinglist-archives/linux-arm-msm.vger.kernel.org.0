Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6FE920E5E6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2020 00:08:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727903AbgF2Vmq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Jun 2020 17:42:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727895AbgF2Shy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Jun 2020 14:37:54 -0400
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com [IPv6:2607:f8b0:4864:20::843])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C35DC03141B
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2020 10:21:00 -0700 (PDT)
Received: by mail-qt1-x843.google.com with SMTP id u17so13465963qtq.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2020 10:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VQkFfkkA31JOV3zD6GN1+JAepXXLzSYJr6ThdL4AJWw=;
        b=1qss+KElvuSqL3gw9wSWrIE2RxXQTdaCj6wtfO5R3w05GuNfhHAAqh4+TY9xhDRq9O
         twKwYUUUP51niOGdmvCuQY10Eb42ItPAD1+TGameGSSBimHXfnO6kEvAs+7lLDzzzboB
         EtRriuEpuISkCQtf21uvTRmYchwXEJxr5b8V70pxuoJiiOWWAywzr3DVFy1IN7fGLALU
         p0idi94Oa8qjSK1au/LoU1T26oTyr2ct0BVFMljI61OyfInXd7QSeqVDNKGkAQ+5c7MK
         cABjEGohSuBB4+dGn3luMqds4a/8C+Hs8Ljj9MoYzdY6U+GHsCr6/7fzDm8xM6wGGq91
         ORhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VQkFfkkA31JOV3zD6GN1+JAepXXLzSYJr6ThdL4AJWw=;
        b=ttuHxulfzgk0ngQ9MY9v+y7HfKHFYQMWfJaoaEMBMSj6CX9h3GvjMAjXoA8c8fcYb8
         BPqvaLMx5bpSYCYMhdIAumefEXi9+XGAeT3ttVrDBcwRLM4deYPcd5arJkTdqtEJZO/Q
         wiKDRMIanwHEhmolreHHWG4L7Xmy9InnZxNVZdI6xgzcxRTSZeOvD0AyZYabKmnVLWUw
         6Z5qYazGe3YimFl6jFDXbw88jhANIdjNpeHfjiYvnI+CJGco54IkN1T/0UqndHhQeF8j
         DDl7EvLMZLA+LtOEwBgiPWd66QFwHX1lZdloWo89zFa/BxN7dgm6TTlSptDWKEwbxO2i
         Q9lw==
X-Gm-Message-State: AOAM5307PcT15L+s8s+gO8uvy6zR2lvYPTMdau1CU4nYXC/DhKi2K5cT
        hrgzwZVWm2N2zdzaNyvaOteRBuaJrk8=
X-Google-Smtp-Source: ABdhPJy/zjExbd8/8qm1ppduBJEP6XTzek9kUYH3mOQnwBfSZPNQI+cXqU/uZhV3BQPKx6T4xnnSMA==
X-Received: by 2002:ac8:4055:: with SMTP id j21mr16933381qtl.76.1593451259343;
        Mon, 29 Jun 2020 10:20:59 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id q5sm408363qtf.12.2020.06.29.10.20.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2020 10:20:58 -0700 (PDT)
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
Subject: [PATCH v2 00/13] Enable GPU for SM8150 and SM8250
Date:   Mon, 29 Jun 2020 13:20:30 -0400
Message-Id: <20200629172049.30452-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series adds the missing clock drivers and dts nodes to enable
the GPU on both SM8150 and SM8250.

Note an extra patch [1] is still required for GPU to work on SM8250.

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

[1] https://gist.github.com/flto/784f1aca761ebf2fe6c105719a4a04ca

Jonathan Marek (13):
  clk: qcom: gcc: fix sm8150 GPU and NPU clocks
  clk: qcom: clk-alpha-pll: remove unused/incorrect PLL_CAL_VAL
  clk: qcom: clk-alpha-pll: same regs and ops for trion and lucid
  clk: qcom: clk-alpha-pll: use the right PCAL_DONE value for lucid pll
  clk: qcom: gcc: remove unnecessary vco_table from SM8150
  dt-bindings: clock: Introduce SM8150 QCOM Graphics clock bindings
  dt-bindings: clock: Introduce SM8250 QCOM Graphics clock bindings
  clk: qcom: add common gdsc_gx_do_nothing_enable for gpucc drivers
  clk: qcom: Add graphics clock controller driver for SM8150
  clk: qcom: Add graphics clock controller driver for SM8250
  dt-bindings: power: Add missing rpmpd rpmh regulator level
  arm64: dts: qcom: add sm8150 GPU nodes
  arm64: dts: qcom: add sm8250 GPU nodes

 .../bindings/clock/qcom,sm8150-gpucc.yaml     |  74 +++
 .../bindings/clock/qcom,sm8250-gpucc.yaml     |  74 +++
 arch/arm64/boot/dts/qcom/sm8150.dtsi          | 136 ++++++
 arch/arm64/boot/dts/qcom/sm8250.dtsi          | 143 ++++++
 drivers/clk/qcom/Kconfig                      |  16 +
 drivers/clk/qcom/Makefile                     |   2 +
 drivers/clk/qcom/clk-alpha-pll.c              |  70 ++-
 drivers/clk/qcom/clk-alpha-pll.h              |  15 +-
 drivers/clk/qcom/gcc-sm8150.c                 |  26 +-
 drivers/clk/qcom/gdsc.c                       |  25 +
 drivers/clk/qcom/gdsc.h                       |   1 +
 drivers/clk/qcom/gpucc-sc7180.c               |  27 +-
 drivers/clk/qcom/gpucc-sdm845.c               |  27 +-
 drivers/clk/qcom/gpucc-sm8150.c               | 421 ++++++++++++++++
 drivers/clk/qcom/gpucc-sm8250.c               | 450 ++++++++++++++++++
 include/dt-bindings/clock/qcom,gpucc-sm8150.h |  40 ++
 include/dt-bindings/clock/qcom,gpucc-sm8250.h |  40 ++
 include/dt-bindings/power/qcom-rpmpd.h        |   1 +
 18 files changed, 1479 insertions(+), 109 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm8150-gpucc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm8250-gpucc.yaml
 create mode 100644 drivers/clk/qcom/gpucc-sm8150.c
 create mode 100644 drivers/clk/qcom/gpucc-sm8250.c
 create mode 100644 include/dt-bindings/clock/qcom,gpucc-sm8150.h
 create mode 100644 include/dt-bindings/clock/qcom,gpucc-sm8250.h

-- 
2.26.1

