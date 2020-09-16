Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 150C026CF5B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Sep 2020 01:13:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726485AbgIPXMH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Sep 2020 19:12:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726309AbgIPXMG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Sep 2020 19:12:06 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0138C061788
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2020 16:12:05 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id o16so250584pjr.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2020 16:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7zoeckgHiloX78Q055Z1g83p0lBAzTk6gPSTOS8omzM=;
        b=jbp2Nl3znPaQytSeJ4C/v2OTY7wcFWAiES2U6a74HHT63/xgW62U8CXz1b85ColYwn
         PDbqUVan+j+QWtSE5egfN59jDJ0O+yaETweuK5y3hFD5HMPdouKdJX5M0Z8WjS3fYGBd
         rnI2pPtIltP2F5U+/pSlWT6/j+siATm0rG2dE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7zoeckgHiloX78Q055Z1g83p0lBAzTk6gPSTOS8omzM=;
        b=g7p5/w1ygHtx0s53k4jL+0kx6HUBu+8IfUx4oBmUpdPGwm2juxteXr6jrCd6n1TjEs
         ZFVQtn2qYMIByDKnmhMSvpHTOAqpVcdDQxD3MVIwwPww8r8YfV1K+Vs7qmAM6xNdV6Nv
         0xtiV9Y1ZJ7cHdRGt0+0viRX0oXke2XZHFkLHKEApTl5QreDuxNvo61ScUTWuslGRfYK
         /EmSccvVFEsmvcSIY+cUifpvv7IuaoKWfZDGLH7366dU7CWjf3r+HuXkyFC8VZa8j0t1
         aELhGywiTkcGpnYeGxRnKE5y4h1/BJqi2FIVUbSbC17tPNCBT7jjF17stfOYPv/OPnYV
         hbQA==
X-Gm-Message-State: AOAM532I1C4lCEF9SqWA8SA5zrQyr3axin4W46J1nkP18mc+2+KuSEWe
        JTUZGIZfuCCvcKl5/a5xtlZpUQ==
X-Google-Smtp-Source: ABdhPJzsTO62WoLQiBM9T8W6Qbpl089M/CnTXEWrDzeZp/dTgzO52aHDkKNbCuf5icxUrAMxZllBmw==
X-Received: by 2002:a17:90b:3409:: with SMTP id kg9mr6148937pjb.122.1600297924974;
        Wed, 16 Sep 2020 16:12:04 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id u6sm3643254pjy.37.2020.09.16.16.12.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2020 16:12:04 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        Vara Reddy <varar@codeaurora.org>,
        Tanmay Shah <tanmay@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        Sean Paul <seanpaul@chromium.org>,
        Rob Clark <robdclark@chromium.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH v4 00/10] Support qcom USB3+DP combo phy (or type-c phy)
Date:   Wed, 16 Sep 2020 16:11:52 -0700
Message-Id: <20200916231202.3637932-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.28.0.618.gf4bc123cb7-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch series is based on v12 of the msm DP driver submission[1]
plus a compliance patch[2]. In the v5 patch series review I suggested
that the DP PHY and PLL be split out of the drm driver and moved to the
qmp phy driver. This patch series does that, but it is still marked as
an RFC because there are a couple more things to do, mostly updating the
DT binding and getting agreement on how to structure the code.

Eventually I believe the qmp phy driver will need to listen for type-c
notifiers or somehow know the type-c pinout being used so this driver
can program things slightly differently. Right now, I don't have any way
to test it though, so I've left it as future work. For some more
details, the DP phy and the USB3 phy share the same physical pins on the
SoC and those pins pretty much line up with a type-c pinout modulo some
CC pins for cable orientation detection logic that lives on the PMIC. So
the DP phy can use all four lanes or it can use two lanes and the USB3
phy can use two lanes. In the hardware designs that I have access to it
is always two lanes for USB3 and two lanes for DP going through what
looks like a type-c pinout so this just hard codes that configuration in
the driver.

Here's the example node that I'm using on sc7180:

	usb_1_qmpphy: phy-wrapper@88e9000 {
		compatible = "qcom,sc7180-qmp-usb3-dp-phy";
		reg = <0 0x088e9000 0 0x18c>, // usb pll (or serdes)
		      <0 0x088e8000 0 0x38>, // dp com
		      <0 0x088ea000 0 0x40>;  // dp pll (or serdes)
		status = "disabled";
		#address-cells = <2>;
		#size-cells = <2>;
		ranges;

		clocks = <&gcc GCC_USB3_PRIM_PHY_AUX_CLK>,
			 <&gcc GCC_USB_PHY_CFG_AHB2PHY_CLK>,
			 <&gcc GCC_USB3_PRIM_CLKREF_CLK>,
			 <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>;
		clock-names = "aux", "cfg_ahb", "ref", "com_aux";

		resets = <&gcc GCC_USB3_PHY_PRIM_BCR>,
			 <&gcc GCC_USB3_DP_PHY_PRIM_BCR>;
		reset-names = "phy", "common";

		usb_1_ssphy: usb3-phy@88e9200 {
			reg = <0 0x088e9200 0 0x128>, // tx0
			      <0 0x088e9400 0 0x200>, // rx0
			      <0 0x088e9c00 0 0x218>, // pcs
			      <0 0x088e9600 0 0x128>, // tx1
			      <0 0x088e9800 0 0x200>, // rx1
			      <0 0x088e9a00 0 0x18>;  // pcs misc
			#clock-cells = <0>;
			#phy-cells = <0>;
			clocks = <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
			clock-names = "pipe0";
			clock-output-names = "usb3_phy_pipe_clk_src";
		};

		dp_phy: dp-phy@88ea200 {
			reg = <0 0x088ea200 0 0x200>, // tx0
			      <0 0x088ea400 0 0x200>, // rx0
			      <0 0x088eaa00 0 0x200>, // dp phy
			      <0 0x088ea600 0 0x200>, // tx1
			      <0 0x088ea800 0 0x200>; // rx1
			#clock-cells = <1>;
			#phy-cells = <0>;
		};
	};

I had to put the serdes register region in the wrapper node and jam the
common area (dp_com) in the middle. Sort of a mess but it was the best I
could do to make the driver changes minimially invasive. I also had to
change the node names to 'usb3-phy' and 'dp-phy' from 'phy' so that I
could differentiate the different phys in the driver. Otherwise the qmp
driver was already mostly prepared for two different phys to sit next to
each other inside the phy wrapper so it was mostly just a chore of
moving code from one place to another.

The last patch in this series rips out the DP PHY and PLL code from the
drm driver and wires in the phy API calls instead. I think Rob Clark has
already staged the last patch, but I sent it again for completeness.  I
can pick the clk patch into clk-next and the phy patches can go via the
phy tree, then everything can meet in linux-next. There are still some
more TODOs in the code but they feel minor enough to fix with more
testing and devices that can exercise those code paths, i.e. connecting
to the type-c subsystem.

Changes from v3 (https://lore.kernel.org/r/20200910004902.2252694-1-swboyd@chromium.org)
 * Added compatible string to first binding patch
 * Checkpatch cleanups

Changes from v2 (https://lore.kernel.org/r/20200902230215.3452712-1-swboyd@chromium.org)
 * Added regs to sc7180 dp struct
 * s/QSERDES_COM_RESETSM_CNTRL/QSERDES_V3_COM_RESETSM_CNTRL/ in
   qcom_qmp_phy_configure_dp_phy()

Changes from v1 (https://lore.kernel.org/r/20200826024711.220080-1-swboyd@chromium.org)
 * New patch for devm_platform_ioremap_resource()
 * Moved serdes tables to sc7180 patch
 * Removed more dead code from drm driver in last patch
 * Reset aux phy is kept around now. Slightly moved where we init the
   phy and setup aux
 * Added a phy_exit() call to last patch so we properly shut down DP on
   disconnect and can work on multiple plugs

Changes from RFC (https://lore.kernel.org/r/20200611091919.108018-1-swboyd@chromium.org)
 * New patch for DT binding
 * Rebased onto latest DP patch series

TODO:
 * Clean up phy power on sequence a bit so that it is done in one place
   instead of two
 * Allow link rate to change after phy is powered on?
 * Make the runtime PM logic detect combo phy and power down both?

Stephen Boyd (10):
  dt-bindings: phy: qcom,qmp-usb3-dp: Add DP phy information
  phy: qcom-qmp: Move phy mode into struct qmp_phy
  phy: qcom-qmp: Remove 'initialized' in favor of 'init_count'
  phy: qcom-qmp: Move 'serdes' and 'cfg' into 'struct qcom_phy'
  phy: qcom-qmp: Get dp_com I/O resource by index
  phy: qcom-qmp: Use devm_platform_ioremap_resource() to simplify
  phy: qcom-qmp: Add support for DP in USB3+DP combo phy
  phy: qcom-qmp: Add support for sc7180 DP phy
  clk: qcom: dispcc: Update DP clk ops for phy design
  drm/msm/dp: Use qmp phy for DP PLL and PHY

 .../bindings/phy/qcom,qmp-usb3-dp-phy.yaml    |   95 +-
 drivers/clk/qcom/clk-rcg2.c                   |   19 +-
 drivers/clk/qcom/dispcc-sc7180.c              |    3 -
 drivers/gpu/drm/msm/Makefile                  |    4 +-
 drivers/gpu/drm/msm/dp/dp_aux.c               |    7 +-
 drivers/gpu/drm/msm/dp/dp_catalog.c           |  287 +----
 drivers/gpu/drm/msm/dp/dp_catalog.h           |    9 +-
 drivers/gpu/drm/msm/dp/dp_ctrl.c              |   48 +-
 drivers/gpu/drm/msm/dp/dp_display.c           |   17 -
 drivers/gpu/drm/msm/dp/dp_display.h           |    3 -
 drivers/gpu/drm/msm/dp/dp_link.c              |    2 +
 drivers/gpu/drm/msm/dp/dp_panel.c             |    1 +
 drivers/gpu/drm/msm/dp/dp_parser.c            |   12 +-
 drivers/gpu/drm/msm/dp/dp_parser.h            |   12 +-
 drivers/gpu/drm/msm/dp/dp_pll.c               |   99 --
 drivers/gpu/drm/msm/dp/dp_pll.h               |   61 -
 drivers/gpu/drm/msm/dp/dp_pll_10nm.c          |  930 ---------------
 drivers/gpu/drm/msm/dp/dp_pll_private.h       |   89 --
 drivers/gpu/drm/msm/dp/dp_power.c             |   39 +-
 drivers/gpu/drm/msm/dp/dp_power.h             |    9 -
 drivers/gpu/drm/msm/dp/dp_reg.h               |  213 ----
 drivers/phy/qualcomm/phy-qcom-qmp.c           | 1053 ++++++++++++++---
 drivers/phy/qualcomm/phy-qcom-qmp.h           |   80 ++
 23 files changed, 1139 insertions(+), 1953 deletions(-)
 delete mode 100644 drivers/gpu/drm/msm/dp/dp_pll.c
 delete mode 100644 drivers/gpu/drm/msm/dp/dp_pll.h
 delete mode 100644 drivers/gpu/drm/msm/dp/dp_pll_10nm.c
 delete mode 100644 drivers/gpu/drm/msm/dp/dp_pll_private.h

Cc: Jeykumar Sankaran <jsanka@codeaurora.org>
Cc: Chandan Uddaraju <chandanu@codeaurora.org>
Cc: Vara Reddy <varar@codeaurora.org>
Cc: Tanmay Shah <tanmay@codeaurora.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Manu Gautam <mgautam@codeaurora.org>
Cc: Sandeep Maheswaram <sanm@codeaurora.org>
Cc: Douglas Anderson <dianders@chromium.org>
Cc: Sean Paul <seanpaul@chromium.org>
Cc: Rob Clark <robdclark@chromium.org>
Cc: Jonathan Marek <jonathan@marek.ca>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: <devicetree@vger.kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>

[1] https://lore.kernel.org/r/20200827211658.27479-1-tanmay@codeaurora.org
[2] https://lore.kernel.org/r/20200827214739.22037-1-khsieh@codeaurora.org

base-commit: d012a7190fc1fd72ed48911e77ca97ba4521bccd
prerequisite-patch-id: aa650e8353e003be0075deea0dee92a82e321432
prerequisite-patch-id: 496af774194db20706fa82eb79f95891c8784952
prerequisite-patch-id: 87e6b1a10063ca350cacd64408024714599a14f4
prerequisite-patch-id: ac467cb99ea60ee186ab9bbe47a3e4d9c13a1313
prerequisite-patch-id: 4eff0531912abbfa748181e90baffba9eb52e295
prerequisite-patch-id: a6970d668b3570f2c10eda99904aa3dfc8fefa1d
-- 
Sent by a computer, using git, on the internet

