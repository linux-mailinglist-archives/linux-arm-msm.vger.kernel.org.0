Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D04F3622BB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Apr 2021 16:51:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236387AbhDPOiE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Apr 2021 10:38:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236281AbhDPOiB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Apr 2021 10:38:01 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF435C061760
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Apr 2021 07:37:34 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id sd23so33832478ejb.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Apr 2021 07:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/33rrW6tAmVtxRYoiv0PK1lc5LAomei+z6FwtqsCisM=;
        b=mr7mcxDCkJ8MhFaVouTHt6dvkAGmS8HK4Hsecj8ryEDXuyrg6L3br6ohFHv7uAsu9T
         w3j+TgQ6YNNQrtMauk4qHrptT7OQWrR9oytM5dUgU4dwD2kElP4WYvTD4HnV0c9LphsH
         B6njwvTRZyxuf0MLnd4gH/1NsT4Wy6couYfoPQBqYkHmqav6uTU/hKc1uCV/j8eu7X7U
         38LacZ+Zq/pHDs3pKO/MRnv5uhxP8Ncrrq68OkHgpX3t3MFaPm2LuytYSbP8ep7k12KJ
         6bFJinfIbvCy2mmXSDrIp5dC/a3aenEyXyO7KTo82kBVW5SBZC/xKczOCAIKXRZNkq/1
         Wl9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/33rrW6tAmVtxRYoiv0PK1lc5LAomei+z6FwtqsCisM=;
        b=XAThbUFnf9AoVsdN6x5be5o0I1W2qKF+0H46NYcjrxt8R48aX1KAKUcTU8cFKzGHmU
         ASbNqMIFElyl143pIOK9ik/Y5N8Fpd3Zg3Wss5+itxPPEwHy30lj/iPAclTQdrTpNc6I
         zq2GARJ/GqugIYFjrDm59dGMxoLHvoHfA3ufwNanMBBX3j1Jdg1cUVIjeqVq+1YinMON
         /oRiy6qI2fHpoGySj0mD+vGtEfVcSOmsAauJqBB9NzyP/JiNFaMbS6ouy9GEN/AP/39r
         Qr9USO9g56fk0VtykEzBzNrNkv8xyRdqOV0UQAeuuqe+3tLuD4o2sNE3ZBOA5In2YoPe
         vtlQ==
X-Gm-Message-State: AOAM5315XJdZnyapxYSV5s0UC01PVm+fx72nxIdTwxBd3Pl5Sd4pO2lr
        +xDblzfXgs8ysUhpQ92DGUzJog==
X-Google-Smtp-Source: ABdhPJwwfH4O9ibDHVnq4+L1No/DlqAhAj3OnYY5JG+/HseoSx+4QpnBSUWZrA55lAFlFlfoaQn0Hw==
X-Received: by 2002:a17:906:7842:: with SMTP id p2mr9043139ejm.87.1618583853536;
        Fri, 16 Apr 2021 07:37:33 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id j10sm1326523ejk.93.2021.04.16.07.37.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Apr 2021 07:37:33 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Kuogee Hsieh <khsieh@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 03/40] drm/msm/dp/dp_display: Remove unused variable 'hpd'
Date:   Fri, 16 Apr 2021 15:36:48 +0100
Message-Id: <20210416143725.2769053-4-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210416143725.2769053-1-lee.jones@linaro.org>
References: <20210416143725.2769053-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/msm/dp/dp_display.c: In function ‘dp_display_usbpd_attention_cb’:
 drivers/gpu/drm/msm/dp/dp_display.c:496:19: warning: variable ‘hpd’ set but not used [-Wunused-but-set-variable]

Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Kuogee Hsieh <khsieh@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 5a39da6e1eaf2..31bf2a40a9eb2 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -493,7 +493,6 @@ static int dp_display_usbpd_attention_cb(struct device *dev)
 	int rc = 0;
 	u32 sink_request;
 	struct dp_display_private *dp;
-	struct dp_usbpd *hpd;
 
 	if (!dev) {
 		DRM_ERROR("invalid dev\n");
@@ -507,8 +506,6 @@ static int dp_display_usbpd_attention_cb(struct device *dev)
 		return -ENODEV;
 	}
 
-	hpd = dp->usbpd;
-
 	/* check for any test request issued by sink */
 	rc = dp_link_process_request(dp->link);
 	if (!rc) {
-- 
2.27.0

