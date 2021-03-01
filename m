Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB27A32A0EF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Mar 2021 14:31:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235967AbhCBEn4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 23:43:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345622AbhCAX0u (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 18:26:50 -0500
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F71DC061756
        for <linux-arm-msm@vger.kernel.org>; Mon,  1 Mar 2021 15:26:09 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id u4so21606046ljh.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Mar 2021 15:26:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yKDf3QO37bgAs0Xrvk527NLCW0728Tq3GZSclgxPbb4=;
        b=f/qKmhYB12KE9d1JmkLIUYuvF0QzqnjXrHTl42WXoRWJB/k0Q9cUPE3vIEQbY3aL3b
         Xyc+hyX48ABrYsaXdrzZeuGwTTKdlfVFcu0FPCLBeTpUTiYUmdREsund/sz4ZrIGOi3S
         1y15/amRDBnyeDdXx3BRIK+zHOVBYfCjNtp0c7oq9f6u0KP9IqL9pNQotl5Y03SRFKY5
         5mpjl/Fbwv8fgh2vSMExevw47CkX1/8GYvH3IjXz7S+xHILUCYlIBEEUdU0upc33zco3
         EVSFP8oMxMUQ+/4NB3xxpzBoPhvZlhnUNsGHiugcEmtFbfelSmJiDYVJ0+6syFgiNozH
         QHbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yKDf3QO37bgAs0Xrvk527NLCW0728Tq3GZSclgxPbb4=;
        b=il7V7BYGOpJeiUBRBAxEw0ZrYOlDG5aNZDKxsSLx33PeCUMbISbsgjdACVHTDnbWFO
         9q/R6qefSYGBYimUjDVbxnsmT9uvWKMVo7Sq1H08icxztGLFcb2PMqGRxTtg7Ihe+gQZ
         BXHLlZE1DKfWA5wI7ivWiD84V2/b0C9TbEOJkqbP9P3WKImTxmTaQbIa0UvzaU2m7wkc
         OQGggrH31WfIPNIiuZ00b031rXP+kUDCK7aAa5Qq2xgauLprfZC3EKS9MQgPrWXQQPJw
         BiVvLXi4i/S4GJ71dYzma0gn1yN8yJz97/9uFBDruu1nmPC6eBhGt29sf6O3nPk2la7T
         yYBw==
X-Gm-Message-State: AOAM532n5ii5v5A190lOMANeHVey1t9ROekOPn4mVAVcJNMO/kj8VSST
        fC9wIEeHr+5EPwxlHSfyiaDwDA==
X-Google-Smtp-Source: ABdhPJwnByTzd2iAiMVc77lpgPAWpGltVB+jZ16ovZKzkKSZ9cAYy0ubIBSqT98LKT2EdjT4wJfNFw==
X-Received: by 2002:a2e:8e7a:: with SMTP id t26mr10261462ljk.243.1614641167817;
        Mon, 01 Mar 2021 15:26:07 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id b20sm154749lfa.183.2021.03.01.15.26.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Mar 2021 15:26:07 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>
Cc:     Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [RFC 00/24] drm/msm/dsi: refactor MSM DSI PHY/PLL drivers
Date:   Tue,  2 Mar 2021 02:24:43 +0300
Message-Id: <20210301232506.3057401-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This is an RFC attempt to restructure MSM DSI PHY drivers. What started
as an attempt to grok the overcomplicated PHY drivers, has lead up to
the idea of merging PHY and PLL code, reducing abstractions, code
duplication, dropping dead code, etc.

The patches were mainly tested on RB5 (sm8250, 7nm) and lightly tested on RB3
(sdm845, 10nm), DB410c (apq8016, 28nm-lp).

The following changes since commit fe07bfda2fb9cdef8a4d4008a409bb02f35f1bd8:

  Linux 5.12-rc1 (2021-02-28 16:05:19 -0800)

are available in the Git repository at:

  ssh://git@git.linaro.org/people/dmitry.baryshkov/kernel.git dsi-phy-rfc

for you to fetch changes up to 819a9071587f1acba14a6780f422d78fdb55d671:

  arm64: dts: qcom: sdm845: assign DSI clock source parents (2021-03-02 02:23:14 +0300)

----------------------------------------------------------------
Dmitry Baryshkov (24):
      drm/msm/dsi: fuse dsi_pll_* code into dsi_phy_* code
      drm/msm/dsi: drop multiple pll enable_seq support
      drm/msm/dsi: move all PLL callbacks into PHY config struct
      drm/msm/dsi: move min/max PLL rate to phy config
      drm/msm/dsi: remove msm_dsi_pll_set_usecase
      drm/msm/dsi: stop setting clock parents manually
      arm64: dts: qcom: sm8250: assign DSI clock source parents
      drm/msm/dsi: push provided clocks handling into a generic code
      clk: mux: provide devm_clk_hw_register_mux()
      clk: divider: add devm_clk_hw_register_divider
      drm/msm/dsi: use devm_clk_*register to registe DSI PHY clocks
      drm/msm/dsi: use devm_of_clk_add_hw_provider
      drm/msm/dsi: replace PHY's init callback with configurable data
      drm/msm/dsi: make save/restore_state phy-level functions
      drm/msm/dsi: limit vco_delay to 28nm PHY
      drm/msi/dsi: inline msm_dsi_pll_helper_clk_prepare/unprepare
      drm/msm/dsi: make save_state/restore_state callbacks accept msm_dsi_phy
      drm/msm/dsi: drop msm_dsi_pll abstracton
      drm/msm/dsi: drop PLL accessor functions
      drm/msm/dsi: move ioremaps to dsi_phy_driver_probe
      drm/msm/dsi: remove duplicate fields from dsi_pll_Nnm instances
      drm/msm/dsi: remove temp data from global pll structure
      drm/msm/dsi: drop global msm_dsi_phy_type enumaration
      arm64: dts: qcom: sdm845: assign DSI clock source parents

 arch/arm64/boot/dts/qcom/sdm845.dtsi            |    6 +
 arch/arm64/boot/dts/qcom/sm8250.dtsi            |    6 +
 drivers/clk/clk-mux.c                           |   35 +
 drivers/gpu/drm/msm/Kconfig                     |    8 -
 drivers/gpu/drm/msm/Makefile                    |    9 -
 drivers/gpu/drm/msm/dsi/dsi.h                   |   56 +-
 drivers/gpu/drm/msm/dsi/dsi_host.c              |   51 --
 drivers/gpu/drm/msm/dsi/dsi_manager.c           |   18 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c           |  129 +--
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h           |   31 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c      |  741 ++++++++++++++-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c      |  925 ++++++++++++++++++-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c      |    3 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c      |  662 +++++++++++++-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c |  476 +++++++++-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c       |  769 +++++++++++++++-
 drivers/gpu/drm/msm/dsi/pll/dsi_pll.c           |  184 ----
 drivers/gpu/drm/msm/dsi/pll/dsi_pll.h           |  130 ---
 drivers/gpu/drm/msm/dsi/pll/dsi_pll_10nm.c      |  881 ------------------
 drivers/gpu/drm/msm/dsi/pll/dsi_pll_14nm.c      | 1096 -----------------------
 drivers/gpu/drm/msm/dsi/pll/dsi_pll_28nm.c      |  643 -------------
 drivers/gpu/drm/msm/dsi/pll/dsi_pll_28nm_8960.c |  526 -----------
 drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c       |  912 -------------------
 include/linux/clk-provider.h                    |   30 +
 24 files changed, 3678 insertions(+), 4649 deletions(-)
 delete mode 100644 drivers/gpu/drm/msm/dsi/pll/dsi_pll.c
 delete mode 100644 drivers/gpu/drm/msm/dsi/pll/dsi_pll.h
 delete mode 100644 drivers/gpu/drm/msm/dsi/pll/dsi_pll_10nm.c
 delete mode 100644 drivers/gpu/drm/msm/dsi/pll/dsi_pll_14nm.c
 delete mode 100644 drivers/gpu/drm/msm/dsi/pll/dsi_pll_28nm.c
 delete mode 100644 drivers/gpu/drm/msm/dsi/pll/dsi_pll_28nm_8960.c
 delete mode 100644 drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c

