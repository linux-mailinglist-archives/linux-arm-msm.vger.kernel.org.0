Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A6122F8FF0
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 Jan 2021 01:25:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726785AbhAQAYn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 16 Jan 2021 19:24:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726864AbhAQAYm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 16 Jan 2021 19:24:42 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD61DC061575
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 Jan 2021 16:24:01 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id f11so14453945ljm.8
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 Jan 2021 16:24:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gHRQ0xxynPvZxQkJ0XwkKO8LykVQgvPwVrEG9Eu8CIA=;
        b=a6xn4dTZ2IFPAX0OuBOTeKJNnVYS33dqQWXOkWew7MdddpflJN/lH4msVuofd7VNE1
         uSdDZWYEmIVjE1pkdkEaoUlcRhhVl8QS7YgwMOa3nUL8T0/6LV89dXyV5cbqm+/On3+B
         QD3gXecTGRMAgFZnedB4sPbuyf3vOJdVTSDsNInZc4y1cM1utPNxb57fY4fq33AbobcZ
         uGPj5UGNfFfgTTAnM68lTSoVLNz00eqkd4smeVYNzh0CO/86ISInkRr5NcupXimuJOVH
         unHFEgPdgxJIZHJEbvxYKJVKodGDIrbZ6Ouxnhy4O2dvxAD6+V99V6FD5rOCPjrjzJOS
         3Tsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gHRQ0xxynPvZxQkJ0XwkKO8LykVQgvPwVrEG9Eu8CIA=;
        b=nYmlZtTDOU0TNh+/8MlsA63MyEz1rUZ/z/NVgm7PrD2whqh7I7488wEvkCLluTnmvq
         83w0yVwHt2Yc4NkBHCq4227CsbuH4WnI300clX4wEgXDmcHHh8HLNVWCKN+S8S2TqYKS
         5vY2fTCfzu2CNFLuDsSI231APZhBUBBRJ6LdDVeKXuvkIPxANU3n7PzzxSAcnmFK5Qeu
         19z4IoW3eOMCGeu1hUZELPtK0KRa1iJxTRe5UjhuO7ju/Vm10sa+N0rYUjJYTRcPF/Lm
         h4VgE7b9E6QEzllfbWiL4H7FUo+9BWEXY2aoZqd+7HgCF5FO/hS+aUgbNDcXN0OxRICl
         YuiA==
X-Gm-Message-State: AOAM5302UHCAr/0dOrb3fZ8b99Gru1YXfuSuOj5w+XVHpMkD9a9uGhHs
        Cn0NweLsySMbytZZto/Ax3TmbQ==
X-Google-Smtp-Source: ABdhPJxRg3eJAQoDyiUkVKBvBiFd2B9eEiPA2IEMEdjLSpsknS2wV9RDFNyeQd9YpoVEE2kPJavj2g==
X-Received: by 2002:a2e:9985:: with SMTP id w5mr8241208lji.122.1610843038203;
        Sat, 16 Jan 2021 16:23:58 -0800 (PST)
Received: from eriador.lumag.spb.ru ([94.25.228.101])
        by smtp.gmail.com with ESMTPSA id q1sm962468lfu.48.2021.01.16.16.23.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Jan 2021 16:23:57 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Cc:     Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Vinod Koul <vkoul@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3 1/3] drm/bridge/lontium-lt9611uxc: fix waiting for EDID to become available
Date:   Sun, 17 Jan 2021 03:23:53 +0300
Message-Id: <20210117002355.435860-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210117002355.435860-1-dmitry.baryshkov@linaro.org>
References: <20210117002355.435860-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

- Call wake_up() when EDID ready event is received to wake
  wait_event_interruptible_timeout()

- Increase waiting timeout, reading EDID can take longer than 100ms, so
  let's be on a safe side.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Fixes: 0cbbd5b1a012 ("drm: bridge: add support for lontium LT9611UXC bridge")
---
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
index 0c98d27f84ac..a59e811f1705 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
@@ -145,8 +145,10 @@ static irqreturn_t lt9611uxc_irq_thread_handler(int irq, void *dev_id)
 
 	lt9611uxc_unlock(lt9611uxc);
 
-	if (irq_status & BIT(0))
+	if (irq_status & BIT(0)) {
 		lt9611uxc->edid_read = !!(hpd_status & BIT(0));
+		wake_up_all(&lt9611uxc->wq);
+	}
 
 	if (irq_status & BIT(1)) {
 		if (lt9611uxc->connector.dev)
@@ -465,7 +467,7 @@ static enum drm_connector_status lt9611uxc_bridge_detect(struct drm_bridge *brid
 static int lt9611uxc_wait_for_edid(struct lt9611uxc *lt9611uxc)
 {
 	return wait_event_interruptible_timeout(lt9611uxc->wq, lt9611uxc->edid_read,
-			msecs_to_jiffies(100));
+			msecs_to_jiffies(500));
 }
 
 static int lt9611uxc_get_edid_block(void *data, u8 *buf, unsigned int block, size_t len)
-- 
2.29.2

