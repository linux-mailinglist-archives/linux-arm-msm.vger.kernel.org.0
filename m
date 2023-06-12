Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A689472B5F9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jun 2023 05:18:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234567AbjFLDSX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 11 Jun 2023 23:18:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234677AbjFLDRu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 11 Jun 2023 23:17:50 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91EDBE73
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Jun 2023 20:16:24 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-4f654d713c0so3971069e87.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Jun 2023 20:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686539777; x=1689131777;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vX21LLla0MPhcsSW4wvj7gR4EaqJE3wcHLDAEcLoY6c=;
        b=UEaw34LyFdwrlSiYVQJ5ZILZiR/N1JaAlaYFfucPkw2w4awQargHtrcPxLharIfjev
         qzrJowpSqvTy03z3pxsq1FA1OMc7suBtxDz16gi9EyuH7YI6BH6W0hk9VbRgs0t7D4Js
         1yVAFTvwQ0bZJGLdiPE1DB0ibsClmU17XnjfmODHvgAdQx38K6Fib6Nm8Jw3kfiWdcP1
         ufhOEPNZLRrMG1bpB6Y2MLDO59QtR12kNmvvSdMCh0GttG7NmOeJnS8xTjx+1o9QgGkE
         tHGrEC4u2+ioh1s2vHvL3VZXXIAf6gE/xWNko1SZXTqjDT8f2VV3thEhomWZlzgsz6aq
         DuGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686539777; x=1689131777;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vX21LLla0MPhcsSW4wvj7gR4EaqJE3wcHLDAEcLoY6c=;
        b=ZdlSbUdXBuMSNrTXB9K6/uuM4D4NFqreQNhqtR7FXmu79zubQ2LSDnyaZVKYAoB6Gm
         GvqYypKrQsq/D7RbbOCGxO2y2wtzVu68FaLV88lu8Rw59zVe76m61LviJlp3uq6THzuA
         SCiLxPHwU8SL97fAId15Ilb9qsTlDuU6/jlgHhWKrup05px5NpHnWomx8RnCfLmkXa4z
         NxyBSG5lco1hn+kYNLox81qC9F07Cgw9Z2lbYC2kU51wIIt4aXx6eHFq9px6n+czYtKu
         6DvkBNMY6i4OVUAcaKNf+75QBWHA2GWQ1mNHaTkO+4fWjgDMceir0M8khxPxQsnImess
         gBNw==
X-Gm-Message-State: AC+VfDzxdr34/8ClEvx1GAygaOKKnZ25qZ6/sn57BEnpYzo1Zf8pEKLX
        HnQi/NxytZ92/SlPzALoqPPzMw==
X-Google-Smtp-Source: ACHHUZ7xb6D35xBh+yT8h5vDpe68vonKc8bOPpe7y8I0g1oqybnBZZ8oB4/Z3mNH3dbwcrX/01MghQ==
X-Received: by 2002:a19:4f4e:0:b0:4f6:40e1:4a92 with SMTP id a14-20020a194f4e000000b004f640e14a92mr3490850lfk.13.1686539777360;
        Sun, 11 Jun 2023 20:16:17 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::ab2])
        by smtp.gmail.com with ESMTPSA id g12-20020a19ee0c000000b004f27471e0aesm1295901lfb.79.2023.06.11.20.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jun 2023 20:16:16 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Degdag Mohamed <degdagmohamed@gmail.com>,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 1/2] drm/msm: provide fb_dirty implemenation
Date:   Mon, 12 Jun 2023 06:16:15 +0300
Message-Id: <20230612031616.3620134-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Since commit 93e81e38e197 ("drm/fb_helper: Minimize damage-helper
overhead") the drm_fb_helper_funcs::fb_dirty helper is required for
proper dirty/damage processing. The drm/msm driver requires that to
function to let CMD panels to work. Use simplified version of
drm_fbdev_generic_helper_fb_dirty() to fix support for CMD mode panels.

Reported-by: Degdag Mohamed <degdagmohamed@gmail.com>
Fixes: 93e81e38e197 ("drm/fb_helper: Minimize damage-helper overhead")
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_fbdev.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_fbdev.c b/drivers/gpu/drm/msm/msm_fbdev.c
index fa9c1cbffae3..b933a85420f6 100644
--- a/drivers/gpu/drm/msm/msm_fbdev.c
+++ b/drivers/gpu/drm/msm/msm_fbdev.c
@@ -139,8 +139,28 @@ static int msm_fbdev_create(struct drm_fb_helper *helper,
 	return ret;
 }
 
+static int msm_fbdev_fb_dirty(struct drm_fb_helper *helper,
+			      struct drm_clip_rect *clip)
+{
+	struct drm_device *dev = helper->dev;
+	int ret;
+
+	/* Call damage handlers only if necessary */
+	if (!(clip->x1 < clip->x2 && clip->y1 < clip->y2))
+		return 0;
+
+	if (helper->fb->funcs->dirty) {
+		ret = helper->fb->funcs->dirty(helper->fb, NULL, 0, 0, clip, 1);
+		if (drm_WARN_ONCE(dev, ret, "Dirty helper failed: ret=%d\n", ret))
+			return ret;
+	}
+
+	return 0;
+}
+
 static const struct drm_fb_helper_funcs msm_fb_helper_funcs = {
 	.fb_probe = msm_fbdev_create,
+	.fb_dirty = msm_fbdev_fb_dirty,
 };
 
 /*
-- 
2.39.2

