Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2A88437BA7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Oct 2021 19:16:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233552AbhJVRSc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 22 Oct 2021 13:18:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233476AbhJVRSa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 22 Oct 2021 13:18:30 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22C33C061764;
        Fri, 22 Oct 2021 10:16:13 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id q19so4239062pfl.4;
        Fri, 22 Oct 2021 10:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=c9upTkwBh3xY9ywVd8LkCHHOA2Tt2sOFO924JWSijq0=;
        b=QrR58CC78T/zmrIipMKrPGSMwC/I47uWJVSNHT6Ydg3H9l4vuWSR1ZylzAAGbS0hkm
         Sz44gG5gK9JwqfvIJIcdc0nx+qtJNMyJWA581taM6Y5RHeBdkjz3NrfQ4mXRTEqunhJK
         EooRYODEnkxtrk/STfw5MjbjScdCK193Q2VKyWgywQpYlzLSTFrpsYn1dsna0Y1VAeJQ
         8mRZ+vTP72yFJKGlPFOmliIE5y4Ma1qf2b8P/ac22582z18XviqMtUuoH1OcuK5DZHEu
         m0ajmv8RLK4/Rb6umPwwpkwZDFYpgrJMPpMPZdGBSz680xdc8X/3MdSrKtX/dyi0Z9cB
         QaYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=c9upTkwBh3xY9ywVd8LkCHHOA2Tt2sOFO924JWSijq0=;
        b=c4/xw6I0O9y/Y1xZwr6MIxa41U1M3aBKU+O9KBM/ydjuEhDdcD831eL0js6bebLMJ2
         vQZynjBZf5icihglOXyL3Zapt88XNrvevbdOnYeb7R4YXnC7MBCJtt1lAt5MhLpoS42j
         MlRbv2jRAu4254YK9PxplbTTjWgvGMagKPMYg/h0Cqh8VUnPr0lEl226f6G4IPhRf2wL
         qn3nSiNlTmO0i45L7Pm6exWuAiBxkqvNwn9wjPNJHBiAo8Pegz1ACV9MmiUr5SIWYsq7
         lzj/B6UtK3RUvocAaEA0YlmP+lWSRLdzhoK6mukSA45XyMEvrMvYMbbraQJZuU3Zre5N
         Ku/w==
X-Gm-Message-State: AOAM530XS6B4wmj4Jkl4CbjBUS1xW/zWNSlFR+efBn5n1lULC04PNiV4
        cgJwrx/hWwDphqC1y7UXLX0=
X-Google-Smtp-Source: ABdhPJyi3p42NwGJnpHuM40MQDCQUuNXmqIX0qRYo/6NEw1YGQJUAfXkXwbF4oXxVbnngtJFjl9IRg==
X-Received: by 2002:a63:e24b:: with SMTP id y11mr741728pgj.452.1634922972511;
        Fri, 22 Oct 2021 10:16:12 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id u66sm10416377pfc.114.2021.10.22.10.16.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Oct 2021 10:16:11 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Krishna Manikandan <mkrishn@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        Jessica Zhang <jesszhan@codeaurora.org>,
        Mark Yacoub <markyacoub@google.com>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/2] drm/msm/dpu: Remove impossible NULL check
Date:   Fri, 22 Oct 2021 10:20:50 -0700
Message-Id: <20211022172053.3219597-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index e91568d4f09a..0ae397044310 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -187,11 +187,6 @@ static int dpu_crtc_get_crc(struct drm_crtc *crtc)
 	int i = 0;
 	int rc = 0;
 
-	if (!crtc) {
-		DPU_ERROR("Invalid crtc\n");
-		return -EINVAL;
-	}
-
 	crtc_state = to_dpu_crtc_state(crtc->state);
 	crcs = kcalloc(crtc_state->num_mixers, sizeof(*crcs), GFP_KERNEL);
 
-- 
2.31.1

