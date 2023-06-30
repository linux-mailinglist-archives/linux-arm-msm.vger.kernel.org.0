Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 50A9D7431A1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jun 2023 02:26:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232185AbjF3A0L (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Jun 2023 20:26:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231393AbjF3A0I (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Jun 2023 20:26:08 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4627430E6;
        Thu, 29 Jun 2023 17:26:06 -0700 (PDT)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35TNdDNj029656;
        Fri, 30 Jun 2023 00:25:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : subject :
 date : message-id : mime-version : content-type :
 content-transfer-encoding : to : cc; s=qcppdkim1;
 bh=f07rMHCTEU7RbCZZI97h2MH/3iK4g8jX/SGtWxk6viY=;
 b=Lpwf0f3yni1KDBpe/BHYV20NwbABte20LPeYGBiJQ2fqRE+LP1LyYUeloXctvK/6wuL2
 5DQBl0Eh8kTuuVJ/ve20UMj9tx7XEjiy/U2C+KDFq8CTLBYUzITEljByt7HPXuonzVoE
 8BxlfKD/8ThrDA6+A5Z2MfiLyX0Xtilq0nrL1DTXJ+vLojmfbymPft6hMkkiz9Xs+TLb
 LclLUFIiLDmuLYNTW3Zb+qVZ6PoC+gATuQtB07PnlKmuxFDzD3tqRmjDsw38JSjnqCkC
 leLMGTic4mEb2Win8A15YKH/WoKmHune2Ga/ojQXymMIS/OFl6leZg3En3Lg8lGNMya2 fg== 
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rh7s2snsj-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 30 Jun 2023 00:25:37 +0000
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
        by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 35U0Pa3N016375
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 30 Jun 2023 00:25:36 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Thu, 29 Jun 2023 17:25:35 -0700
From:   Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: [PATCH RFC v4 0/7] Support for Solid Fill Planes
Date:   Thu, 29 Jun 2023 17:24:59 -0700
Message-ID: <20230404-solid-fill-v4-0-f4ec0caa742d@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANsgnmQC/x2OQQ6CMBREr2L+2pKWlpq4MjHxAG4NMVCKfAOt9
 iNBCXe3dPlmMnmzANmAluC4WyDYCQm9i6D2OzBd5R6WYRMZcp5Lrrhi5HtsWIt9z3jBhRaHoqm
 lhjioK7KsDpUz3TYZaGDOzuNWvYJtcU6eG1wvZyhj2CGNPnyTexKpShrBVS4VlzrTUjPB3h809
 6cl+sVHp43Qmcz4Acp1Xf9ARAdLwwAAAA==
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
X-Mailer: b4 0.13-dev-c6835
X-Developer-Signature: v=1; a=ed25519-sha256; t=1688084735; l=5005;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=khPou1TqxzURw56AvXYU3jyyUengrVhKIappB8q1qhs=;
 b=shx9JelCwTgijorsWpMwzZ+8ipefaZ83TXJc2C06L/OUws0e2Yt5ngvqdyJq9VApQ9+jjxx/r
 hOon8r+NKzbA6z/QPNZCG8SEq17L71MRjvVRtNkp4v7HZf4DjWXiVBW
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 26tIQJQmwM7VlcdWuHKQzUYAWY-SA9ML
X-Proofpoint-ORIG-GUID: 26tIQJQmwM7VlcdWuHKQzUYAWY-SA9ML
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-29_10,2023-06-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 mlxlogscore=999 impostorscore=0
 mlxscore=0 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306300002
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
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
Jessica Zhang (7):
      drm: Introduce solid fill DRM plane property
      drm: Introduce pixel_source DRM plane property
      drm/atomic: Move framebuffer checks to helper
      drm/atomic: Loosen FB atomic checks
      drm/msm/dpu: Add solid fill and pixel source properties
      drm/msm/dpu: Allow NULL FBs in atomic commit
      drm/msm/dpu: Use DRM solid_fill property

 drivers/gpu/drm/drm_atomic.c              | 142 +++++++++++++++++-------------
 drivers/gpu/drm/drm_atomic_helper.c       |  34 ++++---
 drivers/gpu/drm/drm_atomic_state_helper.c |  10 +++
 drivers/gpu/drm/drm_atomic_uapi.c         |  59 +++++++++++++
 drivers/gpu/drm/drm_blend.c               | 114 ++++++++++++++++++++++++
 drivers/gpu/drm/drm_plane.c               |   8 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |   9 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c |  68 +++++++++-----
 include/drm/drm_atomic_helper.h           |   4 +-
 include/drm/drm_blend.h                   |   3 +
 include/drm/drm_plane.h                   |  92 +++++++++++++++++++
 11 files changed, 437 insertions(+), 106 deletions(-)
---
base-commit: a0364260213c96f6817f7e85cdce293cb743460f
change-id: 20230404-solid-fill-05016175db36

Best regards,
-- 
Jessica Zhang <quic_jesszhan@quicinc.com>

