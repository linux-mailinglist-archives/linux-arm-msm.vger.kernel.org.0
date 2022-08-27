Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C50F75A3832
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Aug 2022 16:53:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233269AbiH0Ow6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 27 Aug 2022 10:52:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233187AbiH0Owx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 27 Aug 2022 10:52:53 -0400
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com [IPv6:2001:4860:4864:20::34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F3D023BF1
        for <linux-arm-msm@vger.kernel.org>; Sat, 27 Aug 2022 07:52:52 -0700 (PDT)
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-11d2dcc31dbso5599704fac.7
        for <linux-arm-msm@vger.kernel.org>; Sat, 27 Aug 2022 07:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc;
        bh=ENmTEz2sdDhPaUZ1YuMYFzj0qZyorVVrht0Q7zVdl5A=;
        b=fakL+gb4E+NtO3ziLxu6HuOpkO2QrjQpPe1EVZfpWbzH1HcwGI68uVScTaQT3nVfot
         te93JwTHEON9VLtXHqfmz4mbAzimgcNYXt+qnZOEQXAEcgyIcdDAqrq6Ea50SXBOQZIX
         wa4pahhhhrQNV4zWXd1keaPg2JRUa8JaFHD+ESqFAavwRQnm5yabmSk+kkVUORI/gut8
         7fRBJ6ozmmGUvbpAwJlREqcsTo//MN4QYq0vy7xp4TUFqUfDs6UgnjwC5Lnj8uYNa3Wi
         F1wBbsQI/XLBHM3dPLX9Cx0Cyxk34imk2OaV4cT+jTQHW5YXUnGGpW4vKUW+80NJCTsa
         kufw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc;
        bh=ENmTEz2sdDhPaUZ1YuMYFzj0qZyorVVrht0Q7zVdl5A=;
        b=0Uchf+2CXw+N7RJKZzZ77EaOPYrzgUFV54mB+8CgNE8JjjDxtGrPVQ2dMjPR+zAkfv
         QLatBb3GkJIZj5StGPprTSM4JE7f92DNh4MLxDEmDJMOzz/x7s2JUPSY700DN6CsX8pz
         OAlbgOfUHhBvqsu8TZKvNrhc0FYotxNvpQoOfwRXkBM3H6n+LwWK03CfrJpdRhEOpych
         eZn5lG6NI8SWUTLfHl//zX9tzRR+1STzLIPPhlcBAOQLZBU4qsTuh9NW/lXj6rBvCr0P
         WfNWhYy/cr1icdkqBUU0RMmiy/oGc0VxtiFA7uiDj4joxpQeFfbmWfgouy4ljN0EAwDO
         Wiaw==
X-Gm-Message-State: ACgBeo3ivpEUN6yG0SqnGNWpgatVt2QNBxrD5QmsPsV2MEHvj/HaZERo
        vyk9RAAOCUICRG3ZRxGbwugU8aKEyfMRCnV5trdKA+pLUQU=
X-Google-Smtp-Source: AA6agR6xFP1IuWf9MCarhROFl12ZJ69qAgM3HKlcNhwJmBXJWgSZZ8VoaeuW7OLYEGjbjMsVVrUAevhz2rw83amLtDE=
X-Received: by 2002:a05:6871:825:b0:11e:8862:d5f5 with SMTP id
 q37-20020a056871082500b0011e8862d5f5mr2679762oap.183.1661611971709; Sat, 27
 Aug 2022 07:52:51 -0700 (PDT)
MIME-Version: 1.0
From:   Rob Clark <robdclark@gmail.com>
Date:   Sat, 27 Aug 2022 07:53:27 -0700
Message-ID: <CAF6AEGvwuAN2ekr4o-RybqSnUSmJm_Watu4kBztnddE9brqmiA@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-fixes-2022-08-27 for v6.0
To:     Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc:     freedreno <freedreno@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Dave,

A few fixes for the v6.0 cycle.  I meant to send this a bit earlier
but ended up at the bottom of other rabbit holes.  Summary below (and
in tag msg)

The following changes since commit cb77085b1f0a86ef9dfba86b5f3ed6c3340c2ea3:

  drm/msm/dpu: Fix for non-visible planes (2022-07-08 08:10:58 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git tags/drm-msm-fixes-2022-08-27

for you to fetch changes up to 174974d8463b77c2b4065e98513adb204e64de7d:

  drm/msm/rd: Fix FIFO-full deadlock (2022-08-15 10:19:53 -0700)

----------------------------------------------------------------
Fixes for v6.0

- Fix for inconsistent indenting in function msm_dsi_dphy_timing_calc_v3.
  This fixes a smatch warning reported by kbot
- Fix to make eDP the first connector in the connected list. This was
  mainly done to address a screen corruption issue we were seeing on
  sc7280 boards which have eDP as the primary display. The corruption
  itself is from usermode but we decided to fix it this way because
  things work correct with the primary display as the first one for
  usermode
- Fix to populate intf_cfg correctly before calling reset_intf_cfg().
  Without this, the display pipeline is not torn down correctly for
  writeback
- Specify the correct number of DSI regulators for SDM660. It should
  have been 1 but 2 was mentioned
- Specify the correct number of DSI regulators for MSM8996. It should
  have been 3 but 2 was mentioned
- Fix for removing DP_RECOVERED_CLOCK_OUT_EN bit for tps4 link training
  for DP. This was causing link training failures and hence no display
  for a specific DP to HDMI cable on chromebooks
- Fix probe-deferral crash in gpu devfreq
- Fix gpu debugfs deadlock

----------------------------------------------------------------
Abhinav Kumar (1):
      drm/msm/dpu: populate wb or intf before reset_intf_cfg

Bjorn Andersson (1):
      drm/msm/gpu: Drop qos request if devm_devfreq_add_device() fails

Douglas Anderson (2):
      drm/msm/dsi: Fix number of regulators for msm8996_dsi_cfg
      drm/msm/dsi: Fix number of regulators for SDM660

Kuogee Hsieh (2):
      drm/msm/dp: make eDP panel as the first connected connector
      drm/msm/dp: delete DP_RECOVERED_CLOCK_OUT_EN to fix tps4

Rob Clark (1):
      drm/msm/rd: Fix FIFO-full deadlock

sunliming (1):
      drm/msm/dsi: fix the inconsistent indenting

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 6 ++++++
 drivers/gpu/drm/msm/dp/dp_ctrl.c            | 2 +-
 drivers/gpu/drm/msm/dsi/dsi_cfg.c           | 4 ++--
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c       | 2 +-
 drivers/gpu/drm/msm/msm_drv.c               | 2 ++
 drivers/gpu/drm/msm/msm_gpu_devfreq.c       | 2 ++
 drivers/gpu/drm/msm/msm_rd.c                | 3 +++
 7 files changed, 17 insertions(+), 4 deletions(-)
