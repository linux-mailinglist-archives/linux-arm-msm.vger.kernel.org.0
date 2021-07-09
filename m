Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD2943C2BCB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Jul 2021 01:50:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231286AbhGIXxQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Jul 2021 19:53:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231244AbhGIXxP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Jul 2021 19:53:15 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61A72C0613DD
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jul 2021 16:50:31 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id r16so10645456ljk.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jul 2021 16:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hoN8ubV+NL8AcGXwOuvZXUIKfTF5XnABfb0Z79GoR78=;
        b=quuDsEutRmMltKHkzhv5sPpAdPqn4r1fYbFOA3X8HG+gBIMHvtMqSUvYPVZR/XJByT
         b7nw1SQYCSSkHxCST9c2DOvxrLJ6LiXiVTCs/HrMu264W5Jim8QydZVxnDvA80vBakJB
         1g7iXrvijk6YPyt/lPjOPJB5IvjGi7froKOD8JWkJx17qvmIoH0gav7HBl3PHUdoGeg8
         Us6g7ofAMVvAVota10aZ8gsI2K20C/dBEVVJQxGtJ4tbhg0mE8qCLeVMxzL7fidB5au9
         b34mHmAbguT+O6tqLK8kTEu7J+5d00HS81pa6LNdSeIVvyR6AE9r2YdXCc7aOfgk0nUd
         YrPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hoN8ubV+NL8AcGXwOuvZXUIKfTF5XnABfb0Z79GoR78=;
        b=p91MDSCmoBF8CjWt+7i8Hd2HM6F6OsgCA56HvflVJ0HryGv+Qtx0+v5Z+TN988a+hh
         APoM7vYv/4GuDfYatB+SFW6BKCAOCbwKR2zCVKm4R5tdI4hgGxR3KhsnKWSHcNOw3yhA
         uTAvBp2IQZO6vMCNJfyQafjv9W6SpO0EpxCRfFyOq/dWLBonAvFbMG3KChadP6fJsUNK
         p5b15tt2zNFcJ7PPe07APMH9njw3HeJb6wYUD/P7UYt/UH+Cndmv7az/CRLoGG51Sgny
         TNaeNX2WE1JWPWLFTvRwB7fLkMFkil7uPzl/ewJhSHa7sE++YSK8uv5Q6bAwa8mn4atA
         0FkA==
X-Gm-Message-State: AOAM532zznBfdQNSlPW7OOuMgrHkesQENEQxGhNuttj63+PlAHDlQXIR
        Cj142mY/Xsf2vsRA6EOHWh2DWg==
X-Google-Smtp-Source: ABdhPJxkZo+rx9Fi2loI4UVnBbE2VZH7ldG6qdDneK0XQ7YnW9JmijHNHoFrFogWWttshz3NCmzRqg==
X-Received: by 2002:a2e:8614:: with SMTP id a20mr21090696lji.31.1625874629371;
        Fri, 09 Jul 2021 16:50:29 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id v10sm718964ljp.20.2021.07.09.16.50.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 16:50:28 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v2 4/7] drm/msm/mdp5: move mdp5_encoder_set_intf_mode after msm_dsi_modeset_init
Date:   Sat, 10 Jul 2021 02:50:21 +0300
Message-Id: <20210709235024.1077888-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210709235024.1077888-1-dmitry.baryshkov@linaro.org>
References: <20210709235024.1077888-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Move a call to mdp5_encoder_set_intf_mode() after
msm_dsi_modeset_init(), removing set_encoder_mode callback.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 15aed45022bc..b3b42672b2d4 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -209,13 +209,6 @@ static int mdp5_set_split_display(struct msm_kms *kms,
 							  slave_encoder);
 }
 
-static void mdp5_set_encoder_mode(struct msm_kms *kms,
-				  struct drm_encoder *encoder,
-				  bool cmd_mode)
-{
-	mdp5_encoder_set_intf_mode(encoder, cmd_mode);
-}
-
 static void mdp5_kms_destroy(struct msm_kms *kms)
 {
 	struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(kms));
@@ -287,7 +280,6 @@ static const struct mdp_kms_funcs kms_funcs = {
 		.get_format      = mdp_get_format,
 		.round_pixclk    = mdp5_round_pixclk,
 		.set_split_display = mdp5_set_split_display,
-		.set_encoder_mode = mdp5_set_encoder_mode,
 		.destroy         = mdp5_kms_destroy,
 #ifdef CONFIG_DEBUG_FS
 		.debugfs_init    = mdp5_kms_debugfs_init,
@@ -448,6 +440,9 @@ static int modeset_init_intf(struct mdp5_kms *mdp5_kms,
 		}
 
 		ret = msm_dsi_modeset_init(priv->dsi[dsi_id], dev, encoder);
+		if (!ret)
+			mdp5_encoder_set_intf_mode(encoder, msm_dsi_is_cmd_mode(priv->dsi[dsi_id]));
+
 		break;
 	}
 	default:
-- 
2.30.2

