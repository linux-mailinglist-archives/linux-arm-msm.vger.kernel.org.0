Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C42072F771F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Jan 2021 12:03:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726642AbhAOLDP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Jan 2021 06:03:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726045AbhAOLDO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Jan 2021 06:03:14 -0500
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F143C0613D3
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Jan 2021 03:02:34 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id u11so9881930ljo.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Jan 2021 03:02:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pngCiC8UVrFmDGTkFK9zXDEQWbuDnES5IXJTMMZSYC4=;
        b=yuOMDW/xAGqHviE9dKa3cO0BxBs30bU+Rvi6uWs/FKsGR73rumUZJIrpMtMd8tSDPE
         0rdj4CvQX1eDZwxa1JZNXNTmQrg/5tRO4SLMcHN23O6AxrPw2sAmUC+i2aWdPnN/mfQK
         7J6d0eMw7bp/RxH4iRVx/ROHx6xT1mJlgDpcLUYa2qaQyOBkpFu5s86+/EMVccDpio7F
         GTAOxJAMQ0x0H8JF4OLjZLSdPRuli+YB3y+XZLjMGQ7M9/ZEsoz/dh/X0VGx0raB8+bt
         FRDFgyFILUJkgfBTz/gIJMCX4q6wqYS+kkZ6JXfVVddzvAHLa0aDNg0gOdEbqoM1CbfD
         nM1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pngCiC8UVrFmDGTkFK9zXDEQWbuDnES5IXJTMMZSYC4=;
        b=p967lCSeBoqrGkc7xrKUpGh9gJBXPsGjPqxlROEJAZ0l7QI+AtpkN8Mgvd3amQJbkQ
         ullocD38fK/0nc0XW+U5mXYsG2pxVZfBkpHidmu4nR2n0w5+1Yu/pz7R5U0z0JpdtKNS
         yOAJO82EI723sE1Nuji8lRptsCBKw5M2a5L5lfDGlwfl4XnmxmC3OJLcVcGCVbwiP9pu
         az6qYeudGu8Fv7nh3rv4siBlxiCxf1cgHQ1isACkyzDdi+XbZ1CbP47sAlUIwjDSxd1I
         Vg7vBuDk57Xfpcs/dsYHWSUaEHu4Q9X1lpvAI0qr8z41xJucw2BiZsRK4YGLW32XDd2Z
         qSzw==
X-Gm-Message-State: AOAM533yDlE/p8zeBpcyY0E5Ss5AsizQfm/CeWxKeOFtH9oQ/Q55ZKsd
        409KlW1aWVQnXKDwlLWpDLuNLA==
X-Google-Smtp-Source: ABdhPJw9UOGOuee56qJFf5TyVElkzEgJ+V3K54yv9DE3dyWyUfRzFeq54fhjyGuDHyUhJ3o6NDhYbA==
X-Received: by 2002:a2e:8ec7:: with SMTP id e7mr5053355ljl.249.1610708552728;
        Fri, 15 Jan 2021 03:02:32 -0800 (PST)
Received: from eriador.lumag.spb.ru ([188.162.64.106])
        by smtp.gmail.com with ESMTPSA id s8sm862020lfi.21.2021.01.15.03.02.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jan 2021 03:02:32 -0800 (PST)
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
Subject: [PATCH v2 2/3] drm/bridge/lontium-lt9611uxc: fix get_edid return code
Date:   Fri, 15 Jan 2021 14:02:24 +0300
Message-Id: <20210115110225.127075-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210115110225.127075-1-dmitry.baryshkov@linaro.org>
References: <20210115110225.127075-1-dmitry.baryshkov@linaro.org>
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

