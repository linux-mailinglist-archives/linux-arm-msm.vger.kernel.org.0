Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DC91379E53
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 May 2021 06:21:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230387AbhEKEWG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 May 2021 00:22:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230386AbhEKEWF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 May 2021 00:22:05 -0400
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com [IPv6:2607:f8b0:4864:20::c2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D1A1C06175F
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 May 2021 21:20:59 -0700 (PDT)
Received: by mail-oo1-xc2a.google.com with SMTP id t17-20020a4a3e110000b02901fab2f46a48so3948802oot.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 May 2021 21:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Fq9YiG4i+9Hg/626b2mYGf1Zeeqbbz7nhqruiypzKLM=;
        b=r/vp57WL04V0/z3ZbLOXmSODOaboMQD6mvsfrkIp8O5AOIFj+JAAAxETVVbPZRMoZD
         1BK8aLg1OtWzGA/TowHkOLnq/6mOR01C5u5fB5TYjNAdZY9ODcbQZC5ze3/zFrTRvoRd
         PD5Cf9sL1RwI/sSjlIQa6rRgsJPzoGNwXaXovRhNIn2sq1w1ZlD9WLKdqykwyr1oFs8U
         qbuNw5L6oRRlctHDuAvzHjGB3/uxMIZFXhxU3QuKcCBwsQmhMGdnrGzUjQbGW9h8tlmZ
         4oujK0m6oFrRrWtAzjq6oCrMaTLL0bclq2NGugNLVSiFUO0IX5EyYORyBf8212yHg+oB
         VW2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Fq9YiG4i+9Hg/626b2mYGf1Zeeqbbz7nhqruiypzKLM=;
        b=X1JqwItqHc7+X21ufGIZhEfhfXk1XJcBJPDbdA4fIWQkz6JAw7Ciwp4dOMQMFXBhH6
         r3QUMLurcSsbRzI62oy9rV1qujlWJwYedK218GBx0nR3oFJxoiYW1Y+51Wq6zIpNYkMg
         gdr5c4jsU2nhYewzx8n+7cOuXLL8NOpBUywrQ5n8OGKV6FG7X9BuWg1LNU7eo4cHCUU6
         DKkJJkO2RFaMi/Cr1e6EuxzQI7LlmXRD97TIDL54g0M2GUk95NiUC5t04C7o5d/blHBE
         /NpTysz3wqee8n6e43TSWZI8Glmz9LKmlQyVbE2+jCKx49kt0fqQ2lUqQ4LMqV/ROru2
         Ua8w==
X-Gm-Message-State: AOAM531pRMFbPqTkdzuT7Ui9rnVyoF1KhokWYJh+YyGSh5/Ae8Pmgtvu
        9JmCpaDRnf73TTRlinIHXeqX7Q==
X-Google-Smtp-Source: ABdhPJyVF8rLen4EcnoW1kysZcaLvhFVqL45nBVtHdbEibmOqIEkmJKRUCNqaNbO4OoxFZvT0nqedg==
X-Received: by 2002:a4a:e385:: with SMTP id l5mr21768512oov.48.1620706858691;
        Mon, 10 May 2021 21:20:58 -0700 (PDT)
Received: from localhost.localdomain ([2607:fb90:e623:42c1:10df:adff:fec2:f1d])
        by smtp.gmail.com with ESMTPSA id r124sm3042294oig.38.2021.05.10.21.20.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 21:20:58 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Stephen Boyd <swboyd@chromium.org>, sbillaka@codeaurora.org
Cc:     Tanmay Shah <tanmay@codeaurora.org>,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] drm/msm/dp: Initialize the INTF_CONFIG register
Date:   Mon, 10 May 2021 23:20:42 -0500
Message-Id: <20210511042043.592802-4-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210511042043.592802-1-bjorn.andersson@linaro.org>
References: <20210511042043.592802-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Some bootloaders set the widebus enable bit in the INTF_CONFIG register,
but configuration of widebus isn't yet supported ensure that the
register has a known value, with widebus disabled.

Fixes: c943b4948b58 ("drm/msm/dp: add displayPort driver support")
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_catalog.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index a0449a2867e4..e3996eef5518 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -707,6 +707,7 @@ int dp_catalog_panel_timing_cfg(struct dp_catalog *dp_catalog)
 	dp_write_link(catalog, REG_DP_HSYNC_VSYNC_WIDTH_POLARITY,
 				dp_catalog->width_blanking);
 	dp_write_link(catalog, REG_DP_ACTIVE_HOR_VER, dp_catalog->dp_active);
+	dp_write_p0(catalog, MMSS_DP_INTF_CONFIG, 0);
 	return 0;
 }
 
-- 
2.29.2

