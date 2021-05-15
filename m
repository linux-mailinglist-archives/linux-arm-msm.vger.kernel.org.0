Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D2E43818F2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 May 2021 15:12:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229939AbhEONNi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 15 May 2021 09:13:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229571AbhEONNf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 15 May 2021 09:13:35 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2074DC061573
        for <linux-arm-msm@vger.kernel.org>; Sat, 15 May 2021 06:12:21 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id h10so2248511lfm.7
        for <linux-arm-msm@vger.kernel.org>; Sat, 15 May 2021 06:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LWOuVSzGe1Bg26jle07IUN3g0HLvecdChr8/TDnFdlY=;
        b=H+z4a92eObirfZs9Rrw4YwnS68iESpzRiCtDReEgj1k7MxdyuNxCg2L2I0HOkmVJfJ
         hAvQHYeffSZ+QeAMyUcCde46l1oT8Vge748UzkOMxCV7reajxzwm+8ecdcjlBSCqzId+
         vIuoMZp8mBLx1Secl7w5ZjTFl/wRaZAeLi4LR0PvdwrVK7bGEJ3BGTgVRPwMPKt3XpLt
         m7fWPhYd4gdkHpkZdqsU05bijiI+a634UQYzfanMNYwyukZcNTzgsyG/Q7OJ4zpYxouS
         cb4E3xm1uzWZ+0OCLEyHD3hDtfQlF234YUsk039FBr3muK4nA7hthxz1558RK4QzzjZX
         ltyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LWOuVSzGe1Bg26jle07IUN3g0HLvecdChr8/TDnFdlY=;
        b=ECGF9Irn8D22QXbXWEOds7daWNFDdbz7ynUX3sDEtuB8UlaGw+wqbdmfYK7sSXpg1O
         HPiyEXQTixAZoBIQ2pmBqUpE1CzZy1aLWx0vsMl21OXxbXHVNvGWr6yWilHdp4p7GVlv
         aBoCOjK5DCd+L1TUkKKGH+yNWhWRA9jHE3Kjg1SrkrXuv/of5I3SQr9f/sibDBeIkQ5b
         Y9GkwLNsAHVKAyKiG6UMV0y1bnbJp8HisXFSxJMKxblvWVGmr6Xx6kJi4BPEz24C5NrE
         eiLpGR4DoKvLBS5litiinPpevQ1py6w0KTHAwqTCj/br0XpNgfJReH2CWVAA/RiE3+AT
         i1lw==
X-Gm-Message-State: AOAM532+4ytShYyGtyESwS6iLEJogejtG6etpuDNwYgJFneTXRZhPSha
        yHh2H3UG1Nh0Had2bC7GEaT+RQ==
X-Google-Smtp-Source: ABdhPJzpEBkC8T2rG2IN+cGuL5eFjjjPvMZaBnK9PyXO0mKEL9k2xFIFASUS1gWT6foDgeQa79Uzsg==
X-Received: by 2002:a05:6512:3d8c:: with SMTP id k12mr24904422lfv.272.1621084339621;
        Sat, 15 May 2021 06:12:19 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id m4sm2061865ljp.9.2021.05.15.06.12.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 May 2021 06:12:19 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 0/8] dsi: rework clock parents and timing handling
Date:   Sat, 15 May 2021 16:12:09 +0300
Message-Id: <20210515131217.1540412-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch series brings back several patches targeting assigning dispcc
clock parents, that were removed from the massive dsi rework patchset
earlier.

Few notes:
 - assign-clock-parents is a mandatory proprety according to the current
   dsi.txt description.
 - There is little point in duplicating this functionality with the ad-hoc
   implementation in the dsi code.

On top of that come few minor cleanups for the DSI PHY drivers.

I'd kindly ask to bring all dts changes also through the drm tree, so
that there won't be any breakage of the functionality.


The following changes since commit f2f46b878777e0d3f885c7ddad48f477b4dea247:

  drm/msm/dp: initialize audio_comp when audio starts (2021-05-06 16:26:57 -0700)

are available in the Git repository at:

  https://git.linaro.org/people/dmitry.baryshkov/kernel.git dsi-phy-update

for you to fetch changes up to f1fd3b113cbb98febad682fc11ea1c6e717434c2:

  drm/msm/dsi: remove msm_dsi_dphy_timing from msm_dsi_phy (2021-05-14 22:55:11 +0300)

----------------------------------------------------------------
Dmitry Baryshkov (8):
      arm64: dts: qcom: sc7180: assign DSI clock source parents
      arm64: dts: qcom: sdm845: assign DSI clock source parents
      arm64: dts: qcom: sdm845-mtp: assign DSI clock source parents
      arm64: dts: qcom: sm8250: assign DSI clock source parents
      drm/msm/dsi: stop setting clock parents manually
      drm/msm/dsi: phy: use of_device_get_match_data
      drm/msm/dsi: drop msm_dsi_phy_get_shared_timings
      drm/msm/dsi: remove msm_dsi_dphy_timing from msm_dsi_phy

 arch/arm64/boot/dts/qcom/sc7180.dtsi            |  3 ++
 arch/arm64/boot/dts/qcom/sdm845-mtp.dts         |  3 ++
 arch/arm64/boot/dts/qcom/sdm845.dtsi            |  6 +++
 arch/arm64/boot/dts/qcom/sm8250.dtsi            |  6 +++
 drivers/gpu/drm/msm/dsi/dsi.h                   |  7 +---
 drivers/gpu/drm/msm/dsi/dsi_host.c              | 51 -------------------------
 drivers/gpu/drm/msm/dsi/dsi_manager.c           |  8 +---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c           | 46 ++++++++++------------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h           | 10 ++++-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c      | 11 ++----
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c      | 11 ++----
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c      | 10 +----
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c      | 12 ++----
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c | 10 +----
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c       | 13 ++-----
 15 files changed, 67 insertions(+), 140 deletions(-)


