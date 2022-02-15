Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98BE74B6E82
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Feb 2022 15:16:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238479AbiBOOQ6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Feb 2022 09:16:58 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:35082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238496AbiBOOQ5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Feb 2022 09:16:57 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BD1D22BC8
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Feb 2022 06:16:47 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id b11so12443114lfb.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Feb 2022 06:16:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PSfsRzJkEgK/Vmp9eGzQeRkfQQALkinNmbtc1FEuOMY=;
        b=m4CaCdv+n7670jVhY+lvnPejzKPDMxc3DkfOmhG8MrdwGRZZSMsj8xzqC4VZgoXEEa
         g3woR+hHqj3q1mnwZ3uASTBu+ms+weVqOXRoyjq/KXDlWrUzYxJIz++OHKI5Q1d4IvEd
         fRVkAz5jq0lRn/aRj044UjUiIZ5Z7JtUn4zi+ZKNEHKkdR2cIchO+n+YA9qkWUBVkd3d
         G0eep/nHlXcvOtDlXRj9wTPwaoblMk59vwfHbOFLib4SeSw71sdm4/2r9c8tzlIdl+wH
         14pzCi0VzWvidwPOFIztOnF9d7dubWVmRIBhGRGcp1gCxKNM4lirRr9ty7cjldvW12D8
         dYVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PSfsRzJkEgK/Vmp9eGzQeRkfQQALkinNmbtc1FEuOMY=;
        b=GE651bd1r+svKD3ukNcLl3kYK1L8H7ZTOCdI40O08cxgGeld1CTmaG/SDgKAgxs+hN
         JA61mi7s4ntwU7pNBjxJLSXXaebxw1Y4Qc7HthJA6qhPhqL3rAMEvQtaA2GvtBBOTC3y
         Wce9Yq6CRO/Z3LRHsSRiaNG83mJUeZJQWQnxuZc3UyTXqnaEEjLgJHdh7+3gVldtyNI6
         jTaNxU59n7n8ndp/j5N6GJ9Uu+/+WO/guuZb1gRpuJTkVipm8wk9jwZJlZciiw4p/Bav
         u929QSR4h3y1+vUi3CE9VghTYDw88v2+6DhiMgTVZUiVaoRVbuK+9lK7Sg7XWrA8/6wJ
         l4NA==
X-Gm-Message-State: AOAM5311ux4n8XJQlIVqoi4pr8rFkFlnWXF+hV4A0GIkB7gNa7pufdXC
        Dbs3Imcl0vxD+3Fh7ybIjofEAg==
X-Google-Smtp-Source: ABdhPJyinQ0AoywLq7LdUetGXGJVk/PRud76P5Q/F1zIkR64pHnyfTnSNAgdY1XV5r7NmkDdQhymBA==
X-Received: by 2002:a05:6512:104c:: with SMTP id c12mr3217127lfb.418.1644934605400;
        Tue, 15 Feb 2022 06:16:45 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id m16sm1018044ljb.131.2022.02.15.06.16.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Feb 2022 06:16:44 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v2 1/8] drm/msm/dpu: fix dp audio condition
Date:   Tue, 15 Feb 2022 17:16:36 +0300
Message-Id: <20220215141643.3444941-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220215141643.3444941-1-dmitry.baryshkov@linaro.org>
References: <20220215141643.3444941-1-dmitry.baryshkov@linaro.org>
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

DP audio enablement code which is comparing intf_type,
DRM_MODE_ENCODER_TMDS (= 2) with DRM_MODE_CONNECTOR_DisplayPort (= 10).
Which would never succeed. Fix it to check for DRM_MODE_ENCODER_TMDS.

Fixes: d13e36d7d222 ("drm/msm/dp: add audio support for Display Port on MSM")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 132844801e92..c59976deb1cb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1099,7 +1099,7 @@ static void _dpu_encoder_virt_enable_helper(struct drm_encoder *drm_enc)
 	}
 
 
-	if (dpu_enc->disp_info.intf_type == DRM_MODE_CONNECTOR_DisplayPort &&
+	if (dpu_enc->disp_info.intf_type == DRM_MODE_ENCODER_TMDS &&
 		dpu_enc->cur_master->hw_mdptop &&
 		dpu_enc->cur_master->hw_mdptop->ops.intf_audio_select)
 		dpu_enc->cur_master->hw_mdptop->ops.intf_audio_select(
-- 
2.34.1

