Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5298637013D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Apr 2021 21:31:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231964AbhD3TcE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Apr 2021 15:32:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231909AbhD3TcA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Apr 2021 15:32:00 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B458C06174A
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Apr 2021 12:31:10 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id j189so3073221pgd.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Apr 2021 12:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8eS/xTlMU4yanK78QhNrvQNifSXibqIFiplWt/q5L1k=;
        b=KCXSN9D4oQS7LHvR+QV4DLjbh3wWT+E5DDO6o26+KJeDhdxp3/oabXgJ6JLWM/ITAk
         m32+aWrMwB/v67k1x0CqhUfGPA0nCw8TKpMvQAxE5LLuOKLTIp7Xqml50JqzlH+WMewS
         c1JYcYUdemrC5LWNQ4Wgik+63DHfGDjQ/AN9s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8eS/xTlMU4yanK78QhNrvQNifSXibqIFiplWt/q5L1k=;
        b=JFL8/gGV7ubpU12SXj/vzpTkYcG6r4+jbB0HPCQLX49ALkU8L9tKDbwEmrZhbknu89
         T1pmGxTTi46uvQjDzIiQ79ePJnUHFDmaI1ThqLll5lfRfgh4zF67nSuTxP345fQ+7qsm
         wqSapj1tNbNVhEO/bxyncMPvxQNs7r4sDEEGHI3dSlUXyQq8IgORCf06jW1WXz54phrM
         2I4uiZqU3kQc3A6ooDDjQYIc7c6+GLIcxvr0p/7dZf6ID6iBxQ32xRH8L1wF8IvscgTw
         oBG7ijxIR0dEGLK+l0RT28tzry3a/9ZWI6Cyw64F4q7IoFoGGFQOoM36AUwpfWbiOf7q
         NYVw==
X-Gm-Message-State: AOAM5324aIqweFdobLTiCcqPFoiwn9Wi0NcPDofh0vtJRO2Q4bHe0hgh
        Zli17/kphXb6rEz0fezLL2IOMw==
X-Google-Smtp-Source: ABdhPJw7m54lXAmk14ck5GErFdHIHCneNa/To8KxUQnr1t8xPgf4X7+p/TbfUiaShg6zqh7RyFnTcw==
X-Received: by 2002:a63:e443:: with SMTP id i3mr6203308pgk.114.1619811069954;
        Fri, 30 Apr 2021 12:31:09 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:dacb:8fee:a41f:12ac])
        by smtp.gmail.com with ESMTPSA id t6sm3143500pjl.57.2021.04.30.12.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 12:31:09 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Rob Clark <robdclark@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Kuogee Hsieh <khsieh@codeaurora.org>, aravindh@codeaurora.org,
        Sean Paul <sean@poorly.run>
Subject: [PATCH 3/6] drm/msm/dp: Drop malformed debug print
Date:   Fri, 30 Apr 2021 12:31:01 -0700
Message-Id: <20210430193104.1770538-4-swboyd@chromium.org>
X-Mailer: git-send-email 2.31.1.527.g47e6f16901-goog
In-Reply-To: <20210430193104.1770538-1-swboyd@chromium.org>
References: <20210430193104.1770538-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This print is missing a newline, and doesn't really provide any value.
Drop it.

Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Abhinav Kumar <abhinavk@codeaurora.org>
Cc: Kuogee Hsieh <khsieh@codeaurora.org>
Cc: aravindh@codeaurora.org
Cc: Sean Paul <sean@poorly.run>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/msm/dp/dp_panel.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index 9cc816663668..88196f7e4406 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -141,7 +141,6 @@ static int dp_panel_update_modes(struct drm_connector *connector,
 			return rc;
 		}
 		rc = drm_add_edid_modes(connector, edid);
-		DRM_DEBUG_DP("%s -", __func__);
 		return rc;
 	}
 
-- 
https://chromeos.dev

