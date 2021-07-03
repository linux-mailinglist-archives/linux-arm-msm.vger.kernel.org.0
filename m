Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B19C33BA878
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 Jul 2021 13:33:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230223AbhGCLf3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 3 Jul 2021 07:35:29 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:41238 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230225AbhGCLf2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 3 Jul 2021 07:35:28 -0400
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 03 Jul 2021 04:32:55 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 03 Jul 2021 04:32:54 -0700
X-QCInternal: smtphost
Received: from kalyant-linux.qualcomm.com ([10.204.66.210])
  by ironmsg01-blr.qualcomm.com with ESMTP; 03 Jul 2021 17:02:44 +0530
Received: by kalyant-linux.qualcomm.com (Postfix, from userid 94428)
        id D65274961; Sat,  3 Jul 2021 04:32:43 -0700 (PDT)
From:   Kalyan Thota <kalyan_t@codeaurora.org>
To:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Cc:     Kalyan Thota <kalyan_t@codeaurora.org>,
        linux-kernel@vger.kernel.org, robdclark@gmail.com,
        dianders@chromium.org, mkrishn@codeaurora.org
Subject: [RFC] Inline rotation support in dpu driver
Date:   Sat,  3 Jul 2021 04:32:42 -0700
Message-Id: <1625311962-14185-1-git-send-email-kalyan_t@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This change adds support for inline rotation in the dpu driver.
When inline rotation is enabled the VIG pipes will directly fetch the image
from memory in a rotated fashion

Inline rotation has following restrictions 
1) Supported only with compressed formats
2) max pre rotated height is 1088
3) restrictions with downscaling ratio

Queries: 

1) Since inline rotation works for fewer pixel formats with specific modifier, how can we provide this information to the compositor so that
chrome compositor can choose between overlaying or falling back to GPU. In the patch it fails in the atomic check.

2) If a display composition fails in atomic check due to any of the restrictions in overlays
can chrome compositor switch it back to the GPU and re trigger the commit ?

posting it as RFC as validation is not complete, please share early comments on this.

Kalyan Thota (1):
  drm/msm/disp/dpu1: add support for inline rotation in dpu driver

 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 47 +++++++++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 20 ++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c      | 93 ++++++++++++++++++++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h      |  2 +
 4 files changed, 128 insertions(+), 34 deletions(-)

-- 
2.7.4

