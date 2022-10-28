Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F6A5611DD7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Oct 2022 01:00:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229457AbiJ1XAP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Oct 2022 19:00:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbiJ1XAN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Oct 2022 19:00:13 -0400
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com [199.106.114.39])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52F028A1D2
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Oct 2022 16:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1666998012; x=1698534012;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=PoDeQEWu7Czj0YF5666wI+2wnzELwAHNeXJptcuiyRE=;
  b=LTswwROVIB1TVuGkpoUOYdAyPMKjbIfiisnUPVjWxyzA4IEcWdmpAn88
   YfNLDl8LfOOLazuQ2mtBQ6g0uzMECFVPaLebtND8RQ7o2InLE5QVasNoN
   i/NbK/TM63GEvyaGUBbdv3/Q6BG6QgN7Mqo8vwPuFGBnOPUNEJ9u4hfVd
   4=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 28 Oct 2022 16:00:08 -0700
X-QCInternal: smtphost
Received: from nasanex01b.na.qualcomm.com ([10.46.141.250])
  by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2022 16:00:08 -0700
Received: from JESSZHAN.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Fri, 28 Oct 2022 16:00:08 -0700
From:   Jessica Zhang <quic_jesszhan@quicinc.com>
To:     <freedreno@lists.freedesktop.org>
CC:     Jessica Zhang <quic_jesszhan@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <robdclark@gmail.com>, <seanpaul@chromium.org>,
        <swboyd@chromium.org>, <dmitry.baryshkov@linaro.org>,
        <quic_abhinavk@quicinc.com>, <contact@emersion.fr>,
        <daniel.vetter@ffwll.ch>, <laurent.pinchart@ideasonboard.com>
Subject: [RFC PATCH 0/3] Support for Solid Fill Planes
Date:   Fri, 28 Oct 2022 15:59:49 -0700
Message-ID: <20221028225952.160-1-quic_jesszhan@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Introduce and add support for COLOR_FILL and COLOR_FILL_FORMAT
properties. When the color fill value is set, and the framebuffer is set
to NULL, memory fetch will be disabled.

In addition, loosen the NULL FB checks within the atomic commit callstack
to allow a NULL FB when color_fill is nonzero and add FB checks in
methods where the FB was previously assumed to be non-NULL.

Finally, have the DPU driver use drm_plane_state.color_fill and
drm_plane_state.color_fill_format instead of dpu_plane_state.color_fill,
and add extra checks in the DPU atomic commit callstack to account for a
NULL FB in cases where color_fill is set.

Some drivers support hardware that have optimizations for solid fill
planes. This series aims to expose these capabilities to userspace as
some compositors have a solid fill flag (ex. SOLID_COLOR in the Android
hardware composer HAL) that can be set by apps like the Android Gears
app.

Userspace can set the color_fill value by setting COLOR_FILL_FORMAT to a
DRM format, setting COLOR_FILL to a color fill value, and setting the
framebuffer to NULL.

Jessica Zhang (3):
  drm: Introduce color fill properties for drm plane
  drm: Adjust atomic checks for solid fill color
  drm/msm/dpu: Use color_fill property for DPU planes

 drivers/gpu/drm/drm_atomic.c              | 68 ++++++++++++-----------
 drivers/gpu/drm/drm_atomic_helper.c       | 34 +++++++-----
 drivers/gpu/drm/drm_atomic_uapi.c         |  8 +++
 drivers/gpu/drm/drm_blend.c               | 38 +++++++++++++
 drivers/gpu/drm/drm_plane.c               |  8 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  7 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 66 ++++++++++++++--------
 include/drm/drm_atomic_helper.h           |  5 +-
 include/drm/drm_blend.h                   |  2 +
 include/drm/drm_plane.h                   | 28 ++++++++++
 10 files changed, 188 insertions(+), 76 deletions(-)

-- 
2.38.0

