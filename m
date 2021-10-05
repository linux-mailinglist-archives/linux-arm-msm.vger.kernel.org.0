Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76F34421C9D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Oct 2021 04:36:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230237AbhJECiA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Oct 2021 22:38:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229659AbhJECh7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Oct 2021 22:37:59 -0400
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4D3FC061745
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 Oct 2021 19:36:09 -0700 (PDT)
Received: by mail-ot1-x330.google.com with SMTP id o27-20020a9d411b000000b0054e0e86020aso1260334ote.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Oct 2021 19:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+GYY3fgaaeOEZFwlrXaNb8Km6kTmaOO7oRCYiPn9Rtw=;
        b=qQxkZKeNLS9TSHR3BlSX1ArGn+F4qj0wLMrriaL9e+NNs7BGuGFPd04emb85TkfPqs
         X5AgvVsDLajRGyM/ad3xXjCLnxemgsLZiSsaXyU8ZIF0MZ2f3paGBdn3qlHqBAWB6L1K
         L6B/pOj4UvESvrUkJkI5Tuq4Mfi7nWF3jlQA297TMkMYlWNoZuAiaUM70ZrRkq0twPWM
         1iPyV55ubu9/9JIibbHyGJy47zoRQT8OXWRlrVswfb9Rxz578tl+dzTTZMqOnPos8/5h
         +mBryetbbDvyQ744howTfEswI9PW1svgzLRTQZaC8LMS8BMG5xI+N4iw6ZA04Rjj5sTo
         mcNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+GYY3fgaaeOEZFwlrXaNb8Km6kTmaOO7oRCYiPn9Rtw=;
        b=mofsZm0AR6rBF48CgCV5FiSATplqvz+Q6Mx8ntaMU5ji9k+wc04/vugkWziUwKd7K0
         gyA8j4wqDzyhrjWNaw3WRzGTzfM1y7KGcgg3xT32Xk/7sCS1i8EL0gCw2JKEfjv3NZgu
         NJkArvZErV+S2V6qiqaLzNpaqKrhNC0npqmJK/zE/HswdXx8jIlVwj9VN+Q73N7BWeuI
         2yRej8HM2n2Mp6imyfyiVQqBOTa9pj4sH4SA25/YIBZW2cRxTbqYNQe4vapRzreRvNZ+
         vKEPcTaYFYoD/lawQ2S5D9DzwPAP6XaAIk1uyCO6Htc12erdrE0tq/qnwxeo0eARtb6g
         84BQ==
X-Gm-Message-State: AOAM5313/LuNPmrdbktwuzz3SI0oVHokFkUPdG08SFM9y3Vi43fCnlMI
        e7KuBXjLVK183Q36xm0PZUMpHA==
X-Google-Smtp-Source: ABdhPJygR0UDTE4BCHMd53yNo4xPeVw33V9dkfjhe2wQn4fgUTpyYl/AR4nlydFZHzSlhUGbJGWU4A==
X-Received: by 2002:a9d:7307:: with SMTP id e7mr12316641otk.35.1633401369095;
        Mon, 04 Oct 2021 19:36:09 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id i12sm3055329oik.50.2021.10.04.19.36.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Oct 2021 19:36:08 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Kuogee Hsieh <khsieh@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Sankeerth Billakanti <sbillaka@codeaurora.org>
Subject: [PATCH] drm/msm/dp: Shorten SETUP timeout
Date:   Mon,  4 Oct 2021 19:37:50 -0700
Message-Id: <20211005023750.2037631-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Found in the middle of a patch from Sankeerth was the reduction of the
INIT_SETUP timeout from 10s to 100ms. Upon INIT_SETUP timeout the host
is initalized and HPD interrupt start to be serviced, so in the case of
eDP this reduction improves the user experience dramatically - i.e.
removes 9.9s of bland screen time at boot.

Suggested-by: Sankeerth Billakanti <sbillaka@codeaurora.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 21b9c1de4ecb..46d9f3eb6d13 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1438,7 +1438,7 @@ void msm_dp_irq_postinstall(struct msm_dp *dp_display)
 
 	dp_hpd_event_setup(dp);
 
-	dp_add_event(dp, EV_HPD_INIT_SETUP, 0, 100);
+	dp_add_event(dp, EV_HPD_INIT_SETUP, 0, 1);
 }
 
 void msm_dp_debugfs_init(struct msm_dp *dp_display, struct drm_minor *minor)
-- 
2.29.2

