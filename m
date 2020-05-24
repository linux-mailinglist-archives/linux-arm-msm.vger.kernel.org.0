Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41F5E1E02CF
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2020 23:06:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387874AbgEXVGX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 24 May 2020 17:06:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387830AbgEXVGW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 24 May 2020 17:06:22 -0400
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com [IPv6:2607:f8b0:4864:20::82d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAA90C05BD43
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2020 14:06:21 -0700 (PDT)
Received: by mail-qt1-x82d.google.com with SMTP id x12so12528043qts.9
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2020 14:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=33GqBqRR2Gx5o9WCKvD5zP6xFK/J0f9ce+9hLTx+wyU=;
        b=dYUpyeZ88WeTWem/FswXsS44lrLQiybUFroMePC5CksOBACVAc+AP08HWM0w7Pb7Ac
         F0NoPLjN8bl8FC/TOlPXgTDCHIwz9ScxlWhB+CCPJnvHPGin2bMTIy4i0dFKet5Uea+I
         Ftpgtp3RfC4VlgKd07iaGfRxJQlavPnhVAETIyqC3PDPlQa3J/cWM70oWOXfKfWWjQrd
         8mzF01SO6Lcs9PufgS4krp4OOJtNL/Etl+uokDY8imEP8PtmHaBekkQ6nLyEuIbpSq4u
         /BM8C6gDx+6Mh7POr+o8fX9mWZ9Z+Hj0udzDuFnmZmicTN8UQx/A2Gy1I2bhd0IlZmk9
         ZA4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=33GqBqRR2Gx5o9WCKvD5zP6xFK/J0f9ce+9hLTx+wyU=;
        b=a0ARKK4xnPxeeR/c4Ef7zoubI47gjaldMMQBT8jT8zoifNQeFhY3d6waYwLXLvccyk
         WdEVvIxdmEn3RTy4cS3aCgDAbmUB9Y+wWANrgtyG1YuI/VzBO+bRoTW1YbDAhenoW11W
         iV3VH0L+5FqugVPeKbTaEpghd0ZrI/w3xrouquGphLg+QsR0fn+3HYaFpixYgZXfJ/iH
         sXo6EjKUyjkJbdGQ+sMd9iL3czEvQwMz2+c+Jtvvvxo4CW3ufzRKoTx7CQronV0EHzQv
         /PZH4cETOMIiGiHZM/BAELVeqVam4x9c1Y5aC9scENLnXiYYoaUnE8V/QcIiTz2DQ7cS
         XLEg==
X-Gm-Message-State: AOAM530FmtxULq861Hpy3OOhhjpb8QfMjvNpyIj2KzNILRIEa+/wpgAS
        qCfbjLGneoxGZn5iX311Cuqc7FO+CO47oA==
X-Google-Smtp-Source: ABdhPJwI1QyBwhsjxuoHpJ6tCXkyyAyYdQsPyhYI0RaCc5ILD7mHRyhYvqVq1nEthHB/cp/9qysgug==
X-Received: by 2002:aed:2452:: with SMTP id s18mr11569062qtc.137.1590354379884;
        Sun, 24 May 2020 14:06:19 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id g51sm4401769qtb.69.2020.05.24.14.06.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2020 14:06:19 -0700 (PDT)
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
        Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH 00/10] Enable GPU for SM8150 and SM8250
Date:   Sun, 24 May 2020 17:06:01 -0400
Message-Id: <20200524210615.17035-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series adds the missing clock drivers and dts nodes to enable
the GPU on both SM8150 and SM8250.

Adreno 640/650 support was recently added to drm/msm [1], but an
extra patch [2] is still required for GPU to actually work on SM8250.

[1] https://patchwork.freedesktop.org/series/76198/
[2] https://gist.github.com/flto/784f1aca761ebf2fe6c105719a4a04ca

Jonathan Marek (10):
  clk: qcom: clk-alpha-pll: remove unused/incorrect PLL_CAL_VAL
  clk: qcom: clk-alpha-pll: same regs and ops for trion and lucid
  clk: qcom: clk-alpha-pll: use the right PCAL_DONE value for lucid pll
  clk: qcom: gcc: remove unnecessary vco_table from SM8150
  dt-bindings: clock: Introduce SM8150 QCOM Graphics clock bindings
  dt-bindings: clock: Introduce SM8250 QCOM Graphics clock bindings
  clk: qcom: Add graphics clock controller driver for SM8150
  clk: qcom: Add graphics clock controller driver for SM8250
  arm64: dts: qcom: add sm8150 GPU nodes
  arm64: dts: qcom: add sm8250 GPU nodes

 arch/arm64/boot/dts/qcom/sm8150.dtsi          | 132 +++++
 arch/arm64/boot/dts/qcom/sm8250.dtsi          | 139 ++++++
 drivers/clk/qcom/Kconfig                      |  16 +
 drivers/clk/qcom/Makefile                     |   2 +
 drivers/clk/qcom/clk-alpha-pll.c              |  70 ++-
 drivers/clk/qcom/clk-alpha-pll.h              |  15 +-
 drivers/clk/qcom/gcc-sm8150.c                 |  18 +-
 drivers/clk/qcom/gpucc-sm8150.c               | 429 ++++++++++++++++
 drivers/clk/qcom/gpucc-sm8250.c               | 458 ++++++++++++++++++
 include/dt-bindings/clock/qcom,gpucc-sm8150.h |  40 ++
 include/dt-bindings/clock/qcom,gpucc-sm8250.h |  40 ++
 11 files changed, 1304 insertions(+), 55 deletions(-)
 create mode 100644 drivers/clk/qcom/gpucc-sm8150.c
 create mode 100644 drivers/clk/qcom/gpucc-sm8250.c
 create mode 100644 include/dt-bindings/clock/qcom,gpucc-sm8150.h
 create mode 100644 include/dt-bindings/clock/qcom,gpucc-sm8250.h

-- 
2.26.1

