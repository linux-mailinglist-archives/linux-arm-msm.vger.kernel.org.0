Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CF22407838
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Sep 2021 15:27:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238091AbhIKN2W (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 11 Sep 2021 09:28:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238050AbhIKN2T (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 11 Sep 2021 09:28:19 -0400
Received: from relay02.th.seeweb.it (relay02.th.seeweb.it [IPv6:2001:4b7a:2000:18::163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F251FC0613B2
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Sep 2021 06:19:26 -0700 (PDT)
Received: from Marijn-Arch-PC.localdomain (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 776401F50C;
        Sat, 11 Sep 2021 15:19:23 +0200 (CEST)
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Matthias Kaehlcke <mka@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v3 0/2] Use "ref" clocks from firmware for DSI PLL VCO parent
Date:   Sat, 11 Sep 2021 15:19:19 +0200
Message-Id: <20210911131922.387964-1-marijn.suijten@somainline.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

All DSI PHY/PLL drivers were referencing their VCO parent clock by a
global name, most of which don't exist or have been renamed.  These
clock drivers seem to function fine without that except the 14nm driver
for sdm6xx [1].

At the same time all DTs provide a "ref" clock as per the requirements
of dsi-phy-common.yaml, but the clock is never used.  This patchset puts
that clock to use without relying on a global clock name, so that all
dependencies are explicitly defined in DT (the firmware) in the end.

[1]: https://lore.kernel.org/linux-arm-msm/386db1a6-a1cd-3c7d-a88e-dc83f8a1be96@somainline.org/

Changes since v2:
  - Added Stephen's a-b and Angelo's r-bs;
  - Added .name fallback in msm8974's dsi_phy_28nm for a more graceful
    transition period;
  - Documented possible breakage in 1/2 if firmware isn't updated in
    parallel with the kernel.

Changes since v1:
  - Dropped "arm: dts: qcom: apq8064: Use 27MHz PXO clock as DSI PLL
    reference" which has made its way into 5.15-fixes in advance of this
    patchset landing in 5.16;
  - Added Fixes: tags for commits that added missing "ref" clocks to DT
    while this firmware clock was never used (until this patchset);
  - Documented missing/wrong and later-added clocks (by aforementioned
    patches) in patch 1/2 more clearly.

Marijn Suijten (2):
  drm/msm/dsi: Use "ref" fw clock instead of global name for VCO parent
  clk: qcom: gcc-sdm660: Remove transient global "xo" clock

 drivers/clk/qcom/gcc-sdm660.c                   | 14 --------------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c      |  4 +++-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c      |  4 +++-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c      |  4 +++-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c |  4 +++-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c       |  4 +++-
 6 files changed, 15 insertions(+), 19 deletions(-)

--
2.33.0

