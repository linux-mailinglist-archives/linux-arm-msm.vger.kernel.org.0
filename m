Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E76A53FBC50
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Aug 2021 20:24:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238631AbhH3SZp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Aug 2021 14:25:45 -0400
Received: from relay07.th.seeweb.it ([5.144.164.168]:51659 "EHLO
        relay07.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238515AbhH3SZp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Aug 2021 14:25:45 -0400
Received: from Marijn-Arch-PC.localdomain (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 0DEA13E7B2;
        Mon, 30 Aug 2021 20:24:48 +0200 (CEST)
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     phone-devel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Pavel Dubrova <pashadubrova@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Andy Gross <agross@kernel.org>,
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
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v2 0/2] Use "ref" clocks from firmware for DSI PLL VCO parent
Date:   Mon, 30 Aug 2021 20:24:43 +0200
Message-Id: <20210830182445.167527-1-marijn.suijten@somainline.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

All DSI PHY/PLL drivers were referencing their VCO parent clock by a
global name, most of which don't exist or have been renamed.  These
clock drivers seem to function fine without that except the 14nm driver
for the sdm6xx [1].

At the same time all DTs provide a "ref" clock as per the requirements
of dsi-phy-common.yaml, but the clock is never used.  This patchset puts
that clock to use without relying on a global clock name, so that all
dependencies are explicitly defined in DT (the firmware) in the end.

[1]: https://lore.kernel.org/linux-arm-msm/386db1a6-a1cd-3c7d-a88e-dc83f8a1be96@somainline.org/

Changes since v1:
  - Dropped "arm: dts: qcom: apq8064: Use 27MHz PXO clock as DSI PLL
    reference" which has made its way into 5.15-fixes in advance of this
    patchset landing in 5.16.
  - Added Fixes: tags for commits that added missing "ref" clocks to DT
    while this firmware clock was never used (until this patchset).
  - Documented missing/wrong and later-added clocks (by aforementioned
    patches) in patch 1/2 more clearly.

Dmitry:
  I have not added the .name="xo" fallback to the 28nm-hpm driver for
  the missing "ref" clock in msm8974 yet.  This patch is supposed to
  make it in for 5.16 while the missing clock should be added in 5.15,
  is that enough time?
  If not I'll gladly respin a v3 with that fallback, but I hope everyone
  can update their DT firmware before that time.  Likewise Bjorn
  acknowledged that there is enough time for the same to happen on
  apq8064.

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

