Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D0A7425ACA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Oct 2021 20:32:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243545AbhJGSd5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Oct 2021 14:33:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231340AbhJGSd5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Oct 2021 14:33:57 -0400
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34AACC061570
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 Oct 2021 11:32:03 -0700 (PDT)
Received: by mail-ot1-x32a.google.com with SMTP id j11-20020a9d190b000000b00546fac94456so8594010ota.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Oct 2021 11:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GEaWDjSb3qOp5ad8DMZz/UJKavs+r1WsOl2RdTLvUkE=;
        b=P8vgcKulAt3tPIgxBfxk8NewRIdpfUhC3Pj0lDILiD4eQggs3acpFediSaHdeBeer7
         dbDskEBioZ8E4uiwq9bdEZ9w6GXC3VQ3Lwl1KdaG/hDjhhJ6XuPBQ9Mosianq8bbPBPk
         su532ZBT6ZfzhEsiQzpEqfPsmhDNlXI0jXJltb4pLI1ynDF2FDB1rDPuY58RvZ0S/xKR
         n4b2N5/3wzGRLlbF9QW6BmhrerIjHh7Cn30K/etKB2mTOqRbb1ZGbrxXiaGpbbuwXiqX
         zl7sOSsX/vzzab5w6cYndPJLFVjiCJjFcaBG04T8vTtPT2vyBpps+x6FdvD3olvvYWpT
         t5FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GEaWDjSb3qOp5ad8DMZz/UJKavs+r1WsOl2RdTLvUkE=;
        b=r6duCKcNC9f0l0zV1D5h8sslBazPe5lbRy5Uw5XBEGwwcG4gfHxACExUKRUhB36FRr
         o8a+7K5KThX+W9v787xwLaQTB7r9Uy3nSQw/R17UfM2uh7MpfcqZcmZw12kNZ28OzQ5j
         lNYvoUOUbLZtrvqU36TFitpmrIm7JpG/XzVXY6xZwOLvsOw6i9ph9LoqbuZZxw43vYmo
         UTZOfF7PaSBAW8nU+xrpU3qCsrlfj1sUQx/dT8xZFjL3j4hKOY10b92bI2GJbnZPcYkt
         vrU1ySRoTH+bTzyIv0cPY2bDM5zkz5mMMpJeO2jokvg0JuLv6gwKdg2unC85Bo3rETi0
         PzZQ==
X-Gm-Message-State: AOAM530Wk6ycvSN37xthZTUb+QcPJBpwxWUp40B+jVEfaPWPunNKVpJl
        2r0m0+zo2YS94PGq9B/6XvqA7A==
X-Google-Smtp-Source: ABdhPJxAI+4Du3/vUQ6HcJA9NbX0QpMcVGv8epbY2qunlm9qzADCWYzW2UoRhOF363zHhPY98t6GLw==
X-Received: by 2002:a9d:4b9d:: with SMTP id k29mr4955459otf.314.1633631522471;
        Thu, 07 Oct 2021 11:32:02 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id j4sm45593oia.56.2021.10.07.11.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Oct 2021 11:32:02 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Abhinav Kumar <abhinavk@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/msm/dp: Simplify the dp_debug debugfs show function
Date:   Thu,  7 Oct 2021 11:33:41 -0700
Message-Id: <20211007183341.3140281-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The "dp_debug" show function allocates a buffer and piecemeal appends
line by line, checking for buffer overflows etc.

Migrate the function to seq_file, to remove all the extra book keeping
and simplify the function.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_debug.c | 161 +++++-------------------------
 1 file changed, 24 insertions(+), 137 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_debug.c b/drivers/gpu/drm/msm/dp/dp_debug.c
index 2f6247e80e9d..566037942343 100644
--- a/drivers/gpu/drm/msm/dp/dp_debug.c
+++ b/drivers/gpu/drm/msm/dp/dp_debug.c
@@ -31,177 +31,69 @@ struct dp_debug_private {
 	struct dp_debug dp_debug;
 };
 
-static int dp_debug_check_buffer_overflow(int rc, int *max_size, int *len)
+static int dp_debug_show(struct seq_file *seq, void *p)
 {
-	if (rc >= *max_size) {
-		DRM_ERROR("buffer overflow\n");
-		return -EINVAL;
-	}
-	*len += rc;
-	*max_size = SZ_4K - *len;
-
-	return 0;
-}
-
-static ssize_t dp_debug_read_info(struct file *file, char __user *user_buff,
-		size_t count, loff_t *ppos)
-{
-	struct dp_debug_private *debug = file->private_data;
-	char *buf;
-	u32 len = 0, rc = 0;
+	struct dp_debug_private *debug = seq->private;
 	u64 lclk = 0;
-	u32 max_size = SZ_4K;
 	u32 link_params_rate;
 	struct drm_display_mode *drm_mode;
 
 	if (!debug)
 		return -ENODEV;
 
-	if (*ppos)
-		return 0;
-
-	buf = kzalloc(SZ_4K, GFP_KERNEL);
-	if (!buf)
-		return -ENOMEM;
-
 	drm_mode = &debug->panel->dp_mode.drm_mode;
 
-	rc = snprintf(buf + len, max_size, "\tname = %s\n", DEBUG_NAME);
-	if (dp_debug_check_buffer_overflow(rc, &max_size, &len))
-		goto error;
-
-	rc = snprintf(buf + len, max_size,
-			"\tdp_panel\n\t\tmax_pclk_khz = %d\n",
+	seq_printf(seq, "\tname = %s\n", DEBUG_NAME);
+	seq_printf(seq, "\tdp_panel\n\t\tmax_pclk_khz = %d\n",
 			debug->panel->max_pclk_khz);
-	if (dp_debug_check_buffer_overflow(rc, &max_size, &len))
-		goto error;
-
-	rc = snprintf(buf + len, max_size,
-			"\tdrm_dp_link\n\t\trate = %u\n",
+	seq_printf(seq, "\tdrm_dp_link\n\t\trate = %u\n",
 			debug->panel->link_info.rate);
-	if (dp_debug_check_buffer_overflow(rc, &max_size, &len))
-		goto error;
-
-	rc = snprintf(buf + len, max_size,
-			 "\t\tnum_lanes = %u\n",
+	seq_printf(seq, "\t\tnum_lanes = %u\n",
 			debug->panel->link_info.num_lanes);
-	if (dp_debug_check_buffer_overflow(rc, &max_size, &len))
-		goto error;
-
-	rc = snprintf(buf + len, max_size,
-			"\t\tcapabilities = %lu\n",
+	seq_printf(seq, "\t\tcapabilities = %lu\n",
 			debug->panel->link_info.capabilities);
-	if (dp_debug_check_buffer_overflow(rc, &max_size, &len))
-		goto error;
-
-	rc = snprintf(buf + len, max_size,
-			"\tdp_panel_info:\n\t\tactive = %dx%d\n",
+	seq_printf(seq, "\tdp_panel_info:\n\t\tactive = %dx%d\n",
 			drm_mode->hdisplay,
 			drm_mode->vdisplay);
-	if (dp_debug_check_buffer_overflow(rc, &max_size, &len))
-		goto error;
-
-	rc = snprintf(buf + len, max_size,
-			"\t\tback_porch = %dx%d\n",
+	seq_printf(seq, "\t\tback_porch = %dx%d\n",
 			drm_mode->htotal - drm_mode->hsync_end,
 			drm_mode->vtotal - drm_mode->vsync_end);
-	if (dp_debug_check_buffer_overflow(rc, &max_size, &len))
-		goto error;
-
-	rc = snprintf(buf + len, max_size,
-			"\t\tfront_porch = %dx%d\n",
+	seq_printf(seq, "\t\tfront_porch = %dx%d\n",
 			drm_mode->hsync_start - drm_mode->hdisplay,
 			drm_mode->vsync_start - drm_mode->vdisplay);
-	if (dp_debug_check_buffer_overflow(rc, &max_size, &len))
-		goto error;
-
-	rc = snprintf(buf + len, max_size,
-			"\t\tsync_width = %dx%d\n",
+	seq_printf(seq, "\t\tsync_width = %dx%d\n",
 			drm_mode->hsync_end - drm_mode->hsync_start,
 			drm_mode->vsync_end - drm_mode->vsync_start);
-	if (dp_debug_check_buffer_overflow(rc, &max_size, &len))
-		goto error;
-
-	rc = snprintf(buf + len, max_size,
-			"\t\tactive_low = %dx%d\n",
+	seq_printf(seq, "\t\tactive_low = %dx%d\n",
 			debug->panel->dp_mode.h_active_low,
 			debug->panel->dp_mode.v_active_low);
-	if (dp_debug_check_buffer_overflow(rc, &max_size, &len))
-		goto error;
-
-	rc = snprintf(buf + len, max_size,
-			"\t\th_skew = %d\n",
+	seq_printf(seq, "\t\th_skew = %d\n",
 			drm_mode->hskew);
-	if (dp_debug_check_buffer_overflow(rc, &max_size, &len))
-		goto error;
-
-	rc = snprintf(buf + len, max_size,
-			"\t\trefresh rate = %d\n",
+	seq_printf(seq, "\t\trefresh rate = %d\n",
 			drm_mode_vrefresh(drm_mode));
-	if (dp_debug_check_buffer_overflow(rc, &max_size, &len))
-		goto error;
-
-	rc = snprintf(buf + len, max_size,
-			"\t\tpixel clock khz = %d\n",
+	seq_printf(seq, "\t\tpixel clock khz = %d\n",
 			drm_mode->clock);
-	if (dp_debug_check_buffer_overflow(rc, &max_size, &len))
-		goto error;
-
-	rc = snprintf(buf + len, max_size,
-			"\t\tbpp = %d\n",
+	seq_printf(seq, "\t\tbpp = %d\n",
 			debug->panel->dp_mode.bpp);
-	if (dp_debug_check_buffer_overflow(rc, &max_size, &len))
-		goto error;
 
 	/* Link Information */
-	rc = snprintf(buf + len, max_size,
-			"\tdp_link:\n\t\ttest_requested = %d\n",
+	seq_printf(seq, "\tdp_link:\n\t\ttest_requested = %d\n",
 			debug->link->sink_request);
-	if (dp_debug_check_buffer_overflow(rc, &max_size, &len))
-		goto error;
-
-	rc = snprintf(buf + len, max_size,
-			"\t\tnum_lanes = %d\n",
+	seq_printf(seq, "\t\tnum_lanes = %d\n",
 			debug->link->link_params.num_lanes);
-	if (dp_debug_check_buffer_overflow(rc, &max_size, &len))
-		goto error;
-
 	link_params_rate = debug->link->link_params.rate;
-	rc = snprintf(buf + len, max_size,
-			"\t\tbw_code = %d\n",
+	seq_printf(seq, "\t\tbw_code = %d\n",
 			drm_dp_link_rate_to_bw_code(link_params_rate));
-	if (dp_debug_check_buffer_overflow(rc, &max_size, &len))
-		goto error;
-
 	lclk = debug->link->link_params.rate * 1000;
-	rc = snprintf(buf + len, max_size,
-			"\t\tlclk = %lld\n", lclk);
-	if (dp_debug_check_buffer_overflow(rc, &max_size, &len))
-		goto error;
-
-	rc = snprintf(buf + len, max_size,
-			"\t\tv_level = %d\n",
+	seq_printf(seq, "\t\tlclk = %lld\n", lclk);
+	seq_printf(seq, "\t\tv_level = %d\n",
 			debug->link->phy_params.v_level);
-	if (dp_debug_check_buffer_overflow(rc, &max_size, &len))
-		goto error;
-
-	rc = snprintf(buf + len, max_size,
-			"\t\tp_level = %d\n",
+	seq_printf(seq, "\t\tp_level = %d\n",
 			debug->link->phy_params.p_level);
-	if (dp_debug_check_buffer_overflow(rc, &max_size, &len))
-		goto error;
-
-	if (copy_to_user(user_buff, buf, len))
-		goto error;
-
-	*ppos += len;
 
-	kfree(buf);
-	return len;
- error:
-	kfree(buf);
-	return -EINVAL;
+	return 0;
 }
+DEFINE_SHOW_ATTRIBUTE(dp_debug);
 
 static int dp_test_data_show(struct seq_file *m, void *data)
 {
@@ -349,11 +241,6 @@ static int dp_test_active_open(struct inode *inode,
 			inode->i_private);
 }
 
-static const struct file_operations dp_debug_fops = {
-	.open = simple_open,
-	.read = dp_debug_read_info,
-};
-
 static const struct file_operations test_active_fops = {
 	.owner = THIS_MODULE,
 	.open = dp_test_active_open,
-- 
2.29.2

