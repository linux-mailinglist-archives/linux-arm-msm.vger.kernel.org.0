Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C77B537F094
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 May 2021 02:42:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232100AbhEMAnw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 May 2021 20:43:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233287AbhEMAlu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 May 2021 20:41:50 -0400
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com [IPv6:2607:f8b0:4864:20::832])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7C8FC06138A
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 May 2021 17:39:06 -0700 (PDT)
Received: by mail-qt1-x832.google.com with SMTP id m13so3429506qtk.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 May 2021 17:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/Suj7rUF8MJYpSENOVcgNKkIQ7HdP/cqmF4RJs83xUg=;
        b=Ok4b06fm240rt6q8SJwuDlWX3p0+7j3KUQCdoVM61MLZizJKrH3WzYjt2R8/VHvuHd
         nlwYxjoVLi7VSPzGhiBjj9Ha4Hzv6Uo+Pn62IGsq/M+YOZ+gKmWIsPSO7Aitg0gN3/Dx
         zOAcsoAv8bo8pcDo+Y6KUR43zefAjHUfQdHktVOHb+916Dxmo2JHKI8lUwEop6tI806V
         KHffv1x5FOG5QrIEeBdhKrq30VOi7LpDmA7oFXZRBDDZD3IqKueXGVVFto0nqfeurDM/
         kulCd2rG9bue1lCuX3n4+ow6bDIKfsBLLLnw0X0dScRtw074SOK18O4AlF3R6EOTrR61
         EQXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/Suj7rUF8MJYpSENOVcgNKkIQ7HdP/cqmF4RJs83xUg=;
        b=GRj2YiYjdU7+i6keYFCyZD/VMcc5Tm7E8aSoXvoJBw7O3NjhFUFaRCWisMNmgPhN7g
         OOiEAKXakNflWldwzudvXWH0AfMe9iih90+rBiClsQyp6nVucAqj7yIhWSYnw5lPwEeZ
         R2gxlE/nuwTNPI6jdj9hh+3IsBHAW2fajKRY8lqZANxUm5wi8egQOP9Jts8hXW05W18h
         sJfzOy8PQnHAqPky5uVp3oezaVJCpB+dpJUC5x0i822Un0DSW66eRvJtiJyzdcEUeF67
         tgt9KRigo13ljSaEAXh89XZwinq6qwpOgzMNG7xwl9myQebOF/+Tyw4U/TE1X79ov0rn
         znqw==
X-Gm-Message-State: AOAM530FWXIMicG9nrUa0P767quUnkEcyJraw+397BLV90+W8dSU7VUx
        ZHr3pzNYaGr3PAUOLmbfY6/+vA==
X-Google-Smtp-Source: ABdhPJxTw1P3oaoCV0WfoXRiB/+wKSwQTK+iAtqp6IJbfH0cUqEkpY2KsJRruijFgA1FamuFr24gBQ==
X-Received: by 2002:a05:622a:154:: with SMTP id v20mr4064234qtw.91.1620866346172;
        Wed, 12 May 2021 17:39:06 -0700 (PDT)
Received: from localhost.localdomain (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
        by smtp.gmail.com with ESMTPSA id w16sm1204201qts.70.2021.05.12.17.39.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 May 2021 17:39:05 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     freedreno@lists.freedesktop.org
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Eric Anholt <eric@anholt.net>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        dri-devel@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/5] drm/msm/a6xx: avoid shadow NULL reference in failure path
Date:   Wed, 12 May 2021 20:37:46 -0400
Message-Id: <20210513003811.29578-3-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20210513003811.29578-1-jonathan@marek.ca>
References: <20210513003811.29578-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

If a6xx_hw_init() fails before creating the shadow_bo, the a6xx_pm_suspend
code referencing it will crash. Change the condition to one that avoids
this problem (note: creation of shadow_bo is behind this same condition)

Fixes: e8b0b994c3a5 ("drm/msm/a6xx: Clear shadow on suspend")
Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 727d111a413f..01bd31b3c504 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1211,7 +1211,7 @@ static int a6xx_pm_suspend(struct msm_gpu *gpu)
 	if (ret)
 		return ret;
 
-	if (adreno_gpu->base.hw_apriv || a6xx_gpu->has_whereami)
+	if (a6xx_gpu->shadow_bo)
 		for (i = 0; i < gpu->nr_rings; i++)
 			a6xx_gpu->shadow[i] = 0;
 
-- 
2.26.1

