Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EB8C38AEB8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 May 2021 14:43:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241861AbhETMoo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 May 2021 08:44:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242744AbhETMoQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 May 2021 08:44:16 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8582C0564A6
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 May 2021 05:03:20 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id j14so15648642wrq.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 May 2021 05:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SwqZiy4Z6GG81ovO9zFP9jTTwbxWPaQnItPMn8iAg+I=;
        b=t4JJ/+Jm+OBZHvhWT3uSWqKmuLfECYUetrvnsLWOhawS+SeV9+qIX7UHBYZxZWxbUL
         +2K5DzTdiIOaxc8A4JlDo76EWa3m8PTedb81DlMdwonvBIdmzviSjmypatajwJTEv7Aq
         DifkiMWgKRy5duNfWdB6XyPwHITUSR81zaYG8VKKNyMpiGVjpzYKQqq4QQE6VlrLeU7a
         2YdDp8W4zM90yOmgMKR29qMD8S3aW5QnXONnXr8Xx19r4ogIUD94PMF9la7gMFO8/MIi
         e3aNpG77QY2F2bXnVcik/sdDFNaeieXRF+YikYW/tRFqYno5oeVf9WxlUdtn7Ca4HXu/
         DJwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SwqZiy4Z6GG81ovO9zFP9jTTwbxWPaQnItPMn8iAg+I=;
        b=SafttMRAXzj11Kl+7dW41WtC9IlSZovXNRBwYMJEo+OkKfs4CVz/oj7HJEb6XmnejH
         oRS6yTnnpyjEXTe/HCX4hcbzNWm7nI/Rb2y8v5FSD9Sqp4Wn+HngVyn+K6TxaPbiImB3
         y0662dybaspLBZcnlpwsCV92TyFzB2zZVtTl9YqgKWN+YH6Bu3dJbgVcYVza/U8SQark
         LmUPFRBvJ+OgdGxh3qTiEJYP3LruB49cvbjmSZ2wiFQP/LXTEwDgiXRyBFsqLcdPBiMw
         V2UqAjh+x5kl/MAZK1qPl96CIfCEPouHv4a2FG0lW/omKa7js7AmoN88hW95R5yJCvK6
         u6nA==
X-Gm-Message-State: AOAM533XYzP8mRxK54Bi3yxBhqFqu86ylb1OD/5ARgzHrX3gXgKExs2g
        7ny+YsItdiXxiB1rT3Elo+WRoA==
X-Google-Smtp-Source: ABdhPJxmrOeEsvi2WLTHFwHRsOHTkZdNHdWlGeXRTREqYXTZU/voycR80D2vHCcLiILbjJd+wRtAnQ==
X-Received: by 2002:a05:6000:186f:: with SMTP id d15mr3964910wri.400.1621512199575;
        Thu, 20 May 2021 05:03:19 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id j10sm2886332wrt.32.2021.05.20.05.03.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 05:03:19 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 27/38] drm/msm/dp/dp_catalog: Correctly document param 'dp_catalog'
Date:   Thu, 20 May 2021 13:02:37 +0100
Message-Id: <20210520120248.3464013-28-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210520120248.3464013-1-lee.jones@linaro.org>
References: <20210520120248.3464013-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/msm/dp/dp_catalog.c:206: warning: Function parameter or member 'dp_catalog' not described in 'dp_catalog_aux_reset'
 drivers/gpu/drm/msm/dp/dp_catalog.c:206: warning: Excess function parameter 'aux' description in 'dp_catalog_aux_reset'

Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Chandan Uddaraju <chandanu@codeaurora.org>
Cc: Stephen Boyd <swboyd@chromium.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_catalog.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index b1a9b1b98f5f6..e4d9df3c04011 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -193,7 +193,7 @@ int dp_catalog_aux_clear_hw_interrupts(struct dp_catalog *dp_catalog)
 /**
  * dp_catalog_aux_reset() - reset AUX controller
  *
- * @aux: DP catalog structure
+ * @dp_catalog: DP catalog structure
  *
  * return: void
  *
-- 
2.31.1

