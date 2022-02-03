Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF2F04A8068
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Feb 2022 09:26:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349499AbiBCI0e (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Feb 2022 03:26:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349579AbiBCI0a (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Feb 2022 03:26:30 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 412FEC061757
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Feb 2022 00:26:17 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id u14so4302588lfo.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Feb 2022 00:26:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nyqAWn+MLtydxGLUl27Vc6FqSrdQWPLLY5cb0Wp4tL0=;
        b=E40myW0Dt62WsHZYp64vJbBGaUyByvUm0+AbpUUH+1FNbwrKE+JPrwmJSEAHrRNxSi
         v24iUSxQOSxR1cWAM8nNtgrjVcbIFxlrkPDSVAxmgALwRjRJkvLgCa+Bzsy3RgHQp4HZ
         aZtr+KM4OtBYZ/u2uA34l1JGVWV3C1aNQnA+zElc5wTLWvxWdjoBZhd59lPNhMrI6wrb
         1IkAJtJSUC/hRXqEoGx4ZK+U2F0UdamSRNBSlXLl2vlTxf63Iwuxrf3XLusmX/XZgz8T
         RE9n3Q8mHAMlSOFuTQhWcSpBNF6p5/KE6nMEBE8XhUYIxBt4x9n7Vk+NRQn8p1XzZ5HE
         m0xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nyqAWn+MLtydxGLUl27Vc6FqSrdQWPLLY5cb0Wp4tL0=;
        b=uV7Eq3cG+xLqHL+raZOT8fAJkmfNo5pfP22oMmcwnpPfx0QrW4cZLlLUJE/737TklP
         mLfjVfl62vbCUnz9kZHMyyDnbGNMOe+mu5lSxo3KyZrKnUaylCan/m5A2eoS9+8iZ0cy
         xpddyUWL8KzzCvysBKA8Zbopfk6+1UsWaS83d1/d0uWSKaS/fdJAIWsCsACzSQmABwSz
         RRCiQvsrZ8a8HgVgKV7ATqAfmq6uBiMlBoremzu3nv1hv0SP0OqQil5WhOLk9QOzXXRC
         9M6VFqPv64pqtUUMHbSiNj+V4uX2n7bt2XEuJlnIVobAOTebyImF81hajSbyJf7UJh9z
         80TA==
X-Gm-Message-State: AOAM533u7pGMu12r5/UCiOw8bSz+3fRyIL0AeAD99PxTZo2qWOAEZx3R
        IlZuUwvSwRVMVn7I2IXWSaIJpFLrDMNUMg==
X-Google-Smtp-Source: ABdhPJxt9wyAADoi6sO3Q9B2fKIcxZB9Lf2naVuJGw7avxWxVk+8JXcX+EWz6eHxZO0qa/71OjJBew==
X-Received: by 2002:ac2:55ad:: with SMTP id y13mr25702114lfg.38.1643876775631;
        Thu, 03 Feb 2022 00:26:15 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id n15sm4083440ljh.36.2022.02.03.00.26.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Feb 2022 00:26:15 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 3/7] drm/msm/dpu: remove msm_dp cached in dpu_encoder_virt
Date:   Thu,  3 Feb 2022 11:26:07 +0300
Message-Id: <20220203082611.2654810-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220203082611.2654810-1-dmitry.baryshkov@linaro.org>
References: <20220203082611.2654810-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Stop caching msm_dp instance in dpu_encoder_virt since it's not used
now.

Fixes: 8a3b4c17f863 ("drm/msm/dp: employ bridge mechanism for display enable and disable")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index e8fc029ad607..6c1a19ffae38 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -168,7 +168,6 @@ enum dpu_enc_rc_states {
  * @vsync_event_work:		worker to handle vsync event for autorefresh
  * @topology:                   topology of the display
  * @idle_timeout:		idle timeout duration in milliseconds
- * @dp:				msm_dp pointer, for DP encoders
  */
 struct dpu_encoder_virt {
 	struct drm_encoder base;
@@ -207,8 +206,6 @@ struct dpu_encoder_virt {
 	struct msm_display_topology topology;
 
 	u32 idle_timeout;
-
-	struct msm_dp *dp;
 };
 
 #define to_dpu_encoder_virt(x) container_of(x, struct dpu_encoder_virt, base)
@@ -2118,8 +2115,6 @@ int dpu_encoder_setup(struct drm_device *dev, struct drm_encoder *enc,
 		timer_setup(&dpu_enc->vsync_event_timer,
 				dpu_encoder_vsync_event_handler,
 				0);
-	else if (disp_info->intf_type == INTF_DP || disp_info->intf_type == INTF_EDP)
-		dpu_enc->dp = priv->dp[disp_info->h_tile_instance[0]];
 
 	INIT_DELAYED_WORK(&dpu_enc->delayed_off_work,
 			dpu_encoder_off_work);
-- 
2.34.1

