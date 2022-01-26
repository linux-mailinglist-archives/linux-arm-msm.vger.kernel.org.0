Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3206149D52B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jan 2022 23:18:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233128AbiAZWSM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Jan 2022 17:18:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233126AbiAZWSL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Jan 2022 17:18:11 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B00FC06174E
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jan 2022 14:18:11 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id w12-20020a17090a528c00b001b276aa3aabso5664407pjh.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jan 2022 14:18:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dIYkVQemKDQ2y3bmpym5ZYoIUxFabj5sPwnUV0EmyK0=;
        b=twxr89mbaTAnP8dq8YFVOzjDl7dJbJgmeoThgAobqg2LYDWbxuYX1Linn83YeirfD3
         SgXCZUUjDWEjMBoQwH45P7YFcRIvE4Ym8KF39ctqj+El6c8fRQoN+tYmovajyFRt9o/h
         75dOn2d82d4KD8DPDy9Y9UxfywfXGbawIjI8Hp1H/J0IjOz2fipmcgHOT0p2ehYUpqUS
         gU0Bx5G9E19T9uIKnIlQW6rEamiB9WvR31BzpPDkJ5iNSLQPTYyOcYZ2EexA6sLGXfD6
         YWxx5Vn1ibXLhWxuEPooaJTm/YjlG9y4AeRdnjClO6U0ZC4NQYJ8tOD89/6Ti9YOZevk
         foLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dIYkVQemKDQ2y3bmpym5ZYoIUxFabj5sPwnUV0EmyK0=;
        b=GAO9Pt4LgHvk04Jf6IYpoURumF7VoIrgOq95Wu0XAjBkQZx0L4OydkugCpkf9K+2LH
         18STeKznei94jIUs8WXppE7sUah6hiPHI0MclXOez5+89rL3q+qz/rcdmQyznklupB9b
         3h1qwfchtESWL9LvlukXCFUuyESts7i0acZ/H/JhEyS0PIjyaZp/QmKCfEyI722mqw0V
         Jat5pDEWER4Lc69Msp9P4gJR0DketpXOVdK0JW3vcB+oWX5bBu6pB0QEb8FRQw5T02eV
         DXVApnTnYEdPv2DDAYQNZJDre0T80xQRMaHr5a1BBKzQr6nisc9uX/a6EBDHGGnj8XEi
         mDqg==
X-Gm-Message-State: AOAM530ZLVOhW9iCWZwtkT7Xl7fK+n69FIMyl0tI1Dd6mV/tArJULK/t
        2DiCA3nWBfjBWz3mcka6jUO+3HAafPRVQs+r
X-Google-Smtp-Source: ABdhPJwj9zXQUjLBroliCIG3Eo6PSOIGzmIbNf/ymx9psMbfp47HmhIkDtHe9fZysk1LRnZyL3Z++w==
X-Received: by 2002:a17:90b:4c8e:: with SMTP id my14mr10841049pjb.243.1643235490641;
        Wed, 26 Jan 2022 14:18:10 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:1f3a:4e9b:8fa7:36dc:a805:c73f])
        by smtp.gmail.com with ESMTPSA id t17sm4233742pgm.69.2022.01.26.14.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jan 2022 14:18:10 -0800 (PST)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, agross@kernel.org, sboyd@kernel.org,
        tdas@codeaurora.org, mturquette@baylibre.com,
        linux-clk@vger.kernel.org, bjorn.andersson@linaro.org,
        davem@davemloft.net, netdev@vger.kernel.org
Subject: [PATCH 0/8] Add ethernet support for Qualcomm SA8155p-ADP board
Date:   Thu, 27 Jan 2022 03:47:17 +0530
Message-Id: <20220126221725.710167-1-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The SA8155p-ADP board supports on-board ethernet (Gibabit Interface),
with support for both RGMII and RMII buses.

This patchset adds the support for the same.

Note that this patchset is based on an earlier sent patchset
for adding PDC controller support on SM8150 (see [1]).

[1]. https://lore.kernel.org/linux-arm-msm/20220119203133.467264-1-bhupesh.sharma@linaro.org/T

Bhupesh Sharma (3):
  clk: qcom: gcc: Add PCIe, EMAC and UFS GDSCs for SM8150
  clk: qcom: gcc-sm8150: use runtime PM for the clock controller
  clk: qcom: gcc-sm8150: Use PWRSTS_ON (only) as a workaround for emac
    gdsc

Bjorn Andersson (1):
  net: stmmac: dwmac-qcom-ethqos: Adjust rgmii loopback_en per platform

Vinod Koul (4):
  dt-bindings: net: qcom,ethqos: Document SM8150 SoC compatible
  net: stmmac: Add support for SM8150
  arm64: dts: qcom: sm8150: add ethernet node
  arm64: dts: qcom: sa8155p-adp: Enable ethernet node

 .../devicetree/bindings/net/qcom,ethqos.txt   |   4 +-
 arch/arm64/boot/dts/qcom/sa8155p-adp.dts      | 144 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8150.dtsi          |  27 ++++
 drivers/clk/qcom/gcc-sm8150.c                 | 105 +++++++++++--
 .../stmicro/stmmac/dwmac-qcom-ethqos.c        |  37 ++++-
 include/dt-bindings/clock/qcom,gcc-sm8150.h   |   9 +-
 6 files changed, 305 insertions(+), 21 deletions(-)

-- 
2.34.1

