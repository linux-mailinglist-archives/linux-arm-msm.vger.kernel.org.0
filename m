Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8102F2F8FEE
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 Jan 2021 01:25:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727062AbhAQAYn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 16 Jan 2021 19:24:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726785AbhAQAYl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 16 Jan 2021 19:24:41 -0500
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E86EC061574
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 Jan 2021 16:24:01 -0800 (PST)
Received: by mail-lj1-x230.google.com with SMTP id f11so14453973ljm.8
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 Jan 2021 16:24:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pngCiC8UVrFmDGTkFK9zXDEQWbuDnES5IXJTMMZSYC4=;
        b=y7wUaE5uSs9/X1CgZ0TgeV+nYHROi8wXtaSQXaSFrr/YXaVn4ZkDx/z/CcIGc4aFhj
         yfVNJ9hRPzVVlnFeOKfOUWdYMiLz9LzYLYEAKKQ3zrd8q06qsc6M8pW99JyJeoZyuv7Q
         cjRJu7FsGE6ztp3WsT7fUi5dcaFxEtXEe/hj+l3kUoDAjmBD9G9G0bLlQqmUBSXOEFov
         wV+0IosGaHEy4YLwDUqbPWIT59zLJV2DNI6I8P7k5nqwjSfydOAgydT5n54AVIRR96sV
         zvNFcWy7ivZi9VH4WUnwO+emzrfy6nZbdocy20g3qHhDt2XzuG8HkyFQSWUXSDwhG71L
         rk7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pngCiC8UVrFmDGTkFK9zXDEQWbuDnES5IXJTMMZSYC4=;
        b=X7570E6Hff/Yf/mR0IMOI7atBBPaut+M755hRYGTA0q4vErmq/LiDSsSpObzIpUt/6
         J+A6hp/Td1o4l+DthbPYHft+Ufk2TpZh6BB5f/gJtYcjpMxEAzSgQvQyHMrL9wagQr43
         U15vjlc8PzflQrtPablP2OjxDpjcb5Ht/5WiMe2k/ytYh6uaJaIXQDYP8U11+xjPJiOd
         675tFZcJ/S0B8xHLtEJO+D8SgRyh3Y6lUI2WlY2kkzUbfLNOHcHzXzIn7IkfTGH05gTV
         e9DUFAAHia55raeVEOK9MDSL3qgFK5C9N750t5IB5P2vTISL7g6xmGAOUnwGamsAw7o9
         HP/A==
X-Gm-Message-State: AOAM531xMIVK1k3W5D0sVF6pKOBzl/fcWB7gI/lSPAO5F2z+ONspcoFn
        lRm+ntuuuXXS19xnfaV2rfhP0Q==
X-Google-Smtp-Source: ABdhPJyLeADw2VKPRMAvtHVWtCOxRs38E8QehKF4XvsxxSU6wP3pWJnlkTEPqdMsIhPMrt4Htm5nxQ==
X-Received: by 2002:a2e:3c01:: with SMTP id j1mr7969902lja.258.1610843039706;
        Sat, 16 Jan 2021 16:23:59 -0800 (PST)
Received: from eriador.lumag.spb.ru ([94.25.228.101])
        by smtp.gmail.com with ESMTPSA id q1sm962468lfu.48.2021.01.16.16.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Jan 2021 16:23:59 -0800 (PST)
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
Subject: [PATCH v3 2/3] drm/bridge/lontium-lt9611uxc: fix get_edid return code
Date:   Sun, 17 Jan 2021 03:23:54 +0300
Message-Id: <20210117002355.435860-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210117002355.435860-1-dmitry.baryshkov@linaro.org>
References: <20210117002355.435860-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Return NULL pointer from get_edid() callback rather than ERR_PTR()
pointer, as DRM code does NULL checks rather than IS_ERR(). Also while
we are at it, return NULL if getting EDID timed out.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Fixes: 0cbbd5b1a012 ("drm: bridge: add support for lontium LT9611UXC bridge")
---
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
index a59e811f1705..b708700e182d 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
@@ -505,7 +505,10 @@ static struct edid *lt9611uxc_bridge_get_edid(struct drm_bridge *bridge,
 	ret = lt9611uxc_wait_for_edid(lt9611uxc);
 	if (ret < 0) {
 		dev_err(lt9611uxc->dev, "wait for EDID failed: %d\n", ret);
-		return ERR_PTR(ret);
+		return NULL;
+	} else if (ret == 0) {
+		dev_err(lt9611uxc->dev, "wait for EDID timeout\n");
+		return NULL;
 	}
 
 	return drm_do_get_edid(connector, lt9611uxc_get_edid_block, lt9611uxc);
-- 
2.29.2

