Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 197C72421A8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Aug 2020 23:09:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726179AbgHKVI7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Aug 2020 17:08:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725987AbgHKVI7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Aug 2020 17:08:59 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1CA5C06174A;
        Tue, 11 Aug 2020 14:08:58 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id e4so66033pjd.0;
        Tue, 11 Aug 2020 14:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MndcDzC/7AcUJRluxUgqjFCuSvCxnzh1AGFXbovDx5M=;
        b=noltbly0zKrpOk/SZeDEHs3VqJnIemgq0K4S5/hbOHx1rrIgo5711lTz2awSjikBfz
         5SeO5QIt37qI7/qXsIKttKFObQpZ1LN/725Z2XqnFj0Gtgt7bu2OfZ/D0g8VjAD9RyaI
         UJLvwVf5hOGPnlYzVJPWdvpD7Wlmvn88hYBOVs9ynTEDRhglJdmRnBt+yNadEVFRZepo
         r1nEmHabYv/7cBf2Vw8G5rdFHnYOZmdMLHlGOojo5CBs9FUqJAdsrG1TUJGmBJ7wf/cY
         GZ0O7It4V3Rd66hTUvL4kZq0ZgEZlp7MWNakNS46uDYsjN45EUplATuK2iBPhJAB0k9T
         O8zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MndcDzC/7AcUJRluxUgqjFCuSvCxnzh1AGFXbovDx5M=;
        b=mMXIZ3l+PqVZ9UjEv7WbKG+3RaC2870lcxM/ZRZI/SMsmYAqDWcHTWe5u1EUUmnL61
         7/9hC39oSsjN5n6D2qgSnY8/NR4kJJILAPiVgt9xpDu10cJ8TZ+YckFW31yumzWw8rnm
         jkEuuWh9R0EPOJwn8YIgkQfevaelj98Ok7wgPspWk4stPOoyGWmXSD4se2OiXHTE95GB
         zC5mOTfazPBXgv3iKijfsxP2+lIVLxzdSV7kMSh9UCjVO1g44APPW0G1/82EueDywtV1
         LhddUgDM/J8eiClH8zY8A3CvQtCE7XuLhVGycHeK+pYiYb3bQfR3dnuxzxNGewUv8/ie
         tvYA==
X-Gm-Message-State: AOAM533EocbWgOSN1DXL3ltn5Mbqm7nQ9yQ0iGr2tqr6XBh6Pif2+joW
        1zdcAyrpAisybD5H0N/orVo=
X-Google-Smtp-Source: ABdhPJxQYo13BOHv9SR2FnAADb18QXpqroXf/pda53QGuHBM1XL/wjykqI6CGbWG6k9YJwfLrhDjWA==
X-Received: by 2002:a17:902:b18b:: with SMTP id s11mr2646637plr.211.1597180138472;
        Tue, 11 Aug 2020 14:08:58 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id b63sm6060pfg.43.2020.08.11.14.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2020 14:08:56 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Rob Clark <robdclark@chromium.org>,
        kernel test robot <lkp@intel.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Drew Davenport <ddavenport@chromium.org>,
        Bernard <bernard@vivo.com>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Hongbo Yao <yaohongbo@huawei.com>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm/dpu: fix unitialized variable error
Date:   Tue, 11 Aug 2020 14:09:35 -0700
Message-Id: <20200811210938.552939-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c:817 dpu_crtc_enable() error: uninitialized symbol 'request_bandwidth'.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index f272a8d0f95b..c2729f71e2fa 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -827,7 +827,7 @@ static void dpu_crtc_enable(struct drm_crtc *crtc,
 {
 	struct dpu_crtc *dpu_crtc;
 	struct drm_encoder *encoder;
-	bool request_bandwidth;
+	bool request_bandwidth = false;
 
 	if (!crtc) {
 		DPU_ERROR("invalid crtc\n");
-- 
2.26.2

