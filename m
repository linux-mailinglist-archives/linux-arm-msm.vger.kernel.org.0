Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ED7D61419A2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Jan 2020 21:41:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726935AbgARUl2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 18 Jan 2020 15:41:28 -0500
Received: from onstation.org ([52.200.56.107]:39842 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726933AbgARUl1 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 18 Jan 2020 15:41:27 -0500
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id 3EA7F3E8F8;
        Sat, 18 Jan 2020 20:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1579380087;
        bh=w70lZdIZVmnTV+8m8BSpRyKKax6Xt6F/OwKbi0BD6AY=;
        h=From:To:Cc:Subject:Date:From;
        b=TP6xNLqcK1YGG4IdG1i2ZyZb3gJiaPGkeYG1cLqQROIGxEm56OjiZq0suJHn2B66J
         f9AodHxoM5cVVn0wWUt3ZMxb9EpsrrF4zir3O0MmmG6XkWWrI+C4U6Um0gVSuSEbRH
         4nT6PkREzMFQfsttyxWvMGm/R006lWERbNCLkwGk=
From:   Brian Masney <masneyb@onstation.org>
To:     robdclark@gmail.com
Cc:     sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/msm/mdp5: rate limit pp done timeout warnings
Date:   Sat, 18 Jan 2020 15:41:20 -0500
Message-Id: <20200118204120.1039774-1-masneyb@onstation.org>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add rate limiting of the 'pp done time out' warnings since these
warnings can quickly fill the dmesg buffer.

Signed-off-by: Brian Masney <masneyb@onstation.org>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
index 05cc04f729d6..e1cc541e0ef2 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
@@ -1109,8 +1109,8 @@ static void mdp5_crtc_wait_for_pp_done(struct drm_crtc *crtc)
 	ret = wait_for_completion_timeout(&mdp5_crtc->pp_completion,
 						msecs_to_jiffies(50));
 	if (ret == 0)
-		dev_warn(dev->dev, "pp done time out, lm=%d\n",
-			 mdp5_cstate->pipeline.mixer->lm);
+		dev_warn_ratelimited(dev->dev, "pp done time out, lm=%d\n",
+				     mdp5_cstate->pipeline.mixer->lm);
 }
 
 static void mdp5_crtc_wait_for_flush_done(struct drm_crtc *crtc)
-- 
2.24.1

