Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9A11411EEBB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Dec 2019 00:47:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726781AbfLMXqI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Dec 2019 18:46:08 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:35393 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726760AbfLMXqH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Dec 2019 18:46:07 -0500
Received: by mail-pf1-f195.google.com with SMTP id b19so2300047pfo.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2019 15:46:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=v42ANoCuRY5G1cXjAYLdlEBR2ZujMsVzXKVd9Z2k9zQ=;
        b=Zfwx5vED1oy7srYtFqQ98xI3trRNrk3KnWek5G+uWhLJFKHfBWowS8Uk8GBeCndIlx
         51t5PCZVERnprYytis2tlVyQErvo4XmMiRqZjsOB1ARRTfgvEDw6DxTQPze1LluuhKeH
         zsHlrh5F9GD5AOddAGkkM5afZF29WbsfvhgZ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=v42ANoCuRY5G1cXjAYLdlEBR2ZujMsVzXKVd9Z2k9zQ=;
        b=G1+anTdglPLmeqGMSS62xaW2gwaPkSdpl2Brhis1twsPJIAviYWtLDHiG9zO8TEO6u
         7FX7uyvdUJ6jCWI7b6OkvQd3nDHb7GcpGx398sSw8+kfQWDf0eT4qVGDpO/nUNWmg7ih
         IlRNHPwceN4+v7qdlAR0/oLoC6PSxjub4OOlsPSz85b1Crc4s5358RPl+sp/zd0LsXyQ
         v8BHGe1YJS+4wSLY0lD4MvOENrph9y59CvKHg4nRWQ28hRBHH7JpaHNG0D3HF8vR6tCD
         z7N/9CF6RgjG6kioU2bgX7ocOjx9Is070i0sNNu0wmwuWho67bEp88K2C5KHAIJZ5hd8
         bWcA==
X-Gm-Message-State: APjAAAVMa9xN4/tAGcPLv5aKCmun0w8PFTX1Bg+CszbpLAw3LdX+/cgu
        Ka3KMEBLchUjCw4hSYQRuv4sJg==
X-Google-Smtp-Source: APXvYqwo4oDTxwhrjmCGC4SiPRl6kxhXhBokEQbPLjWUECdkHzPw90RxjJe3RC9pthW8P/MpeN9FYg==
X-Received: by 2002:aa7:968b:: with SMTP id f11mr2396374pfk.209.1576280766339;
        Fri, 13 Dec 2019 15:46:06 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id z19sm12282905pfn.49.2019.12.13.15.46.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2019 15:46:05 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>
Cc:     robdclark@chromium.org, linux-arm-msm@vger.kernel.org,
        seanpaul@chromium.org, bjorn.andersson@linaro.org,
        Douglas Anderson <dianders@chromium.org>,
        Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 2/9] drm/bridge: ti-sn65dsi86: zero is never greater than an unsigned int
Date:   Fri, 13 Dec 2019 15:45:23 -0800
Message-Id: <20191213154448.2.Id445d0057bedcb0a190009e0706e9254c2fd48eb@changeid>
X-Mailer: git-send-email 2.24.1.735.g03f4e72817-goog
In-Reply-To: <20191213234530.145963-1-dianders@chromium.org>
References: <20191213234530.145963-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

When we iterate over ti_sn_bridge_dp_rate_lut, there's no reason to
start at index 0 which always contains the value 0.  0 is not a valid
link rate.

This change should have no real effect but is a small cleanup.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 2fb9370a76e6..7b596af265e4 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -458,7 +458,7 @@ static void ti_sn_bridge_set_dp_rate(struct ti_sn_bridge *pdata)
 	/* set DP data rate */
 	dp_rate_mhz = ((bit_rate_mhz / pdata->dsi->lanes) * DP_CLK_FUDGE_NUM) /
 							DP_CLK_FUDGE_DEN;
-	for (i = 0; i < ARRAY_SIZE(ti_sn_bridge_dp_rate_lut) - 1; i++)
+	for (i = 1; i < ARRAY_SIZE(ti_sn_bridge_dp_rate_lut) - 1; i++)
 		if (ti_sn_bridge_dp_rate_lut[i] > dp_rate_mhz)
 			break;
 
-- 
2.24.1.735.g03f4e72817-goog

