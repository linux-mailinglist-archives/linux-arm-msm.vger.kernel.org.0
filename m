Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D705231005C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Feb 2021 23:55:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229621AbhBDWyz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Feb 2021 17:54:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229549AbhBDWyy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Feb 2021 17:54:54 -0500
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1BE2C0613D6;
        Thu,  4 Feb 2021 14:54:13 -0800 (PST)
Received: by mail-pg1-x534.google.com with SMTP id z21so3177290pgj.4;
        Thu, 04 Feb 2021 14:54:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mdTwxZRVmDjNbDvFpGlHxe4YobP1MixFfZCkGPsWCxs=;
        b=qCSC/wVatdr4qz/USj4a8Cm09DUro653to4ZGejSPTfuHxXsMrHxCpCtDgsbgoNr/1
         Ticsyi1hD+0BKN2I+9oXDvYMJ5zcjTeCNxuhh050tDGo0pjzwAqt3iqLyq8fecaAyC9G
         ajJZEjYBlywf0SoTCwmZasrQgz46PGLYOiXeVQhrKIUdg5MRmuz2+iB8xgPCMIIzKrQL
         NyLGgw+LptN0tSEWvy1mSY5m+EdfJXy4tcdcJ1VDz+fhtK+IfO4o9FDtRkjt9exsQjnU
         Vu08fGozzk5eMj+v9QII9BhCTy3V8Vqi4SzwFkBzBSiSRzkpg18s9NQ74qyK8+hIZ0Ji
         HxpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mdTwxZRVmDjNbDvFpGlHxe4YobP1MixFfZCkGPsWCxs=;
        b=G4X9aQup7ZpVC4Krk+kGgUclCN9UBHjjLxQSenCq5HEENjtUk9QnUfg3FAkpRfEt39
         OW24c9h6ejUCzw7Nl8niGC5R4Tx/Q/2dDanGZ8ErV8QRWfIsxO9wIN/I09GB8df8o8b4
         alVMjaMyMqzCVubT7oHA868yeZ5uQ2lguA2TIrxO066IfBG+QuRj+7wY6Rx1SuIIX0B3
         uh8bSQIsEFW58xq0Xspe36oqamMHsOAxT7NZXIoondu5YhfcreoTAgxFgDZBryE9CDXa
         co34PYZ+8CZYSR9FYf0dhL0h7nRwZhV8fh7ESb2ez9/MuPqlRzYBx3pt8cBVbAYv517V
         jaUg==
X-Gm-Message-State: AOAM533AHOQJJMBujs6vEM18aGUEzGHPn+bVI0BrbP/eaFPNc8ovGVRr
        bYhEC7tMuEFSSb3Yr8aDWMc=
X-Google-Smtp-Source: ABdhPJxvN4byxugjYm4+2KCdf2189pKaG5B0yxje7rgqJb8Kx9C6qDRtFqbmjRmwrty6MCrhIrxolQ==
X-Received: by 2002:a63:7051:: with SMTP id a17mr1248360pgn.26.1612479253528;
        Thu, 04 Feb 2021 14:54:13 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id b65sm7277488pfg.3.2021.02.04.14.54.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Feb 2021 14:54:12 -0800 (PST)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Rob Clark <robdclark@chromium.org>,
        Emil Velikov <emil.velikov@collabora.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        "Kristian H. Kristensen" <hoegsberg@google.com>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm: Fix legacy relocs path
Date:   Thu,  4 Feb 2021 14:56:49 -0800
Message-Id: <20210204225650.1284384-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

In moving code around, we ended up using the same pointer to
copy_from_user() the relocs tables as we used for the cmd table
entry, which is clearly not right.  This went unnoticed because
modern mesa on non-ancent kernels does not actually use relocs.
But this broke ancient mesa on modern kernels.

Reported-by: Emil Velikov <emil.velikov@collabora.com>
Fixes: 20224d715a88 ("drm/msm/submit: Move copy_from_user ahead of locking bos")
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index d04c349d8112..5480852bdeda 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -198,6 +198,8 @@ static int submit_lookup_cmds(struct msm_gem_submit *submit,
 		submit->cmd[i].idx  = submit_cmd.submit_idx;
 		submit->cmd[i].nr_relocs = submit_cmd.nr_relocs;
 
+		userptr = u64_to_user_ptr(submit_cmd.relocs);
+
 		sz = array_size(submit_cmd.nr_relocs,
 				sizeof(struct drm_msm_gem_submit_reloc));
 		/* check for overflow: */
-- 
2.29.2

