Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 295BE4BF208
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Feb 2022 07:22:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230248AbiBVGXT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Feb 2022 01:23:19 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:45064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230245AbiBVGXT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Feb 2022 01:23:19 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66F531EC65
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Feb 2022 22:22:54 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id j7so22756851lfu.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Feb 2022 22:22:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iM+9d1vlrH8gvtpIKyDvBZU+m+WcrI9EbVXkjqnwrgU=;
        b=jpGdL2UWzg/HKSOtVLZnndwPDPtVWzbb/QNHcN8zho5Y4LDCr6KGRRmZM1LjG6NEDY
         JqmJeTejQukUyQGDA/TWOzev/9JOJU5/DGz2EpyXttNZDomlw9luYuOahhTVUDvPBTYL
         MaZb+lHFrE7aj9PKwD5qN3a8tgkzWQa9MHgCVQyi3fUxfiY1ScQBxWTbK7R8iv0ALLHD
         8jrPCcI9OzfYNrYyr/PyC0P1xA2vEbufk887wsdKkDQA6oHSCj3ZJu2CHd9eydQAnmiW
         cmxImIEI6Y0qWMdGJAOw9fBHJkagYwdTyhVhRfp8rXrTKnpnk74wCD/YWowxVPCcl+ls
         V0KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iM+9d1vlrH8gvtpIKyDvBZU+m+WcrI9EbVXkjqnwrgU=;
        b=GHU2FYESFmHdy5JLXCE3iBGlW7jOqjlvtNrEXAA5zvMMHs8s44FSpp1rAvxEeZ5Ikt
         0ofW8D0Jg6GvldDgUnMCWgxt3UYFDd8FkXiJd9SbDqxjGHa4By4oEFSA66U6fekQV/3W
         1v6fq8JoLGzLRrm5nxrh+7B6O8FTWdt8VLGnM5NgTHdztzD6Uqidq3tqHgSTuQEvi1W/
         Ahy3A+Uxzk71SvDEGnpi8WAo2rgCTpvt+f8EYw4+zKL+TO7o8cizqhHM+UGuojLtmDr0
         UBszbnzyhVZ7R5QyYgs5syawglH7CDvqJtsc2YeN/pw7tIeML0SV6oQkFtfdMBMFTigL
         OvJw==
X-Gm-Message-State: AOAM5305zabzd4d2i/oW+9jthxJAAjOHWA69mRSQ5HMtjmNCpkM/c1Z4
        dBKnC5lsNjDD5dPJn0CBIuuG+Q==
X-Google-Smtp-Source: ABdhPJzGc5/AYdPbOPH3yazzGj2gw4n70PKZg3iu2vcQFrpdXtOfIZtRtK2lwEwAqOAfSpt9NBsT+Q==
X-Received: by 2002:a05:6512:3e0e:b0:443:3cba:9e26 with SMTP id i14-20020a0565123e0e00b004433cba9e26mr16341176lfv.590.1645510972828;
        Mon, 21 Feb 2022 22:22:52 -0800 (PST)
Received: from eriador.lumag.spb.ru ([188.162.65.160])
        by smtp.gmail.com with ESMTPSA id j24sm1216245lfb.59.2022.02.21.22.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Feb 2022 22:22:52 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 4/4] drm/msm/dpu: drop INTF_EDP from interface type conditions
Date:   Tue, 22 Feb 2022 09:22:46 +0300
Message-Id: <20220222062246.242577-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220222062246.242577-1-dmitry.baryshkov@linaro.org>
References: <20220222062246.242577-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

To remove possible confusion between (old) INTF_EDP and newer INTF_DP,
stop using INTF_EDP in DPU's code. Until the 8x74/8x84 SoCs are
supported by DPU driver, there is no point in using INTF_EDP.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 3 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c          | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index 478a608ba7f2..e76d240f554d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -92,8 +92,7 @@ static void drm_mode_to_intf_timing_params(
 	}
 
 	/* for DP/EDP, Shift timings to align it to bottom right */
-	if ((phys_enc->hw_intf->cap->type == INTF_DP) ||
-		(phys_enc->hw_intf->cap->type == INTF_EDP)) {
+	if (phys_enc->hw_intf->cap->type == INTF_DP) {
 		timing->h_back_porch += timing->h_front_porch;
 		timing->h_front_porch = 0;
 		timing->v_back_porch += timing->v_front_porch;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
index 116e2b5b1a90..1548614c508b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
@@ -141,7 +141,7 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
 	hsync_ctl = (hsync_period << 16) | p->hsync_pulse_width;
 	display_hctl = (hsync_end_x << 16) | hsync_start_x;
 
-	if (ctx->cap->type == INTF_EDP || ctx->cap->type == INTF_DP) {
+	if (ctx->cap->type == INTF_DP) {
 		active_h_start = hsync_start_x;
 		active_h_end = active_h_start + p->xres - 1;
 		active_v_start = display_v_start;
-- 
2.34.1

