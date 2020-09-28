Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4051027B51F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Sep 2020 21:17:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726409AbgI1TQ7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Sep 2020 15:16:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726325AbgI1TQ7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Sep 2020 15:16:59 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DD32C061755
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2020 12:16:59 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id w7so1963729pfi.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2020 12:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2qNdYqoOUB+OZLN8seN5bCPLMM8MM4+7n2C6OfWpomU=;
        b=befVspTYDlHN4DlmLZsupFoi7jPta5gqC//lynZ5l53i2YXbB5O9eUUcoZFndL1WxH
         nZejR3NzvUXWKromiDfWv0Wl6OM3HQNv+sUSTzwBG4bOViXUpGY0WGpXO4Qbo5OEKpf/
         3ZmXqnV2ju2plBqQ6AJfNFbd8xkjW1XNzA1go=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2qNdYqoOUB+OZLN8seN5bCPLMM8MM4+7n2C6OfWpomU=;
        b=pCTkt5sGYksh0yqBlO6xorIvvKblDmbcI2cRXkI32bonT5hw49llpOwqC82mhajKI0
         V/IZImaeQQh8mX6BxDXq8zF30MN7lTaYXghaLRBkLzn81fXcTsQrKuK6HBqOvIWSafUL
         vpjgDuhe2X1wI4V/Ad392SUoQXuztsgtwtzpnqIjm4yA0jszSplx0kW3GMZlAImHPTNE
         3nr/zCMc5ffmb94TyBcHhmu+fBfoMniwCQ/gQyVCIE+ZOavrSemzL43RbhZxNUVClw4G
         BQAzPDBWdRd9zRl1VgnU4mS7X7r02IsazCkahiQIGbAqUBw0qeaTHY8R2T8jpVvu2jFz
         wAXA==
X-Gm-Message-State: AOAM530oSQu0vS+MQhq0vyYkLLu6PIwJS9H7dygJnnyh4g5JNn8HYMSL
        i7GUtCgyfN95EXZ2XyIAYNpWMA==
X-Google-Smtp-Source: ABdhPJxl1izvLcsXx/2TwQ3vV6O+f5joDNou6VpY62cP+9NybxSHwAN8LcWiD0crnjsEwlkj0C6/bQ==
X-Received: by 2002:a63:c5b:: with SMTP id 27mr463688pgm.80.1601320618567;
        Mon, 28 Sep 2020 12:16:58 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id 201sm2532090pfb.173.2020.09.28.12.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2020 12:16:58 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Jeykumar Sankaran <jsanka@codeaurora.org>
Subject: [PATCH] drm/msm/dpu: Add newline to printks
Date:   Mon, 28 Sep 2020 12:16:57 -0700
Message-Id: <20200928191657.1193583-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.28.0.681.g6f77f65b4e-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Printk messages need newlines. Add it here.

Cc: Abhinav Kumar <abhinavk@codeaurora.org>
Cc: Jeykumar Sankaran <jsanka@codeaurora.org>
Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index f272a8d0f95b..cbe0461246f8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -906,7 +906,7 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 	}
 
 	mode = &state->adjusted_mode;
-	DPU_DEBUG("%s: check", dpu_crtc->name);
+	DPU_DEBUG("%s: check\n", dpu_crtc->name);
 
 	/* force a full mode set if active state changed */
 	if (state->active_changed)
@@ -1012,7 +1012,7 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 		}
 
 		pstates[i].dpu_pstate->stage = z_pos + DPU_STAGE_0;
-		DPU_DEBUG("%s: zpos %d", dpu_crtc->name, z_pos);
+		DPU_DEBUG("%s: zpos %d\n", dpu_crtc->name, z_pos);
 	}
 
 	for (i = 0; i < multirect_count; i++) {
-- 
Sent by a computer, using git, on the internet

