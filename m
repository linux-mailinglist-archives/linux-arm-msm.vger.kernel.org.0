Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 455BE21C06D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2020 01:03:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726964AbgGJXDO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Jul 2020 19:03:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726961AbgGJXCu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Jul 2020 19:02:50 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D008C08C5DC
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2020 16:02:50 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id ls15so3227811pjb.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2020 16:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tVqx7g36rFA8fGH9HPQE1NOw2DZAuX6VKaMN/UQGYmk=;
        b=Et6Dk9C0ZAXRSSAVBOeYyozI3Jj+uhoeW1ZrbIn4h7Zhux2W8tHEXkW2/mrDbKQZqL
         Uvg6xpKFBy1wu6a4o5ZQrtYyfcgypwjH2LJNmsuaN5NHupqledwdyeX8dcn770r3gX2g
         hlziyVRNx3N8dW2y2fAPskxRWpjbeRquFS9fA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tVqx7g36rFA8fGH9HPQE1NOw2DZAuX6VKaMN/UQGYmk=;
        b=k9W6TbsgbHVGmGgrwoxP9XyhOjYLfNuo1skCLbYPdSKC/eVNZmtjQd1pdNFBkZr2M5
         trU7NngW+i9X4S+KWZrckA9dEtT8D1jeY6uHDmUbo8c5e4js+MPKYlO2xlsUq6/5VV6A
         J2XqixYuGuGaS0q0etat+3P+DplJVXdTwRxKLzfF22XY6vwC7IUNVDHEkgerC3m3Fs2q
         zyJqRyJOA0hWGjEYkwMY0TTI/8s+OJqZh55reaGTyXpaLxBDA5Xd6IuuxB9xD1dSowQA
         kOPerjX5DBn0dIKi2E/sd8hubUZNUYy8SMl+n72uE8T68tFj4SmMV4NckftUM+xTL4b4
         Yy5A==
X-Gm-Message-State: AOAM531nM3aUx/pyGut2AHN0Eps7Vq/vTiov99oGqQVxgnnMYxjJX5ZA
        QbWreYUSwbY8rj5mF6virynzOw==
X-Google-Smtp-Source: ABdhPJw4NYcILGIGbzu/Mo7t5i5bNT/aUinQfG5IFKgb6SVXfZdHoKdaoadkxhHDmq9STiHl74UbJg==
X-Received: by 2002:a17:902:d215:: with SMTP id t21mr40582652ply.136.1594422169822;
        Fri, 10 Jul 2020 16:02:49 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
        by smtp.gmail.com with ESMTPSA id my9sm7266836pjb.44.2020.07.10.16.02.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2020 16:02:49 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Rob Herring <robh+dt@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org
Subject: [PATCH 4/9] drm/msm: Avoid manually populating our children if "simple-bus" is there
Date:   Fri, 10 Jul 2020 16:02:19 -0700
Message-Id: <20200710160131.4.I358ea82de218ea5f4406572ade23f5e121297555@changeid>
X-Mailer: git-send-email 2.27.0.383.g050319c2ae-goog
In-Reply-To: <20200710230224.2265647-1-dianders@chromium.org>
References: <20200710230224.2265647-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

If our compatible string has "simple-bus" at the end of it then the
system will handle probing our children for us.  Doing this has a few
advantages:

1. If we defer we don't have to keep probing / removing our children
   which should speed up boot.  The system just probes them once.

2. It fixes a problem where we could get into a big loop where we'd
   have:
   - msm_pdev_probe() is called.
   - msm_pdev_probe() registers drivers.  Registering drivers kicks
     off processing of probe deferrals.
   - component_master_add_with_match() could return -EPROBE_DEFER.
     making msm_pdev_probe() return -EPROBE_DEFER.
   - When msm_pdev_probe() returned the processing of probe deferrals
     happens.
   - Loop back to the start.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/gpu/drm/msm/msm_drv.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 78b09fde9e29..f7c6ef147095 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -1208,10 +1208,18 @@ static int add_display_components(struct device *dev,
 	if (of_device_is_compatible(dev->of_node, "qcom,mdss") ||
 	    of_device_is_compatible(dev->of_node, "qcom,sdm845-mdss") ||
 	    of_device_is_compatible(dev->of_node, "qcom,sc7180-mdss")) {
-		ret = devm_of_platform_populate(dev);
-		if (ret) {
-			DRM_DEV_ERROR(dev, "failed to populate children devices\n");
-			return ret;
+		/*
+		 * Old device tree files didn't include "simple-bus"
+		 * in their compatible string so we had to manually pouplate
+		 * our children.  When existing device trees are fixed this
+		 * can be removed.
+		 */
+		if (!of_device_is_compatible(dev->of_node, "simple-bus")) {
+			ret = devm_of_platform_populate(dev);
+			if (ret) {
+				DRM_DEV_ERROR(dev, "failed to populate children devices\n");
+				return ret;
+			}
 		}
 
 		mdp_dev = device_find_child(dev, NULL, compare_name_mdp);
-- 
2.27.0.383.g050319c2ae-goog

