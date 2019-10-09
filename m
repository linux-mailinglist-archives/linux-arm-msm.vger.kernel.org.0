Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8DE96D0DE4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2019 13:46:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727228AbfJILqP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Oct 2019 07:46:15 -0400
Received: from imap1.codethink.co.uk ([176.9.8.82]:55024 "EHLO
        imap1.codethink.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725914AbfJILqP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Oct 2019 07:46:15 -0400
Received: from [167.98.27.226] (helo=rainbowdash.codethink.co.uk)
        by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
        id 1iIAPy-0004SC-Kz; Wed, 09 Oct 2019 12:46:10 +0100
Received: from ben by rainbowdash.codethink.co.uk with local (Exim 4.92.2)
        (envelope-from <ben@rainbowdash.codethink.co.uk>)
        id 1iIAPx-0000C5-9t; Wed, 09 Oct 2019 12:46:09 +0100
From:   Ben Dooks <ben.dooks@codethink.co.uk>
To:     linux-kernel@lists.codethink.co.uk
Cc:     Ben Dooks <ben.dooks@codethink.co.uk>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH] drm/msm: make a5xx_show and a5xx_gpu_state_put static
Date:   Wed,  9 Oct 2019 12:46:07 +0100
Message-Id: <20191009114607.701-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The a5xx_show and a5xx_gpu_state_put objects are not exported
outside of the file, so make them static to avoid the following
warnings from sparse:

drivers/gpu/drm/msm/adreno/a5xx_gpu.c:1292:5: warning: symbol 'a5xx_gpu_state_put' was not declared. Should it be static?
drivers/gpu/drm/msm/adreno/a5xx_gpu.c:1302:6: warning: symbol 'a5xx_show' was not declared. Should it be static?

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index e9c55d1d6c04..7fdc9e2bcaac 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -1289,7 +1289,7 @@ static void a5xx_gpu_state_destroy(struct kref *kref)
 	kfree(a5xx_state);
 }
 
-int a5xx_gpu_state_put(struct msm_gpu_state *state)
+static int a5xx_gpu_state_put(struct msm_gpu_state *state)
 {
 	if (IS_ERR_OR_NULL(state))
 		return 1;
@@ -1299,8 +1299,8 @@ int a5xx_gpu_state_put(struct msm_gpu_state *state)
 
 
 #if defined(CONFIG_DEBUG_FS) || defined(CONFIG_DEV_COREDUMP)
-void a5xx_show(struct msm_gpu *gpu, struct msm_gpu_state *state,
-		struct drm_printer *p)
+static void a5xx_show(struct msm_gpu *gpu, struct msm_gpu_state *state,
+		      struct drm_printer *p)
 {
 	int i, j;
 	u32 pos = 0;
-- 
2.23.0

