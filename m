Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B06F350122
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Mar 2021 15:21:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235745AbhCaNVX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 Mar 2021 09:21:23 -0400
Received: from mail-m121143.qiye.163.com ([115.236.121.143]:34794 "EHLO
        mail-m121143.qiye.163.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235781AbhCaNVL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 Mar 2021 09:21:11 -0400
Received: from ubuntu.localdomain (unknown [36.152.145.181])
        by mail-m121143.qiye.163.com (Hmail) with ESMTPA id 2EB85540261;
        Wed, 31 Mar 2021 21:13:35 +0800 (CST)
From:   Bernard Zhao <bernard@vivo.com>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Lee Jones <lee.jones@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Jonathan Marek <jonathan@marek.ca>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc:     opensource.kernel@vivo.com, Bernard Zhao <bernard@vivo.com>
Subject: [PATCH] msm/disp: dpu_plane cleanup-coding-style-a-bit
Date:   Wed, 31 Mar 2021 06:13:27 -0700
Message-Id: <20210331131329.61000-1-bernard@vivo.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
        oVCBIfWUFZHRpDHkJOTkpCGkpPVkpNSkxKQk1PSk5OTE1VEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
        FZT0tIVUpKS0hKTFVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6N1E6MSo*HD8LDjUJNy8tKzgX
        My9PFCFVSlVKTUpMSkJNT0pOQ05CVTMWGhIXVRkeCRUaCR87DRINFFUYFBZFWVdZEgtZQVlITVVK
        TklVSk9OVUpDSllXWQgBWUFJTktJNwY+
X-HM-Tid: 0a78886afa16b038kuuu2eb85540261
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fix sparse warning:
drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:1195:41: warning: Using plain integer as NULL pointer

Signed-off-by: Bernard Zhao <bernard@vivo.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index f898a8f67b7f..687a57850405 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1223,7 +1223,7 @@ static void _dpu_plane_atomic_disable(struct drm_plane *plane)
 {
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
 	struct drm_plane_state *state = plane->state;
-	struct dpu_plane_state *pstate = to_dpu_plane_state(state);
+	struct dpu_plane_state *pstate = (struct dpu_plane_state *)to_dpu_plane_state(state);
 
 	trace_dpu_plane_disable(DRMID(plane), is_dpu_plane_virtual(plane),
 				pstate->multirect_mode);
-- 
2.31.0

