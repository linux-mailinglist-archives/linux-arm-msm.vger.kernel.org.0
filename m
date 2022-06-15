Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5297F54C807
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jun 2022 13:59:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243160AbiFOL70 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Jun 2022 07:59:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344788AbiFOL7Z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Jun 2022 07:59:25 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94D164F1DF
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jun 2022 04:59:23 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id a15so18510550lfb.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jun 2022 04:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Fxhig7S/wRtvHvzsbn9rHd0EStZ8R3uFvogUlmb/lgo=;
        b=p0x9cBSaRJyRVTcL/bQMqtCCAUZw8gAxE/Nip++Oi3MBE4TigpMJuno7ju74eI8ltQ
         AP7aVPu4D6KJBuYXDAQ+rFwf71t8rX8mv+yRHH/AyNTdrsGeXzuRZ77vgyPTssrXpaav
         IRBU74MOTjW/rBHX+rjOjTIu5oQxgtE5k9XDAXJ2rBnLcDFyjciaTkJn16fyjiZo5t7V
         UavKS9sBZA7+klaTmCiUE2pCd8Gd2rlNQGlsym2KyAFHvypx8LSECRSr3FAxva+czYtb
         sLEx3qdcvEyVPZkjaRlMc+FgXVsMtF3ONkmvCIZOy3BH9xZdM4tT4v6/oX13XqSfGCtl
         4PYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Fxhig7S/wRtvHvzsbn9rHd0EStZ8R3uFvogUlmb/lgo=;
        b=rEV4nLnCKUAji6vipVNQOxAUonHUCM7ukeFExSiHGbW81ETJY2zhZAJAETx3I0B+sC
         OymqJHIQbsDflVhch7kRsj22JsT8T42JD/KV9Rg4Y18Ru+mcYg1vMmCFWKWBYhxmSGaz
         l3JUBDqmlkcAMRABkSDuTHIX4BwAcDs2JAtcFaDZDMQiJGzE8zjyPNgCdfLntFv7WVLG
         sx6eMnChZVZMuo0dXEtC6dN/+I8moD91IAdz9PRvsdh1Xaj73CLQOiC/2fY5RFvkqAo8
         vFLN5JJZaq8e3oKchyoxZbruYm7+hNWVbmKCy6YoJkj3KvYdsp6BFXgUyXhEt7RtnYFN
         hL8g==
X-Gm-Message-State: AJIora+ieT4IFvWVyNYuJf2Mvktb2yY3r+A2Cru1cqqvdlF40WhoioaJ
        yYL6ZZbQTBjiT5JdxSzpzy7C9g==
X-Google-Smtp-Source: AGRyM1ucrkTItoEeZZkUTWkAu68SV/jCTVdq114h4nEOl2QUT54X0xVMh3MbsPpBZO+8vQHBq4wuAQ==
X-Received: by 2002:a05:6512:3d05:b0:479:4fc7:3332 with SMTP id d5-20020a0565123d0500b004794fc73332mr6146023lfv.463.1655294361968;
        Wed, 15 Jun 2022 04:59:21 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id x18-20020a2e7c12000000b00253ceefb668sm1603680ljc.60.2022.06.15.04.59.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jun 2022 04:59:21 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Kuogee Hsieh <quic_khsieh@quicinc.com>
Subject: [PATCH] drm/msm/dp: make dp_bridge_mode_valid() more precise
Date:   Wed, 15 Jun 2022 14:59:20 +0300
Message-Id: <20220615115920.6768-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
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

Reviewed-by: Kuogee Hsieh<quic_khsieh@quicinc.com>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index bce77935394f..6ecdd81d0555 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -989,7 +989,7 @@ enum drm_mode_status dp_bridge_mode_valid(struct drm_bridge *bridge,
 		return MODE_OK;
 
 	if (mode->clock > DP_MAX_PIXEL_CLK_KHZ)
-		return MODE_BAD;
+		return MODE_CLOCK_HIGH;
 
 	dp_display = container_of(dp, struct dp_display_private, dp_display);
 	link_info = &dp_display->panel->link_info;
-- 
2.35.1

