Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8CA974FC283
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Apr 2022 18:37:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348633AbiDKQje (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Apr 2022 12:39:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345985AbiDKQjd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Apr 2022 12:39:33 -0400
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F07FE31DCD;
        Mon, 11 Apr 2022 09:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1649695039; x=1681231039;
  h=from:to:cc:subject:date:message-id;
  bh=mtE2O+IGOhI4fPN3hDjLHvmi5++/ZnWEsB0kf034Y9I=;
  b=LSh62J8jXJldwdnVXs3z+EkBiZrkapSELJXcaBNjNlzhukwYKuuGtWJZ
   dXzjTWrhC5xMtZBWl+b763iVCOMs9O1ooKCOzgTnfM502zVVc9lGLNECv
   7Z2SS+2G4QYtWSlmOPiWv+cMctP5/e7nG4ttl//O85ZOzHYN6WNFhMyAo
   8=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 11 Apr 2022 09:37:18 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 11 Apr 2022 09:37:17 -0700
X-QCInternal: smtphost
Received: from vpolimer-linux.qualcomm.com ([10.204.67.235])
  by ironmsg02-blr.qualcomm.com with ESMTP; 11 Apr 2022 22:07:04 +0530
Received: by vpolimer-linux.qualcomm.com (Postfix, from userid 463814)
        id 75AC655E9; Mon, 11 Apr 2022 22:07:03 +0530 (IST)
From:   Vinod Polimera <quic_vpolimer@quicinc.com>
To:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Cc:     Vinod Polimera <quic_vpolimer@quicinc.com>,
        linux-kernel@vger.kernel.org, robdclark@gmail.com,
        dmitry.baryshkov@linaro.org, dianders@chromium.org,
        quic_kalyant@quicinc.com
Subject: [PATCH v8 0/2] Add inline rotation support for sc7280 
Date:   Mon, 11 Apr 2022 22:06:59 +0530
Message-Id: <1649695021-19132-1-git-send-email-quic_vpolimer@quicinc.com>
X-Mailer: git-send-email 2.7.4
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Changes in RFC:
- Rebase changes to the latest code base.
- Append rotation config variables with v2 and
remove unused variables.(Dmitry)
- Move pixel_ext setup separately from scaler3 config.(Dmitry)
- Add 270 degree rotation to supported rotation list.(Dmitry)

Changes in V2:
- Remove unused macros and fix indentation.
- Add check if 90 rotation is supported and
add supported rotations to rot_cfg.

Changes in V3:
- Fix indentation.
- Move rot_supported to sspp capabilities. (Dmitry)
- Config pixel_ext based on src_h/src_w directly. (Dmitry)
- Misc changes.

Changes in V4:
- Pass boolean value to sspp blk based on supported rotations for each hw.

Changes in V5:
- Update boolean value to true/false and add it for qcm2290.

Changes in V6:
- Add changes that are missed as part of v5.
- Add dpu_find_format inline function to find valid format. (Dmitry)

Changes in V7:
- Move dpu_find_format inline function to separate commit. (Dmitry)
- Remove rot_cfg from SSPP_BLK and use DPU_SSPP_INLINE_ROTATION caps
to append supported rotations. (Dmitry)
- Misc Changes.

Changes in V8:
- Misc changes.

Co-developed-by: Kalyan Thota <quic_kalyant@quicinc.com>
Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>

Vinod Polimera (2):
  drm/msm/disp/dpu1: add inline function to validate format support
  drm/msm/disp/dpu1: add inline rotation support for sc7280

 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h    |  22 ++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c |  43 +++++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |  16 +++
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c      | 139 +++++++++++++++++++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h      |   2 +
 5 files changed, 186 insertions(+), 36 deletions(-)

-- 
2.7.4

