Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C53865E103
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jan 2023 00:40:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231465AbjADXk4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Jan 2023 18:40:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229759AbjADXkz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Jan 2023 18:40:55 -0500
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com [199.106.114.39])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FBD565CC
        for <linux-arm-msm@vger.kernel.org>; Wed,  4 Jan 2023 15:40:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1672875654; x=1704411654;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ia/LAF4klJ/QUAfmikYV8HEDtOf5+wMLm2ep1L6NUEM=;
  b=IWCdsE0g7ydwHdCoL2GikPhK6Scm+Ddc47EMCjeWXDwEWCu8+2rZmUby
   RTNNFuHkNxGcE2pZIVKCOHe7M8lIRgp7rxLYo73onUkflSCB7YPhFgTRX
   +nFk+6vtf85BBPn1XJ84r3StC3Rq9Hde2uB3YINnrQTMCk5Pru4g2kumg
   s=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 04 Jan 2023 15:40:53 -0800
X-QCInternal: smtphost
Received: from nasanex01b.na.qualcomm.com ([10.46.141.250])
  by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2023 15:40:53 -0800
Received: from JESSZHAN.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Wed, 4 Jan 2023 15:40:50 -0800
From:   Jessica Zhang <quic_jesszhan@quicinc.com>
To:     <freedreno@lists.freedesktop.org>
CC:     Jessica Zhang <quic_jesszhan@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <robdclark@gmail.com>, <seanpaul@chromium.org>,
        <swboyd@chromium.org>, <dmitry.baryshkov@linaro.org>,
        <quic_abhinavk@quicinc.com>, <contact@emersion.fr>,
        <daniel.vetter@ffwll.ch>, <laurent.pinchart@ideasonboard.com>,
        <ppaalanen@gmail.com>, <sebastian.wick@redhat.com>,
        <wayland-devel@lists.freedesktop.org>,
        <ville.syrjala@linux.intel.com>
Subject: [RFC PATCH v3 0/3] Support for Solid Fill Planes
Date:   Wed, 4 Jan 2023 15:40:33 -0800
Message-ID: <20230104234036.636-1-quic_jesszhan@quicinc.com>
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

Introduce and add support for a solid_fill property. When the solid_fill
property is set, and the framebuffer is set to NULL, memory fetch will be
disabled.

In addition, loosen the NULL FB checks within the atomic commit callstack
to allow a NULL FB when the solid_fill property is set and add FB checks
in methods where the FB was previously assumed to be non-NULL.

Finally, have the DPU driver use drm_plane_state.solid_fill and instead of
dpu_plane_state.color_fill, and add extra checks in the DPU atomic commit
callstack to account for a NULL FB in cases where solid_fill is set.

Some drivers support hardware that have optimizations for solid fill
planes. This series aims to expose these capabilities to userspace as
some compositors have a solid fill flag (ex. SOLID_COLOR in the Android
hardware composer HAL) that can be set by apps like the Android Gears
app.

Userspace can set the solid_fill property to a blob containing the
appropriate version number and solid fill color (in RGB323232 format) and
setting the framebuffer to NULL.

Note: Currently, there's only one version of the solid_fill blob property.
However if other drivers want to support a similar feature, but require
more than just the solid fill color, they can extend this feature by
creating additional versions of the drm_solid_fill struct.

Changes in V2:
- Dropped SOLID_FILL_FORMAT property (Simon)
- Switched to implementing solid_fill property as a blob (Simon, Dmitry)
- Changed to checks for if solid_fill_blob is set (Dmitry)
- Abstracted (plane_state && !solid_fill_blob) checks to helper method
  (Dmitry)
- Removed DPU_PLANE_COLOR_FILL_FLAG
- Fixed whitespace and indentation issues (Dmitry)

Changes in V3:
- Fixed some logic errors in atomic checks (Dmitry)
- Introduced drm_plane_has_visible_data() and drm_atomic_check_fb() helper
  methods (Dmitry)

Jessica Zhang (3):
  drm: Introduce solid fill property for drm plane
  drm: Adjust atomic checks for solid fill color
  drm/msm/dpu: Use color_fill property for DPU planes

 drivers/gpu/drm/drm_atomic.c              | 136 +++++++++++++---------
 drivers/gpu/drm/drm_atomic_helper.c       |  34 +++---
 drivers/gpu/drm/drm_atomic_state_helper.c |   9 ++
 drivers/gpu/drm/drm_atomic_uapi.c         |  59 ++++++++++
 drivers/gpu/drm/drm_blend.c               |  17 +++
 drivers/gpu/drm/drm_plane.c               |   8 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |   9 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c |  65 +++++++----
 include/drm/drm_atomic_helper.h           |   5 +-
 include/drm/drm_blend.h                   |   1 +
 include/drm/drm_plane.h                   |  62 ++++++++++
 11 files changed, 302 insertions(+), 103 deletions(-)

-- 
2.38.1

