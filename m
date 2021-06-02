Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4345D398CDD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jun 2021 16:33:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230451AbhFBOfH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Jun 2021 10:35:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231210AbhFBOfD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Jun 2021 10:35:03 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98CEBC061574
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Jun 2021 07:33:20 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id o2-20020a05600c4fc2b029019a0a8f959dso1825411wmq.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Jun 2021 07:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=w5nWdjb90GI2+TAkol2s0H4fVYowwMJxaadOSn6QcUY=;
        b=Mvgy55stlZuNX/pokvA4s4eyoSRztkqXdXTq93eU6mE/xvlBmNc8uYDIiGRMyggvQJ
         WFdXndyYicCkt2+CVRKGFMv3tWSYrppRxEGKlJy2MV5Y0BiRj1STB3e0XzkDdtXq179W
         cyZ4rGihQFnmuKwfP3Owt6u6vT6bLHRizWuyCP87fA0RvwKHEXseeUXI3octRriaPato
         uV9sgPOs+T01YQtYa0u5ZQSjCTRgSgZZ0Gfcf9D68E9d0uYEclaTQFgituOGvBDGyBN+
         EHTlUC9jhGzAbnHuQlgLrzOVgyxJFK7vIy6/YzDPSxPBj41ZXvek9/DTXIqyh22B5NxP
         C7pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=w5nWdjb90GI2+TAkol2s0H4fVYowwMJxaadOSn6QcUY=;
        b=Y6Z6BOfhHUHl2LeChnuvawvy0tGHvy6NkomioN1RC/bcd7iyErg3seTMRqCe/ClFzk
         5/5jJY8oNN1S0F0ZdTaaJifA4pJ6tQ07ALkIKfk6hdeqhNGRh2nNnqZMHvY/L1BPXnfp
         PFRQFQGUKPzP7TCLkVR1SzyRX/NBO8l+2VD2r28ct8l4hXQFSy6umoR9zWylREWPT6tm
         quXY0j/NDnuvNofcy6stfJmZXMZ8vIldLRW1w+mVODXA08f0HhT2MgOPX6h61A24CVWG
         V9CEU8X5FhKW0zYGq6evF0zd3gYbUn5baqB1cH1CEM+bWmSjV2wJSKZ2GWFVQb4EflmQ
         70UA==
X-Gm-Message-State: AOAM532vN5ScWO8E3u8TgJsbIv92Gem58c5pW+KZqDhHbcVrtRSZzqw/
        YhlrIAMPncVT8+Md1GhAWdk/ow==
X-Google-Smtp-Source: ABdhPJwTGEyQyNzzbXkQyWal5cJWfFdoQqndQ5+cIRX0cKjf8RHVhiiu/dgMTmXmYfZgRMx5PjqE0A==
X-Received: by 2002:a1c:f705:: with SMTP id v5mr5533686wmh.69.1622644399228;
        Wed, 02 Jun 2021 07:33:19 -0700 (PDT)
Received: from dell.default ([91.110.221.214])
        by smtp.gmail.com with ESMTPSA id o11sm132315wrq.93.2021.06.02.07.33.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 07:33:18 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [RESEND 09/26] drm/msm/disp/dpu1/dpu_encoder_phys_cmd: Remove unused variable 'cmd_enc'
Date:   Wed,  2 Jun 2021 15:32:43 +0100
Message-Id: <20210602143300.2330146-10-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210602143300.2330146-1-lee.jones@linaro.org>
References: <20210602143300.2330146-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c: In function ‘dpu_encoder_phys_cmd_wait_for_commit_done’:
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c:688:31: warning: variable ‘cmd_enc’ set but not used [-Wunused-but-set-variable]

Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index b2be39b9144e4..088900841bf8b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -685,10 +685,6 @@ static int dpu_encoder_phys_cmd_wait_for_tx_complete(
 static int dpu_encoder_phys_cmd_wait_for_commit_done(
 		struct dpu_encoder_phys *phys_enc)
 {
-	struct dpu_encoder_phys_cmd *cmd_enc;
-
-	cmd_enc = to_dpu_encoder_phys_cmd(phys_enc);
-
 	/* only required for master controller */
 	if (!dpu_encoder_phys_cmd_is_master(phys_enc))
 		return 0;
-- 
2.31.1

