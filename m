Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC25F41F0D8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Oct 2021 17:12:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354876AbhJAPO0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Oct 2021 11:14:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354933AbhJAPOZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Oct 2021 11:14:25 -0400
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com [IPv6:2607:f8b0:4864:20::734])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2A89C061775
        for <linux-arm-msm@vger.kernel.org>; Fri,  1 Oct 2021 08:12:40 -0700 (PDT)
Received: by mail-qk1-x734.google.com with SMTP id b65so9396582qkc.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Oct 2021 08:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1JK+qFUiwYEt4EG3Izi4lkTF9eNwxVf2HfUhjtHyP+I=;
        b=a7GYpaY8HtdoFdhDknXiC2DG5VjgIZoLNTwJcrsfE3yIMKvbRXjpTBK/mgs1jBSJbP
         x4T2hgkMZ8Qq78jOYKNkekmADRez1XhJfIPoqe7vZ3jeu+9bKp5U5hxp3RsBuvi5ZGjk
         KrP6A2+zEEbAL0yc0YgJeo+KStYgt46UHy8zrwVmQ21FWk/4D52EGtgXJSdiw6mydHSQ
         H8nekpe3OCHGZP78jGUTRvG0Ukt09Z11Oa7sAxRQ1wsGKqpkCmg9rNd7XIF+u7pZMtkh
         LEVUAINzwdBTB/ojEV2Oq7m9mWeOByYgZdigwotytlH4UoQ3EAn3t/NevxV9aAGxj4we
         UHNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1JK+qFUiwYEt4EG3Izi4lkTF9eNwxVf2HfUhjtHyP+I=;
        b=qCcHT80epuWhNFMm0f34bQsVdMkUALdStbaL/1vT+nIHrixN4+RL918atba7SRNVmE
         /Pc+c/mJf9ms9JQiaMauwEhpzhjT1FgXAD6U+YiJ8OKIuiYdAWSyp6F451xdqVFdBg3t
         WTXIAp1QhQ2iqiLWfd/OOzHvxliW4EF987RL5BMrzZwbvPHqmGCW/+1dxoEW88Ja0BcM
         SqpCz1EbTHkcIWNTQZWmMUrm0ZGwZ7Ad+sy1w2y34HmgdLODNpUBju4BEj558B+zcD7q
         PbAWN6gA+RYM7Vd2Bd43qGvUf6jtyTR6zw1AKz2pVsj80Ty7jjiSYYm563BxLluUDgon
         Q5nA==
X-Gm-Message-State: AOAM531kCjef28//OhtV53zVrgWkhVZPpeJfSJlT5hvVpalIg4/GLMUc
        7eZLDLTXUV8UIqWMvMeq/TYeqA==
X-Google-Smtp-Source: ABdhPJz/BKi1zA6FTLxvhBBBeUOMOTAUTSwjrWe0fjrFIXANNQdOuM1mPEu+zk1I2WI33nirpxWEKg==
X-Received: by 2002:a37:41ca:: with SMTP id o193mr10288797qka.187.1633101160092;
        Fri, 01 Oct 2021 08:12:40 -0700 (PDT)
Received: from localhost ([167.100.64.199])
        by smtp.gmail.com with ESMTPSA id n11sm3667110qtk.92.2021.10.01.08.12.39
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Oct 2021 08:12:39 -0700 (PDT)
From:   Sean Paul <sean@poorly.run>
To:     dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Cc:     swboyd@chromium.org, jani.nikula@linux.intel.com,
        Sean Paul <seanpaul@chromium.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org
Subject: [PATCH v3 11/14] drm/msm/dp: Re-order dp_audio_put in deinit_sub_modules
Date:   Fri,  1 Oct 2021 11:11:40 -0400
Message-Id: <20211001151145.55916-12-sean@poorly.run>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20211001151145.55916-1-sean@poorly.run>
References: <20211001151145.55916-1-sean@poorly.run>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Sean Paul <seanpaul@chromium.org>

Audio is initialized last, it should be de-initialized first to match
the order in dp_init_sub_modules().

Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Sean Paul <seanpaul@chromium.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20210913175747.47456-12-sean@poorly.run #v1
Link: https://patchwork.freedesktop.org/patch/msgid/20210915203834.1439-12-sean@poorly.run #v2

Changes in v2:
-None
---
 drivers/gpu/drm/msm/dp/dp_display.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index fbe4c2cd52a3..19946024e235 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -714,9 +714,9 @@ static int dp_irq_hpd_handle(struct dp_display_private *dp, u32 data)
 static void dp_display_deinit_sub_modules(struct dp_display_private *dp)
 {
 	dp_debug_put(dp->debug);
+	dp_audio_put(dp->audio);
 	dp_panel_put(dp->panel);
 	dp_aux_put(dp->aux);
-	dp_audio_put(dp->audio);
 }
 
 static int dp_init_sub_modules(struct dp_display_private *dp)
-- 
Sean Paul, Software Engineer, Google / Chromium OS

