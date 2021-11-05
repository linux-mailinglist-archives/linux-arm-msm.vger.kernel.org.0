Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B899445E5B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Nov 2021 04:05:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232116AbhKEDIQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Nov 2021 23:08:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232097AbhKEDIL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Nov 2021 23:08:11 -0400
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com [IPv6:2607:f8b0:4864:20::833])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A95CC061714
        for <linux-arm-msm@vger.kernel.org>; Thu,  4 Nov 2021 20:05:32 -0700 (PDT)
Received: by mail-qt1-x833.google.com with SMTP id x10so5663128qta.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Nov 2021 20:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bBrM+10zUcr3Crlf+G77umSyOcr8vD3ZBHHHl7sVh1w=;
        b=AQFSE8l1TBEBpLSWYnXisexuUBd6hoFKen+aTDo8uIgbktzBs1PbYkcuVxA0mBcxP5
         Xfi71e9EIY/cEQtmedKdFbymtILy705bjgXBs/vuLkkDQNquj2REbP6m/BrL3hqWbMxc
         yzCv0Mv3CdQwFUf6XBTFQSOIlHk1tbi6q2XDTnhnIFwTFRigZeLyZ2hxDDMa17YIkd3J
         UEYePZ8lXreVohVj8zPpejAdqBA+vT51P4KFFFGEk891uV5UHwXIpOwLEU1l0Csw3S59
         M93Nnb464SaJJFV6yWa5kocTNhE92nKvOK8BMlGmMmyONUBuwjgJya4xFLO2rdPzBs6D
         Gauw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bBrM+10zUcr3Crlf+G77umSyOcr8vD3ZBHHHl7sVh1w=;
        b=CX3DZZz+fnufEzAbiYrkOjCfYLHHmeo1CJs+aJDmEoqoeOQCFjHCytfYlV4dcHd5q4
         W/6eTqBbnY7jLNg5WTFTex7boixKpO3lBvzOse/JK8UU5ziGhaADCewijcx2Wuim8Fbq
         P/mhsoPo12FjmC+F0tSQfI4AEz2DNNrLNRoZrSCGe+07wSNGv4gVsHe7JOallUlM/v44
         YDrX30yP/jqe/h6EMdUKcUX0Hrhet65t9d6fSKwMfLw0s6UB7KJ4ZsXrYmKlQgwuHrPn
         uNj0x9I2h/40euzSzrTK1oSv9Q35m1/vFD3op7cpRdDq36f5koKYP5U8nWPoKHBqJ9Do
         mpeg==
X-Gm-Message-State: AOAM532OymOcqa92+pr+8Ak7/DoNr7LH4kJQoqwfNLN3J11v89alPtZs
        ItSBTfBMxxnmzEDKb7RJT4h8kg==
X-Google-Smtp-Source: ABdhPJyEdR52cxyX3J9bQK6t2hPtZmtUmF0WR8nW0o5wVdFAPNLEf5ivgXOnvuKUZNe67k1wbYCtgg==
X-Received: by 2002:a05:622a:104:: with SMTP id u4mr57017431qtw.143.1636081531844;
        Thu, 04 Nov 2021 20:05:31 -0700 (PDT)
Received: from localhost ([167.100.64.199])
        by smtp.gmail.com with ESMTPSA id d3sm5398434qte.4.2021.11.04.20.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Nov 2021 20:05:31 -0700 (PDT)
From:   Sean Paul <sean@poorly.run>
To:     dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Cc:     bjorn.andersson@linaro.org, swboyd@chromium.org,
        jani.nikula@intel.com, abhinavk@codeaurora.org,
        Sean Paul <seanpaul@chromium.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org
Subject: [PATCH v4 11/14] drm/msm/dp: Re-order dp_audio_put in deinit_sub_modules
Date:   Thu,  4 Nov 2021 23:04:28 -0400
Message-Id: <20211105030434.2828845-12-sean@poorly.run>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211105030434.2828845-1-sean@poorly.run>
References: <20211105030434.2828845-1-sean@poorly.run>
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
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Sean Paul <seanpaul@chromium.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20210913175747.47456-12-sean@poorly.run #v1
Link: https://patchwork.freedesktop.org/patch/msgid/20210915203834.1439-12-sean@poorly.run #v2
Link: https://patchwork.freedesktop.org/patch/msgid/20211001151145.55916-12-sean@poorly.run #v3

Changes in v2:
-None
Changes in v3:
-None
Changes in v4:
-None
---
 drivers/gpu/drm/msm/dp/dp_display.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index aba8aa47ed76..79412a8fbaff 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -707,9 +707,9 @@ static int dp_irq_hpd_handle(struct dp_display_private *dp, u32 data)
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

