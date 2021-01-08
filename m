Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57A652EF8C1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Jan 2021 21:16:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729048AbhAHUQF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Jan 2021 15:16:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728871AbhAHUQF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Jan 2021 15:16:05 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 163B7C0612FF
        for <linux-arm-msm@vger.kernel.org>; Fri,  8 Jan 2021 12:15:10 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id w5so10107911wrm.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Jan 2021 12:15:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=O/JKS4Z9qKDOKy5sO9nbCc5XSxxopAD1h4qHJfgSdqg=;
        b=wBSjRd6hUt3BDerrolAnKVhQ503TF7vDvG8dtbt/o8U9vNcsSGQEhFuSmNBOZGNp10
         PIzT2j7v23x8tNl3mkHGXOcF+GrbyDeTlpsSGDgKmSEcKYq0dab/m2KdmmOB57EVyCpI
         r/A8Jpxw89BpPtpwDjyN5aPAuMZ6s/KjgVgcsFPBXl9ioick3mKTDMbOEZOEwxasDz6g
         kl+0YEl+Xa46pYow7bex/TCbi1vZ4ecASb12ivzYiyc1CtI38PubzyDvHvhdXqR3IFIm
         7hlsKs/zBlnsTrpiIEgwVdlZk1DB0zjTg9F3/sQC5vQghrwIso0dr5KcEZBs+6wROCj1
         YPSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=O/JKS4Z9qKDOKy5sO9nbCc5XSxxopAD1h4qHJfgSdqg=;
        b=gCcw6n89azzxgYKYe1Woh0hbuFc3p5Iz3h0apLvCNMnpTS/nrEMa0TVoYw19zu+gEQ
         Sh+WYgZQO9lBqsq9gmvctSDUxRMrq2TZLH9MsHF+CYC11/Vfi/2q0kcRokQBQmiHRrgh
         pEREiC04AYmm4sBpnqzHkUqRlanUOzlbtmgWjKHOtIUOwiyZNcK0NIwEKRzPnrmTsgOy
         k9XAFuSo86HzZH54VK7IZByvN1/RLKgj5TiKKsEm0mF46oSTjsW+ExrZ1SnhmDaLlxbj
         dZl6h6ElfzhIP8X0pujTmymKOBn8hKBKKRq6qStkrGXucLADAEAmf3OMw0GpOtwfe0M6
         1MyQ==
X-Gm-Message-State: AOAM533u3By0D06DsE9B4YsXr1DjBhUTZ0bewDAmKECkqGUkGIdlMrSp
        DJ9sXOLv/2WH0ji2KooMu7lc3g==
X-Google-Smtp-Source: ABdhPJxbhB+24hC60aHyeAnKIacOXED/VpuqohB/XOtKWtR3SUXj9zKBQgJMyNVeGBh14t7z/3fisA==
X-Received: by 2002:adf:ee10:: with SMTP id y16mr5306753wrn.296.1610136908812;
        Fri, 08 Jan 2021 12:15:08 -0800 (PST)
Received: from dell.default ([91.110.221.229])
        by smtp.gmail.com with ESMTPSA id l8sm15598671wrb.73.2021.01.08.12.15.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jan 2021 12:15:08 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Kuogee Hsieh <khsieh@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 03/40] drm/msm/dp/dp_display: Remove unused variable 'hpd'
Date:   Fri,  8 Jan 2021 20:14:20 +0000
Message-Id: <20210108201457.3078600-4-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210108201457.3078600-1-lee.jones@linaro.org>
References: <20210108201457.3078600-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/msm/dp/dp_display.c: In function ‘dp_display_usbpd_attention_cb’:
 drivers/gpu/drm/msm/dp/dp_display.c:496:19: warning: variable ‘hpd’ set but not used [-Wunused-but-set-variable]

Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Kuogee Hsieh <khsieh@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 6e971d552911f..637a5585c2fd8 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -493,7 +493,6 @@ static int dp_display_usbpd_attention_cb(struct device *dev)
 	int rc = 0;
 	u32 sink_request;
 	struct dp_display_private *dp;
-	struct dp_usbpd *hpd;
 
 	if (!dev) {
 		DRM_ERROR("invalid dev\n");
@@ -507,8 +506,6 @@ static int dp_display_usbpd_attention_cb(struct device *dev)
 		return -ENODEV;
 	}
 
-	hpd = dp->usbpd;
-
 	/* check for any test request issued by sink */
 	rc = dp_link_process_request(dp->link);
 	if (!rc) {
-- 
2.25.1

