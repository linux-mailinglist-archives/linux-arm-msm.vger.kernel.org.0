Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2FA224F5601
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Apr 2022 08:21:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343915AbiDFFja (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Apr 2022 01:39:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243101AbiDFCnE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Apr 2022 22:43:04 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E1E428CF61
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Apr 2022 16:45:56 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id h11so1084081ljb.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Apr 2022 16:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Aea1eCmRXc8SvtM+T5RIzo3X5fELyftyC6ru1eyNaJQ=;
        b=QNMeYGmbbeXLzOYPgSwVK5EPsBm0loeIlT/9PVLnAQSYIwBexuRGVtEtuqmfnl62ol
         U2iFKUauEhHdSPbFcevKHJVoP5d75BPcy1bgBlhguKYCU5TqlCdJykzy4Eg8qBfj+vrZ
         V+qlU5SZBBowD+Pzd9YjJn2vk1XVMXZRGRq4QwKYRXxGdMvnIF+LbUOJmXrdkxn90X+a
         //gUCMfRfZ8X8KUvWOd9x9MI/+VUEnlGqBwV2Vf27WjJ3TP78Bt2g77Rw4+C5EQhD/wn
         3GuadRjY3Jf2C+2HolvwFGp8MLuaGEmQh7y9gvQICUA9PsmRLfKT2sIjc3C1mc2U72Hn
         K3FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Aea1eCmRXc8SvtM+T5RIzo3X5fELyftyC6ru1eyNaJQ=;
        b=nB3IERLK0NgSgX5uj871+pTpDAV7h1rgvm+RK8fieSPkd7U+8m2EMSXi9VPF/sj2jz
         KNppl/5p1tXNBjzPpREm1cryQSt6/PkAWtsr8ljWA0CONhr7AM8k9uRyOn8F/q0NdRNh
         pHKjCN4Pu/r6HcrPpgf9jLtyb8UUppiriyAhBs0uYCRrV4ju6tg2eofcyK/Fxv2C0Eis
         lkbbbtMqixb4vpJwx/ym/bubkbJMUYGcofDhuWjf812jslJsAXb7InAUSs7gs35uh1eT
         hjn8FabzwFGaBNtsHz1/IFOtXddRntXknpJOgMBhXzhMNDsB78gYWUxo09Fapn+8cc4I
         bK1w==
X-Gm-Message-State: AOAM5326iIrCJVbG3GdoYKv9r3l/cdN2poh40yJhxgXouD0TNc57Gk3p
        ER8MPK/6UL2DWtkx41i5onjR2Q==
X-Google-Smtp-Source: ABdhPJzo4h+1cA8+ptBf6oSHmeKyXyUhblQE/hDzU3ZFeZOpPffVOlZamsan2q3hL+qQPtLNbg7+FQ==
X-Received: by 2002:a05:651c:154:b0:24b:152:266e with SMTP id c20-20020a05651c015400b0024b0152266emr3656017ljd.185.1649202354706;
        Tue, 05 Apr 2022 16:45:54 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id g11-20020ac24d8b000000b0044a3454c858sm1651897lfe.81.2022.04.05.16.45.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Apr 2022 16:45:54 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 3/4] drm/msm/dp: properly add and remove created bridges
Date:   Wed,  6 Apr 2022 02:45:50 +0300
Message-Id: <20220405234551.359453-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220405234551.359453-1-dmitry.baryshkov@linaro.org>
References: <20220405234551.359453-1-dmitry.baryshkov@linaro.org>
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

Add calls to drm_bridge_add()/drm_bridge_remove() for the internal DP
bridges.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_drm.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index 80f59cf99089..a7415f9eb80e 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -230,9 +230,13 @@ struct drm_bridge *msm_dp_bridge_init(struct msm_dp *dp_display, struct drm_devi
 	bridge->funcs = &dp_bridge_ops;
 	bridge->encoder = encoder;
 
+	drm_bridge_add(bridge);
+
 	rc = drm_bridge_attach(encoder, bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 	if (rc) {
 		DRM_ERROR("failed to attach bridge, rc=%d\n", rc);
+		drm_bridge_remove(bridge);
+
 		return ERR_PTR(rc);
 	}
 
@@ -242,6 +246,7 @@ struct drm_bridge *msm_dp_bridge_init(struct msm_dp *dp_display, struct drm_devi
 					DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 		if (rc < 0) {
 			DRM_ERROR("failed to attach panel bridge: %d\n", rc);
+			drm_bridge_detach(bridge);
 			drm_bridge_remove(bridge);
 			return ERR_PTR(rc);
 		}
-- 
2.35.1

