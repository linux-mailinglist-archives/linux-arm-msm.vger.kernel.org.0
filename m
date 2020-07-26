Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AD9F22DE2A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Jul 2020 13:13:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727979AbgGZLNO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 26 Jul 2020 07:13:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725794AbgGZLNN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 26 Jul 2020 07:13:13 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 632CFC0619D2;
        Sun, 26 Jul 2020 04:13:12 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id lx13so14224661ejb.4;
        Sun, 26 Jul 2020 04:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tNAVT9gld8ytdUafqDbp0LRRq+hyh+iiBGbYdB7ZOxM=;
        b=kVUnJWDPN6bBNQf+whJB42R11Hv00qYaftuHcTPkOHBGBB9Ot9QHSEiXRV21lvGbC1
         Bsgbfz29Cq6a6xj7BsLQ43L3r5oSkDCIdrZSGKfviP6mnXibs5sWjDEZXIBh/gZNu9Df
         4uvtqbWmHJT78ufd8xB7+mSBYIZaeorOj2pUBstnXtB+7QlKSG3H2UM9gvWZ/EWdPPji
         K6B80g391V1xXyAuUo1xwi3HcBkMfxTQzb66zx38JqDqy7TKjGc1p2EpNOoA+PICCHsJ
         vgCXEN7+OKlYxgmflGbK95V6aWfwWYLmjQsHseh4OnkYcV/vk+Zb8Hva/u+6Oi7qysQC
         /BEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tNAVT9gld8ytdUafqDbp0LRRq+hyh+iiBGbYdB7ZOxM=;
        b=trFtIVKGjeMnL1tlyvy2xyk7XpBlSxq4ZlJjjVjLikWsmI7FEZJogpKzA66+GjK3pm
         lZ4hjCPukCIV4BtvRfLYMPilO5giiN/8Yab6wxZMoXufaa0LRUKEy8y3J8DKINE1tO26
         8d1Hcz/aMTzTx2rNgRPi2eqGWbmQHtE4f+nhHUW9Qh7t1qFpcII/u02esDPxkkFDZCTJ
         eLBhkd3wOo/EKbjfGlqwhqXzSTfL77T3S89rmq2T4JgLa9/ZT/LGpdRkYvR+Yua7Fqgr
         WJf9+Agvbzr0HSzKwzznWVc5uhjU64n1evUMF2KVhM+IHcFnrovqjdcXPTRhvSY7+OMJ
         SyVw==
X-Gm-Message-State: AOAM5303JtkIaQOtvtuvAXxd18FF64XHw7qCgfIdX9fSR62qKogmWHsW
        6Uj5LK9sOy+MePf5eKix1Qg=
X-Google-Smtp-Source: ABdhPJxhh+2o7B1rrZWbt/vIi6TWE/wpm02xaRpF0P5sfdJfxl2Fsk/0i0N8uGD+jScbEkBbPA9T9g==
X-Received: by 2002:a17:906:4558:: with SMTP id s24mr12647062ejq.144.1595761991022;
        Sun, 26 Jul 2020 04:13:11 -0700 (PDT)
Received: from localhost.localdomain (abad207.neoplus.adsl.tpnet.pl. [83.6.167.207])
        by smtp.googlemail.com with ESMTPSA id d23sm4696253ejj.74.2020.07.26.04.13.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2020 04:13:10 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
To:     konradybcio@gmail.com
Cc:     martin.botka1@gmail.com, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Felipe Balbi <balbi@kernel.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        zhengbin <zhengbin13@huawei.com>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Ben Dooks <ben.dooks@codethink.co.uk>,
        Krzysztof Wilczynski <kw@linux.com>,
        Harigovindan P <harigovi@codeaurora.org>,
        Brian Masney <masneyb@onstation.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Xiaozhe Shi <xiaozhes@codeaurora.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH 0/9] SDM630/36/60 driver enablement
Date:   Sun, 26 Jul 2020 13:11:57 +0200
Message-Id: <20200726111215.22361-1-konradybcio@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi!

This series brings most of the changes that have been
brought to sdm630/636/660 SoCs apart from device tree
part (I cannot add anything unless some [1] smmu quirks
are merged.. blame qcom!)

So far, the platform is shaping up nicely, though some
peripherals seem to be living their own lives (I'm looking
at you, modem!)

The QPNP-REVID driver is taken from downstream but seems to
work fine upstream. I understand it may need some cleaning-up
before it's merged.

Current out-of-tree progress can be seen at [2].

[1] https://patchwork.kernel.org/patch/11643603/
[2] https://github.com/konradybcio/linux/commits/ninges_labs

Konrad Dybcio (8):
  clk: qcom: gcc-sdm660: Add missing modem reset
  phy: qcom-qusb2: Add support for SDM630/660
  drivers: usb: dwc3-qcom: Add sdm660 compatible
  drm/msm/dsi: Add phy configuration for SDM630/636/660
  drm/msm/mdp5: Add MDP5 configuration for SDM630
  drm/msm/dsi: Add DSI configuration for SDM660
  drm/msm/mdp5: Add MDP5 configuration for SDM636/660
  clk: qcom: gcc-sdm660: Fix up gcc_mss_mnoc_bimc_axi_clk

Xiaozhe Shi (1):
  soc/qcom: Add REVID driver

 .../devicetree/bindings/display/msm/dsi.txt   |   1 +
 .../bindings/phy/qcom,qusb2-phy.yaml          |   1 +
 .../bindings/soc/qcom/qcom,qpnp-revid.yaml    |  38 ++
 .../devicetree/bindings/usb/qcom,dwc3.yaml    |   1 +
 drivers/clk/qcom/gcc-sdm660.c                 |   4 +
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c      | 198 ++++++++++
 drivers/gpu/drm/msm/dsi/dsi_cfg.c             |  21 +
 drivers/gpu/drm/msm/dsi/dsi_cfg.h             |   1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c         |   2 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h         |   1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c    |  18 +
 drivers/phy/qualcomm/phy-qcom-qusb2.c         |   7 +-
 drivers/soc/qcom/Kconfig                      |   9 +
 drivers/soc/qcom/Makefile                     |   1 +
 drivers/soc/qcom/qpnp-revid.c                 | 288 ++++++++++++++
 drivers/usb/dwc3/dwc3-qcom.c                  |   1 +
 include/dt-bindings/clock/qcom,gcc-sdm660.h   |   1 +
 include/linux/qpnp/qpnp-revid.h               | 369 ++++++++++++++++++
 18 files changed, 961 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,qpnp-revid.yaml
 create mode 100644 drivers/soc/qcom/qpnp-revid.c
 create mode 100644 include/linux/qpnp/qpnp-revid.h

-- 
2.27.0

