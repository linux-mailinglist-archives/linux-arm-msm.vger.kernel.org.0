Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F1FD2C3D21
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Nov 2020 11:03:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725842AbgKYKDY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Nov 2020 05:03:24 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:33505 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725815AbgKYKDY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Nov 2020 05:03:24 -0500
Received: from ironmsg07-lv.qualcomm.com (HELO ironmsg07-lv.qulacomm.com) ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 25 Nov 2020 02:03:23 -0800
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg07-lv.qulacomm.com with ESMTP/TLS/AES256-SHA; 25 Nov 2020 02:03:21 -0800
X-QCInternal: smtphost
Received: from kalyant-linux.qualcomm.com ([10.204.66.210])
  by ironmsg02-blr.qualcomm.com with ESMTP; 25 Nov 2020 15:32:46 +0530
Received: by kalyant-linux.qualcomm.com (Postfix, from userid 94428)
        id 2578917AA; Wed, 25 Nov 2020 02:02:45 -0800 (PST)
From:   Kalyan Thota <kalyan_t@codeaurora.org>
To:     y@qualcomm.com, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org
Cc:     Kalyan Thota <kalyan_t@codeaurora.org>,
        linux-kernel@vger.kernel.org, robdclark@gmail.com,
        seanpaul@chromium.org, hoegsberg@chromium.org,
        dianders@chromium.org, mkrishn@codeaurora.org,
        travitej@codeaurora.org, nganji@codeaurora.org,
        swboyd@chromium.org, abhinavk@codeaurora.org,
        ddavenport@chromium.org, amit.pundir@linaro.org,
        sumit.semwal@linaro.org
Subject: [v1] drm/msm/dpu: consider vertical front porch in the prefill bw calculation
Date:   Wed, 25 Nov 2020 02:02:40 -0800
Message-Id: <1606298560-3003-1-git-send-email-kalyan_t@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <y>
References: <y>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In case of panels with low vertical back porch, the prefill bw
requirement will be high as we will have less time(vbp+pw) to
fetch and fill the hw latency buffers before start of first line
in active period.

For ex:
Say hw_latency_line_buffers = 24, and if blanking vbp+pw = 10
Here we need to fetch 24 lines of data in 10 line times.
This will increase the bw to the ratio of linebuffers to blanking.

DPU hw can also fetch data during vertical front porch provided
interface prefetch is enabled. Use vfp in the prefill calculation
as dpu driver enables prefetch if the blanking is not sufficient
to fill the latency lines.

Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 7ea90d2..315b999 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -151,7 +151,7 @@ static void _dpu_plane_calc_bw(struct drm_plane *plane,
 	u64 plane_bw;
 	u32 hw_latency_lines;
 	u64 scale_factor;
-	int vbp, vpw;
+	int vbp, vpw, vfp;
 
 	pstate = to_dpu_plane_state(plane->state);
 	mode = &plane->state->crtc->mode;
@@ -164,6 +164,7 @@ static void _dpu_plane_calc_bw(struct drm_plane *plane,
 	fps = drm_mode_vrefresh(mode);
 	vbp = mode->vtotal - mode->vsync_end;
 	vpw = mode->vsync_end - mode->vsync_start;
+	vfp = mode->vsync_start - mode->vdisplay;
 	hw_latency_lines =  dpu_kms->catalog->perf.min_prefill_lines;
 	scale_factor = src_height > dst_height ?
 		mult_frac(src_height, 1, dst_height) : 1;
@@ -176,7 +177,13 @@ static void _dpu_plane_calc_bw(struct drm_plane *plane,
 		src_width * hw_latency_lines * fps * fmt->bpp *
 		scale_factor * mode->vtotal;
 
-	do_div(plane_prefill_bw, (vbp+vpw));
+	if ((vbp+vpw) > hw_latency_lines)
+		do_div(plane_prefill_bw, (vbp+vpw));
+	else if ((vbp+vpw+vfp) < hw_latency_lines)
+		do_div(plane_prefill_bw, (vbp+vpw+vfp));
+	else
+		do_div(plane_prefill_bw, hw_latency_lines);
+
 
 	pstate->plane_fetch_bw = max(plane_bw, plane_prefill_bw);
 }
-- 
2.7.4

