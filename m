Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE6B074B9D7
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Jul 2023 01:13:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231953AbjGGXNC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Jul 2023 19:13:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231280AbjGGXNB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Jul 2023 19:13:01 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E69E2127
        for <linux-arm-msm@vger.kernel.org>; Fri,  7 Jul 2023 16:12:59 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-4fbc0314a7bso3954096e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Jul 2023 16:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688771577; x=1691363577;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p1naQ/0oURgoeOGRk7cLDdAN24Fuu5yXRK3xPVkECZM=;
        b=y6X17IOX3vPU+F4eOdp6bx2ef9/SqAne0XkRYRBO03aQjzK7s0PR3x3UGHSwfbGjtl
         q2YiBydiRuXwB8txqWP4ZMqLlgX85fj91ffSHGmGJs8EggF0XWPsCJD36x9/AOPv3E26
         sHbdou8U8Yd7iWNYQMveEh9eLuaBEfhdY8JipU5KIGV54SHiU/CM8v4z2TLJAa/8o9WF
         sDk6oLSXdgfKxtcP7h12rXtxQOLwZpwEcp3IzgM7MYcGQHsKksyUm3SfRIBxGveRQByI
         B7booek+P3KUukahR7HAdp5WreyG+cIe4xgk6Kj9P5bB3BNIrhLcm187yj4J1eJfcmJW
         IRJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688771577; x=1691363577;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p1naQ/0oURgoeOGRk7cLDdAN24Fuu5yXRK3xPVkECZM=;
        b=kXoPBQU6+dFl2Jcwl83Kqs31TQ0zYKjrhspkUmax36D5IREUlsM5SxXoMASBGxD0DW
         NCzbD5qbP3SSAEYwpa3ec/9NgpE0WbY/qoMHJB7+DVYwqjGEtuOPQfKRIXUs2ffjCRRr
         C1F3Emn2+x1Yx9nQaCA9VyU6BrsdtPi4VrJuyRv20py7Zvs3o9j2UgNXy7Jv5V255kxd
         ZIznYU41ewCblSB0PDneTulDwGrtWou1KVZiRhie6dQtHTH+Kf8e87jYIBo164w2AqW6
         8I4vxdeX60C3kv+jQf7FIdzn7jvfQHWU8JJI/NsDvKUVN9jNK4y1xx3QXPbG2IroepDh
         Y/cw==
X-Gm-Message-State: ABy/qLZixYxD2BVgXJsgyr0fm7/soYSXHt1+quvSx+yf3OPgIDMuNlBI
        /IkGrXR6eRcKkhVH1nE5ndHfBw==
X-Google-Smtp-Source: APBJJlEPkmOB8pJ06nDSf1tecIVwEr4jUaDXvQK5fsIYo8WkQ8uJYngo7bBisrq6+w3GPtOF2BP7XQ==
X-Received: by 2002:a05:6512:15a6:b0:4f7:6685:2c5f with SMTP id bp38-20020a05651215a600b004f766852c5fmr6169202lfb.61.1688771577765;
        Fri, 07 Jul 2023 16:12:57 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id d1-20020ac25441000000b004fb7388360esm841643lfn.188.2023.07.07.16.12.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jul 2023 16:12:57 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2 07/13] drm/msm/dpu: drop unused dpu_plane::lock
Date:   Sat,  8 Jul 2023 02:12:45 +0300
Message-Id: <20230707231251.3849701-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230707231251.3849701-1-dmitry.baryshkov@linaro.org>
References: <20230707231251.3849701-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The field dpu_plane::lock was never used for protecting any kind of
data. Drop it now.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index c2aaaded07ed..aba5185e1d66 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -78,8 +78,6 @@ static const uint32_t qcom_compressed_supported_formats[] = {
 struct dpu_plane {
 	struct drm_plane base;
 
-	struct mutex lock;
-
 	enum dpu_sspp pipe;
 
 	uint32_t color_fill;
@@ -1186,8 +1184,6 @@ static void dpu_plane_destroy(struct drm_plane *plane)
 		if (pstate->r_pipe.sspp)
 			_dpu_plane_set_qos_ctrl(plane, &pstate->r_pipe, false);
 
-		mutex_destroy(&pdpu->lock);
-
 		/* this will destroy the states as well */
 		drm_plane_cleanup(plane);
 
@@ -1447,8 +1443,6 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
 	/* success! finalize initialization */
 	drm_plane_helper_add(plane, &dpu_plane_helper_funcs);
 
-	mutex_init(&pdpu->lock);
-
 	DPU_DEBUG("%s created for pipe:%u id:%u\n", plane->name,
 					pipe, plane->base.id);
 	return plane;
-- 
2.39.2

