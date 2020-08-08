Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76F4023F853
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Aug 2020 19:28:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726307AbgHHR2b (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 8 Aug 2020 13:28:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726242AbgHHR2a (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 8 Aug 2020 13:28:30 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90F1FC061756;
        Sat,  8 Aug 2020 10:28:30 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id ha11so2594120pjb.1;
        Sat, 08 Aug 2020 10:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=v4VG68yjsSgJtRppBPF3uOrudyHEUR7Dzur3xN68sJo=;
        b=LrumZTBTGBsFlxmSWq3tdNULI4G/LxjTqO7lrauGcYh59HaMmOQ/HpjplxEAKGw3Wr
         jnZC8tOCSXmxU/n9HkWPLYthFW4fCWd13GtKO5vG6VJfRz4I/IkwnAeddxRxGNOKvhBI
         yGRkyfpKht291PbtrNkaNHspu/bkYnSPFQFoKTpeo5EXO20TcjjCrMPq3F9y1HfXXFVu
         C1INfLwg9aSZiLnCDM7h6sAecEmB2JjpviqYLyw09Wp+Rr+rkHxHwbeTJBdu4Q+sGBFG
         Cns1iJ+Rd4NQL+vC47RX4oLc3fCFhwP2Iv8VDSWc2a7C5RHJ2jccZXAvKzIypxC3SqU6
         prbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=v4VG68yjsSgJtRppBPF3uOrudyHEUR7Dzur3xN68sJo=;
        b=qChbr6OMg7qr9QinAoVuWmZILRm+wwbYcXGC8J7+UQQeWKTb6hJUGjjHNT9+EJuBWC
         +NXGn67qWPtnG7WacZq4e7bZNJlTw/Dx5IgoKRE0isXtM7NIAvTSULbo5s+ZtENhQ3qU
         8cH1XtaSoGRX5esBNMgp+mX0vWOPc6PKhSJmLqSwYPaq8Qw9/O3e6DH8ClBOAjAJohUf
         wvmMn5boUWw4ReVC5T3wEcrWlZionhTELcAcb6O+tiBxC0rq1walfUbsz79YwA1b9Bil
         EHSw3bSJiLuvpOJBXx3AhxwWaCmQQBBdugiRHWZtQz8nLlLUWb2DG1dYuNu3uDJ2acHH
         KfNQ==
X-Gm-Message-State: AOAM532dxNlBho5NGzhw9c8Po5nmBA/R9JExREioxNDZb4Sx27US2EBj
        NDLfV0WR8CDtuQE2vk4IlTc=
X-Google-Smtp-Source: ABdhPJzYr7usx3fGNyyPrJWCnyL3rFFa3Db/Q54TjWtTPXqE1GkwwM99QtEJztB1F3g1c1ejhy8NjA==
X-Received: by 2002:a17:90b:378d:: with SMTP id mz13mr18857396pjb.98.1596907709800;
        Sat, 08 Aug 2020 10:28:29 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
        by smtp.gmail.com with ESMTPSA id a7sm7594801pfd.194.2020.08.08.10.28.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2020 10:28:28 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm/a6xx: fix crashdec section name typo
Date:   Sat,  8 Aug 2020 10:29:11 -0700
Message-Id: <20200808172913.380050-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Backport note: maybe wait some time for the crashdec MR[1] to look for
both the old typo'd name and the corrected name to land in mesa 20.2

[1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/6242

Fixes: 1707add81551 ("drm/msm/a6xx: Add a6xx gpu state")
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h
index 846fd5b54c23..2fb58b7098e4 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h
@@ -372,7 +372,7 @@ static const struct a6xx_indexed_registers {
 	u32 data;
 	u32 count;
 } a6xx_indexed_reglist[] = {
-	{ "CP_SEQ_STAT", REG_A6XX_CP_SQE_STAT_ADDR,
+	{ "CP_SQE_STAT", REG_A6XX_CP_SQE_STAT_ADDR,
 		REG_A6XX_CP_SQE_STAT_DATA, 0x33 },
 	{ "CP_DRAW_STATE", REG_A6XX_CP_DRAW_STATE_ADDR,
 		REG_A6XX_CP_DRAW_STATE_DATA, 0x100 },
-- 
2.26.2

