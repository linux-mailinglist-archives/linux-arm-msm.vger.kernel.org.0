Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5DEE474B9D9
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Jul 2023 01:13:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231280AbjGGXND (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Jul 2023 19:13:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231909AbjGGXNB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Jul 2023 19:13:01 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2386C1FF0
        for <linux-arm-msm@vger.kernel.org>; Fri,  7 Jul 2023 16:13:00 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-4f76a0a19d4so3784012e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Jul 2023 16:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688771578; x=1691363578;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yioIe+uTAjNaWqFB/KksKTj56LTjkm6FaSe/0rqQ0vE=;
        b=ds616ByPYtKnHjCWMMUBNDEWOUeYZK4aGfrF/YufqwbAkGs7+bDBd+U3dyk5DFb/dK
         pdEuto/fBq53Ak7RjSdwvoA1p/aVwQxjZ3mUv+XlQ+azpBcFuELXcipGNLBegmQFjqnV
         K1WmS1Z30vauiIUovIcUWq1lmtqZi8BUeXqHU1ZhM0fRI/iXq/dlDOrx0HzojS4ziw+m
         oS4RNy/IR1hUAILZUzj56IB3Kdycod8F99/f6xK+vZyru7iDqe+9i9j2gCkO8engqx65
         30rLr2Evr25Tpjv6uB5A8eq2v/gp8gJyHr2MDJfc5mFKXSgCXC9HugQwTMflCvWdlWIW
         Unzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688771578; x=1691363578;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yioIe+uTAjNaWqFB/KksKTj56LTjkm6FaSe/0rqQ0vE=;
        b=hQez8CIyZKYoLArZwnVifDFdCPoactq6tP1zCC27bWI6+mbA46HGSf7uGKJEdPQCDP
         1+x60Js5sem0NMyy49dvWuLmeHeVFUPibx/IHahfnXxpOaNvQhqOmWI2Uqs8J28jI9uG
         HxYCwj+3Hpai+pwlYh2PqZ8JBL9fHbUGrTxFAdM2Zn0U/MnNSGLJoijPPs/fKDPAJ/Hx
         ZSzNxjzrSEIDUO3PMN7RTwE+XxnqCgy8fa5f/yEWLdf5NXjxc2hVhgc59CxM0PDlst23
         anAuFXKLGNB/TOlPC8+ujiaamuE/Wb7vSjVuaxYf/rOVDMlhmKzgibnaNLl9nwQinaxx
         zH3Q==
X-Gm-Message-State: ABy/qLbib/mMdvbX2hoyLTwyzzv7DszOsWJYB3MxkJYFZvZHeH2FyFeb
        ng8cxrmzEBjsx/kqhQvTXcTpUg==
X-Google-Smtp-Source: APBJJlEJ7qmgow2NSUc4iela6lVkpDGnn1Pno1NXC3MOU+/RUas42zLNbdlMacZTQUbN5aQW1ETqdg==
X-Received: by 2002:a19:ca5b:0:b0:4f9:5ca5:af23 with SMTP id h27-20020a19ca5b000000b004f95ca5af23mr4391916lfj.9.1688771578422;
        Fri, 07 Jul 2023 16:12:58 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id d1-20020ac25441000000b004fb7388360esm841643lfn.188.2023.07.07.16.12.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jul 2023 16:12:58 -0700 (PDT)
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
Subject: [PATCH v2 08/13] drm/msm/dpu: remove QoS teardown on plane destruction
Date:   Sat,  8 Jul 2023 02:12:46 +0300
Message-Id: <20230707231251.3849701-9-dmitry.baryshkov@linaro.org>
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

