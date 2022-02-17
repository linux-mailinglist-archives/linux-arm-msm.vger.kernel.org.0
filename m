Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B11764B9743
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Feb 2022 04:54:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229598AbiBQDyS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Feb 2022 22:54:18 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:38852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229604AbiBQDyS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Feb 2022 22:54:18 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCC632A0D72
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Feb 2022 19:54:04 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id b9so7550692lfv.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Feb 2022 19:54:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RR1N4aPEBsDSrMkYWyN5C+eYSYGI+wdfjT+eCdTVa9U=;
        b=YCnwYlAvZ7/nS7LPvTABXHKm53V4PGUIaIBxHLF2KydqNgd1nAQ5/A/0ok7TobG8G7
         vycvAQ2fh6huKnrHhICiT1Tr+0jbqcR3OAY136hQ6ZN7CxDJM0j00WsU92y9gutn8GIA
         8ssmV6+Z0V3E0oYO+RpOiP0rIHJ4PzEFmNd6r/4UjKqqjQuSNVaB1QqdT33fzYE/qChu
         SA4smIhHj5xlikPyBa88uVO7J+7Kkp13NlHB/WMO/p9jI1P2FcrDJ3TlMYLwqTvtRCjX
         r1PTXx+QfICidSWTpCskAyDeMc6KOzYa0S6xfc2KG/oVhXojtHmewRZIEM/IQLtEZ+GH
         ON3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RR1N4aPEBsDSrMkYWyN5C+eYSYGI+wdfjT+eCdTVa9U=;
        b=S2zIvVmqdOtswXuztVkSwSmEQR03JbVNnCvDgiy2UC1B1Ho+QZ7jrPPL+VsuZXUi1n
         bN8gsjn3wVNpd8U5aNJe7w3pUeBG2wmIyJSMhMHfv5ozZZP2vlFX0XhBpRihnmHrWfJB
         h6SI8MyLxLgEHmr+Ql+V4lRliKNdo6S2/9ztJ8HBCKZOUOtmv2v6qV6tJ22XNSoa1APL
         eVryHqbCizXJ0yI9zbCCyqlKmwZ4CdycgZ5KJiyOnQdvh/V3RHXFikWzxrNE4CFFRcNC
         smCZqcEjZDIsEz11Jt+CPVqpF4zXMM14NJKZAbUXhNPwNTI4/kKZSap/FWatRf41GAZw
         Mpjg==
X-Gm-Message-State: AOAM530Jjn6Kd1y6F6W7J6P1TnHuII/z3kC7AAGyRacvTHPsWdoRPgyb
        U4rCYG/rZ68w0JK0sLCug4syIw==
X-Google-Smtp-Source: ABdhPJwvDOrFkan8mJU6iOjEP4Ula3Yq8VzKbdfOkj1/0kZ4ERxGTv8HZPueJb+vInWTQNDwkvEhkw==
X-Received: by 2002:a05:6512:3157:b0:443:6407:ea58 with SMTP id s23-20020a056512315700b004436407ea58mr768650lfi.81.1645070043080;
        Wed, 16 Feb 2022 19:54:03 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id h9sm1575454ljb.77.2022.02.16.19.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Feb 2022 19:54:02 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v2 3/7] drm/msm/dpu: remove msm_dp cached in dpu_encoder_virt
Date:   Thu, 17 Feb 2022 06:53:54 +0300
Message-Id: <20220217035358.465904-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220217035358.465904-1-dmitry.baryshkov@linaro.org>
References: <20220217035358.465904-1-dmitry.baryshkov@linaro.org>
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

Stop caching msm_dp instance in dpu_encoder_virt since it's not used
now.

Fixes: 8a3b4c17f863 ("drm/msm/dp: employ bridge mechanism for display enable and disable")
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 02d0fae1c6dc..16ae0cccbbb1 100644
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
@@ -2128,8 +2125,6 @@ int dpu_encoder_setup(struct drm_device *dev, struct drm_encoder *enc,
 		timer_setup(&dpu_enc->vsync_event_timer,
 				dpu_encoder_vsync_event_handler,
 				0);
-	else if (disp_info->intf_type == DRM_MODE_ENCODER_TMDS)
-		dpu_enc->dp = priv->dp[disp_info->h_tile_instance[0]];
 
 	INIT_DELAYED_WORK(&dpu_enc->delayed_off_work,
 			dpu_encoder_off_work);
-- 
2.34.1

