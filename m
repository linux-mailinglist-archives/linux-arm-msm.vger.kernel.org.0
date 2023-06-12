Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A07172CE1A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jun 2023 20:26:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232987AbjFLS00 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Jun 2023 14:26:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237813AbjFLSZj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Jun 2023 14:25:39 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DD6DE7B
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jun 2023 11:25:37 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-4f62b552751so5452638e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jun 2023 11:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686594335; x=1689186335;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mmlZ3LfPcxfpnDiDYgpCM3PVTuzAQsiG4BBuQYBs540=;
        b=xk7wZx06nIV5fczb9HNWO2lfpb+vzO93udN9wM3kfHOXMowEZOC80TUxYnveb/KalX
         KoS3X3HpKoSmFVc9gzLMA/k9q2K7WoDj4mwBBn43OHGAj+fE+75Ig/K25hZmG2aGfa9Z
         Ax8VqQ3owduub4dHAZdyDBv/m934BwEaiKCwDJWLzZlXHinqKYCWMMvWVCQEshIKBJzz
         EC3HIb4HmQ0bHfwx4v7CxTXFDi2aDkSlc0TE4XxRUlJfMwZhComSJcHzW8a4A/2PJv0Z
         E9gliyWrXUikwKXglXIJA0HPE04Itlz4gU+CGuqwrnpqWiBt5KpUGL+JYjb9kXcJNZBL
         vvCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686594335; x=1689186335;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mmlZ3LfPcxfpnDiDYgpCM3PVTuzAQsiG4BBuQYBs540=;
        b=H8H0gxrq4KQbf1ZP0PCdD0LtpKTz7+GsIItUj8DlIOZF3P9U4r7HzWvUpoYcxq5JfK
         yFn99qU2TFiAaxH/2B9XmEmjLmiJvxFTPU0ma2dDTs1ymL5vA6N9hfKA8E0RXcU84z+Z
         05Fwq2PikWxBm+p/epPJLdqA81qc1o7XpUAAtmgSI+LqmZJXQs/ihJu3qvexFEXI73zd
         5FrIjKjIdq3iRVqjknRKgduY2JU9gytNs1RLmna+R34HmlvjA3kDY8WVwBhAV260Eqic
         DopMnY4EZBLAlyZWSq2flSM5k67JDXdOIK3k242Oo4vXMJa2VBbgzw/b3A4tNJ+AUnkD
         l3wg==
X-Gm-Message-State: AC+VfDw+5q/E6EgF9r8IkDAshAThYUcgjR/W2cl0H/iPQZixCv/zERJx
        k6PMU1U9g4Km7xLjM2vk4cHN1A==
X-Google-Smtp-Source: ACHHUZ4XZxIQ/c4uNWvhPciEQKRbkt895So16/iuJ0rYLPeiNyMovPgByOeciUoH8a2eiCz7jqAs/w==
X-Received: by 2002:a19:f207:0:b0:4f6:3677:54e with SMTP id q7-20020a19f207000000b004f63677054emr4082354lfh.36.1686594335462;
        Mon, 12 Jun 2023 11:25:35 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id v16-20020ac25930000000b004f63dd1dab0sm1503396lfi.98.2023.06.12.11.25.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 11:25:35 -0700 (PDT)
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
        Yongqin Liu <yongqin.liu@linaro.org>
Subject: [PATCH 1/2] drm/msm/dpu: do not enable color-management if DSPPs are not available
Date:   Mon, 12 Jun 2023 21:25:33 +0300
Message-Id: <20230612182534.3345805-1-dmitry.baryshkov@linaro.org>
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

We can not support color management without DSPP blocks being provided
in the HW catalog. Do not enable color management for CRTCs if num_dspps
is 0.

Fixes: 4259ff7ae509 ("drm/msm/dpu: add support for pcc color block in dpu driver")
Reported-by: Yongqin Liu <yongqin.liu@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 6e684a7b49a1..1edf2b6b0a26 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1463,6 +1463,8 @@ static const struct drm_crtc_helper_funcs dpu_crtc_helper_funcs = {
 struct drm_crtc *dpu_crtc_init(struct drm_device *dev, struct drm_plane *plane,
 				struct drm_plane *cursor)
 {
+	struct msm_drm_private *priv = dev->dev_private;
+	struct dpu_kms *dpu_kms = to_dpu_kms(priv->kms);
 	struct drm_crtc *crtc = NULL;
 	struct dpu_crtc *dpu_crtc = NULL;
 	int i, ret;
@@ -1494,7 +1496,8 @@ struct drm_crtc *dpu_crtc_init(struct drm_device *dev, struct drm_plane *plane,
 
 	drm_crtc_helper_add(crtc, &dpu_crtc_helper_funcs);
 
-	drm_crtc_enable_color_mgmt(crtc, 0, true, 0);
+	if (dpu_kms->catalog->dspp_count)
+		drm_crtc_enable_color_mgmt(crtc, 0, true, 0);
 
 	/* save user friendly CRTC name for later */
 	snprintf(dpu_crtc->name, DPU_CRTC_NAME_SIZE, "crtc%u", crtc->base.id);
-- 
2.39.2

