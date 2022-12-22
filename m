Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A22A765483B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Dec 2022 23:15:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230148AbiLVWPQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Dec 2022 17:15:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229783AbiLVWPP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Dec 2022 17:15:15 -0500
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C432227DDA
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Dec 2022 14:15:14 -0800 (PST)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BMLYBwI020711;
        Thu, 22 Dec 2022 22:14:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=vg8vC8LaN+UXyBN8HpuDwSa3SBiyVBTMONr2IdH2dR0=;
 b=DFuaZaJ9o+LQt0f0ylMseWD1HuVjV+MPCrIvns+WKYfK9phDd5c6CysudcStESei9L7h
 PJoI84sDfETYlzyETh6NWlB6G3nWzLhvUO+O1jQMWo4XKb6B0wg6R0UYOg6UoonwFZag
 xJQ11Zrg2MWsrjND0nT9iFc+dC2fScfIur00EpEuo+ikER3bMtZndPbODet6dzHvqLNi
 nvDv08kx9eWV5Q3neelk4pEftlmNf74ztJin8/XkD7/sl7PMRmPe6NBKuMFO47A8QrYY
 nwp9HDddZd+QzVrPSBIj+/vukWKPy4j/Zzo+WyLsRfs08QwC30S/C0++4TDwqqr90So/ CA== 
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mm6hmk51q-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 22 Dec 2022 22:14:56 +0000
Received: from nasanex01b.na.qualcomm.com (corens_vlan604_snip.qualcomm.com [10.53.140.1])
        by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2BMMEtqn017679
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 22 Dec 2022 22:14:55 GMT
Received: from JESSZHAN.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Thu, 22 Dec 2022 14:14:53 -0800
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
Subject: [RFC PATCH v2 0/3] Support for Solid Fill Planes
Date:   Thu, 22 Dec 2022 14:14:38 -0800
Message-ID: <20221222221441.6980-1-quic_jesszhan@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: OzbIImLVvKhYRV2kNfyeUfxjGS6b9cQZ
X-Proofpoint-ORIG-GUID: OzbIImLVvKhYRV2kNfyeUfxjGS6b9cQZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-22_10,2022-12-22_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1011
 lowpriorityscore=0 mlxlogscore=773 mlxscore=0 spamscore=0 adultscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2212220188
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
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

Jessica Zhang (3):
  drm: Introduce solid fill property for drm plane
  drm: Adjust atomic checks for solid fill color
  drm/msm/dpu: Use color_fill property for DPU planes

 drivers/gpu/drm/drm_atomic.c              | 69 +++++++++++++----------
 drivers/gpu/drm/drm_atomic_helper.c       | 34 ++++++-----
 drivers/gpu/drm/drm_atomic_state_helper.c |  9 +++
 drivers/gpu/drm/drm_atomic_uapi.c         | 64 +++++++++++++++++++++
 drivers/gpu/drm/drm_blend.c               | 17 ++++++
 drivers/gpu/drm/drm_plane.c               | 20 +++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  9 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 69 +++++++++++++++--------
 include/drm/drm_atomic_helper.h           |  6 +-
 include/drm/drm_blend.h                   |  1 +
 include/drm/drm_plane.h                   | 34 +++++++++++
 11 files changed, 257 insertions(+), 75 deletions(-)

-- 
2.38.1

