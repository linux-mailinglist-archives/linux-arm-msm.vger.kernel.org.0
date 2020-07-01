Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3809211477
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2020 22:35:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726287AbgGAUfa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Jul 2020 16:35:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726144AbgGAUf3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Jul 2020 16:35:29 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B55A4C08C5C1;
        Wed,  1 Jul 2020 13:35:29 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id j1so11488581pfe.4;
        Wed, 01 Jul 2020 13:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HJ9TTMafjAv2n6VF7CyukcttktdVGJm2gJrszfZ6yf0=;
        b=eLGWVeTElNhUAoI1bkt1Q/YJF+W9Y/Hj92NiYYHjzJ7FEnGOfAZ5vU0qxI12qZ5uAE
         pTqPszrGg4gMawg+/HY/3BmpMvqa9tP16eqWJoFiQ/YOKEr4IVhcikEAeAylh+Vs7VBl
         Mh+iaDh+l2PJuxj8p+ulSBQwNW4YH3FnuSfSv+g2iXed9wknURQdO5lXe3gPKUlecsIJ
         QhNq+F/2OLLNVmR94Qfr1Wno7ZnCTqViWaTrNoXX++ZgS7F8a05Ynqes8exHMMkao+G2
         ekiGg0CZk/4OD1S1w0xiJBatcngizTOKVe+AgZIzs78aPjOcMcoD4yh738b3UXKXMKdT
         YnzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HJ9TTMafjAv2n6VF7CyukcttktdVGJm2gJrszfZ6yf0=;
        b=ACyDupmSyhfxoR7aR4uuJebytGeYsMZ1pWuo0xN74z41hMQT5Nq0Twf0VwxiAw0vyH
         QcfaLLiC8TSoLVmVqkS+rheqgNNi8GylIloqX3stj/mO2BsRIkEQJBaH2cogTujQGB3e
         YqlPdb0c+hnyNeEbKubBZc0PgCk09Rj3NtuQX5heLjnddkff+cUo8n1ygQqawBId05rF
         KpjoDGTljpfDnO0T13L7JrhDumBCouGDLtlcslaRSBR2NfT7HkrVANphTz2dDZBcHZ/F
         C1ksoIsb1YR1MIa2ii+04PVE+JnI7thrkvHaE0yr57gHAuf3yjwijojk+YaKMMq2REMb
         IGXw==
X-Gm-Message-State: AOAM533wjBFkARYlLm/Soa5VyY3rLss0kOBVaf56w+7EJ3Qyu9fB+iGO
        ZMuAvB6dTVzOWrQnsT/FVLU=
X-Google-Smtp-Source: ABdhPJxUoiCn4AGn+fNLW0zKG5dEHRnT9pCAwHcIWzYq8IHBBFjU9ONd0ScleoT7eOV/MMwBuRTZBw==
X-Received: by 2002:a63:4c08:: with SMTP id z8mr20807693pga.201.1593635729136;
        Wed, 01 Jul 2020 13:35:29 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id e3sm3195919pjv.47.2020.07.01.13.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2020 13:35:28 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Drew Davenport <ddavenport@chromium.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Hongbo Yao <yaohongbo@huawei.com>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm: ratelimit crtc event overflow error
Date:   Wed,  1 Jul 2020 13:36:00 -0700
Message-Id: <20200701203602.1272157-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

This can happen a lot when things go pear shaped.  Lets not flood dmesg
when this happens.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index e15b42a780e0..969d95aa873c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -389,7 +389,7 @@ static void dpu_crtc_frame_event_cb(void *data, u32 event)
 	spin_unlock_irqrestore(&dpu_crtc->spin_lock, flags);
 
 	if (!fevent) {
-		DRM_ERROR("crtc%d event %d overflow\n", crtc->base.id, event);
+		DRM_ERROR_RATELIMITED("crtc%d event %d overflow\n", crtc->base.id, event);
 		return;
 	}
 
-- 
2.26.2

