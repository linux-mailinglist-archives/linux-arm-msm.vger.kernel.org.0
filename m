Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C478353122
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 Apr 2021 00:30:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236052AbhDBW3l (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Apr 2021 18:29:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235975AbhDBW3i (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Apr 2021 18:29:38 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00976C061788
        for <linux-arm-msm@vger.kernel.org>; Fri,  2 Apr 2021 15:29:36 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id y2so3063449plg.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Apr 2021 15:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aTj0OGH7KaDzYKPFyz84iOUTYicqvk+ZBNlKttoJO+Q=;
        b=CgOs8CxEUCEHeF6iUU0vfsG5kJCASq3JPLdC4yt8vdPnN9hjSeAU5189WyCt326Ghi
         AfEwxJzlF73Zao6yjX7YMnN/6+Hzayv9NF1Re/lHKkogMMNs8JVCoypq231b1EOSy6uE
         LDNJt2tmY72VHDhggS5OHqI1LD1ogF85M64dM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aTj0OGH7KaDzYKPFyz84iOUTYicqvk+ZBNlKttoJO+Q=;
        b=Mpp7VaaDp5OhiL4lsynua7BEX/+zbr5a17kogFMyJQO9VzDxJefbwdNZDkDH+0bkFR
         Ktqa/7MT57KQNpn/yTITVc4/tOgBtdCCtQEk9ArNuwhEVYg3FeIq20WtcBPlhraJNwJh
         IatTUaFiNbjXiqIdn4Rnds2/khooFelzOTCSUONyg0A2rtFcd9+nw7rOwAu0dVF2ik7w
         y+wJ2Y0zsB8drFabim0ZvLSaijF3YE43PmkeAyyOBHWSjcu9WeEDTMNMrlbde9pkn1Uo
         oaABk95NT0OsrUGYPTjbZ8lz8DRHfdZjhkqAx9dA9cZFDZLmldwGWN4wgz5n/PENMlGK
         3gmw==
X-Gm-Message-State: AOAM532MJzyJYXQB9+vk1v1CqFQoxmuVRJFg3xUtOlTFR/hbqIZud68x
        HKcfjIxzGOebOJGhpdWEs5JMAg==
X-Google-Smtp-Source: ABdhPJy/TfR1o90gA4kNkharNT2qLPaUBedqIkni2GWNH7z0Lj8Zn/4GcUMFAsIKElP5fYQSV9d9BA==
X-Received: by 2002:a17:902:b210:b029:e6:33b4:cd9e with SMTP id t16-20020a170902b210b02900e633b4cd9emr14325791plr.67.1617402576574;
        Fri, 02 Apr 2021 15:29:36 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:6c58:fab2:c5e2:f2d7])
        by smtp.gmail.com with ESMTPSA id t16sm9233094pfc.204.2021.04.02.15.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Apr 2021 15:29:36 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Sam Ravnborg <sam@ravnborg.org>
Cc:     Linus W <linus.walleij@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        robdclark@chromium.org, Stephen Boyd <swboyd@chromium.org>,
        Steev Klimaszewski <steev@kali.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        linux-arm-msm@vger.kernel.org,
        Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
        Douglas Anderson <dianders@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Robert Foss <robert.foss@linaro.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 09/12] drm/bridge: ti-sn65dsi86: Fail aux transfers right away if not powered
Date:   Fri,  2 Apr 2021 15:28:43 -0700
Message-Id: <20210402152701.v3.9.Ifda98514600b646db4fc7bc55f0d0f9a4f1650db@changeid>
X-Mailer: git-send-email 2.31.0.208.g409f899ff0-goog
In-Reply-To: <20210402222846.2461042-1-dianders@chromium.org>
References: <20210402222846.2461042-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

If the bridge (and panel) haven't been powered on then AUX transfers
just won't work. Let's just fail them instantly.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
If the patch ("drm/panel: panel-simple: Use runtime pm to avoid
excessive unprepare / prepare") is accepted then we could consider
actually powering the panel on instead of failing the
transfer. However, without that patch the overhead would just be too
much since we need to do several AUX transfers for a single EDID read
and powering up and down each time would just be too much.

Changes in v3:
- ("Fail aux transfers right away if not powered") split out for v3.

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 543590801a8e..a76cac93cb46 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -896,6 +896,13 @@ static ssize_t ti_sn_aux_transfer(struct drm_dp_aux *aux,
 	int ret;
 	u8 addr_len[SN_AUX_LENGTH_REG + 1 - SN_AUX_ADDR_19_16_REG];
 
+	/*
+	 * Things just won't work if the panel isn't powered. Return failure
+	 * right away.
+	 */
+	if (!pdata->pre_enabled)
+		return -EIO;
+
 	if (len > SN_AUX_MAX_PAYLOAD_BYTES)
 		return -EINVAL;
 
-- 
2.31.0.208.g409f899ff0-goog

