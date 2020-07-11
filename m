Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D06721C135
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2020 02:50:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726907AbgGKAuE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Jul 2020 20:50:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726819AbgGKAuC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Jul 2020 20:50:02 -0400
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com [IPv6:2607:f8b0:4864:20::841])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FAD8C08C5DC
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2020 17:50:02 -0700 (PDT)
Received: by mail-qt1-x841.google.com with SMTP id j10so5889737qtq.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2020 17:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EqGVPzCwYn8DVvhE6LVcxMlICfwfg+X8jSsAedeo4EE=;
        b=U07JsQqOYThoeXOWRr780uAc+xSeVG5Ar2cW1EfZkLwzYaUB5PK51LAUREfgmPCYAP
         4YiS0YP6SW6/aA81H/9eTsfxbDhsuvA1EhdyBOw/MSm2ObCVp7+mR/iQ8F4q1R73SmWf
         Mt517mt6geMZoTrpDXQxnh/U/tStBj5XEq2miOxZmgWPB6xpveggslCAAIIyXqg2Hqv/
         WkttHJ2UIwudlXHEMCqfoNp3Gr7SNhVf+BiwQ18zKYtKH/jSGwpL8NCki/C5SG+m0a3s
         0tR4xZyVstqdznLNvSu1hPddUABcGTlPLupA6vNjtuOFLT1BbsyUYoOqodO/dpwfm4lQ
         3jZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EqGVPzCwYn8DVvhE6LVcxMlICfwfg+X8jSsAedeo4EE=;
        b=Y63eZZqa6w55GpD8m4gHLoEv+igZIjpzxPZnKxJhg7jlsbcxKV30C2UdpRH5ArALL/
         zjbhWl5oneHWkO1XF7pRFkeYq9x6qG63hm7waJpPX3EU1MrEdMhXy84Gwn4uLRZucYBZ
         pxFiEwCxp525TK+C9U2BRVibO8T+6uFIsEIFSwQnJXEaSNlMaKQ2dPLnIkH6RDzeciU5
         2ht7zpQppwLdHeldryh2pU9R84dHObco+cTgMI5Ubf16IRNSi+05CXA7o9ZBwsJxBqN2
         Wfa/eYa3gClraYy77i83TRgczolPQD9Mc0z4uSNGkTlUGJYj/wdESOgNBJCom+cbQqsN
         nv5Q==
X-Gm-Message-State: AOAM530M5gD43zmAazpvCoaN/x57AGIRn9dbV55cEg52iENLDvt23rYA
        7wpjngNHWqwTKtK2AI2eyN4+Tw==
X-Google-Smtp-Source: ABdhPJxSmVlqvrmOQqW9k1e9eaGMEu+jrDNFrnt2wdbqz+Oh08gO29ccE5VKEHOh9ukddD1+rJR89A==
X-Received: by 2002:ac8:4e03:: with SMTP id c3mr73934288qtw.82.1594428601656;
        Fri, 10 Jul 2020 17:50:01 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id g20sm10427510qtc.46.2020.07.10.17.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2020 17:50:01 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     freedreno@lists.freedesktop.org
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Raviteja Tamatam <travitej@codeaurora.org>,
        Shubhashree Dhar <dhar@codeaurora.org>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        dri-devel@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 1/8] drm/msm/dpu: use right setup_blend_config for sm8150 and sm8250
Date:   Fri, 10 Jul 2020 20:47:24 -0400
Message-Id: <20200711004752.30760-2-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200711004752.30760-1-jonathan@marek.ca>
References: <20200711004752.30760-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

All DPU versions starting from 4.0 use the sdm845 version, so check for
that instead of checking each version individually. This chooses the right
function for sm8150 and sm8250.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
index 37becd43bd54..4b8baf71423f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
@@ -152,14 +152,13 @@ static void _setup_mixer_ops(const struct dpu_mdss_cfg *m,
 		unsigned long features)
 {
 	ops->setup_mixer_out = dpu_hw_lm_setup_out;
-	if (IS_SDM845_TARGET(m->hwversion) || IS_SDM670_TARGET(m->hwversion)
-	    || IS_SC7180_TARGET(m->hwversion))
+	if (m->hwversion >= DPU_HW_VER_400)
 		ops->setup_blend_config = dpu_hw_lm_setup_blend_config_sdm845;
 	else
 		ops->setup_blend_config = dpu_hw_lm_setup_blend_config;
 	ops->setup_alpha_out = dpu_hw_lm_setup_color3;
 	ops->setup_border_color = dpu_hw_lm_setup_border_color;
-};
+}
 
 static struct dpu_hw_blk_ops dpu_hw_ops;
 
-- 
2.26.1

