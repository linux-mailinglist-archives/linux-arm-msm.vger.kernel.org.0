Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EBFB16F46AD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 May 2023 17:05:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234221AbjEBPFz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 May 2023 11:05:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233338AbjEBPFt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 May 2023 11:05:49 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C1E8212E
        for <linux-arm-msm@vger.kernel.org>; Tue,  2 May 2023 08:05:39 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2a8eb8db083so39321271fa.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 May 2023 08:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683039937; x=1685631937;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PbDxCYhJmFFSMUEu1mJ+7YqN8UK0VH1yWSuHzujdSQ0=;
        b=dHLXF6BI7TxUfgEiL2W2yLAHWUN690x5s8xpYLCgGo/vddLsBQlRvVpcpycCEwqCfv
         EeW1rQoPc0HLlzS22oiZsYN1CDTTsYfrp9iAIOJYaIfbyOSZ60qxZAjtYkqOfV9agNxo
         Iye6FPHiupKXpoyiFDQE2EjlnFQEq23G2d/cHOv4xbkzXg8cS73bMPF7u7LzHZ0/3PM9
         94ykglw/fissRvPNLl+mFup1JhqjLydweTIfynFET8fYo3ze6UinbD5c3KZjSoWXi5kG
         daauQdDewTW2KLxXuUSMDN5FT2N/N+J4rLa+jU5e0qs5hEzBru9caOZJXTUCTDRFe9oC
         qKKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683039937; x=1685631937;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PbDxCYhJmFFSMUEu1mJ+7YqN8UK0VH1yWSuHzujdSQ0=;
        b=Q3p2wW6yhA5AtUdkN34UmZaAn2autjU7hGbGGh9OneHu8lkms/HW8cV27BtB8EfY0H
         yMhQK3G+vGkDugRJ84o/XGZ2dYzawexfpSAHDgza/G6wQ2wFJiX22FH7dkn0jqmIxomT
         ElYp3FVaKjPBlRstk1D0PVVmfRZbcVSsQpW/o6A7SKWst2lUQDciXG40Xo3LRJglMl6o
         7LDRJwe3xLVMYipjKpBOvJqdr49OFqN5YwNLcA5sPYCPVrEoasBZG7YltH76LOHZ04Us
         pqUqJEUOz2XSsk3RPQxffcVYJwdkccpJUfSQ+emDDJT9SyLbnGbPF8m869fceIWtTzRq
         fVTA==
X-Gm-Message-State: AC+VfDztBrrIDk4oyHhJDQLIltAq6uu9aggP4hVlDR/w3sB65EHWZvU8
        OozpoWn7lIoSLgiXPrtsxsGPow==
X-Google-Smtp-Source: ACHHUZ7Om4FznqkWK9yUOG3yRHNlfrVnJEcE9TVriAyOZBUkrGycW30H5eYJs+BhnCKtCl2w8FTuIw==
X-Received: by 2002:a2e:7003:0:b0:2ab:24f:c3c1 with SMTP id l3-20020a2e7003000000b002ab024fc3c1mr4651071ljc.46.1683039937329;
        Tue, 02 May 2023 08:05:37 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id a22-20020a2e8316000000b002a8bb52d994sm5341659ljh.25.2023.05.02.08.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 May 2023 08:05:36 -0700 (PDT)
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
Subject: [PATCH v2 3/9] drm/msm/dpu: fix the condition for (not) applying QoS to CURSOR SSPP
Date:   Tue,  2 May 2023 18:05:27 +0300
Message-Id: <20230502150533.3672840-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230502150533.3672840-1-dmitry.baryshkov@linaro.org>
References: <20230502150533.3672840-1-dmitry.baryshkov@linaro.org>
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

The function dpu_plane_sspp_update_pipe() contains code to skip enabling
the QoS and OT limitis for CURSOR pipes. However all DPU since sdm845
repurpose DMA SSPP for the cursor planes because they lack the real
CURSOR SSPP. Fix the condition to actually check that the plane is
CURSOR or not.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 3b210320ea62..b8ed7247a6af 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1126,7 +1126,8 @@ static void dpu_plane_sspp_update_pipe(struct drm_plane *plane,
 	_dpu_plane_set_qos_lut(plane, pipe, fmt, pipe_cfg);
 	_dpu_plane_set_danger_lut(plane, pipe, fmt);
 
-	if (plane->type != DRM_PLANE_TYPE_CURSOR) {
+	if (pipe->sspp->idx != SSPP_CURSOR0 &&
+	    pipe->sspp->idx != SSPP_CURSOR1) {
 		_dpu_plane_set_qos_ctrl(plane, pipe, true, DPU_PLANE_QOS_PANIC_CTRL);
 		_dpu_plane_set_ot_limit(plane, pipe, pipe_cfg, frame_rate);
 	}
-- 
2.39.2

