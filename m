Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A2AA6616E8
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Jan 2023 17:57:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230052AbjAHQ5F (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 8 Jan 2023 11:57:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233542AbjAHQ5E (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 8 Jan 2023 11:57:04 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53A9C260D
        for <linux-arm-msm@vger.kernel.org>; Sun,  8 Jan 2023 08:57:02 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id v25so9496890lfe.12
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Jan 2023 08:57:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T9VtndEU9TW3RLFSiBZfc8etzz7z8EaiINnNdBxR7Gk=;
        b=LOaWt0nMZCQMlu/kyhyiFkMmbHnIEYfWIz1Lq09jNRTVo9RvD556KCXF7kHX4y234i
         0rDkmmIB0QA6oY/xLhBvWM17IM3Pt7GcoJHb/5CoYsW2JoNAiUiCUgiQPaWeBO/uyB/p
         8l+r0OY1ZtPu3xYYYGZN+gJPQcMnoAzbQ0QaQn0S+xSqdI8ZInYY+tn9SVFVitOmRCrY
         iZdeFZJgYpMmVvMrXOuu608o2DzR3ylTMiD9vxC0PhdJvOJMRoDWzF3HZq4S+8v+i1Xr
         UO5yrSWKMJaKe7aNESA1UgBPwBiRyMwScg+kZikbtVZdCFzH2LEIa4uhZzQLYOg2/y8v
         5QYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T9VtndEU9TW3RLFSiBZfc8etzz7z8EaiINnNdBxR7Gk=;
        b=fppDC6LJVy2+/IDE59snIvuqHO20Uin2kiBLtT/okx4uFsqQEcIsoWmyml4Cc7/Tcm
         G5a5pdyRxVo8SeUK5JBLzvloVwuLJbIuYAX4Fyj2JDP44zCMOCYjJ/zjw6JljXd6xMVA
         y5gl0K2gkKNN04AAyMFvPpkrElEuDTxlZc6k1ToE6Jvwn7P3xlgBOLZZxg1ZZNdrGSGK
         52brv7Hi6pd0azuQhl07OR2uMrJ5ggucdGGEWz9mYP3AmPAzhOj28FdMVjsSNBwy+QDg
         OldTRlNzdJG6Kb/ua+Lj89T0GnTvXKIJRavwmRLazrRaDSEFy3aoynxPaYTIvkOn4WTj
         UzBw==
X-Gm-Message-State: AFqh2krzaFYtpukTPfdKNZQs1u2tPXWEQPP+WJCgyLxf0K8WQCRRNLUQ
        uMX5L0+naPNnBgZPvBWpIgRsfA==
X-Google-Smtp-Source: AMrXdXtCpM5eXruHKS1u8QD4S2xnCLMW2hGmMU07tlOqcgJWEyfhmZKtxavj5iYb1WxbM18EFmM9Sw==
X-Received: by 2002:a05:6512:31ce:b0:4cc:7258:f178 with SMTP id j14-20020a05651231ce00b004cc7258f178mr2109800lfe.59.1673197020705;
        Sun, 08 Jan 2023 08:57:00 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id s2-20020a056512202200b004b561b211adsm1138323lfs.254.2023.01.08.08.57.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jan 2023 08:57:00 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>
Cc:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 04/13] drm/bridge: lt9611: fix programming of video modes
Date:   Sun,  8 Jan 2023 18:56:47 +0200
Message-Id: <20230108165656.136871-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230108165656.136871-1-dmitry.baryshkov@linaro.org>
References: <20230108165656.136871-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Program the upper part of the hfront_porch into the proper register.

Fixes: 23278bf54afe ("drm/bridge: Introduce LT9611 DSI to HDMI bridge")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/lontium-lt9611.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index deb503ca956a..f377052a45a4 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -187,7 +187,8 @@ static void lt9611_mipi_video_setup(struct lt9611 *lt9611,
 
 	regmap_write(lt9611->regmap, 0x8319, (u8)(hfront_porch % 256));
 
-	regmap_write(lt9611->regmap, 0x831a, (u8)(hsync_porch / 256));
+	regmap_write(lt9611->regmap, 0x831a, (u8)(hsync_porch / 256) |
+						((hfront_porch / 256) << 4));
 	regmap_write(lt9611->regmap, 0x831b, (u8)(hsync_porch % 256));
 }
 
-- 
2.39.0

