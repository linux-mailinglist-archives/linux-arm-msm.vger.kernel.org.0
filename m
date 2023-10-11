Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B2D037C5F4A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Oct 2023 23:47:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233527AbjJKVrO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Oct 2023 17:47:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233616AbjJKVrM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Oct 2023 17:47:12 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2007FC4
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Oct 2023 14:47:10 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-5041cc983f9so424861e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Oct 2023 14:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697060828; x=1697665628; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8NowKG+uxNaCu9ectHj5Raem53l31lC3gwF/MNNR9FI=;
        b=zUOrzK5gC77tx3uja2iTP2MNjKlYQJH1Er0R3tu/OI5rKbQof/vs3prTUoQ1PJwDr9
         rMtugrI3w0dvg54fdxsWj07FrVxDiuPUDTJPYCM03sYr0yIwOYtizFpiaF13ob77dSXZ
         rgyNQi0DwnihZjFnT5JTWuTlsVhEC1qrMMWlXUopasQYAdBnr1ezVnzc1uBCFo2Fc1Qb
         DHrwUakaD+EGmZF/sunKd2KuDxFKXkVmQxqDwiDnIssn5AJvXNB97sQNlgTufMooHbuB
         sJUlqOfb+AJ2DHkvvAGeK8mOii8M1f5gA8RKiexOHBuqeQxoJkzsbsaTnUfO7NfNoH4K
         KPhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697060828; x=1697665628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8NowKG+uxNaCu9ectHj5Raem53l31lC3gwF/MNNR9FI=;
        b=uqhpcXnscDKukwh5n1/lMM3q75YJm89pdkHaPytI29lWT8wp2EyEHEfvTOlecbyjPW
         MdR2ov6UbuyKGFt3v7z72JSoxbBvKJ/UKbVGp6cMzx3Fp50B05sNEAOKl+L/iT3mxyzU
         FVT6mk3q3cTGCket2lHrh/tEiVPDAa2v6EHKGoVcOH/WV+lLu+if6YHD9krxSBqvWfIz
         4sPZjDhHmC3LOVZPYznml/RVYGVv3r6LSJuxsENnvhyOcGBPOrfrzrs1rP5BA/84ELV5
         oqa1XYLANAlIPRXjLKqlDJO11h8ULTlY8MG/UWUq+Ru1RQqRaACTLIa0+owJegEPg2aO
         kMEw==
X-Gm-Message-State: AOJu0YyuQQNQCrrbfTM1UvpvgDBhuyR2Cqfymo7C4TDr8wvZIjNHMETn
        EAszqEZ/Io/ofiFKkM2d4xQADg==
X-Google-Smtp-Source: AGHT+IEP+I6YA9pAFP7bcd4lqSHrBa9fvXnpEuDyIcwcYbYyLPFB6oI7N62F8hACTs5u5PBR627VZQ==
X-Received: by 2002:a05:6512:b23:b0:503:1913:ed8e with SMTP id w35-20020a0565120b2300b005031913ed8emr18628281lfu.61.1697060828355;
        Wed, 11 Oct 2023 14:47:08 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id o15-20020a056512050f00b004fbab80ecefsm2452485lfb.145.2023.10.11.14.47.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 14:47:08 -0700 (PDT)
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
Subject: [PATCH 3/3] drm/msm/dp: use correct lifetime device for devm_drm_bridge_add
Date:   Thu, 12 Oct 2023 00:47:05 +0300
Message-Id: <20231011214705.375738-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231011214705.375738-1-dmitry.baryshkov@linaro.org>
References: <20231011214705.375738-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The lifetime of the created drm_bridge is attached to the drm_device
rather than the DP's platform_device. Use correct lifetime for
devm_drm_bridge_add() call.

Fixes: 61a72d5efce5 ("drm/msm/dp: switch to devm_drm_bridge_add()")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_drm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index 284ff7df058a..40e7344180e3 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -307,7 +307,7 @@ int dp_bridge_init(struct msm_dp *dp_display, struct drm_device *dev,
 			DRM_BRIDGE_OP_MODES;
 	}
 
-	rc = devm_drm_bridge_add(&dp_display->pdev->dev, bridge);
+	rc = devm_drm_bridge_add(dev->dev, bridge);
 	if (rc) {
 		DRM_ERROR("failed to add bridge, rc=%d\n", rc);
 
-- 
2.39.2

