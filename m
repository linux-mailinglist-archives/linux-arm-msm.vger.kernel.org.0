Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C3CD4181202
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2020 08:34:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726923AbgCKHeN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Mar 2020 03:34:13 -0400
Received: from mx2.suse.de ([195.135.220.15]:45034 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726160AbgCKHeN (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Mar 2020 03:34:13 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 0CEE9AF5B;
        Wed, 11 Mar 2020 07:34:12 +0000 (UTC)
From:   Takashi Iwai <tiwai@suse.de>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: [PATCH] drm/msm: Use scnprintf() for avoiding potential buffer overflow
Date:   Wed, 11 Mar 2020 08:34:10 +0100
Message-Id: <20200311073410.6599-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Since snprintf() returns the would-be-output size instead of the
actual output size, the succeeding calls may go beyond the given
buffer limit.  Fix it by replacing with scnprintf().

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 7fd29829b2fa..1d5c43c22269 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -673,7 +673,7 @@ static char *adreno_gpu_ascii85_encode(u32 *src, size_t len)
 		return NULL;
 
 	for (i = 0; i < l; i++)
-		buf_itr += snprintf(buf + buf_itr, buffer_size - buf_itr, "%s",
+		buf_itr += scnprintf(buf + buf_itr, buffer_size - buf_itr, "%s",
 				ascii85_encode(src[i], out));
 
 	return buf;
-- 
2.16.4

