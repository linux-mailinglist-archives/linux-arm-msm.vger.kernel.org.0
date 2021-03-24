Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40A71347C2C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Mar 2021 16:20:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236546AbhCXPTj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Mar 2021 11:19:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236526AbhCXPTK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Mar 2021 11:19:10 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B787C061763
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Mar 2021 08:19:07 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id o126so23037296lfa.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Mar 2021 08:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tk201XK0GsgCw2z2W2qK3LFMVQT+0BnMz/tqU+2avqI=;
        b=u9N/Sj5afQG8CJSXVMiyXWwyTqjsexPwrnBD7G3Y+pkl4ZCYhlNcg7DXojl0swbOnK
         IBgyjzy7J9RGN7OKBGx0D0zELukt+Q94oTCjeMOpAqj07ZUUXeCuZf1hA49OswEgZEOH
         oqv7N+MjOdkpfwaxSVPJae3QQYseoUFj51PTv2Kl21GGE6sMxSP7BWDwN6OTHyIWUJrj
         7mgE8hD96osLkTOqmdZfwdsAAmsem56lV3pwPN+FRU4I28CRExn8LVOe/5SBdyCvyyae
         M/x2xwEVJFcjw6YlUPGCcEAMphxtFg1Ujz7zKMUBK/nwlABeYi5bZCv0aA3Iv5BwGlIY
         A2Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tk201XK0GsgCw2z2W2qK3LFMVQT+0BnMz/tqU+2avqI=;
        b=EM7aQ+hFsIixh2kB+JSAwEEk8KvZFyNMc5FWrzlvexpBhUz1P1ER2O2qcKaDvll0iu
         aYchpTp+UlyQ0G2uKEQqJwjAQJGn2n3SUdOW0pG2QIBaplOrZ6ubsG7BXeOmUOUZujDX
         JbtB7RZif7pCeU4DuF1jv+dn2T+ik3ThVDcacPhiVwbtcZjg2eJWy8dJlriWTvhnqCbW
         dkeJwWxdQKQZTFg5p6VUIFFTEtktpnaq0cBv8lGG9+nr0nO3VfNy/Dvo1WNTqikF5f3S
         mb/gOWS0yjAdPoOL/+bigTVDiPPr+GCO9l4JLo0vSjx1ddejQlDY1OS2kZJyqzFfCuQl
         LSLw==
X-Gm-Message-State: AOAM533yXADBYImefmgtZX4dviFk0lu2IMr3OHndmtDyBB1eabbv5xtO
        pwLVrPtltAAECuWWbYb5ixcLeg==
X-Google-Smtp-Source: ABdhPJzubbcVNRPYMGpCD+9JZnn8dZ+ory2gYhWQAdH1sr669SIMX31yypo+z5GBv3rmF8Oj+5eOhg==
X-Received: by 2002:ac2:4e8c:: with SMTP id o12mr2300931lfr.400.1616599146090;
        Wed, 24 Mar 2021 08:19:06 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id d22sm255199lfm.267.2021.03.24.08.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 08:19:05 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v2 00/28] drm/msm/dsi: refactor MSM DSI PHY/PLL drivers
Date:   Wed, 24 Mar 2021 18:18:18 +0300
Message-Id: <20210324151846.2774204-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Restructure MSM DSI PHY drivers. What started as an attempt to grok the
overcomplicated PHY drivers, has lead up to the idea of merging PHY and
PLL code, reducing abstractions, code duplication, dropping dead code,
etc.

The patches were mainly tested on RB5 (sm8250, 7nm) and DB410c (apq8016,
28nm-lp) and lightly tested on RB3 (sdm845, 10nm).

External dependency for sm8250: https://lore.kernel.org/linux-arm-msm/20210317144039.556409-10-dmitry.baryshkov@linaro.org/

The patch 'clk: fixed: add devm helper for clk_hw_register_fixed_factor()'
is already a part of mainline as of 5.12-rc1, but is included here for
completeness to fix compilation issues (as msm-next is based on 5.11-rc5).

Changes since v1:
 - Rebase on top of msm/msm-next
 - Reorder patches to follow logical sequence
 - Add sc7180 clocks assignment
 - Drop sm8250 clocks assignment, as respective file is not updated in
   msm/msm-next

Changes since RFC:
 - Reorder patches to move global clock patches in the beginning and
   dtsi patches where they are required.
 - remove msm_dsi_phy_set_src_pll() and guess src_pll_id using PHY usecase.

The following changes since commit 627dc55c273dab308303a5217bd3e767d7083ddb:

  drm/msm/disp/dpu1: icc path needs to be set before dpu runtime resume (2021-03-22 18:52:34 -0700)

are available in the Git repository at:

  https://git.linaro.org/people/dmitry.baryshkov/kernel.git dsi-phy-2

for you to fetch changes up to 0fec912264e9ee8f0ebbad12e2711843d7d9e0ac:

  drm/msm/dsi: stop passing src_pll_id to the phy_enable call (2021-03-24 18:14:39 +0300)

----------------------------------------------------------------
Daniel Palmer (1):
      clk: fixed: add devm helper for clk_hw_register_fixed_factor()

Dmitry Baryshkov (27):
      clk: mux: provide devm_clk_hw_register_mux()
      clk: divider: add devm_clk_hw_register_divider
      drm/msm/dsi: replace PHY's init callback with configurable data
      drm/msm/dsi: fuse dsi_pll_* code into dsi_phy_* code
      drm/msm/dsi: drop multiple pll enable_seq support
      drm/msm/dsi: move all PLL callbacks into PHY config struct
      drm/msm/dsi: drop global msm_dsi_phy_type enumaration
      drm/msm/dsi: move min/max PLL rate to phy config
      drm/msm/dsi: remove msm_dsi_pll_set_usecase
      drm/msm/dsi: stop setting clock parents manually
      arm64: dts: qcom: sdm845: assign DSI clock source parents
      arm64: dts: qcom: sc7180: assign DSI clock source parents
      drm/msm/dsi: push provided clocks handling into a generic code
      drm/msm/dsi: use devm_clk_*register to registe DSI PHY clocks
      drm/msm/dsi: use devm_of_clk_add_hw_provider
      drm/msm/dsi: make save/restore_state phy-level functions
      drm/msm/dsi: drop vco_delay setting from 7nm, 10nm, 14nm drivers
      drm/msm/dpu: simplify vco_delay handling in dsi_phy_28nm driver
      drm/msi/dsi: inline msm_dsi_pll_helper_clk_prepare/unprepare
      drm/msm/dsi: make save_state/restore_state callbacks accept msm_dsi_phy
      drm/msm/dsi: drop msm_dsi_pll abstracton
      drm/msm/dsi: drop PLL accessor functions
      drm/msm/dsi: move ioremaps to dsi_phy_driver_probe
      drm/msm/dsi: remove duplicate fields from dsi_pll_Nnm instances
      drm/msm/dsi: remove temp data from global pll structure
      drm/msm/dsi: inline msm_dsi_phy_set_src_pll
      drm/msm/dsi: stop passing src_pll_id to the phy_enable call

 arch/arm64/boot/dts/qcom/sc7180.dtsi            |    3 +
 arch/arm64/boot/dts/qcom/sdm845.dtsi            |    6 +
 drivers/clk/clk-fixed-factor.c                  |   39 +-
 drivers/clk/clk-mux.c                           |   35 +
 drivers/gpu/drm/msm/Kconfig                     |    8 -
 drivers/gpu/drm/msm/Makefile                    |    9 -
 drivers/gpu/drm/msm/dsi/dsi.h                   |   58 +-
 drivers/gpu/drm/msm/dsi/dsi_host.c              |   51 --
 drivers/gpu/drm/msm/dsi/dsi_manager.c           |   29 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c           |  150 ++--
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h           |   41 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c      |  745 ++++++++++++++-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c      |  939 ++++++++++++++++++-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c      |   16 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c      |  654 +++++++++++++-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c |  479 +++++++++-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c       |  772 +++++++++++++++-
 drivers/gpu/drm/msm/dsi/pll/dsi_pll.c           |  184 ----
 drivers/gpu/drm/msm/dsi/pll/dsi_pll.h           |  132 ---
 drivers/gpu/drm/msm/dsi/pll/dsi_pll_10nm.c      |  881 ------------------
 drivers/gpu/drm/msm/dsi/pll/dsi_pll_14nm.c      | 1096 -----------------------
 drivers/gpu/drm/msm/dsi/pll/dsi_pll_28nm.c      |  643 -------------
 drivers/gpu/drm/msm/dsi/pll/dsi_pll_28nm_8960.c |  526 -----------
 drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c       |  913 -------------------
 include/linux/clk-provider.h                    |   34 +-
 25 files changed, 3722 insertions(+), 4721 deletions(-)
 delete mode 100644 drivers/gpu/drm/msm/dsi/pll/dsi_pll.c
 delete mode 100644 drivers/gpu/drm/msm/dsi/pll/dsi_pll.h
 delete mode 100644 drivers/gpu/drm/msm/dsi/pll/dsi_pll_10nm.c
 delete mode 100644 drivers/gpu/drm/msm/dsi/pll/dsi_pll_14nm.c
 delete mode 100644 drivers/gpu/drm/msm/dsi/pll/dsi_pll_28nm.c
 delete mode 100644 drivers/gpu/drm/msm/dsi/pll/dsi_pll_28nm_8960.c
 delete mode 100644 drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c


