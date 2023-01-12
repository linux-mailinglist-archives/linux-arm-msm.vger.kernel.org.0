Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 44F42666AE4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jan 2023 06:37:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230285AbjALFhH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Jan 2023 00:37:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236568AbjALFhG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Jan 2023 00:37:06 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C591A4D707
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jan 2023 21:37:01 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id bp15so26827490lfb.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jan 2023 21:37:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=euPiCyuxjKhvf7883JyXlPwa55bTGV9dDUqFNI2G4e4=;
        b=CxqNhg7RmF6aUndfw64nsrJhUdJMUyZ5J34c0SbGaR1+Z5GljQ3Pnw9dA8UnUdANAK
         fPUsMVl8FbMXKYA4vhWYfAeHMgV1vK9SDpif2K7xzrz9wLMLZa89K5VK7Ro2f8rbNcFd
         tsOILCo6F4WIVGZXFblu1bXDTjXDPgJ8iFExxEAYPefIyGXGmxbd+NAFEw4aWAixLGAU
         KmzdVHlW/0K7fbbr2LL0DVnRkEVwxUMnc1GpzwgB51hvo01Clo9TjdvKcK6yFmxhf3Tb
         eSYJ9pezywDcPmK1hLdE+j2RkoC2ioLMFT/ap5/VWsYg/CZZIXa8CM3DwiH1BU4MYtrl
         cqqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=euPiCyuxjKhvf7883JyXlPwa55bTGV9dDUqFNI2G4e4=;
        b=fPjdzBPOe7F6h6OwTaVFxXueTYthRwiyrYp1ndQ/cIVXkQHiyKPlG+Q7vON3WaO9r5
         x5UXK4kKAgm4F+A4VZ7kSeHtDYBA3kTUUikG9hMbR65buhuh4FcOM4h5AKSjpCrklRIU
         xiW5uh/QbmJcYTt3yaGucYox27fPXlrJZxHS8Mva09jwRSAT/4y9xWLyBOOxs1+0GabJ
         OBIP+3S5m4epXdzR2ugN4sf8IUV/e/PT8Vv/P4cVWcHdFTHd3uWPF1+eC3Ye4Skh3GiG
         24BCxl8eElkF58W04RmCSf/BeOmR9sn7BvnJA8cjEh6dQKLKmFwWQfdwpQpdY9Ev2nz4
         Srsw==
X-Gm-Message-State: AFqh2krVWa0YB46q0tTySbJhnakOoZ5Vn5zG62vF03BGR8b/VjXOadS9
        wN9y5ycidK7KY/VKUFtw2okHArVFzXWkqp7K
X-Google-Smtp-Source: AMrXdXuvririeBJ8WjXu2KAx0GI2JmDnxcCjGnVxFSF1Yor8Y9Ngws9wxghdxTZtDynrUZ9x2d/2aQ==
X-Received: by 2002:a05:6512:3a91:b0:4b5:9b8f:cc89 with SMTP id q17-20020a0565123a9100b004b59b8fcc89mr24059401lfu.55.1673501820199;
        Wed, 11 Jan 2023 21:37:00 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id bq26-20020a056512151a00b004ae24559388sm3077817lfb.111.2023.01.11.21.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 21:36:59 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH] drm/msm/dpu: merge two CRTC debugfs dirs
Date:   Thu, 12 Jan 2023 07:36:59 +0200
Message-Id: <20230112053659.1361298-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

For each CRTC we are creating two different debugfs directories one
using crtc index (created automatically for the CRC files) and another
one using CRTC name/object ID (for state and status files).

This can be confusing, so move our custom files to crtc->debugfs_entry,
effetively merging two debugfs dirs.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 7f0f467dbabd..659fdfec5346 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1380,16 +1380,12 @@ DEFINE_SHOW_ATTRIBUTE(dpu_crtc_debugfs_state);
 static int _dpu_crtc_init_debugfs(struct drm_crtc *crtc)
 {
 	struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
-	struct dentry *debugfs_root;
-
-	debugfs_root = debugfs_create_dir(dpu_crtc->name,
-			crtc->dev->primary->debugfs_root);
 
 	debugfs_create_file("status", 0400,
-			debugfs_root,
+			crtc->debugfs_entry,
 			dpu_crtc, &_dpu_debugfs_status_fops);
 	debugfs_create_file("state", 0600,
-			debugfs_root,
+			crtc->debugfs_entry,
 			&dpu_crtc->base,
 			&dpu_crtc_debugfs_state_fops);
 
-- 
2.39.0

