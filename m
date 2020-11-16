Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9AC82B4E0D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Nov 2020 18:48:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387733AbgKPRlu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Nov 2020 12:41:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387754AbgKPRls (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Nov 2020 12:41:48 -0500
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62518C0617A6
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2020 09:41:48 -0800 (PST)
Received: by mail-wr1-x442.google.com with SMTP id o15so19659378wru.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2020 09:41:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zaOWUirapOMKdJjjw4CYfsGkQWJEzsRRXuyaScDdWWw=;
        b=SZzvnaPlGmKaGhwLDI8bK/PrqeAqX3Tzh3PFCfAojHswVs3cNeVXia8ZyyNr/0HKml
         0Z7cEu+HZ/LfqDgJH3XVE36FVTy+hRhvEH6UZwZ2iS/UnxNr3bpr+YcDcNoJLSFym2sd
         enlFXh22dS+MhLz8hfl7RwQjUVJ35/+HjAKVQfY3sZi/xGOXVfq08KxiPIJiTHQFtk0O
         QivALG0h+IlOt2wmevscLXqGad1jp/hRwb321/w6WSfb0PErg240VG6L7pYaiGwhMDgR
         3hEM11SF8rorHuesj2T5fPLYilixaTFMkw/mSdNSJzVMFQLZqGEYLLtPFfziBjOOp8/h
         t6NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zaOWUirapOMKdJjjw4CYfsGkQWJEzsRRXuyaScDdWWw=;
        b=A7BK/4BmwMTGtxRnMQCozhYR325JnmSD9dMmI3LwVy1KjZprmYo5iGjQ0KhI5HasnT
         p0ZEyPBPfbMrBBvhwnyMq+6FM0LDuYvokowI4hA5Xv8TkhQTUtZbp5dJSa77O+IWBDuH
         rRLN33mmWSzUNY/H+I9thSUDStuOFSvVEVDkO/TKMrMXN5gCkYHLtMJM6+lUTTAlOGkX
         FjMdRNkrgRVGLslUymeV4ocsVxyxXfVMVL0Ipkr6KSe1vsNkkNyRHPpRVixznhJCiGSo
         dH2MZdYQGcIgV4ztVY83KQu0rfjM7n/TpTzIqidR3R90U2PsDr99tOMKQN4tna+JGeKd
         zz4w==
X-Gm-Message-State: AOAM532Do1LkFYZ3qQ+unGYZOefa/A0+2Jy7xdce2xvsovzaURBwhlRJ
        iS0xsiFPJ3shdpcomXTIQN8zIw==
X-Google-Smtp-Source: ABdhPJwDRGMUsoxv5ZHmxzgDdOLRIafHWuBlZ52nBUgXdgXycAMRa/hoxqy8d2KU665TpEmzQkY4KQ==
X-Received: by 2002:a5d:654a:: with SMTP id z10mr19192489wrv.285.1605548507104;
        Mon, 16 Nov 2020 09:41:47 -0800 (PST)
Received: from dell.default ([91.110.221.159])
        by smtp.gmail.com with ESMTPSA id n10sm24667224wrx.9.2020.11.16.09.41.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2020 09:41:46 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Abhinav Kumar <abhinavk@codeaurora.org>
Subject: [PATCH 18/42] drm/msm/disp/mdp5/mdp5_kms: Make local functions 'mdp5_{en,dis}able()' static
Date:   Mon, 16 Nov 2020 17:40:48 +0000
Message-Id: <20201116174112.1833368-19-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201116174112.1833368-1-lee.jones@linaro.org>
References: <20201116174112.1833368-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c:299:5: warning: no previous prototype for ‘mdp5_disable’ [-Wmissing-prototypes]
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c:319:5: warning: no previous prototype for ‘mdp5_enable’ [-Wmissing-prototypes]

Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index b3eecf8694771..15aed45022bc8 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -296,7 +296,7 @@ static const struct mdp_kms_funcs kms_funcs = {
 	.set_irqmask         = mdp5_set_irqmask,
 };
 
-int mdp5_disable(struct mdp5_kms *mdp5_kms)
+static int mdp5_disable(struct mdp5_kms *mdp5_kms)
 {
 	DBG("");
 
@@ -316,7 +316,7 @@ int mdp5_disable(struct mdp5_kms *mdp5_kms)
 	return 0;
 }
 
-int mdp5_enable(struct mdp5_kms *mdp5_kms)
+static int mdp5_enable(struct mdp5_kms *mdp5_kms)
 {
 	DBG("");
 
-- 
2.25.1

