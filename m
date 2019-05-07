Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F51216AF9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2019 21:14:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726666AbfEGTOR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 May 2019 15:14:17 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:48626 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726642AbfEGTOQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 May 2019 15:14:16 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 5940D609F3; Tue,  7 May 2019 19:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1557256456;
        bh=fOdzMX7nkWBq97wocFIszly8aNfD4psiyZU/x1LQois=;
        h=From:To:Cc:Subject:Date:From;
        b=R6OYhfE6g8aa0cZBAnPiB/JFrOV0itf15UMPQ2zQpb1LcYcCqEnPUmXHP+q9q8X/k
         LOcJCXJzysFIo2NHBF/6jWN+MGz6AP4IJgE4H4WznlEjalc1ls6Wr8iUsuK01+VOdN
         8Sb2mqcejGbeKAfbk0WhKQdKBNQnkojsZ148b6Mw=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id F3D8C609F3;
        Tue,  7 May 2019 19:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1557256455;
        bh=fOdzMX7nkWBq97wocFIszly8aNfD4psiyZU/x1LQois=;
        h=From:To:Cc:Subject:Date:From;
        b=lWdVLrBN2AlTjCxGhuxp6fugiuSz7j4xPZ5/SC/6JPZ8U8VBYDIfJQQ2CC9xVy0Wl
         Uxx2hU6ksXcgRdHfkc/HDBUMJyREpm1KoZLSbG8K/hPFGptuzRPc4PfVoNk5vrwWyW
         OSWFiOm9FHwznwXGv8ixPo8ZckrW1vBm4Qgmz4G8=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org F3D8C609F3
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     freedreno@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, Sean Paul <sean@poorly.run>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        David Airlie <airlied@linux.ie>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/atomic: Check that the config funcs exist drm_mode_alloc
Date:   Tue,  7 May 2019 13:14:11 -0600
Message-Id: <1557256451-24950-1-git-send-email-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

An error while initializing the msm driver ends up calling
drm_atomic_helper_shutdown() without first initializing the funcs
in mode_config. While I'm not 100% sure this isn't a ordering
problem in msm adding a check to drm_mode_alloc seems like
a nice and safe solution.

Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
---

 drivers/gpu/drm/drm_atomic.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 5eb4013..1729428 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -114,6 +114,9 @@ drm_atomic_state_alloc(struct drm_device *dev)
 {
 	struct drm_mode_config *config = &dev->mode_config;
 
+	if (!config->funcs)
+		return NULL;
+
 	if (!config->funcs->atomic_state_alloc) {
 		struct drm_atomic_state *state;
 
-- 
2.7.4

