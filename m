Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E39B4ECFB3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Mar 2022 00:31:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233684AbiC3WcB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Mar 2022 18:32:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351630AbiC3WcA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Mar 2022 18:32:00 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 062A85BD2A
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Mar 2022 15:30:15 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 5so38290685lfp.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Mar 2022 15:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rpqBTpUpCdXhEBEq/E7SmvSY4o1PiwCRJgZfj9SmfN0=;
        b=SnVG0EEs4PG1+YDicQuYa216zYMYgevvP/UzMEUO22qY3OOxe0BF1b9XMBa/ecXQMh
         E/Bso4ecic0stommXyZiP+H33QQaVECpIvnEaT7QLZDJDvQn54ZSdQE5Gh44wK+M0+XH
         UhQihI/gx1RI9EQurSJavIsw5TIP1AFVkN8BpB3dp8EwG5V/GhENwNxmb+NUHdefMuGf
         ERgpQcbq/LboeRNj82U0koSs2YM4tPLxo2P8/vbJxeXH7NcCWdKqr5qVjUxIe7ZGLZGi
         EX+s+SwKHwTZsU87YNLBfv4L7mylnhcVIAn6mhX+s8wqMJFstI7V8Ew2vJPPCiXn7CTB
         qSCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rpqBTpUpCdXhEBEq/E7SmvSY4o1PiwCRJgZfj9SmfN0=;
        b=6MIe8FLLg4mmyz1L8eH3QpHZIGdZbECO5EDRxEWLo2Qba2UNYiHVffigdO6LuqnhXT
         MJoEfVGIXVaC3QB8I8A3OvvgDgCLxdFLWJl0t9L+3IdnL8ojZZVUg5ZoF/TK8glatqMW
         xNEsIft/xDMR0ngsflLsiB3YM27zTG3Psn0Kt+c4hXEidQtPOqWUEFQp6UPSaOqqKYO5
         lO72+XdjUeY/iBZ+MSa/1xz2/V1s5foY0ZSBxpM6FPVQFtCXwP9IZT5OOLn+GiMT5CH3
         dmOkBFYP1Qt4181ZIlTwLy+H4K9Qa759j23b0oCCJDsUMvNZzzxhkbiidIlOZBdRYLMj
         NlZg==
X-Gm-Message-State: AOAM533+B8q22DRqb5qQ3AW+72gYnOP7RYr2hC7OyguDQeQOXqw5z7Zy
        7zZvIxqsTxOCG6jhYbomTCmT0A==
X-Google-Smtp-Source: ABdhPJwGjBpbdhdnjRwao/4Ifr2JOjVvqOmqEQ9SfzzOCa3l5eyKcNUesclMb3AlyoajdCZM8CUH7Q==
X-Received: by 2002:a05:6512:31cb:b0:44a:1311:60e4 with SMTP id j11-20020a05651231cb00b0044a131160e4mr8488470lfe.521.1648679413241;
        Wed, 30 Mar 2022 15:30:13 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id a4-20020a2eb164000000b0024988e1cfb6sm2521295ljm.94.2022.03.30.15.30.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Mar 2022 15:30:12 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= 
        <ville.syrjala@linux.intel.com>
Subject: [PATCH v2 4/4] drm/msm/dp: make dp_connector_mode_valid() more precise
Date:   Thu, 31 Mar 2022 01:30:08 +0300
Message-Id: <20220330223008.649274-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220330223008.649274-1-dmitry.baryshkov@linaro.org>
References: <20220330223008.649274-1-dmitry.baryshkov@linaro.org>
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

Make dp_connector_mode_valid() return precise MODE_CLOCK_HIGH rather
than generic MODE_BAD in case the mode clock is higher than
DP_MAX_PIXEL_CLK_KHZ (675 MHz).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_drm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index a94c9b34f397..3225435fa81b 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -89,7 +89,7 @@ static enum drm_mode_status dp_connector_mode_valid(
 	dp_disp = to_dp_connector(connector)->dp_display;
 
 	if (mode->clock > DP_MAX_PIXEL_CLK_KHZ)
-		return MODE_BAD;
+		return MODE_CLOCK_HIGH;
 
 	return dp_display_validate_mode(dp_disp, mode->clock);
 }
-- 
2.35.1

