Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26FB03D9377
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jul 2021 18:46:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230313AbhG1Qqh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Jul 2021 12:46:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230412AbhG1Qqe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Jul 2021 12:46:34 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 867F7C061798
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jul 2021 09:46:30 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id e21so3397379pla.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jul 2021 09:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AQzrLQVtbfQMv3/HRKhyPjphDJ6FYVHsID5Re5m9DFY=;
        b=IvGaD/1RLetm7Cjii3YEvU2f/KPRF1C+ltbml72+0w6fKj8e25td/YJRlhSFBMVA0I
         cvGSi4P8FY7EJ0aUt00+u2RDum+Rmc2RwTyyaA+oDNsC83nDAlpjqjovcatYQG5OjF9U
         WHA2HbSz37wkMMEDZgtYjF1H/UQKiDPrwurNY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AQzrLQVtbfQMv3/HRKhyPjphDJ6FYVHsID5Re5m9DFY=;
        b=HCyidF/7+WUNonJV3scaBzc/qDvTTvtmvHtQO/V52Bxmx9rrFZufV/A3SUJ6uI/+wI
         jUf7XFMSiqnDLXIkeuSgSh+DlyQmdovLhlVXZHAZiZ827Xxirz1lLv8GSwOGCXtleDw+
         o0SVmmaNDs+m9ncA/X2Az6yFQ2KinDcNdWrIPQxSg6O9pfOiNRZSPrcNZwIWhbQqRSNR
         Mbq0lBd2iMZL9HyDUnW6VfiziTwzGOT/hzO65+SDiB3Jm24xB87Q1ph43g3fkXLLpc4b
         7n0UklB03AcWFb869NkRKThza3xEfFZi3VCpUC5zXO9G9vWb0/Hscksde3RbzVOM+ORi
         o2nQ==
X-Gm-Message-State: AOAM533MZzsy1MH0LU7vUFjMJ97/E/lzOy933SZ3h08npzBXVWspHGMA
        mxnUmHNGOJWID12loyvG68xewQ==
X-Google-Smtp-Source: ABdhPJwYmqa7VXgcysC0cEarvUasOXzxXP3vKtk023ORHTxH8iQ0+T8zkBZaWNczJ9w0ArTdPjU/6w==
X-Received: by 2002:a17:90a:4cc4:: with SMTP id k62mr10419437pjh.110.1627490790101;
        Wed, 28 Jul 2021 09:46:30 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:9f1e:e713:1a5e:89dc])
        by smtp.gmail.com with ESMTPSA id l12sm474075pff.182.2021.07.28.09.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jul 2021 09:46:29 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     dri-devel@lists.freedesktop.org
Cc:     tzimmermann@suse.de, linux-arm-msm@vger.kernel.org,
        a.hajda@samsung.com, sam@ravnborg.org, airlied@linux.ie,
        bjorn.andersson@linaro.org, daniel@ffwll.ch,
        devicetree@vger.kernel.org, rodrigo.vivi@intel.com,
        jonas@kwiboo.se, narmstrong@baylibre.com,
        Laurent.pinchart@ideasonboard.com, robert.foss@linaro.org,
        jernej.skrabec@gmail.com, mripard@kernel.org,
        linus.walleij@linaro.org, maarten.lankhorst@linux.intel.com,
        rajeevny@codeaurora.org, lyude@redhat.com,
        thierry.reding@gmail.com, steev@kali.org,
        Douglas Anderson <dianders@chromium.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/6] drm/bridge: ti-sn65dsi86: Add some 100 us delays
Date:   Wed, 28 Jul 2021 09:45:54 -0700
Message-Id: <20210728094511.3.I842d483139531aa4651da8338512fdf0171ff23c@changeid>
X-Mailer: git-send-email 2.32.0.432.gabb21c7263-goog
In-Reply-To: <20210728164557.1882787-1-dianders@chromium.org>
References: <20210728164557.1882787-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The manual has always said that we need 100 us delays in a few
places. Though it hasn't seemed to be a big deal to skip these, let's
add them in case it makes something happier.

NOTE: this fixes no known issues but it seems good to make it right.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 5e932070a1c3..cd0fccdd8dfd 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -307,6 +307,9 @@ static int __maybe_unused ti_sn65dsi86_resume(struct device *dev)
 		return ret;
 	}
 
+	/* td2: min 100 us after regulators before enabling the GPIO */
+	usleep_range(100, 110);
+
 	gpiod_set_value(pdata->enable_gpio, 1);
 
 	/*
@@ -1096,6 +1099,9 @@ static void ti_sn_bridge_pre_enable(struct drm_bridge *bridge)
 
 	if (!pdata->refclk)
 		ti_sn65dsi86_enable_comms(pdata);
+
+	/* td7: min 100 us after enable before DSI data */
+	usleep_range(100, 110);
 }
 
 static void ti_sn_bridge_post_disable(struct drm_bridge *bridge)
-- 
2.32.0.432.gabb21c7263-goog

