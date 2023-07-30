Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DFF3B76832B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Jul 2023 03:19:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229584AbjG3BTf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 29 Jul 2023 21:19:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229582AbjG3BTf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 29 Jul 2023 21:19:35 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 371492701
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Jul 2023 18:19:34 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-991da766865so509447366b.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Jul 2023 18:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690679973; x=1691284773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zhsx7GBIayg1d2EQrr5L0MXpOvxIQMLvILidhQwKLhE=;
        b=F3Nx7+e0VegjEgUw1G0wu2eDE9Z45SdjXoDyGorpWhAShwFYDNSwUe3tl+h5/EqQfc
         JP5zV8hxF/zbk87NocjF6qxNz+T1XHq8wD7VBRA4kBonRmjR2WatUM+KchVMBwTyZkq4
         po31vz9bLoxSxolEWbp95M/9yJwJMtKY6utCr+SzOQvY/EuGIRjHwh14f1qxy6AnfJtL
         YutmcIzO88LbOqK5y1IrD+JZdROp+K7BHVOwLvR6XBeDbACQXpNldILd32ZT2TjnaKbi
         ervH4kOZ3gFKunlCOE8282YdIs6eQ+yUtej8kCEqvOzK7fJ9dhUZjC3l/FPE8vmLvchG
         nEEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690679973; x=1691284773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zhsx7GBIayg1d2EQrr5L0MXpOvxIQMLvILidhQwKLhE=;
        b=hHWlTjkKdf7RgHqvPxy3LhoNDn2kivObXtdx34UGzwtfLAaPH4Cjl/2A9/xQMIiryQ
         vRmE4JldHn0seCbrpeyUrZZ0blsGxdHpa+1Ff06WOzpH0vm0k46HOqCToSL2p/VpZw72
         1xmrfC8oIXIm6HdqHK9FNFtaTsfb/acoIY24N332AOqbWV++ZM+qKG+jcCNj9CuYdVEC
         lovrbuxSbrLCsFGGnY6OszBDI6jxGCVGEXjkUQVJBMYKzmrtzuZGVZYDFcp/Jo0CeLH8
         QsBOjJR1kirxukee5ECjB8VIVv1FdXiW1NuNBbKjCX9sYD4nRf1SpsktuztUHBYFi/Ne
         iT3g==
X-Gm-Message-State: ABy/qLa+EDpLslpY840hjvJhMZkRy95ko5oyrf/V3xb1IyHPyNV7/z74
        wwCC5oSrvaYYyglUzmWzSQbvSw==
X-Google-Smtp-Source: APBJJlEG5W+E9VP89/jmfwQVUoqTXpMGTUf5maMauxazGsh3X96NMK2ctHZzMFv3Yfu0zDVtJzFEaA==
X-Received: by 2002:a17:906:8a70:b0:993:d7c4:1a78 with SMTP id hy16-20020a1709068a7000b00993d7c41a78mr3475810ejc.10.1690679972753;
        Sat, 29 Jul 2023 18:19:32 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id rk21-20020a170907215500b00992ea405a79sm3915835ejb.166.2023.07.29.18.19.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jul 2023 18:19:32 -0700 (PDT)
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
        Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: [PATCH v3 07/13] drm/msm/dpu: drop unused dpu_plane::lock
Date:   Sun, 30 Jul 2023 04:19:14 +0300
Message-Id: <20230730011920.354575-8-dmitry.baryshkov@linaro.org>
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

The field dpu_plane::lock was never used for protecting any kind of
data. Drop it now.

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
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

