Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1342B43AD1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2019 17:24:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731780AbfFMPYA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Jun 2019 11:24:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:50400 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731748AbfFMMW7 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Jun 2019 08:22:59 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9B1B82082C;
        Thu, 13 Jun 2019 12:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1560428579;
        bh=XbuVjN6h6G68INtlFDopuAtN+75uS8pGPgA9SalixQs=;
        h=Date:From:To:Cc:Subject:From;
        b=gopxNn85hjmQj9rFrQycCFRGmd1fQ1rChcT9QV+/qu1ceOMNdULRg5RYzZjO8OcAi
         +nKDhIZE5fJMGgR/neeJEh7cqQd29CNStKDYBwT7l7C+Zj2KXm11fxMpfocfAX5p8r
         LwyExS3ogkZy0ngby/dnoHsiXR5zM/1vREiR6924=
Date:   Thu, 13 Jun 2019 14:22:56 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Mamta Shukla <mamtashukla555@gmail.com>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH] msm: adreno: no need to check return value of debugfs_create
 functions
Message-ID: <20190613122256.GA30577@kroah.com>
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
Cc: Jordan Crouse <jcrouse@codeaurora.org>
Cc: Mamta Shukla <mamtashukla555@gmail.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/msm/adreno/a5xx_debugfs.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_debugfs.c b/drivers/gpu/drm/msm/adreno/a5xx_debugfs.c
index d9af3aff690f..cb8dfc970ec3 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_debugfs.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_debugfs.c
@@ -158,7 +158,6 @@ DEFINE_SIMPLE_ATTRIBUTE(reset_fops, NULL, reset_set, "%llx\n");
 int a5xx_debugfs_init(struct msm_gpu *gpu, struct drm_minor *minor)
 {
 	struct drm_device *dev;
-	struct dentry *ent;
 	int ret;
 
 	if (!minor)
@@ -175,11 +174,8 @@ int a5xx_debugfs_init(struct msm_gpu *gpu, struct drm_minor *minor)
 		return ret;
 	}
 
-	ent = debugfs_create_file("reset", S_IWUGO,
-		minor->debugfs_root,
-		dev, &reset_fops);
-	if (!ent)
-		return -ENOMEM;
+	debugfs_create_file("reset", S_IWUGO, minor->debugfs_root, dev,
+			    &reset_fops);
 
 	return 0;
 }
-- 
2.22.0

