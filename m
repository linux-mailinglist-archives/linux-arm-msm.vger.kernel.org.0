Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8AD363C2A9C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jul 2021 23:07:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230116AbhGIVKV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Jul 2021 17:10:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229552AbhGIVKT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Jul 2021 17:10:19 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91233C0613E5
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jul 2021 14:07:34 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id e20so10094131ljn.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jul 2021 14:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=V0Pj5fs6y1i+ayS07/Myij97c/TfTB9e9bw5kHFQa8I=;
        b=Do3HtQ82nTRTNinJXs1skcFcaQgvRoQ1RiU+PMqYBLPZYmHEPkWvczi7c9SEqlpeNR
         6AZlTSFTpkOtajIXVjQH0wC1bnnRk2Q7Y7Xxtg0GA7XYQ2Z/VaUG9Di8ZWckItYaHyHq
         DQbj3LVqxijEFKoru1qyuwMX9PRPAXiIJYBGmcqpOyDTGmUDY88BOajZM1y46H8Mnr0B
         71tP9OBrLqgBTPHBtjlkVyR1fHBqmH5ZrKXmbvDx81wP4wS/sBnp5xj535Bo9YeGQrAc
         Fo8vBaJlLphQ09wIoI46U23MGCMh75nkF7FimcDJ8XYR66wqa0il3cEZRkpNzwyJWw9Z
         /84g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=V0Pj5fs6y1i+ayS07/Myij97c/TfTB9e9bw5kHFQa8I=;
        b=JPefGKFRE4zeBVsgn7s/sC1XhbpJLraG+BDr8Ng6UxMdbhq6LDWfm/3nmO+VxHd52S
         xRzsLXhV7ZS26eNRVUJWFRUpDIiWhCKWE5RF/5DdGv+cSNYTGCVz7jByavegs0c+A9j9
         +EVNE9huX2FXlWvIJJimZwrJW/SLHTL8VTLrFXhTyMdIRxHDPXGoRpx/r+JL+0ewDc9S
         +mLGQpodoeptRIGAAW+rBXMrhW5DVGveiO+i8Cgsa4iaCH2d4H8ntID6YTlJVjwj3EYN
         ovjPVmYmEFFbTTFDE2e2o3CsUqW4hRRSkW20et7OVEzcKbbuaP4Cb/S9ZNS0F1VOREHK
         CvVg==
X-Gm-Message-State: AOAM533ESJWkzl9ROTjwy5DRGHFzNSgO4NNYac8nuKnThNTaVZtSzMPo
        Y32X9+jnWE/mv0o2fZ6fqREsIg==
X-Google-Smtp-Source: ABdhPJx2hU6nkZH9hGkm3rh9KaX1jGm43K58snE62B+a2YdIn1sFqE2vg0qnzFdJpfNHVOXHdUJISQ==
X-Received: by 2002:a2e:95d5:: with SMTP id y21mr13238967ljh.416.1625864852713;
        Fri, 09 Jul 2021 14:07:32 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id n15sm590625lfh.70.2021.07.09.14.07.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 14:07:32 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org
Subject: [PATCH v2 0/8] dsi: rework clock parents and timing handling
Date:   Sat, 10 Jul 2021 00:07:21 +0300
Message-Id: <20210709210729.953114-1-dmitry.baryshkov@linaro.org>
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

The patchset was tested on RB3 (single DSI), RB5 (single DSI, two
independent DSI, bonded DSI, two last configs require additional patches
which do not concern the DSI timings code).

Changes since v1:
 - add dt-bindings change
 - drop the patch removing msm_dsi_dphy_timing

The following changes since commit e88bbc91849b2bf57683119c339e52916d34433f:

  Revert "drm/msm/mdp5: provide dynamic bandwidth management" (2021-06-23 14:06:20 -0700)

are available in the Git repository at:

  https://git.linaro.org/people/dmitry.baryshkov/kernel.git dsi-phy-update

for you to fetch changes up to a79d84d8eac721a7ebaf3cfc65b200077b1d6947:

  drm/msm/dsi: drop msm_dsi_phy_get_shared_timings (2021-07-10 00:02:18 +0300)

----------------------------------------------------------------
Dmitry Baryshkov (8):
      dt-bindings: display: msm: dsi-controller-main: restore assigned-clocks
      arm64: dts: qcom: sc7180: assign DSI clock source parents
      arm64: dts: qcom: sdm845: assign DSI clock source parents
      arm64: dts: qcom: sdm845-mtp: assign DSI clock source parents
      arm64: dts: qcom: sm8250: assign DSI clock source parents
      drm/msm/dsi: stop setting clock parents manually
      drm/msm/dsi: phy: use of_device_get_match_data
      drm/msm/dsi: drop msm_dsi_phy_get_shared_timings

 .../bindings/display/msm/dsi-controller-main.yaml  | 17 ++++++++
 arch/arm64/boot/dts/qcom/sc7180.dtsi               |  3 ++
 arch/arm64/boot/dts/qcom/sdm845-mtp.dts            |  3 ++
 arch/arm64/boot/dts/qcom/sdm845.dtsi               |  6 +++
 arch/arm64/boot/dts/qcom/sm8250.dtsi               |  6 +++
 drivers/gpu/drm/msm/dsi/dsi.h                      |  7 +--
 drivers/gpu/drm/msm/dsi/dsi_host.c                 | 51 ----------------------
 drivers/gpu/drm/msm/dsi/dsi_manager.c              |  8 +---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c              | 34 ++++-----------
 9 files changed, 47 insertions(+), 88 deletions(-)


