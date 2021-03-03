Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E5B932C1F4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Mar 2021 01:03:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1389568AbhCCVjg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Mar 2021 16:39:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349204AbhCCNoO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Mar 2021 08:44:14 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC88CC0617A7
        for <linux-arm-msm@vger.kernel.org>; Wed,  3 Mar 2021 05:43:33 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id l22so5229312wme.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Mar 2021 05:43:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/33rrW6tAmVtxRYoiv0PK1lc5LAomei+z6FwtqsCisM=;
        b=dhSUUgmE7ZX33ei022sF4B/eNLt7eRn6jyC6OPLLge7KLxxCOeCa28VOHm8A2NqkOz
         rC5HtpmrZfFZTpr1oxG4X536z+qSdFWpmImIvI0zypVu71zTpz2EWNslYDCj5a+ibt09
         TKB3YH++0UGqcXv4EqTw863+Sup2Nio3mTY788B7rDNCTnhq8t7oYkaqgvC9Oi9Ns5U8
         PEDhLB0l5/UlEsh2yZkvIGxEOwr2hdNd1JAEm3lzqNhrZ/F78oTmE/S2AGHFnm+F3W41
         wAL/9MqBdbhvvMpKruwntRhuemSAEs9b4568GTwFsUW57U544g+jjXC8m4uaD4PGB/sh
         niIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/33rrW6tAmVtxRYoiv0PK1lc5LAomei+z6FwtqsCisM=;
        b=DSQnP1ihVoHzcn7mZdMOTQKkg7F8tTIgN9ld/qBPMHI4Vhg7BUw8fTO9cw5i3P0a9d
         DDV8HvBJXZHIXcA//irUDYlB1yL2HDNjRC9mZ8jlp0+Q8aywyM2Bq5kWVKEdk24aEsl1
         BoMjbDyQzrt5SuEX9uWLftP7W34e81bgMokMWS6dg281bdD0r3B4JC0Qel6wwmlQdQnZ
         ViZbK6VQCZFwrrwbitLc+30HcSMOdLquSQiHGZEs7jsq2RZyRERH5oD3UZxIyV13vZ28
         LTBZwksuRzAw9oeKsk9WYK5okR3w8HYO4ebQqrVA7ASIjlELt20juUMQDzDVAGw08RBU
         wXcA==
X-Gm-Message-State: AOAM530ChEGfQujdX3hbUe6jdh0ZJ2qvn4kAN+S627938jvuq9zb/Vst
        QxkFmiZqfCCi+dYZsyCK4NuAlQ==
X-Google-Smtp-Source: ABdhPJx6MantSUmHLqZL3Rdo8nhUHc4SqNiVIbqa5aYBg6L1cry77BtTByahiAyHKLttAj1nH+JoMw==
X-Received: by 2002:a1c:f30a:: with SMTP id q10mr9539427wmq.159.1614779012467;
        Wed, 03 Mar 2021 05:43:32 -0800 (PST)
Received: from dell.default ([91.110.221.155])
        by smtp.gmail.com with ESMTPSA id w18sm6109524wrr.7.2021.03.03.05.43.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 05:43:31 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Kuogee Hsieh <khsieh@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 03/53] drm/msm/dp/dp_display: Remove unused variable 'hpd'
Date:   Wed,  3 Mar 2021 13:42:29 +0000
Message-Id: <20210303134319.3160762-4-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210303134319.3160762-1-lee.jones@linaro.org>
References: <20210303134319.3160762-1-lee.jones@linaro.org>
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
index 5a39da6e1eaf2..31bf2a40a9eb2 100644
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
2.27.0

