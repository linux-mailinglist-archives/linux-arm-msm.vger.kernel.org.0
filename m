Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 23C3076832C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Jul 2023 03:19:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229582AbjG3BTh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 29 Jul 2023 21:19:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229593AbjG3BTg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 29 Jul 2023 21:19:36 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77B8D2701
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Jul 2023 18:19:35 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-99c0290f0a8so90999666b.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Jul 2023 18:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690679974; x=1691284774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yioIe+uTAjNaWqFB/KksKTj56LTjkm6FaSe/0rqQ0vE=;
        b=J9H6HlmR9Y3e51QNmRQFXSa8NtX2eZFtlfvSJ1oTq1l9thQrclE8DkHzsLbc3rwVr8
         coT//6Zuik0GsyME2RKZ0oNR5jOITZUeOx6WLwOkphjwmkO1lmShROA6REBODw/FTbnq
         h5FOD+sUMM1/iTAhxAGccRU+28uzx5eEvMyn6GAydg0g1GQvxIfQG57HDI1Ij1y6nIJ/
         eb1o+GQbtIEXpdzoCWIY53bJUhfMJlFG3jXkiey80dNAicsfDDtbglVYaNt2ZWwn1bcg
         v2BojPAXEHlnnwJZixZp5SEXxln3SXe5ZubrKVHpraP8jKZTb+HwiChmc6dzYxj4Qn7J
         BsbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690679974; x=1691284774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yioIe+uTAjNaWqFB/KksKTj56LTjkm6FaSe/0rqQ0vE=;
        b=QIIl1BROCK4K2P9vArFKwikokhfLeqRkdlqIAHN3T3hNiGK8aIs0YUmaaP0K/f2uI9
         O71cpQHTFIgvn0OQdWSlP+MtzP2sJqhykN3OwZEwiLXgGFCVoLsk5srUuCeB9QCqOD/W
         30NUGs4mfBezpyLHCpOHf7rQK2h4x7tgR+KRWngxBd+Jm+55UkCf8PLQGtOA6WHAjhjd
         /BAEtWndTbGY62NorIuDDhyjcZvbup1944GdeCq60odnnVN86Vwl/9eLM/8/oJg6zB6c
         JxlNQNpC5ofGJ7p3B7dr8SdRc2EslPwnmeNYsq32OkY0zyYLpb6+PO//s55tabCt5c0o
         nrVg==
X-Gm-Message-State: ABy/qLbElaY2jJM+NfZAoGTc4PLMKlDwSd8LIlDrSOL7A5b5iBidqpUw
        nZFh1TKAwyCic5ngL8uiK1KgyA==
X-Google-Smtp-Source: APBJJlGNKzI082+s3Hh7aKa5+/unvv/JBT17q7Rre+YQi87qky0rO3wYheyt4VpN1PfNXHp2tQ/YaQ==
X-Received: by 2002:a17:906:10c:b0:993:8d16:4c22 with SMTP id 12-20020a170906010c00b009938d164c22mr2908357eje.75.1690679974099;
        Sat, 29 Jul 2023 18:19:34 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id rk21-20020a170907215500b00992ea405a79sm3915835ejb.166.2023.07.29.18.19.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jul 2023 18:19:33 -0700 (PDT)
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
Subject: [PATCH v3 08/13] drm/msm/dpu: remove QoS teardown on plane destruction
Date:   Sun, 30 Jul 2023 04:19:15 +0300
Message-Id: <20230730011920.354575-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230730011920.354575-1-dmitry.baryshkov@linaro.org>
References: <20230730011920.354575-1-dmitry.baryshkov@linaro.org>
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

There is little point in disabling QoS on plane destruction: it happens
during DPU device destruction process, after which there will be no
running planes.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index aba5185e1d66..f114efee1b57 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1173,17 +1173,10 @@ static void dpu_plane_atomic_update(struct drm_plane *plane,
 static void dpu_plane_destroy(struct drm_plane *plane)
 {
 	struct dpu_plane *pdpu = plane ? to_dpu_plane(plane) : NULL;
-	struct dpu_plane_state *pstate;
 
 	DPU_DEBUG_PLANE(pdpu, "\n");
 
 	if (pdpu) {
-		pstate = to_dpu_plane_state(plane->state);
-		_dpu_plane_set_qos_ctrl(plane, &pstate->pipe, false);
-
-		if (pstate->r_pipe.sspp)
-			_dpu_plane_set_qos_ctrl(plane, &pstate->r_pipe, false);
-
 		/* this will destroy the states as well */
 		drm_plane_cleanup(plane);
 
-- 
2.39.2

