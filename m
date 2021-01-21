Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 942832FF8F9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Jan 2021 00:34:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725956AbhAUXeP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Jan 2021 18:34:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725950AbhAUXdz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Jan 2021 18:33:55 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07592C0613ED
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Jan 2021 15:33:12 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id b26so5006470lff.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Jan 2021 15:33:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LXLBko8Cp1/+g8qjMNN3MI6diNB1wKaGBp6QZagrUvw=;
        b=H6plmw40MZ+6SjPcYq1mPJlnbzickRzJ8SRP54NDX47VY7L8rNmE3rpyVZsiOtXeKi
         z8mVBmZKjk3FRQqTig0hlWgLXB+S4m9KwqcsBQFHlecYLl/fzpMOt5hd5+uJCkGUzN28
         NJjT2CRKFPXHy7KeJxw1z6m9Bw6kaUnSevl/j80O2LY78QPrVz4KmfcX0ITxZ9753THh
         UoY5p4VENRuytKHWiXDJE5+73P7l5GR+DwttXHxCxQW1dc4oqsKs0dZ0bb/ElL/NoHFT
         LaCKSPE2HphOcd00RiIwmP4YelSr5zNzSB16Ar7VilBQSBw+640Mchk4kTsD9qNSYdTn
         3lkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LXLBko8Cp1/+g8qjMNN3MI6diNB1wKaGBp6QZagrUvw=;
        b=ucc5W0X0AwDlseS8fhEQ1HSjztinLOByOMXrgueoOFa5ZxSXGZYU9CYlA2471Y4GZI
         ZTzLKGcUEUdpp1KXyhK07tSmB4tn056kOnvtkOt4oedLC0f/uds5wfx2Ze3LhtB2QzF9
         iA2KZDexxrjwUaunIgcvZGfRfGSzhkVY4GqTSfsKKc5di2uiIJZi4VpGwkpbr1UUwH08
         Tt3bksdfXoq25C8mFB50Il1EhCEdXcg7JuJWpWshzrPsNAdS+kJmqQWpZPZLi7GtimSx
         UzHPME4cRpJldX1HLjxoa4+sbhIGqAAo6dJAcXhZTMPYHJcfVyUbRjky5soZA46q0smp
         DhOw==
X-Gm-Message-State: AOAM533Av0362RlLDziAxovIY92dyXhjPVEWmzRFORkK7lrV1teB3EyQ
        tpsykLh2cbTS9i/nkuNYGpjPuw==
X-Google-Smtp-Source: ABdhPJxU9TZ69d8kwFQwT1jPDTrC4CkWHg4Ij8Kb0Ur9THl9pf4CK7mzNN9n3FnXmF5jEMhDfzUQVA==
X-Received: by 2002:a05:6512:612:: with SMTP id b18mr864962lfe.598.1611271990559;
        Thu, 21 Jan 2021 15:33:10 -0800 (PST)
Received: from eriador.lan ([188.162.64.145])
        by smtp.gmail.com with ESMTPSA id l28sm726969ljb.42.2021.01.21.15.33.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jan 2021 15:33:09 -0800 (PST)
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
Subject: [PATCH v4 2/3] drm/bridge/lontium-lt9611uxc: fix get_edid return code
Date:   Fri, 22 Jan 2021 02:33:02 +0300
Message-Id: <20210121233303.1221784-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210121233303.1221784-1-dmitry.baryshkov@linaro.org>
References: <20210121233303.1221784-1-dmitry.baryshkov@linaro.org>
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
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
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

