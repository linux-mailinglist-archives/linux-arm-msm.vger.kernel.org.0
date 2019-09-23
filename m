Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C359BB44E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Sep 2019 14:52:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404621AbfIWMwG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Sep 2019 08:52:06 -0400
Received: from regular1.263xmail.com ([211.150.70.206]:57912 "EHLO
        regular1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405264AbfIWMwG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Sep 2019 08:52:06 -0400
X-Greylist: delayed 484 seconds by postgrey-1.27 at vger.kernel.org; Mon, 23 Sep 2019 08:52:03 EDT
Received: from hjc?rock-chips.com (unknown [192.168.167.16])
        by regular1.263xmail.com (Postfix) with ESMTP id 1CF38452;
        Mon, 23 Sep 2019 20:43:56 +0800 (CST)
X-263anti-spam: KSV:0;BIG:0;
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-KSVirus-check: 0
X-ADDR-CHECKED4: 1
X-ABS-CHECKED: 1
X-SKE-CHECKED: 1
X-ANTISPAM-LEVEL: 2
Received: from localhost.localdomain (unknown [58.22.7.114])
        by smtp.263.net (postfix) whith ESMTP id P3051T140289744058112S1569242621440080_;
        Mon, 23 Sep 2019 20:43:57 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <fe5a9893bb74d8c2b2afc522284afcec>
X-RL-SENDER: hjc@rock-chips.com
X-SENDER: hjc@rock-chips.com
X-LOGIN-NAME: hjc@rock-chips.com
X-FST-TO: dri-devel@lists.freedesktop.org
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
From:   Sandy Huang <hjc@rock-chips.com>
To:     dri-devel@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Bruce Wang <bzwang@chromium.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Sravanthi Kollukuduru <skolluku@codeaurora.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Mamta Shukla <mamtashukla555@gmail.com>,
        Shayenne Moura <shayenneluzmoura@gmail.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Emil Velikov <emil.velikov@collabora.com>,
        Allison Randal <allison@lohutok.net>,
        Sandy Huang <hjc@rock-chips.com>
Cc:     Sean Paul <seanpaul@chromium.org>,
        Rob Clark <robdclark@chromium.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 08/36] drm/msm: use bpp instead of cpp for drm_format_info
Date:   Mon, 23 Sep 2019 20:41:12 +0800
Message-Id: <1569242500-182337-9-git-send-email-hjc@rock-chips.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1569242500-182337-7-git-send-email-hjc@rock-chips.com>
References: <1569242500-182337-7-git-send-email-hjc@rock-chips.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

cpp[BytePerPlane] can't describe the 10bit data format correctly,
So we use bpp[BitPerPlane] to instead cpp.

Signed-off-by: Sandy Huang <hjc@rock-chips.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  | 4 ++--
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c | 2 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c  | 2 +-
 drivers/gpu/drm/msm/msm_fb.c              | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index b3417d5..c57731c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1148,8 +1148,8 @@ static int _dpu_debugfs_status_show(struct seq_file *s, void *data)
 				fb->base.id, (char *) &fb->format->format,
 				fb->width, fb->height);
 			for (i = 0; i < ARRAY_SIZE(fb->format->cpp); ++i)
-				seq_printf(s, "cpp[%d]:%u ",
-						i, fb->format->cpp[i]);
+				seq_printf(s, "bpp[%d]:%u ",
+						i, fb->format->bpp[i]);
 			seq_puts(s, "\n\t");
 
 			seq_printf(s, "modifier:%8llu ", fb->modifier);
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
index ff14555..61ab4dc 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
@@ -790,7 +790,7 @@ static void mdp5_crtc_restore_cursor(struct drm_crtc *crtc)
 	width = mdp5_crtc->cursor.width;
 	height = mdp5_crtc->cursor.height;
 
-	stride = width * info->cpp[0];
+	stride = width * info->bpp[0] / 8;
 
 	get_roi(crtc, &roi_w, &roi_h);
 
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c
index 776337f..992477d 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c
@@ -147,7 +147,7 @@ uint32_t mdp5_smp_calculate(struct mdp5_smp *smp,
 	for (i = 0; i < nplanes; i++) {
 		int n, fetch_stride, cpp;
 
-		cpp = info->cpp[i];
+		cpp = info->bpp[i] / 8;
 		fetch_stride = width * cpp / (i ? hsub : 1);
 
 		n = DIV_ROUND_UP(fetch_stride * nlines, smp->blk_size);
diff --git a/drivers/gpu/drm/msm/msm_fb.c b/drivers/gpu/drm/msm/msm_fb.c
index 5bcd5e5..4545fa1 100644
--- a/drivers/gpu/drm/msm/msm_fb.c
+++ b/drivers/gpu/drm/msm/msm_fb.c
@@ -172,7 +172,7 @@ static struct drm_framebuffer *msm_framebuffer_init(struct drm_device *dev,
 		unsigned int min_size;
 
 		min_size = (height - 1) * mode_cmd->pitches[i]
-			 + width * info->cpp[i]
+			 + width * info->bpp[i] / 8
 			 + mode_cmd->offsets[i];
 
 		if (bos[i]->size < min_size) {
-- 
2.7.4



