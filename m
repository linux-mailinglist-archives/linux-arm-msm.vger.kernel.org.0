Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70E92465931
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Dec 2021 23:26:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353586AbhLAWaL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Dec 2021 17:30:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353622AbhLAWaC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Dec 2021 17:30:02 -0500
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 103DBC061574
        for <linux-arm-msm@vger.kernel.org>; Wed,  1 Dec 2021 14:26:41 -0800 (PST)
Received: by mail-lj1-x235.google.com with SMTP id d11so51081124ljg.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Dec 2021 14:26:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=F6F3WPxfyMvxOGFVFzP69ATi4vGo49QVFI+qg3mn8Wg=;
        b=o7ErKwOInkuJ/TeFfq8CxMf8JeSlpaYibVC+EzB6kuYi1h5PjYv/+Yrrqmv/VC2Phz
         odHWNsKT6hMpfLMc+RUuoabaabA5QlUU/iOgucmBLoZ7KEAPz0TTkHtlFfhJN+dXZsG8
         YHKv4KeSD+tFlotOpoZhRwKoGiLoNPJ/TTekUHIyluUyyLXyXs5msB/Af0QFwp3dUh+g
         sJPKv0+uBpAhLzPUx960lGn3KJEzkjLzGt9UwxcSRyL2ET4gb4MYEiJIsYpGY+6PGI6z
         IAuPsfaIsHQruW0pjAH0x/bOr/TDE1llmDiVNrZRLTR8jfYNuq3GN6Lrt6oN+63jxLge
         plvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=F6F3WPxfyMvxOGFVFzP69ATi4vGo49QVFI+qg3mn8Wg=;
        b=f2mJFy84JMFJiMcfNFI9/UL31ki9QmbRh//H1kLcM8kVddQRnayIlF/d4s5IQz6qri
         fEgjshktLr7YunnPIIgZXVZV/jGlsETNfX7FGitEoBZHK2muqEwr7iHb1/4RlPf8fcYA
         l8el/HGSLNK52XbnCxS262lUNKB9A8YdhX0oRzc8Y10jkWqJIAKGC6Nz9+Fq3Xstnw9E
         /f9sIbo4oxZ2QqqlKnk1SC6nXHeEz21CgGRK3lHvKLEXec/+5/mrk93S2+kHyqgi0J0j
         gRxTbWRCxxx49t+V/yoDlcThRZAHSRSH/SGHWTjS6B7xusRD1N+XeKTHjMc010OvKt/8
         Mzkg==
X-Gm-Message-State: AOAM5332PXkDFsyZMXUv0LkBGliN38bX87VoYVKevelBlQsTP1UD6Scq
        KJ6krGrCLpSAHUPqPPFWBs/wfg==
X-Google-Smtp-Source: ABdhPJzaqWQVe9yEJqQno/GA6ULFW+0oG9KsRBzz6NDmEuN/UoAvkV7RdkxlLyqlf+MDd7EVPTyYKw==
X-Received: by 2002:a2e:b751:: with SMTP id k17mr7950866ljo.467.1638397599403;
        Wed, 01 Dec 2021 14:26:39 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u7sm117004lfs.144.2021.12.01.14.26.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Dec 2021 14:26:39 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v1 4/8] drm/msm/dpu: drop plane's default_scaling debugfs file
Date:   Thu,  2 Dec 2021 01:26:29 +0300
Message-Id: <20211201222633.2476780-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211201222633.2476780-1-dmitry.baryshkov@linaro.org>
References: <20211201222633.2476780-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Proper support for the 'default_scaling' debugfs file was removed during
DPU driver pre-merge cleanup. Remove leftover file.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 6ea4db061c9f..f80ee3ba9a8a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -114,7 +114,6 @@ struct dpu_plane {
 	struct dpu_debugfs_regset32 debugfs_src;
 	struct dpu_debugfs_regset32 debugfs_scaler;
 	struct dpu_debugfs_regset32 debugfs_csc;
-	bool debugfs_default_scale;
 };
 
 static const uint64_t supported_format_modifiers[] = {
@@ -1398,10 +1397,6 @@ static int _dpu_plane_init_debugfs(struct drm_plane *plane)
 		dpu_debugfs_create_regset32("scaler_blk", 0400,
 				pdpu->debugfs_root,
 				&pdpu->debugfs_scaler);
-		debugfs_create_bool("default_scaling",
-				0600,
-				pdpu->debugfs_root,
-				&pdpu->debugfs_default_scale);
 	}
 
 	if (cfg->features & BIT(DPU_SSPP_CSC) ||
-- 
2.33.0

