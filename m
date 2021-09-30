Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31F8C41D1B9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Sep 2021 05:06:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347930AbhI3DHn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Sep 2021 23:07:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347719AbhI3DHm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Sep 2021 23:07:42 -0400
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58081C06176A
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Sep 2021 20:06:00 -0700 (PDT)
Received: by mail-oi1-x233.google.com with SMTP id y201so5554345oie.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Sep 2021 20:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sDTL0yxYT47N+0jjLEyGdD4ZajCQhNx8OZO23Bvom6A=;
        b=JmtbCmQrhYNDXZGRKfkIH0HRRStQuRwld6nSinEj6CMvOBT4R7SgwLdKRm7MQ+s5hk
         BHJ95SI6qznWSrrLE1GzHC4e7e0ElMKW+mFYfeg9+lqVuTTL9px+5xg+Je2MfUKFe+rO
         hUUcAJp6z370gj87PvvaOgH1Sii++lIJX60jgIUbq4PWXabEz7/XWF2H1eCKnojX4gdi
         KbWjuN0EJ60lQ+k5Cd7A8pR4F1fL9Ogu6x7MNC6htOvwrWwyZ4G6XDZPOsib/Wb1o+XA
         zo3xDDQIPPOyYITYmiqW8yi3U6JIv4FpdStnk3n8v7g87QRSymRD21DIhyvuMcK6ghPN
         C43Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sDTL0yxYT47N+0jjLEyGdD4ZajCQhNx8OZO23Bvom6A=;
        b=d3MHPUn42NjOIC3VJHtGX04+GN7gU3jFtZzArQMzvH6ozfRsRVGr1iIHguVnWOfTur
         UqOz4mS7eXzo9qmEJkzL5L6rpzJg8qbBV/z4dlsj6oKvqwwE0QDdbuOWFozPNrwrUM8E
         OJhnFBonykf4E+7gpNiBOJodXIkSGExHIokijPxM4riiIeDW5RGgA3bYhw7QLiSz9CC2
         uqQoepHq6yCprLjEGkSNkoQ09Nr0gUpDWVxrjVgBqXhItWBl1gBIpPizTzdqHJa3Cj4A
         tNMBDUjR6nPBYAtp8udMUliLuE0/Taqb0S9zX+vmZBKpBkeghHO4FvTsR5l7HIgFQT42
         8U3A==
X-Gm-Message-State: AOAM533UQUyPk3xRjzSmC2+rP6942114oB+hnb3eCCRpXIH+9vzCbdV8
        pyOSoC5Rvok9OrUJ5/3vZYAicA==
X-Google-Smtp-Source: ABdhPJyMU4NRNdVPX4VQVzdWBumOzePFbf0SAxWbaJBtT3aZzpWvEHxUtWR2iKwvTjKobDiRYR6iuw==
X-Received: by 2002:a54:4f1d:: with SMTP id e29mr880677oiy.179.1632971159696;
        Wed, 29 Sep 2021 20:05:59 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id s16sm323358otq.78.2021.09.29.20.05.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Sep 2021 20:05:59 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Lee Jones <lee.jones@linaro.org>
Cc:     dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-pwm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Doug Anderson <dianders@google.com>
Subject: [PATCH v6 2/3] drm/bridge: ti-sn65dsi86: Use regmap_bulk_write API
Date:   Wed, 29 Sep 2021 22:05:56 -0500
Message-Id: <20210930030557.1426-2-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210930030557.1426-1-bjorn.andersson@linaro.org>
References: <20210930030557.1426-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The multi-register u16 write operation can use regmap_bulk_write()
instead of two separate regmap_write() calls.

It's uncertain if this has any effect on the actual updates of the
underlying registers, but this at least gives the hardware the
opportunity and saves us one transation on the bus.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v5:
- Extracted this hunk from patch 3.

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 41d48a393e7f..412fb6f564ea 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -193,8 +193,9 @@ static const struct regmap_config ti_sn65dsi86_regmap_config = {
 static void ti_sn65dsi86_write_u16(struct ti_sn65dsi86 *pdata,
 				   unsigned int reg, u16 val)
 {
-	regmap_write(pdata->regmap, reg, val & 0xFF);
-	regmap_write(pdata->regmap, reg + 1, val >> 8);
+	u8 buf[2] = { val & 0xff, val >> 8 };
+
+	regmap_bulk_write(pdata->regmap, reg, buf, ARRAY_SIZE(buf));
 }
 
 static u32 ti_sn_bridge_get_dsi_freq(struct ti_sn65dsi86 *pdata)
-- 
2.32.0

