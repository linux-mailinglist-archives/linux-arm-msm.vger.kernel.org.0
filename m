Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 926017A3BDC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 Sep 2023 22:23:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239624AbjIQUX3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 17 Sep 2023 16:23:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240834AbjIQUXA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 17 Sep 2023 16:23:00 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1E4610C;
        Sun, 17 Sep 2023 13:22:54 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2B68C433CC;
        Sun, 17 Sep 2023 20:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1694982174;
        bh=o+v4PonNWogajHJSkZS2mVYZgXbtsc/JbpSiBRtaDaA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Z/E093lFRfk/PbxA9FMF0lcfr0QCN4NN/VfVjXhjYpcKKdgARw6cImGaw1qYYwKXo
         4sYqmUTsM0n68/+ydTAcPZe3O5qYV+J5VpQjBgCrKjtzWUoKbMxQKmGVHC2juhOvbg
         RlhzbFr7Lq0ge4QReoHBlTC4b/YR71ehA8JhxDlo=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     stable@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        patches@lists.linux.dev,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        dorum@noisolation.com, Daniel Vetter <daniel.vetter@intel.com>,
        Sasha Levin <sashal@kernel.org>
Subject: [PATCH 5.15 173/511] drm/msm/mdp5: Dont leak some plane state
Date:   Sun, 17 Sep 2023 21:10:00 +0200
Message-ID: <20230917191118.012295435@linuxfoundation.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230917191113.831992765@linuxfoundation.org>
References: <20230917191113.831992765@linuxfoundation.org>
User-Agent: quilt/0.67
X-stable: review
X-Patchwork-Hint: ignore
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

5.15-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Daniel Vetter <daniel.vetter@ffwll.ch>

[ Upstream commit fd0ad3b2365c1c58aa5a761c18efc4817193beb6 ]

Apparently no one noticed that mdp5 plane states leak like a sieve
ever since we introduced plane_state->commit refcount a few years ago
in 21a01abbe32a ("drm/atomic: Fix freeing connector/plane state too
early by tracking commits, v3.")

Fix it by using the right helpers.

Fixes: 21a01abbe32a ("drm/atomic: Fix freeing connector/plane state too early by tracking commits, v3.")
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: freedreno@lists.freedesktop.org
Reported-and-tested-by: dorum@noisolation.com
Cc: dorum@noisolation.com
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Reviewed-by: Rob Clark <robdclark@gmail.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Patchwork: https://patchwork.freedesktop.org/patch/551236/
Link: https://lore.kernel.org/r/20230803204521.928582-1-daniel.vetter@ffwll.ch
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
index 9c42776cb9a8a..f9cae6460c3be 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
@@ -128,8 +128,7 @@ static void mdp5_plane_destroy_state(struct drm_plane *plane,
 {
 	struct mdp5_plane_state *pstate = to_mdp5_plane_state(state);
 
-	if (state->fb)
-		drm_framebuffer_put(state->fb);
+	__drm_atomic_helper_plane_destroy_state(state);
 
 	kfree(pstate);
 }
-- 
2.40.1



