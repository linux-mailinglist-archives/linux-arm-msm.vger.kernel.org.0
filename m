Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C4BD6FE7A5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 May 2023 00:55:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229487AbjEJWzQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 May 2023 18:55:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236559AbjEJWzM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 May 2023 18:55:12 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 216CE3C29
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 May 2023 15:55:10 -0700 (PDT)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34AMs2wm001493;
        Wed, 10 May 2023 22:55:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : subject :
 date : message-id : mime-version : content-type :
 content-transfer-encoding : to : cc; s=qcppdkim1;
 bh=yn/8PUdWKxiSQXZ46+YCrxPV/7j0yXyLJ8vlFbdAncY=;
 b=l9T2xuGq9OMMoQwwpXmmIeQDO3W6ei2MEJy3BlfrGoKlVvf947YFZ49sk8e4HHHe7XHd
 OR0ESnOO7ZDSwD4mqRyeEAL1TsLf8mgG1gCBv8UB1qIvWGerbU3U2sIU30NAnDXEDlDF
 6/PMV2r6GiCOApKRX/wC/vNqURXigeOGtFUoakZa+Mh6QLm/R6koZN/IpdkV4iAgXTu5
 aQqwYNJhH7vtrLbG6QjHWJEOn62ZmwxY/EZzv2c39lx86L6PWaAacCJhLZhxB4JCSh+x
 n6Km3YQPi15biX5HX+3Gt6g3CEOaI7BZqLjHa47N6GI5Bopeq4ANiqBROQYw77XfGlch 1A== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qgfsargyd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 10 May 2023 22:55:02 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
        by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34AMt2Ni020932
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 10 May 2023 22:55:02 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Wed, 10 May 2023 15:55:02 -0700
From:   Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: [PATCH v9 0/8] Introduce MSM-specific DSC helpers
Date:   Wed, 10 May 2023 15:54:40 -0700
Message-ID: <20230329-rfc-msm-dsc-helper-v9-0-87daeaec2c0a@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALAgXGQC/4XQPU8EIRAG4L9yoRbD5wJWJiYWlpYai50BXBJ39
 wTdaC7332WvUxIpXzLvMxNOpIScQiE3hxPJYUslrUsN7upAcBqX10CTr5kIJiSTwtEckc5lpr4
 gncLbMWTqLB+dDj6CZ6QWYSyBQh4XnPbqw9PfwuP93T53zCGmr8vy55eap1Q+1vx9uWXj++u/a
 zdOGY0yKOOidjD42/fPhGnBa1xnsoOb6COiIhK5xOC1HEC0iOwjsiIDBGReGDNa2SKqj6iKcDA
 OjQXJvGkR3Ud0RRhnVjHujbVDiwx9ZKgIgqm/Glk0EVrE9BFTER+VHQVqpQRvEdtHbEUEOhAAX
 DCHv5Hz+fwDRpG+HsECAAA=
To:     <freedreno@lists.freedesktop.org>
CC:     Marijn Suijten <marijn.suijten@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        "Daniel Vetter" <daniel@ffwll.ch>, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, <dri-devel@lists.freedesktop.org>,
        <linux-arm-msm@vger.kernel.org>,
        Jessica Zhang <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.13-dev-bfdf5
X-Developer-Signature: v=1; a=ed25519-sha256; t=1683759301; l=6969;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=iVWokHZ7W8HSLlhfO+WlUnSYMbYHQWQPdk+Bhxi6bYs=;
 b=mW8R043XxzxWB/dYlVmioD65dVLXpNis5wF3aV64+0BS4554tJt4+qSxmnvwtAVs49gEeduX3
 V+Uh0W+YBP9Bs0eALy44hdz0uHRLxb5ZjRRnETkKL5ONZh2v6eFpb++
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: MLeepfdRKyDPU0g7C4m84YkX9lUIjFOT
X-Proofpoint-GUID: MLeepfdRKyDPU0g7C4m84YkX9lUIjFOT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-10_04,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 impostorscore=0 adultscore=0 spamscore=0 mlxlogscore=999
 lowpriorityscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2304280000 definitions=main-2305100190
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

There are some overlap in calculations for MSM-specific DSC variables
between DP and DSI. In addition, the calculations for initial_scale_value
and det_thresh_flatness that are defined within the DSC 1.2 specifications,
but aren't yet included in drm_dsc_helper.c.

This series moves these calculations to a shared msm_dsc_helper.c file and
defines drm_dsc_helper methods for initial_scale_value and
det_thresh_flatness.

Note: For now, the MSM specific helper methods are only called for the DSI
path, but will called for DP once DSC 1.2 support for DP has been added.

Depends on: "drm/i915: move DSC RC tables to drm_dsc_helper.c" [1]

[1] https://patchwork.freedesktop.org/series/114472/

---
Changes in v9:
- Fixed incorrect math for msm_dsc_get_bytes_per_line()
- Link to v8: https://lore.kernel.org/r/20230329-rfc-msm-dsc-helper-v8-0-2c9b2bb1209c@quicinc.com

Changes in v8:
- *_bytes_per_soft_slice --> *_bytes_per_slice
- Fixed comment doc formatting for MSM DSC helpers
- Use slice_chunk_size in msm_dsc_get_bytes_per_line calculation
- Reworded "drm/msm/dpu: Use DRM DSC helper for det_thresh_flatness"
  commit title for clarity
- Picked up "Reviewed-by" tags
- Added duplicate Signed-off-by tag to "drm/display/dsc: Add flatness
  and initial scale value calculations" to reflect patch history
- Link to v7: https://lore.kernel.org/r/20230329-rfc-msm-dsc-helper-v7-0-df48a2c54421@quicinc.com

Changes in v7:
- Renamed msm_dsc_get_pclk_per_intf to msm_dsc_get_bytes_per_line
- Removed duplicate msm_dsc_get_dce_bytes_per_line
- Reworded commit message for "drm/msm/dpu: Use DRM DSC helper for
  det_thresh_flatness"
- Dropped slice_per_pkt change (it will be included in the later
  "Add DSC v1.2 Support for DSI" series)
- Picked up "drm/display/dsc: Add flatness and initial scale value
  calculations" and "drm/display/dsc: add helper to set semi-const
  parameters", which were dropped from "drm/i915: move DSC RC tables to
  drm_dsc_helper.c" series
- Picked up "Reviewed-by" tags
- Removed changelog in individual patches
- Link to v6: https://lore.kernel.org/r/20230329-rfc-msm-dsc-helper-v6-0-cb7f59f0f7fb@quicinc.com

Changes in v6:
- Documented return values for MSM DSC helpers
- Fixed dependency issue in msm_dsc_helper.c
- Link to v5: https://lore.kernel.org/r/20230329-rfc-msm-dsc-helper-v5-0-0108401d7886@quicinc.com

Changes in v5:
- Added extra line at end of msm_dsc_helper.h
- Simplified msm_dsc_get_bytes_per_soft_slice() math
- Simplified and inlined msm_dsc_get_pclk_per_intf() math
- "Fix calculations pkt_per_line" --> "... Fix calculation for pkt_per_line"
- Split dsc->slice_width check into a separate patch
- Picked up Dmitry's msm/dsi patch ("drm/msm/dsi: use new helpers for
  DSC setup")
- Removed unused headers in MSM DSC helper files
- Picked up Reviewed-by tags
- Link to v4: https://lore.kernel.org/r/20230329-rfc-msm-dsc-helper-v4-0-1b79c78b30d7@quicinc.com

Changes in v4:
- Changed msm_dsc_get_uncompressed_pclk_per_intf to msm_dsc_get_pclk_per_intf
- Moved pclk_per_intf calculation for dsi_timing_setup to `if
  (msm_host->dsc)` block
- Link to v3: https://lore.kernel.org/r/20230329-rfc-msm-dsc-helper-v3-0-6bec0d277a83@quicinc.com

Changes in v3:
- Dropped src_bpp parameter from all methods -- src_bpp can be
  calculated as dsc->bits_per_component * 3- Cleaned up unused parameters
- Dropped intf_width parameter from get_bytes_per_soft_slice()
- Moved dsc->bits_per_component to numerator calculation in
  get_bytes_per_soft_slice()
- Made get_bytes_per_soft_slice() a public method (this will be called
  later to help calculate DP pclk params)- Added comment documentation to
  MSM DSC helpers
- Renamed msm_dsc_get_uncompressed_pclk_per_line to
  *_get_uncompressed_pclk_per_intf()
- Removed dsc->slice_width check from msm_dsc_get_uncompressed_pclk_per_intf()
- Added documentation in comments
- Moved extra_eol_bytes math out of msm_dsc_get_eol_byte_num()
- Renamed msm_dsc_get_eol_byte_num to *_get_bytes_per_intf.
- Reworded slice_last_group_size calculation to `(dsc->slice_width + 2) % 3`
- Used MSM DSC helper to calculate total_bytes_per_intf
- Initialized hdisplay as uncompressed pclk per line at the beginning of
  dsi_timing_setup as to not break dual DSI calculations
- Added slice_width check to dsi_timing_setup
- Dropped 78c8b81d57d8 ("drm/display/dsc: Add flatness and initial scale
  value calculations") patch as it was absorbed in Dmitry's DSC series [1]
- Split dsi_timing_setup() hdisplay calculation to a separate patch
- Link to v2: https://lore.kernel.org/r/20230329-rfc-msm-dsc-helper-v2-0-3c13ced536b2@quicinc.com

Changes in v2:
- Changed det_thresh_flatness to flatness_det_thresh
- Set initial_scale_value directly in helper
- Moved msm_dsc_helper files to msm/ directory
- Dropped get_comp_ratio() helper
- Used drm_int2fixp() to convert to integers to fp
- Fixed type mismatch issues in MSM DSC helpers
- Changed DSC_BPP macro to drm_dsc_get_bpp_int() helper method
- Style changes to improve readability
- Dropped last division step of msm_dsc_get_pclk_per_line() and changed
  method name accordingly
- Dropped unused bpp variable in msm_dsc_get_dce_bytes_per_line()
- Changed msm_dsc_get_slice_per_intf() to a static inline method
- Split eol_byte_num and pkt_per_line calculation into a separate patch
- Moved pclk_per_line calculation into `if (dsc)` block in
  dsi_timing_setup()
- *_calculate_initial_scale_value --> *_set_initial_scale_value
- Picked up Fixes tags for patches 3/5 and 4/5
- Picked up Reviewed-by for patch 4/5
- Link to v1: https://lore.kernel.org/r/20230329-rfc-msm-dsc-helper-v1-0-f3e479f59b6d@quicinc.com

---
Dmitry Baryshkov (2):
      drm/display/dsc: add helper to set semi-const parameters
      drm/msm/dsi: use DRM DSC helpers for DSC setup

Jessica Zhang (6):
      drm/display/dsc: Add flatness and initial scale value calculations
      drm/msm: Add MSM-specific DSC helper methods
      drm/msm/dpu: Use fixed DRM DSC helper for det_thresh_flatness
      drm/msm/dpu: Fix slice_last_group_size calculation
      drm/msm/dsi: Use MSM and DRM DSC helper methods
      drm/msm/dsi: update hdisplay calculation for dsi_timing_setup

 drivers/gpu/drm/display/drm_dsc_helper.c   | 22 ++++++++++
 drivers/gpu/drm/msm/Makefile               |  1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c |  9 ++--
 drivers/gpu/drm/msm/dsi/dsi_host.c         | 70 ++++++------------------------
 drivers/gpu/drm/msm/msm_dsc_helper.c       | 26 +++++++++++
 drivers/gpu/drm/msm/msm_dsc_helper.h       | 69 +++++++++++++++++++++++++++++
 include/drm/display/drm_dsc_helper.h       | 12 +++++
 7 files changed, 149 insertions(+), 60 deletions(-)
---
base-commit: 5526fe03b40ca1cc72c7b4e97f28d3bbfaa0ded9
change-id: 20230329-rfc-msm-dsc-helper-981a95edfbd0

Best regards,
-- 
Jessica Zhang <quic_jesszhan@quicinc.com>

