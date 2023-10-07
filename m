Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C6517BC90D
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Oct 2023 18:24:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344032AbjJGQYr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 7 Oct 2023 12:24:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343992AbjJGQYr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 7 Oct 2023 12:24:47 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C20BDB9
        for <linux-arm-msm@vger.kernel.org>; Sat,  7 Oct 2023 09:24:45 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-5333fb34be3so5462294a12.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Oct 2023 09:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696695884; x=1697300684; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vFIriXocAA6Pr+bHRL9FIc9QJhfcR0NHPuOKRd2IbkI=;
        b=lEgyVMnLpUsgUqota0LUmwHw6V+7ATj6cFRuHFa5UEkCIyL1pF4EIlGDvGtIwjnrt6
         tfkVsrnx7p568/La9/r1xpcK/sVLooKsO7/kAC7Uoi/BZywj8vYkqrdAAtKIIgYhDzXF
         WUKxCuuOjl5gEAFdZbF+JmIjD7HgSREdJpsBcBTKagDMdMOvl1UT7tvScFCwaLvoYae1
         maAsx7of05CsXx9nunOS6S25UZQNk0KygYbTOdPQkNA+rTktvAv5WUU/uLnjo8zGO1d5
         qp7vpZNzWzLDLEwNCVReAVqvt53zbneSmRubIanFWY50m4Wivir/BDx1J3AQYEp752ij
         tTwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696695884; x=1697300684;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vFIriXocAA6Pr+bHRL9FIc9QJhfcR0NHPuOKRd2IbkI=;
        b=HXdOj5kJO10vqNGv4+9eK9bP2IniWjGVMjuNjPeOo2Fq37DZ8It1JhhNyQmBugo5rk
         edl6qirCJqN6igSkJffdiNzJvgmIpOptdKEL0e7rggqx9mdsAq42wVVL4aJ56mPd0T6i
         SsFFRxaRrAgFxR1uxRWO+aea141Lpugdbm346+QyOnxaWH73CV673smHCzpWUG3QgTyb
         h07mUL+GmC55fJwObCru8oSvUuc+HAg7Wp+NRXuDI5RC2P9q/VgwQ+sHH5bWdkKT3yfd
         VUfco8SahQ+B+yVOPkWEoWaZ2IA7OfnzReBibB/lEL8YIneixsh8lrIJO2mchO3I96+z
         jolA==
X-Gm-Message-State: AOJu0YzrWm5M8YZsnKqm/CAYWlfxpBj4TD2B8/jp8+41zyhonl1EH1l2
        t9jzLjNsYYpH3fqlV5ai4qBcrPnPaMD1buqJoVE=
X-Google-Smtp-Source: AGHT+IHsD4j1DRc/IkP3+RAGwobooxqBt64YmDAsovbTVmBVaJWqPkWECd69kpfWAN3zIo/dDfY1AkNerWDQ66imRaw=
X-Received: by 2002:a05:6402:1b0e:b0:532:b974:671e with SMTP id
 by14-20020a0564021b0e00b00532b974671emr10209082edb.41.1696695884006; Sat, 07
 Oct 2023 09:24:44 -0700 (PDT)
MIME-Version: 1.0
From:   Rob Clark <robdclark@gmail.com>
Date:   Sat, 7 Oct 2023 09:24:32 -0700
Message-ID: <CAF6AEGv-HNxQ=VBtZ8geGzYJum9jtManEdbvhcjo_WWF_J9Ziw@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-fixes-2023-10-07 for v6.6-rc5
To:     Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Dave,

Late fixes for v6.6, description below.

The following changes since commit ce9ecca0238b140b88f43859b211c9fdfd8e5b70:

  Linux 6.6-rc2 (2023-09-17 14:40:24 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git tags/drm-msm-fixes-2023-10-07

for you to fetch changes up to 10f20628c9b8e924b8046e63b36b2cea4d2c85e4:

  drm/msm/dpu: fail dpu_plane_atomic_check() based on mdp clk limits
(2023-10-05 10:18:10 -0700)

----------------------------------------------------------------
Fixes for v6.6-rc5

- fix to not reset the PHY everytime we start link training but only
  do it if link training fails. Without this, the PLL unlocked
  interrupt fires causing "Unexpected DP AUX IRQ 0x01000000 when
  not busy" spam in the logs since last 2-3 cycles
- correct the highest bank bit to match downstream device tree for
  msm8998
- skip the video mode wait if the timing engine is not enabled. This
  was introduced after pre_enable flag for DSI video mode panels
  where we would end up waiting for the video mode done interrupt
  even before enabling timing engine causing error spam and long
  bootup times.
- check the correct return code of irq_of_parse_and_map() in DSI code
- avoid overflow issues in the dpu bandwidth calculation . This was
  exposed for high resolution displays and a critical fix to avoid
  atomic_check failure
- minor fix to add new lines in DP print messages.
- Fix to fail atomic_check() if the resolution exceeds max mdp clk.
  This leads to underflow otherwise if we try to allow that frame.

----------------------------------------------------------------
Abhinav Kumar (3):
      drm/msm/dsi: skip the wait for video mode done if not applicable
      drm/msm/dpu: change _dpu_plane_calc_bw() to use u64 to avoid overflow
      drm/msm/dpu: fail dpu_plane_atomic_check() based on mdp clk limits

Dan Carpenter (1):
      drm/msm/dsi: fix irq_of_parse_and_map() error checking

Dmitry Baryshkov (1):
      drm/msm/mdss: fix highest-bank-bit for msm8998

Kuogee Hsieh (1):
      drm/msm/dp: do not reinitialize phy unless retry during link training

Stephen Boyd (1):
      drm/msm/dp: Add newlines to debug printks

 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 27 ++++++++++++++++++---------
 drivers/gpu/drm/msm/dp/dp_ctrl.c          | 13 ++++++-------
 drivers/gpu/drm/msm/dp/dp_link.c          |  4 ++--
 drivers/gpu/drm/msm/dsi/dsi_host.c        | 19 +++++++++++++++----
 drivers/gpu/drm/msm/msm_mdss.c            |  2 +-
 5 files changed, 42 insertions(+), 23 deletions(-)
