Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B82444697B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Nov 2021 21:15:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233298AbhKEUR4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Nov 2021 16:17:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233293AbhKEURz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Nov 2021 16:17:55 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBCABC061714;
        Fri,  5 Nov 2021 13:15:15 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id s136so9244783pgs.4;
        Fri, 05 Nov 2021 13:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zo3rIYzOc3Xp6uAoP9Fv9lWIdKoPMXjS9MDpfKN91kc=;
        b=klECCijoYSjHh8+WqxV6Oh8UxAVsnZAibpB7wTOGvJyESIMyQwCqEh0C5yr/+HdBHC
         YkgDZPXUahVY4YaW1m52xzBy8qVc6qY4oZWNZnyHKrCyz1RljemRFcRlcVIW65q96SR9
         DtTFTor28us1UC5dlZlkhvgRyPmEdOwzTq5GI9NmADK4NUq4WDMx8/t1wScgH1dIidMB
         sAJFyI3XSwIW1KK3dFPHHSxmTvsaoK3rUcsICi8vUF4rWpnCxMc9Vx6D1BkvjRnqH/II
         6iyEVoDHrV2oje9YD1fVoNq0UA6E9OhhWa10sScxnjO4qqSX4qN0g54o8U0dvrBD7YOd
         5pyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zo3rIYzOc3Xp6uAoP9Fv9lWIdKoPMXjS9MDpfKN91kc=;
        b=O18FezP8+L2Rk+VCLT+N5dKB7LamVgABdEVFa9QUBfE+Soyr/AIBamjtCt3FpnEqoM
         FOOng6z53+2Jf6rVREhbGQFOvXIQRkBp390aml20r/jdV15KomZOwtG5phBpw7wUbtlu
         J2w26sDGq4CgWCaTfTVNPt4Eax6R3j6qSVg1fICvWF6kKWoVjGZIfghVoh0I7YoTh1RQ
         6yB7c4lkTqoGXzBmfp0+U1dJbVZQhj6eb1ny1n1y21oGa3xQalpKffPGQvqCqLdqXzQZ
         x1aT6OGowjFuFEWRiSIV+3HLRH9eIneA2mIATVoh3nWMWGnwll4KhPCad4DrOfc9sZOX
         8JLw==
X-Gm-Message-State: AOAM533YxwL2ulgFmD/VDaWCoVBRoqk3jah/TDbNOk/gyvQyxHS0zkkx
        rkSPs5ayZB4pEOX9r7kPuPM=
X-Google-Smtp-Source: ABdhPJwQJc0KBqMQuvF6EwTcAijRJhFdSAz+a471WITh171BrTeKd88KLrx6xsQhLWxBU9iSuk/AVA==
X-Received: by 2002:a05:6a00:14ce:b0:492:69bd:3906 with SMTP id w14-20020a056a0014ce00b0049269bd3906mr20222723pfu.18.1636143315150;
        Fri, 05 Nov 2021 13:15:15 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id b130sm8131340pfb.9.2021.11.05.13.15.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Nov 2021 13:15:13 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Steev Klimaszewski <steev@kali.org>,
        Rob Clark <robdclark@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2] drm/msm/devfreq: Fix OPP refcnt leak
Date:   Fri,  5 Nov 2021 13:20:21 -0700
Message-Id: <20211105202021.181092-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Reported-by: Douglas Anderson <dianders@chromium.org>
Fixes: 9bc95570175a ("drm/msm: Devfreq tuning")
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gpu_devfreq.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_gpu_devfreq.c b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
index d32b729b4616..07f1169df89b 100644
--- a/drivers/gpu/drm/msm/msm_gpu_devfreq.c
+++ b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
@@ -20,6 +20,10 @@ static int msm_devfreq_target(struct device *dev, unsigned long *freq,
 	struct msm_gpu *gpu = dev_to_gpu(dev);
 	struct dev_pm_opp *opp;
 
+	/*
+	 * Note that devfreq_recommended_opp() can modify the freq
+	 * to something that actually is in the opp table:
+	 */
 	opp = devfreq_recommended_opp(dev, freq, flags);
 
 	/*
@@ -28,6 +32,7 @@ static int msm_devfreq_target(struct device *dev, unsigned long *freq,
 	 */
 	if (gpu->devfreq.idle_freq) {
 		gpu->devfreq.idle_freq = *freq;
+		dev_pm_opp_put(opp);
 		return 0;
 	}
 
-- 
2.31.1

