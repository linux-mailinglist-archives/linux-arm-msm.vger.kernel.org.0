Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCBE53E131D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Aug 2021 12:47:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240541AbhHEKsG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Aug 2021 06:48:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240556AbhHEKrz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Aug 2021 06:47:55 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A182C06179F
        for <linux-arm-msm@vger.kernel.org>; Thu,  5 Aug 2021 03:47:27 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id ec13so7769568edb.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Aug 2021 03:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0nW6BUxnI6TMJMo1WltvrQ4AqMv928Ed54nT/6I6Mgc=;
        b=kESKOMxUYcelz7HM18OazIQNnelJPkPp4bRWps3UliaFeiOxyYx1/3QCkERRsBA8wU
         8ZavOyGiJEOH+N9YFOQnjoK3eiSnjhna91L1Nl2oVa1Im9lIvgNznhFGMzAStYwvm9d/
         vNBehUeIQZOaKlykjrBz0eT5YNBZIyYply6MA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0nW6BUxnI6TMJMo1WltvrQ4AqMv928Ed54nT/6I6Mgc=;
        b=gNfk1AoZOWVV6IK4ysHAl6yT1fBRBVP/wMSutp1ALW8VANK0oPjyW2qUVaAdY36TNc
         iG9K95Tx5DCTpx/sPsX2f5bRTQKJMV0DkapmM5UA+Qb6q6uNQjl4KYZwq/HgsNnTZoD0
         ntgn02Vzza9qbKrvxOXRMmd3j3FJaH9+/kZdnnRJ0yifUAEj6HPnCGI+DyIHbI5DExN7
         KFEYIDOiZJwwjpw0DEmjQcNsMupTilsMSQQal/joFWzGDJZ/u9dw5Yl+zAUICYq5Ddjp
         cHjtdPQX3pQVqEegHeg4ToxTQDrtQNMf9mgRcaz2fvQJnlS99NGM2M8DPp4SJtx/rq5V
         jTmg==
X-Gm-Message-State: AOAM5321aFSMTN2VgQ4tLCesguUNYBLaJO7Ud+GUg0GNstDFbg+/zdy5
        gktF/KXU3ec0+/lSaGxkOzcIKg==
X-Google-Smtp-Source: ABdhPJyWr04CWCimxVfH49eigYJCVRGOcuvnO0amqFreQofVHnnHbSdvHVyVQAuSX0vwApjBSt4aKg==
X-Received: by 2002:a05:6402:b82:: with SMTP id cf2mr5572534edb.71.1628160445836;
        Thu, 05 Aug 2021 03:47:25 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id p5sm1578809ejl.73.2021.08.05.03.47.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Aug 2021 03:47:25 -0700 (PDT)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Lucas Stach <l.stach@pengutronix.de>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: [PATCH v5 16/20] drm/msm: Don't break exclusive fence ordering
Date:   Thu,  5 Aug 2021 12:47:01 +0200
Message-Id: <20210805104705.862416-17-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210805104705.862416-1-daniel.vetter@ffwll.ch>
References: <20210805104705.862416-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

There's only one exclusive slot, and we must not break the ordering.

Adding a new exclusive fence drops all previous fences from the
dma_resv. To avoid violating the signalling order we err on the side of
over-synchronizing by waiting for the existing fences, even if
userspace asked us to ignore them.

A better fix would be to us a dma_fence_chain or _array like e.g.
amdgpu now uses, but
- msm has a synchronous dma_fence_wait for anything from another
  context, so doesn't seem to care much,
- and it probably makes sense to lift this into dma-resv.c code as a
  proper concept, so that drivers don't have to hack up their own
  solution each on their own.

v2: Improve commit message per Lucas' suggestion.

Cc: Lucas Stach <l.stach@pengutronix.de>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: linux-arm-msm@vger.kernel.org
Cc: freedreno@lists.freedesktop.org
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index fb5a2eab27a2..66633dfd58a2 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -330,7 +330,8 @@ static int submit_fence_sync(struct msm_gem_submit *submit, bool no_implicit)
 				return ret;
 		}
 
-		if (no_implicit)
+		/* exclusive fences must be ordered */
+		if (no_implicit && !write)
 			continue;
 
 		ret = drm_sched_job_add_implicit_dependencies(&submit->base,
-- 
2.32.0

