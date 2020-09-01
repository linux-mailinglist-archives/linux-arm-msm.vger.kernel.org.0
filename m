Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 927E425A112
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Sep 2020 23:59:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729820AbgIAV7x (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Sep 2020 17:59:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729676AbgIAV7q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Sep 2020 17:59:46 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1960CC061247
        for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2020 14:59:46 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id l9so1238153plt.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2020 14:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yyHMLM4ELnE5TBLINkhsx/ZOVL6DEfANxYCpgeB+3ig=;
        b=KqeOaddw0AfZ2GYLkBfVZzt+5xX3DH+bRc8mRKnuHFvU2QprnK/RboHxIyhnRrOFo5
         ze6fnI+TGS5qcwk37ySRDIq9F52AnduHRqbazGPz5qi0XY1RIxerNTytyTZ9LgNJQGwH
         nQHwvSwhZvqL0EWuiF+c1ZhwgHwjOYWt8SwTs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yyHMLM4ELnE5TBLINkhsx/ZOVL6DEfANxYCpgeB+3ig=;
        b=HCHuRYmADaR8okrrq6ggJiQGnyBVFUc2tdfJ5oxE4NTAt8ssMk9rHX2pARf6VtKOeZ
         JG28ZTOrlS67MVhsU+KjV7oaIi6U30iI7oU7hqi/22aZr5RqXOveEE3OBJJ1x9v5a6uc
         4+KqCc8emBIjskaMUsKnyZLxTL5WyQArYOXY9NjMp92AlyMl9rxUAWvcSvKDBV7W3jpp
         MSu0CE3jG+pOXeQnbi0uajdDL3b9TMt7uWbJU1KInYCi07AsVyI5h3kgL9Z+cUwOTlYI
         zAHVbxD17udw7at800BOSw5VI11SWJU3XAPPl6HOlyjChsq8POju93OfQvjWN9gJNn3N
         Q7zQ==
X-Gm-Message-State: AOAM530GhTZ7tHn04uVRtPb4mdvrt5gk5ZqArE8DouAKp2D61m9nsCn4
        /DHvBwNZ1LRuZfDH0Qvweci/4g==
X-Google-Smtp-Source: ABdhPJygyY7debsqFH8WtQ3Zg2VOGcIsIKr04QOPYsplwKI/0izan3soYosz9Lol7HtneM2yH/v8rw==
X-Received: by 2002:a17:90b:95:: with SMTP id bb21mr3454393pjb.68.1598997585709;
        Tue, 01 Sep 2020 14:59:45 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id q5sm3044037pfu.16.2020.09.01.14.59.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2020 14:59:45 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Rob Clark <robdclark@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Sean Paul <seanpaul@chromium.org>
Subject: [PATCH 2/2] drm/msm: Drop debug print in _dpu_crtc_setup_lm_bounds()
Date:   Tue,  1 Sep 2020 14:59:42 -0700
Message-Id: <20200901215942.2559119-3-swboyd@chromium.org>
X-Mailer: git-send-email 2.28.0.402.g5ffc5be6b7-goog
In-Reply-To: <20200901215942.2559119-1-swboyd@chromium.org>
References: <20200901215942.2559119-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This function is called quite often if you have a blinking cursor on the
screen, hello page flip. Let's drop this debug print here because it
means enabling the print via the module parameter starts to spam the
debug console.

Cc: Abhinav Kumar <abhinavk@codeaurora.org>
Cc: Jeykumar Sankaran <jsanka@codeaurora.org>
Cc: Jordan Crouse <jcrouse@codeaurora.org>
Cc: Sean Paul <seanpaul@chromium.org>
Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 74294b5ed93f..2966e488bfd0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -421,8 +421,6 @@ static void _dpu_crtc_setup_lm_bounds(struct drm_crtc *crtc,
 
 		trace_dpu_crtc_setup_lm_bounds(DRMID(crtc), i, r);
 	}
-
-	drm_mode_debug_printmodeline(adj_mode);
 }
 
 static void _dpu_crtc_get_pcc_coeff(struct drm_crtc_state *state,
-- 
Sent by a computer, using git, on the internet

