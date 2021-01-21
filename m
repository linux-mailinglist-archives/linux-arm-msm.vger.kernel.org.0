Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A568D2FF8F7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Jan 2021 00:34:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725779AbhAUXeB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Jan 2021 18:34:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726202AbhAUXdu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Jan 2021 18:33:50 -0500
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47B49C0613D6
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Jan 2021 15:33:10 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id f11so4466705ljm.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Jan 2021 15:33:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nLR41DXLpX01EFGGqYnK9wGC2B/eZfRvF8CSAXF0+wM=;
        b=uW5eW3TZasEXRCDWT0TKkUuPWqXEULz2GdydhJeniRJoiM1zBePlAtNcnqi376CPhm
         gWC58dX5F0i+Vs0WgL2uoQFc416FPZKpX3cvmoq6j0O+biInsJYOfjCT9N6WVrJnjxoS
         6onjhcbX0HZDdS3PsjiC1cUvSpoY5zyYIkt3QBYC6TrTTD5NwcfHJ+25qD7BBE6dtbED
         1HYkhlHQiXPL1LaC1ZLBga9KzL7UO72SHgcynsqU/ZPyoyujvV9nFSQWz9uEQ6J2BIEX
         Cv10xXwNRVrXMetW0r8CtvnQDLWUe38sfIxvwxTLGep7Bk8WXnzxIs0K2xMIeLgXpA0+
         ldwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nLR41DXLpX01EFGGqYnK9wGC2B/eZfRvF8CSAXF0+wM=;
        b=BS3LPC/B0yXqL9ZNn1iyhrNhnUvd1eekxwgQOO+PB+WdUzXdnDKLvmpNf1E330/Yx2
         vjOAykNO7hj+TB9jWC+4gzpYQBFPsrXmKXCw09XEmDfEq9YmdpUq3kQJkenwVhdMXIU4
         7CU9JoGz62k23jR1kB3HI5n+QFswanX/3ESIEyP7e8guQQQT5+pmL3/h92bdrT+QLvkT
         WeKlM/LSEsKdJk8RXsEn0A2MjlxI90FYffiq+4+ufuaje9tbFhxGxaf6opTmgMFceNCR
         /eHyJcYvxKugp0pROdUcBMEJYf1c7ox5rZ2tinFfGSGfa3+VKzkGMY7TbTybPuTjaPYa
         bGCg==
X-Gm-Message-State: AOAM530Fm32wFEvyyEOqJZbb6G4jxpuGdsafQd+E72nKZG2Is7q4x5sA
        s4IZ4IWKRwILDHcLG7J6YIAMpQ==
X-Google-Smtp-Source: ABdhPJyTWeBrunTtFpZ8ytV0REk/xDX7IQe2MnkWbZ1xNoNwfR8h06feNxw//96kKZqiswmlj/GD/w==
X-Received: by 2002:a2e:b4d1:: with SMTP id r17mr871501ljm.466.1611271988840;
        Thu, 21 Jan 2021 15:33:08 -0800 (PST)
Received: from eriador.lan ([188.162.64.145])
        by smtp.gmail.com with ESMTPSA id l28sm726969ljb.42.2021.01.21.15.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jan 2021 15:33:08 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Cc:     Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Vinod Koul <vkoul@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v4 1/3] drm/bridge/lontium-lt9611uxc: fix waiting for EDID to become available
Date:   Fri, 22 Jan 2021 02:33:01 +0300
Message-Id: <20210121233303.1221784-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210121233303.1221784-1-dmitry.baryshkov@linaro.org>
References: <20210121233303.1221784-1-dmitry.baryshkov@linaro.org>
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
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
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

