Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 002966590D2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Dec 2022 20:19:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231352AbiL2TTC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Dec 2022 14:19:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233335AbiL2TTB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Dec 2022 14:19:01 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD8578FD4
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Dec 2022 11:18:59 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id 1so28743038lfz.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Dec 2022 11:18:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LfRSiUU7kUVFfBn/yyitjedlmqXmIZK52okMfhN2BfA=;
        b=gT3lhM3Bifi9riXVEu3gooBn7WCtYn8k9KbVM/T0J7jp3KGU0DOR4AOiRdjCuHeXCU
         pHGZSgWNeTxwK/4GXvNT664HF4TrC9XcVPq14oW7p4D85lHY1jF4zP+zwWeLANweS8Bk
         WtFNbglASnv29sRMRa9wJDYBbpNXdtdmH46AXoYo95SU6/YxsZGmYMPErzWntI51Eejm
         EB/sPma7uQEkg3LOjIUwJMxLI6OXchbgpNGEZdIFA/C9VZsLp4XF8Jp+5CEYS70d+zNB
         UnjXcUdhivoNjnX39KUekI1ktK1IyQebKrFjP7M/EywQeaTd0PvWvXMVKSQ1feSzdMBL
         PLWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LfRSiUU7kUVFfBn/yyitjedlmqXmIZK52okMfhN2BfA=;
        b=M29NsSGkKRoZtugXoFSV1TGSlhSG/HiyM1lTb8BzQE1Y6+aHEr8Dyxpt3F6p+syyG3
         afXEP06Hu4cIKFiCk9Q5+M9yOyR04YZqTyaAvvK5i7iH2+6O+Sn9LU3zRnpbwXjj2f7Z
         YkQss0Kf+POZlvnTjRPnW3fbib5928N2bkkfWbGh9xqSGs8cgH9Ihbvcr3fF+EKm38B7
         +HGTEBmZ3cCAPZQigflL7s2h9fiQS70sVEVGJog2g1/YqSgRvt/H25LN74GGthCk+ola
         R5621uqAQL5akOMuga+LvII7raas4gy5b5Ru8d+WD71H+SFAntz4VfVHgkkVmEBlA6rI
         Gjjg==
X-Gm-Message-State: AFqh2krrKZw4Dg+6115oSMrtMYOO9qKIczXQUxmpM7XmJ1afCNs0vE/q
        YHLSYhf/hjV5Igysib+vYlBT+g==
X-Google-Smtp-Source: AMrXdXuFpQZs/jqCwM1uA9TwqxOCSHCJeyd7H1H3TzDgTmB5TUUlm/iJ2NhqHBFltsUEFwhJhqGz+w==
X-Received: by 2002:a05:6512:1515:b0:4a4:8a04:4b37 with SMTP id bq21-20020a056512151500b004a48a044b37mr9700717lfb.32.1672341538090;
        Thu, 29 Dec 2022 11:18:58 -0800 (PST)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id t13-20020ac24c0d000000b004cb10c151fasm1162295lfq.88.2022.12.29.11.18.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Dec 2022 11:18:57 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2 00/27] drm/msm/dpu: wide planes support
Date:   Thu, 29 Dec 2022 21:18:29 +0200
Message-Id: <20221229191856.3508092-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

It took me a way longer to finish than I expected. And more patches that
I previously hoped (despite having several patches already being merged
from v1).

This patchset brings in multirect usage to support using two SSPP
rectangles for a single plane. Full virtual planes support is omitted
from this pull request, it will come later.

Abhinav, could you please pick up patch 1 for the -fixes? Otherwise QoS
is not programmed correcly.

Changes since v1 (which was ages ago):
- Rebased on top of 6.2-rc1
- Dropped the controversial _dpu_crtc_blend_setup() split patch
- Renamed dpu_hw_pipe to dpu_hw_sspp
- Other misc changes

Dmitry Baryshkov (27):
  drm/msm/dpu: set pdpu->is_rt_pipe early in
    dpu_plane_sspp_atomic_update()
  drm/msm/dpu: rename struct dpu_hw_pipe to dpu_hw_sspp
  drm/msm/dpu: move SSPP allocation to the RM
  drm/msm/dpu: move SSPP debugfs creation to dpu_kms.c
  drm/msm/dpu: drop EAGAIN check from dpu_format_populate_layout
  drm/msm/dpu: move pipe_hw to dpu_plane_state
  drm/msm/dpu: drop dpu_plane_pipe function
  drm/msm/dpu: introduce struct dpu_sw_pipe
  drm/msm/dpu: use dpu_sw_pipe for dpu_hw_sspp callbacks
  drm/msm/dpu: pass dpu_format to _dpu_hw_sspp_setup_scaler3()
  drm/msm/dpu: move stride programming to
    dpu_hw_sspp_setup_sourceaddress
  drm/msm/dpu: remove dpu_hw_fmt_layout from struct dpu_hw_pipe_cfg
  drm/msm/dpu: drop src_split and multirect check from
    dpu_crtc_atomic_check
  drm/msm/dpu: don't use unsupported blend stages
  drm/msm/dpu: move the rest of plane checks to dpu_plane_atomic_check()
  drm/msm/dpu: drop redundant plane dst check from
    dpu_crtc_atomic_check()
  drm/msm/dpu: add dpu_hw_pipe_cfg to dpu_plane_state
  drm/msm/dpu: simplify dpu_plane_validate_src()
  drm/msm/dpu: rewrite plane's QoS-related functions to take dpu_sw_pipe
    and dpu_format
  drm/msm/dpu: populate SmartDMA features in hw catalog
  drm/msm/dpu: make _dpu_plane_calc_clk accept mode directly
  drm/msm/dpu: rework dpu_plane_sspp_atomic_update()
  drm/msm/dpu: rework dpu_plane_atomic_check()
  drm/msm/dpu: rework plane CSC setting
  drm/msm/dpu: rework static color fill code
  drm/msm/dpu: split pipe handling from _dpu_crtc_blend_setup_mixer
  drm/msm/dpu: add support for wide planes

 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      | 283 ++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c   |  10 +-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |  10 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   | 163 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   | 104 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  18 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     | 735 ++++++++++--------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h     |  20 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c        |  22 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h        |  12 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h     |  25 +-
 11 files changed, 685 insertions(+), 717 deletions(-)

-- 
2.39.0

