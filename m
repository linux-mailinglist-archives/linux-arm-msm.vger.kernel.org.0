Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D74E143ACD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2019 17:23:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732705AbfFMPXw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Jun 2019 11:23:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:51252 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731777AbfFMMYG (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Jun 2019 08:24:06 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7AF0821773;
        Thu, 13 Jun 2019 12:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1560428645;
        bh=ylIuBR5yn6EAKJkZL96zcsc3cHp7vPCBtpQ1H9nxhuw=;
        h=Date:From:To:Cc:Subject:From;
        b=bOyO5TaMLcD0owl1N4BpMw+OuphlFIoRdk4t2MUxea63aPdOd4AEEX4AqEpA3dQ7m
         w5iTYcM5zYoJtkOXRloA2EmL3kF0apL5Bh9eocOjtVdJ8XQiYxb754ToOL69plriSm
         XLPV4JpzEVCah0M5xam9cIbABra6qCiTXCVOWXes=
Date:   Thu, 13 Jun 2019 14:24:02 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH] msm: no need to check return value of debugfs_create
 functions
Message-ID: <20190613122402.GA30678@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

When calling debugfs functions, there is no need to ever check the
return value.  The function can work or not, but the code logic should
never do something different based on this.

Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/msm/msm_perf.c | 15 ++-------------
 drivers/gpu/drm/msm/msm_rd.c   | 15 ++-------------
 2 files changed, 4 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_perf.c b/drivers/gpu/drm/msm/msm_perf.c
index 5ab21bd2decb..95948cfe7a12 100644
--- a/drivers/gpu/drm/msm/msm_perf.c
+++ b/drivers/gpu/drm/msm/msm_perf.c
@@ -205,7 +205,6 @@ int msm_perf_debugfs_init(struct drm_minor *minor)
 {
 	struct msm_drm_private *priv = minor->dev->dev_private;
 	struct msm_perf_state *perf;
-	struct dentry *ent;
 
 	/* only create on first minor: */
 	if (priv->perf)
@@ -220,19 +219,9 @@ int msm_perf_debugfs_init(struct drm_minor *minor)
 	mutex_init(&perf->read_lock);
 	priv->perf = perf;
 
-	ent = debugfs_create_file("perf", S_IFREG | S_IRUGO,
-			minor->debugfs_root, perf, &perf_debugfs_fops);
-	if (!ent) {
-		DRM_ERROR("Cannot create /sys/kernel/debug/dri/%pd/perf\n",
-				minor->debugfs_root);
-		goto fail;
-	}
-
+	debugfs_create_file("perf", S_IFREG | S_IRUGO, minor->debugfs_root,
+			    perf, &perf_debugfs_fops);
 	return 0;
-
-fail:
-	msm_perf_debugfs_cleanup(priv);
-	return -1;
 }
 
 void msm_perf_debugfs_cleanup(struct msm_drm_private *priv)
diff --git a/drivers/gpu/drm/msm/msm_rd.c b/drivers/gpu/drm/msm/msm_rd.c
index d21172933d92..46f7eb6a7eaa 100644
--- a/drivers/gpu/drm/msm/msm_rd.c
+++ b/drivers/gpu/drm/msm/msm_rd.c
@@ -244,7 +244,6 @@ static void rd_cleanup(struct msm_rd_state *rd)
 static struct msm_rd_state *rd_init(struct drm_minor *minor, const char *name)
 {
 	struct msm_rd_state *rd;
-	struct dentry *ent;
 	int ret = 0;
 
 	rd = kzalloc(sizeof(*rd), GFP_KERNEL);
@@ -258,20 +257,10 @@ static struct msm_rd_state *rd_init(struct drm_minor *minor, const char *name)
 
 	init_waitqueue_head(&rd->fifo_event);
 
-	ent = debugfs_create_file(name, S_IFREG | S_IRUGO,
-			minor->debugfs_root, rd, &rd_debugfs_fops);
-	if (!ent) {
-		DRM_ERROR("Cannot create /sys/kernel/debug/dri/%pd/%s\n",
-				minor->debugfs_root, name);
-		ret = -ENOMEM;
-		goto fail;
-	}
+	debugfs_create_file(name, S_IFREG | S_IRUGO, minor->debugfs_root, rd,
+			    &rd_debugfs_fops);
 
 	return rd;
-
-fail:
-	rd_cleanup(rd);
-	return ERR_PTR(ret);
 }
 
 int msm_rd_debugfs_init(struct drm_minor *minor)
-- 
2.22.0

