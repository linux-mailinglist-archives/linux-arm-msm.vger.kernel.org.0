Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D6F6398CF2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jun 2021 16:33:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231524AbhFBOfX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Jun 2021 10:35:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231396AbhFBOfS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Jun 2021 10:35:18 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92708C061761
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Jun 2021 07:33:27 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id m18so2561085wrv.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Jun 2021 07:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=T8jZ4n5cOgv/UmZYK2xnz10jZVZgWxDdZjKqpW0gHh0=;
        b=dNuB3B2ZN/IUe14URz5THaczrIvVApLvBf/j+zvvve6RZ/O6re2huGXtRCQgRWkAOP
         w5fzHvDWc4Rh/Ay7X/DPmNU3/6S+vJ352lVlWbPNaSLwY6fdTCX9WKJCOajDKCEf8DH9
         yryJjXIuK+qZBVE8xock7wffCr6aKu4DQhdQvxjmPpd2h0i2oiwESzoSLB7l6fDeMbkk
         7qRBB1szRgH6DLxRCs16BoFwOA11D0RrqT7AYIXIYpp8IeiIkafzrjtzXSRSfIHZooIb
         +4nApsAavQKOmycMgWzVK+2LiLpq17G7LHw7l+qYsoTUkmlygCqdeHaxWqVrCi3O26UQ
         ZzPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=T8jZ4n5cOgv/UmZYK2xnz10jZVZgWxDdZjKqpW0gHh0=;
        b=CIRbd3+U8vZl4prdplH3CkSlypeVWl01cpHzrJyOVdzsxzFmGxbgmRCe8QB91fEMR/
         rTNGm8hXrwYKsIBcZ21OlSrPFRvoLkquUwDZ6MvtXpgq1Z67iRXVECzyu2jxFtvD0a3D
         UcvOSS7P4dN3suKg6rkrsIiRPrP9HZp2nV4ulMeZFV5Ccm0GZXvMtixzwjkgAm06MBoe
         nrw28GKAyQV3ErzXQwRCX9WNj0KzXSSbwaqncKDD7bl04rGpdjm29/A59U7cy3HRttJ5
         sTkq/1kNZOQ5uRuGYEd3AFzXVE+f77VGnXUr8K1E8Sx+oC9gsy9v0hXoTdLeyIyXzVDe
         RrOw==
X-Gm-Message-State: AOAM5315CIes58O9/U7r0hpgwrmAxmZlI6ln4vONSUJGigKJtlW3aF0N
        t5kwijGu3kZDw61vNYgVoXEp6Q==
X-Google-Smtp-Source: ABdhPJy4eaAZDDLpuejgdBoZ7/qW/U1oHdCxFoj2xXoCYyRG4oT5MTbvOgxHnOicDCh32UW/JzeOtA==
X-Received: by 2002:adf:8b9a:: with SMTP id o26mr23354563wra.96.1622644405303;
        Wed, 02 Jun 2021 07:33:25 -0700 (PDT)
Received: from dell.default ([91.110.221.214])
        by smtp.gmail.com with ESMTPSA id o11sm132315wrq.93.2021.06.02.07.33.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 07:33:24 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        Kuogee Hsieh <khsieh@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [RESEND 14/26] drm/msm/dp/dp_link: Fix some potential doc-rot
Date:   Wed,  2 Jun 2021 15:32:48 +0100
Message-Id: <20210602143300.2330146-15-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210602143300.2330146-1-lee.jones@linaro.org>
References: <20210602143300.2330146-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/msm/dp/dp_link.c:374: warning: expecting prototype for dp_parse_video_pattern_params(). Prototype was for dp_link_parse_video_pattern_params() instead
 drivers/gpu/drm/msm/dp/dp_link.c:573: warning: expecting prototype for dp_parse_phy_test_params(). Prototype was for dp_link_parse_phy_test_params() instead
 drivers/gpu/drm/msm/dp/dp_link.c:975: warning: expecting prototype for dp_link_process_downstream_port_status_change(). Prototype was for dp_link_process_ds_port_status_change() instead

Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Chandan Uddaraju <chandanu@codeaurora.org>
Cc: Kuogee Hsieh <khsieh@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_link.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_link.c b/drivers/gpu/drm/msm/dp/dp_link.c
index be986da78c4a5..1099604bd1c86 100644
--- a/drivers/gpu/drm/msm/dp/dp_link.c
+++ b/drivers/gpu/drm/msm/dp/dp_link.c
@@ -364,7 +364,7 @@ static int dp_link_parse_timing_params3(struct dp_link_private *link,
 }
 
 /**
- * dp_parse_video_pattern_params() - parses video pattern parameters from DPCD
+ * dp_link_parse_video_pattern_params() - parses video pattern parameters from DPCD
  * @link: Display Port Driver data
  *
  * Returns 0 if it successfully parses the video link pattern and the link
@@ -563,7 +563,7 @@ static int dp_link_parse_link_training_params(struct dp_link_private *link)
 }
 
 /**
- * dp_parse_phy_test_params() - parses the phy link parameters
+ * dp_link_parse_phy_test_params() - parses the phy link parameters
  * @link: Display Port Driver data
  *
  * Parses the DPCD (Byte 0x248) for the DP PHY link pattern that is being
@@ -961,7 +961,7 @@ static int dp_link_process_link_status_update(struct dp_link_private *link)
 }
 
 /**
- * dp_link_process_downstream_port_status_change() - process port status changes
+ * dp_link_process_ds_port_status_change() - process port status changes
  * @link: Display Port Driver data
  *
  * This function will handle downstream port updates that are initiated by
-- 
2.31.1

