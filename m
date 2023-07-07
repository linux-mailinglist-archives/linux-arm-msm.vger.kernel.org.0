Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E4D8A74B7F4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jul 2023 22:37:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231430AbjGGUhd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Jul 2023 16:37:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231316AbjGGUhd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Jul 2023 16:37:33 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18AA71986
        for <linux-arm-msm@vger.kernel.org>; Fri,  7 Jul 2023 13:37:32 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-4f954d7309fso2936853e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Jul 2023 13:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688762250; x=1691354250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yioIe+uTAjNaWqFB/KksKTj56LTjkm6FaSe/0rqQ0vE=;
        b=G7+9Q2ARn2AUFKr0BNkwscg8arprWHJUG8GaVp3efNf3xG5805X+tV7I7a/tehweLU
         dn//vV614BUIeXRpmsNk2hMJuuO2neek2kuX9OKUISKjchuZ1wbIOGknvTnhacoCebOD
         a430et2PS8E0p4CDOuKk3DZrqUwsZH2qnuyV+5v4md8YZCw5NZ/bI0z3ymCuZRbmvWe5
         RVYmUny1eWt4DzkGs7y1HAlVv19A70IQHcE48eUcpOoGnbIfsp5Fad5QV0NqUrbd3Kp+
         azDx8om/arizR/KPAQ5hPde4Ri4a2ovrxShl9sfpbGqrwxmABlSA+I4AekWFj8KSCKPk
         Qc/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688762250; x=1691354250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yioIe+uTAjNaWqFB/KksKTj56LTjkm6FaSe/0rqQ0vE=;
        b=VRYyXDhhagpFKuIwT/SUyD9PIyiubxwCA68x0HTNLY5SDKPuBDqrHxNf/W47c++iUm
         tGMOPG3YbRFbCBN65B6Bb+yyKHtl4WvZS5BixflOesJJZ17k2mSmtfRIdCHXmxsmEnVS
         SnMK+V+p43ZcgPF0pr2oLBorhJg/luHgCq6WKWhg4Hi2OdldJGZeg+njwJE+ncYYNiUs
         SmLUvdWLY4o+50cDEC1KC4UfziweQHwWHjjFnTnsPYF1ZgOMQ7oH+40lx0ZOH/nLYUVt
         ae7oYGsixhs5H8Dx6tU07yyLzZ9z5IVEzFxaf5yGB51ky2Q3yGKRkOlMh9w+NJPKNxpq
         mMTw==
X-Gm-Message-State: ABy/qLaTFO5gmkFbYIAyzhJc+TZKcAH5jS3Lqe/pMSrTsCHOWKFLNFpS
        75KCD6wIISNLl78iTWrhdan/yA==
X-Google-Smtp-Source: APBJJlFpUgpe2yRk6U8blp0u1+rL8k0xX/mnOXMJdYGITuNXoS7hY4aGbbG/jf3ZtFykxtPtQRccKQ==
X-Received: by 2002:ac2:5e61:0:b0:4f3:b18a:6494 with SMTP id a1-20020ac25e61000000b004f3b18a6494mr1997541lfr.22.1688762250395;
        Fri, 07 Jul 2023 13:37:30 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id d4-20020ac244c4000000b004fb738796casm808899lfm.40.2023.07.07.13.37.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jul 2023 13:37:30 -0700 (PDT)
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
Subject: [PATCH 08/13] drm/msm/dpu: remove QoS teardown on plane destruction
Date:   Fri,  7 Jul 2023 23:37:19 +0300
Message-Id: <20230707203724.3820757-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230707203724.3820757-1-dmitry.baryshkov@linaro.org>
References: <20230707203724.3820757-1-dmitry.baryshkov@linaro.org>
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

