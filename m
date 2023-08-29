Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7084E78BBEE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Aug 2023 02:07:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233625AbjH2AGx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Aug 2023 20:06:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234251AbjH2AG0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Aug 2023 20:06:26 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D44D13D;
        Mon, 28 Aug 2023 17:06:23 -0700 (PDT)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37SNUYEm024832;
        Tue, 29 Aug 2023 00:05:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : subject :
 date : message-id : mime-version : content-type :
 content-transfer-encoding : to : cc; s=qcppdkim1;
 bh=8FWLKSjdY1HBJYSTTPkNfsS2gVlIqvdCJrm7Dd6uDeY=;
 b=lt797WWe/Dcw45ToONmgi1tWKdlQ/F4KQmG0gRLKG8hvnWW4yrmbKbesXd1LQ2ZYz1yb
 2E2abKaM2EIMy+2Qv4qJm6bqGTnuMXk1/nCQsjcT2dkKzjloT+jpodemQOJMv/ZZn3G2
 GKEFSmepgRS+GwKsqAvLTZEN7ZyFEQKwyfm8hupvl9Ih+eFl5ubKWDYqAs+Yv7K+JVtK
 DwMQwE2Ji2bjhBY9xk0AQlJmSwvyY8t3AUhLtyLoKgB3QsS2Ei/y4D6EuFveGzPD6aAB
 q0wC9kuUdG2GJeBBWxQLKbIxxBgTNGIg2U+BWz7WC1N6jVlAvhUzFggC1KHYvkgC/BRw MA== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3sq9m8vykg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 29 Aug 2023 00:05:44 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
        by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 37T05hiu017382
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 29 Aug 2023 00:05:43 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Mon, 28 Aug 2023 17:05:43 -0700
From:   Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: [PATCH RFC v6 00/10] Support for Solid Fill Planes
Date:   Mon, 28 Aug 2023 17:05:06 -0700
Message-ID: <20230828-solid-fill-v6-0-a820efcce852@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADI27WQC/2XOz07DMAwG8FeZcsaTm39lnJCQeACuCKE0calRm
 0IyqsHUdyfNZRocP1s/fz6LTIkpi7vdWSRaOPMcS7A3O+EHF98IOJQsJEqFGjXkeeQAPY8joMH
 GNq0JnbKigM5lgi656IeNTHmCSKfjtvpI1POp9jyLp8cH8VKGA+fjnL5r99LUVa1pUEulUdm9V
 RYa+Pxi//pOOf+Uj+63xNHv/TzVK4u+yD8PLhoQek0evXOtluE/NhfcytsrbApGo0JHvTvgwV/
 jdV1/AW72tiI9AQAA
To:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        "Sean Paul" <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>
CC:     <quic_abhinavk@quicinc.com>, <ppaalanen@gmail.com>,
        <contact@emersion.fr>, <laurent.pinchart@ideasonboard.com>,
        <sebastian.wick@redhat.com>, <ville.syrjala@linux.intel.com>,
        <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <freedreno@lists.freedesktop.org>,
        <wayland-devel@lists.freedesktop.org>,
        Jessica Zhang <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.13-dev-83828
X-Developer-Signature: v=1; a=ed25519-sha256; t=1693267542; l=7054;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=3A4V/NphWx2dp96KKozhxqsfSYYTYJbF2vq7zhJRj5U=;
 b=7KG97hOAaLEJEXJU+BNRl2hVzWViroAeEfLy/XCLbXWsTduQPkXh0ahYXg6S0qGMdVwjPXJgF
 7pih1VS+6R2DZB8VM0zf3B5nb1ud5Gxp2urC/LS0zliQErLyEmKGe2f
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: XX76qmdD0JuXsL4HQiBW8fU0JZG6PWRh
X-Proofpoint-GUID: XX76qmdD0JuXsL4HQiBW8fU0JZG6PWRh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-28_19,2023-08-28_04,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 bulkscore=0 clxscore=1015 mlxscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 lowpriorityscore=0 mlxlogscore=999
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2308280207
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Some drivers support hardware that have optimizations for solid fill
planes. This series aims to expose these capabilities to userspace as
some compositors have a solid fill flag (ex. SOLID_COLOR in the Android
hardware composer HAL) that can be set by apps like the Android Gears
app.

In order to expose this capability to userspace, this series will:

- Introduce solid_fill and pixel_source properties to allow userspace to
  toggle between FB and solid fill sources
- Loosen NULL FB checks within the DRM atomic commit callstack to allow
  for NULL FB when solid fill is enabled.
- Add NULL FB checks in methods where FB was previously assumed to be
  non-NULL
- Have MSM DPU driver use drm_plane_state.solid_fill instead of
  dpu_plane_state.color_fill

Note: The solid fill planes feature depends on both the solid_fill *and*
pixel_source properties.

To use this feature, userspace can set the solid_fill property to a blob
containing the appropriate version number and solid fill color (in
RGB323232 format) and and setting the pixel_source property to
DRM_PLANE_PIXEL_SOURCE_COLOR. This will disable memory fetch and the
resulting plane will display the color specified by the solid_fill blob.

Currently, there's only one version of the solid_fill blob property.
However if other drivers want to support a similar feature, but require
more than just the solid fill color, they can extend this feature by
creating additional versions of the drm_solid_fill struct.

This 2 property approach was chosen because passing in a special 1x1 FB
with the necessary color information would have unecessary overhead that
does not reflect the behavior of the solid fill feature. In addition,
assigning the solid fill blob to FB_ID would require loosening some core
drm_property checks that might cause unwanted side effects elsewhere.

---
Changes in v6:
- Have _dpu_plane_color_fill() take in a single ABGR8888 color instead
  of having separate alpha and BGR color parameters (Dmitry)
- Drop plane->state->pixel_source != DRM_PLANE_PIXEL_SOURCE_FB check
  in SetPlane ioctl (Dmitry)
- Add DRM_PLANE_PIXEL_SOURCE_NONE as a default pixel source (Sebastian)
- Dropped versioning from solid fill property blob (Dmitry)
- Use DRM_ENUM_NAME_FN (Dmitry)
- Use drm_atomic_replace_property_blob_from_id() (Dmitry)
- drm_atomic_check_fb -> drm_atomic_plane_check_fb (Dmitry)
- Group redundant NULL FB checks (Dmitry)
- Squashed drm_plane_needs_disable() implementation with 
  DRM_PLANE_PIXEL_SOURCE_NONE declaration (Sebastian)
- Add comment to support RGBA solid fill color in the future (Dmitry)
- Link to v5: https://lore.kernel.org/r/20230728-solid-fill-v5-0-053dbefa909c@quicinc.com

Changes in v5:
- Added support for PIXEL_SOURCE_NONE (Sebastian)
- Added WARN_ON() in drm_plane_has_visible_data() if pixel_source isn't
  set (Dmitry)
- Added debugfs support for both properties (Dmitry)
- Corrected u32 to u8 conversion (Pekka)
- Moved drm_solid_fill_info struct and related documentation to
  include/uapi (Pekka)
- Changed drm_solid_fill_info.version to __u32 for data alignment (Pekka)
- Added more detailed UAPI and kernel documentation (Pekka)
- Reordered patch series so that the pixel_source property is introduced
  before solid_fill (Dmitry)
- Fixed inconsistent ABGR8888/RGBA8888 format declaration (Pekka)
- Reset pixel_source to FB in drm_mode_setplane() (Dmitry)
- Rename supported_sources to extra_sources (Dmitry)
- Only destroy old solid_fill blob state if new state is valid (Pekka)
- Link to v4: https://lore.kernel.org/r/20230404-solid-fill-v4-0-f4ec0caa742d@quicinc.com

Changes in v4:
- Rebased onto latest kernel
- Reworded cover letter for clarity (Dmitry)
- Reworded commit messages for clarity
- Split existing changes into smaller commits
- Added pixel_source enum property (Dmitry, Pekka, Ville)
- Updated drm-kms comment docs with pixel_source and solid_fill
  properties (Dmitry)
- Inlined drm_atomic_convert_solid_fill_info() (Dmitry)
- Passed in plane state alpha value to _dpu_plane_color_fill_pipe()
- Link to v3: https://lore.kernel.org/r/20230104234036.636-1-quic_jesszhan@quicinc.com

Changes in v3:
- Fixed some logic errors in atomic checks (Dmitry)
- Introduced drm_plane_has_visible_data() and drm_atomic_check_fb() helper
  methods (Dmitry)
- Fixed typo in drm_solid_fill struct documentation
- Created drm_plane_has_visible_data() helper and corrected CRTC and FB
  NULL-check logic (Dmitry)
- Merged `if (fb)` blocks in drm_atomic_plane_check() and abstracted
  them into helper method (Dmitry)
- Inverted `if (solid_fill_enabled) else if (fb)` check order (Dmitry)
- Fixed indentation (Dmitry)

Changes in v2:
- Dropped SOLID_FILL_FORMAT property (Simon)
- Switched to implementing solid_fill property as a blob (Simon, Dmitry)
- Added drm_solid_fill and drm_solid_fill_info structs (Simon)
- Changed to checks for if solid_fill_blob is set (Dmitry)
- Abstracted (plane_state && !solid_fill_blob) checks to helper method
  (Dmitry)
- Removed DPU_PLANE_COLOR_FILL_FLAG
- Fixed whitespace and indentation issues (Dmitry)
- Changed to checks for if solid_fill_blob is set (Dmitry)
- Abstracted (plane_state && !solid_fill_blob) checks to helper method
  (Dmitry)
- Fixed dropped 'const' warning
- Added helper to convert color fill to BGR888 (Rob)
- Fixed indentation issue (Dmitry)
- Added support for solid fill on planes of varying sizes

---
Jessica Zhang (10):
      drm: Introduce pixel_source DRM plane property
      drm: Introduce solid fill DRM plane property
      drm: Add solid fill pixel source
      drm/atomic: Add pixel source to plane state dump
      drm/atomic: Add solid fill data to plane state dump
      drm/atomic: Move framebuffer checks to helper
      drm/atomic: Loosen FB atomic checks
      drm/msm/dpu: Allow NULL FBs in atomic commit
      drm/msm/dpu: Use DRM solid_fill property
      drm/msm/dpu: Add solid fill and pixel source properties

 drivers/gpu/drm/drm_atomic.c              | 147 +++++++++++++++++-------------
 drivers/gpu/drm/drm_atomic_helper.c       |  36 ++++----
 drivers/gpu/drm/drm_atomic_state_helper.c |  10 ++
 drivers/gpu/drm/drm_atomic_uapi.c         |  30 ++++++
 drivers/gpu/drm/drm_blend.c               | 129 ++++++++++++++++++++++++++
 drivers/gpu/drm/drm_crtc_internal.h       |   1 +
 drivers/gpu/drm/drm_plane.c               |  27 +++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |   9 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c |  80 ++++++++++------
 include/drm/drm_atomic_helper.h           |   4 +-
 include/drm/drm_blend.h                   |   3 +
 include/drm/drm_plane.h                   |  90 ++++++++++++++++++
 include/uapi/drm/drm_mode.h               |  24 +++++
 13 files changed, 478 insertions(+), 112 deletions(-)
---
base-commit: 00ee72279c963989ab435b0bc90b5dc05a9aab79
change-id: 20230404-solid-fill-05016175db36

Best regards,
-- 
Jessica Zhang <quic_jesszhan@quicinc.com>

